@interface INIntentResolutionResult
+ (INIntentResolutionResult)confirmationRequiredWithItemToConfirm:(id)itemToConfirm forReason:(NSInteger)reason;
+ (INIntentResolutionResult)needsValue;
+ (INIntentResolutionResult)notRequired;
+ (INIntentResolutionResult)unsupported;
+ (id)_dataForResolutionMethodUnimplemented;
+ (id)_resolutionResultWithData:(id)a3 slotDescription:(id)a4;
+ (id)requiresExecutionOfIntent:(id)a3;
+ (id)resolutionResultConfirmationRequiredWithItemToConfirm:(id)a3;
+ (id)resolutionResultDisambiguationWithItemsToDisambiguate:(id)a3;
+ (id)resolutionResultSuccessWithResolvedValue:(id)a3;
+ (id)resolutionResultUnsupportedWithReason:(unint64_t)a3;
+ (id)resolutionResultUnsupportedWithReason:(unint64_t)a3 alternativeItems:(id)a4;
- (INIntent)intentToExecute;
- (INIntentResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
- (NSArray)alternatives;
- (NSArray)disambiguationItems;
- (NSString)description;
- (id)_JSONDictionaryRepresentationForIntent:(id)a3 parameterName:(id)a4;
- (id)_buildIntentSlotResolutionResultWithIntentSlotDescription:(id)a3;
- (id)_dataForIntentSlotDescription:(id)a3;
- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4;
- (id)_initWithResolutionResult:(id)a3;
- (id)_initWithResultCode:(int64_t)a3;
- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4;
- (id)_objectForIntentSlotValue:(id)a3 slotDescription:(id)a4;
- (id)_stringForResultCode:(int64_t)a3;
- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)itemToConfirm;
- (id)resolutionResultDataForIntent:(id)a3 intentSlotDescription:(id)a4 error:(id *)a5;
- (id)resolvedValue;
- (int64_t)resolutionResultCode;
- (unint64_t)confirmationReason;
- (unint64_t)unsupportedReason;
- (void)setAlternatives:(id)a3;
- (void)setConfirmationReason:(unint64_t)a3;
- (void)setDisambiguationItems:(id)a3;
- (void)setIntentToExecute:(id)a3;
- (void)setItemToConfirm:(id)a3;
- (void)setResolutionResultCode:(int64_t)a3;
- (void)setResolvedValue:(id)a3;
- (void)setUnsupportedReason:(unint64_t)a3;
- (void)transformResolutionResultForIntent:(id)a3 intentSlotDescription:(id)a4 withOptionsProvider:(id)a5 completion:(id)a6;
@end

@implementation INIntentResolutionResult

void __116__INIntentResolutionResult_transformResolutionResultForIntent_intentSlotDescription_withOptionsProvider_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [a2 allItems];
  if ([v6 count])
  {
    if (*(void *)(a1 + 48) == 4) {
      [*(id *)(a1 + 32) setResolutionResultCode:2];
    }
    [*(id *)(a1 + 32) setDisambiguationItems:v6];
  }
  else if (v5)
  {
    v7 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      v9 = "-[INIntentResolutionResult transformResolutionResultForIntent:intentSlotDescription:withOptionsProvider:compl"
           "etion:]_block_invoke_2";
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_ERROR, "%s Failed updating needsValue to needsDisambiguate for custom object: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)_resolutionResultWithData:(id)a3 slotDescription:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [[_INPBIntentSlotResolutionMulticardinalResult alloc] initWithData:v5];
  if ([(_INPBIntentSlotResolutionMulticardinalResult *)v7 resolutionResultsCount])
  {
    int v8 = (_INPBIntentSlotResolutionResult *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[_INPBIntentSlotResolutionMulticardinalResult resolutionResultsCount](v7, "resolutionResultsCount"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v9 = [(_INPBIntentSlotResolutionMulticardinalResult *)v7 resolutionResults];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithIntentSlotResolutionResult:*(void *)(*((void *)&v17 + 1) + 8 * i) slotDescription:v6];
          __70__INIntentResolutionResult__resolutionResultWithData_slotDescription___block_invoke(v14);
          [(_INPBIntentSlotResolutionResult *)v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    v15 = (void *)[(_INPBIntentSlotResolutionResult *)v8 copy];
  }
  else
  {
    int v8 = [[_INPBIntentSlotResolutionResult alloc] initWithData:v5];
    v15 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithIntentSlotResolutionResult:v8 slotDescription:v6];
    __70__INIntentResolutionResult__resolutionResultWithData_slotDescription___block_invoke(v15);
  }

  return v15;
}

void __70__INIntentResolutionResult__resolutionResultWithData_slotDescription___block_invoke(void *a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  v2 = [v1 resolvedValue];
  v3 = [v1 itemToConfirm];
  v4 = [v1 disambiguationItems];
  id v5 = [v1 alternatives];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v2 firstObject];
    [v1 setResolvedValue:v6];
  }
  else
  {
    [v1 setResolvedValue:v2];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v3 firstObject];
    [v1 setItemToConfirm:v7];
  }
  else
  {
    [v1 setItemToConfirm:v3];
  }
  v24 = v5;
  v25 = v4;
  if (v4)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v31;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v30 + 1) + 8 * v13);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v15 = [v14 firstObject];
            [v8 addObject:v15];
          }
          else
          {
            [v8 addObject:v14];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v11);
    }

    [v1 setDisambiguationItems:v8];
    id v5 = v24;
    v4 = v25;
  }
  if (v5)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v17 = v5;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v26 + 1) + 8 * v21);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v23 = [v22 firstObject];
            [v16 addObject:v23];
          }
          else
          {
            [v16 addObject:v22];
          }
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v19);
    }

    [v1 setAlternatives:v16];
    id v5 = v24;
    v4 = v25;
  }
}

- (id)_objectForIntentSlotValue:(id)a3 slotDescription:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 valueStyle];
  if ([v5 payloadStringValuesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadStringValues];
      INIntentSlotValueTransformFromStringValues(v8);
    }
    else
    {
      id v8 = [v5 payloadStringValueAtIndex:0];
      INIntentSlotValueTransformFromStringValue(v8);
    }
    uint64_t v38 = LABEL_544:;
    uint64_t v12 = (void *)v38;
    goto LABEL_67;
  }
  if ([v5 payloadDoubleValuesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadDoubleValues];
      INIntentSlotValueTransformFromDoubleValues(v8);
    }
    else
    {
      id v8 = [v5 payloadDoubleValueAtIndex:0];
      INIntentSlotValueTransformFromDoubleValue(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadIntegerValuesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadIntegerValues];
      INIntentSlotValueTransformFromIntegerValues(v8);
    }
    else
    {
      id v8 = [v5 payloadIntegerValueAtIndex:0];
      INIntentSlotValueTransformFromIntegerValue(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadContactValuesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadContactValues];
      INIntentSlotValueTransformFromContactValues(v8);
    }
    else
    {
      id v8 = [v5 payloadContactValueAtIndex:0];
      INIntentSlotValueTransformFromContactValueWithAlternatives(v8, 0);
    }
    goto LABEL_544;
  }
  if ([v5 payloadDateTimeRangeValuesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadDateTimeRangeValues];
      INIntentSlotValueTransformFromDateTimeRangeValues(v8);
    }
    else
    {
      id v8 = [v5 payloadDateTimeRangeValueAtIndex:0];
      INIntentSlotValueTransformFromDateTimeRangeValue(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadLocationsCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadLocations];
      INIntentSlotValueTransformFromLocationValues(v8);
    }
    else
    {
      id v8 = [v5 payloadLocationAtIndex:0];
      INIntentSlotValueTransformFromLocationValue(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadDataStringsCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadDataStrings];
      INIntentSlotValueTransformFromDataStrings(v8);
    }
    else
    {
      id v8 = [v5 payloadDataStringAtIndex:0];
      INIntentSlotValueTransformFromDataString(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadLongValuesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadLongValues];
      INIntentSlotValueTransformFromLongValues(v8);
    }
    else
    {
      id v8 = [v5 payloadLongValueAtIndex:0];
      INIntentSlotValueTransformFromLongValue(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadPaymentMethodValuesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadPaymentMethodValues];
      INIntentSlotValueTransformFromPaymentMethodValues(v8);
    }
    else
    {
      id v8 = [v5 payloadPaymentMethodValueAtIndex:0];
      INIntentSlotValueTransformFromPaymentMethodValue(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadTemperatureValuesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadTemperatureValues];
      INIntentSlotValueTransformFromTemperatureValues(v8);
    }
    else
    {
      id v8 = [v5 payloadTemperatureValueAtIndex:0];
      INIntentSlotValueTransformFromTemperatureValue(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadDistanceValuesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadDistanceValues];
      INIntentSlotValueTransformFromDistanceValues(v8);
    }
    else
    {
      id v8 = [v5 payloadDistanceValueAtIndex:0];
      INIntentSlotValueTransformFromDistanceValue(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadDateTimeValuesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadDateTimeValues];
      INIntentSlotValueTransformFromDateTimes(v8);
    }
    else
    {
      id v8 = [v5 payloadDateTimeValueAtIndex:0];
      INIntentSlotValueTransformFromDateTime(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadMassValuesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadMassValues];
      INIntentSlotValueTransformFromMassValues(v8);
    }
    else
    {
      id v8 = [v5 payloadMassValueAtIndex:0];
      INIntentSlotValueTransformFromMassValue(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadVolumeValuesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadVolumeValues];
      INIntentSlotValueTransformFromVolumeValues(v8);
    }
    else
    {
      id v8 = [v5 payloadVolumeValueAtIndex:0];
      INIntentSlotValueTransformFromVolumeValue(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadSpeedValuesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadSpeedValues];
      INIntentSlotValueTransformFromSpeedValues(v8);
    }
    else
    {
      id v8 = [v5 payloadSpeedValueAtIndex:0];
      INIntentSlotValueTransformFromSpeedValue(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadEnergyValuesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadEnergyValues];
      INIntentSlotValueTransformFromEnergyValues(v8);
    }
    else
    {
      id v8 = [v5 payloadEnergyValueAtIndex:0];
      INIntentSlotValueTransformFromEnergyValue(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadStringListsCount])
  {
    id v8 = [v5 payloadStringListAtIndex:0];
    id v9 = [(INStartCallRequestMetadata *)v8 dataStrings];
    uint64_t v10 = INIntentSlotValueTransformFromStrings(v9);
LABEL_91:
    uint64_t v12 = (void *)v10;

LABEL_67:
    goto LABEL_68;
  }
  if ([v5 payloadDoubleListsCount])
  {
    id v8 = [v5 payloadDoubleListAtIndex:0];
    id v9 = [(INStartCallRequestMetadata *)v8 dataStrings];
    uint64_t v10 = INIntentSlotValueTransformFromDoubles(v9);
    goto LABEL_91;
  }
  if ([v5 payloadIntegerListsCount])
  {
    id v8 = [v5 payloadIntegerListAtIndex:0];
    id v9 = [(INStartCallRequestMetadata *)v8 dataStrings];
    uint64_t v10 = INIntentSlotValueTransformFromIntegers(v9);
    goto LABEL_91;
  }
  if ([v5 payloadContactListsCount])
  {
    id v8 = [v5 payloadContactListAtIndex:0];
    id v9 = [(INStartCallRequestMetadata *)v8 contacts];
    uint64_t v10 = INIntentSlotValueTransformFromContacts(v9);
    goto LABEL_91;
  }
  if ([v5 payloadDateTimeRangeListsCount])
  {
    id v8 = [v5 payloadDateTimeRangeListAtIndex:0];
    id v9 = [(INStartCallRequestMetadata *)v8 dateRanges];
    uint64_t v10 = INIntentSlotValueTransformFromDateTimeRanges(v9);
    goto LABEL_91;
  }
  if ([v5 payloadLocationListsCount])
  {
    id v8 = [v5 payloadLocationListAtIndex:0];
    id v9 = [(INStartCallRequestMetadata *)v8 locations];
    uint64_t v10 = INIntentSlotValueTransformFromLocations(v9);
    goto LABEL_91;
  }
  if ([v5 payloadDataStringListsCount])
  {
    id v8 = [v5 payloadDataStringListAtIndex:0];
    id v9 = [(INStartCallRequestMetadata *)v8 dataStrings];
    uint64_t v10 = INIntentSlotValueTransformFromDataStrings(v9);
    goto LABEL_91;
  }
  if ([v5 payloadLongListsCount])
  {
    id v8 = [v5 payloadLongListAtIndex:0];
    id v9 = [(INStartCallRequestMetadata *)v8 dataStrings];
    uint64_t v10 = INIntentSlotValueTransformFromLongs(v9);
    goto LABEL_91;
  }
  if ([v5 payloadPaymentMethodListsCount])
  {
    id v8 = [v5 payloadPaymentMethodListAtIndex:0];
    id v9 = [(INStartCallRequestMetadata *)v8 paymentMethods];
    uint64_t v10 = INIntentSlotValueTransformFromPaymentMethods(v9);
    goto LABEL_91;
  }
  if ([v5 payloadTemperatureListsCount])
  {
    id v8 = [v5 payloadTemperatureListAtIndex:0];
    id v9 = [(INStartCallRequestMetadata *)v8 temperatures];
    uint64_t v10 = INIntentSlotValueTransformFromTemperatures(v9);
    goto LABEL_91;
  }
  if ([v5 payloadDistanceListsCount])
  {
    id v8 = [v5 payloadDistanceListAtIndex:0];
    id v9 = [(INStartCallRequestMetadata *)v8 distances];
    uint64_t v10 = INIntentSlotValueTransformFromDistances(v9);
    goto LABEL_91;
  }
  if ([v5 payloadPrimitiveBoolsCount])
  {
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "payloadPrimitiveBoolAtIndex:", 0));
LABEL_102:
    uint64_t v12 = (void *)v13;
    goto LABEL_68;
  }
  if ([v5 payloadPrimitiveIntsCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadPrimitiveIntAtIndex:0];
LABEL_96:
    uint64_t v13 = [v14 numberWithInt:v15];
    goto LABEL_102;
  }
  if ([v5 payloadPrimitiveLongsCount])
  {
    id v16 = NSNumber;
    uint64_t v17 = [v5 payloadPrimitiveLongAtIndex:0];
LABEL_99:
    uint64_t v13 = [v16 numberWithLongLong:v17];
    goto LABEL_102;
  }
  if ([v5 payloadPrimitiveDoublesCount])
  {
    uint64_t v18 = NSNumber;
    [v5 payloadPrimitiveDoubleAtIndex:0];
    uint64_t v13 = objc_msgSend(v18, "numberWithDouble:");
    goto LABEL_102;
  }
  if ([v5 payloadPrimitiveStringsCount])
  {
    if (v7 == 3) {
      [v5 payloadPrimitiveStrings];
    }
    else {
      [v5 payloadPrimitiveStringAtIndex:0];
    }
    uint64_t v13 = LABEL_106:;
    goto LABEL_102;
  }
  if ([v5 payloadIntentsCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadIntents];
      INIntentSlotValueTransformFromIntents(v8);
    }
    else
    {
      id v8 = [v5 payloadIntentAtIndex:0];
      INIntentSlotValueTransformFromIntent(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadModifyRelationshipsCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadModifyRelationships];
      INIntentSlotValueTransformFromModifyRelationships(v8);
    }
    else
    {
      id v8 = [v5 payloadModifyRelationshipAtIndex:0];
      INIntentSlotValueTransformFromModifyRelationship(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadModifyNicknamesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadModifyNicknames];
      INIntentSlotValueTransformFromModifyNicknames(v8);
    }
    else
    {
      id v8 = [v5 payloadModifyNicknameAtIndex:0];
      INIntentSlotValueTransformFromModifyNickname(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadCalendarEventsCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadCalendarEvents];
      INIntentSlotValueTransformFromCalendarEvents(v8);
    }
    else
    {
      id v8 = [v5 payloadCalendarEventAtIndex:0];
      INIntentSlotValueTransformFromCalendarEvent(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadEventParticipantsCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadEventParticipants];
      INIntentSlotValueTransformFromEventParticipants(v8);
    }
    else
    {
      id v8 = [v5 payloadEventParticipantAtIndex:0];
      INIntentSlotValueTransformFromEventParticipant(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadEventAttributesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadEventAttributeAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadEnumerationsCount])
  {
    id v16 = NSNumber;
    uint64_t v17 = [v5 payloadEnumerationAtIndex:0];
    goto LABEL_99;
  }
  if ([v5 payloadAlarmsCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadAlarms];
      INIntentSlotValueTransformFromAlarms(v8);
    }
    else
    {
      id v8 = [v5 payloadAlarmAtIndex:0];
      INIntentSlotValueTransformFromAlarm(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadAlarmPeriodsCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadAlarmPeriodAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadAlarmRepeatSchedulesCount])
  {
    if (v7 != 3)
    {
      v14 = NSNumber;
      uint64_t v15 = [v5 payloadAlarmRepeatScheduleAtIndex:0];
      goto LABEL_96;
    }
    uint64_t v57 = 0;
    if ([v5 payloadAlarmRepeatSchedulesCount])
    {
      unint64_t v19 = 0;
      do
        INAlarmRepeatScheduleOptionsAddBackingType(&v57, [v5 payloadAlarmRepeatScheduleAtIndex:v19++]);
      while (v19 < [v5 payloadAlarmRepeatSchedulesCount]);
LABEL_143:
      uint64_t v20 = v57;
LABEL_489:
      uint64_t v36 = NSNumber;
      goto LABEL_490;
    }
    goto LABEL_488;
  }
  if ([v5 payloadAlarmSearchsCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadAlarmSearchs];
      INIntentSlotValueTransformFromAlarmSearchs(v8);
    }
    else
    {
      id v8 = [v5 payloadAlarmSearchAtIndex:0];
      INIntentSlotValueTransformFromAlarmSearch(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadAlarmSearchTypesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadAlarmSearchTypeAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadChangeAlarmStatusOperationsCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadChangeAlarmStatusOperationAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadSleepAlarmAttributesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadSleepAlarmAttributes];
      INIntentSlotValueTransformFromSleepAlarmAttributes(v8);
    }
    else
    {
      id v8 = [v5 payloadSleepAlarmAttributeAtIndex:0];
      INIntentSlotValueTransformFromSleepAlarmAttribute(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadUpdateAlarmOperationsCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadUpdateAlarmOperationAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadCallAudioRoutesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadCallAudioRouteAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadCallCapabilitiesCount])
  {
    if (v7 != 3)
    {
      v14 = NSNumber;
      uint64_t v15 = [v5 payloadCallCapabilityAtIndex:0];
      goto LABEL_96;
    }
    uint64_t v21 = 0;
    if ([v5 payloadCallCapabilitiesCount])
    {
      unint64_t v22 = 0;
      do
      {
        int v23 = [v5 payloadCallCapabilityAtIndex:v22];
        uint64_t v24 = v21 | 1;
        if (v23 != 1) {
          uint64_t v24 = v21;
        }
        if (v23 == 2) {
          v21 |= 2uLL;
        }
        else {
          uint64_t v21 = v24;
        }
        ++v22;
      }
      while (v22 < [v5 payloadCallCapabilitiesCount]);
    }
    goto LABEL_455;
  }
  if ([v5 payloadCallDestinationTypesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadCallDestinationTypeAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadCallGroupsCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadCallGroups];
      INIntentSlotValueTransformFromCallGroups(v8);
    }
    else
    {
      id v8 = [v5 payloadCallGroupAtIndex:0];
      INIntentSlotValueTransformFromCallGroup(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadCallGroupConversationsCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadCallGroupConversations];
      INIntentSlotValueTransformFromCallGroupConversations(v8);
    }
    else
    {
      id v8 = [v5 payloadCallGroupConversationAtIndex:0];
      INIntentSlotValueTransformFromCallGroupConversation(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadCallRecordFiltersCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadCallRecordFilters];
      INIntentSlotValueTransformFromCallRecordFilters(v8);
    }
    else
    {
      id v8 = [v5 payloadCallRecordFilterAtIndex:0];
      INIntentSlotValueTransformFromCallRecordFilter(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadCallRecordTypesCount])
  {
    if (v7 != 3)
    {
      v14 = NSNumber;
      uint64_t v15 = [v5 payloadCallRecordTypeAtIndex:0];
      goto LABEL_96;
    }
    uint64_t v57 = 0;
    if ([v5 payloadCallRecordTypesCount])
    {
      unint64_t v25 = 0;
      do
        INCallRecordTypeOptionsAddBackingType(&v57, [v5 payloadCallRecordTypeAtIndex:v25++]);
      while (v25 < [v5 payloadCallRecordTypesCount]);
      goto LABEL_143;
    }
LABEL_488:
    uint64_t v20 = 0;
    goto LABEL_489;
  }
  if ([v5 payloadCallRecordValuesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadCallRecordValues];
      INIntentSlotValueTransformFromCallRecordValues(v8);
    }
    else
    {
      id v8 = [v5 payloadCallRecordValueAtIndex:0];
      INIntentSlotValueTransformFromCallRecordValue(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadDialingContactsCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadDialingContacts];
      INIntentSlotValueTransformFromDialingContacts(v8);
    }
    else
    {
      id v8 = [v5 payloadDialingContactAtIndex:0];
      INIntentSlotValueTransformFromDialingContact(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadPreferredCallProvidersCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadPreferredCallProviderAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadStartCallRequestMetadatasCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadStartCallRequestMetadatas];
      INIntentSlotValueTransformFromStartCallRequestMetadatas(v8);
    }
    else
    {
      id v8 = [v5 payloadStartCallRequestMetadataAtIndex:0];
      INIntentSlotValueTransformFromStartCallRequestMetadata(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadCarAirCirculationModesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadCarAirCirculationModeAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadCarAudioSourcesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadCarAudioSourceAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadCarDefrostersCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadCarDefrosterAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadCarSeatsCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadCarSeatAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadCarSignalIdentifiersCount])
  {
    if (v7 != 3)
    {
      v14 = NSNumber;
      uint64_t v15 = [v5 payloadCarSignalIdentifierAtIndex:0];
      goto LABEL_96;
    }
    uint64_t v21 = 0;
    if ([v5 payloadCarSignalIdentifiersCount])
    {
      unint64_t v26 = 0;
      do
      {
        int v27 = [v5 payloadCarSignalIdentifierAtIndex:v26];
        uint64_t v28 = v21 | 1;
        if (v27 != 1) {
          uint64_t v28 = v21;
        }
        if (v27 == 2) {
          v21 |= 2uLL;
        }
        else {
          uint64_t v21 = v28;
        }
        ++v26;
      }
      while (v26 < [v5 payloadCarSignalIdentifiersCount]);
    }
    goto LABEL_455;
  }
  if ([v5 payloadChargingConnectorTypesCount])
  {
    if (v7 == 3) {
      [v5 payloadChargingConnectorTypes];
    }
    else {
      [v5 payloadChargingConnectorTypeAtIndex:0];
    }
    goto LABEL_106;
  }
  if ([v5 payloadRelativeReferencesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadRelativeReferenceAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadRelativeSettingsCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadRelativeSettingAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadDeviceDetailsCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadDeviceDetails];
      INIntentSlotValueTransformFromDeviceDetails(v8);
    }
    else
    {
      id v8 = [v5 payloadDeviceDetailAtIndex:0];
      INIntentSlotValueTransformFromDeviceDetail(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadSupportedTrafficIncidentTypesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadSupportedTrafficIncidentTypes];
      INIntentSlotValueTransformFromSupportedTrafficIncidentTypes(v8);
    }
    else
    {
      id v8 = [v5 payloadSupportedTrafficIncidentTypeAtIndex:0];
      INIntentSlotValueTransformFromSupportedTrafficIncidentType(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadHomeAttributesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadHomeAttributes];
      INIntentSlotValueTransformFromHomeAttributes(v8);
    }
    else
    {
      id v8 = [v5 payloadHomeAttributeAtIndex:0];
      INIntentSlotValueTransformFromHomeAttribute(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadHomeAttributeTypesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadHomeAttributeTypeAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadHomeAttributeValueTypesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadHomeAttributeValueTypeAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadHomeDeviceTypesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadHomeDeviceTypeAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadHomeEntitiesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadHomeEntities];
      INIntentSlotValueTransformFromHomeEntities(v8);
    }
    else
    {
      id v8 = [v5 payloadHomeEntityAtIndex:0];
      INIntentSlotValueTransformFromHomeEntity(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadHomeEntityTypesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadHomeEntityTypeAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadHomeFiltersCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadHomeFilters];
      INIntentSlotValueTransformFromHomeFilters(v8);
    }
    else
    {
      id v8 = [v5 payloadHomeFilterAtIndex:0];
      INIntentSlotValueTransformFromHomeFilter(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadHomeUserTasksCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadHomeUserTasks];
      INIntentSlotValueTransformFromHomeUserTasks(v8);
    }
    else
    {
      id v8 = [v5 payloadHomeUserTaskAtIndex:0];
      INIntentSlotValueTransformFromHomeUserTask(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadAnnouncementsCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadAnnouncements];
      INIntentSlotValueTransformFromAnnouncements(v8);
    }
    else
    {
      id v8 = [v5 payloadAnnouncementAtIndex:0];
      INIntentSlotValueTransformFromAnnouncement(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadReadActionTypesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadReadActionTypeAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadUserNotificationTypesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadUserNotificationTypeAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadMediaAffinityTypesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadMediaAffinityTypeAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadMediaDestinationsCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadMediaDestinations];
      INIntentSlotValueTransformFromMediaDestinations(v8);
    }
    else
    {
      id v8 = [v5 payloadMediaDestinationAtIndex:0];
      INIntentSlotValueTransformFromMediaDestination(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadMediaItemGroupsCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadMediaItemGroups];
      INIntentSlotValueTransformFromMediaItemGroups(v8);
    }
    else
    {
      id v8 = [v5 payloadMediaItemGroupAtIndex:0];
      INIntentSlotValueTransformFromMediaItemGroup(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadMediaItemValuesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadMediaItemValues];
      INIntentSlotValueTransformFromMediaItemValues(v8);
    }
    else
    {
      id v8 = [v5 payloadMediaItemValueAtIndex:0];
      INIntentSlotValueTransformFromMediaItemValue(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadMediaSearchsCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadMediaSearchs];
      INIntentSlotValueTransformFromMediaSearchs(v8);
    }
    else
    {
      id v8 = [v5 payloadMediaSearchAtIndex:0];
      INIntentSlotValueTransformFromMediaSearch(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadParsecCategoriesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadParsecCategoryAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadPlaybackQueueLocationsCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadPlaybackQueueLocationAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadPlaybackRepeatModesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadPlaybackRepeatModeAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadPrivateAddMediaIntentDatasCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadPrivateAddMediaIntentDatas];
      INIntentSlotValueTransformFromPrivateAddMediaIntentDatas(v8);
    }
    else
    {
      id v8 = [v5 payloadPrivateAddMediaIntentDataAtIndex:0];
      INIntentSlotValueTransformFromPrivateAddMediaIntentData(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadPrivatePlayMediaIntentDatasCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadPrivatePlayMediaIntentDatas];
      INIntentSlotValueTransformFromPrivatePlayMediaIntentDatas(v8);
    }
    else
    {
      id v8 = [v5 payloadPrivatePlayMediaIntentDataAtIndex:0];
      INIntentSlotValueTransformFromPrivatePlayMediaIntentData((INPrivatePlayMediaIntentData *)v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadPrivateSearchForMediaIntentDatasCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadPrivateSearchForMediaIntentDatas];
      INIntentSlotValueTransformFromPrivateSearchForMediaIntentDatas(v8);
    }
    else
    {
      id v8 = [v5 payloadPrivateSearchForMediaIntentDataAtIndex:0];
      INIntentSlotValueTransformFromPrivateSearchForMediaIntentData(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadPrivateUpdateMediaAffinityIntentDatasCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadPrivateUpdateMediaAffinityIntentDatas];
      INIntentSlotValueTransformFromPrivateUpdateMediaAffinityIntentDatas(v8);
    }
    else
    {
      id v8 = [v5 payloadPrivateUpdateMediaAffinityIntentDataAtIndex:0];
      INIntentSlotValueTransformFromPrivateUpdateMediaAffinityIntentData(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadRadioTypesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadRadioTypeAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadContactEventTriggersCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadContactEventTriggers];
      INIntentSlotValueTransformFromContactEventTriggers(v8);
    }
    else
    {
      id v8 = [v5 payloadContactEventTriggerAtIndex:0];
      INIntentSlotValueTransformFromContactEventTrigger(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadDateSearchTypesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadDateSearchTypeAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadLocationSearchTypesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadLocationSearchTypeAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadNotesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadNotes];
      INIntentSlotValueTransformFromNotes(v8);
    }
    else
    {
      id v8 = [v5 payloadNoteAtIndex:0];
      INIntentSlotValueTransformFromNote(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadNoteContentsCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadNoteContents];
      INIntentSlotValueTransformFromNoteContents(v8);
    }
    else
    {
      id v8 = [v5 payloadNoteContentAtIndex:0];
      INIntentSlotValueTransformFromNoteContent(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadNotebookItemTypesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadNotebookItemTypeAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadSpatialEventTriggersCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadSpatialEventTriggers];
      INIntentSlotValueTransformFromSpatialEventTriggers(v8);
    }
    else
    {
      id v8 = [v5 payloadSpatialEventTriggerAtIndex:0];
      INIntentSlotValueTransformFromSpatialEventTrigger(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadTasksCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadTasks];
      INIntentSlotValueTransformFromTasks(v8);
    }
    else
    {
      id v8 = [v5 payloadTaskAtIndex:0];
      INIntentSlotValueTransformFromTask(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadTaskListsCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadTaskLists];
      INIntentSlotValueTransformFromTaskLists(v8);
    }
    else
    {
      id v8 = [v5 payloadTaskListAtIndex:0];
      INIntentSlotValueTransformFromTaskList(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadTaskPrioritiesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadTaskPriorityAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadTaskReferencesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadTaskReferenceAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadTaskStatusCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadTaskStatusAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadTemporalEventTriggersCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadTemporalEventTriggers];
      INIntentSlotValueTransformFromTemporalEventTriggers(v8);
    }
    else
    {
      id v8 = [v5 payloadTemporalEventTriggerAtIndex:0];
      INIntentSlotValueTransformFromTemporalEventTrigger(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadTemporalEventTriggerTypesCount])
  {
    if (v7 != 3)
    {
      v14 = NSNumber;
      uint64_t v15 = [v5 payloadTemporalEventTriggerTypeAtIndex:0];
      goto LABEL_96;
    }
    uint64_t v21 = 0;
    if ([v5 payloadTemporalEventTriggerTypesCount])
    {
      unint64_t v29 = 0;
      do
      {
        int v30 = [v5 payloadTemporalEventTriggerTypeAtIndex:v29];
        uint64_t v31 = v21 | 2;
        uint64_t v32 = v21 | 1;
        if (v30 != 1) {
          uint64_t v32 = v21;
        }
        if (v30 != 2) {
          uint64_t v31 = v32;
        }
        if (v30 == 3) {
          v21 |= 4uLL;
        }
        else {
          uint64_t v21 = v31;
        }
        ++v29;
      }
      while (v29 < [v5 payloadTemporalEventTriggerTypesCount]);
    }
    goto LABEL_455;
  }
  if ([v5 payloadAccountTypesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadAccountTypeAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadBalanceTypesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadBalanceTypeAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadBillDetailsValuesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadBillDetailsValues];
      INIntentSlotValueTransformFromBillDetailsValues(v8);
    }
    else
    {
      id v8 = [v5 payloadBillDetailsValueAtIndex:0];
      INIntentSlotValueTransformFromBillDetailsValue(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadBillPayeeValuesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadBillPayeeValues];
      INIntentSlotValueTransformFromBillPayeeValues(v8);
    }
    else
    {
      id v8 = [v5 payloadBillPayeeValueAtIndex:0];
      INIntentSlotValueTransformFromBillPayeeValue(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadBillTypesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadBillTypeAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadCurrencyAmountsCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadCurrencyAmounts];
      INIntentSlotValueTransformFromCurrencyAmounts(v8);
    }
    else
    {
      id v8 = [v5 payloadCurrencyAmountAtIndex:0];
      INIntentSlotValueTransformFromCurrencyAmount(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadFinancialAccountValuesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadFinancialAccountValues];
      INIntentSlotValueTransformFromFinancialAccountValues(v8);
    }
    else
    {
      id v8 = [v5 payloadFinancialAccountValueAtIndex:0];
      INIntentSlotValueTransformFromFinancialAccountValue(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadPaymentAmountValuesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadPaymentAmountValues];
      INIntentSlotValueTransformFromPaymentAmountValues(v8);
    }
    else
    {
      id v8 = [v5 payloadPaymentAmountValueAtIndex:0];
      INIntentSlotValueTransformFromPaymentAmountValue(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadPaymentStatusCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadPaymentStatusAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadBinarySettingValuesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadBinarySettingValueAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadBoundedSettingValuesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadBoundedSettingValueAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadDevicesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadDevices];
      INIntentSlotValueTransformFromDevices(v8);
    }
    else
    {
      id v8 = [v5 payloadDeviceAtIndex:0];
      INIntentSlotValueTransformFromDevice(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadGetSettingResponseDatasCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadGetSettingResponseDatas];
      INIntentSlotValueTransformFromGetSettingResponseDatas(v8);
    }
    else
    {
      id v8 = [v5 payloadGetSettingResponseDataAtIndex:0];
      INIntentSlotValueTransformFromGetSettingResponseData(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadNumericSettingUnitsCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadNumericSettingUnitAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadNumericSettingValuesCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadNumericSettingValues];
      INIntentSlotValueTransformFromNumericSettingValues(v8);
    }
    else
    {
      id v8 = [v5 payloadNumericSettingValueAtIndex:0];
      INIntentSlotValueTransformFromNumericSettingValue(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadSettingActionsCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadSettingActionAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadSettingMetadatasCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadSettingMetadatas];
      INIntentSlotValueTransformFromSettingMetadatas(v8);
    }
    else
    {
      id v8 = [v5 payloadSettingMetadataAtIndex:0];
      INIntentSlotValueTransformFromSettingMetadata(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadTimersCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadTimers];
      INIntentSlotValueTransformFromTimers(v8);
    }
    else
    {
      id v8 = [v5 payloadTimerAtIndex:0];
      INIntentSlotValueTransformFromTimer(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadTimerStatesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadTimerStateAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadTimerTypesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadTimerTypeAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadVisualCodeTypesCount])
  {
    v14 = NSNumber;
    uint64_t v15 = [v5 payloadVisualCodeTypeAtIndex:0];
    goto LABEL_96;
  }
  if ([v5 payloadAppIdentifiersCount])
  {
    if (v7 == 3)
    {
      id v8 = [v5 payloadAppIdentifiers];
      INIntentSlotValueTransformFromAppIdentifiers(v8);
    }
    else
    {
      id v8 = [v5 payloadAppIdentifierAtIndex:0];
      INIntentSlotValueTransformFromAppIdentifier(v8);
    }
    goto LABEL_544;
  }
  if ([v5 payloadArchivedObjectsCount])
  {
    if ([v6 valueType] != 225)
    {
      if (v7 == 3)
      {
        id v8 = [v5 payloadArchivedObjects];
        INIntentSlotValueTransformFromArchivedObjects(v8);
      }
      else
      {
        id v8 = [v5 payloadArchivedObjectAtIndex:0];
        INIntentSlotValueTransformFromArchivedObject(v8);
      }
      goto LABEL_544;
    }
    long long v33 = [v6 codableAttribute];
    if (v33)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v34 = v33;
      }
      else {
        v34 = 0;
      }
    }
    else
    {
      v34 = 0;
    }
    id v39 = v34;

    v40 = [v39 codableDescription];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __81__INIntentResolutionResult_Transform___objectForIntentSlotValue_slotDescription___block_invoke;
    v54[3] = &unk_1E5519100;
    id v49 = v40;
    id v55 = v49;
    id v48 = v39;
    id v56 = v48;
    v41 = (void (**)(void, void))MEMORY[0x192F984C0](v54);
    if (v7 == 3)
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "payloadArchivedObjectsCount"));
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      v42 = [v5 payloadArchivedObjects];
      uint64_t v43 = [v42 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v44; ++i)
          {
            if (*(void *)v51 != v45) {
              objc_enumerationMutation(v42);
            }
            v47 = v41[2](v41, *(void *)(*((void *)&v50 + 1) + 8 * i));
            [v12 addObject:v47];
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v50 objects:v58 count:16];
        }
        while (v44);
      }
    }
    else
    {
      v42 = [v5 payloadArchivedObjectAtIndex:0];
      uint64_t v12 = ((void (**)(void, void *))v41)[2](v41, v42);
    }
  }
  else
  {
    if ([v5 payloadCustomObjectsCount])
    {
      if (v7 == 3)
      {
        id v8 = [v5 payloadCustomObjects];
        INIntentSlotValueTransformFromCustomObjects(v8);
      }
      else
      {
        id v8 = [v5 payloadCustomObjectAtIndex:0];
        INIntentSlotValueTransformFromCustomObject(v8);
      }
      goto LABEL_544;
    }
    if ([v5 payloadFilesCount])
    {
      if (v7 == 3)
      {
        id v8 = [v5 payloadFiles];
        INIntentSlotValueTransformFromFiles(v8);
      }
      else
      {
        id v8 = [v5 payloadFileAtIndex:0];
        INIntentSlotValueTransformFromFile(v8);
      }
      goto LABEL_544;
    }
    if ([v5 payloadIntentExecutionResultsCount])
    {
      if (v7 == 3)
      {
        id v8 = [v5 payloadIntentExecutionResults];
        INIntentSlotValueTransformFromIntentExecutionResults(v8);
      }
      else
      {
        id v8 = [v5 payloadIntentExecutionResultAtIndex:0];
        INIntentSlotValueTransformFromIntentExecutionResult(v8);
      }
      goto LABEL_544;
    }
    if ([v5 payloadURLValuesCount])
    {
      if (v7 == 3)
      {
        id v8 = [v5 payloadURLValues];
        INIntentSlotValueTransformFromURLValues(v8);
      }
      else
      {
        id v8 = [v5 payloadURLValueAtIndex:0];
        INIntentSlotValueTransformFromURLValue(v8);
      }
      goto LABEL_544;
    }
    if ([v5 payloadVoiceCommandDeviceInformationsCount])
    {
      if (v7 == 3)
      {
        id v8 = [v5 payloadVoiceCommandDeviceInformations];
        INIntentSlotValueTransformFromVoiceCommandDeviceInformations(v8);
      }
      else
      {
        id v8 = [v5 payloadVoiceCommandDeviceInformationAtIndex:0];
        INIntentSlotValueTransformFromVoiceCommandDeviceInformation(v8);
      }
      goto LABEL_544;
    }
    if ([v5 payloadWellnessMetadataPairsCount])
    {
      if (v7 == 3)
      {
        id v8 = [v5 payloadWellnessMetadataPairs];
        INIntentSlotValueTransformFromWellnessMetadataPairs(v8);
      }
      else
      {
        id v8 = [v5 payloadWellnessMetadataPairAtIndex:0];
        INIntentSlotValueTransformFromWellnessMetadataPair(v8);
      }
      goto LABEL_544;
    }
    if ([v5 payloadWellnessObjectResultValuesCount])
    {
      if (v7 == 3)
      {
        id v8 = [v5 payloadWellnessObjectResultValues];
        INIntentSlotValueTransformFromWellnessObjectResultValues(v8);
      }
      else
      {
        id v8 = [v5 payloadWellnessObjectResultValueAtIndex:0];
        INIntentSlotValueTransformFromWellnessObjectResultValue(v8);
      }
      goto LABEL_544;
    }
    if ([v5 payloadWellnessObjectTypesCount])
    {
      v14 = NSNumber;
      uint64_t v15 = [v5 payloadWellnessObjectTypeAtIndex:0];
      goto LABEL_96;
    }
    if ([v5 payloadWellnessQueryResultTypesCount])
    {
      v14 = NSNumber;
      uint64_t v15 = [v5 payloadWellnessQueryResultTypeAtIndex:0];
      goto LABEL_96;
    }
    if ([v5 payloadWellnessQuestionTypesCount])
    {
      v14 = NSNumber;
      uint64_t v15 = [v5 payloadWellnessQuestionTypeAtIndex:0];
      goto LABEL_96;
    }
    if ([v5 payloadWellnessUnitTypesCount])
    {
      if (v7 == 3)
      {
        id v8 = [v5 payloadWellnessUnitTypes];
        INIntentSlotValueTransformFromWellnessUnitTypes(v8);
      }
      else
      {
        id v8 = [v5 payloadWellnessUnitTypeAtIndex:0];
        INIntentSlotValueTransformFromWellnessUnitType(v8);
      }
      goto LABEL_544;
    }
    if ([v5 payloadWellnessValuesCount])
    {
      if (v7 == 3)
      {
        id v8 = [v5 payloadWellnessValues];
        INIntentSlotValueTransformFromWellnessValues(v8);
      }
      else
      {
        id v8 = [v5 payloadWellnessValueAtIndex:0];
        INIntentSlotValueTransformFromWellnessValue(v8);
      }
      goto LABEL_544;
    }
    if ([v5 payloadWorkoutAssociatedItemsCount])
    {
      if (v7 == 3)
      {
        id v8 = [v5 payloadWorkoutAssociatedItems];
        INIntentSlotValueTransformFromWorkoutAssociatedItems(v8);
      }
      else
      {
        id v8 = [v5 payloadWorkoutAssociatedItemAtIndex:0];
        INIntentSlotValueTransformFromWorkoutAssociatedItem(v8);
      }
      goto LABEL_544;
    }
    if ([v5 payloadWorkoutCustomizationsCount])
    {
      if (v7 == 3)
      {
        id v8 = [v5 payloadWorkoutCustomizations];
        INIntentSlotValueTransformFromWorkoutCustomizations(v8);
      }
      else
      {
        id v8 = [v5 payloadWorkoutCustomizationAtIndex:0];
        INIntentSlotValueTransformFromWorkoutCustomization(v8);
      }
      goto LABEL_544;
    }
    if ([v5 payloadWorkoutGoalUnitTypesCount])
    {
      v14 = NSNumber;
      uint64_t v15 = [v5 payloadWorkoutGoalUnitTypeAtIndex:0];
      goto LABEL_96;
    }
    if ([v5 payloadWorkoutLocationTypesCount])
    {
      v14 = NSNumber;
      uint64_t v15 = [v5 payloadWorkoutLocationTypeAtIndex:0];
      goto LABEL_96;
    }
    if ([v5 payloadWorkoutSequenceLabelsCount])
    {
      v14 = NSNumber;
      uint64_t v15 = [v5 payloadWorkoutSequenceLabelAtIndex:0];
      goto LABEL_96;
    }
    if ([v5 payloadMessageAttributesCount])
    {
      if (v7 != 3)
      {
        v14 = NSNumber;
        uint64_t v15 = [v5 payloadMessageAttributeAtIndex:0];
        goto LABEL_96;
      }
      uint64_t v21 = 0;
      if ([v5 payloadMessageAttributesCount])
      {
        unint64_t v35 = 0;
        do
        {
          switch([v5 payloadMessageAttributeAtIndex:v35])
          {
            case 1u:
              v21 |= 1uLL;
              break;
            case 2u:
              v21 |= 2uLL;
              break;
            case 3u:
              v21 |= 4uLL;
              break;
            case 4u:
              v21 |= 8uLL;
              break;
            case 5u:
              v21 |= 0x10uLL;
              break;
            default:
              break;
          }
          ++v35;
        }
        while (v35 < [v5 payloadMessageAttributesCount]);
      }
LABEL_455:
      uint64_t v36 = NSNumber;
      uint64_t v20 = v21;
LABEL_490:
      uint64_t v13 = [v36 numberWithUnsignedInteger:v20];
      goto LABEL_102;
    }
    if ([v5 payloadMessageEffectsCount])
    {
      v14 = NSNumber;
      uint64_t v15 = [v5 payloadMessageEffectAtIndex:0];
      goto LABEL_96;
    }
    if ([v5 payloadMessageTypesCount])
    {
      v14 = NSNumber;
      uint64_t v15 = [v5 payloadMessageTypeAtIndex:0];
      goto LABEL_96;
    }
    if ([v5 payloadOutgoingMessageTypesCount])
    {
      v14 = NSNumber;
      uint64_t v15 = [v5 payloadOutgoingMessageTypeAtIndex:0];
      goto LABEL_96;
    }
    if ([v5 payloadSendMessageAttachmentsCount])
    {
      if (v7 == 3)
      {
        id v8 = [v5 payloadSendMessageAttachments];
        INIntentSlotValueTransformFromSendMessageAttachments(v8);
      }
      else
      {
        id v8 = [v5 payloadSendMessageAttachmentAtIndex:0];
        INIntentSlotValueTransformFromSendMessageAttachment(v8);
      }
      goto LABEL_544;
    }
    if ([v5 payloadActivitiesCount])
    {
      if (v7 == 3)
      {
        id v8 = [v5 payloadActivities];
        INIntentSlotValueTransformFromActivities(v8);
      }
      else
      {
        id v8 = [v5 payloadActivityAtIndex:0];
        INIntentSlotValueTransformFromActivity(v8);
      }
      goto LABEL_544;
    }
    if ([v5 payloadActivityListsCount])
    {
      id v8 = [v5 payloadActivityListAtIndex:0];
      id v9 = [(INStartCallRequestMetadata *)v8 activities];
      uint64_t v10 = INIntentSlotValueTransformFromActivities(v9);
      goto LABEL_91;
    }
    if ([v5 payloadEventsCount])
    {
      if (v7 == 3)
      {
        id v8 = [v5 payloadEvents];
        INIntentSlotValueTransformFromEvents(v8);
      }
      else
      {
        id v8 = [v5 payloadEventAtIndex:0];
        INIntentSlotValueTransformFromEvent(v8);
      }
      goto LABEL_544;
    }
    if ([v5 payloadEventListsCount])
    {
      id v8 = [v5 payloadEventListAtIndex:0];
      id v9 = [(INStartCallRequestMetadata *)v8 events];
      uint64_t v10 = INIntentSlotValueTransformFromEvents(v9);
      goto LABEL_91;
    }
    if ([v5 payloadGeographicalFeaturesCount])
    {
      if (v7 == 3)
      {
        id v8 = [v5 payloadGeographicalFeatures];
        INIntentSlotValueTransformFromGeographicalFeatures(v8);
      }
      else
      {
        id v8 = [v5 payloadGeographicalFeatureAtIndex:0];
        INIntentSlotValueTransformFromGeographicalFeature(v8);
      }
      goto LABEL_544;
    }
    if ([v5 payloadGeographicalFeatureListsCount])
    {
      id v8 = [v5 payloadGeographicalFeatureListAtIndex:0];
      id v9 = [(INStartCallRequestMetadata *)v8 geographicalFeatures];
      uint64_t v10 = INIntentSlotValueTransformFromGeographicalFeatures(v9);
      goto LABEL_91;
    }
    if ([v5 payloadPersonalPlaceTypesCount])
    {
      v14 = NSNumber;
      uint64_t v15 = [v5 payloadPersonalPlaceTypeAtIndex:0];
      goto LABEL_96;
    }
    if ([v5 payloadPhotoAttributesCount])
    {
      if (v7 != 3)
      {
        v14 = NSNumber;
        uint64_t v15 = [v5 payloadPhotoAttributeAtIndex:0];
        goto LABEL_96;
      }
      uint64_t v57 = 0;
      if ([v5 payloadPhotoAttributesCount])
      {
        unint64_t v37 = 0;
        do
          INPhotoAttributeOptionsAddBackingType(&v57, [v5 payloadPhotoAttributeAtIndex:v37++]);
        while (v37 < [v5 payloadPhotoAttributesCount]);
        goto LABEL_143;
      }
      goto LABEL_488;
    }
    if ([v5 payloadPlacesCount])
    {
      if (v7 == 3)
      {
        id v8 = [v5 payloadPlaces];
        INIntentSlotValueTransformFromPlaces(v8);
      }
      else
      {
        id v8 = [v5 payloadPlaceAtIndex:0];
        INIntentSlotValueTransformFromPlace(v8);
      }
      goto LABEL_544;
    }
    if ([v5 payloadPlaceListsCount])
    {
      id v8 = [v5 payloadPlaceListAtIndex:0];
      id v9 = [(INStartCallRequestMetadata *)v8 places];
      uint64_t v10 = INIntentSlotValueTransformFromPlaces(v9);
      goto LABEL_91;
    }
    uint64_t v12 = 0;
  }
LABEL_68:

  return v12;
}

id __81__INIntentResolutionResult_Transform___objectForIntentSlotValue_slotDescription___block_invoke(uint64_t a1, void *a2)
{
  v3 = INIntentSlotValueTransformFromArchivedObject(a2);
  v4 = [INCodable alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [v3 messageData];
  uint64_t v7 = [(INCodable *)v4 initWithCodableDescription:v5 data:v6];

  id v8 = [*(id *)(a1 + 40) valueTransformer];
  id v9 = [v8 reverseTransformedValue:v7];

  return v9;
}

+ (INIntentResolutionResult)confirmationRequiredWithItemToConfirm:(id)itemToConfirm forReason:(NSInteger)reason
{
  uint64_t v5 = [a1 resolutionResultConfirmationRequiredWithItemToConfirm:itemToConfirm];
  [v5 setConfirmationReason:reason];

  return (INIntentResolutionResult *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentToExecute, 0);
  objc_storeStrong(&self->_itemToConfirm, 0);
  objc_storeStrong(&self->_resolvedValue, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);

  objc_storeStrong((id *)&self->_disambiguationItems, 0);
}

- (void)setIntentToExecute:(id)a3
{
}

- (INIntent)intentToExecute
{
  return self->_intentToExecute;
}

- (void)setConfirmationReason:(unint64_t)a3
{
  self->_confirmationReason = a3;
}

- (unint64_t)confirmationReason
{
  return self->_confirmationReason;
}

- (void)setUnsupportedReason:(unint64_t)a3
{
  self->_unsupportedReason = a3;
}

- (unint64_t)unsupportedReason
{
  return self->_unsupportedReason;
}

- (void)setItemToConfirm:(id)a3
{
}

- (id)itemToConfirm
{
  return self->_itemToConfirm;
}

- (void)setResolvedValue:(id)a3
{
}

- (id)resolvedValue
{
  return self->_resolvedValue;
}

- (void)setAlternatives:(id)a3
{
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (void)setDisambiguationItems:(id)a3
{
}

- (NSArray)disambiguationItems
{
  return self->_disambiguationItems;
}

- (void)setResolutionResultCode:(int64_t)a3
{
  self->_resolutionResultCode = a3;
}

- (int64_t)resolutionResultCode
{
  return self->_resolutionResultCode;
}

- (id)dictionaryRepresentation
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v13[0] = @"resolutionResultCode";
  v3 = [(INIntentResolutionResult *)self _stringForResultCode:[(INIntentResolutionResult *)self resolutionResultCode]];
  v14[0] = v3;
  v13[1] = @"disambiguationItems";
  disambiguationItems = self->_disambiguationItems;
  uint64_t v5 = disambiguationItems;
  if (!disambiguationItems)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v5;
  v13[2] = @"resolvedValue";
  id resolvedValue = self->_resolvedValue;
  uint64_t v7 = resolvedValue;
  if (!resolvedValue)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v7;
  v13[3] = @"itemToConfirm";
  id itemToConfirm = self->_itemToConfirm;
  id v9 = itemToConfirm;
  if (!itemToConfirm)
  {
    id v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[3] = v9;
  v13[4] = @"unsupportedReason";
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:self->_unsupportedReason];
  v14[4] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];

  if (itemToConfirm)
  {
    if (resolvedValue) {
      goto LABEL_9;
    }
LABEL_14:

    if (disambiguationItems) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!resolvedValue) {
    goto LABEL_14;
  }
LABEL_9:
  if (disambiguationItems) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v11;
}

- (id)_stringForResultCode:(int64_t)a3
{
  if ((unint64_t)a3 > 7) {
    return &stru_1EDA6DB28;
  }
  else {
    return off_1E551C6B0[a3];
  }
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  uint64_t v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INIntentResolutionResult;
  id v6 = [(INIntentResolutionResult *)&v11 description];
  uint64_t v7 = [(INIntentResolutionResult *)self dictionaryRepresentation];
  id v8 = [v7 descriptionAtIndent:a3];
  id v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INIntentResolutionResult *)self descriptionAtIndent:0];
}

- (id)_JSONDictionaryRepresentationForIntent:(id)a3 parameterName:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [INJSONEncoder alloc];
  id v9 = objc_alloc_init(INJSONEncoderConfiguration);
  uint64_t v10 = +[INPreferences siriLanguageCode];
  [(INJSONEncoderConfiguration *)v9 setLanguageCode:v10];

  v42 = [(INJSONEncoder *)v8 initWithConfiguration:v9];
  objc_super v11 = [v6 _codableDescription];
  uint64_t v12 = [v11 attributeByName:v7];

  uint64_t v13 = [v6 _intentInstanceDescription];
  v41 = [v13 slotByName:v7];

  int64_t v14 = [(INIntentResolutionResult *)self resolutionResultCode];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v16 = [(INIntentResolutionResult *)self _stringForResultCode:v14];
  objc_msgSend(v15, "if_setObjectIfNonNil:forKey:", v16, @"status");

  if (v14 == 3) {
    [(INIntentResolutionResult *)self itemToConfirm];
  }
  else {
  uint64_t v17 = [(INIntentResolutionResult *)self resolvedValue];
  }
  uint64_t v18 = [(INJSONEncoder *)v42 encodeObject:v17 withCodableAttribute:v12];
  objc_msgSend(v15, "if_setObjectIfNonNil:forKey:", v18, @"value");

  if ([(INIntentResolutionResult *)self unsupportedReason])
  {
    unint64_t v19 = objc_msgSend(v12, "unsupportedReasonWithIndex:", -[INIntentResolutionResult unsupportedReason](self, "unsupportedReason"));
    uint64_t v20 = [v19 code];
    objc_msgSend(v15, "if_setObjectIfNonNil:forKey:", v20, @"reason");
  }
  else
  {
    objc_msgSend(v15, "if_setObjectIfNonNil:forKey:", 0, @"reason");
  }
  uint64_t v21 = [(INIntentResolutionResult *)self disambiguationItems];

  if (v21)
  {
    unint64_t v37 = v15;
    id v38 = v7;
    id v39 = v6;
    id v22 = objc_alloc(MEMORY[0x1E4F1CA48]);
    int v23 = [(INIntentResolutionResult *)self disambiguationItems];
    uint64_t v24 = objc_msgSend(v22, "initWithCapacity:", objc_msgSend(v23, "count"));

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = [(INIntentResolutionResult *)self disambiguationItems];
    uint64_t v25 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          unint64_t v29 = self;
          if (*(void *)v44 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
          uint64_t v32 = [MEMORY[0x1E4F29128] UUID];
          long long v33 = [v32 UUIDString];
          objc_msgSend(v31, "if_setObjectIfNonNil:forKey:", v33, @"uuid");

          v34 = [(INJSONEncoder *)v42 encodeObject:v30 withCodableAttribute:v12];
          objc_msgSend(v31, "if_setObjectIfNonNil:forKey:", v34, @"value");

          self = v29;
          unint64_t v35 = [(INIntentResolutionResult *)v29 _vocabularyValueForObject:v30 slotDescription:v41];
          objc_msgSend(v31, "if_setObjectIfNonNil:forKey:", v35, @"vocabularyValue");

          [v24 addObject:v31];
        }
        uint64_t v26 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v26);
    }

    id v15 = v37;
    [v37 setObject:v24 forKey:@"selectionItems"];

    id v7 = v38;
    id v6 = v39;
  }
  objc_msgSend(v15, "if_setObjectIfNonNil:forKey:", v7, @"keyPath", v37);

  return v15;
}

- (INIntentResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v56 = "-[INIntentResolutionResult initWithJSONDictionary:forIntent:]";
    _os_log_debug_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_DEBUG, "%s _initWithJSONDictionary called", buf, 0xCu);
  }
  id v9 = [v6 objectForKey:@"status"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v10 = v9;
    if ([v10 isEqualToString:@"Success"])
    {
      uint64_t v11 = 0;
    }
    else if ([v10 isEqualToString:@"Unsupported"])
    {
      uint64_t v11 = 1;
    }
    else if ([v10 isEqualToString:@"NeedsDisambiguation"])
    {
      uint64_t v11 = 2;
    }
    else if ([v10 isEqualToString:@"NeedsConfirmation"])
    {
      uint64_t v11 = 3;
    }
    else if ([v10 isEqualToString:@"NeedsValue"])
    {
      uint64_t v11 = 4;
    }
    else if ([v10 isEqualToString:@"NotRequired"])
    {
      uint64_t v11 = 5;
    }
    else if ([v10 isEqualToString:@"NeedsExecuteIntent"])
    {
      uint64_t v11 = 6;
    }
    else if ([v10 isEqualToString:@"CalleeNotImplemented"])
    {
      uint64_t v11 = 7;
    }
    else
    {
      uint64_t v11 = 1;
    }

    uint64_t v13 = [(INIntentResolutionResult *)self _initWithResultCode:v11];
    if (v13)
    {
      v47 = objc_alloc_init(INJSONDecoder);
      int64_t v14 = [v6 objectForKey:@"keyPath"];
      if (v14)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v15 = v14;
        }
        else {
          id v15 = 0;
        }
      }
      else
      {
        id v15 = 0;
      }
      id v16 = v15;

      uint64_t v17 = [v7 _codableDescription];
      long long v46 = v16;
      uint64_t v18 = [v17 attributeByName:v16];

      uint64_t v19 = [v18 resolutionResultClass];
      if (v19)
      {
        uint64_t v20 = [v6 objectForKey:@"value"];
        if (v20)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v21 = [(INJSONDecoder *)v47 decodeWithCodableAttribute:v18 from:v20];
            uint64_t v22 = 4;
            if (v13[1] == 3) {
              uint64_t v22 = 5;
            }
            int v23 = (void *)v13[v22];
            v13[v22] = v21;
          }
        }
      }
      uint64_t v24 = [v6 objectForKey:@"reason"];
      if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v25 = [v18 unsupportedReasons];
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __61__INIntentResolutionResult_initWithJSONDictionary_forIntent___block_invoke;
        v52[3] = &unk_1E551C668;
        id v45 = v24;
        id v53 = v45;
        uint64_t v26 = objc_msgSend(v25, "if_firstObjectPassingTest:", v52);

        v13[6] = [v18 indexForUnsupportedReason:v26];
        uint64_t v24 = v53;
      }
      else
      {
        id v45 = 0;
      }

      uint64_t v27 = [v6 objectForKey:@"selectionItems"];
      if (v27)
      {
        uint64_t v28 = (void *)v27;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass) {
          uint64_t v30 = v28;
        }
        else {
          uint64_t v30 = 0;
        }
        id v31 = v30;

        if (v19 && (isKindOfClass & 1) != 0)
        {
          v42 = v13;
          id v43 = v7;
          id v44 = v6;
          uint64_t v32 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v31, "count"));
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v31 = v31;
          uint64_t v33 = [v31 countByEnumeratingWithState:&v48 objects:v54 count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = *(void *)v49;
            do
            {
              for (uint64_t i = 0; i != v34; ++i)
              {
                if (*(void *)v49 != v35) {
                  objc_enumerationMutation(v31);
                }
                unint64_t v37 = [*(id *)(*((void *)&v48 + 1) + 8 * i) objectForKey:@"value"];
                if (v37)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v38 = [(INJSONDecoder *)v47 decodeWithCodableAttribute:v18 from:v37];
                    [v32 addObject:v38];
                  }
                }
              }
              uint64_t v34 = [v31 countByEnumeratingWithState:&v48 objects:v54 count:16];
            }
            while (v34);
          }

          uint64_t v39 = [v32 copy];
          uint64_t v13 = v42;
          v40 = (void *)v42[2];
          v42[2] = v39;

          id v7 = v43;
          id v6 = v44;
        }
      }
      else
      {
        id v31 = 0;
      }
    }
    self = v13;
    uint64_t v12 = self;
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t __61__INIntentResolutionResult_initWithJSONDictionary_forIntent___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 code];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v53.receiver = self;
  v53.super_class = (Class)INIntentResolutionResult;
  id v8 = [(INIntentResolutionResult *)&v53 init];
  if (v8)
  {
    id v9 = 0;
    switch([v6 type])
    {
      case 1u:
        [(INIntentResolutionResult *)v8 setResolutionResultCode:0];
        id v10 = [v6 payloadSuccess];
        uint64_t v11 = [v10 resolvedValue];
        uint64_t v12 = [(INIntentResolutionResult *)v8 _objectForIntentSlotValue:v11 slotDescription:v7];
        [(INIntentResolutionResult *)v8 setResolvedValue:v12];
        goto LABEL_18;
      case 2u:
        [(INIntentResolutionResult *)v8 setResolutionResultCode:1];
        id v10 = [v6 payloadUnsupported];
        if ([v10 hasCustomUnsupportedReason]) {
          -[INIntentResolutionResult setUnsupportedReason:](v8, "setUnsupportedReason:", [v10 customUnsupportedReason]);
        }
        uint64_t v13 = [v10 conflictingParameters];
        int64_t v14 = [v13 firstObject];
        uint64_t v11 = [v14 alternateItems];

        if ([v11 count])
        {
          id v44 = v10;
          id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v43 = v11;
          id v16 = v11;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v49 objects:v55 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v50;
            do
            {
              uint64_t v20 = 0;
              do
              {
                if (*(void *)v50 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * v20), "value", v43);
                uint64_t v22 = [(INIntentResolutionResult *)v8 _objectForIntentSlotValue:v21 slotDescription:v7];
                [v15 addObject:v22];

                ++v20;
              }
              while (v18 != v20);
              uint64_t v18 = [v16 countByEnumeratingWithState:&v49 objects:v55 count:16];
            }
            while (v18);
          }

          [(INIntentResolutionResult *)v8 setAlternatives:v15];
          uint64_t v11 = v43;
          id v10 = v44;
        }
        goto LABEL_19;
      case 3u:
        int v23 = v8;
        uint64_t v24 = 4;
        goto LABEL_22;
      case 4u:
        int v23 = v8;
        uint64_t v24 = 2;
        goto LABEL_22;
      case 6u:
        [(INIntentResolutionResult *)v8 setResolutionResultCode:3];
        id v10 = [v6 payloadConfirmation];
        uint64_t v11 = [v10 confirmationItem];
        uint64_t v12 = [v11 value];
        uint64_t v25 = [(INIntentResolutionResult *)v8 _objectForIntentSlotValue:v12 slotDescription:v7];
        [(INIntentResolutionResult *)v8 setItemToConfirm:v25];

LABEL_18:
LABEL_19:

        break;
      case 7u:
        int v23 = v8;
        uint64_t v24 = 5;
        goto LABEL_22;
      case 8u:
      case 0xAu:
        goto LABEL_33;
      case 9u:
        int v23 = v8;
        uint64_t v24 = 7;
LABEL_22:
        [(INIntentResolutionResult *)v23 setResolutionResultCode:v24];
        break;
      case 0xBu:
        [(INIntentResolutionResult *)v8 setResolutionResultCode:6];
        id v38 = [v6 payloadNeedsExecuteIntent];
        uint64_t v39 = [v38 intentExecution];

        v40 = [v39 encodedIntent];
        v41 = [v40 dataUsingEncoding:4];
        v42 = INIntentCreate(0, v41);
        [(INIntentResolutionResult *)v8 setIntentToExecute:v42];

        break;
      default:
        break;
    }
  }
  uint64_t v26 = objc_msgSend(v6, "payloadNeedsDisambiguation", v43);
  uint64_t v27 = [v26 disambiguationItemsCount];

  if (v27)
  {
    uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v27];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    unint64_t v29 = [v6 payloadNeedsDisambiguation];
    uint64_t v30 = [v29 disambiguationItems];

    uint64_t v31 = [v30 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v46;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v46 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = [*(id *)(*((void *)&v45 + 1) + 8 * v34) value];
          uint64_t v36 = [(INIntentResolutionResult *)v8 _objectForIntentSlotValue:v35 slotDescription:v7];
          [v28 addObject:v36];

          ++v34;
        }
        while (v32 != v34);
        uint64_t v32 = [v30 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v32);
    }

    [(INIntentResolutionResult *)v8 setDisambiguationItems:v28];
  }
  id v9 = v8;
LABEL_33:

  return v9;
}

- (id)_initWithResolutionResult:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INIntentResolutionResult;
  uint64_t v5 = [(INIntentResolutionResult *)&v11 init];
  if (v5)
  {
    -[INIntentResolutionResult setResolutionResultCode:](v5, "setResolutionResultCode:", [v4 resolutionResultCode]);
    id v6 = [v4 disambiguationItems];
    [(INIntentResolutionResult *)v5 setDisambiguationItems:v6];

    id v7 = [v4 alternatives];
    [(INIntentResolutionResult *)v5 setAlternatives:v7];

    id v8 = [v4 resolvedValue];
    [(INIntentResolutionResult *)v5 setResolvedValue:v8];

    id v9 = [v4 itemToConfirm];
    [(INIntentResolutionResult *)v5 setItemToConfirm:v9];

    -[INIntentResolutionResult setUnsupportedReason:](v5, "setUnsupportedReason:", [v4 unsupportedReason]);
    -[INIntentResolutionResult setConfirmationReason:](v5, "setConfirmationReason:", [v4 confirmationReason]);
  }

  return v5;
}

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  return 0;
}

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  return 0;
}

- (id)_buildIntentSlotResolutionResultWithIntentSlotDescription:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v72 = a3;
  id v4 = objc_alloc_init(_INPBIntentSlotResolutionResult);
  v71 = self;
  switch([(INIntentResolutionResult *)self resolutionResultCode])
  {
    case 0:
      uint64_t v5 = objc_alloc_init(_INPBPayloadSuccess);
      id v6 = [v72 name];
      [(_INPBPayloadSuccess *)v5 setResolvedKeyPath:v6];

      id v7 = [(INIntentResolutionResult *)self resolvedValue];
      id v8 = [(INIntentResolutionResult *)self _intentSlotValueForObject:v7 slotDescription:v72];

      [(_INPBPayloadSuccess *)v5 setResolvedValue:v8];
      [(_INPBIntentSlotResolutionResult *)v4 setPayloadSuccess:v5];

      uint64_t v9 = 1;
      break;
    case 1:
      id v10 = objc_alloc_init(_INPBPayloadUnsupported);
      if ([(INIntentResolutionResult *)self unsupportedReason])
      {
        [(_INPBPayloadUnsupported *)v10 setReason:1000];
        [(_INPBPayloadUnsupported *)v10 setCustomUnsupportedReason:[(INIntentResolutionResult *)self unsupportedReason]];
      }
      else
      {
        [(_INPBPayloadUnsupported *)v10 setReason:1];
      }
      v41 = [(INIntentResolutionResult *)self alternatives];
      if ([v41 count])
      {
        v67 = v4;
        v42 = objc_alloc_init(_INPBConflictingParameter);
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        v66 = v41;
        id obj = v41;
        uint64_t v43 = [obj countByEnumeratingWithState:&v78 objects:v83 count:16];
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v45 = *(void *)v79;
          do
          {
            for (uint64_t i = 0; i != v44; ++i)
            {
              if (*(void *)v79 != v45) {
                objc_enumerationMutation(obj);
              }
              uint64_t v47 = *(void *)(*((void *)&v78 + 1) + 8 * i);
              long long v48 = objc_alloc_init(_INPBSelectionItem);
              long long v49 = [MEMORY[0x1E4F29128] UUID];
              long long v50 = [v49 UUIDString];
              [(_INPBSelectionItem *)v48 setUuid:v50];

              long long v51 = [(INIntentResolutionResult *)v71 _intentSlotValueForObject:v47 slotDescription:v72];
              [(_INPBSelectionItem *)v48 setValue:v51];

              long long v52 = [(INIntentResolutionResult *)v71 _vocabularyValueForObject:v47 slotDescription:v72];
              [(_INPBSelectionItem *)v48 setVocabularyValue:v52];

              [(_INPBConflictingParameter *)v42 addAlternateItems:v48];
            }
            uint64_t v44 = [obj countByEnumeratingWithState:&v78 objects:v83 count:16];
          }
          while (v44);
        }

        [(_INPBPayloadUnsupported *)v10 addConflictingParameters:v42];
        id v4 = v67;
        self = v71;
        v41 = v66;
      }
      [(_INPBIntentSlotResolutionResult *)v4 setPayloadUnsupported:v10];

      goto LABEL_26;
    case 2:
      uint64_t v9 = 4;
      break;
    case 3:
      objc_super v11 = objc_alloc_init(_INPBPayloadConfirmation);
      uint64_t v12 = objc_alloc_init(_INPBSelectionItem);
      uint64_t v13 = [MEMORY[0x1E4F29128] UUID];
      int64_t v14 = [v13 UUIDString];
      [(_INPBSelectionItem *)v12 setUuid:v14];

      id v15 = [(INIntentResolutionResult *)self itemToConfirm];
      id v16 = [(INIntentResolutionResult *)self _intentSlotValueForObject:v15 slotDescription:v72];
      [(_INPBSelectionItem *)v12 setValue:v16];

      uint64_t v17 = [(INIntentResolutionResult *)self itemToConfirm];
      uint64_t v18 = [(INIntentResolutionResult *)self _vocabularyValueForObject:v17 slotDescription:v72];
      [(_INPBSelectionItem *)v12 setVocabularyValue:v18];

      [(_INPBPayloadConfirmation *)v11 setConfirmationItem:v12];
      [(_INPBIntentSlotResolutionResult *)v4 setPayloadConfirmation:v11];

      uint64_t v9 = 6;
      break;
    case 4:
      uint64_t v19 = objc_alloc_init(_INPBPayloadNeedsValue);
      [(_INPBIntentSlotResolutionResult *)v4 setPayloadNeedsValue:v19];

      uint64_t v9 = 3;
      break;
    case 5:
      uint64_t v9 = 7;
      break;
    case 6:
      uint64_t v20 = objc_alloc_init(_INPBPayloadNeedsExecuteIntent);
      uint64_t v21 = objc_alloc_init(_INPBIntentExecutionRequest);
      uint64_t v22 = objc_alloc_init(_INPBAppIdentifier);
      int v23 = [(INIntentResolutionResult *)self intentToExecute];
      uint64_t v24 = [v23 launchId];
      [(_INPBAppIdentifier *)v22 setBundleIdentifier:v24];

      [(_INPBIntentExecutionRequest *)v21 setAppIdentifier:v22];
      [(_INPBIntentExecutionRequest *)v21 setEncodingFormat:1];
      uint64_t v25 = [(INIntentResolutionResult *)self intentToExecute];
      uint64_t v26 = [v25 _JSONDictionaryRepresentation];
      uint64_t v27 = objc_msgSend(v26, "if_JSONStringRepresentation");
      [(_INPBIntentExecutionRequest *)v21 setEncodedIntent:v27];

      uint64_t v28 = [(INIntentResolutionResult *)self intentToExecute];
      unint64_t v29 = [v28 _codableDescription];

      uint64_t v30 = [v29 schema];
      if (!v30)
      {
        uint64_t v31 = [(INIntentResolutionResult *)self intentToExecute];
        id v32 = [v31 extensionBundleId];

        if (!v32)
        {
          uint64_t v33 = [(INIntentResolutionResult *)self intentToExecute];
          uint64_t v34 = [v33 launchId];
          id v77 = 0;
          INExtractAppInfoFromSiriLaunchId(v34, &v77, 0);
          id v32 = v77;
        }
        uint64_t v35 = [v29 className];
        uint64_t v36 = [NSString stringWithFormat:@"%@%@.%@", @"sirikit.intents.custom.", v32, v35];

        uint64_t v30 = INSchemaWithTypeName(v36, 0, 0);
      }
      unint64_t v37 = [(INIntentResolutionResult *)self intentToExecute];
      id v38 = +[INStringLocalizer siriLocalizer];
      uint64_t v39 = [v30 dictionaryRepresentationForIntent:v37 localizer:v38];

      v40 = objc_msgSend(v39, "if_JSONStringRepresentation");
      [(_INPBIntentExecutionRequest *)v21 setEncodedIntentDefinition:v40];

      [(_INPBPayloadNeedsExecuteIntent *)v20 setIntentExecution:v21];
      [(_INPBIntentSlotResolutionResult *)v4 setPayloadNeedsExecuteIntent:v20];

      uint64_t v9 = 11;
      break;
    case 7:
      uint64_t v9 = 9;
      break;
    default:
LABEL_26:
      uint64_t v9 = 2;
      break;
  }
  objc_super v53 = [(INIntentResolutionResult *)self disambiguationItems];
  if (v53)
  {
    v68 = v4;
    v54 = objc_alloc_init(_INPBPayloadNeedsDisambiguation);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id obja = v53;
    uint64_t v55 = [obja countByEnumeratingWithState:&v73 objects:v82 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v74;
      do
      {
        for (uint64_t j = 0; j != v56; ++j)
        {
          if (*(void *)v74 != v57) {
            objc_enumerationMutation(obja);
          }
          uint64_t v59 = *(void *)(*((void *)&v73 + 1) + 8 * j);
          v60 = objc_alloc_init(_INPBSelectionItem);
          v61 = [MEMORY[0x1E4F29128] UUID];
          v62 = [v61 UUIDString];
          [(_INPBSelectionItem *)v60 setUuid:v62];

          v63 = [(INIntentResolutionResult *)v71 _intentSlotValueForObject:v59 slotDescription:v72];
          [(_INPBSelectionItem *)v60 setValue:v63];

          v64 = [(INIntentResolutionResult *)v71 _vocabularyValueForObject:v59 slotDescription:v72];
          [(_INPBSelectionItem *)v60 setVocabularyValue:v64];
          [(_INPBPayloadNeedsDisambiguation *)v54 addDisambiguationItems:v60];
        }
        uint64_t v56 = [obja countByEnumeratingWithState:&v73 objects:v82 count:16];
      }
      while (v56);
    }

    id v4 = v68;
    [(_INPBIntentSlotResolutionResult *)v68 setPayloadNeedsDisambiguation:v54];

    uint64_t v9 = v9;
  }
  [(_INPBIntentSlotResolutionResult *)v4 setType:v9];

  return v4;
}

- (id)_dataForIntentSlotDescription:(id)a3
{
  v3 = [(INIntentResolutionResult *)self _buildIntentSlotResolutionResultWithIntentSlotDescription:a3];
  id v4 = [v3 data];

  return v4;
}

- (void)transformResolutionResultForIntent:(id)a3 intentSlotDescription:(id)a4 withOptionsProvider:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int64_t v14 = [(INIntentResolutionResult *)self resolutionResultCode];
  id v15 = [v10 _metadata];
  id v16 = [v11 facadePropertyName];
  uint64_t v17 = [v15 forceNeedsValueForParameters];
  int v18 = [v17 containsObject:v16];

  if (v18)
  {
    uint64_t v19 = [v10 valueForKey:v16];
    if (v19 || v14 == 2)
    {
    }
    else if (v14 != 3)
    {
      int64_t v14 = 4;
      [(INIntentResolutionResult *)self setResolutionResultCode:4];
    }
    uint64_t v17 = [v15 forceNeedsValueForParameters];
    uint64_t v20 = objc_msgSend(v17, "if_arrayByRemovingObject:", v16);
    [v15 setForceNeedsValueForParameters:v20];
  }
  if (v14 == 4 || v14 == 1)
  {
    uint64_t v17 = [v11 provideOptionsSelectorStrings];
    BOOL v21 = [v17 count] != 0;
  }
  else
  {
    BOOL v21 = 0;
  }
  if (v14 == 4 || v14 == 1) {

  }
  if (v21)
  {
    uint64_t v22 = [v11 name];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __116__INIntentResolutionResult_transformResolutionResultForIntent_intentSlotDescription_withOptionsProvider_completion___block_invoke;
    v23[3] = &unk_1E551C640;
    id v24 = v11;
    id v28 = v13;
    uint64_t v25 = self;
    id v26 = v12;
    id v27 = v10;
    int64_t v29 = v14;
    [v26 getSupportsParameterOptionsForParameterNamed:v22 intent:v27 completionHandler:v23];
  }
  else
  {
    (*((void (**)(id, INIntentResolutionResult *))v13 + 2))(v13, self);
  }
}

void __116__INIntentResolutionResult_transformResolutionResultForIntent_intentSlotDescription_withOptionsProvider_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2
    && ([*(id *)(a1 + 32) codableAttribute],
        v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 supportsSearch],
        v3,
        !v4))
  {
    id v6 = *(void **)(a1 + 48);
    id v7 = [*(id *)(a1 + 32) name];
    uint64_t v9 = *(void *)(a1 + 56);
    id v8 = *(void **)(a1 + 64);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __116__INIntentResolutionResult_transformResolutionResultForIntent_intentSlotDescription_withOptionsProvider_completion___block_invoke_2;
    v11[3] = &unk_1E551C618;
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 72);
    v11[4] = v10;
    id v12 = v8;
    [v6 getParameterOptionsForParameterNamed:v7 intent:v9 searchTerm:0 completionBlock:v11];
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v5();
  }
}

- (id)resolutionResultDataForIntent:(id)a3 intentSlotDescription:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0;
  }
  return [(INIntentResolutionResult *)self _dataForIntentSlotDescription:a4];
}

- (id)_initWithResultCode:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)INIntentResolutionResult;
  int v4 = [(INIntentResolutionResult *)&v7 init];
  uint64_t v5 = v4;
  if (v4) {
    [(INIntentResolutionResult *)v4 setResolutionResultCode:a3];
  }
  return v5;
}

+ (id)_dataForResolutionMethodUnimplemented
{
  v2 = objc_alloc_init(_INPBIntentSlotResolutionResult);
  [(_INPBIntentSlotResolutionResult *)v2 setType:9];
  v3 = [(_INPBIntentSlotResolutionResult *)v2 data];

  return v3;
}

+ (id)requiresExecutionOfIntent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) _initWithResultCode:6];
  id v6 = [v4 _metadata];
  objc_super v7 = (void *)MEMORY[0x1E4F1C9B8];
  id v8 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v9 = v8;
  if (v8) {
    objc_msgSend(v8, "if_auditToken");
  }
  else {
    memset(v12, 0, sizeof(v12));
  }
  uint64_t v10 = objc_msgSend(v7, "if_dataWithAuditToken:", v12);
  [v6 setAuditTokenData:v10];

  [v5 setIntentToExecute:v4];

  return v5;
}

+ (id)resolutionResultUnsupportedWithReason:(unint64_t)a3 alternativeItems:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a1 resolutionResultUnsupportedWithReason:a3];
  [v7 setAlternatives:v6];

  return v7;
}

+ (id)resolutionResultUnsupportedWithReason:(unint64_t)a3
{
  id v4 = (void *)[objc_alloc((Class)a1) _initWithResultCode:1];
  [v4 setUnsupportedReason:a3];

  return v4;
}

+ (id)resolutionResultConfirmationRequiredWithItemToConfirm:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) _initWithResultCode:3];
  id v6 = v5;
  if (v5) {
    [v5 setItemToConfirm:v4];
  }

  return v6;
}

+ (id)resolutionResultDisambiguationWithItemsToDisambiguate:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] >= 2
    && (uint64_t v5 = (void *)[objc_alloc((Class)a1) _initWithResultCode:2]) != 0)
  {
    id v6 = v5;
    [v5 setDisambiguationItems:v4];
  }
  else if ([v4 count] == 1)
  {
    id v6 = (void *)[objc_alloc((Class)a1) _initWithResultCode:3];
    if (v6)
    {
      objc_super v7 = [v4 firstObject];
      [v6 setItemToConfirm:v7];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)resolutionResultSuccessWithResolvedValue:(id)a3
{
  id v4 = a3;
  if (v4 && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || [v4 count]))
  {
    uint64_t v5 = (void *)[objc_alloc((Class)a1) _initWithResultCode:0];
    id v6 = v5;
    if (v5) {
      [v5 setResolvedValue:v4];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (INIntentResolutionResult)unsupported
{
  v2 = (void *)[objc_alloc((Class)a1) _initWithResultCode:1];

  return (INIntentResolutionResult *)v2;
}

+ (INIntentResolutionResult)notRequired
{
  v2 = (void *)[objc_alloc((Class)a1) _initWithResultCode:5];

  return (INIntentResolutionResult *)v2;
}

+ (INIntentResolutionResult)needsValue
{
  v2 = (void *)[objc_alloc((Class)a1) _initWithResultCode:4];

  return (INIntentResolutionResult *)v2;
}

@end