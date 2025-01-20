@interface BMItemType
+ (BMItemType)alarmSnoozedAny;
+ (BMItemType)alarmSnoozedWithID;
+ (BMItemType)alarmStoppedAny;
+ (BMItemType)alarmStoppedWithID;
+ (BMItemType)appActivityType;
+ (BMItemType)appInFocus;
+ (BMItemType)appIntentAutomationHash;
+ (BMItemType)appIntentClass;
+ (BMItemType)appLaunchedReason;
+ (BMItemType)appOpened;
+ (BMItemType)bluetoothConnectedToDevice;
+ (BMItemType)bluetoothConnectedToDeviceWithAddress;
+ (BMItemType)bluetoothConnectedToDeviceWithName;
+ (BMItemType)bundleIdOfHostOpenedShareExtension;
+ (BMItemType)bundleIdOfShareExtensionOpened;
+ (BMItemType)connectedToCarPlay;
+ (BMItemType)connectedToExternalAudioOutput;
+ (BMItemType)dayOfWeek;
+ (BMItemType)enterLocation;
+ (BMItemType)exitLocation;
+ (BMItemType)firstBacklightAfterWakeup;
+ (BMItemType)hourOfDay;
+ (BMItemType)hourOfDaySlot;
+ (BMItemType)interactionContentURL;
+ (BMItemType)interactionDirection;
+ (BMItemType)interactionExtractedTopicFromAttachment;
+ (BMItemType)interactionMechanism;
+ (BMItemType)interactionPhotoContact;
+ (BMItemType)interactionPhotoLocation;
+ (BMItemType)interactionPhotoScene;
+ (BMItemType)interactionRecipients;
+ (BMItemType)interactionSender;
+ (BMItemType)interactionSharingSourceBundleID;
+ (BMItemType)interactionTargetBundleID;
+ (BMItemType)interactionTextTopic;
+ (BMItemType)interactionUTIType;
+ (BMItemType)isWeekend;
+ (BMItemType)locationIdentifier;
+ (BMItemType)mediaGenreStartedPlaying;
+ (BMItemType)mediaIsPlaying;
+ (BMItemType)relevanceAppActivityHash;
+ (BMItemType)relevanceCoarseAppActivityHash;
+ (BMItemType)relevanceCoarseIntentHash;
+ (BMItemType)relevanceIntentHash;
+ (BMItemType)toggledAirplaneMode;
+ (BMItemType)toggledDoNotDisturb;
+ (BMItemType)toggledLowPowerMode;
+ (BMItemType)wifiConnectedToSSID;
+ (BMItemType)wifiDisconnectedFromSSID;
+ (BMItemType)wifiIsConnectedToSSID;
+ (BOOL)supportsSecureCoding;
+ (NSMutableSet)allRegisteredItemTypes;
+ (NSSet)allItemTypes;
+ (NSSet)interactionItemTypes;
+ (NSSet)temporalItemTypes;
+ (id)allItemTypesDictionary;
+ (id)taskSpecificItemWithIdentifier:(id)a3 valueClass:(Class)a4;
+ (void)registerItemType:(id)a3;
+ (void)unregisterItemType:(id)a3;
- (BMItemType)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (Class)valueClass;
- (NSString)identifier;
- (_DKEventStream)eventStream;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)extractEventFromDKEvent:(id)a3;
- (id)extractItemFromDKEvent:(id)a3;
- (id)extractValueFromDKEvent:(id)a3;
- (id)valueExtractBlock;
- (int64_t)edge;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEdge:(int64_t)a3;
- (void)setEventStream:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setValueClass:(Class)a3;
- (void)setValueExtractBlock:(id)a3;
@end

@implementation BMItemType

+ (BMItemType)toggledDoNotDisturb
{
  v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"ToggledDoNotDisturb"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  v3 = [MEMORY[0x263F35148] doNotDisturbStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global];

  return v2;
}

uint64_t __47__BMItemType_DoNotDisturb__toggledDoNotDisturb__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 BOOLValue];

  return [v2 numberWithBool:v3];
}

+ (BMItemType)appIntentClass
{
  v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"AppIntentClass"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] appIntentsStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_0];

  return v2;
}

id __37__BMItemType_Intents__appIntentClass__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 metadata];
  v4 = [MEMORY[0x263F350A8] intentClass];
  v5 = [v3 objectForKeyedSubscript:v4];

  if (v5 && ([v5 isEqualToString:@"INSendMessageIntent"] & 1) == 0)
  {
    v7 = NSString;
    v8 = [v2 source];
    v9 = [v8 bundleID];
    v6 = [v7 stringWithFormat:@"%@:%@", v9, v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BMItemType)appIntentAutomationHash
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"AppIntentAutomationHash"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] appIntentsStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_15];

  return v2;
}

id __46__BMItemType_Intents__appIntentAutomationHash__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v24 = a2;
  v25 = [v24 interaction];
  if ([v25 direction] == 2)
  {
    id v2 = 0;
    goto LABEL_22;
  }
  uint64_t v3 = [v24 metadata];
  v4 = [MEMORY[0x263F350A8] intentClass];
  v23 = [v3 objectForKeyedSubscript:v4];

  if (v23)
  {
    v5 = [v25 intent];
    v6 = INIntentWithTypedIntent();

    if ([v6 _isEligibleForSuggestions])
    {
      v7 = [v6 _parameterCombinations];
      id v2 = (void *)[v7 count];

      if (v2)
      {
        id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        v9 = [v6 _validParameterCombinations];
        char v10 = 0;
        uint64_t v11 = [v9 countByEnumeratingWithState:&v46 objects:v50 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v47 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v46 + 1) + 8 * i);
              v15 = [v6 _validParameterCombinations];
              v16 = [v15 objectForKey:v14];

              [v8 unionSet:v14];
              LOBYTE(v14) = [v16 isPrimary];

              v10 |= v14;
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v46 objects:v50 count:16];
          }
          while (v11);
        }

        uint64_t v40 = 0;
        v41 = &v40;
        uint64_t v42 = 0x3032000000;
        v43 = __Block_byref_object_copy_;
        v44 = __Block_byref_object_dispose_;
        id v45 = 0;
        uint64_t v34 = 0;
        v35 = &v34;
        uint64_t v36 = 0x3032000000;
        v37 = __Block_byref_object_copy_;
        v38 = __Block_byref_object_dispose_;
        id v39 = 0;
        v32[0] = 0;
        v32[1] = v32;
        v32[2] = 0x2020000000;
        BOOL v33 = (v10 & 1) == 0;
        v17 = [v6 _validParameterCombinations];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __46__BMItemType_Intents__appIntentAutomationHash__block_invoke_17;
        v26[3] = &unk_2645468B0;
        v28 = v32;
        v29 = &v40;
        v6 = v6;
        v27 = v6;
        v30 = &v34;
        char v31 = v10 & 1;
        [v17 enumerateKeysAndObjectsUsingBlock:v26];
        if (v41[5] && v35[5])
        {
          v18 = NSString;
          v19 = [v24 source];
          v20 = [v19 bundleID];
          v21 = [(id)v41[5] debugDescription];
          id v2 = [v18 stringWithFormat:@"%@:%@:%@", v20, v21, v35[5]];
        }
        else
        {
          id v2 = 0;
        }

        _Block_object_dispose(v32, 8);
        _Block_object_dispose(&v34, 8);

        _Block_object_dispose(&v40, 8);
      }
      goto LABEL_21;
    }
  }
  else
  {
    v6 = BMLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46__BMItemType_Intents__appIntentAutomationHash__block_invoke_cold_1((uint64_t)v24, v6);
    }
  }
  id v2 = 0;
LABEL_21:

LABEL_22:

  return v2;
}

void __46__BMItemType_Intents__appIntentAutomationHash__block_invoke_17(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a2;
  if (([a3 isPrimary] & 1) != 0
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    && (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count]
     || (unint64_t v22 = [v8 count],
         v22 > [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    v9 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          v16 = [*(id *)(a1 + 32) valueForKey:v15];
          [v9 setObject:v16 forKeyedSubscript:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v12);
    }

    id v23 = 0;
    uint64_t v17 = [MEMORY[0x263F34F88] md5forDictionary:v9 error:&v23];
    id v18 = v23;
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
    v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v17;

    if (v18)
    {
      v21 = BMLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __46__BMItemType_Intents__appIntentAutomationHash__block_invoke_17_cold_1(a1, v21);
      }
    }
    if ([v8 containsObject:@"content"])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    else if (*(unsigned char *)(a1 + 64))
    {
      *a4 = 1;
    }
  }
}

+ (BMItemType)relevanceIntentHash
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"RelevanceIntentHash"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] appIntentsStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_31];

  return v2;
}

id __42__BMItemType_Intents__relevanceIntentHash__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 interaction];
  v4 = [v3 intent];
  v5 = BMCreateShortcutFilter();
  v6 = [v5 intentByFilteringIntent:v4 withLevel:0];

  v7 = 0;
  if (v5 && v6)
  {
    id v8 = [v2 value];
    v9 = [v8 stringValue];
    v7 = [v5 identifierForIntent:v6 bundleIdentifier:v9];
  }

  return v7;
}

+ (BMItemType)relevanceCoarseIntentHash
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"RelevanceCoarseIntentHash"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] appIntentsStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_36];

  return v2;
}

id __48__BMItemType_Intents__relevanceCoarseIntentHash__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 interaction];
  v4 = [v3 intent];
  v5 = BMCreateShortcutFilter();
  v6 = [v5 intentByFilteringIntent:v4 withLevel:0];

  v7 = 0;
  if (v5 && v6)
  {
    id v8 = [v2 value];
    v9 = [v8 stringValue];
    v7 = [v5 identifierForIntent:v6 bundleIdentifier:v9];
  }

  return v7;
}

+ (BMItemType)appActivityType
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"AppActivityType"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] appActivityStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_1];

  return v2;
}

id __42__BMItemType_AppActivity__appActivityType__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = (void *)MEMORY[0x223C621B0]();
  v4 = [v2 stringValue];
  v5 = v4;
  if (!v4
    || ([v4 isEqualToString:@"com.apple.mobilemail"] & 1) != 0
    || ([v5 isEqualToString:@"com.apple.mobilesafari"] & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    id v8 = [v2 metadata];
    v9 = [MEMORY[0x263F35020] isEligibleForPrediction];
    id v10 = [v8 objectForKeyedSubscript:v9];

    if (![v10 BOOLValue]) {
      goto LABEL_11;
    }
    uint64_t v11 = [v2 metadata];
    uint64_t v12 = [MEMORY[0x263F35020] activityType];
    uint64_t v13 = [v11 objectForKeyedSubscript:v12];

    if (v13)
    {
      v6 = [NSString stringWithFormat:@"%@:%@", v5, v13];
    }
    else
    {
LABEL_11:
      v6 = 0;
    }
  }

  return v6;
}

+ (BMItemType)relevanceAppActivityHash
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"RelevanceAppActivityHash"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] appActivityStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_18];

  return v2;
}

id __51__BMItemType_AppActivity__relevanceAppActivityHash__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 metadata];
  v4 = [MEMORY[0x263F35020] userActivityRequiredString];
  v5 = [v3 objectForKeyedSubscript:v4];

  v6 = (void *)[objc_alloc(MEMORY[0x263F018D0]) _initWithUserActivityStrings:v5 secondaryString:0 optionalData:0];
  v7 = BMCreateShortcutFilter();
  id v8 = [v7 userActivityByFilteringUserActivity:v6 withLevel:0];

  v9 = 0;
  if (v7 && v8)
  {
    id v10 = [v2 value];
    uint64_t v11 = [v10 stringValue];
    v9 = [v7 identifierForUserActivity:v8 bundleIdentifier:v11];
  }

  return v9;
}

+ (BMItemType)relevanceCoarseAppActivityHash
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"RelevanceCoarseAppActivityHash"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] appActivityStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_23];

  return v2;
}

id __57__BMItemType_AppActivity__relevanceCoarseAppActivityHash__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 metadata];
  v4 = [MEMORY[0x263F35020] userActivityRequiredString];
  v5 = [v3 objectForKeyedSubscript:v4];

  v6 = (void *)[objc_alloc(MEMORY[0x263F018D0]) _initWithUserActivityStrings:v5 secondaryString:0 optionalData:0];
  v7 = BMCreateShortcutFilter();
  id v8 = [v7 userActivityByFilteringUserActivity:v6 withLevel:0];

  v9 = 0;
  if (v7 && v8)
  {
    id v10 = [v2 value];
    uint64_t v11 = [v10 stringValue];
    v9 = [v7 identifierForUserActivity:v8 bundleIdentifier:v11];
  }

  return v9;
}

+ (BMItemType)toggledLowPowerMode
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"ToggledLowPowerMode"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] deviceLowPowerModeStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_2];

  return v2;
}

uint64_t __47__BMItemType_LowPowerMode__toggledLowPowerMode__block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 BOOLValue];

  return [v2 numberWithBool:v3];
}

+ (BMItemType)firstBacklightAfterWakeup
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"FirstBacklightAfterWakeup"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] userIsFirstBacklightOnAfterWakeup];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_3];

  return v2;
}

id __45__BMItemType_User__firstBacklightAfterWakeup__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 BOOLValue]) {
    id v2 = (void *)MEMORY[0x263EFFA88];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

+ (BMItemType)bluetoothConnectedToDevice
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"BluetoothConnectedToDevice"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] bluetoothIsConnectedStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_4];

  return v2;
}

id __51__BMItemType_Bluetooth__bluetoothConnectedToDevice__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 metadata];
  uint64_t v3 = [MEMORY[0x263F35048] deviceType];
  v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

+ (BMItemType)bluetoothConnectedToDeviceWithName
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"BluetoothConnectedToDeviceWithName"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] bluetoothIsConnectedStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_11];

  return v2;
}

id __59__BMItemType_Bluetooth__bluetoothConnectedToDeviceWithName__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 metadata];
  uint64_t v3 = [MEMORY[0x263F35048] name];
  v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

+ (BMItemType)bluetoothConnectedToDeviceWithAddress
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"BluetoothConnectedToDeviceWithAddress"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] bluetoothIsConnectedStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_16];

  return v2;
}

id __62__BMItemType_Bluetooth__bluetoothConnectedToDeviceWithAddress__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 metadata];
  uint64_t v3 = [MEMORY[0x263F35048] address];
  v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

+ (BMItemType)mediaIsPlaying
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"MediaIsPlaying"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:1];
  uint64_t v3 = [MEMORY[0x263F35148] nowPlayingStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_5];

  return v2;
}

uint64_t __35__BMItemType_Media__mediaIsPlaying__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 metadata];
  uint64_t v3 = [MEMORY[0x263F350F0] playing];
  v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = [v4 integerValue];

  if (v5 == 1) {
    return MEMORY[0x263EFFA88];
  }
  else {
    return 0;
  }
}

+ (BMItemType)mediaGenreStartedPlaying
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"MediaGenreStartedPlaying"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] nowPlayingStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_11_0];

  return v2;
}

id __45__BMItemType_Media__mediaGenreStartedPlaying__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 metadata];
  uint64_t v3 = [MEMORY[0x263F350F0] genre];
  v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

+ (BMItemType)hourOfDay
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"HourOfDay"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:1];

  return v2;
}

+ (BMItemType)hourOfDaySlot
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"HourOfDaySlot"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:1];

  return v2;
}

+ (BMItemType)dayOfWeek
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"DayOfWeek"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:1];

  return v2;
}

+ (BMItemType)isWeekend
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"IsWeekend"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:1];

  return v2;
}

+ (NSSet)temporalItemTypes
{
  id v2 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v3 = +[BMItemType hourOfDay];
  v4 = +[BMItemType hourOfDaySlot];
  uint64_t v5 = +[BMItemType dayOfWeek];
  v6 = +[BMItemType isWeekend];
  v7 = objc_msgSend(v2, "initWithObjects:", v3, v4, v5, v6, 0);

  return (NSSet *)v7;
}

+ (BMItemType)appOpened
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"AppOpened"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] appInFocusStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_6];

  return v2;
}

id __35__BMItemType_AppInFocus__appOpened__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (BMIsNotAppExtension(v2))
  {
    uint64_t v3 = [v2 value];
    v4 = [v3 stringValue];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BMItemType)appLaunchedReason
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"AppLaunchedReason"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] appInFocusStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_9];

  return v2;
}

id __43__BMItemType_AppInFocus__appLaunchedReason__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (BMIsNotAppExtension(v2))
  {
    uint64_t v3 = [v2 metadata];
    v4 = [MEMORY[0x263F35028] launchReason];
    uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (BMItemType)appInFocus
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"AppInFocus"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:1];
  uint64_t v3 = [MEMORY[0x263F35148] appInFocusStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_14];

  return v2;
}

id __36__BMItemType_AppInFocus__appInFocus__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (BMIsNotAppExtension(v2))
  {
    uint64_t v3 = [v2 value];
    v4 = [v3 stringValue];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BMItemType)bundleIdOfShareExtensionOpened
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"ShareExtensionOpened"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] appInFocusStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_19];

  return v2;
}

id __56__BMItemType_AppInFocus__bundleIdOfShareExtensionOpened__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (BMIsShareExtension(v2))
  {
    uint64_t v3 = [v2 stringValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

+ (BMItemType)bundleIdOfHostOpenedShareExtension
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"AppHostOpenedShareExtension"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] appInFocusStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_24];

  return v2;
}

id __60__BMItemType_AppInFocus__bundleIdOfHostOpenedShareExtension__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (BMIsShareExtension(v2))
  {
    uint64_t v3 = [v2 metadata];
    v4 = [MEMORY[0x263F35028] extensionHostIdentifier];
    uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (BMItemType)alarmSnoozedAny
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"AlarmSnoozedAny"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] alarmStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_7];

  return v2;
}

__CFString *__36__BMItemType_Alarm__alarmSnoozedAny__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 value];
  uint64_t v3 = [MEMORY[0x263F34FF0] snoozed];
  if ([v2 isEqual:v3]) {
    v4 = @"ANY";
  }
  else {
    v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

+ (BMItemType)alarmStoppedAny
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"AlarmStoppedAny"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] alarmStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_12];

  return v2;
}

__CFString *__36__BMItemType_Alarm__alarmStoppedAny__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 value];
  uint64_t v3 = [MEMORY[0x263F34FF0] stopped];
  if ([v2 isEqual:v3]) {
    v4 = @"ANY";
  }
  else {
    v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

+ (BMItemType)alarmSnoozedWithID
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"AlarmSnoozedWithID"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] alarmStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_17];

  return v2;
}

id __39__BMItemType_Alarm__alarmSnoozedWithID__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 metadata];
  v4 = [MEMORY[0x263F34FE8] isSleep];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  v6 = @"WAKEUP";
  if (!v5) {
    v6 = @"EXISTING";
  }
  v7 = v6;

  id v8 = NSString;
  v9 = [v2 metadata];
  id v10 = [MEMORY[0x263F34FE8] alarmID];
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];
  uint64_t v12 = [v8 stringWithFormat:@"%@:%@", v7, v11];

  uint64_t v13 = [v2 value];

  uint64_t v14 = [MEMORY[0x263F34FF0] snoozed];
  if ([v13 isEqual:v14]) {
    uint64_t v15 = v12;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;

  return v16;
}

+ (BMItemType)alarmStoppedWithID
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"AlarmStoppedWithID"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] alarmStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_32];

  return v2;
}

id __39__BMItemType_Alarm__alarmStoppedWithID__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 metadata];
  v4 = [MEMORY[0x263F34FE8] isSleep];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  v6 = @"WAKEUP";
  if (!v5) {
    v6 = @"EXISTING";
  }
  v7 = v6;

  id v8 = NSString;
  v9 = [v2 metadata];
  id v10 = [MEMORY[0x263F34FE8] alarmID];
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];
  uint64_t v12 = [v8 stringWithFormat:@"%@:%@", v7, v11];

  uint64_t v13 = [v2 value];

  uint64_t v14 = [MEMORY[0x263F34FF0] stopped];
  if ([v13 isEqual:v14]) {
    uint64_t v15 = v12;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;

  return v16;
}

+ (BMItemType)connectedToCarPlay
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"ConnectedToCarPlay"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] carPlayIsConnectedStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_8];

  return v2;
}

uint64_t __41__BMItemType_CarPlay__connectedToCarPlay__block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 BOOLValue];

  return [v2 numberWithBool:v3];
}

+ (BMItemType)locationIdentifier
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"CoreRoutineLocationIdentifier"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:1];
  [(BMItemType *)v2 setEventStream:0];
  [(BMItemType *)v2 setValueExtractBlock:0];

  return v2;
}

+ (BMItemType)enterLocation
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"CoreRoutineEnterLocation"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  [(BMItemType *)v2 setEventStream:0];
  [(BMItemType *)v2 setValueExtractBlock:0];

  return v2;
}

+ (BMItemType)exitLocation
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"CoreRoutineExitLocation"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:2];
  [(BMItemType *)v2 setEventStream:0];
  [(BMItemType *)v2 setValueExtractBlock:0];

  return v2;
}

+ (BMItemType)interactionMechanism
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"InteractionMechanism"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  [(BMItemType *)v2 setEventStream:0];
  [(BMItemType *)v2 setValueExtractBlock:0];

  return v2;
}

+ (BMItemType)interactionDirection
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"InteractionDirection"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  [(BMItemType *)v2 setEventStream:0];
  [(BMItemType *)v2 setValueExtractBlock:0];

  return v2;
}

+ (BMItemType)interactionContentURL
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"InteractionContentURL"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  [(BMItemType *)v2 setEventStream:0];
  [(BMItemType *)v2 setValueExtractBlock:0];

  return v2;
}

+ (BMItemType)interactionSender
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"InteractionSender"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  [(BMItemType *)v2 setEventStream:0];
  [(BMItemType *)v2 setValueExtractBlock:0];

  return v2;
}

+ (BMItemType)interactionRecipients
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"InteractionRecipients"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  [(BMItemType *)v2 setEventStream:0];
  [(BMItemType *)v2 setValueExtractBlock:0];

  return v2;
}

+ (BMItemType)interactionPhotoScene
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"InteractionPhotoScene"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  [(BMItemType *)v2 setEventStream:0];
  [(BMItemType *)v2 setValueExtractBlock:0];

  return v2;
}

+ (BMItemType)interactionPhotoContact
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"InteractionPhotoContact"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  [(BMItemType *)v2 setEventStream:0];
  [(BMItemType *)v2 setValueExtractBlock:0];

  return v2;
}

+ (BMItemType)interactionPhotoLocation
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"InteractionPhotoLocation"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  [(BMItemType *)v2 setEventStream:0];
  [(BMItemType *)v2 setValueExtractBlock:0];

  return v2;
}

+ (BMItemType)interactionUTIType
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"InteractionUTIType"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  [(BMItemType *)v2 setEventStream:0];
  [(BMItemType *)v2 setValueExtractBlock:0];

  return v2;
}

+ (BMItemType)interactionTextTopic
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"InteractionTextTopic"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  [(BMItemType *)v2 setEventStream:0];
  [(BMItemType *)v2 setValueExtractBlock:0];

  return v2;
}

+ (BMItemType)interactionSharingSourceBundleID
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"InteractionSharingSourceBundleID"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  [(BMItemType *)v2 setEventStream:0];
  [(BMItemType *)v2 setValueExtractBlock:0];

  return v2;
}

+ (BMItemType)interactionTargetBundleID
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"InteractionTargetBundleID"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  [(BMItemType *)v2 setEventStream:0];
  [(BMItemType *)v2 setValueExtractBlock:0];

  return v2;
}

+ (BMItemType)interactionExtractedTopicFromAttachment
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"InteractionExtractedTopicFromAttachment"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  [(BMItemType *)v2 setEventStream:0];
  [(BMItemType *)v2 setValueExtractBlock:0];

  return v2;
}

+ (NSSet)interactionItemTypes
{
  uint64_t v15 = (void *)MEMORY[0x263EFFA08];
  id v18 = [a1 interactionMechanism];
  uint64_t v17 = [a1 interactionDirection];
  uint64_t v3 = [a1 interactionContentURL];
  uint64_t v14 = [a1 interactionSender];
  uint64_t v13 = [a1 interactionRecipients];
  v4 = [a1 interactionPhotoScene];
  uint64_t v5 = [a1 interactionPhotoContact];
  v6 = [a1 interactionPhotoLocation];
  v7 = [a1 interactionUTIType];
  id v8 = [a1 interactionTextTopic];
  v9 = [a1 interactionSharingSourceBundleID];
  id v10 = [a1 interactionTargetBundleID];
  uint64_t v11 = [a1 interactionExtractedTopicFromAttachment];
  id v16 = objc_msgSend(v15, "setWithObjects:", v18, v17, v3, v14, v13, v4, v5, v6, v7, v8, v9, v10, v11, 0);

  return (NSSet *)v16;
}

+ (BMItemType)connectedToExternalAudioOutput
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"ConnectedToExternalAudioOutput"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] audioOutputRouteStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_10];

  return v2;
}

id __51__BMItemType_Audio__connectedToExternalAudioOutput__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 value];
  uint64_t v3 = [MEMORY[0x263F35038] external];
  if ([v2 isEqual:v3]) {
    v4 = (void *)MEMORY[0x263EFFA88];
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

+ (id)taskSpecificItemWithIdentifier:(id)a3 valueClass:(Class)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(BMItemType);
  [(BMItemType *)v6 setIdentifier:v5];

  [(BMItemType *)v6 setValueClass:a4];
  [(BMItemType *)v6 setEdge:1];
  [(BMItemType *)v6 setEventStream:0];
  [(BMItemType *)v6 setValueExtractBlock:0];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(BMItemType);
  id v5 = [(BMItemType *)self identifier];
  [(BMItemType *)v4 setIdentifier:v5];

  [(BMItemType *)v4 setValueClass:[(BMItemType *)self valueClass]];
  [(BMItemType *)v4 setEdge:[(BMItemType *)self edge]];
  v6 = [(BMItemType *)self eventStream];
  [(BMItemType *)v4 setEventStream:v6];

  v7 = [(BMItemType *)self valueExtractBlock];
  [(BMItemType *)v4 setValueExtractBlock:v7];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BMItemType *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(BMItemType *)self identifier];
      v7 = [(BMItemType *)v5 identifier];

      char v8 = [v6 isEqualToString:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  id v2 = [(BMItemType *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(BMItemType *)self identifier];
  v6 = [v3 stringWithFormat:@"<%@: %p> identifier: %@", v4, self, v5];

  return v6;
}

- (id)extractValueFromDKEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(BMItemType *)self eventStream];
  v6 = [v4 stream];
  if (([v5 isEqual:v6] & 1) == 0)
  {

    char v8 = 0;
    goto LABEL_5;
  }
  v7 = [(BMItemType *)self valueExtractBlock];

  if (v7)
  {
    id v5 = [(BMItemType *)self valueExtractBlock];
    char v8 = ((void (**)(void, id))v5)[2](v5, v4);
LABEL_5:

    goto LABEL_7;
  }
  char v8 = 0;
LABEL_7:

  return v8;
}

- (id)extractItemFromDKEvent:(id)a3
{
  id v4 = [(BMItemType *)self extractValueFromDKEvent:a3];
  if (v4) {
    id v5 = [[BMItem alloc] initWithType:self value:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)extractEventFromDKEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(BMItemType *)self extractItemFromDKEvent:v4];
  if (!v5)
  {
    id v10 = 0;
    goto LABEL_9;
  }
  v6 = [v4 startDate];
  id v7 = [v4 endDate];
  int64_t v8 = [(BMItemType *)self edge];
  if (!v8)
  {
    v9 = v6;
    v6 = v7;
    goto LABEL_7;
  }
  if (v8 == 2)
  {
    v9 = v7;
LABEL_7:
    id v7 = v9;

    v6 = v7;
  }
  id v10 = [[BMEvent alloc] initWithStartDate:v6 endDate:v7 item:v5];

LABEL_9:

  return v10;
}

+ (NSMutableSet)allRegisteredItemTypes
{
  id v2 = a1;
  objc_sync_enter(v2);
  unint64_t v3 = (void *)_allRegisteredItemTypes;
  if (!_allRegisteredItemTypes)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v5 = (void *)_allRegisteredItemTypes;
    _allRegisteredItemTypes = (uint64_t)v4;

    unint64_t v3 = (void *)_allRegisteredItemTypes;
  }
  id v6 = v3;
  objc_sync_exit(v2);

  return (NSMutableSet *)v6;
}

+ (void)registerItemType:(id)a3
{
  id v6 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  if (v6)
  {
    id v5 = [v4 allRegisteredItemTypes];
    [v5 addObject:v6];
  }
  objc_sync_exit(v4);
}

+ (void)unregisterItemType:(id)a3
{
  id v6 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  if (v6)
  {
    id v5 = [v4 allRegisteredItemTypes];
    [v5 removeObject:v6];
  }
  objc_sync_exit(v4);
}

+ (NSSet)allItemTypes
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__BMItemType_allItemTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allItemTypes_onceToken != -1) {
    dispatch_once(&allItemTypes_onceToken, block);
  }
  unint64_t v3 = [a1 allRegisteredItemTypes];
  id v4 = (void *)[v3 copy];

  return (NSSet *)v4;
}

void __26__BMItemType_allItemTypes__block_invoke(uint64_t a1)
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  unint64_t v3 = [v2 hourOfDay];
  [v2 registerItemType:v3];

  id v4 = *(void **)(a1 + 32);
  id v5 = [v4 hourOfDaySlot];
  [v4 registerItemType:v5];

  id v6 = *(void **)(a1 + 32);
  id v7 = [v6 dayOfWeek];
  [v6 registerItemType:v7];

  int64_t v8 = *(void **)(a1 + 32);
  v9 = [v8 isWeekend];
  [v8 registerItemType:v9];

  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = [v10 appOpened];
  [v10 registerItemType:v11];

  uint64_t v12 = *(void **)(a1 + 32);
  uint64_t v13 = [v12 appLaunchedReason];
  [v12 registerItemType:v13];

  uint64_t v14 = *(void **)(a1 + 32);
  uint64_t v15 = [v14 appInFocus];
  [v14 registerItemType:v15];

  id v16 = *(void **)(a1 + 32);
  uint64_t v17 = [v16 bundleIdOfShareExtensionOpened];
  [v16 registerItemType:v17];

  id v18 = *(void **)(a1 + 32);
  uint64_t v19 = [v18 bundleIdOfHostOpenedShareExtension];
  [v18 registerItemType:v19];

  v20 = *(void **)(a1 + 32);
  v21 = [v20 appIntentClass];
  [v20 registerItemType:v21];

  unint64_t v22 = *(void **)(a1 + 32);
  id v23 = [v22 appIntentAutomationHash];
  [v22 registerItemType:v23];

  long long v24 = *(void **)(a1 + 32);
  long long v25 = [v24 relevanceIntentHash];
  [v24 registerItemType:v25];

  long long v26 = *(void **)(a1 + 32);
  long long v27 = [v26 relevanceCoarseIntentHash];
  [v26 registerItemType:v27];

  v28 = *(void **)(a1 + 32);
  uint64_t v29 = [v28 appActivityType];
  [v28 registerItemType:v29];

  v30 = *(void **)(a1 + 32);
  char v31 = [v30 relevanceAppActivityHash];
  [v30 registerItemType:v31];

  v32 = *(void **)(a1 + 32);
  BOOL v33 = [v32 relevanceCoarseAppActivityHash];
  [v32 registerItemType:v33];

  uint64_t v34 = *(void **)(a1 + 32);
  v35 = [v34 bluetoothConnectedToDevice];
  [v34 registerItemType:v35];

  uint64_t v36 = *(void **)(a1 + 32);
  v37 = [v36 bluetoothConnectedToDeviceWithName];
  [v36 registerItemType:v37];

  v38 = *(void **)(a1 + 32);
  id v39 = [v38 bluetoothConnectedToDeviceWithAddress];
  [v38 registerItemType:v39];

  uint64_t v40 = *(void **)(a1 + 32);
  v41 = [v40 locationIdentifier];
  [v40 registerItemType:v41];

  uint64_t v42 = *(void **)(a1 + 32);
  v43 = [v42 enterLocation];
  [v42 registerItemType:v43];

  v44 = *(void **)(a1 + 32);
  id v45 = [v44 exitLocation];
  [v44 registerItemType:v45];

  long long v46 = *(void **)(a1 + 32);
  long long v47 = [v46 mediaIsPlaying];
  [v46 registerItemType:v47];

  long long v48 = *(void **)(a1 + 32);
  long long v49 = [v48 mediaGenreStartedPlaying];
  [v48 registerItemType:v49];

  v50 = *(void **)(a1 + 32);
  uint64_t v51 = [v50 connectedToExternalAudioOutput];
  [v50 registerItemType:v51];

  v52 = *(void **)(a1 + 32);
  v53 = [v52 firstBacklightAfterWakeup];
  [v52 registerItemType:v53];

  v54 = *(void **)(a1 + 32);
  v55 = [v54 toggledAirplaneMode];
  [v54 registerItemType:v55];

  v56 = *(void **)(a1 + 32);
  v57 = [v56 connectedToCarPlay];
  [v56 registerItemType:v57];

  v58 = *(void **)(a1 + 32);
  v59 = [v58 toggledDoNotDisturb];
  [v58 registerItemType:v59];

  v60 = *(void **)(a1 + 32);
  v61 = [v60 toggledLowPowerMode];
  [v60 registerItemType:v61];

  v62 = *(void **)(a1 + 32);
  v63 = [v62 wifiConnectedToSSID];
  [v62 registerItemType:v63];

  v64 = *(void **)(a1 + 32);
  v65 = [v64 wifiDisconnectedFromSSID];
  [v64 registerItemType:v65];

  v66 = *(void **)(a1 + 32);
  v67 = [v66 wifiIsConnectedToSSID];
  [v66 registerItemType:v67];

  v68 = *(void **)(a1 + 32);
  v69 = [v68 alarmStoppedAny];
  [v68 registerItemType:v69];

  v70 = *(void **)(a1 + 32);
  v71 = [v70 alarmSnoozedAny];
  [v70 registerItemType:v71];

  v72 = *(void **)(a1 + 32);
  v73 = [v72 alarmStoppedWithID];
  [v72 registerItemType:v73];

  v74 = *(void **)(a1 + 32);
  v75 = [v74 alarmSnoozedWithID];
  [v74 registerItemType:v75];

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  v76 = +[BMItemType interactionItemTypes];
  uint64_t v77 = [v76 countByEnumeratingWithState:&v81 objects:v85 count:16];
  if (v77)
  {
    uint64_t v78 = v77;
    uint64_t v79 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v78; ++i)
      {
        if (*(void *)v82 != v79) {
          objc_enumerationMutation(v76);
        }
        [*(id *)(a1 + 32) registerItemType:*(void *)(*((void *)&v81 + 1) + 8 * i)];
      }
      uint64_t v78 = [v76 countByEnumeratingWithState:&v81 objects:v85 count:16];
    }
    while (v78);
  }
}

+ (id)allItemTypesDictionary
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_msgSend(a1, "allItemTypes", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 identifier];
        [v3 setObject:v9 forKeyedSubscript:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  uint64_t v11 = (void *)[v3 copy];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BMItemType)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];

  uint64_t v6 = [(id)objc_opt_class() allItemTypesDictionary];
  uint64_t v7 = [v6 objectForKey:v5];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (Class)valueClass
{
  return self->_valueClass;
}

- (void)setValueClass:(Class)a3
{
}

- (int64_t)edge
{
  return self->_edge;
}

- (void)setEdge:(int64_t)a3
{
  self->_edge = a3;
}

- (_DKEventStream)eventStream
{
  return self->_eventStream;
}

- (void)setEventStream:(id)a3
{
}

- (id)valueExtractBlock
{
  return self->_valueExtractBlock;
}

- (void)setValueExtractBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueExtractBlock, 0);
  objc_storeStrong((id *)&self->_eventStream, 0);
  objc_storeStrong((id *)&self->_valueClass, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BMItemType)toggledAirplaneMode
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"ToggledAirplaneMode"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  id v3 = [MEMORY[0x263F35148] airplaneModeStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_11];

  return v2;
}

uint64_t __47__BMItemType_AirplaneMode__toggledAirplaneMode__block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 BOOLValue];

  return [v2 numberWithBool:v3];
}

+ (BMItemType)wifiConnectedToSSID
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"WiFiConnectedToSSID"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:0];
  uint64_t v3 = [MEMORY[0x263F35148] wifiConnectionStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_13];

  return v2;
}

id __39__BMItemType_WiFi__wifiConnectedToSSID__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 value];
  uint64_t v3 = [v2 stringValue];

  return v3;
}

+ (BMItemType)wifiDisconnectedFromSSID
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"WiFiDisconnectedFromSSID"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:2];
  uint64_t v3 = [MEMORY[0x263F35148] wifiConnectionStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_8];

  return v2;
}

id __44__BMItemType_WiFi__wifiDisconnectedFromSSID__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 value];
  uint64_t v3 = [v2 stringValue];

  return v3;
}

+ (BMItemType)wifiIsConnectedToSSID
{
  id v2 = objc_alloc_init(BMItemType);
  [(BMItemType *)v2 setIdentifier:@"WiFiIsConnectedToSSID"];
  [(BMItemType *)v2 setValueClass:objc_opt_class()];
  [(BMItemType *)v2 setEdge:1];
  uint64_t v3 = [MEMORY[0x263F35148] wifiConnectionStream];
  [(BMItemType *)v2 setEventStream:v3];

  [(BMItemType *)v2 setValueExtractBlock:&__block_literal_global_13];

  return v2;
}

id __41__BMItemType_WiFi__wifiIsConnectedToSSID__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 value];
  uint64_t v3 = [v2 stringValue];

  return v3;
}

void __46__BMItemType_Intents__appIntentAutomationHash__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FF33000, a2, OS_LOG_TYPE_ERROR, "No intentClass found on intent considered for mining: %@", (uint8_t *)&v2, 0xCu);
}

void __46__BMItemType_Intents__appIntentAutomationHash__block_invoke_17_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*(id *)(a1 + 32) _className];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_21FF33000, a2, OS_LOG_TYPE_ERROR, "Error hashing combinations for intent %@", (uint8_t *)&v4, 0xCu);
}

@end