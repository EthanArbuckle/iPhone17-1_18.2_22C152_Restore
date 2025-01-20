void ASLoggingInitialize()
{
  if (ASLoggingInitialize_onceToken != -1) {
    dispatch_once(&ASLoggingInitialize_onceToken, &__block_literal_global_13);
  }
}

id ActivitySharingBundle()
{
  if (ActivitySharingBundle_onceToken != -1) {
    dispatch_once(&ActivitySharingBundle_onceToken, &__block_literal_global_14);
  }
  v0 = (void *)ActivitySharingBundle_bundle;

  return v0;
}

id ASFriendsFromCodableFriendList(void *a1)
{
  v1 = [a1 friends];
  v2 = objc_msgSend(v1, "hk_mapToSet:", &__block_literal_global_320);

  return v2;
}

uint64_t ASActivitySharingDaemonEnabled()
{
  v0 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.ActivitySharing"];
  uint64_t v1 = objc_msgSend(v0, "hk_BOOLForKey:defaultValue:", @"ActivitySharingDaemonEnabled", 1);

  return v1;
}

uint64_t __ActivitySharingBundle_block_invoke()
{
  ActivitySharingBundle_bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

uint64_t ASSecureCloudEnabled()
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.ActivitySharing"];
  uint64_t v2 = objc_msgSend(v1, "hk_BOOLForKey:defaultValue:", @"SecureCloudEnabled", 0);

  return v2;
}

ASCodableFriendList *ASCodableFriendListFromFriends(void *a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a1;
  v4 = objc_alloc_init(ASCodableFriendList);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "codableFriendIncludingCloudKitFields:", a2, (void)v12);
        [(ASCodableFriendList *)v4 addFriend:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

uint64_t __ASLoggingInitialize_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)ASLoggingSubsystem, "achievements");
  uint64_t v1 = (void *)ASLogAchievements;
  ASLogAchievements = (uint64_t)v0;

  os_log_t v2 = os_log_create((const char *)ASLoggingSubsystem, "activity_data");
  id v3 = (void *)ASLogActivityData;
  ASLogActivityData = (uint64_t)v2;

  os_log_t v4 = os_log_create((const char *)ASLoggingSubsystem, "cloudkit");
  id v5 = (void *)ASLogCloudKit;
  ASLogCloudKit = (uint64_t)v4;

  os_log_t v6 = os_log_create((const char *)ASLoggingSubsystem, "competitions");
  uint64_t v7 = (void *)ASLogCompetitions;
  ASLogCompetitions = (uint64_t)v6;

  os_log_t v8 = os_log_create((const char *)ASLoggingSubsystem, "database");
  v9 = (void *)ASLogDatabase;
  ASLogDatabase = (uint64_t)v8;

  os_log_t v10 = os_log_create((const char *)ASLoggingSubsystem, "default");
  v11 = (void *)ASLogDefault;
  ASLogDefault = (uint64_t)v10;

  os_log_t v12 = os_log_create((const char *)ASLoggingSubsystem, "friend_list");
  long long v13 = (void *)ASLogFriendList;
  ASLogFriendList = (uint64_t)v12;

  os_log_t v14 = os_log_create((const char *)ASLoggingSubsystem, "notifications");
  long long v15 = (void *)ASLogNotifications;
  ASLogNotifications = (uint64_t)v14;

  os_log_t v16 = os_log_create((const char *)ASLoggingSubsystem, "periodic_updates");
  uint64_t v17 = (void *)ASLogPeriodicUpdates;
  ASLogPeriodicUpdates = (uint64_t)v16;

  ASLogRelationships = (uint64_t)os_log_create((const char *)ASLoggingSubsystem, "relationships");

  return MEMORY[0x270F9A758]();
}

uint64_t ASCodableFriendListReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  os_log_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(ASCodableFriend);
        [a1 addFriend:v17];
        if (!PBReaderPlaceMark() || !ASCodableFriendReadFrom((id *)&v17->super.super.isa, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ASCodableActivityDataPreviewReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  os_log_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        v18 = objc_alloc_init(ASCodableCloudKitActivitySnapshot);
        objc_storeStrong((id *)(a1 + 24), v18);
        if PBReaderPlaceMark() && (ASCodableCloudKitActivitySnapshotReadFrom((uint64_t)v18, a2)) {
          goto LABEL_29;
        }
        goto LABEL_37;
      case 2u:
        v18 = objc_alloc_init(ASCodableCloudKitWorkout);
        [(id)a1 addWorkouts:v18];
        if (!PBReaderPlaceMark() || (ASCodableCloudKitWorkoutReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_37;
        }
        goto LABEL_29;
      case 3u:
        v18 = objc_alloc_init(ASCodableCloudKitAchievement);
        [(id)a1 addAchievements:v18];
        if PBReaderPlaceMark() && (ASCodableCloudKitAchievementReadFrom((uint64_t)v18, a2))
        {
LABEL_29:
          PBReaderRecallMark();

LABEL_35:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_37:

        return 0;
      case 4u:
        *(unsigned char *)(a1 + 40) |= 1u;
        uint64_t v20 = *v3;
        unint64_t v21 = *(void *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v22 = 0;
        }
        *(void *)(a1 + 8) = v22;
        goto LABEL_35;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_35;
    }
  }
}

id _ASCreateRecordsFromCloudKitCodablesAndRecordZoneID(void *a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    unint64_t v10 = (void *)MEMORY[0x263EFFA68];
    do
    {
      uint64_t v11 = 0;
      uint64_t v12 = v10;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        unint64_t v13 = [*(id *)(*((void *)&v15 + 1) + 8 * v11) recordWithZoneID:v6 recordEncryptionType:a3];
        unint64_t v10 = [v12 arrayByAddingObject:v13];

        ++v11;
        uint64_t v12 = v10;
      }
      while (v8 != v11);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v10 = (void *)MEMORY[0x263EFFA68];
  }

  return v10;
}

id _ASCreateActivityDataRootRecordWithID(void *a1)
{
  uint64_t v1 = (objc_class *)MEMORY[0x263EFD7C8];
  id v2 = a1;
  id v3 = (void *)[[v1 alloc] initWithRecordType:@"ActivitySharingActivityDataRootRecord" recordID:v2];

  [v3 setObject:&unk_26D051098 forKeyedSubscript:@"Version"];

  return v3;
}

uint64_t _ASCloudKitSchemaVersionForRecord(void *a1)
{
  id v1 = a1;
  id v2 = [v1 encryptedValues];
  id v3 = [v2 objectForKeyedSubscript:@"EncryptedVersion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (v4)
  {
    uint64_t v5 = [v4 integerValue];
  }
  else
  {
    id v6 = [v1 objectForKeyedSubscript:@"Version"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    uint64_t v5 = [v7 integerValue];
  }

  return v5;
}

ASCodableCloudKitSample *_ASCodableCloudKitSampleForSample(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(ASCodableCloudKitSample);
  id v3 = [v1 UUID];
  id v4 = objc_msgSend(v3, "hk_dataForUUIDBytes");
  [(ASCodableCloudKitSample *)v2 setUuid:v4];

  uint64_t v5 = [v1 startDate];
  [v5 timeIntervalSinceReferenceDate];
  -[ASCodableCloudKitSample setStartDate:](v2, "setStartDate:");

  id v6 = [v1 endDate];

  [v6 timeIntervalSinceReferenceDate];
  -[ASCodableCloudKitSample setEndDate:](v2, "setEndDate:");

  return v2;
}

void _ASUpdateSchemaVersionOnRecord(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = NSNumber;
  id v6 = a2;
  id v8 = [v5 numberWithInteger:a1];
  if (a3 == 1)
  {
    id v7 = [v6 encryptedValues];

    [v7 setObject:v8 forKeyedSubscript:@"EncryptedVersion"];
    id v6 = v7;
  }
  else
  {
    [v6 setObject:v8 forKeyedSubscript:@"Version"];
  }
}

id ASCodableAchievementsFromAchievements(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [MEMORY[0x263EFFA08] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      id v8 = v2;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "codableAchievement", (void)v11);
        id v2 = [v8 setByAddingObject:v9];

        ++v7;
        id v8 = v2;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v2;
}

id ASAchievementsFromCodableAchievements(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [MEMORY[0x263EFFA08] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(MEMORY[0x263F0A9C8], "fitnessFriendAchievementWithCodableAchievement:friendUUID:", *(void *)(*((void *)&v14 + 1) + 8 * i), v4, (void)v14);
        if (v11)
        {
          uint64_t v12 = [v5 setByAddingObject:v11];

          uint64_t v5 = (void *)v12;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

id ASWorkoutRecordIDForUUID(void *a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263EFD7E8];
  id v4 = a2;
  id v5 = a1;
  id v6 = [v3 alloc];
  uint64_t v7 = [NSString stringWithFormat:@"%@-%@", @"ActivitySharingWorkout", v5];

  uint64_t v8 = (void *)[v6 initWithRecordName:v7 zoneID:v4];

  return v8;
}

id ASCodableWorkoutsFromWorkouts(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [MEMORY[0x263EFFA08] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      uint64_t v8 = v2;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "codableWorkout", (void)v11);
        id v2 = [v8 setByAddingObject:v9];

        ++v7;
        uint64_t v8 = v2;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v2;
}

id ASWorkoutsFromCodableWorkouts(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [MEMORY[0x263EFFA08] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      long long v11 = v5;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v12 = objc_msgSend(MEMORY[0x263F0A9D8], "fitnessFriendWorkoutWithCodableWorkout:friendUUID:", *(void *)(*((void *)&v14 + 1) + 8 * v10), v4, (void)v14);
        uint64_t v5 = [v11 setByAddingObject:v12];

        ++v10;
        long long v11 = v5;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

id ASWorkoutNotificationRecordIDForType(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = NSString;
  id v6 = a3;
  uint64_t v7 = [v5 stringWithFormat:@"%@-%ld-%@", @"ActivitySharingEvent", a1, a2];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:v7 zoneID:v6];

  return v8;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return v0;
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_12(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

__CFString *ASStringForReachabilityStatus(uint64_t a1)
{
  id v1 = @"unknown";
  if (a1 == 1) {
    id v1 = @"reachable";
  }
  if (a1 == 2) {
    return @"unreachable";
  }
  else {
    return v1;
  }
}

id ASSecureUnarchiveClassWithData(objc_class *a1, void *a2)
{
  return ASSecureUnarchiveClassWithDataAndStrictness(a1, a2, 0);
}

id ASSecureUnarchiveClassWithDataAndStrictness(objc_class *a1, void *a2, int a3)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (![v5 length])
  {
    uint64_t v10 = 0;
    goto LABEL_10;
  }
  id v6 = (void *)MEMORY[0x263F08928];
  if (a3)
  {
    uint64_t v7 = (void *)MEMORY[0x263EFFA08];
    v16[0] = a1;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    uint64_t v9 = [v7 setWithArray:v8];
    id v15 = 0;
    uint64_t v10 = [v6 _strictlyUnarchivedObjectOfClasses:v9 fromData:v5 error:&v15];
    id v11 = v15;

    if (!v11) {
      goto LABEL_9;
    }
LABEL_7:
    ASLoggingInitialize();
    long long v12 = (void *)ASLogDefault;
    if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_ERROR)) {
      ASSecureUnarchiveClassWithDataAndStrictness_cold_1(v12, a1, (uint64_t)v11);
    }
    goto LABEL_9;
  }
  id v14 = 0;
  uint64_t v10 = [MEMORY[0x263F08928] unarchivedObjectOfClass:a1 fromData:v5 error:&v14];
  id v11 = v14;
  if (v11) {
    goto LABEL_7;
  }
LABEL_9:

LABEL_10:

  return v10;
}

id ASSecureUnarchiveClassesWithData(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  if ([v6 length])
  {
    uint64_t v7 = (void *)MEMORY[0x263F08928];
    uint64_t v8 = [MEMORY[0x263EFFA08] setWithArray:v5];
    if (a3)
    {
      uint64_t v15 = 0;
      uint64_t v9 = (id *)&v15;
      uint64_t v10 = [v7 _strictlyUnarchivedObjectOfClasses:v8 fromData:v6 error:&v15];
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v9 = (id *)&v14;
      uint64_t v10 = [v7 unarchivedObjectOfClasses:v8 fromData:v6 error:&v14];
    }
    id v11 = (void *)v10;
    id v12 = *v9;

    if (v12)
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_ERROR)) {
        ASSecureUnarchiveClassesWithData_cold_1();
      }
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

ASFriend *__ASFriendsFromCodableFriendList_block_invoke(uint64_t a1, uint64_t a2)
{
  return +[ASFriend friendWithCodableFriend:a2];
}

ASCodableContactList *ASCodableContactListFromContacts(void *a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = objc_alloc_init(ASCodableContactList);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "codableContactIncludingCloudKitFields:", a2, (void)v12);
        [(ASCodableContactList *)v4 addContacts:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

id ASContactsFromCodableContactList(void *a1)
{
  id v1 = [a1 contacts];
  id v2 = objc_msgSend(v1, "hk_mapToSet:", &__block_literal_global_324);

  return v2;
}

ASContact *__ASContactsFromCodableContactList_block_invoke(uint64_t a1, uint64_t a2)
{
  return +[ASContact contactWithCodableContact:a2];
}

uint64_t ASCodableCloudKitCompetitionReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
  unint64_t v8 = 0x267EA3000uLL;
  unint64_t v9 = 0x267EA3000uLL;
  unint64_t v10 = 0x267EA3000uLL;
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v11 = 0;
    unsigned int v12 = 0;
    unint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = *v3;
      unint64_t v15 = *(void *)(a2 + v14);
      if (v15 == -1 || v15 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v16 = *(unsigned char *)(*(void *)(a2 + *v7) + v15);
      *(void *)(a2 + v14) = v15 + 1;
      v13 |= (unint64_t)(v16 & 0x7F) << v11;
      if ((v16 & 0x80) == 0) {
        goto LABEL_12;
      }
      v11 += 7;
      BOOL v17 = v12++ >= 9;
      if (v17)
      {
        unint64_t v13 = 0;
        int v18 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v18 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v13 = 0;
    }
LABEL_14:
    int v19 = v13 & 7;
    if (v18 || v19 == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v13 >> 3))
    {
      case 1u:
        uint64_t v21 = PBReaderReadData();
        uint64_t v22 = *(void **)(a1 + 112);
        *(void *)(a1 + 112) = v21;

        goto LABEL_115;
      case 2u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 120) |= 1u;
        while (2)
        {
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
            *(void *)(a2 + v26) = v27 + 1;
            v25 |= (unint64_t)(v28 & 0x7F) << v23;
            if (v28 < 0)
            {
              v23 += 7;
              BOOL v17 = v24++ >= 9;
              if (v17)
              {
                uint64_t v25 = 0;
                goto LABEL_84;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v25 = 0;
        }
LABEL_84:
        uint64_t v58 = 80;
        goto LABEL_89;
      case 3u:
        if (v19 != 2)
        {
          char v59 = 0;
          unsigned int v60 = 0;
          uint64_t v61 = 0;
          while (1)
          {
            uint64_t v62 = *v3;
            unint64_t v63 = *(void *)(a2 + v62);
            if (v63 == -1 || v63 >= *(void *)(a2 + *v4)) {
              goto LABEL_104;
            }
            char v64 = *(unsigned char *)(*(void *)(a2 + *v7) + v63);
            *(void *)(a2 + v62) = v63 + 1;
            v61 |= (unint64_t)(v64 & 0x7F) << v59;
            if (v64 < 0)
            {
              v59 += 7;
              BOOL v17 = v60++ >= 9;
              if (!v17) {
                continue;
              }
            }
            goto LABEL_105;
          }
        }
        uint64_t result = PBReaderPlaceMark();
        if (!result) {
          return result;
        }
        while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
        {
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          while (1)
          {
            uint64_t v33 = *v3;
            unint64_t v34 = *(void *)(a2 + v33);
            if (v34 == -1 || v34 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
            *(void *)(a2 + v33) = v34 + 1;
            v32 |= (unint64_t)(v35 & 0x7F) << v30;
            if (v35 < 0)
            {
              v30 += 7;
              BOOL v17 = v31++ >= 9;
              if (!v17) {
                continue;
              }
            }
            goto LABEL_41;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
          PBRepeatedInt64Add();
        }
        goto LABEL_73;
      case 4u:
        if (v19 != 2)
        {
          char v65 = 0;
          unsigned int v66 = 0;
          uint64_t v67 = 0;
          while (1)
          {
            uint64_t v68 = *v3;
            unint64_t v69 = *(void *)(a2 + v68);
            if (v69 == -1 || v69 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v70 = *(unsigned char *)(*(void *)(a2 + *v7) + v69);
            *(void *)(a2 + v68) = v69 + 1;
            v67 |= (unint64_t)(v70 & 0x7F) << v65;
            if (v70 < 0)
            {
              v65 += 7;
              BOOL v17 = v66++ >= 9;
              if (!v17) {
                continue;
              }
            }
            goto LABEL_105;
          }
LABEL_104:
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_105:
          PBRepeatedInt64Add();
          goto LABEL_115;
        }
        uint64_t result = PBReaderPlaceMark();
        if (!result) {
          return result;
        }
        while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
        {
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v38 = 0;
          while (1)
          {
            uint64_t v39 = *v3;
            unint64_t v40 = *(void *)(a2 + v39);
            if (v40 == -1 || v40 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
            *(void *)(a2 + v39) = v40 + 1;
            v38 |= (unint64_t)(v41 & 0x7F) << v36;
            if (v41 < 0)
            {
              v36 += 7;
              BOOL v17 = v37++ >= 9;
              if (!v17) {
                continue;
              }
            }
            goto LABEL_54;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_54:
          PBRepeatedInt64Add();
        }
        goto LABEL_73;
      case 5u:
        unint64_t v42 = v10;
        unint64_t v43 = v9;
        unint64_t v44 = v8;
        v45 = objc_alloc_init(ASCodableCloudKitDateComponents);
        uint64_t v46 = 104;
        goto LABEL_57;
      case 6u:
        unint64_t v42 = v10;
        unint64_t v43 = v9;
        unint64_t v44 = v8;
        v45 = objc_alloc_init(ASCodableCloudKitDateComponents);
        uint64_t v46 = 96;
LABEL_57:
        objc_storeStrong((id *)(a1 + v46), v45);
        if (PBReaderPlaceMark() && ASCodableCloudKitDateComponentsReadFrom((uint64_t)v45, a2))
        {
          PBReaderRecallMark();

          unint64_t v8 = v44;
          unint64_t v9 = v43;
          unint64_t v10 = v42;
LABEL_115:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 7u:
        if (v19 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
          {
            char v47 = 0;
            unsigned int v48 = 0;
            uint64_t v49 = 0;
            while (1)
            {
              uint64_t v50 = *v3;
              unint64_t v51 = *(void *)(a2 + v50);
              if (v51 == -1 || v51 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v52 = *(unsigned char *)(*(void *)(a2 + *v7) + v51);
              *(void *)(a2 + v50) = v51 + 1;
              v49 |= (unint64_t)(v52 & 0x7F) << v47;
              if (v52 < 0)
              {
                v47 += 7;
                BOOL v17 = v48++ >= 9;
                if (!v17) {
                  continue;
                }
              }
              goto LABEL_72;
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_72:
            PBRepeatedInt32Add();
          }
LABEL_73:
          PBReaderRecallMark();
        }
        else
        {
          char v71 = 0;
          unsigned int v72 = 0;
          uint64_t v73 = 0;
          while (1)
          {
            uint64_t v74 = *v3;
            unint64_t v75 = *(void *)(a2 + v74);
            if (v75 == -1 || v75 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v76 = *(unsigned char *)(*(void *)(a2 + *v7) + v75);
            *(void *)(a2 + v74) = v75 + 1;
            v73 |= (unint64_t)(v76 & 0x7F) << v71;
            if (v76 < 0)
            {
              v71 += 7;
              BOOL v17 = v72++ >= 9;
              if (!v17) {
                continue;
              }
            }
            goto LABEL_114;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_114:
          PBRepeatedInt32Add();
        }
        goto LABEL_115;
      case 8u:
        char v53 = 0;
        unsigned int v54 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 120) |= 2u;
        while (2)
        {
          uint64_t v55 = *v3;
          unint64_t v56 = *(void *)(a2 + v55);
          if (v56 == -1 || v56 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v57 = *(unsigned char *)(*(void *)(a2 + *v7) + v56);
            *(void *)(a2 + v55) = v56 + 1;
            v25 |= (unint64_t)(v57 & 0x7F) << v53;
            if (v57 < 0)
            {
              v53 += 7;
              BOOL v17 = v54++ >= 9;
              if (v17)
              {
                uint64_t v25 = 0;
                goto LABEL_88;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v25 = 0;
        }
LABEL_88:
        uint64_t v58 = 88;
LABEL_89:
        *(void *)(a1 + v58) = v25;
        goto LABEL_115;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_115;
    }
  }
}

__CFString *NSStringFromASRelationshipEventType(int a1)
{
  if (a1 <= 199)
  {
    int v2 = a1 - 1;
    uint64_t result = @"SentInviteRequest";
    switch(v2)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = @"SentInviteResponse";
        break;
      case 2:
        uint64_t result = @"WithdrewInviteRequest";
        break;
      case 3:
        uint64_t result = @"EndedFriendship";
        break;
      case 4:
        uint64_t result = @"BeganHidingActivityData";
        break;
      case 5:
        uint64_t result = @"StoppedHidingActivityData";
        break;
      case 6:
        uint64_t result = @"IgnoredInviteRequest";
        break;
      case 7:
        uint64_t result = @"BeganMutingNotifications";
        break;
      case 8:
        uint64_t result = @"StoppedMutingNotifications";
        break;
      case 9:
        uint64_t result = @"SentCompetitionRequest";
        break;
      case 10:
        uint64_t result = @"AcceptedCompetitionRequest";
        break;
      case 11:
        uint64_t result = @"IgnoredCompetitionRequest";
        break;
      case 12:
        uint64_t result = @"SavedFinalCompetitionScore";
        break;
      case 13:
        uint64_t result = @"CompletedCompetition";
        break;
      case 14:
        uint64_t result = @"UpdatedSupportedFeatures";
        break;
      default:
        switch(@"SentInviteRequest")
        {
          case 'd':
            uint64_t result = @"ReceivedInviteRequest";
            break;
          case 'e':
            uint64_t result = @"ReceivedInviteResponse";
            break;
          case 'f':
            uint64_t result = @"InviteRequestWasWithdrawnRemotely";
            break;
          case 'g':
            uint64_t result = @"FriendshipDidBegin";
            break;
          case 'h':
            uint64_t result = @"FriendshipWasEndedRemotely";
            break;
          case 'i':
            uint64_t result = @"ReceivedCompetitionRequest";
            break;
          case 'j':
            uint64_t result = @"CompetitionRequestWasAcceptedRemotely";
            break;
          default:
LABEL_47:
            uint64_t result = @"UnknownEventType";
            break;
        }
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 200:
        uint64_t result = @"SentSecureCloudInviteRequest";
        break;
      case 201:
        uint64_t result = @"SecureCloudUpgradeAvailable";
        break;
      case 202:
        uint64_t result = @"SecureCloudUpgradeUnavailable";
        break;
      case 203:
        uint64_t result = @"SentSecureCloudUpgradeRequest";
        break;
      case 204:
        uint64_t result = @"SecureCloudUpgradeFailed";
        break;
      case 205:
        uint64_t result = @"SecureCloudMigrationAvailable";
        break;
      case 206:
        uint64_t result = @"SecureCloudMigrationStarted";
        break;
      case 207:
        uint64_t result = @"SecureCloudMigrationFailed";
        break;
      case 208:
        uint64_t result = @"SecureCloudDowngradeRequested";
        break;
      case 209:
        uint64_t result = @"SecureCloudDowngradeStarted";
        break;
      case 210:
        uint64_t result = @"SecureCloudDowngradeFailed";
        break;
      case 211:
        uint64_t result = @"SecureCloudDowngradeNeedsAcknowledgement";
        break;
      case 212:
        uint64_t result = @"SecureCloudDowngradeAcknowledged";
        break;
      case 213:
        uint64_t result = @"SecureCloudDowngradeRequestRescinded";
        break;
      case 214:
        uint64_t result = @"SecureCloudNeedsZoneDeletion";
        break;
      case 215:
        uint64_t result = @"SecureCloudNeedsRepair";
        break;
      case 216:
        uint64_t result = @"SentSecureCloudRepairRequest";
        break;
      case 217:
        uint64_t result = @"SecureCloudRepairFailed";
        break;
      case 218:
        uint64_t result = @"SecureCloudRepairComplete";
        break;
      default:
        switch(a1)
        {
          case 300:
            uint64_t result = @"ReceivedSecureCloudInviteRequest";
            break;
          case 301:
            uint64_t result = @"ReceivedSecureCloudUpgradeRequest";
            break;
          case 302:
            uint64_t result = @"SecureCloudUpgradeFailedRemotely";
            break;
          case 303:
            uint64_t result = @"SecureCloudUpgradeCompleted";
            break;
          case 304:
            uint64_t result = @"SecureCloudMigrationCompleted";
            break;
          case 305:
            uint64_t result = @"SecureCloudDowngradeCompleted";
            break;
          case 306:
            uint64_t result = @"ReceivedSecureCloudRepairRequest";
            break;
          default:
            goto LABEL_47;
        }
        break;
    }
  }
  return result;
}

BOOL ASCodableContactReadFrom(id *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 3;
        goto LABEL_33;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 2;
        goto LABEL_33;
      case 3u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 9;
        goto LABEL_33;
      case 4u:
        PBReaderReadString();
        int v19 = (ASCodableRelationshipContainer *)objc_claimAutoreleasedReturnValue();
        if (v19) {
          [a1 addDestinations:v19];
        }
        goto LABEL_37;
      case 5u:
        int v19 = objc_alloc_init(ASCodableRelationshipContainer);
        uint64_t v20 = 6;
        goto LABEL_28;
      case 6u:
        int v19 = objc_alloc_init(ASCodableRelationshipContainer);
        uint64_t v20 = 8;
LABEL_28:
        objc_storeStrong(&a1[v20], v19);
        if (!PBReaderPlaceMark() || (ASCodableRelationshipContainerReadFrom((uint64_t)v19, a2) & 1) == 0) {
          goto LABEL_41;
        }
        goto LABEL_36;
      case 7u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 5;
        goto LABEL_33;
      case 8u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 4;
LABEL_33:
        int v19 = (ASCodableRelationshipContainer *)a1[v18];
        a1[v18] = (id)v17;
        goto LABEL_37;
      case 9u:
        int v19 = objc_alloc_init(ASCodableRelationshipStorage);
        objc_storeStrong(a1 + 7, v19);
        if (PBReaderPlaceMark() && ASCodableRelationshipStorageReadFrom((uint64_t)v19, a2))
        {
LABEL_36:
          PBReaderRecallMark();
LABEL_37:

LABEL_38:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_41:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_38;
    }
  }
}

id _ASCelebrationAssetURLWithFileName(void *a1)
{
  id v1 = a1;
  int v2 = [@"/System/Library/Health/Assets/ActivitySharingAssets.bundle" stringByAppendingPathComponent:@"CelebrationMovies"];
  id v3 = [v2 stringByAppendingPathComponent:v1];

  id v4 = [NSURL fileURLWithPath:v3];

  return v4;
}

id ASCompetitionVictoryCelebrationAssetURL()
{
  return _ASCelebrationAssetURLWithFileName(@"CompetitionVictory.mov");
}

id ASCompetitionScoreCapCelebrationAssetURL()
{
  return _ASCelebrationAssetURLWithFileName(@"ScoreCapCelebration.mov");
}

BOOL ASCodableRelationshipStorageReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = objc_alloc_init(ASCodableRelationshipContainer);
        uint64_t v18 = 8;
        goto LABEL_25;
      case 2u:
        uint64_t v17 = objc_alloc_init(ASCodableRelationshipContainer);
        uint64_t v18 = 16;
        goto LABEL_25;
      case 3u:
        uint64_t v17 = objc_alloc_init(ASCodableRelationshipContainer);
        uint64_t v18 = 24;
        goto LABEL_25;
      case 4u:
        uint64_t v17 = objc_alloc_init(ASCodableRelationshipContainer);
        uint64_t v18 = 32;
LABEL_25:
        objc_storeStrong((id *)(a1 + v18), v17);
        if PBReaderPlaceMark() && (ASCodableRelationshipContainerReadFrom((uint64_t)v17, a2))
        {
          PBReaderRecallMark();

LABEL_28:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_28;
    }
  }
}

BOOL ASCodableFriendReadFrom(id *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = objc_alloc_init(ASCodableContact);
        objc_storeStrong(a1 + 3, v17);
        if (PBReaderPlaceMark() && ASCodableContactReadFrom((id *)&v17->super.super.isa, a2)) {
          goto LABEL_35;
        }
        goto LABEL_39;
      case 2u:
        uint64_t v17 = objc_alloc_init(ASCodableCloudKitActivitySnapshot);
        [a1 addSnapshots:v17];
        if (!PBReaderPlaceMark()
          || (ASCodableCloudKitActivitySnapshotReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_39;
        }
        goto LABEL_35;
      case 3u:
        uint64_t v17 = objc_alloc_init(ASCodableCloudKitWorkout);
        [a1 addWorkouts:v17];
        if (!PBReaderPlaceMark() || (ASCodableCloudKitWorkoutReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_39;
        }
        goto LABEL_35;
      case 4u:
        uint64_t v17 = objc_alloc_init(ASCodableCloudKitAchievement);
        [a1 addAchievements:v17];
        if (!PBReaderPlaceMark() || (ASCodableCloudKitAchievementReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_39;
        }
        goto LABEL_35;
      case 5u:
        uint64_t v17 = objc_alloc_init(ASCodableCloudKitCompetition);
        [a1 addCompetitions:v17];
        if PBReaderPlaceMark() && (ASCodableCloudKitCompetitionReadFrom((uint64_t)v17, a2))
        {
LABEL_35:
          PBReaderRecallMark();

LABEL_36:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_39:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_36;
    }
  }
}

id _MostRecentEventsWithCount(void *a1, unint64_t a2)
{
  id v3 = [a1 sortedArrayUsingComparator:&__block_literal_global_2];
  unint64_t v4 = [v3 count];
  if (v4 < a2) {
    a2 = v4;
  }
  id v5 = objc_msgSend(v3, "subarrayWithRange:", objc_msgSend(v3, "count") - a2, a2);

  return v5;
}

id _ConsolidatedEvents(void *a1)
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v38 = a1;
  id obj = [v38 reverseObjectEnumerator];
  uint64_t v41 = [obj countByEnumeratingWithState:&v89 objects:v93 count:16];
  if (v41)
  {
    uint64_t v56 = 0;
    uint64_t v57 = 0;
    uint64_t v55 = 0;
    uint64_t v58 = 0;
    uint64_t v59 = 0;
    uint64_t v60 = 0;
    uint64_t v61 = 0;
    int v62 = 0;
    uint64_t v64 = 0;
    uint64_t v65 = 0;
    uint64_t v66 = 0;
    int v72 = 0;
    uint64_t v86 = 0;
    v87 = 0;
    int v54 = 0;
    uint64_t v40 = *(void *)v90;
    uint64_t v73 = (void *)MEMORY[0x263EFFA68];
    do
    {
      uint64_t v1 = 0;
      do
      {
        if (*(void *)v90 != v40)
        {
          uint64_t v2 = v1;
          objc_enumerationMutation(obj);
          uint64_t v1 = v2;
        }
        uint64_t v71 = v1;
        id v3 = *(void **)(*((void *)&v89 + 1) + 8 * v1);
        BOOL v4 = [v3 type] == 4 || objc_msgSend(v3, "type") == 104;
        BOOL v70 = v4;
        BOOL v5 = [v3 type] == 8 || objc_msgSend(v3, "type") == 9;
        BOOL v69 = v5;
        int v84 = [v3 type];
        BOOL v6 = [v3 type] == 10
          || [v3 type] == 105
          || [v3 type] == 12
          || [v3 type] == 11
          || [v3 type] == 106
          || [v3 type] == 14
          || [v3 type] == 13;
        BOOL v83 = v6;
        int v50 = [v3 type];
        if (v87)
        {
          int v7 = [v3 type];
          BOOL v49 = v7 == [v87 type];
        }
        else
        {
          BOOL v49 = 0;
        }
        BOOL v8 = [v3 type] == 201 || objc_msgSend(v3, "type") == 202;
        BOOL v68 = v8;
        int v82 = [v3 type];
        int v81 = [v3 type];
        BOOL v9 = [v3 type] == 204
          || [v3 type] == 302
          || [v3 type] == 303;
        BOOL v51 = v9;
        BOOL v10 = [v3 type] == 204 || objc_msgSend(v3, "type") == 302;
        BOOL v47 = v10;
        int v48 = [v3 type];
        int v80 = [v3 type];
        int v79 = [v3 type];
        BOOL v11 = [v3 type] == 304 || objc_msgSend(v3, "type") == 207;
        BOOL v53 = v11;
        int v46 = [v3 type];
        int v45 = [v3 type];
        int v78 = [v3 type];
        int v77 = [v3 type];
        int v76 = [v3 type];
        int v75 = [v3 type];
        BOOL v12 = [v3 type] == 209
           || [v3 type] == 305
           || [v3 type] == 210;
        BOOL v63 = v12;
        int v44 = [v3 type];
        int v43 = [v3 type];
        int v74 = [v3 type];
        int v13 = [v3 type];
        int v14 = [v3 type];
        int v15 = [v3 type];
        BOOL v16 = [v3 type] == 217 || objc_msgSend(v3, "type") == 218;
        BOOL v67 = v16;
        int v42 = [v3 type];
        int v17 = [v3 type];
        if (BYTE4(v86) & 1 | !v83)
        {
          int v18 = 1;
        }
        else
        {
          int v19 = [v3 type];
          id v20 = v73;
          long long buf = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          long long v103 = 0u;
          id v21 = v20;
          uint64_t v22 = [v21 countByEnumeratingWithState:&buf objects:&v94 count:16];
          if (v22)
          {
            uint64_t v23 = *(void *)v101;
            while (2)
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v101 != v23) {
                  objc_enumerationMutation(v21);
                }
                if ([*(id *)(*((void *)&buf + 1) + 8 * i) type] == v19)
                {
                  int v18 = 1;
                  goto LABEL_54;
                }
              }
              uint64_t v22 = [v21 countByEnumeratingWithState:&buf objects:&v94 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }
          int v18 = 0;
LABEL_54:
        }
        if ((v67 & v72 & 1) == 0
          && (v67 & HIDWORD(v66) & 1) == 0
          && ((v15 == 306) & v66) == 0
          && ((v14 == 216) & BYTE4(v65)) == 0
          && ((v13 == 215) & v65) == 0
          && ((v74 == 214) & BYTE4(v64)) == 0
          && (v63 & v64 & 1) == 0
          && (v63 & v62 & 1) == 0
          && ((v75 == 213) & BYTE4(v61)) == 0
          && ((v76 == 212) & v61) == 0
          && ((v77 == 211) & BYTE4(v60)) == 0
          && ((v78 == 208) & v60) == 0
          && (v53 & HIDWORD(v59) & 1) == 0
          && (v53 & v59 & 1) == 0
          && ((v79 == 206) & BYTE4(v58)) == 0
          && ((v80 == 205) & v58) == 0
          && (v51 & HIDWORD(v57) & 1) == 0
          && (v51 & v57 & 1) == 0
          && ((v81 == 301) & BYTE4(v56)) == 0
          && ((v82 == 203) & v56) == 0
          && (v68 & HIDWORD(v55) & 1) == 0
          && !((v84 == 15) & v55 | (v83 & HIDWORD(v86) | v69 & v54 | v49) & 1 | v86 & v18 & 1))
        {
          LODWORD(v52) = v13 == 215;
          HIDWORD(v52) = v14 == 216;
          BOOL v25 = v84 == 15;
          id v26 = v3;

          uint64_t v85 = [v73 arrayByAddingObject:v26];

          v54 |= v69;
          HIDWORD(v86) |= v50 == 14;
          LOBYTE(v55) = v55 | v25;
          HIDWORD(v55) |= v68;
          LOBYTE(v56) = v56 | (v82 == 203);
          BYTE4(v56) |= v81 == 301;
          LODWORD(v57) = v57 | (v48 == 303);
          HIDWORD(v57) |= v47;
          LOBYTE(v58) = v58 | (v80 == 205);
          BYTE4(v58) |= v79 == 206;
          LODWORD(v59) = v59 | (v46 == 304);
          HIDWORD(v59) |= v45 == 207;
          LOBYTE(v60) = v60 | (v78 == 208);
          BYTE4(v60) |= v77 == 211;
          LOBYTE(v61) = v61 | (v76 == 212);
          BYTE4(v61) |= v75 == 213;
          v62 |= v44 == 305;
          LODWORD(v64) = v64 | (v43 == 210);
          BYTE4(v64) |= v74 == 214;
          v65 |= v52;
          LOBYTE(v66) = v66 | (v15 == 306);
          HIDWORD(v66) |= v42 == 218;
          v72 |= v17 == 217;
          v87 = v26;
          uint64_t v73 = (void *)v85;
        }
        LODWORD(v86) = v70 | v86;
        uint64_t v1 = v71 + 1;
      }
      while (v71 + 1 != v41);
      uint64_t v27 = [obj countByEnumeratingWithState:&v89 objects:v93 count:16];
      uint64_t v41 = v27;
    }
    while (v27);
  }
  else
  {
    v87 = 0;
    uint64_t v73 = (void *)MEMORY[0x263EFFA68];
  }

  char v28 = [v73 reverseObjectEnumerator];
  v29 = [v28 allObjects];

  uint64_t v94 = 0;
  v95 = &v94;
  uint64_t v96 = 0x3032000000;
  v97 = __Block_byref_object_copy_;
  v98 = __Block_byref_object_dispose_;
  id v99 = (id)MEMORY[0x263EFFA68];
  v88[0] = MEMORY[0x263EF8330];
  v88[1] = 3221225472;
  v88[2] = ___ConsolidatedEvents_block_invoke;
  v88[3] = &unk_2644E8330;
  v88[4] = &v94;
  [v29 enumerateObjectsUsingBlock:v88];
  uint64_t v30 = [(id)v95[5] count];
  if (v30 != [v38 count])
  {
    ASLoggingInitialize();
    unsigned int v31 = ASLogRelationships;
    if (os_log_type_enabled((os_log_t)ASLogRelationships, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_21EC60000, v31, OS_LOG_TYPE_DEFAULT, "Consolidation updated event count", (uint8_t *)&buf, 2u);
    }
    ASLoggingInitialize();
    uint64_t v32 = (id)ASLogRelationships;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = _MostRecentEventsWithCount(v38, 0x64uLL);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v33;
      _os_log_impl(&dword_21EC60000, v32, OS_LOG_TYPE_DEFAULT, "Previous events: %@", (uint8_t *)&buf, 0xCu);
    }
    ASLoggingInitialize();
    unint64_t v34 = (id)ASLogRelationships;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      char v35 = _MostRecentEventsWithCount((void *)v95[5], 0x1EuLL);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v35;
      _os_log_impl(&dword_21EC60000, v34, OS_LOG_TYPE_DEFAULT, "New events: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  id v36 = (id)v95[5];
  _Block_object_dispose(&v94, 8);

  return v36;
}

void sub_21EC74908(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t ASCodableWithdrawInviteRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  BOOL v4 = (int *)MEMORY[0x263F62288];
  BOOL v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        int v18 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(&STACK[0x200], 8) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL ASCodableCloudKitDateComponentsReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  BOOL v4 = (int *)MEMORY[0x263F62288];
  BOOL v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 48) |= 0x10u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4))
            {
              unsigned int v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__year;
              goto LABEL_61;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              break;
            }
            v17 += 7;
            BOOL v23 = v18++ > 8;
            if (v23)
            {
              uint64_t v19 = 0;
              unsigned int v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__year;
              goto LABEL_64;
            }
          }
          unsigned int v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__year;
          goto LABEL_62;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 48) |= 8u;
          while (2)
          {
            uint64_t v27 = *v3;
            unint64_t v28 = *(void *)(a2 + v27);
            if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
            {
              unsigned int v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__month;
              goto LABEL_61;
            }
            char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v28 + 1;
            v19 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              BOOL v23 = v26++ > 8;
              if (v23)
              {
                uint64_t v19 = 0;
                unsigned int v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__month;
                goto LABEL_64;
              }
              continue;
            }
            break;
          }
          unsigned int v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__month;
          goto LABEL_62;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 48) |= 1u;
          while (2)
          {
            uint64_t v32 = *v3;
            unint64_t v33 = *(void *)(a2 + v32);
            if (v33 == -1 || v33 >= *(void *)(a2 + *v4))
            {
              unsigned int v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__day;
              goto LABEL_61;
            }
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v33 + 1;
            v19 |= (unint64_t)(v34 & 0x7F) << v30;
            if (v34 < 0)
            {
              v30 += 7;
              BOOL v23 = v31++ > 8;
              if (v23)
              {
                uint64_t v19 = 0;
                unsigned int v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__day;
                goto LABEL_64;
              }
              continue;
            }
            break;
          }
          unsigned int v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__day;
          goto LABEL_62;
        case 4u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 48) |= 4u;
          while (2)
          {
            uint64_t v37 = *v3;
            unint64_t v38 = *(void *)(a2 + v37);
            if (v38 == -1 || v38 >= *(void *)(a2 + *v4))
            {
              unsigned int v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__hour;
              goto LABEL_61;
            }
            char v39 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
            *(void *)(a2 + v37) = v38 + 1;
            v19 |= (unint64_t)(v39 & 0x7F) << v35;
            if (v39 < 0)
            {
              v35 += 7;
              BOOL v23 = v36++ > 8;
              if (v23)
              {
                uint64_t v19 = 0;
                unsigned int v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__hour;
                goto LABEL_64;
              }
              continue;
            }
            break;
          }
          unsigned int v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__hour;
          goto LABEL_62;
        case 5u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 48) |= 2u;
          break;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
          return 0;
      }
      while (1)
      {
        uint64_t v42 = *v3;
        unint64_t v43 = *(void *)(a2 + v42);
        if (v43 == -1 || v43 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v43);
        *(void *)(a2 + v42) = v43 + 1;
        v19 |= (unint64_t)(v44 & 0x7F) << v40;
        if ((v44 & 0x80) == 0)
        {
          unsigned int v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__era;
          goto LABEL_62;
        }
        v40 += 7;
        BOOL v23 = v41++ > 8;
        if (v23)
        {
          uint64_t v19 = 0;
          unsigned int v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__era;
          goto LABEL_64;
        }
      }
      unsigned int v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__era;
LABEL_61:
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_62:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v19 = 0;
      }
LABEL_64:
      *(void *)(a1 + *v24) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ASCodableCloudKitCompetitionListReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  BOOL v4 = (int *)MEMORY[0x263F62288];
  BOOL v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
        while (1)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0) {
            goto LABEL_35;
          }
          v19 += 7;
          BOOL v14 = v20++ >= 9;
          if (v14)
          {
            uint64_t v21 = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v21 = 0;
        }
LABEL_37:
        *(void *)(a1 + _Block_object_dispose(&STACK[0x200], 8) = v21;
      }
      else if (v17 == 2)
      {
        uint64_t v25 = PBReaderReadData();
        unsigned int v26 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v25;
      }
      else if (v17 == 1)
      {
        unsigned int v18 = objc_alloc_init(ASCodableCloudKitCompetition);
        [(id)a1 addCompetitions:v18];
        if (!PBReaderPlaceMark() || (ASCodableCloudKitCompetitionReadFrom((uint64_t)v18, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ASDestinationIsEmail(void *a1)
{
  id v1 = a1;
  if ([v1 containsString:@"@"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 containsString:@"mailto:"];
  }

  return v2;
}

uint64_t ASDestinationIsPhoneNumber(void *a1)
{
  id v1 = a1;
  char v2 = [v1 containsString:@"tel:"];
  int IsEmail = ASDestinationIsEmail(v1);
  BOOL v4 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  uint64_t v5 = [v1 rangeOfCharacterFromSet:v4];

  if (v2) {
    return 1;
  }
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  return IsEmail ^ 1u;
}

uint64_t ASDestinationIsMako(void *a1, const char *a2)
{
  return [a1 hasSuffix:@"inbox.appleid.apple.com"];
}

id ASSanitizedContactDestination(void *a1)
{
  id v1 = a1;
  char v2 = _RawAddressForDestination(v1);
  if (ASDestinationIsPhoneNumber(v1))
  {
    id v3 = (void *)MEMORY[0x223C37A50](v2, 0, 1);
  }
  else
  {
    if (!ASDestinationIsEmail(v1)) {
      goto LABEL_6;
    }
    id v3 = (void *)MEMORY[0x223C37A30](v2);
  }
  BOOL v4 = v3;
  uint64_t v5 = _RawAddressForDestination(v3);

  char v2 = (void *)v5;
LABEL_6:

  return v2;
}

id _RawAddressForDestination(void *a1)
{
  id v1 = a1;
  if (([v1 containsString:@"tel:"] & 1) != 0
    || [v1 containsString:@"mailto:"])
  {
    id v2 = (id)IDSCopyRawAddressForDestination();
  }
  else
  {
    id v2 = v1;
  }
  id v3 = v2;

  return v3;
}

id ASSanitizedContactDestinations(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [MEMORY[0x263EFF9C0] set];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = ASSanitizedContactDestination(*(void **)(*((void *)&v10 + 1) + 8 * i));
        objc_msgSend(v2, "addObject:", v8, (void)v10);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

id ASContactStorePredicateForDestination(void *a1)
{
  id v1 = a1;
  id v2 = ASSanitizedContactDestination(v1);
  int IsEmail = ASDestinationIsEmail(v1);

  if (IsEmail)
  {
    uint64_t v4 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingEmailAddress:v2];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263EFEB28] phoneNumberWithStringValue:v2];
    uint64_t v4 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingPhoneNumber:v5];
  }

  return v4;
}

id ASShortNameForContactStoreContact(void *a1)
{
  if (a1)
  {
    a1 = [MEMORY[0x263EFEA20] stringFromContact:a1 style:1000];
    uint64_t v1 = vars8;
  }
  return a1;
}

id ASFullNameForContactStoreContact(void *a1)
{
  if (a1)
  {
    a1 = [MEMORY[0x263EFEA20] stringFromContact:a1 style:0];
    uint64_t v1 = vars8;
  }
  return a1;
}

id ASConsolidateAddresses(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "hk_filter:", &__block_literal_global_3);
  id v2 = [MEMORY[0x263EFFA08] setWithArray:v1];

  return v2;
}

BOOL __ASConsolidateAddresses_block_invoke(uint64_t a1, void *a2)
{
  return [a2 length] != 0;
}

uint64_t ASCodableRelationshipContainerReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = 0x2644E7000uLL;
    unint64_t v8 = 0x267EA3000uLL;
    unint64_t v9 = 0x267EA3000uLL;
    long long v10 = (int *)MEMORY[0x263F62268];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v11 = 0;
        unsigned int v12 = 0;
        unint64_t v13 = 0;
        while (1)
        {
          uint64_t v14 = *v3;
          unint64_t v15 = *(void *)(a2 + v14);
          if (v15 == -1 || v15 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + *v10) + v15);
          *(void *)(a2 + v14) = v15 + 1;
          v13 |= (unint64_t)(v16 & 0x7F) << v11;
          if ((v16 & 0x80) == 0) {
            goto LABEL_12;
          }
          v11 += 7;
          BOOL v17 = v12++ >= 9;
          if (v17)
          {
            unint64_t v13 = 0;
            int v18 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        int v18 = *(unsigned __int8 *)(a2 + *v5);
        if (*(unsigned char *)(a2 + *v5)) {
          unint64_t v13 = 0;
        }
LABEL_14:
        if (v18) {
          BOOL v19 = 1;
        }
        else {
          BOOL v19 = (v13 & 7) == 4;
        }
        if (!v19)
        {
          switch((v13 >> 3))
          {
            case 1u:
              unint64_t v20 = v9;
              unint64_t v21 = v8;
              unint64_t v22 = v7;
              unint64_t v23 = objc_alloc_init(*(Class *)(v7 + 3360));
              objc_storeStrong((id *)(a1 + 16), v23);
              if PBReaderPlaceMark() && (ASCodableCloudKitRelationshipReadFrom(v23, a2))
              {
                PBReaderRecallMark();

                unint64_t v7 = v22;
                unint64_t v8 = v21;
                unint64_t v9 = v20;
                goto LABEL_38;
              }

              return 0;
            case 2u:
              char v25 = 0;
              unsigned int v26 = 0;
              uint64_t v27 = 0;
              *(unsigned char *)(a1 + *(int *)(v8 + 2348)) |= 1u;
              break;
            case 3u:
              uint64_t v31 = PBReaderReadData();
              uint64_t v32 = 64;
              goto LABEL_37;
            case 4u:
              uint64_t v31 = PBReaderReadData();
              uint64_t v32 = 24;
              goto LABEL_37;
            case 5u:
              uint64_t v31 = PBReaderReadData();
              uint64_t v32 = 48;
              goto LABEL_37;
            case 6u:
              uint64_t v31 = PBReaderReadData();
              uint64_t v32 = 40;
              goto LABEL_37;
            case 7u:
              uint64_t v31 = PBReaderReadData();
              uint64_t v32 = 32;
              goto LABEL_37;
            case 8u:
              uint64_t v31 = PBReaderReadData();
              uint64_t v32 = 56;
LABEL_37:
              unint64_t v33 = *(void **)(a1 + v32);
              *(void *)(a1 + v32) = v31;

              goto LABEL_38;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_38:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
          while (1)
          {
            uint64_t v28 = *v3;
            unint64_t v29 = *(void *)(a2 + v28);
            if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v30 = *(unsigned char *)(*(void *)(a2 + *v10) + v29);
            *(void *)(a2 + v2_Block_object_dispose(&STACK[0x200], 8) = v29 + 1;
            v27 |= (unint64_t)(v30 & 0x7F) << v25;
            if ((v30 & 0x80) == 0) {
              goto LABEL_41;
            }
            v25 += 7;
            BOOL v17 = v26++ >= 9;
            if (v17)
            {
              uint64_t v27 = 0;
              goto LABEL_43;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v27 = 0;
          }
LABEL_43:
          *(void *)(a1 + *(int *)(v9 + 2352)) = v27;
          goto LABEL_38;
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id ASContactSanitizedDestination(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (ASDestinationIsPhoneNumber(v1))
  {
    uint64_t v2 = IDSCopyIDForPhoneNumber();
LABEL_5:
    id v3 = (void *)v2;
    goto LABEL_7;
  }
  if (ASDestinationIsEmail(v1))
  {
    uint64_t v2 = MEMORY[0x223C37A30](v1);
    goto LABEL_5;
  }
  id v3 = 0;
LABEL_7:
  uint64_t v4 = (void *)IDSCopyRawAddressForDestination();

  ASLoggingInitialize();
  uint64_t v5 = ASLogDefault;
  if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    unint64_t v8 = v4;
    _os_log_impl(&dword_21EC60000, v5, OS_LOG_TYPE_DEFAULT, "The final destination after cleanup is: %@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

id _FindIntersectingDestination(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v4, "containsObject:", v9, (void)v11))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

uint64_t ASCodableDatabaseCompetitionReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        unint64_t v20 = objc_alloc_init(ASCodableCloudKitCompetition);
        objc_storeStrong((id *)(a1 + 16), v20);
        if (!PBReaderPlaceMark() || (ASCodableCloudKitCompetitionReadFrom((uint64_t)v20, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if (v17 == 2)
      {
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
        while (1)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
          *(void *)(a2 + v24) = v25 + 1;
          v23 |= (unint64_t)(v26 & 0x7F) << v21;
          if ((v26 & 0x80) == 0) {
            goto LABEL_35;
          }
          v21 += 7;
          BOOL v14 = v22++ >= 9;
          if (v14)
          {
            uint64_t v23 = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_37:
        *(void *)(a1 + _Block_object_dispose(&STACK[0x200], 8) = v23;
      }
      else if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadData();
        BOOL v19 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v18;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id ASCompetitionParticipationTemplate()
{
  id v0 = objc_alloc_init(MEMORY[0x263F236D8]);
  [v0 setUniqueName:@"CompetitionParticipation"];
  [v0 setSourceName:@"ActivitySharingCompetitions"];
  [v0 setVersion:1];
  [v0 setMinimumEngineVersion:1];
  id v1 = [MEMORY[0x263F08A98] predicateWithValue:1];
  uint64_t v2 = [v1 predicateFormat];
  [v0 setPredicate:v2];

  [v0 setValueExpression:&stru_26D045AA8];
  [v0 setTriggers:0];
  [v0 setEarnLimit:*MEMORY[0x263F235F0]];
  [v0 setDuplicateRemovalStrategy:3];
  [v0 setDuplicateRemovalCalendarUnit:16];
  [v0 setEarnDateStrategy:1];
  [v0 setDisplayOrder:1];
  id v3 = [MEMORY[0x263F08A98] predicateWithValue:1];
  id v4 = [v3 predicateFormat];
  [v0 setVisibilityPredicate:v4];

  id v5 = [MEMORY[0x263F08A98] predicateWithValue:0];
  id v6 = [v5 predicateFormat];
  [v0 setAlertabilityPredicate:v6];

  [v0 setDisplaysEarnedInstanceCount:1];
  uint64_t v7 = [MEMORY[0x263F0A830] countUnit];
  [v0 setCanonicalUnit:v7];

  return v0;
}

id ASCompetitionVictoryTemplateForFriend(void *a1, uint64_t a2)
{
  id v3 = (objc_class *)MEMORY[0x263F236D8];
  id v4 = a1;
  id v5 = objc_alloc_init(v3);
  id v6 = [NSString stringWithFormat:@"%@_%@", @"CompetitionVictory", v4];
  [v5 setUniqueName:v6];

  [v5 setSourceName:@"ActivitySharingCompetitions"];
  [v5 setVersion:2];
  [v5 setMinimumEngineVersion:1];
  uint64_t v7 = [v4 UUIDString];

  [v5 setPredicate:v7];
  [v5 setValueExpression:&stru_26D045AA8];
  [v5 setTriggers:0];
  [v5 setEarnLimit:*MEMORY[0x263F235F0]];
  [v5 setDuplicateRemovalStrategy:1];
  [v5 setDuplicateRemovalCalendarUnit:16];
  [v5 setEarnDateStrategy:1];
  char v8 = [MEMORY[0x263F08A98] predicateWithValue:1];
  unsigned int v9 = [v8 predicateFormat];
  [v5 setVisibilityPredicate:v9];

  unint64_t v10 = [MEMORY[0x263F08A98] predicateWithValue:0];
  uint64_t v11 = [v10 predicateFormat];
  [v5 setAlertabilityPredicate:v11];

  [v5 setDisplaysEarnedInstanceCount:1];
  unint64_t v12 = [MEMORY[0x263F0A830] countUnit];
  [v5 setCanonicalUnit:v12];

  [v5 setDisplayOrder:a2 + 2];

  return v5;
}

uint64_t ASCompetitionVictoryTemplateNameForFriend(uint64_t a1)
{
  return [NSString stringWithFormat:@"%@_%@", @"CompetitionVictory", a1];
}

id ASCompetitionVictoryFriendUUIDFromTemplate(void *a1)
{
  id v1 = NSString;
  id v2 = a1;
  id v3 = [v1 stringWithFormat:@"%@_", @"CompetitionVictory"];
  [v2 rangeOfString:v3];
  id v5 = [v2 substringFromIndex:v4];

  id v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v5];

  return v6;
}

uint64_t ASIsCompetitionVictoryTemplate(void *a1, const char *a2)
{
  return [a1 containsString:@"CompetitionVictory"];
}

uint64_t ASIsAchievementValidForCompetitionSuggestion(void *a1)
{
  id v1 = a1;
  id v2 = MoveGoal200PercentTemplate();
  id v3 = [v2 uniqueName];
  if ([v1 isEqualToString:v3])
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v5 = MoveGoal300PercentTemplate();
    id v6 = [v5 uniqueName];
    if ([v1 isEqualToString:v6])
    {
      uint64_t v4 = 1;
    }
    else
    {
      uint64_t v7 = MoveGoal400PercentTemplate();
      char v8 = [v7 uniqueName];
      if ([v1 isEqualToString:v8])
      {
        uint64_t v4 = 1;
      }
      else
      {
        unsigned int v9 = DailyMoveRecordTemplate();
        unint64_t v10 = [v9 uniqueName];
        if ([v1 isEqualToString:v10])
        {
          uint64_t v4 = 1;
        }
        else
        {
          uint64_t v23 = DailyExerciseRecordTemplate();
          unsigned int v22 = [v23 uniqueName];
          if (objc_msgSend(v1, "isEqualToString:"))
          {
            uint64_t v4 = 1;
          }
          else
          {
            char v21 = NewMoveGoalAchievedTemplate();
            unint64_t v20 = [v21 uniqueName];
            if (objc_msgSend(v1, "isEqualToString:"))
            {
              uint64_t v4 = 1;
            }
            else
            {
              BOOL v19 = PerfectWeekMoveTemplate();
              uint64_t v18 = [v19 uniqueName];
              if (objc_msgSend(v1, "isEqualToString:"))
              {
                uint64_t v4 = 1;
              }
              else
              {
                unint64_t v17 = PerfectWeekStandTemplate();
                uint64_t v16 = [v17 uniqueName];
                if (objc_msgSend(v1, "isEqualToString:"))
                {
                  uint64_t v4 = 1;
                }
                else
                {
                  int v15 = PerfectWeekExerciseTemplate();
                  BOOL v14 = [v15 uniqueName];
                  if (objc_msgSend(v1, "isEqualToString:"))
                  {
                    uint64_t v4 = 1;
                  }
                  else
                  {
                    char v13 = PerfectWeekAllTemplate();
                    unint64_t v12 = [v13 uniqueName];
                    if (objc_msgSend(v1, "isEqualToString:")) {
                      uint64_t v4 = 1;
                    }
                    else {
                      uint64_t v4 = [v1 containsString:@"CompetitionVictory"];
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t ASCompetitionVictoryStyleForBadge(int a1, int a2)
{
  return a2 | (a1 << 16);
}

uint64_t ASCompetitionVictoryBadgeModelFromStyle(unsigned int a1)
{
  return HIWORD(a1);
}

uint64_t ASCompetitionVictoryBadgeColorFromStyle(uint64_t result)
{
  return (unsigned __int16)result;
}

uint64_t ASNumberOfCompetitionVictoryColorsForBadgeModel()
{
  return 10;
}

uint64_t ASFormattedVictoryBadgeStyle(unsigned int a1)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"[%d.%d]", HIWORD(a1), (unsigned __int16)a1);
}

id ASFormattedVictoryBadgeStyles(void *a1)
{
  id v1 = objc_msgSend(a1, "hk_map:", &__block_literal_global_5);
  id v2 = [v1 componentsJoinedByString:&stru_26D045AA8];

  return v2;
}

uint64_t __ASFormattedVictoryBadgeStyles_block_invoke(uint64_t a1, void *a2)
{
  unsigned int v2 = [a2 unsignedIntValue];
  return objc_msgSend(NSString, "stringWithFormat:", @"[%d.%d]", HIWORD(v2), (unsigned __int16)v2);
}

id ASPreferredCompetitionVictoryBadgeStylesForFriend(void *a1, void *a2)
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  ASLoggingInitialize();
  id v5 = (void *)ASLogAchievements;
  if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    uint64_t v7 = [v3 UUID];
    char v8 = [v3 displayName];
    *(_DWORD *)long long buf = 138543618;
    v106 = v7;
    __int16 v107 = 2112;
    v108 = v8;
    _os_log_impl(&dword_21EC60000, v6, OS_LOG_TYPE_DEFAULT, "Computing preferred victory badge style for friend: %{public}@ - %@", buf, 0x16u);
  }
  id v9 = v3;
  v97[0] = MEMORY[0x263EF8330];
  v97[1] = 3221225472;
  v97[2] = __ASPreferredCompetitionVictoryBadgeStylesForFriend_block_invoke;
  v97[3] = &unk_2644E83C8;
  id v64 = v9;
  id v98 = v9;
  BOOL v63 = objc_msgSend(v4, "hk_filter:", v97);
  unint64_t v10 = [v63 allObjects];
  unint64_t v12 = ASFriendsSortedByEarliestCompetitionVictoryOrPotentialVictoryDate(v10, v11);

  int v62 = v12;
  BOOL v70 = objc_msgSend(v12, "hk_map:", &__block_literal_global_303);
  char v13 = objc_msgSend(v70, "hk_map:", &__block_literal_global_307);
  ASLoggingInitialize();
  BOOL v14 = (void *)ASLogAchievements;
  if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = v14;
    uint64_t v16 = ASFormattedSequence(v13);
    *(_DWORD *)long long buf = 138543362;
    v106 = v16;
    _os_log_impl(&dword_21EC60000, v15, OS_LOG_TYPE_DEFAULT, "Used badge models: %{public}@", buf, 0xCu);
  }
  unint64_t v17 = ASLinearSequenceWithCount(5);
  uint64_t v18 = ASShuffledArray(v17);

  BOOL v19 = ASUniqueItemsInArrayPreferringLastOccurance(v13);
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id obj = v18;
  uint64_t v20 = [obj countByEnumeratingWithState:&v93 objects:v104 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v94;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v94 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v93 + 1) + 8 * i);
        if (([v19 containsObject:v24] & 1) == 0)
        {
          uint64_t v103 = v24;
          unint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v103 count:1];
          uint64_t v26 = [v25 arrayByAddingObjectsFromArray:v19];

          BOOL v19 = (void *)v26;
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v93 objects:v104 count:16];
    }
    while (v21);
  }

  ASLoggingInitialize();
  uint64_t v27 = (void *)ASLogAchievements;
  if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = v27;
    unint64_t v29 = ASFormattedSequence(v19);
    *(_DWORD *)long long buf = 138543362;
    v106 = v29;
    _os_log_impl(&dword_21EC60000, v28, OS_LOG_TYPE_DEFAULT, "Preferred badge model order: %{public}@", buf, 0xCu);
  }
  uint64_t v65 = v4;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v66 = v19;
  uint64_t v71 = [v66 countByEnumeratingWithState:&v89 objects:v102 count:16];
  if (v71)
  {
    uint64_t v68 = *(void *)v90;
    char v30 = (void *)MEMORY[0x263EFFA68];
    BOOL v69 = v13;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v90 != v68) {
          objc_enumerationMutation(v66);
        }
        uint64_t v32 = *(void **)(*((void *)&v89 + 1) + 8 * v31);
        int v33 = [v32 unsignedIntValue];
        v87[0] = MEMORY[0x263EF8330];
        v87[1] = 3221225472;
        v87[2] = __ASPreferredCompetitionVictoryBadgeStylesForFriend_block_invoke_309;
        v87[3] = &__block_descriptor_34_e28___NSNumber_16__0__NSNumber_8l;
        __int16 v88 = v33;
        char v34 = objc_msgSend(v70, "hk_map:", v87);
        v85[0] = MEMORY[0x263EF8330];
        v85[1] = 3221225472;
        v85[2] = __ASPreferredCompetitionVictoryBadgeStylesForFriend_block_invoke_2_310;
        v85[3] = &__block_descriptor_34_e28___NSNumber_16__0__NSNumber_8l;
        int v72 = v33;
        __int16 v86 = v33;
        char v35 = objc_msgSend(v70, "hk_map:", v85);
        ASLoggingInitialize();
        unsigned int v36 = (void *)ASLogAchievements;
        if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v37 = v36;
          unint64_t v38 = ASFormattedSequence(v34);
          *(_DWORD *)long long buf = 138543618;
          v106 = v32;
          __int16 v107 = 2114;
          v108 = v38;
          _os_log_impl(&dword_21EC60000, v37, OS_LOG_TYPE_DEFAULT, "Used colors for badge %{public}@: %{public}@", buf, 0x16u);
        }
        char v39 = ASLinearSequenceWithCount(10);
        char v40 = ASShuffledArray(v39);

        int v74 = v35;
        int v75 = v34;
        uint64_t v73 = [v35 arrayByAddingObjectsFromArray:v34];
        unsigned int v41 = ASUniqueItemsInArrayPreferringLastOccurance(v73);
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id v42 = v40;
        uint64_t v43 = [v42 countByEnumeratingWithState:&v81 objects:v101 count:16];
        uint64_t v76 = v31;
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v45 = *(void *)v82;
          do
          {
            for (uint64_t j = 0; j != v44; ++j)
            {
              if (*(void *)v82 != v45) {
                objc_enumerationMutation(v42);
              }
              uint64_t v47 = *(void *)(*((void *)&v81 + 1) + 8 * j);
              if (([v41 containsObject:v47] & 1) == 0)
              {
                uint64_t v100 = v47;
                int v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v100 count:1];
                uint64_t v49 = [v48 arrayByAddingObjectsFromArray:v41];

                unsigned int v41 = (void *)v49;
              }
            }
            uint64_t v44 = [v42 countByEnumeratingWithState:&v81 objects:v101 count:16];
          }
          while (v44);
        }

        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v50 = v41;
        uint64_t v51 = [v50 countByEnumeratingWithState:&v77 objects:v99 count:16];
        if (v51)
        {
          uint64_t v52 = v51;
          uint64_t v53 = *(void *)v78;
          do
          {
            uint64_t v54 = 0;
            uint64_t v55 = v30;
            do
            {
              if (*(void *)v78 != v53) {
                objc_enumerationMutation(v50);
              }
              unsigned __int16 v56 = [*(id *)(*((void *)&v77 + 1) + 8 * v54) unsignedIntValue];
              uint64_t v57 = [NSNumber numberWithUnsignedInteger:v56 | (v72 << 16)];
              char v30 = [v55 arrayByAddingObject:v57];

              ++v54;
              uint64_t v55 = v30;
            }
            while (v52 != v54);
            uint64_t v52 = [v50 countByEnumeratingWithState:&v77 objects:v99 count:16];
          }
          while (v52);
        }

        uint64_t v31 = v76 + 1;
        char v13 = v69;
      }
      while (v76 + 1 != v71);
      uint64_t v71 = [v66 countByEnumeratingWithState:&v89 objects:v102 count:16];
    }
    while (v71);
  }
  else
  {
    char v30 = (void *)MEMORY[0x263EFFA68];
  }

  ASLoggingInitialize();
  uint64_t v58 = (void *)ASLogAchievements;
  if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v59 = v58;
    uint64_t v60 = ASFormattedVictoryBadgeStyles(v30);
    *(_DWORD *)long long buf = 138543362;
    v106 = v60;
    _os_log_impl(&dword_21EC60000, v59, OS_LOG_TYPE_DEFAULT, "Resulting preferred styles: %{public}@", buf, 0xCu);
  }

  return v30;
}

uint64_t __ASPreferredCompetitionVictoryBadgeStylesForFriend_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) UUID];
  id v5 = [v3 UUID];
  char v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = 0;
  }
  else if (([v3 isCompetitionActive] & 1) != 0 {
         || [v3 numberOfCompetitionWinsByMe]
  }
         || ([v3 hasPendingCompetitionRequestFromMe] & 1) != 0)
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = [v3 isAwaitingCompetitionResponseFromMe];
  }

  return v7;
}

id __ASPreferredCompetitionVictoryBadgeStylesForFriend_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isCompetitionActive])
  {
    id v3 = NSNumber;
    id v4 = [v2 currentCompetition];
  }
  else if (([v2 hasPendingCompetitionRequestFromMe] & 1) != 0 {
         || [v2 isAwaitingCompetitionResponseFromMe])
  }
  {
    id v3 = NSNumber;
    id v4 = [v2 competitionPendingAcceptance];
  }
  else
  {
    id v3 = NSNumber;
    id v4 = [v2 mostRecentlyCompletedCompetition];
  }
  id v5 = v4;
  char v6 = objc_msgSend(v3, "numberWithUnsignedInt:", objc_msgSend(v4, "victoryBadgeStyle"));

  return v6;
}

uint64_t __ASPreferredCompetitionVictoryBadgeStylesForFriend_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 unsignedIntValue] >> 16;
  id v3 = NSNumber;

  return [v3 numberWithUnsignedShort:v2];
}

id __ASPreferredCompetitionVictoryBadgeStylesForFriend_block_invoke_309(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = [v3 unsignedIntValue];
  __int16 v5 = [v3 unsignedIntValue];

  if (*(unsigned __int16 *)(a1 + 32) == HIWORD(v4))
  {
    char v6 = [NSNumber numberWithShort:v5];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

id __ASPreferredCompetitionVictoryBadgeStylesForFriend_block_invoke_2_310(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = [v3 unsignedIntValue];
  __int16 v5 = [v3 unsignedIntValue];

  if (*(unsigned __int16 *)(a1 + 32) == HIWORD(v4))
  {
    char v6 = 0;
  }
  else
  {
    char v6 = [NSNumber numberWithShort:v5];
  }

  return v6;
}

uint64_t ASBestCompetitionVictoryBadgeStyleForPreferredStyles(void *a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  ASLoggingInitialize();
  __int16 v5 = ASLogAchievements;
  if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21EC60000, v5, OS_LOG_TYPE_DEFAULT, "Searching for best style given preferred styles", buf, 2u);
  }
  ASLoggingInitialize();
  char v6 = (void *)ASLogAchievements;
  if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    char v8 = ASFormattedVictoryBadgeStyles(v3);
    *(_DWORD *)long long buf = 138412290;
    unsigned int v36 = v8;
    _os_log_impl(&dword_21EC60000, v7, OS_LOG_TYPE_DEFAULT, "Styles: %@", buf, 0xCu);
  }
  ASLoggingInitialize();
  id v9 = (void *)ASLogAchievements;
  if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v10 = v9;
    uint64_t v11 = ASFormattedVictoryBadgeStyles(v4);
    *(_DWORD *)long long buf = 138412290;
    unsigned int v36 = v11;
    _os_log_impl(&dword_21EC60000, v10, OS_LOG_TYPE_DEFAULT, "Other styles: %@", buf, 0xCu);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v3;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    uint64_t v16 = &unk_26D0510B0;
    unint64_t v17 = 0x7FFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        BOOL v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        unint64_t v20 = [v12 indexOfObject:v19];
        unint64_t v21 = [v4 indexOfObject:v19];
        unint64_t v22 = (unint64_t)((double)v20 * (double)v20 + (double)v21 * (double)v21);
        if (v17 > v22)
        {
          id v23 = v19;

          unint64_t v17 = v22;
          uint64_t v16 = v23;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v14);
  }
  else
  {
    uint64_t v16 = &unk_26D0510B0;
  }

  ASLoggingInitialize();
  uint64_t v24 = (void *)ASLogAchievements;
  if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v25 = v24;
    unsigned int v26 = [v16 unsignedIntValue];
    uint64_t v27 = objc_msgSend(NSString, "stringWithFormat:", @"[%d.%d]", HIWORD(v26), (unsigned __int16)v26, (void)v30);
    *(_DWORD *)long long buf = 138412290;
    unsigned int v36 = v27;
    _os_log_impl(&dword_21EC60000, v25, OS_LOG_TYPE_DEFAULT, "Picked style: %@", buf, 0xCu);
  }
  uint64_t v28 = [v16 unsignedIntValue];

  return v28;
}

id IDSDestinationForString(void *a1)
{
  id v1 = a1;
  if (([v1 containsString:@"@"] & 1) != 0
    || [v1 containsString:@"mailto:"])
  {
    uint64_t v2 = MEMORY[0x223C37A30](v1);
  }
  else
  {
    if (([v1 containsString:@"tel:"] & 1) == 0)
    {
      id v3 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
      uint64_t v4 = [v1 rangeOfCharacterFromSet:v3];

      if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      {
        __int16 v5 = 0;
        goto LABEL_9;
      }
    }
    uint64_t v2 = IDSCopyIDForPhoneNumber();
  }
  __int16 v5 = (void *)v2;
LABEL_9:

  return v5;
}

id _RichMessagePayload(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  v34[6] = *MEMORY[0x263EF8340];
  uint64_t v11 = NSString;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = a2;
  long long v33 = objc_msgSend(v11, "stringWithFormat:", @"%ld", a1);
  unint64_t v17 = [v15 base64EncodedStringWithOptions:0];

  uint64_t v18 = [MEMORY[0x263F08BD0] queryItemWithName:@"type" value:v33];
  BOOL v19 = [MEMORY[0x263F08BD0] queryItemWithName:v16 value:v17];

  unint64_t v20 = [MEMORY[0x263F08BD0] queryItemWithName:@"message" value:v14];

  unint64_t v21 = (void *)MEMORY[0x263F08BD0];
  unint64_t v22 = [v13 UUIDString];

  id v23 = [v21 queryItemWithName:@"friendUUID" value:v22];

  uint64_t v24 = [MEMORY[0x263F08BD0] queryItemWithName:@"recipient" value:v12];

  unint64_t v25 = NSString;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  uint64_t v27 = objc_msgSend(v25, "stringWithFormat:", @"%f", v26);
  uint64_t v28 = [MEMORY[0x263F08BD0] queryItemWithName:@"timestamp" value:v27];
  unint64_t v29 = objc_opt_new();
  [v29 setScheme:@"data"];
  [v29 setHost:@"activity-sharing"];
  v34[0] = v18;
  v34[1] = v19;
  v34[2] = v20;
  v34[3] = v23;
  v34[4] = v24;
  v34[5] = v28;
  long long v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:6];
  [v29 setQueryItems:v30];

  long long v31 = [v29 URL];

  return v31;
}

id ASRichMessagePayloadForAchievement(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  unint64_t v10 = [a1 codableAchievement];
  uint64_t v11 = [v10 data];
  id v12 = _RichMessagePayload(1, @"achievement", v11, v9, v8, v7);

  return v12;
}

id ASRichMessagePayloadForGoalCompletion(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  unint64_t v10 = [a1 codableSnapshot];
  uint64_t v11 = [v10 data];
  id v12 = _RichMessagePayload(0, @"snapshot", v11, v9, v8, v7);

  return v12;
}

id ASRichMessagePayloadForWorkout(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  unint64_t v10 = [a1 codableWorkout];
  uint64_t v11 = [v10 data];
  id v12 = _RichMessagePayload(2, @"workout", v11, v9, v8, v7);

  return v12;
}

id ASRichMessagePayloadForCompetitionAccepted(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  unint64_t v10 = [a1 codableCompetition];
  uint64_t v11 = [v10 data];
  id v12 = _RichMessagePayload(3, @"competition", v11, v9, v8, v7);

  return v12;
}

id ASRichMessagePayloadForCompetitionScore(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  unint64_t v10 = [a1 codableCompetition];
  uint64_t v11 = [v10 data];
  id v12 = _RichMessagePayload(4, @"competition", v11, v9, v8, v7);

  return v12;
}

id _FindQueryItemValue(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  __int16 v5 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v4 resolvingAgainstBaseURL:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  char v6 = objc_msgSend(v5, "queryItems", 0);
  id v7 = (void *)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        unint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v10 name];
        char v12 = [v11 isEqualToString:v3];

        if (v12)
        {
          id v7 = [v10 value];
          goto LABEL_11;
        }
      }
      id v7 = (void *)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

id _FindQueryItemData(void *a1, void *a2)
{
  uint64_t v2 = _FindQueryItemValue(a1, a2);
  if (v2) {
    id v3 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v2 options:0];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

BOOL _ASRichMessageTypeIsSupported(unint64_t a1)
{
  return a1 < 5;
}

unint64_t ASRichMessageTypeFromRichMessagePayload(void *a1)
{
  id v1 = _FindQueryItemValue(@"type", a1);
  uint64_t v2 = v1;
  if (!v1 || (unint64_t v3 = [v1 integerValue], v3 >= 5)) {
    unint64_t v3 = -1;
  }

  return v3;
}

id ASAchievementFromRichMessagePayload(void *a1)
{
  id v1 = _FindQueryItemData(@"achievement", a1);
  if (v1)
  {
    uint64_t v2 = [[ASCodableCloudKitAchievement alloc] initWithData:v1];
    unint64_t v3 = [MEMORY[0x263F0A9C8] fitnessFriendAchievementWithCodableAchievement:v2];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

id ASSnapshotFromRichMessagePayload(void *a1)
{
  id v1 = _FindQueryItemData(@"snapshot", a1);
  if (v1)
  {
    uint64_t v2 = [[ASCodableCloudKitActivitySnapshot alloc] initWithData:v1];
    unint64_t v3 = [MEMORY[0x263F0A9D0] fitnessFriendActivitySnapshotWithCodableSnapshot:v2];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

id ASWorkoutFromRichMessagePayload(void *a1)
{
  id v1 = _FindQueryItemData(@"workout", a1);
  if (v1)
  {
    uint64_t v2 = [[ASCodableCloudKitWorkout alloc] initWithData:v1];
    unint64_t v3 = [MEMORY[0x263F0A9D8] fitnessFriendWorkoutWithCodableWorkout:v2];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

id ASCompetitionFromRichMessagePayload(void *a1)
{
  id v1 = _FindQueryItemData(@"competition", a1);
  if (v1)
  {
    uint64_t v2 = [[ASCodableCloudKitCompetition alloc] initWithData:v1];
    unint64_t v3 = +[ASCompetition competitionWithCodableCompetition:v2];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

id ASMessageFromRichMessagePayload(void *a1)
{
  return _FindQueryItemValue(@"message", a1);
}

id ASRecipientAddressFromRichMessagePayload(void *a1)
{
  return _FindQueryItemValue(@"recipient", a1);
}

id ASFriendUUIDFromRichMessagePayload(void *a1)
{
  id v1 = _FindQueryItemValue(@"friendUUID", a1);
  if (v1) {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v1];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

id ASTimestampFromRichMessagePayload(void *a1)
{
  id v1 = _FindQueryItemValue(@"timestamp", a1);
  uint64_t v2 = v1;
  if (v1)
  {
    unint64_t v3 = (void *)MEMORY[0x263EFF910];
    [v1 doubleValue];
    id v4 = objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id ASShuffledArray(void *a1)
{
  id v1 = (void *)[a1 mutableCopy];
  unint64_t v2 = [v1 count];
  if (v2 >= 2)
  {
    do
    {
      unint64_t v3 = v2 - 1;
      [v1 exchangeObjectAtIndex:v2 - 1 withObjectAtIndex:arc4random_uniform(v2)];
      unint64_t v2 = v3;
    }
    while (v3 > 1);
  }
  id v4 = [MEMORY[0x263EFF8C0] arrayWithArray:v1];

  return v4;
}

id ASUniqueItemsInArrayPreferringLastOccurance(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v2 = objc_msgSend(v1, "reverseObjectEnumerator", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    char v6 = (void *)MEMORY[0x263EFFA68];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (([v6 containsObject:v8] & 1) == 0)
        {
          uint64_t v9 = [v6 arrayByAddingObject:v8];

          char v6 = (void *)v9;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
  else
  {
    char v6 = (void *)MEMORY[0x263EFFA68];
  }

  unint64_t v10 = [v6 reverseObjectEnumerator];
  uint64_t v11 = [v10 allObjects];

  return v11;
}

id ASLinearSequenceWithCount(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = (void *)MEMORY[0x263EFFA68];
    do
    {
      uint64_t v4 = [NSNumber numberWithUnsignedInteger:v2];
      uint64_t v5 = [v3 arrayByAddingObject:v4];

      ++v2;
      uint64_t v3 = v5;
    }
    while (a1 != v2);
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

id ASFormattedSequence(void *a1)
{
  id v1 = objc_msgSend(a1, "hk_map:", &__block_literal_global_6);
  uint64_t v2 = [v1 componentsJoinedByString:&stru_26D045AA8];

  return v2;
}

uint64_t __ASFormattedSequence_block_invoke(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"[%@]", a2];
}

id ASCompetitionCalculateStartDateComponentsForFriend(void *a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v1 = a1;
  ASLoggingInitialize();
  uint64_t v2 = (void *)ASLogCompetitions;
  if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = v2;
    uint64_t v4 = [v1 UUID];
    uint64_t v5 = [v1 displayName];
    int v25 = 138543618;
    id v26 = v4;
    __int16 v27 = 2112;
    uint64_t v28 = v5;
    _os_log_impl(&dword_21EC60000, v3, OS_LOG_TYPE_DEFAULT, "Computing competition start day for friend: %{public}@ - %@", (uint8_t *)&v25, 0x16u);
  }
  char v6 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  id v7 = [MEMORY[0x263EFF910] date];
  uint64_t v8 = [v6 dateByAddingUnit:16 value:1 toDate:v7 options:0];

  uint64_t v9 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  uint64_t v10 = *MEMORY[0x263F0AC18];
  uint64_t v11 = [v9 components:*MEMORY[0x263F0AC18] fromDate:v8];

  ASLoggingInitialize();
  char v12 = ASLogCompetitions;
  if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    id v26 = v8;
    _os_log_impl(&dword_21EC60000, v12, OS_LOG_TYPE_DEFAULT, "My next day is %@", (uint8_t *)&v25, 0xCu);
  }
  long long v13 = [v1 currentDateComponents];
  long long v14 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  long long v15 = [v14 dateFromComponents:v13];

  long long v16 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  long long v17 = [v16 dateByAddingUnit:16 value:1 toDate:v15 options:0];

  uint64_t v18 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  uint64_t v19 = [v18 components:v10 fromDate:v17];

  ASLoggingInitialize();
  unint64_t v20 = ASLogCompetitions;
  if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    id v26 = v17;
    _os_log_impl(&dword_21EC60000, v20, OS_LOG_TYPE_DEFAULT, "Friend next day is %@", (uint8_t *)&v25, 0xCu);
  }
  if (objc_msgSend(v17, "hk_isAfterDate:", v8)) {
    unint64_t v21 = v19;
  }
  else {
    unint64_t v21 = v11;
  }
  id v22 = v21;
  ASLoggingInitialize();
  id v23 = ASLogCompetitions;
  if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    id v26 = v22;
    _os_log_impl(&dword_21EC60000, v23, OS_LOG_TYPE_DEFAULT, "Latest day is %@", (uint8_t *)&v25, 0xCu);
  }

  return v22;
}

id ASCompetitionCalculateStartDateComponentsForFriendWithProposedStartDate(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = ASCompetitionCalculateStartDateComponentsForFriend(a1);
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  char v6 = [v5 dateFromComponents:v4];

  id v7 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  uint64_t v8 = [v7 dateFromComponents:v3];

  if (objc_msgSend(v8, "hk_isAfterDate:", v6)) {
    uint64_t v9 = v3;
  }
  else {
    uint64_t v9 = v4;
  }
  id v10 = v9;

  return v10;
}

uint64_t _ASNumberOfDaysSinceCompetitionStart()
{
  id v0 = _HKActivityCacheDateComponentsFromCacheIndex();
  id v1 = _HKActivityCacheDateComponentsFromCacheIndex();
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  id v3 = [v2 dateFromComponents:v0];

  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  uint64_t v5 = [v4 dateFromComponents:v1];

  char v6 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  id v7 = [v6 components:16 fromDate:v3 toDate:v5 options:0];

  uint64_t v8 = [v7 day];
  return v8;
}

uint64_t _ASIntegerFromUserDefaultsWithDefaultValue(void *a1, uint64_t a2)
{
  id v3 = (objc_class *)MEMORY[0x263EFFA40];
  id v4 = a1;
  uint64_t v5 = (void *)[[v3 alloc] initWithSuiteName:@"com.apple.ActivitySharing"];
  uint64_t v6 = [v5 integerForKey:v4];

  if (v6) {
    a2 = v6;
  }

  return a2;
}

id ASCompetitionDurationDateComponentsForNewCompetitions()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v0 = _ASIntegerFromUserDefaultsWithDefaultValue(@"CompetitionDurationNumberOfDays", 7);
  id v1 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v1 setDay:v0];
  [v1 setMonth:0];
  [v1 setYear:0];
  [v1 setEra:0];
  ASLoggingInitialize();
  uint64_t v2 = (void *)ASLogCompetitions;
  if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    int v5 = 134217984;
    uint64_t v6 = [v1 day];
    _os_log_impl(&dword_21EC60000, v3, OS_LOG_TYPE_DEFAULT, "Competition duration is %ld days", (uint8_t *)&v5, 0xCu);
  }

  return v1;
}

uint64_t ASCompetitionRequestHasExpired(void *a1)
{
  id v1 = a1;
  uint64_t v2 = _ASIntegerFromUserDefaultsWithDefaultValue(@"CompetitionRequestExpirationNumberOfSeconds", 172800);
  id v3 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  id v4 = [v3 dateByAddingUnit:128 value:v2 toDate:v1 options:0];

  int v5 = [MEMORY[0x263EFF910] date];
  uint64_t v6 = objc_msgSend(v5, "hk_isAfterOrEqualToDate:", v4);

  return v6;
}

uint64_t ASCompetitionRequestIsStillVisible(void *a1)
{
  id v1 = a1;
  uint64_t v2 = _ASIntegerFromUserDefaultsWithDefaultValue(@"CompetitionRequestExpirationNumberOfSeconds", 172800);
  uint64_t v3 = _ASIntegerFromUserDefaultsWithDefaultValue(@"CompetitionRequestVisibilityAfterExpirationNumberOfSeconds", 259200)+ v2;
  id v4 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  int v5 = [v4 dateByAddingUnit:128 value:v3 toDate:v1 options:0];

  uint64_t v6 = [MEMORY[0x263EFF910] date];
  uint64_t v7 = objc_msgSend(v6, "hk_isBeforeOrEqualToDate:", v5);

  return v7;
}

double ASCompetitionRequestTimeIntervalUntilExpiration(void *a1)
{
  id v1 = a1;
  uint64_t v2 = _ASIntegerFromUserDefaultsWithDefaultValue(@"CompetitionRequestExpirationNumberOfSeconds", 172800);
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  id v4 = [v3 dateByAddingUnit:128 value:v2 toDate:v1 options:0];

  [v4 timeIntervalSinceNow];
  double v6 = v5;

  return v6;
}

unint64_t ASCompetitionRequestHoursUntilExpiration(void *a1)
{
  return llround(ASCompetitionRequestTimeIntervalUntilExpiration(a1) / 3600.0);
}

unint64_t ASCompetitionRequestMinutesUntilExpiration(void *a1)
{
  return vcvtpd_u64_f64(ASCompetitionRequestTimeIntervalUntilExpiration(a1) / 60.0);
}

uint64_t ASCompetitionIsReadyToComplete(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = a1;
  ASLoggingInitialize();
  uint64_t v8 = ASLogCompetitions;
  if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21EC60000, v8, OS_LOG_TYPE_DEFAULT, "Evaluating if competition is ready to complete", buf, 2u);
  }
  uint64_t v9 = [v7 primaryRelationship];

  char v10 = [v9 isCompetitionActive];
  if ((v10 & 1) == 0)
  {
    ASLoggingInitialize();
    char v12 = ASLogCompetitions;
    uint64_t v11 = 0;
    if (!os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    __int16 v18 = 0;
    long long v13 = "No active competition, not ready to complete";
    long long v14 = (uint8_t *)&v18;
LABEL_13:
    _os_log_impl(&dword_21EC60000, v12, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
    uint64_t v11 = 0;
    goto LABEL_14;
  }
  if (([v5 hasPushedFinalScore] & 1) == 0)
  {
    ASLoggingInitialize();
    char v12 = ASLogCompetitions;
    uint64_t v11 = 0;
    if (!os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    __int16 v17 = 0;
    long long v13 = "We've not yet pushed a final score, not ready to complete";
    long long v14 = (uint8_t *)&v17;
    goto LABEL_13;
  }
  if (([v6 hasPushedFinalScore] & 1) == 0)
  {
    ASLoggingInitialize();
    char v12 = ASLogCompetitions;
    uint64_t v11 = 0;
    if (!os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    __int16 v16 = 0;
    long long v13 = "Opponent has not yet pushed a final score, not ready to complete";
    long long v14 = (uint8_t *)&v16;
    goto LABEL_13;
  }
  uint64_t v11 = 1;
LABEL_14:

  return v11;
}

uint64_t _ASCompetitionScoreForActivitySummary(void *a1, unint64_t a2)
{
  id v3 = a1;
  [v3 _activeEnergyCompletionPercentage];
  double v5 = v4;
  [v3 _moveMinutesCompletionPercentage];
  double v7 = v5 + v6;
  [v3 _exerciseTimeCompletionPercentage];
  double v9 = v7 + v8;
  [v3 _standHoursCompletionPercentage];
  double v11 = v10;

  unint64_t v12 = llround((v9 + v11) * 100.0);
  double v13 = fmin((double)v12, (double)a2);
  if (a2) {
    unint64_t v14 = (unint64_t)v13;
  }
  else {
    unint64_t v14 = v12;
  }
  long long v15 = NSNumber;

  return [v15 numberWithUnsignedInteger:v14];
}

uint64_t ASCompetitionNeedsScoreUpdateForSummary(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  double v5 = [v3 startDateComponents];
  uint64_t v6 = _HKCacheIndexFromDateComponents();

  if ([v4 isPaused])
  {
    ASLoggingInitialize();
    double v7 = ASLogCompetitions;
    uint64_t v8 = 0;
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = 0;
      double v9 = "Current activity summary is paused, not updating";
      double v10 = (uint8_t *)&v17;
LABEL_14:
      _os_log_impl(&dword_21EC60000, v7, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      uint64_t v8 = 0;
    }
  }
  else if ([v4 _activitySummaryIndex] >= v6)
  {
    uint64_t v11 = [v4 _activitySummaryIndex];
    if (v11 >= [v3 currentCacheIndex])
    {
      uint64_t v12 = [v3 currentCacheIndex];
      if (v12 >= [v3 endDateCacheIndex])
      {
        ASLoggingInitialize();
        double v7 = ASLogCompetitions;
        uint64_t v8 = 0;
        if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v14 = 0;
          double v9 = "Competition current cache index is greater than competition end cache index, not updating";
          double v10 = (uint8_t *)&v14;
          goto LABEL_14;
        }
      }
      else
      {
        uint64_t v8 = 1;
      }
    }
    else
    {
      ASLoggingInitialize();
      double v7 = ASLogCompetitions;
      uint64_t v8 = 0;
      if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v15 = 0;
        double v9 = "Current activity summary index is less than competition current cache index, not updating";
        double v10 = (uint8_t *)&v15;
        goto LABEL_14;
      }
    }
  }
  else
  {
    ASLoggingInitialize();
    double v7 = ASLogCompetitions;
    uint64_t v8 = 0;
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = 0;
      double v9 = "Current activity summary index is less than competition start index, not updating";
      double v10 = (uint8_t *)&v16;
      goto LABEL_14;
    }
  }

  return v8;
}

id ASCompetitionCalculateUpdatedScores(void *a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [v5 startDateComponents];
  _HKCacheIndexFromDateComponents();

  [v6 _activitySummaryIndex];
  unint64_t v29 = _ASNumberOfDaysSinceCompetitionStart();
  [v7 _activitySummaryIndex];
  uint64_t v9 = _ASNumberOfDaysSinceCompetitionStart();
  [v5 endDateCacheIndex];
  unint64_t v10 = _ASNumberOfDaysSinceCompetitionStart();
  unint64_t v30 = v9;
  if (v10 >= v9 + 1) {
    unint64_t v11 = v9 + 1;
  }
  else {
    unint64_t v11 = v10;
  }
  uint64_t v12 = [v5 scores];
  double v13 = (void *)[v12 mutableCopy];

  __int16 v14 = _ASCompetitionScoreForActivitySummary(v6, [v5 maximumNumberOfPointsPerDay]);
  long long v31 = v5;
  long long v32 = v7;
  __int16 v15 = _ASCompetitionScoreForActivitySummary(v7, [v5 maximumNumberOfPointsPerDay]);
  while ([v13 count] < v11)
  {
    ASLoggingInitialize();
    __int16 v16 = (void *)ASLogCompetitions;
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = v16;
      uint64_t v18 = [v13 count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v34 = v18;
      _os_log_impl(&dword_21EC60000, v17, OS_LOG_TYPE_DEFAULT, "Adding score for day %lu", buf, 0xCu);
    }
    [v13 addObject:&unk_26D0510C8];
  }
  if (v29 < [v13 count])
  {
    ASLoggingInitialize();
    uint64_t v19 = ASLogCompetitions;
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21EC60000, v19, OS_LOG_TYPE_DEFAULT, "Updating yesterday score", buf, 2u);
    }
    unint64_t v20 = [v14 unsignedIntegerValue];
    unint64_t v21 = [v13 objectAtIndexedSubscript:v29];
    unint64_t v22 = [v21 unsignedIntegerValue];

    if (v20 >= v22)
    {
      [v13 setObject:v14 atIndexedSubscript:v29];
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR)) {
        ASCompetitionCalculateUpdatedScores_cold_2();
      }
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR)) {
        ASCompetitionCalculateUpdatedScores_cold_3();
      }
    }
  }
  if (v30 < [v13 count])
  {
    ASLoggingInitialize();
    id v23 = ASLogCompetitions;
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21EC60000, v23, OS_LOG_TYPE_DEFAULT, "Updating today score", buf, 2u);
    }
    unint64_t v24 = [v15 unsignedIntegerValue];
    int v25 = [v13 objectAtIndexedSubscript:v30];
    unint64_t v26 = [v25 unsignedIntegerValue];

    if (v24 >= v26)
    {
      [v13 setObject:v15 atIndexedSubscript:v30];
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR)) {
        ASCompetitionCalculateUpdatedScores_cold_2();
      }
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR)) {
        ASCompetitionCalculateUpdatedScores_cold_1();
      }
    }
  }
  __int16 v27 = [MEMORY[0x263EFF8C0] arrayWithArray:v13];

  return v27;
}

uint64_t ASCompetitionCalculateTotalScore(void *a1)
{
  id v1 = objc_msgSend(a1, "hk_foldRightFrom:with:", &unk_26D0510C8, &__block_literal_global_7);
  uint64_t v2 = [v1 integerValue];

  return v2;
}

uint64_t __ASCompetitionCalculateTotalScore_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = [a2 integerValue];
  uint64_t v7 = [v5 integerValue];

  return [v4 numberWithInteger:v7 + v6];
}

unint64_t ASCompetitionCalculateDailyAverageScore(void *a1)
{
  id v1 = a1;
  if ([v1 count]) {
    unint64_t v2 = llround((float)((float)(unint64_t)ASCompetitionCalculateTotalScore(v1)
  }
                       / (float)(unint64_t)[v1 count]));
  else {
    unint64_t v2 = 0;
  }

  return v2;
}

uint64_t ASCompetitionDailyScoreForParticipantWithCacheIndex(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = [v3 startDateComponents];
  _HKCacheIndexFromDateComponents();

  if (a2) {
    [v3 opponentScores];
  }
  else {
  id v5 = [v3 scores];
  }

  unint64_t v6 = _ASNumberOfDaysSinceCompetitionStart();
  if (v6 >= [v5 count])
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = [v5 objectAtIndexedSubscript:v6];
    uint64_t v8 = [v7 unsignedIntegerValue];
  }
  return v8;
}

uint64_t ASCompetitionCurrentScoreDelta(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 myTotalScore];
  uint64_t v3 = [v1 opponentTotalScore];

  if (v2 - v3 >= 0) {
    return v2 - v3;
  }
  else {
    return v3 - v2;
  }
}

BOOL ASCompetitionScoresAreWithinClosenessThreshold(void *a1)
{
  id v1 = a1;
  unint64_t v2 = vcvtmd_u64_f64((double)(unint64_t)[v1 opponentTotalScore] * 0.97);
  unint64_t v3 = [v1 opponentTotalScore];
  BOOL v4 = [v1 myTotalScore] > v2 && objc_msgSend(v1, "myTotalScore") < vcvtpd_u64_f64((double)v3 * 1.03);

  return v4;
}

id ASCompetitionDayWithHighestScoreForParticipant(void *a1, uint64_t a2)
{
  id v3 = a1;
  BOOL v4 = v3;
  if (a2) {
    [v3 opponentScores];
  }
  else {
  id v5 = [v3 scores];
  }
  if (![v5 count]) {
    goto LABEL_11;
  }
  unint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = -1;
  do
  {
    uint64_t v9 = [v5 objectAtIndexedSubscript:v6];
    uint64_t v10 = [v9 integerValue];

    if (v10 > v7)
    {
      uint64_t v7 = v10;
      uint64_t v8 = v6;
    }
    ++v6;
  }
  while (v6 < [v5 count]);
  if (v7 > 299)
  {
    unint64_t v11 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    uint64_t v12 = [v4 startDate];
    double v13 = [v11 dateByAddingUnit:16 value:v8 toDate:v12 options:0];
  }
  else
  {
LABEL_11:
    double v13 = 0;
  }

  return v13;
}

id ASCompetitionWinningDayWithHighestScoreForParticipant(void *a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a1;
  BOOL v4 = v3;
  if (a2) {
    [v3 opponentScores];
  }
  else {
  unint64_t v21 = [v3 scores];
  }
  [v4 daysWonByParticipant:a2];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        unint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
        double v13 = v4;
        __int16 v14 = [v4 startDate];
        __int16 v15 = [v12 components:16 fromDate:v14 toDate:v11 options:0];

        __int16 v16 = objc_msgSend(v21, "objectAtIndexedSubscript:", objc_msgSend(v15, "day"));
        uint64_t v17 = [v16 integerValue];

        if (v17 > v8)
        {
          id v18 = v11;

          uint64_t v7 = v18;
          uint64_t v8 = v17;
        }

        BOOL v4 = v13;
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t ASCompetitionMaximumPointsPerDayForNewCompetitions()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v0 = _ASIntegerFromUserDefaultsWithDefaultValue(@"CompetitionMaximumPointsPerDay", 600);
  ASLoggingInitialize();
  id v1 = ASLogCompetitions;
  if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 134217984;
    uint64_t v4 = v0;
    _os_log_impl(&dword_21EC60000, v1, OS_LOG_TYPE_DEFAULT, "Competition max num points per day is %lu", (uint8_t *)&v3, 0xCu);
  }
  return v0;
}

uint64_t ASCompetitionWinCountForParticipant(void *a1, uint64_t a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __ASCompetitionWinCountForParticipant_block_invoke;
  v5[3] = &__block_descriptor_40_e23_B16__0__ASCompetition_8l;
  v5[4] = a2;
  unint64_t v2 = objc_msgSend(a1, "hk_filter:", v5);
  uint64_t v3 = [v2 count];

  return v3;
}

uint64_t __ASCompetitionWinCountForParticipant_block_invoke(uint64_t a1, void *a2)
{
  return [a2 isParticipantWinning:*(void *)(a1 + 32)];
}

uint64_t ASDidLosePreviousCompetitionWithFriend(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [v1 completedCompetitions];
  if ((unint64_t)[v2 count] >= 2)
  {
    uint64_t v4 = [v1 completedCompetitions];
    uint64_t v5 = [v1 completedCompetitions];
    uint64_t v6 = objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v5, "count") - 2);

    uint64_t v3 = [v6 isParticipantWinning:1];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

BOOL ASCompetitionParticipantHasCrossedMercyThresholdOnLastDayForCompetition(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 opponentTotalScore];
    uint64_t v6 = [v4 myTotalScore];
  }
  else
  {
    uint64_t v5 = [v3 myTotalScore];
    uint64_t v6 = [v4 opponentTotalScore];
  }
  uint64_t v7 = v6;
  if ([v4 isDailyScoreCapped]) {
    uint64_t v8 = [v4 maximumNumberOfPointsPerDay];
  }
  else {
    uint64_t v8 = ASCompetitionMaximumPointsPerDayForNewCompetitions();
  }
  unint64_t v9 = v8;
  BOOL v10 = a1 == 0;
  unint64_t v11 = [v4 lastDayOfCompetition];
  uint64_t v12 = [v4 dailyScoreForParticipant:a1 onDate:v11];

  double v13 = [v4 lastDayOfCompetition];
  uint64_t v14 = [v4 dailyScoreForParticipant:v10 onDate:v13];

  return v7 + v12 - v5 - v14 > v9;
}

uint64_t ASFriendsWithCompetitionsStartingToday(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hk_filter:", &__block_literal_global_14);
}

uint64_t __ASFriendsWithCompetitionsStartingToday_block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 currentCompetition];
  uint64_t v3 = [v2 isFirstDayOfCompetition];

  return v3;
}

uint64_t ASFriendsWithCompetitionsEndingToday(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hk_filter:", &__block_literal_global_16);
}

uint64_t __ASFriendsWithCompetitionsEndingToday_block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 currentCompetition];
  uint64_t v3 = [v2 isLastDayOfCompetition];

  return v3;
}

uint64_t _ASFriendsSortedByComparator(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = (*(uint64_t (**)(uint64_t, id, id))(a3 + 16))(a3, v5, v6);
  if (!v7)
  {
    uint64_t v8 = [v5 displayName];
    unint64_t v9 = [v8 uppercaseString];
    BOOL v10 = [v6 displayName];
    unint64_t v11 = [v10 uppercaseString];
    uint64_t v7 = [v9 compare:v11];

    if (!v7)
    {
      uint64_t v12 = [v5 UUID];
      double v13 = [v12 UUIDString];
      uint64_t v14 = [v6 UUID];
      __int16 v15 = [v14 UUIDString];
      uint64_t v7 = [v13 compare:v15];
    }
  }

  return v7;
}

uint64_t ASFriendsSortedByEarliestCompetitionVictoryOrPotentialVictoryDate(void *a1, const char *a2)
{
  return [a1 sortedArrayUsingComparator:&__block_literal_global_19];
}

uint64_t __ASFriendsSortedByEarliestCompetitionVictoryOrPotentialVictoryDate_block_invoke(uint64_t a1, void *a2, void *a3)
{
  return _ASFriendsSortedByComparator(a2, a3, (uint64_t)&__block_literal_global_21);
}

uint64_t __ASFriendsSortedByEarliestCompetitionVictoryOrPotentialVictoryDate_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 earliestCompetitionVictoryOrPotentialVictoryDate];
  id v6 = [v4 earliestCompetitionVictoryOrPotentialVictoryDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t ASFriendsSortedByCompetitionEndDate(void *a1, const char *a2)
{
  return [a1 sortedArrayUsingComparator:&__block_literal_global_23];
}

uint64_t __ASFriendsSortedByCompetitionEndDate_block_invoke(uint64_t a1, void *a2, void *a3)
{
  return _ASFriendsSortedByComparator(a2, a3, (uint64_t)&__block_literal_global_25);
}

uint64_t __ASFriendsSortedByCompetitionEndDate_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 currentCompetition];
  id v6 = [v5 endDate];
  uint64_t v7 = [v4 currentCompetition];

  uint64_t v8 = [v7 endDate];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

id ASFriendsSortedByCompetitionEndDateForFirstGlanceType(void *a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v2 = a2 & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v3 = [a1 sortedArrayUsingComparator:&__block_literal_global_23];
  if (v2 != 2)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v3];
    id v5 = objc_msgSend(v3, "hk_filter:", &__block_literal_global_14);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          [v4 removeObject:v10];
          [v4 insertObject:v10 atIndex:0];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithArray:v4];

    uint64_t v3 = (void *)v11;
  }

  return v3;
}

uint64_t ASCompetitionsSortedByEndDate(void *a1, const char *a2)
{
  return [a1 sortedArrayUsingComparator:&__block_literal_global_29];
}

uint64_t __ASCompetitionsSortedByEndDate_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 endDate];
  uint64_t v7 = [v5 endDate];
  uint64_t v8 = [v6 compare:v7];

  if (!v8)
  {
    uint64_t v9 = [v4 UUID];
    uint64_t v10 = [v9 UUIDString];
    uint64_t v11 = [v5 UUID];
    uint64_t v12 = [v11 UUIDString];
    uint64_t v8 = [v10 compare:v12];
  }
  return v8;
}

uint64_t ASValidateEligibilityForOutgoingCompetitionRequest(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [v3 primaryRelationship];
  id v5 = [v3 primaryRemoteRelationship];
  if (v3)
  {
    if (([v4 isCompetitionActive] & 1) != 0 || objc_msgSend(v5, "isCompetitionActive"))
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR)) {
        ASValidateEligibilityForOutgoingCompetitionRequest_cold_2();
      }
      uint64_t v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v7 = 3;
    }
    else if ([v4 isHidingActivityData])
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR)) {
        ASValidateEligibilityForOutgoingCompetitionRequest_cold_3();
      }
      uint64_t v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v7 = 7;
    }
    else
    {
      if ([v5 supportsCompetitions])
      {
        uint64_t v10 = 1;
        goto LABEL_15;
      }
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR)) {
        ASValidateEligibilityForOutgoingCompetitionRequest_cold_4();
      }
      uint64_t v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v7 = 8;
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR)) {
      ASValidateEligibilityForOutgoingCompetitionRequest_cold_1();
    }
    uint64_t v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = 1;
  }
  id v8 = [v6 errorWithDomain:@"com.apple.ActivitySharing" code:v7 userInfo:0];
  id v9 = v8;
  if (v8)
  {
    if (a2)
    {
      id v9 = v8;
      *a2 = v9;
    }
    else
    {
      _HKLogDroppedError();
    }
  }

  uint64_t v10 = 0;
LABEL_15:

  return v10;
}

uint64_t ASValidateEligibilityForIncomingCompetitionRequest(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [v3 primaryRelationship];
  id v5 = [v3 primaryRemoteRelationship];
  if (!v3)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR)) {
      ASValidateEligibilityForIncomingCompetitionRequest_cold_1();
    }
    id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing" code:1 userInfo:0];
    if (!v7) {
      goto LABEL_23;
    }
    if (a2) {
      goto LABEL_22;
    }
LABEL_13:
    _HKLogDroppedError();
    goto LABEL_23;
  }
  if (![v4 isFriendshipActive] || (objc_msgSend(v5, "isFriendshipActive") & 1) == 0)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR)) {
      ASValidateEligibilityForIncomingCompetitionRequest_cold_3();
    }
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing" code:2 userInfo:0];
    if (v6)
    {
      if (a2) {
        *a2 = v6;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  if (([v4 isCompetitionActive] & 1) == 0 && !objc_msgSend(v5, "isCompetitionActive"))
  {
    uint64_t v8 = 1;
    goto LABEL_24;
  }
  ASLoggingInitialize();
  if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR)) {
    ASValidateEligibilityForOutgoingCompetitionRequest_cold_2();
  }
  id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing" code:3 userInfo:0];
  if (v7)
  {
    if (a2)
    {
LABEL_22:
      id v7 = v7;
      *a2 = v7;
      goto LABEL_23;
    }
    goto LABEL_13;
  }
LABEL_23:

  uint64_t v8 = 0;
LABEL_24:

  return v8;
}

uint64_t ASValidateEligibilityForAcceptingCompetitionRequest(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [v3 primaryRelationship];
  id v5 = v4;
  if (v3)
  {
    if ([v4 hasIncomingCompetitionRequest])
    {
      if ([v5 isCompetitionActive])
      {
        ASLoggingInitialize();
        if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR)) {
          ASValidateEligibilityForAcceptingCompetitionRequest_cold_2();
        }
        id v6 = (void *)MEMORY[0x263F087E8];
        uint64_t v7 = 3;
      }
      else
      {
        if (![v5 isHidingActivityData])
        {
          uint64_t v10 = 1;
          goto LABEL_22;
        }
        ASLoggingInitialize();
        if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR)) {
          ASValidateEligibilityForOutgoingCompetitionRequest_cold_3();
        }
        id v6 = (void *)MEMORY[0x263F087E8];
        uint64_t v7 = 7;
      }
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR)) {
        ASValidateEligibilityForAcceptingCompetitionRequest_cold_4();
      }
      id v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v7 = 0;
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR)) {
      ASValidateEligibilityForAcceptingCompetitionRequest_cold_1();
    }
    id v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = 1;
  }
  id v8 = [v6 errorWithDomain:@"com.apple.ActivitySharing" code:v7 userInfo:0];
  id v9 = v8;
  if (v8)
  {
    if (a2)
    {
      id v9 = v8;
      *a2 = v9;
    }
    else
    {
      _HKLogDroppedError();
    }
  }

  uint64_t v10 = 0;
LABEL_22:

  return v10;
}

id ASCompetitionsEligibleForArchival(void *a1)
{
  id v1 = a1;
  ASLoggingInitialize();
  unint64_t v2 = ASLogCompetitions;
  if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21EC60000, v2, OS_LOG_TYPE_DEFAULT, "Validating competitions for archival", v5, 2u);
  }
  id v3 = objc_msgSend(v1, "hk_filter:", &__block_literal_global_32);

  return v3;
}

uint64_t __ASCompetitionsEligibleForArchival_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 lastPushedCacheIndex])
  {
    uint64_t v3 = [v2 lastPushedCacheIndex];
    if (v3 >= [v2 endDateCacheIndex])
    {
      uint64_t v4 = 1;
      goto LABEL_9;
    }
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR)) {
      __ASCompetitionsEligibleForArchival_block_invoke_cold_2();
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR)) {
      __ASCompetitionsEligibleForArchival_block_invoke_cold_1();
    }
  }
  uint64_t v4 = 0;
LABEL_9:

  return v4;
}

uint64_t ASIgnoredMostRecentCompetitionRequestFromContact(void *a1)
{
  id v1 = a1;
  id v2 = [v1 primaryRelationship];
  if ([v2 hasIgnoredCompetitionRequest])
  {
    uint64_t v3 = [v2 dateForLatestIgnoredCompetitionRequest];
    uint64_t v4 = [v1 primaryRemoteRelationship];
    id v5 = [v4 dateForLatestOutgoingCompetitionRequest];

    uint64_t v6 = objc_msgSend(v3, "hk_isAfterDate:", v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t ASPairedDeviceSupportsCompetitions()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F57730] sharedInstance];
  [v0 getPairedDevices];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v7;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v1);
        }
        NRWatchOSVersionForRemoteDevice();
        if (NRVersionIsGreaterThanOrEqual())
        {
          uint64_t v2 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

NSString *ASClientTaskIdentifier()
{
  uint64_t v0 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v0);
}

uint64_t ASServerInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D0605F0];
}

uint64_t ASCodableCloudKitActivitySnapshotReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = 0x267EA3000uLL;
  long long v8 = (int *)MEMORY[0x263F62268];
  unint64_t v9 = 0x267EA3000uLL;
  unint64_t v10 = 0x267EA3000uLL;
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v11 = 0;
    unsigned int v12 = 0;
    unint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = *v3;
      uint64_t v15 = *(void *)(a2 + v14);
      unint64_t v16 = v15 + 1;
      if (v15 == -1 || v16 > *(void *)(a2 + *v4)) {
        break;
      }
      char v17 = *(unsigned char *)(*(void *)(a2 + *v8) + v15);
      *(void *)(a2 + v14) = v16;
      v13 |= (unint64_t)(v17 & 0x7F) << v11;
      if ((v17 & 0x80) == 0) {
        goto LABEL_12;
      }
      v11 += 7;
      BOOL v18 = v12++ >= 9;
      if (v18)
      {
        unint64_t v13 = 0;
        int v19 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v19 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v13 = 0;
    }
LABEL_14:
    if (v19 || (v13 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    unint64_t v21 = v13 >> 3;
    if ((int)(v13 >> 3) > 40)
    {
      if ((int)v21 <= 60)
      {
        if ((int)v21 > 50)
        {
          if (v21 == 51)
          {
            *(_WORD *)(a1 + *(int *)(v7 + 2536)) |= 0x800u;
            uint64_t v71 = *v3;
            unint64_t v72 = *(void *)(a2 + v71);
            if (v72 <= 0xFFFFFFFFFFFFFFF7 && v72 + 8 <= *(void *)(a2 + *v4))
            {
              uint64_t v28 = *(void *)(*(void *)(a2 + *v8) + v72);
              *(void *)(a2 + v71) = v72 + 8;
            }
            else
            {
              *(unsigned char *)(a2 + *v5) = 1;
              uint64_t v28 = 0;
            }
            uint64_t v79 = 96;
          }
          else
          {
            if (v21 != 60) {
              goto LABEL_103;
            }
            *(_WORD *)(a1 + *(int *)(v7 + 2536)) |= 0x200u;
            uint64_t v33 = *v3;
            unint64_t v34 = *(void *)(a2 + v33);
            if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(void *)(a2 + *v4))
            {
              uint64_t v28 = *(void *)(*(void *)(a2 + *v8) + v34);
              *(void *)(a2 + v33) = v34 + 8;
            }
            else
            {
              *(unsigned char *)(a2 + *v5) = 1;
              uint64_t v28 = 0;
            }
            uint64_t v79 = 80;
          }
        }
        else if (v21 == 41)
        {
          *(_WORD *)(a1 + *(int *)(v7 + 2536)) |= 2u;
          uint64_t v61 = *v3;
          unint64_t v62 = *(void *)(a2 + v61);
          if (v62 <= 0xFFFFFFFFFFFFFFF7 && v62 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v28 = *(void *)(*(void *)(a2 + *v8) + v62);
            *(void *)(a2 + v61) = v62 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v28 = 0;
          }
          uint64_t v79 = 16;
        }
        else
        {
          if (v21 != 50) {
            goto LABEL_103;
          }
          *(_WORD *)(a1 + *(int *)(v7 + 2536)) |= 0x2000u;
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v28 = *(void *)(*(void *)(a2 + *v8) + v27);
            *(void *)(a2 + v26) = v27 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v28 = 0;
          }
          uint64_t v79 = 112;
        }
        goto LABEL_144;
      }
      if ((int)v21 > 70)
      {
        if (v21 == 71)
        {
          *(_WORD *)(a1 + *(int *)(v7 + 2536)) |= 0x80u;
          uint64_t v75 = *v3;
          unint64_t v76 = *(void *)(a2 + v75);
          if (v76 <= 0xFFFFFFFFFFFFFFF7 && v76 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v28 = *(void *)(*(void *)(a2 + *v8) + v76);
            *(void *)(a2 + v75) = v76 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v28 = 0;
          }
          uint64_t v79 = 64;
LABEL_144:
          *(void *)(a1 + v79) = v28;
          goto LABEL_145;
        }
        if (v21 != 72)
        {
LABEL_103:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          goto LABEL_145;
        }
        char v37 = 0;
        unsigned int v38 = 0;
        uint64_t v39 = 0;
        *(_WORD *)(a1 + *(int *)(v7 + 2536)) |= 4u;
        while (1)
        {
          uint64_t v40 = *v3;
          uint64_t v41 = *(void *)(a2 + v40);
          unint64_t v42 = v41 + 1;
          if (v41 == -1 || v42 > *(void *)(a2 + *v4)) {
            break;
          }
          char v43 = *(unsigned char *)(*(void *)(a2 + *v8) + v41);
          *(void *)(a2 + v40) = v42;
          v39 |= (unint64_t)(v43 & 0x7F) << v37;
          if ((v43 & 0x80) == 0) {
            goto LABEL_106;
          }
          v37 += 7;
          BOOL v18 = v38++ >= 9;
          if (v18)
          {
            uint64_t v39 = 0;
            goto LABEL_108;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_106:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v39 = 0;
        }
LABEL_108:
        uint64_t v78 = 24;
      }
      else
      {
        if (v21 != 61)
        {
          if (v21 != 70) {
            goto LABEL_103;
          }
          *(_WORD *)(a1 + *(int *)(v7 + 2536)) |= 0x100u;
          uint64_t v31 = *v3;
          unint64_t v32 = *(void *)(a2 + v31);
          if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v28 = *(void *)(*(void *)(a2 + *v8) + v32);
            *(void *)(a2 + v31) = v32 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v28 = 0;
          }
          uint64_t v79 = 72;
          goto LABEL_144;
        }
        char v65 = 0;
        unsigned int v66 = 0;
        uint64_t v39 = 0;
        *(_WORD *)(a1 + *(int *)(v7 + 2536)) |= 0x4000u;
        while (1)
        {
          uint64_t v67 = *v3;
          uint64_t v68 = *(void *)(a2 + v67);
          unint64_t v69 = v68 + 1;
          if (v68 == -1 || v69 > *(void *)(a2 + *v4)) {
            break;
          }
          char v70 = *(unsigned char *)(*(void *)(a2 + *v8) + v68);
          *(void *)(a2 + v67) = v69;
          v39 |= (unint64_t)(v70 & 0x7F) << v65;
          if ((v70 & 0x80) == 0) {
            goto LABEL_118;
          }
          v65 += 7;
          BOOL v18 = v66++ >= 9;
          if (v18)
          {
            uint64_t v39 = 0;
            goto LABEL_120;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_118:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v39 = 0;
        }
LABEL_120:
        uint64_t v78 = 120;
      }
LABEL_121:
      *(void *)(a1 + v7_Block_object_dispose(&STACK[0x200], 8) = v39;
      goto LABEL_145;
    }
    if ((int)v21 > 20)
    {
      if ((int)v21 > 30)
      {
        if (v21 == 31)
        {
          *(_WORD *)(a1 + *(int *)(v7 + 2536)) |= 0x10u;
          uint64_t v73 = *v3;
          unint64_t v74 = *(void *)(a2 + v73);
          if (v74 <= 0xFFFFFFFFFFFFFFF7 && v74 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v28 = *(void *)(*(void *)(a2 + *v8) + v74);
            *(void *)(a2 + v73) = v74 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v28 = 0;
          }
          uint64_t v79 = 40;
        }
        else
        {
          if (v21 != 40) {
            goto LABEL_103;
          }
          *(_WORD *)(a1 + *(int *)(v7 + 2536)) |= 1u;
          uint64_t v35 = *v3;
          unint64_t v36 = *(void *)(a2 + v35);
          if (v36 <= 0xFFFFFFFFFFFFFFF7 && v36 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v28 = *(void *)(*(void *)(a2 + *v8) + v36);
            *(void *)(a2 + v35) = v36 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v28 = 0;
          }
          uint64_t v79 = 8;
        }
      }
      else if (v21 == 21)
      {
        *(_WORD *)(a1 + *(int *)(v7 + 2536)) |= 0x40u;
        uint64_t v63 = *v3;
        unint64_t v64 = *(void *)(a2 + v63);
        if (v64 <= 0xFFFFFFFFFFFFFFF7 && v64 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v28 = *(void *)(*(void *)(a2 + *v8) + v64);
          *(void *)(a2 + v63) = v64 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v28 = 0;
        }
        uint64_t v79 = 56;
      }
      else
      {
        if (v21 != 30) {
          goto LABEL_103;
        }
        *(_WORD *)(a1 + *(int *)(v7 + 2536)) |= 8u;
        uint64_t v29 = *v3;
        unint64_t v30 = *(void *)(a2 + v29);
        if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v28 = *(void *)(*(void *)(a2 + *v8) + v30);
          *(void *)(a2 + v29) = v30 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v28 = 0;
        }
        uint64_t v79 = 32;
      }
      goto LABEL_144;
    }
    switch((int)v21)
    {
      case 1:
        unint64_t v22 = v7;
        unint64_t v23 = v10;
        unint64_t v24 = v9;
        long long v25 = objc_alloc_init(ASCodableCloudKitSample);
        objc_storeStrong((id *)(a1 + 128), v25);
        if PBReaderPlaceMark() && (ASCodableCloudKitSampleReadFrom((uint64_t)v25, a2))
        {
          PBReaderRecallMark();

          unint64_t v9 = v24;
          unint64_t v10 = v23;
          unint64_t v7 = v22;
LABEL_145:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 2:
        uint64_t v46 = PBReaderReadData();
        uint64_t v47 = *(int *)(v10 + 2532);
        int v48 = *(void **)(a1 + v47);
        *(void *)(a1 + v47) = v46;

        goto LABEL_145;
      case 3:
        char v49 = 0;
        unsigned int v50 = 0;
        uint64_t v39 = 0;
        *(_WORD *)(a1 + *(int *)(v7 + 2536)) |= 0x400u;
        while (2)
        {
          uint64_t v51 = *v3;
          uint64_t v52 = *(void *)(a2 + v51);
          unint64_t v53 = v52 + 1;
          if (v52 == -1 || v53 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v54 = *(unsigned char *)(*(void *)(a2 + *v8) + v52);
            *(void *)(a2 + v51) = v53;
            v39 |= (unint64_t)(v54 & 0x7F) << v49;
            if (v54 < 0)
            {
              v49 += 7;
              BOOL v18 = v50++ >= 9;
              if (v18)
              {
                uint64_t v39 = 0;
                goto LABEL_112;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v39 = 0;
        }
LABEL_112:
        uint64_t v78 = 88;
        goto LABEL_121;
      case 4:
        char v55 = 0;
        unsigned int v56 = 0;
        uint64_t v39 = 0;
        *(_WORD *)(a1 + *(int *)(v7 + 2536)) |= 0x1000u;
        while (2)
        {
          uint64_t v57 = *v3;
          uint64_t v58 = *(void *)(a2 + v57);
          unint64_t v59 = v58 + 1;
          if (v58 == -1 || v59 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v60 = *(unsigned char *)(*(void *)(a2 + *v8) + v58);
            *(void *)(a2 + v57) = v59;
            v39 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              v55 += 7;
              BOOL v18 = v56++ >= 9;
              if (v18)
              {
                uint64_t v39 = 0;
                goto LABEL_116;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v39 = 0;
        }
LABEL_116:
        uint64_t v78 = 104;
        goto LABEL_121;
      default:
        if (v21 != 20) {
          goto LABEL_103;
        }
        *(_WORD *)(a1 + *(int *)(v7 + 2536)) |= 0x20u;
        uint64_t v44 = *v3;
        unint64_t v45 = *(void *)(a2 + v44);
        if (v45 <= 0xFFFFFFFFFFFFFFF7 && v45 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v28 = *(void *)(*(void *)(a2 + *v8) + v45);
          *(void *)(a2 + v44) = v45 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v28 = 0;
        }
        uint64_t v79 = *(int *)(v9 + 2548);
        goto LABEL_144;
    }
  }
}

uint64_t ASCodableDatabaseCompetitionListEntryReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 24;
          goto LABEL_30;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 40) |= 2u;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  uint64_t v22 = 0;
                  goto LABEL_41;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_41:
          uint64_t v32 = 16;
          goto LABEL_46;
        case 3u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 32;
LABEL_30:
          uint64_t v26 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose(&STACK[0x200], 8) = v17;

          continue;
        case 4u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 40) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v29 = *v3;
        unint64_t v30 = *(void *)(a2 + v29);
        if (v30 == -1 || v30 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
        *(void *)(a2 + v29) = v30 + 1;
        v22 |= (unint64_t)(v31 & 0x7F) << v27;
        if ((v31 & 0x80) == 0) {
          goto LABEL_43;
        }
        v27 += 7;
        BOOL v14 = v28++ >= 9;
        if (v14)
        {
          uint64_t v22 = 0;
          goto LABEL_45;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v22 = 0;
      }
LABEL_45:
      uint64_t v32 = 8;
LABEL_46:
      *(void *)(a1 + v32) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ASCodableCloudKitSampleReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        *(unsigned char *)(a1 + 32) |= 1u;
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v25);
          *(void *)(a2 + v24) = v25 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v23 = 0;
        }
        uint64_t v27 = 8;
      }
      else
      {
        if (v18 != 2)
        {
          if (v18 == 1)
          {
            uint64_t v19 = PBReaderReadData();
            char v20 = *(void **)(a1 + 24);
            *(void *)(a1 + 24) = v19;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        *(unsigned char *)(a1 + 32) |= 2u;
        uint64_t v21 = *v3;
        unint64_t v22 = *(void *)(a2 + v21);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v23 = 0;
        }
        uint64_t v27 = 16;
      }
      *(void *)(a1 + v27) = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL ASCodableMigrationAvailableItemContainerReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(ASCodableCloudKitMigrationAvailableItem);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || !ASCodableCloudKitMigrationAvailableItemReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadData();
    uint64_t v17 = *(ASCodableCloudKitMigrationAvailableItem **)(a1 + 16);
    *(void *)(a1 + 16) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id ASSnapshotDictionaryByIndex(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v1 = +[ASSampleCollector sampleDictionaryByIndex:a1 sampleIndexBlock:&__block_literal_global_8];
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = objc_msgSend(v3, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        unsigned int v9 = (void *)MEMORY[0x263F0A9D0];
        unint64_t v10 = [v8 allObjects];
        uint64_t v11 = [v9 _mostSignificantSnapshotAmongSnapshots:v10];

        unint64_t v12 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v11, "snapshotIndex"));
        [v2 setObject:v11 forKey:v12];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  char v13 = [NSDictionary dictionaryWithDictionary:v2];

  return v13;
}

uint64_t __ASSnapshotDictionaryByIndex_block_invoke(uint64_t a1, void *a2)
{
  return [a2 snapshotIndex];
}

id ASWorkoutDictionaryByIndex(uint64_t a1)
{
  return +[ASSampleCollector sampleDictionaryByIndex:a1 sampleIndexBlock:&__block_literal_global_13];
}

uint64_t __ASWorkoutDictionaryByIndex_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 endDate];
  uint64_t v3 = ASCacheIndexForLocalDate(v2);

  return v3;
}

id ASAchievementDictionaryByIndex(uint64_t a1)
{
  return +[ASSampleCollector sampleDictionaryByIndex:a1 sampleIndexBlock:&__block_literal_global_16_0];
}

uint64_t __ASAchievementDictionaryByIndex_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 completedDate];
  uint64_t v3 = ASCacheIndexForLocalDate(v2);

  return v3;
}

BOOL ASCodableSecureCloudShareItemReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 24;
        goto LABEL_24;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
LABEL_24:
        uint64_t v20 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadData();
    uint64_t v19 = 8;
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL ASCodableFinalizeHandshakeReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v19 = objc_alloc_init(ASCodableShareLocations);
        objc_storeStrong((id *)(a1 + 24), v19);
        if (!PBReaderPlaceMark() || !ASCodableShareLocationsReadFrom((uint64_t)v19, a2)) {
          goto LABEL_33;
        }
LABEL_27:
        PBReaderRecallMark();
        goto LABEL_28;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = *(ASCodableShareLocations **)(a1 + 16);
        *(void *)(a1 + 16) = v18;
LABEL_28:

        goto LABEL_30;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_30:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v19 = objc_alloc_init(ASCodableActivityDataPreview);
    objc_storeStrong((id *)(a1 + 8), v19);
    if (!PBReaderPlaceMark() || (ASCodableActivityDataPreviewReadFrom((uint64_t)v19, a2) & 1) == 0)
    {
LABEL_33:

      return 0;
    }
    goto LABEL_27;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ASCodableBulletinReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 80) |= 4u;
          while (1)
          {
            uint64_t v21 = *v3;
            uint64_t v22 = *(void *)(a2 + v21);
            unint64_t v23 = v22 + 1;
            if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0) {
              goto LABEL_46;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              uint64_t v20 = 0;
              goto LABEL_48;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_46:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v20 = 0;
          }
LABEL_48:
          uint64_t v38 = 24;
          goto LABEL_53;
        case 2u:
          uint64_t v26 = PBReaderReadString();
          uint64_t v27 = 64;
          goto LABEL_34;
        case 3u:
          uint64_t v26 = PBReaderReadString();
          uint64_t v27 = 48;
          goto LABEL_34;
        case 4u:
          uint64_t v26 = PBReaderReadData();
          uint64_t v27 = 40;
          goto LABEL_34;
        case 5u:
          uint64_t v26 = PBReaderReadData();
          uint64_t v27 = 32;
          goto LABEL_34;
        case 6u:
          uint64_t v26 = PBReaderReadData();
          uint64_t v27 = 72;
          goto LABEL_34;
        case 7u:
          uint64_t v26 = PBReaderReadData();
          uint64_t v27 = 56;
LABEL_34:
          unsigned int v28 = *(void **)(a1 + v27);
          *(void *)(a1 + v27) = v26;

          continue;
        case 8u:
          *(unsigned char *)(a1 + 80) |= 2u;
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v31 = *(void *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v31 = 0;
          }
          *(void *)(a1 + 16) = v31;
          continue;
        case 9u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 80) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v34 = *v3;
        uint64_t v35 = *(void *)(a2 + v34);
        unint64_t v36 = v35 + 1;
        if (v35 == -1 || v36 > *(void *)(a2 + *v4)) {
          break;
        }
        char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
        *(void *)(a2 + v34) = v36;
        v20 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0) {
          goto LABEL_50;
        }
        v32 += 7;
        BOOL v15 = v33++ >= 9;
        if (v15)
        {
          uint64_t v20 = 0;
          goto LABEL_52;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_50:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v20 = 0;
      }
LABEL_52:
      uint64_t v38 = 8;
LABEL_53:
      *(void *)(a1 + v3_Block_object_dispose(&STACK[0x200], 8) = v20;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ASCodableDatabaseCompetitionPreferredVictoryBadgeStylesReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v6 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v7 = 0;
      unsigned int v8 = 0;
      unint64_t v9 = 0;
      while (1)
      {
        uint64_t v10 = *v3;
        unint64_t v11 = *(void *)(a2 + v10);
        if (v11 == -1 || v11 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v12 = *(unsigned char *)(*(void *)(a2 + *v6) + v11);
        *(void *)(a2 + v10) = v11 + 1;
        v9 |= (unint64_t)(v12 & 0x7F) << v7;
        if ((v12 & 0x80) == 0) {
          goto LABEL_12;
        }
        v7 += 7;
        BOOL v13 = v8++ >= 9;
        if (v13)
        {
          unint64_t v9 = 0;
          int v14 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v14 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v9 = 0;
      }
LABEL_14:
      int v15 = v9 & 7;
      if (v14 || v15 == 4) {
        break;
      }
      if ((v9 >> 3) == 1)
      {
        if (v15 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0;
            while (1)
            {
              uint64_t v21 = *v3;
              unint64_t v22 = *(void *)(a2 + v21);
              if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v23 = *(unsigned char *)(*(void *)(a2 + *v6) + v22);
              *(void *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if (v23 < 0)
              {
                v18 += 7;
                BOOL v13 = v19++ >= 9;
                if (!v13) {
                  continue;
                }
              }
              goto LABEL_31;
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
            PBRepeatedInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          while (1)
          {
            uint64_t v27 = *v3;
            unint64_t v28 = *(void *)(a2 + v27);
            if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v29 = *(unsigned char *)(*(void *)(a2 + *v6) + v28);
            *(void *)(a2 + v27) = v28 + 1;
            v26 |= (unint64_t)(v29 & 0x7F) << v24;
            if (v29 < 0)
            {
              v24 += 7;
              BOOL v13 = v25++ >= 9;
              if (!v13) {
                continue;
              }
            }
            goto LABEL_43;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
          PBRepeatedInt32Add();
        }
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ASCodableDatabaseCompetitionScoreReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v6 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v7 = 0;
      unsigned int v8 = 0;
      unint64_t v9 = 0;
      while (1)
      {
        uint64_t v10 = *v3;
        unint64_t v11 = *(void *)(a2 + v10);
        if (v11 == -1 || v11 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v12 = *(unsigned char *)(*(void *)(a2 + *v6) + v11);
        *(void *)(a2 + v10) = v11 + 1;
        v9 |= (unint64_t)(v12 & 0x7F) << v7;
        if ((v12 & 0x80) == 0) {
          goto LABEL_12;
        }
        v7 += 7;
        BOOL v13 = v8++ >= 9;
        if (v13)
        {
          unint64_t v9 = 0;
          int v14 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v14 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v9 = 0;
      }
LABEL_14:
      int v15 = v9 & 7;
      if (v14 || v15 == 4) {
        break;
      }
      if ((v9 >> 3) == 1)
      {
        if (v15 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0;
            while (1)
            {
              uint64_t v21 = *v3;
              unint64_t v22 = *(void *)(a2 + v21);
              if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v23 = *(unsigned char *)(*(void *)(a2 + *v6) + v22);
              *(void *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if (v23 < 0)
              {
                v18 += 7;
                BOOL v13 = v19++ >= 9;
                if (!v13) {
                  continue;
                }
              }
              goto LABEL_31;
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
            PBRepeatedInt64Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          while (1)
          {
            uint64_t v27 = *v3;
            unint64_t v28 = *(void *)(a2 + v27);
            if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v29 = *(unsigned char *)(*(void *)(a2 + *v6) + v28);
            *(void *)(a2 + v27) = v28 + 1;
            v26 |= (unint64_t)(v29 & 0x7F) << v24;
            if (v29 < 0)
            {
              v24 += 7;
              BOOL v13 = v25++ >= 9;
              if (!v13) {
                continue;
              }
            }
            goto LABEL_43;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
          PBRepeatedInt64Add();
        }
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _IsNotificationEventDateBeforeRelationshipBeganWithFriend(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v4 isFriendshipCurrentlyActive]
    && ([v4 dateForLatestRelationshipStart],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    uint64_t v6 = [v4 dateForLatestRelationshipStart];
    uint64_t v7 = objc_msgSend(v3, "hk_isBeforeDate:", v6);
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

__CFString *ASAchievementPathComponentForTemplate(void *a1)
{
  id v1 = a1;
  if (ASIsCompetitionVictoryTemplate(v1, v2)) {
    id v3 = @"CompetitionVictory";
  }
  else {
    id v3 = v1;
  }
  id v4 = v3;

  return v4;
}

id ASBundlePathForTemplate(void *a1)
{
  id v1 = ASAchievementPathComponentForTemplate(a1);
  uint64_t v2 = [@"/System/Library/Health/Assets/ActivitySharingAssets.bundle" stringByAppendingPathComponent:v1];

  return v2;
}

id ASBundleURLForResource(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = ASBundlePathForTemplate(a1);
  uint64_t v5 = [v4 stringByAppendingPathComponent:v3];

  uint64_t v6 = [NSURL fileURLWithPath:v5];

  return v6;
}

id ASCompetitionVictoryPropertyListPathForStyle(uint64_t a1)
{
  id v1 = objc_msgSend(NSString, "stringWithFormat:", @"color_%d", ASCompetitionVictoryBadgeColorFromStyle(a1));
  uint64_t v2 = NSURL;
  id v3 = ASBundlePathForTemplate(@"CompetitionVictory");
  id v4 = [v3 stringByAppendingPathComponent:v1];
  uint64_t v5 = [v2 fileURLWithPath:v4];

  return v5;
}

id ASCompetitionVictoryResourcePathForStyle(unsigned int a1)
{
  id v1 = objc_msgSend(NSString, "stringWithFormat:", @"badgemodel_%d", ASCompetitionVictoryBadgeModelFromStyle(a1));
  uint64_t v2 = ASBundleURLForResource(@"CompetitionVictory", v1);

  return v2;
}

id ASAchievementLocalizationPathForTemplate(void *a1)
{
  return ASBundleURLForResource(a1, @"localization");
}

id ASCompetitionParticipationResourcePath()
{
  return ASBundleURLForResource(@"CompetitionParticipation", @"badgemodel");
}

id ASFriendAchievementFromTemplateAndEarnedInstance(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 uniqueName];
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  uint64_t v7 = [v4 earnedDateComponents];
  unsigned int v8 = [v6 dateFromComponents:v7];

  unint64_t v9 = [v4 value];

  double v10 = 0.0;
  if (v9)
  {
    unint64_t v11 = [v3 canonicalUnit];

    if (v11)
    {
      char v12 = [v4 value];
      BOOL v13 = [v3 canonicalUnit];
      char v14 = [v12 isCompatibleWithUnit:v13];

      if (v14)
      {
        int v15 = [v4 value];
        int v16 = [v3 canonicalUnit];
        [v15 doubleValueForUnit:v16];
        double v10 = v17;
      }
      else
      {
        ASLoggingInitialize();
        uint64_t v26 = ASLogAchievements;
        if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_ERROR)) {
          ASFriendAchievementFromTemplateAndEarnedInstance_cold_5(v26);
        }
        ASLoggingInitialize();
        uint64_t v27 = ASLogAchievements;
        if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_ERROR)) {
          ASFriendAchievementFromTemplateAndEarnedInstance_cold_1((uint64_t)v3, v27, v28, v29, v30, v31, v32, v33);
        }
        ASLoggingInitialize();
        uint64_t v34 = ASLogAchievements;
        if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_ERROR)) {
          ASFriendAchievementFromTemplateAndEarnedInstance_cold_3((uint64_t)v4, v34, v35, v36, v37, v38, v39, v40);
        }
      }
    }
    else
    {
      ASLoggingInitialize();
      char v18 = ASLogAchievements;
      if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_ERROR)) {
        ASFriendAchievementFromTemplateAndEarnedInstance_cold_2(v18);
      }
      ASLoggingInitialize();
      unsigned int v19 = ASLogAchievements;
      if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_ERROR)) {
        ASFriendAchievementFromTemplateAndEarnedInstance_cold_1((uint64_t)v3, v19, v20, v21, v22, v23, v24, v25);
      }
    }
  }
  uint64_t v41 = (void *)MEMORY[0x263F0A9C8];
  unint64_t v42 = [NSNumber numberWithDouble:v10];
  char v43 = [v41 achievementWithTemplateUniqueName:v5 completedDate:v8 value:v42 friendUUID:0];

  return v43;
}

id ASEphemeralEarnedAchievement(void *a1, void *a2, void *a3)
{
  v24[1] = *MEMORY[0x263EF8340];
  id v5 = a1;
  uint64_t v6 = (objc_class *)MEMORY[0x263F236B8];
  id v7 = a3;
  id v8 = a2;
  id v9 = objc_alloc_init(v6);
  double v10 = [v5 template];
  unint64_t v11 = [v10 uniqueName];
  [v9 setTemplateUniqueName:v11];

  char v12 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  BOOL v13 = [v12 components:*MEMORY[0x263F234C0] fromDate:v8];

  [v9 setEarnedDateComponents:v13];
  char v14 = [MEMORY[0x263EFF910] date];
  [v9 setCreatedDate:v14];

  int v15 = (void *)MEMORY[0x263F0A630];
  int v16 = [v5 template];
  double v17 = [v16 canonicalUnit];
  [v7 doubleValue];
  double v19 = v18;

  uint64_t v20 = [v15 quantityWithUnit:v17 doubleValue:v19];
  [v9 setValue:v20];

  if (ACHShouldUseNewAwardsSystem())
  {
    uint64_t v21 = [v5 shallowCopyWithRelevantEarnedInstance:v9];
  }
  else
  {
    v24[0] = v9;
    uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    uint64_t v21 = [v5 shallowCopyReplacingEarnedInstances:v22];
  }

  return v21;
}

id ASEphemeralEarnedAchievementForFriendAchievement(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = [v4 completedDate];
  uint64_t v6 = [v4 value];

  id v7 = ASEphemeralEarnedAchievement(v3, v5, v6);

  return v7;
}

id ASEphemeralCompetitionVictoryAchievementForStyle(uint64_t a1, void *a2)
{
  id v3 = ASCompetitionVictoryTemplateForFriend(a2, 0);
  int v4 = ACHShouldUseNewAwardsSystem();
  id v5 = objc_alloc(MEMORY[0x263F23630]);
  if (v4) {
    uint64_t v6 = [v5 initWithTemplate:v3 relevantEarnedInstance:0 earnedInstanceCount:0];
  }
  else {
    uint64_t v6 = [v5 initWithTemplate:v3 earnedInstances:MEMORY[0x263EFFA68]];
  }
  id v7 = (void *)v6;
  id v8 = ASCompetitionVictoryResourcePathForStyle(a1);
  [v7 setResourceBundleURL:v8];

  id v9 = ASCompetitionVictoryPropertyListPathForStyle(a1);
  [v7 setPropertyListBundleURL:v9];

  double v10 = [v3 uniqueName];
  unint64_t v11 = ASBundleURLForResource(v10, @"localization");
  [v7 setLocalizationBundleURL:v11];

  ACHApplyBadgePropertiesToAchievement();

  return v7;
}

id ASEphemeralCompetitionVictoryAchievementForFriendAchievement(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 value];
  uint64_t v3 = [v2 unsignedIntValue];

  int v4 = [v1 templateUniqueName];

  id v5 = ASCompetitionVictoryFriendUUIDFromTemplate(v4);

  uint64_t v6 = ASEphemeralCompetitionVictoryAchievementForStyle(v3, v5);

  return v6;
}

id ASAchievementThumbnailPathForStyle(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = a1;
  unsigned int v4 = ASCompetitionVictoryBadgeColorFromStyle(a1);
  id v5 = ASCompetitionVictoryResourcePathForStyle(v3);
  uint64_t v6 = v5;
  if (a2) {
    id v7 = @"LargeThumbnails";
  }
  else {
    id v7 = @"SmallThumbnails";
  }
  id v8 = [v5 URLByAppendingPathComponent:v7];
  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"BadgeThumbnail_%d.png", v4);
  double v10 = [v8 URLByAppendingPathComponent:v9];
  unint64_t v11 = [v10 filePathURL];

  return v11;
}

id ASBuildFriendAchievementsToShare(void *a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a1;
  unsigned int v4 = _HKStartDateForSnapshotIndex();
  ASLoggingInitialize();
  id v5 = ASLogActivityData;
  if (os_log_type_enabled((os_log_t)ASLogActivityData, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    uint64_t v15 = a2;
    __int16 v16 = 2112;
    double v17 = v4;
    _os_log_impl(&dword_21EC60000, v5, OS_LOG_TYPE_DEFAULT, "Looking for achievements for snapshot index: %lld, date: %@", buf, 0x16u);
  }
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __ASBuildFriendAchievementsToShare_block_invoke;
  v11[3] = &unk_2644E8AF0;
  id v12 = v6;
  id v13 = v4;
  id v7 = v4;
  id v8 = v6;
  id v9 = objc_msgSend(v3, "hk_map:", v11);

  return v9;
}

id __ASBuildFriendAchievementsToShare_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (ACHIsActivityAchievementSharable())
  {
    unsigned int v4 = [v3 relevantEarnedInstance];
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v4 createdDate];
    LODWORD(v5) = [v5 isDate:v6 inSameDayAsDate:*(void *)(a1 + 40)];

    if (v5)
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = [v4 earnedDateComponents];
      id v9 = [v7 dateFromComponents:v8];

      double v10 = *(void **)(a1 + 32);
      unint64_t v11 = [v4 createdDate];
      id v12 = [v10 components:16 fromDate:v11 toDate:v9 options:0];

      if ([v12 day] < 0)
      {
        char v14 = 0;
      }
      else
      {
        id v13 = [v3 template];
        char v14 = ASFriendAchievementFromTemplateAndEarnedInstance(v13, v4);
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

uint64_t ASCacheIndexForLocalDate(void *a1)
{
  uint64_t v1 = ASCacheIndexForLocalDate_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&ASCacheIndexForLocalDate_onceToken, &__block_literal_global_10);
  }
  uint64_t v3 = _HKCacheIndexFromDate();

  return v3;
}

uint64_t __ASCacheIndexForLocalDate_block_invoke()
{
  ASCacheIndexForLocalDate_currentCalendar = [MEMORY[0x263EFF8F0] currentCalendar];

  return MEMORY[0x270F9A758]();
}

void ASCleanSnapshotForUpload(void *a1)
{
  id v1 = a1;
  if ([v1 amm] == 2)
  {
    [v1 setEnergyBurned:0.0];
    [v1 setEnergyBurnedGoal:0.0];
  }
}

double _ASMoveValueForSnapshot(void *a1)
{
  id v1 = a1;
  if ([v1 isAmm]) {
    [v1 mmv];
  }
  else {
    [v1 energyBurned];
  }
  double v3 = v2;

  return v3;
}

double _ASMoveGoalForSnapshot(void *a1)
{
  id v1 = a1;
  if ([v1 isAmm]) {
    [v1 mmg];
  }
  else {
    [v1 energyBurnedGoal];
  }
  double v3 = v2;

  return v3;
}

BOOL ASAllGoalsMetForSnapshot(void *a1)
{
  id v1 = a1;
  [v1 activeHours];
  double v3 = v2;
  [v1 activeHoursGoal];
  BOOL v9 = v3 >= v4
    && ([v1 briskMinutes], double v6 = v5, objc_msgSend(v1, "briskMinutesGoal"), v6 >= v7)
    && (double v8 = _ASMoveGoalForSnapshot(v1), v8 > 0.0)
    && _ASMoveValueForSnapshot(v1) >= v8;

  return v9;
}

uint64_t _CacheIndexForDayWithOffsetFromCurrentDay(uint64_t a1)
{
  double v2 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  double v3 = [MEMORY[0x263EFF910] date];
  double v4 = [v2 dateByAddingUnit:16 value:-a1 toDate:v3 options:0];
  double v5 = [v2 startOfDayForDate:v4];

  double v6 = _HKActivityCacheDateComponentsFromDate();
  uint64_t v7 = _HKCacheIndexFromDateComponents();

  return v7;
}

id _ActivitySnapshot(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, double a13, uint64_t a14)
{
  id v24 = a3;
  id v25 = a2;
  uint64_t v26 = _CacheIndexForDayWithOffsetFromCurrentDay(a1);
  uint64_t v27 = _HKStartDateForSnapshotIndex();
  uint64_t v28 = [v27 dateByAddingTimeInterval:(double)arc4random_uniform(0x15180u)];
  uint64_t v29 = (void *)MEMORY[0x263F0A9D0];
  uint64_t v30 = _HKEndDateForSnapshotIndex();
  uint64_t v31 = [v29 _fitnessFriendActivitySnapshotWithFriendUUID:v25 sourceUUID:v24 startDate:v27 endDate:v30 snapshotIndex:v26 snapshotUploadedDate:v28];

  [v31 setEnergyBurned:a9];
  [v31 setEnergyBurnedGoal:a10];
  [v31 setMmv:a11];
  [v31 setMmg:a12];
  [v31 setBriskMinutes:(double)a4];
  [v31 setBriskMinutesGoal:(double)a5];
  [v31 setActiveHours:(double)a6];
  [v31 setActiveHoursGoal:(double)a7];
  uint64_t v32 = (void *)MEMORY[0x263F0A630];
  uint64_t v33 = [MEMORY[0x263F0A830] mileUnit];
  uint64_t v34 = [v32 quantityWithUnit:v33 doubleValue:a13];

  [v31 setStepCount:(double)a8];
  uint64_t v35 = [MEMORY[0x263F0A830] meterUnit];
  [v34 doubleValueForUnit:v35];
  objc_msgSend(v31, "setWalkingAndRunningDistance:");

  [v31 setPushCount:(double)a8];
  [v31 setAmm:a14];

  return v31;
}

id _CreatePedestrianWorkout(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  id v31 = a1;
  _CacheIndexForDayWithOffsetFromCurrentDay(a2);
  uint64_t v34 = _HKStartDateForSnapshotIndex();
  BOOL v9 = [v34 dateByAddingTimeInterval:(double)(arc4random_uniform(0xFD20u) + 21600)];
  double v10 = [v9 dateByAddingTimeInterval:a5];
  unint64_t v11 = (void *)MEMORY[0x263F0A9D8];
  id v12 = (void *)MEMORY[0x263F0A630];
  id v13 = [MEMORY[0x263F0A830] kilocalorieUnit];
  char v14 = [v12 quantityWithUnit:v13 doubleValue:a6 * 100.0];
  uint64_t v15 = (void *)MEMORY[0x263F0A630];
  __int16 v16 = [MEMORY[0x263F0A830] kilocalorieUnit];
  double v17 = [v15 quantityWithUnit:v16 doubleValue:a6 * 100.0 * 0.6];
  uint64_t v18 = (void *)MEMORY[0x263F0A630];
  double v19 = [MEMORY[0x263F0A830] mileUnit];
  uint64_t v20 = [v18 quantityWithUnit:v19 doubleValue:a6];
  LOWORD(v30) = 1;
  objc_msgSend(v11, "fitnessFriendworkoutWithActivityType:friendUUID:startDate:endDate:duration:totalActiveEnergyBurned:totalBasalEnergyBurned:totalDistance:goalType:goal:bundleID:isWatchWorkout:isIndoorWorkout:deviceManufacturer:deviceModel:amm:seymourCatalogWorkoutIdentifier:seymourMediaType:", a3, v31, v9, v10, v14, v17, a5, v20, *MEMORY[0x263F0AC20], 0, @"com.apple.SessionTrackerApp", v30, 0, 0, 1,
    0,
  uint64_t v21 = 0);

  [v21 setGoalType:a4];
  if (a4 == 2)
  {
    uint64_t v27 = (void *)MEMORY[0x263F0A630];
    uint64_t v23 = [MEMORY[0x263F0A830] secondUnit];
    id v24 = v27;
    id v25 = v23;
    double v26 = a5;
  }
  else
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    uint64_t v22 = (void *)MEMORY[0x263F0A630];
    uint64_t v23 = [MEMORY[0x263F0A830] meterUnit];
    id v24 = v22;
    id v25 = v23;
    double v26 = a6;
  }
  uint64_t v28 = [v24 quantityWithUnit:v25 doubleValue:v26];
  [v21 setGoal:v28];

LABEL_6:

  return v21;
}

id _CreateFitnessJrWorkout(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  id v11 = a1;
  _CacheIndexForDayWithOffsetFromCurrentDay(a2);
  uint64_t v28 = _HKStartDateForSnapshotIndex();
  id v12 = [v28 dateByAddingTimeInterval:(double)(arc4random_uniform(0xFD20u) + 21600)];
  id v13 = [v12 dateByAddingTimeInterval:a5];
  char v14 = (void *)MEMORY[0x263F0A9D8];
  uint64_t v15 = (void *)MEMORY[0x263F0A630];
  __int16 v16 = [MEMORY[0x263F0A830] mileUnit];
  double v17 = [v15 quantityWithUnit:v16 doubleValue:a6];
  LOWORD(v27) = 1;
  objc_msgSend(v14, "fitnessFriendworkoutWithActivityType:friendUUID:startDate:endDate:duration:totalActiveEnergyBurned:totalBasalEnergyBurned:totalDistance:goalType:goal:bundleID:isWatchWorkout:isIndoorWorkout:deviceManufacturer:deviceModel:amm:seymourCatalogWorkoutIdentifier:seymourMediaType:", a3, v11, v12, v13, 0, 0, a5, v17, *MEMORY[0x263F0AC20], 0, @"com.apple.SessionTrackerApp", v27, 0, 0, 2,
    0,
  uint64_t v18 = 0);

  [v18 setGoalType:a4];
  if (a4 == 2)
  {
    id v24 = (void *)MEMORY[0x263F0A630];
    uint64_t v20 = [MEMORY[0x263F0A830] secondUnit];
    uint64_t v21 = v24;
    uint64_t v22 = v20;
    double v23 = a5;
  }
  else
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    double v19 = (void *)MEMORY[0x263F0A630];
    uint64_t v20 = [MEMORY[0x263F0A830] meterUnit];
    uint64_t v21 = v19;
    uint64_t v22 = v20;
    double v23 = a6;
  }
  id v25 = [v21 quantityWithUnit:v22 doubleValue:v23];
  [v18 setGoal:v25];

LABEL_6:

  return v18;
}

void sub_21EC92EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

id _FakeHistoricalCompetitionsWithWinner(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v3 = a1;
    double v4 = (void *)MEMORY[0x263EFFA68];
    do
    {
      double v5 = objc_alloc_init(ASCompetition);
      double v6 = [MEMORY[0x263EFF910] distantPast];
      uint64_t v7 = [MEMORY[0x263EFF8F0] currentCalendar];
      double v8 = _HKActivityCacheDateComponentsFromDate();
      [(ASCompetition *)v5 setStartDateComponents:v8];

      BOOL v9 = ASCompetitionDurationDateComponentsForNewCompetitions();
      [(ASCompetition *)v5 setDurationDateComponents:v9];

      if (a2) {
        [(ASCompetition *)v5 setOpponentScores:&unk_26D051440];
      }
      else {
        [(ASCompetition *)v5 setScores:&unk_26D051428];
      }
      double v10 = [v4 arrayByAddingObject:v5];

      double v4 = v10;
      --v3;
    }
    while (v3);
  }
  else
  {
    double v10 = (void *)MEMORY[0x263EFFA68];
  }

  return v10;
}

uint64_t ASCodableCloudKitRelationshipReadFrom(unsigned char *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  double v4 = (int *)MEMORY[0x263F62288];
  double v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 112;
        goto LABEL_64;
      case 4u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 48;
        goto LABEL_64;
      case 5u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 56;
        goto LABEL_64;
      case 7u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
        goto LABEL_64;
      case 8u:
        PBReaderReadString();
        uint64_t v20 = (ASCodableCloudKitRelationshipEvent *)objc_claimAutoreleasedReturnValue();
        if (v20) {
          [a1 addAddresses:v20];
        }
        goto LABEL_32;
      case 0xAu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 64;
        goto LABEL_64;
      case 0xBu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 72;
        goto LABEL_64;
      case 0xEu:
        uint64_t v20 = objc_alloc_init(ASCodableCloudKitRelationshipEvent);
        [a1 addEvents:v20];
        if (PBReaderPlaceMark()
          && (ASCodableCloudKitRelationshipEventReadFrom((uint64_t)v20, a2) & 1) != 0)
        {
          PBReaderRecallMark();
LABEL_32:

LABEL_65:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 0xFu:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        a1[120] |= 2u;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_70;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_70:
        uint64_t v44 = 16;
        goto LABEL_84;
      case 0x11u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v29 = 0;
        a1[120] |= 4u;
        while (2)
        {
          uint64_t v30 = *v3;
          unint64_t v31 = *(void *)(a2 + v30);
          if (v31 == -1 || v31 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
            *(void *)(a2 + v30) = v31 + 1;
            v29 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              BOOL v14 = v28++ >= 9;
              if (v14)
              {
                LODWORD(v29) = 0;
                goto LABEL_74;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v29) = 0;
        }
LABEL_74:
        uint64_t v45 = 104;
        goto LABEL_79;
      case 0x12u:
        char v33 = 0;
        unsigned int v34 = 0;
        uint64_t v29 = 0;
        a1[120] |= 8u;
        while (2)
        {
          uint64_t v35 = *v3;
          unint64_t v36 = *(void *)(a2 + v35);
          if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
            *(void *)(a2 + v35) = v36 + 1;
            v29 |= (unint64_t)(v37 & 0x7F) << v33;
            if (v37 < 0)
            {
              v33 += 7;
              BOOL v14 = v34++ >= 9;
              if (v14)
              {
                LODWORD(v29) = 0;
                goto LABEL_78;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v29) = 0;
        }
LABEL_78:
        uint64_t v45 = 108;
LABEL_79:
        *(_DWORD *)&a1[v45] = v29;
        goto LABEL_65;
      case 0x13u:
        char v38 = 0;
        unsigned int v39 = 0;
        uint64_t v23 = 0;
        a1[120] |= 1u;
        while (2)
        {
          uint64_t v40 = *v3;
          unint64_t v41 = *(void *)(a2 + v40);
          if (v41 == -1 || v41 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v42 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
            *(void *)(a2 + v40) = v41 + 1;
            v23 |= (unint64_t)(v42 & 0x7F) << v38;
            if (v42 < 0)
            {
              v38 += 7;
              BOOL v14 = v39++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_83;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_83:
        uint64_t v44 = 8;
LABEL_84:
        *(void *)&a1[v44] = v23;
        goto LABEL_65;
      case 0x14u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 88;
        goto LABEL_64;
      case 0x15u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 96;
        goto LABEL_64;
      case 0x16u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 80;
LABEL_64:
        char v43 = *(void **)&a1[v18];
        *(void *)&a1[v18] = v17;

        goto LABEL_65;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_65;
    }
  }
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

id _ActivityAppQueryItemsForFriendOnDate(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  double v5 = v4;
  if (v4)
  {
    [v4 timeIntervalSinceReferenceDate];
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%f", v6);
    char v8 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"timestamp" value:v7];
    unsigned int v9 = [MEMORY[0x263EFFA68] arrayByAddingObject:v8];

    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  unsigned int v9 = (void *)MEMORY[0x263EFFA68];
  if (v3)
  {
LABEL_3:
    id v10 = objc_alloc(MEMORY[0x263F08BD0]);
    uint64_t v11 = [v3 UUIDString];
    unint64_t v12 = (void *)[v10 initWithName:@"uuid" value:v11];

    uint64_t v13 = [v9 arrayByAddingObject:v12];

    unsigned int v9 = (void *)v13;
  }
LABEL_4:

  return v9;
}

id _FindQueryItemValueWithName(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (objc_class *)MEMORY[0x263F08BA0];
  id v5 = a1;
  uint64_t v6 = (void *)[[v4 alloc] initWithURL:v5 resolvingAgainstBaseURL:0];

  uint64_t v7 = [v6 queryItems];
  char v8 = (void *)MEMORY[0x263F08A98];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = ___FindQueryItemValueWithName_block_invoke;
  v15[3] = &unk_2644E8BD0;
  id v16 = v3;
  id v9 = v3;
  id v10 = [v8 predicateWithBlock:v15];
  uint64_t v11 = [v7 filteredArrayUsingPredicate:v10];

  unint64_t v12 = [v11 firstObject];
  uint64_t v13 = [v12 value];

  return v13;
}

id ASActivityAppLaunchURLForMeOnDate(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263F08BA0];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  [v3 setScheme:@"activitysharing"];
  [v3 setHost:@"me"];
  id v4 = _ActivityAppQueryItemsForFriendOnDate(0, v2);

  [v3 setQueryItems:v4];
  id v5 = [v3 URL];

  return v5;
}

id ASActivityAppLaunchURLForFriendOnDate(void *a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F08BA0];
  id v4 = a2;
  id v5 = a1;
  id v6 = objc_alloc_init(v3);
  [v6 setScheme:@"activitysharing"];
  [v6 setHost:@"friend"];
  uint64_t v7 = _ActivityAppQueryItemsForFriendOnDate(v5, v4);

  [v6 setQueryItems:v7];
  char v8 = [v6 URL];

  return v8;
}

id ASActivityAppLaunchURLForSharingFriendList()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v0 setScheme:@"activitysharing"];
  [v0 setHost:@"list"];
  id v1 = [v0 URL];

  return v1;
}

id ASActivityAppLaunchURLForSharingInbox()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v0 setScheme:@"activitysharing"];
  [v0 setHost:@"inbox"];
  id v1 = [v0 URL];

  return v1;
}

id ASDateFromActivityAppLaunchURL(void *a1)
{
  id v1 = _FindQueryItemValueWithName(a1, @"timestamp");
  id v2 = v1;
  if (v1)
  {
    [v1 doubleValue];
    id v3 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id ASFriendUUIDFromActivityAppLaunchURL(void *a1)
{
  id v1 = _FindQueryItemValueWithName(a1, @"uuid");
  if (v1) {
    id v2 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v1];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

uint64_t ASIsM8Device()
{
  if (ASIsM8Device_onceToken != -1) {
    dispatch_once(&ASIsM8Device_onceToken, &__block_literal_global_12);
  }
  return ASIsM8Device___isM8Device;
}

void __ASIsM8Device_block_invoke()
{
  id v0 = (id)MGCopyAnswer();
  ASIsM8Device___isM8Device = [v0 isEqualToString:@"t8002"];
}

uint64_t ASIsM9Device()
{
  if (ASIsM9Device_onceToken != -1) {
    dispatch_once(&ASIsM9Device_onceToken, &__block_literal_global_12);
  }
  return ASIsM9Device___isM9Device;
}

void __ASIsM9Device_block_invoke()
{
  id v0 = (id)MGCopyAnswer();
  ASIsM9Device___isM9Device = [v0 isEqualToString:@"t8006"];
}

BOOL ASShouldReducePeriodUpdateFrequency()
{
  if (ASIsM8Device_onceToken != -1) {
    dispatch_once(&ASIsM8Device_onceToken, &__block_literal_global_12);
  }
  if (ASIsM8Device___isM8Device) {
    return 1;
  }
  if (ASIsM9Device_onceToken != -1) {
    dispatch_once(&ASIsM9Device_onceToken, &__block_literal_global_12);
  }
  return ASIsM9Device___isM9Device != 0;
}

uint64_t ASCodableCloudKitRelationshipEventReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 4)
      {
        *(unsigned char *)(a1 + 32) |= 2u;
        uint64_t v26 = *v3;
        unint64_t v27 = *(void *)(a2 + v26);
        if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v28 = *(void *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v27 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v28 = 0;
        }
        *(void *)(a1 + 16) = v28;
      }
      else
      {
        if (v18 == 2)
        {
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)(a1 + 32) |= 4u;
          while (1)
          {
            uint64_t v31 = *v3;
            uint64_t v32 = *(void *)(a2 + v31);
            unint64_t v33 = v32 + 1;
            if (v32 == -1 || v33 > *(void *)(a2 + *v4)) {
              break;
            }
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
            *(void *)(a2 + v31) = v33;
            v21 |= (unint64_t)(v34 & 0x7F) << v29;
            if ((v34 & 0x80) == 0) {
              goto LABEL_45;
            }
            v29 += 7;
            BOOL v15 = v30++ >= 9;
            if (v15)
            {
              uint64_t v21 = 0;
              goto LABEL_47;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v21 = 0;
          }
LABEL_47:
          uint64_t v36 = 24;
        }
        else
        {
          if (v18 != 1)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)(a1 + 32) |= 1u;
          while (1)
          {
            uint64_t v22 = *v3;
            uint64_t v23 = *(void *)(a2 + v22);
            unint64_t v24 = v23 + 1;
            if (v23 == -1 || v24 > *(void *)(a2 + *v4)) {
              break;
            }
            char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v24;
            v21 |= (unint64_t)(v25 & 0x7F) << v19;
            if ((v25 & 0x80) == 0) {
              goto LABEL_41;
            }
            v19 += 7;
            BOOL v15 = v20++ >= 9;
            if (v15)
            {
              uint64_t v21 = 0;
              goto LABEL_43;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v21 = 0;
          }
LABEL_43:
          uint64_t v36 = 8;
        }
        *(void *)(a1 + v36) = v21;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ASCodableCloudKitWorkoutReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = 0x2644E7000uLL;
    unint64_t v8 = 0x267EA3000uLL;
    unint64_t v9 = 0x267EA3000uLL;
    unint64_t v10 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *v3;
        uint64_t v15 = *(void *)(a2 + v14);
        unint64_t v16 = v15 + 1;
        if (v15 == -1 || v16 > *(void *)(a2 + *v4)) {
          break;
        }
        char v17 = *(unsigned char *)(*(void *)(a2 + *v10) + v15);
        *(void *)(a2 + v14) = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0) {
          goto LABEL_12;
        }
        v11 += 7;
        BOOL v18 = v12++ >= 9;
        if (v18)
        {
          unint64_t v13 = 0;
          int v19 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v19 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v13 = 0;
      }
LABEL_14:
      if (v19 || (v13 & 7) == 4) {
        break;
      }
      switch((v13 >> 3))
      {
        case 1u:
          unint64_t v21 = v8;
          unint64_t v22 = v9;
          unint64_t v23 = v7;
          id v24 = objc_alloc_init(*(Class *)(v7 + 3376));
          objc_storeStrong((id *)(a1 + 96), v24);
          if PBReaderPlaceMark() && (ASCodableCloudKitSampleReadFrom((uint64_t)v24, a2))
          {
            PBReaderRecallMark();

            unint64_t v7 = v23;
            unint64_t v9 = v22;
            unint64_t v8 = v21;
            continue;
          }

          return 0;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          *(_WORD *)(a1 + *(int *)(v8 + 2828)) |= 0x80u;
          while (1)
          {
            uint64_t v28 = *v3;
            uint64_t v29 = *(void *)(a2 + v28);
            unint64_t v30 = v29 + 1;
            if (v29 == -1 || v30 > *(void *)(a2 + *v4)) {
              break;
            }
            char v31 = *(unsigned char *)(*(void *)(a2 + *v10) + v29);
            *(void *)(a2 + v2_Block_object_dispose(&STACK[0x200], 8) = v30;
            v27 |= (unint64_t)(v31 & 0x7F) << v25;
            if ((v31 & 0x80) == 0) {
              goto LABEL_81;
            }
            v25 += 7;
            BOOL v18 = v26++ >= 9;
            if (v18)
            {
              uint64_t v27 = 0;
              goto LABEL_83;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_81:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v27 = 0;
          }
LABEL_83:
          uint64_t v73 = *(int *)(v9 + 2832);
          goto LABEL_101;
        case 5u:
          *(_WORD *)(a1 + *(int *)(v8 + 2828)) |= 2u;
          uint64_t v33 = *v3;
          unint64_t v34 = *(void *)(a2 + v33);
          if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v35 = *(void *)(*(void *)(a2 + *v10) + v34);
            *(void *)(a2 + v33) = v34 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v35 = 0;
          }
          uint64_t v76 = 16;
          goto LABEL_112;
        case 6u:
          *(_WORD *)(a1 + *(int *)(v8 + 2828)) |= 0x40u;
          uint64_t v36 = *v3;
          unint64_t v37 = *(void *)(a2 + v36);
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v35 = *(void *)(*(void *)(a2 + *v10) + v37);
            *(void *)(a2 + v36) = v37 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v35 = 0;
          }
          uint64_t v76 = 56;
          goto LABEL_112;
        case 7u:
          *(_WORD *)(a1 + *(int *)(v8 + 2828)) |= 0x10u;
          uint64_t v38 = *v3;
          unint64_t v39 = *(void *)(a2 + v38);
          if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v35 = *(void *)(*(void *)(a2 + *v10) + v39);
            *(void *)(a2 + v3_Block_object_dispose(&STACK[0x200], 8) = v39 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v35 = 0;
          }
          uint64_t v76 = 40;
          goto LABEL_112;
        case 8u:
          *(_WORD *)(a1 + *(int *)(v8 + 2828)) |= 0x20u;
          uint64_t v40 = *v3;
          unint64_t v41 = *(void *)(a2 + v40);
          if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v35 = *(void *)(*(void *)(a2 + *v10) + v41);
            *(void *)(a2 + v40) = v41 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v35 = 0;
          }
          uint64_t v76 = 48;
          goto LABEL_112;
        case 9u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v27 = 0;
          *(_WORD *)(a1 + *(int *)(v8 + 2828)) |= 8u;
          while (2)
          {
            uint64_t v44 = *v3;
            uint64_t v45 = *(void *)(a2 + v44);
            unint64_t v46 = v45 + 1;
            if (v45 == -1 || v46 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v47 = *(unsigned char *)(*(void *)(a2 + *v10) + v45);
              *(void *)(a2 + v44) = v46;
              v27 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                BOOL v18 = v43++ >= 9;
                if (v18)
                {
                  uint64_t v27 = 0;
                  goto LABEL_87;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v27 = 0;
          }
LABEL_87:
          uint64_t v73 = 32;
          goto LABEL_101;
        case 0xAu:
          *(_WORD *)(a1 + *(int *)(v8 + 2828)) |= 4u;
          uint64_t v48 = *v3;
          unint64_t v49 = *(void *)(a2 + v48);
          if (v49 <= 0xFFFFFFFFFFFFFFF7 && v49 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v35 = *(void *)(*(void *)(a2 + *v10) + v49);
            *(void *)(a2 + v4_Block_object_dispose(&STACK[0x200], 8) = v49 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v35 = 0;
          }
          uint64_t v76 = 24;
LABEL_112:
          *(void *)(a1 + v76) = v35;
          continue;
        case 0xBu:
          uint64_t v50 = PBReaderReadString();
          uint64_t v51 = 72;
          goto LABEL_79;
        case 0xCu:
          char v52 = 0;
          unsigned int v53 = 0;
          uint64_t v54 = 0;
          *(_WORD *)(a1 + *(int *)(v8 + 2828)) |= 0x200u;
          while (2)
          {
            uint64_t v55 = *v3;
            uint64_t v56 = *(void *)(a2 + v55);
            unint64_t v57 = v56 + 1;
            if (v56 == -1 || v57 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v58 = *(unsigned char *)(*(void *)(a2 + *v10) + v56);
              *(void *)(a2 + v55) = v57;
              v54 |= (unint64_t)(v58 & 0x7F) << v52;
              if (v58 < 0)
              {
                v52 += 7;
                BOOL v18 = v53++ >= 9;
                if (v18)
                {
                  uint64_t v54 = 0;
                  goto LABEL_91;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v54 = 0;
          }
LABEL_91:
          BOOL v74 = v54 != 0;
          uint64_t v75 = 121;
          goto LABEL_96;
        case 0xDu:
          char v59 = 0;
          unsigned int v60 = 0;
          uint64_t v61 = 0;
          *(_WORD *)(a1 + *(int *)(v8 + 2828)) |= 0x100u;
          while (2)
          {
            uint64_t v62 = *v3;
            uint64_t v63 = *(void *)(a2 + v62);
            unint64_t v64 = v63 + 1;
            if (v63 == -1 || v64 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v65 = *(unsigned char *)(*(void *)(a2 + *v10) + v63);
              *(void *)(a2 + v62) = v64;
              v61 |= (unint64_t)(v65 & 0x7F) << v59;
              if (v65 < 0)
              {
                v59 += 7;
                BOOL v18 = v60++ >= 9;
                if (v18)
                {
                  uint64_t v61 = 0;
                  goto LABEL_95;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v61 = 0;
          }
LABEL_95:
          BOOL v74 = v61 != 0;
          uint64_t v75 = 120;
LABEL_96:
          *(unsigned char *)(a1 + v75) = v74;
          continue;
        case 0xEu:
          uint64_t v50 = PBReaderReadString();
          uint64_t v51 = 80;
          goto LABEL_79;
        case 0xFu:
          uint64_t v50 = PBReaderReadString();
          uint64_t v51 = 88;
          goto LABEL_79;
        case 0x10u:
          char v66 = 0;
          unsigned int v67 = 0;
          uint64_t v27 = 0;
          *(_WORD *)(a1 + *(int *)(v8 + 2828)) |= 1u;
          break;
        case 0x11u:
          uint64_t v50 = PBReaderReadString();
          uint64_t v51 = 104;
          goto LABEL_79;
        case 0x12u:
          uint64_t v50 = PBReaderReadString();
          uint64_t v51 = 112;
LABEL_79:
          unint64_t v72 = *(void **)(a1 + v51);
          *(void *)(a1 + v51) = v50;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v68 = *v3;
        uint64_t v69 = *(void *)(a2 + v68);
        unint64_t v70 = v69 + 1;
        if (v69 == -1 || v70 > *(void *)(a2 + *v4)) {
          break;
        }
        char v71 = *(unsigned char *)(*(void *)(a2 + *v10) + v69);
        *(void *)(a2 + v6_Block_object_dispose(&STACK[0x200], 8) = v70;
        v27 |= (unint64_t)(v71 & 0x7F) << v66;
        if ((v71 & 0x80) == 0) {
          goto LABEL_98;
        }
        v66 += 7;
        BOOL v18 = v67++ >= 9;
        if (v18)
        {
          uint64_t v27 = 0;
          goto LABEL_100;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_98:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v27 = 0;
      }
LABEL_100:
      uint64_t v73 = 8;
LABEL_101:
      *(void *)(a1 + v73) = v27;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ASMessagesIsInstalled()
{
  id v0 = [MEMORY[0x263F01880] defaultWorkspace];
  uint64_t v1 = [v0 applicationIsInstalled:@"com.apple.MobileSMS"];

  return v1;
}

uint64_t ASAlwaysFetchOnPeriodicUpdate()
{
  id v0 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.ActivitySharing"];
  uint64_t v1 = objc_msgSend(v0, "hk_BOOLForKey:defaultValue:", @"AlwaysFetchOnPeriodicUpdate", 0);

  return v1;
}

__CFString *NSStringFromASCloudType(uint64_t a1)
{
  uint64_t v1 = @"unexpected";
  if (a1 == 1) {
    uint64_t v1 = @"secureCloud";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"legacy";
  }
}

uint64_t ASUseLegacyDevelopmentContainer()
{
  id v0 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.ActivitySharing"];
  uint64_t v1 = objc_msgSend(v0, "hk_BOOLForKey:defaultValue:", @"UseLegacyDevelopmentContainer", 0);

  return v1;
}

id ASActivityDataZoneNames()
{
  v2[6] = *MEMORY[0x263EF8340];
  v2[0] = @"Achievements";
  v2[1] = @"AchievementNotifications";
  v2[2] = @"ActivitySnapshots";
  v2[3] = @"ActivitySnapshotNotifications";
  v2[4] = @"Workouts";
  v2[5] = @"WorkoutNotifications";
  id v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:6];

  return v0;
}

uint64_t ASNumberOfNewFriendsAllowedForFriends(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F08A98];
  id v2 = a1;
  id v3 = [v1 predicateWithBlock:&__block_literal_global_500];
  id v4 = [v2 filteredSetUsingPredicate:v3];

  uint64_t v5 = 40 - [v4 count];
  return v5;
}

uint64_t __ASNumberOfNewFriendsAllowedForFriends_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isFriendshipCurrentlyActive]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 hasInviteRequestFromMe];
  }

  return v3;
}

uint64_t ASCodableInviteRequestReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
        goto LABEL_25;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 40;
        goto LABEL_25;
      case 3u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
        goto LABEL_25;
      case 4u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 24;
LABEL_25:
        unsigned int v20 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&STACK[0x200], 8) = v17;

        goto LABEL_26;
      case 5u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 52) |= 1u;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_41;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_41:
        *(_DWORD *)(a1 + 4_Block_object_dispose(&STACK[0x200], 8) = v23;
        goto LABEL_26;
      case 6u:
        uint64_t v27 = objc_alloc_init(ASCodableActivityDataPreview);
        objc_storeStrong((id *)(a1 + 8), v27);
        if PBReaderPlaceMark() && (ASCodableActivityDataPreviewReadFrom((uint64_t)v27, a2))
        {
          PBReaderRecallMark();

LABEL_26:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_26;
    }
  }
}

uint64_t ASCodableCloudKitAchievementReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v18 = objc_alloc_init(ASCodableCloudKitSample);
          objc_storeStrong((id *)(a1 + 48), v18);
          if PBReaderPlaceMark() && (ASCodableCloudKitSampleReadFrom((uint64_t)v18, a2))
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 3u:
          *(unsigned char *)(a1 + 64) |= 1u;
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v22 = 0;
          }
          uint64_t v42 = 8;
          goto LABEL_60;
        case 4u:
          *(unsigned char *)(a1 + 64) |= 2u;
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v24);
            *(void *)(a2 + v23) = v24 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v22 = 0;
          }
          uint64_t v42 = 16;
LABEL_60:
          *(void *)(a1 + v42) = v22;
          continue;
        case 5u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          *(unsigned char *)(a1 + 64) |= 4u;
          while (2)
          {
            uint64_t v28 = *v3;
            uint64_t v29 = *(void *)(a2 + v28);
            unint64_t v30 = v29 + 1;
            if (v29 == -1 || v30 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
              *(void *)(a2 + v2_Block_object_dispose(&STACK[0x200], 8) = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                BOOL v15 = v26++ >= 9;
                if (v15)
                {
                  uint64_t v27 = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v27 = 0;
          }
LABEL_50:
          uint64_t v41 = 24;
          goto LABEL_55;
        case 7u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v27 = 0;
          *(unsigned char *)(a1 + 64) |= 8u;
          break;
        case 8u:
          uint64_t v38 = PBReaderReadString();
          uint64_t v39 = 40;
          goto LABEL_46;
        case 9u:
          uint64_t v38 = PBReaderReadString();
          uint64_t v39 = 56;
LABEL_46:
          uint64_t v40 = *(void **)(a1 + v39);
          *(void *)(a1 + v39) = v38;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v34 = *v3;
        uint64_t v35 = *(void *)(a2 + v34);
        unint64_t v36 = v35 + 1;
        if (v35 == -1 || v36 > *(void *)(a2 + *v4)) {
          break;
        }
        char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
        *(void *)(a2 + v34) = v36;
        v27 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0) {
          goto LABEL_52;
        }
        v32 += 7;
        BOOL v15 = v33++ >= 9;
        if (v15)
        {
          uint64_t v27 = 0;
          goto LABEL_54;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_52:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v27 = 0;
      }
LABEL_54:
      uint64_t v41 = 32;
LABEL_55:
      *(void *)(a1 + v41) = v27;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ASSupportedPhoneFeaturesForCurrentDevice()
{
  id v0 = [MEMORY[0x263F0A980] sharedBehavior];
  uint64_t v1 = [v0 isStandalonePhoneFitnessMode] ^ 1;

  return v1;
}

uint64_t ASSupportedWatchFeaturesForCurrentDevice()
{
  return 0;
}

BOOL ASRelationshipNeedsSupportedFeaturesUpdate(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v1 = a1;
  int v2 = ASSupportedPhoneFeaturesForCurrentDevice();
  int v3 = [v1 supportedPhoneFeatures];
  int v4 = [v1 supportedWatchFeatures];
  BOOL v6 = v4 != [v1 supportedWatchFeatures] || v2 != v3;
  unint64_t v7 = [MEMORY[0x263EFF910] date];
  char v8 = [v1 dateForLatestSupportedFeaturesUpdate];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [MEMORY[0x263EFF910] distantPast];
  }
  unint64_t v10 = v9;

  uint64_t v11 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  uint64_t v12 = [v11 dateByAddingUnit:16 value:1 toDate:v10 options:0];

  if (v6)
  {
    if (objc_msgSend(v7, "hk_isBeforeOrEqualToDate:", v12))
    {
      ASLoggingInitialize();
      unint64_t v13 = ASLogRelationships;
      BOOL v6 = 0;
      if (os_log_type_enabled((os_log_t)ASLogRelationships, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412546;
        int v16 = v12;
        __int16 v17 = 2112;
        uint64_t v18 = v7;
        _os_log_impl(&dword_21EC60000, v13, OS_LOG_TYPE_DEFAULT, "Not updating supported features due to backoff (date: %@, now %@)", (uint8_t *)&v15, 0x16u);
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 1;
    }
  }

  return v6;
}

void ASUpdateSupportedFeaturesForRelationship(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = ASSupportedPhoneFeaturesForCurrentDevice();
  uint64_t v3 = [v1 supportedWatchFeatures];
  ASLoggingInitialize();
  int v4 = (void *)ASLogRelationships;
  if (os_log_type_enabled((os_log_t)ASLogRelationships, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    int v9 = 67109376;
    int v10 = [v1 supportedPhoneFeatures];
    __int16 v11 = 1024;
    int v12 = v2;
    _os_log_impl(&dword_21EC60000, v5, OS_LOG_TYPE_DEFAULT, "Phone features: %d -> %d", (uint8_t *)&v9, 0xEu);
  }
  ASLoggingInitialize();
  BOOL v6 = (void *)ASLogRelationships;
  if (os_log_type_enabled((os_log_t)ASLogRelationships, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = v6;
    int v8 = [v1 supportedWatchFeatures];
    int v9 = 67109376;
    int v10 = v8;
    __int16 v11 = 1024;
    int v12 = v3;
    _os_log_impl(&dword_21EC60000, v7, OS_LOG_TYPE_DEFAULT, "Watch features: %d -> %d", (uint8_t *)&v9, 0xEu);
  }
  [v1 setSupportedPhoneFeatures:v2];
  [v1 setSupportedWatchFeatures:v3];
  [v1 insertEventWithType:15];
}

id ASMaxNumber(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  BOOL v6 = v4;
  if (v3)
  {
    BOOL v6 = v3;
    if (v4)
    {
      if ([v3 compare:v4] == -1) {
        BOOL v6 = v5;
      }
      else {
        BOOL v6 = v3;
      }
    }
  }
  id v7 = v6;

  return v7;
}

uint64_t ASStringsAreEqual(void *a1, void *a2)
{
  if (a1 == a2) {
    return 1;
  }
  else {
    return [a1 isEqualToString:a2];
  }
}

uint64_t ASObjectsAreEqual(void *a1, void *a2)
{
  if (a1 == a2) {
    return 1;
  }
  else {
    return [a1 isEqual:a2];
  }
}

uint64_t ASObjectsAreEqualOrNil(unint64_t a1, unint64_t a2)
{
  if (a1 == a2 || !(a1 | a2)) {
    return 1;
  }
  else {
    return [(id)a1 isEqual:a2];
  }
}

uint64_t ASDatesAreEqualOrNil(unint64_t a1, unint64_t a2)
{
  if (a1 == a2 || !(a1 | a2)) {
    return 1;
  }
  else {
    return [(id)a1 isEqual:a2];
  }
}

void ASSendRichMessagePayloadToDestination(void *a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v39 = a1;
  id v36 = a2;
  char v37 = [MEMORY[0x263F4A568] sharedInstance];
  if (([v37 hasListenerForID:@"com.apple.ActivitySharingControl"] & 1) == 0) {
    [v37 addListenerID:@"com.apple.ActivitySharingControl" capabilities:*MEMORY[0x263F4A898]];
  }
  [v37 blockUntilConnected];
  uint64_t v40 = [MEMORY[0x263F4A610] serviceWithName:@"iMessage"];
  if (!v40) {
    ASSendRichMessagePayloadToDestination_cold_1();
  }
  id v3 = [MEMORY[0x263F4A520] sharedInstance];
  id v4 = [v3 accountsForService:v40];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (!v6)
  {
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v7 = *(void *)v48;
LABEL_6:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v48 != v7) {
      objc_enumerationMutation(v5);
    }
    int v9 = *(void **)(*((void *)&v47 + 1) + 8 * v8);
    if ([v9 isActive]) {
      break;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [v5 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (!v6) {
        goto LABEL_12;
      }
      goto LABEL_6;
    }
  }
  id v35 = v9;

  if (!v35) {
LABEL_13:
  }
    ASSendRichMessagePayloadToDestination_cold_2();
  uint64_t v41 = [v35 imHandleWithID:v36];
  if (!v41) {
    ASSendRichMessagePayloadToDestination_cold_3();
  }
  int v10 = [MEMORY[0x263F4A540] sharedRegistry];
  __int16 v11 = [v10 existingChatWithHandle:v41];
  if (v11)
  {
  }
  else
  {
    int v12 = [MEMORY[0x263F4A540] sharedRegistry];
    __int16 v11 = [v12 chatWithHandle:v41];

    if (!v11) {
      ASSendRichMessagePayloadToDestination_cold_4();
    }
  }
  unsigned int v33 = [NSString stringWithFormat:@"%@:0000000000:%@", *MEMORY[0x263F4A9E8], @"com.apple.ActivityMessagesApp.MessagesExtension"];
  uint64_t v38 = objc_opt_new();
  uint64_t v13 = (objc_class *)objc_opt_class();
  char v14 = NSStringFromClass(v13);
  uint64_t v15 = *MEMORY[0x263F4AB70];
  [v38 setObject:v14 forKeyedSubscript:*MEMORY[0x263F4AB70]];

  uint64_t v34 = [MEMORY[0x263F08910] archivedDataWithRootObject:v38 requiringSecureCoding:1 error:0];
  int v16 = objc_opt_new();
  __int16 v17 = (objc_class *)objc_opt_class();
  uint64_t v18 = NSStringFromClass(v17);
  [v16 setObject:v18 forKeyedSubscript:v15];

  [v16 setObject:v39 forKeyedSubscript:*MEMORY[0x263F4AB90]];
  [v16 setObject:v34 forKeyedSubscript:*MEMORY[0x263F4AB80]];
  [v16 setObject:MEMORY[0x263EFFA78] forKeyedSubscript:*MEMORY[0x263F4AB78]];
  uint64_t v19 = ASMessageFromRichMessagePayload(v39);
  [v16 setObject:v19 forKeyedSubscript:*MEMORY[0x263F4AB88]];

  uint64_t v20 = [MEMORY[0x263F08910] archivedDataWithRootObject:v16 requiringSecureCoding:1 error:0];
  id v21 = objc_alloc(MEMORY[0x263F4A5B8]);
  uint64_t v22 = [MEMORY[0x263EFF910] date];
  uint64_t v23 = [NSString stringGUID];
  unint64_t v24 = (void *)[v21 initWithSender:0 time:v22 text:0 messageSubject:0 fileTransferGUIDs:0 flags:5 error:0 guid:v23 subject:0 balloonBundleID:v33 payloadData:v20 expressiveSendStyleID:0];

  if ([v11 joinState] != 3)
  {
    uint64_t v43 = 0;
    uint64_t v44 = &v43;
    uint64_t v45 = 0x2020000000;
    char v46 = 1;
    char v25 = [MEMORY[0x263F08A00] defaultCenter];
    unsigned int v26 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v27 = *MEMORY[0x263F4A478];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __ASSendRichMessagePayloadToDestination_block_invoke;
    v42[3] = &unk_2644E8EA8;
    v42[4] = &v43;
    id v28 = (id)[v25 addObserverForName:v27 object:0 queue:v26 usingBlock:v42];

    [v11 join];
    uint64_t v29 = [MEMORY[0x263EFF9F0] currentRunLoop];
    uint64_t v30 = *MEMORY[0x263EFF478];
    do
    {
      if (!*((unsigned char *)v44 + 24)) {
        break;
      }
      char v31 = [MEMORY[0x263EFF910] distantFuture];
      char v32 = [v29 runMode:v30 beforeDate:v31];
    }
    while ((v32 & 1) != 0);

    _Block_object_dispose(&v43, 8);
  }
  [v11 sendMessage:v24];
}

void sub_21EC9F37C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __ASSendRichMessagePayloadToDestination_block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

uint64_t ASCodableCloudKitNotificationEventReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((int)(v10 >> 3) <= 9) {
        break;
      }
      if (v18 != 10)
      {
        if (v18 != 11)
        {
LABEL_41:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          goto LABEL_54;
        }
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 40) |= 2u;
        while (1)
        {
          uint64_t v28 = *v3;
          uint64_t v29 = *(void *)(a2 + v28);
          unint64_t v30 = v29 + 1;
          if (v29 == -1 || v30 > *(void *)(a2 + *v4)) {
            break;
          }
          char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v2_Block_object_dispose(&STACK[0x200], 8) = v30;
          v21 |= (unint64_t)(v31 & 0x7F) << v26;
          if ((v31 & 0x80) == 0) {
            goto LABEL_48;
          }
          v26 += 7;
          BOOL v15 = v27++ >= 9;
          if (v15)
          {
            uint64_t v21 = 0;
            goto LABEL_50;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_48:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v21 = 0;
        }
LABEL_50:
        uint64_t v38 = 16;
LABEL_51:
        *(void *)(a1 + v3_Block_object_dispose(&STACK[0x200], 8) = v21;
        goto LABEL_54;
      }
      uint64_t v35 = PBReaderReadData();
      id v36 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v35;

LABEL_54:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    if (v18 == 1)
    {
      *(unsigned char *)(a1 + 40) |= 1u;
      uint64_t v32 = *v3;
      unint64_t v33 = *(void *)(a2 + v32);
      if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(void *)(a2 + *v4))
      {
        uint64_t v34 = *(void *)(*(void *)(a2 + *v7) + v33);
        *(void *)(a2 + v32) = v33 + 8;
      }
      else
      {
        *(unsigned char *)(a2 + *v5) = 1;
        uint64_t v34 = 0;
      }
      *(void *)(a1 + _Block_object_dispose(&STACK[0x200], 8) = v34;
      goto LABEL_54;
    }
    if (v18 != 2) {
      goto LABEL_41;
    }
    char v19 = 0;
    unsigned int v20 = 0;
    uint64_t v21 = 0;
    *(unsigned char *)(a1 + 40) |= 4u;
    while (1)
    {
      uint64_t v22 = *v3;
      uint64_t v23 = *(void *)(a2 + v22);
      unint64_t v24 = v23 + 1;
      if (v23 == -1 || v24 > *(void *)(a2 + *v4)) {
        break;
      }
      char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
      *(void *)(a2 + v22) = v24;
      v21 |= (unint64_t)(v25 & 0x7F) << v19;
      if ((v25 & 0x80) == 0) {
        goto LABEL_44;
      }
      v19 += 7;
      BOOL v15 = v20++ >= 9;
      if (v15)
      {
        uint64_t v21 = 0;
        goto LABEL_46;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_44:
    if (*(unsigned char *)(a2 + *v5)) {
      uint64_t v21 = 0;
    }
LABEL_46:
    uint64_t v38 = 24;
    goto LABEL_51;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL ASCodableCloudKitMigrationAvailableItemReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
LABEL_22:
        char v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&STACK[0x200], 8) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ASCodableInviteResponseReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
        goto LABEL_34;
      case 2u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 56) |= 2u;
        while (2)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
            *(void *)(a2 + v23) = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if (v25 < 0)
            {
              v20 += 7;
              BOOL v14 = v21++ >= 9;
              if (v14)
              {
                LODWORD(v22) = 0;
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_48:
        uint64_t v33 = 52;
        goto LABEL_53;
      case 3u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
        goto LABEL_34;
      case 4u:
        char v26 = objc_alloc_init(ASCodableShareLocations);
        objc_storeStrong((id *)(a1 + 40), v26);
        if (!PBReaderPlaceMark() || !ASCodableShareLocationsReadFrom((uint64_t)v26, a2)) {
          goto LABEL_56;
        }
        goto LABEL_44;
      case 5u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 24;
LABEL_34:
        unsigned int v27 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&STACK[0x200], 8) = v17;

        goto LABEL_54;
      case 6u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 56) |= 1u;
        while (2)
        {
          uint64_t v30 = *v3;
          unint64_t v31 = *(void *)(a2 + v30);
          if (v31 == -1 || v31 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
            *(void *)(a2 + v30) = v31 + 1;
            v22 |= (unint64_t)(v32 & 0x7F) << v28;
            if (v32 < 0)
            {
              v28 += 7;
              BOOL v14 = v29++ >= 9;
              if (v14)
              {
                LODWORD(v22) = 0;
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_52:
        uint64_t v33 = 48;
LABEL_53:
        *(_DWORD *)(a1 + v33) = v22;
        goto LABEL_54;
      case 7u:
        char v26 = objc_alloc_init(ASCodableActivityDataPreview);
        objc_storeStrong((id *)(a1 + 8), v26);
        if PBReaderPlaceMark() && (ASCodableActivityDataPreviewReadFrom((uint64_t)v26, a2))
        {
LABEL_44:
          PBReaderRecallMark();

LABEL_54:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_56:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_54;
    }
  }
}

uint64_t ASCodableContactListReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(ASCodableContact);
        [a1 addContacts:v17];
        if (!PBReaderPlaceMark() || !ASCodableContactReadFrom((id *)&v17->super.super.isa, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

__CFString *_ASCurrentDeviceString()
{
  return @"phone";
}

__CFString *_ASSourceString(uint64_t a1)
{
  id v1 = @"daemon";
  if (a1 == 2) {
    id v1 = @"app";
  }
  if (a1 == 1) {
    return @"bulletin";
  }
  else {
    return v1;
  }
}

__CFString *_ASBulletinTypeString(unint64_t a1)
{
  if (a1 > 8) {
    return @"goalCompletion";
  }
  else {
    return off_2644E8EE8[a1];
  }
}

uint64_t _ASCoreAnalyticsString(uint64_t a1)
{
  id v1 = @"daemon";
  if (a1 == 2) {
    id v1 = @"app";
  }
  if (a1 == 1) {
    uint64_t v2 = @"bulletin";
  }
  else {
    uint64_t v2 = v1;
  }
  return [NSString stringWithFormat:@"%@.%@.%@", @"com.apple.ActivitySharing", @"phone", v2];
}

void ASAnalyticsReportCompetitionRequestSendBulletin()
{
  _ASCoreAnalyticsString(1);
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  FIActivityAnalyticsSubmission();
}

void ASAnalyticsReportCompetitionRequestSendApp()
{
  _ASCoreAnalyticsString(2);
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  FIActivityAnalyticsSubmission();
}

void ASAnalyticsReportCompetitionRequestAccept(uint64_t a1)
{
  _ASCoreAnalyticsString(a1);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  FIActivityAnalyticsSubmission();
}

void ASAnalyticsReportCompetitionRequestIgnore(uint64_t a1)
{
  _ASCoreAnalyticsString(a1);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  FIActivityAnalyticsSubmission();
}

void ASAnalyticsReportSmackTalk(unint64_t a1)
{
  v6[2] = *MEMORY[0x263EF8340];
  if (a1 > 8) {
    id v1 = @"goalCompletion";
  }
  else {
    id v1 = off_2644E8EE8[a1];
  }
  uint64_t v2 = _ASCoreAnalyticsString(1);
  FIActivityAnalyticsSubmission();
  id v3 = [NSString stringWithFormat:@"%@Notification", @"phone"];
  v5[0] = @"activityType";
  v5[1] = @"source";
  v6[0] = v1;
  v6[1] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  FIActivityAnalyticsSubmissionWithPayload();
}

void ASAnalyticsUpdateWithFriends(void *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(v1, "hk_filter:", &__block_literal_global_16);
  id v3 = objc_msgSend(v1, "hk_filter:", &__block_literal_global_415);
  id v4 = objc_msgSend(v1, "hk_filter:", &__block_literal_global_417);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        unint64_t v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) completedCompetitions];
        v7 += [v10 count];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v11 = _ASCoreAnalyticsString(0);
  v21[0] = @"friends";
  unint64_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "count"));
  v22[0] = v12;
  v21[1] = @"currentCompetitions";
  char v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "count"));
  v22[1] = v13;
  v21[2] = @"friendsWithCompetitions";
  BOOL v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "count"));
  v22[2] = v14;
  v21[3] = @"completedCompetitions";
  int v15 = [NSNumber numberWithInteger:v7];
  v22[3] = v15;
  int v16 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
  FIActivityAnalyticsSubmissionWithPayload();
}

uint64_t __ASAnalyticsUpdateWithFriends_block_invoke(uint64_t a1, void *a2)
{
  return [a2 isFriendshipCurrentlyActive];
}

uint64_t __ASAnalyticsUpdateWithFriends_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isCompetitionActive];
}

uint64_t __ASAnalyticsUpdateWithFriends_block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 hasCompetitionHistory]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isCompetitionActive];
  }

  return v3;
}

void ASAnalyticsUpdateManateeStateWithFriends(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  v21[6] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a1;
  long long v19 = objc_msgSend(v8, "hk_filter:", &__block_literal_global_420);
  unsigned int v9 = objc_msgSend(v8, "hk_filter:", &__block_literal_global_422);

  unint64_t v10 = objc_msgSend(v7, "hk_filter:", &__block_literal_global_425);
  uint64_t v11 = objc_msgSend(v7, "hk_filter:", &__block_literal_global_430);

  v20[0] = @"totalFriendCount";
  unint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
  v21[0] = v12;
  v20[1] = @"migratedFriendCount";
  char v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v21[1] = v13;
  v20[2] = @"migrationEligible";
  BOOL v14 = [NSNumber numberWithBool:a2];
  v21[2] = v14;
  v20[3] = @"endToEndEncryptionEnabled";
  int v15 = [NSNumber numberWithBool:a3];
  v21[3] = v15;
  v20[4] = @"legacyPhoneCount";
  int v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  void v21[4] = v16;
  v20[5] = @"legacyWatchCount";
  long long v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v21[5] = v17;
  long long v18 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:6];
  FIActivityAnalyticsSubmissionWithPayload();
}

uint64_t __ASAnalyticsUpdateManateeStateWithFriends_block_invoke(uint64_t a1, void *a2)
{
  return [a2 isFriendshipCurrentlyActive];
}

BOOL __ASAnalyticsUpdateManateeStateWithFriends_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 contact];
  BOOL v3 = [v2 cloudType] == 1;

  return v3;
}

uint64_t __ASAnalyticsUpdateManateeStateWithFriends_block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 deviceType];
  uint64_t v3 = [v2 containsString:@"iOS"];

  return v3;
}

uint64_t __ASAnalyticsUpdateManateeStateWithFriends_block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 deviceType];
  uint64_t v3 = [v2 containsString:@"watchOS"];

  return v3;
}

void ASAnalyticsReportAddManateeContainer(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  v14[4] = *MEMORY[0x263EF8340];
  v13[0] = @"success";
  id v7 = NSNumber;
  id v8 = a3;
  id v9 = a2;
  unint64_t v10 = [v7 numberWithBool:a1];
  v14[0] = v10;
  v14[1] = v9;
  v13[1] = @"role";
  v13[2] = @"errorDomain";
  v14[2] = v8;
  v13[3] = @"errorCode";
  uint64_t v11 = [NSNumber numberWithInt:a4];
  v14[3] = v11;
  unint64_t v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  FIActivityAnalyticsSubmissionWithPayload();
}

void ASAnalyticsReportManateeMigration(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  v14[4] = *MEMORY[0x263EF8340];
  v13[0] = @"success";
  id v7 = NSNumber;
  id v8 = a3;
  id v9 = [v7 numberWithBool:a1];
  v14[0] = v9;
  v13[1] = @"friendCompletedMigration";
  unint64_t v10 = [NSNumber numberWithBool:a2];
  v14[1] = v10;
  v14[2] = v8;
  v13[2] = @"errorDomain";
  v13[3] = @"errorCode";
  uint64_t v11 = [NSNumber numberWithInt:a4];
  v14[3] = v11;
  unint64_t v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  FIActivityAnalyticsSubmissionWithPayload();
}

void ASAnalyticsReportManateeDowngrade(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  v14[4] = *MEMORY[0x263EF8340];
  v13[0] = @"success";
  id v7 = NSNumber;
  id v8 = a3;
  id v9 = [v7 numberWithBool:a1];
  v14[0] = v9;
  v13[1] = @"friendCompletedDowngrade";
  unint64_t v10 = [NSNumber numberWithBool:a2];
  v14[1] = v10;
  v14[2] = v8;
  v13[2] = @"errorDomain";
  v13[3] = @"errorCode";
  uint64_t v11 = [NSNumber numberWithInt:a4];
  v14[3] = v11;
  unint64_t v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  FIActivityAnalyticsSubmissionWithPayload();
}

BOOL ASCodableShareLocationsReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    id v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 3) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
LABEL_22:
        long long v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&STACK[0x200], 8) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void ASSecureUnarchiveClassWithDataAndStrictness_cold_1(void *a1, objc_class *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  uint64_t v6 = NSStringFromClass(a2);
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = a3;
  _os_log_error_impl(&dword_21EC60000, v5, OS_LOG_TYPE_ERROR, "Error unarchiving object of class %{public}@ error: %{public}@", v7, 0x16u);
}

void ASSecureUnarchiveClassesWithData_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_21EC60000, v1, OS_LOG_TYPE_ERROR, "Error unarchiving object of classes %{public}@ error: %{public}@", v2, 0x16u);
}

void ASCompetitionCalculateUpdatedScores_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_21EC60000, v0, v1, "Today summary: %@", v2, v3, v4, v5, v6);
}

void ASCompetitionCalculateUpdatedScores_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21EC60000, v0, v1, "Computed score is less than existing score, not updating", v2, v3, v4, v5, v6);
}

void ASCompetitionCalculateUpdatedScores_cold_3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_21EC60000, v0, v1, "Yesterday summary: %@", v2, v3, v4, v5, v6);
}

void ASValidateEligibilityForOutgoingCompetitionRequest_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21EC60000, v0, v1, "Unable to find contact to send competition request", v2, v3, v4, v5, v6);
}

void ASValidateEligibilityForOutgoingCompetitionRequest_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_21EC60000, v0, v1, "Competition is already active with contact: %@", v2, v3, v4, v5, v6);
}

void ASValidateEligibilityForOutgoingCompetitionRequest_cold_3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_21EC60000, v0, v1, "Activity data is currently hidden from contact: %@", v2, v3, v4, v5, v6);
}

void ASValidateEligibilityForOutgoingCompetitionRequest_cold_4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_21EC60000, v0, v1, "Contact does not support competitions: %@", v2, v3, v4, v5, v6);
}

void ASValidateEligibilityForIncomingCompetitionRequest_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21EC60000, v0, v1, "Unable to find contact for incoming request", v2, v3, v4, v5, v6);
}

void ASValidateEligibilityForIncomingCompetitionRequest_cold_3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_21EC60000, v0, v1, "Friendship is not active with contact: %@", v2, v3, v4, v5, v6);
}

void ASValidateEligibilityForAcceptingCompetitionRequest_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21EC60000, v0, v1, "Unable to find contact to accept competition request", v2, v3, v4, v5, v6);
}

void ASValidateEligibilityForAcceptingCompetitionRequest_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_21EC60000, v0, v1, "Competiton is already active with contact: %@", v2, v3, v4, v5, v6);
}

void ASValidateEligibilityForAcceptingCompetitionRequest_cold_4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_21EC60000, v0, v1, "No incoming request on contact: %@", v2, v3, v4, v5, v6);
}

void __ASCompetitionsEligibleForArchival_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_21EC60000, v0, v1, "Competition lastPushedCacheIndex is zero, not eligible: %@", v2, v3, v4, v5, v6);
}

void __ASCompetitionsEligibleForArchival_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_21EC60000, v0, v1, "Competition lastPushedCacheIndex is less than endDate, not eligible: %@", v2, v3, v4, v5, v6);
}

void ASFriendAchievementFromTemplateAndEarnedInstance_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASFriendAchievementFromTemplateAndEarnedInstance_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21EC60000, log, OS_LOG_TYPE_ERROR, "Achievement template missing canonical unit when creating friend achievement", v1, 2u);
}

void ASFriendAchievementFromTemplateAndEarnedInstance_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASFriendAchievementFromTemplateAndEarnedInstance_cold_5(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21EC60000, log, OS_LOG_TYPE_ERROR, "Achievement template canonical unit not compatible with earned instance value when creating friend achievement", v1, 2u);
}

void ASSendRichMessagePayloadToDestination_cold_1()
{
}

void ASSendRichMessagePayloadToDestination_cold_2()
{
}

void ASSendRichMessagePayloadToDestination_cold_3()
{
}

void ASSendRichMessagePayloadToDestination_cold_4()
{
}

uint64_t ACHApplyBadgePropertiesToAchievement()
{
  return MEMORY[0x270F0A5B8]();
}

uint64_t ACHIsActivityAchievementSharable()
{
  return MEMORY[0x270F0A698]();
}

uint64_t ACHLegacyDefinitionIdentifierForTemplateUniqueName()
{
  return MEMORY[0x270F0A6B0]();
}

uint64_t ACHShouldUseNewAwardsSystem()
{
  return MEMORY[0x270F0A7B0]();
}

uint64_t ACHTemplateUniqueNameForLegacyAchievementInfo()
{
  return MEMORY[0x270F0A818]();
}

uint64_t ACHWorkoutActivityTypeForTemplateUniqueName()
{
  return MEMORY[0x270F0A838]();
}

uint64_t DailyExerciseRecordTemplate()
{
  return MEMORY[0x270F0A890]();
}

uint64_t DailyMoveRecordTemplate()
{
  return MEMORY[0x270F0A898]();
}

uint64_t FIActivityAnalyticsSubmission()
{
  return MEMORY[0x270F29900]();
}

uint64_t FIActivityAnalyticsSubmissionWithPayload()
{
  return MEMORY[0x270F29908]();
}

uint64_t FirstWorkoutTemplateForWorkoutActivityType()
{
  return MEMORY[0x270F0A8F8]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x270EF3660]();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x270F3C980]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x270F3C988]();
}

uint64_t IDSCopyIDForPhoneNumberWithOptions()
{
  return MEMORY[0x270F3C990]();
}

uint64_t IDSCopyRawAddressForDestination()
{
  return MEMORY[0x270F3C9B0]();
}

uint64_t LongestMoveStreakTemplate()
{
  return MEMORY[0x270F0A958]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MoveGoal200PercentTemplate()
{
  return MEMORY[0x270F0A968]();
}

uint64_t MoveGoal300PercentTemplate()
{
  return MEMORY[0x270F0A970]();
}

uint64_t MoveGoal400PercentTemplate()
{
  return MEMORY[0x270F0A978]();
}

uint64_t NRVersionIsGreaterThanOrEqual()
{
  return MEMORY[0x270F4D8B0]();
}

uint64_t NRWatchOSVersionForRemoteDevice()
{
  return MEMORY[0x270F4D8C0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t NewMoveGoalAchievedTemplate()
{
  return MEMORY[0x270F0A980]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x270F58540]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x270F58548]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x270F58568]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x270F585A0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x270F585B0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x270F585D8]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x270F585E0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x270F585F8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x270F58680]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x270F58688]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x270F58690]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x270F58698]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x270F586A0]();
}

uint64_t PBRepeatedInt32NSArray()
{
  return MEMORY[0x270F586A8]();
}

uint64_t PBRepeatedInt64Add()
{
  return MEMORY[0x270F586B8]();
}

uint64_t PBRepeatedInt64Clear()
{
  return MEMORY[0x270F586C0]();
}

uint64_t PBRepeatedInt64Copy()
{
  return MEMORY[0x270F586C8]();
}

uint64_t PBRepeatedInt64Hash()
{
  return MEMORY[0x270F586D0]();
}

uint64_t PBRepeatedInt64IsEqual()
{
  return MEMORY[0x270F586D8]();
}

uint64_t PBRepeatedInt64NSArray()
{
  return MEMORY[0x270F586E0]();
}

uint64_t PerfectWeekAllTemplate()
{
  return MEMORY[0x270F0A9A8]();
}

uint64_t PerfectWeekExerciseTemplate()
{
  return MEMORY[0x270F0A9B0]();
}

uint64_t PerfectWeekMoveTemplate()
{
  return MEMORY[0x270F0A9B8]();
}

uint64_t PerfectWeekStandTemplate()
{
  return MEMORY[0x270F0A9C0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKActivityCacheDateComponentsFromCacheIndex()
{
  return MEMORY[0x270EF38F8]();
}

uint64_t _HKActivityCacheDateComponentsFromDate()
{
  return MEMORY[0x270EF3900]();
}

uint64_t _HKCacheIndexFromDate()
{
  return MEMORY[0x270EF3920]();
}

uint64_t _HKCacheIndexFromDateComponents()
{
  return MEMORY[0x270EF3928]();
}

uint64_t _HKEndDateForSnapshotIndex()
{
  return MEMORY[0x270EF3950]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x270EF3978]();
}

uint64_t _HKMostRecentActivitySnapshotInSnapshots()
{
  return MEMORY[0x270EF3998]();
}

uint64_t _HKStartDateForSnapshotIndex()
{
  return MEMORY[0x270EF39B0]();
}

uint64_t _HKWorkoutActivityTypeIsValid()
{
  return MEMORY[0x270EF39E8]();
}

uint64_t _HKWorkoutCanonicalDistanceUnit()
{
  return MEMORY[0x270EF39F0]();
}

uint64_t _HKWorkoutCanonicalEnergyBurnedUnit()
{
  return MEMORY[0x270EF39F8]();
}

uint64_t _HKWorkoutCanonicalUnitForGoalType()
{
  return MEMORY[0x270EF3A00]();
}

uint64_t _HKWorkoutGoalTypeIsValidForGoal()
{
  return MEMORY[0x270EF3A18]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}