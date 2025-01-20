@interface _INPBIntentSlotValue
+ (BOOL)supportsSecureCoding;
+ (Class)payloadActivityListType;
+ (Class)payloadActivityType;
+ (Class)payloadAlarmSearchType;
+ (Class)payloadAlarmType;
+ (Class)payloadAnnouncementType;
+ (Class)payloadAppIdentifierType;
+ (Class)payloadArchivedObjectType;
+ (Class)payloadBillDetailsValueType;
+ (Class)payloadBillPayeeValueType;
+ (Class)payloadCalendarEventType;
+ (Class)payloadCallGroupConversationType;
+ (Class)payloadCallGroupType;
+ (Class)payloadCallRecordFilterType;
+ (Class)payloadCallRecordValueType;
+ (Class)payloadContactEventTriggerType;
+ (Class)payloadContactListType;
+ (Class)payloadContactValueType;
+ (Class)payloadCurrencyAmountType;
+ (Class)payloadCustomObjectType;
+ (Class)payloadDataStringListType;
+ (Class)payloadDataStringType;
+ (Class)payloadDateTimeRangeListType;
+ (Class)payloadDateTimeRangeValueType;
+ (Class)payloadDateTimeValueType;
+ (Class)payloadDeviceDetailType;
+ (Class)payloadDeviceType;
+ (Class)payloadDialingContactType;
+ (Class)payloadDistanceListType;
+ (Class)payloadDistanceValueType;
+ (Class)payloadDoubleListType;
+ (Class)payloadDoubleValueType;
+ (Class)payloadEnergyValueType;
+ (Class)payloadEventListType;
+ (Class)payloadEventParticipantType;
+ (Class)payloadEventType;
+ (Class)payloadFilePropertyType;
+ (Class)payloadFilePropertyValueType;
+ (Class)payloadFileType;
+ (Class)payloadFinancialAccountValueType;
+ (Class)payloadGeographicalFeatureListType;
+ (Class)payloadGeographicalFeatureType;
+ (Class)payloadGetSettingResponseDataType;
+ (Class)payloadHomeAttributeType;
+ (Class)payloadHomeAttributeValueType;
+ (Class)payloadHomeEntityType;
+ (Class)payloadHomeFilterType;
+ (Class)payloadHomeUserTaskType;
+ (Class)payloadIntegerListType;
+ (Class)payloadIntegerValueType;
+ (Class)payloadIntentExecutionResultType;
+ (Class)payloadIntentType;
+ (Class)payloadLocationListType;
+ (Class)payloadLocationType;
+ (Class)payloadLongListType;
+ (Class)payloadLongValueType;
+ (Class)payloadMassValueType;
+ (Class)payloadMediaDestinationType;
+ (Class)payloadMediaItemGroupType;
+ (Class)payloadMediaItemValueType;
+ (Class)payloadMediaSearchType;
+ (Class)payloadModifyNicknameType;
+ (Class)payloadModifyRelationshipType;
+ (Class)payloadNoteContentType;
+ (Class)payloadNoteType;
+ (Class)payloadNumericSettingValueType;
+ (Class)payloadPaymentAmountValueType;
+ (Class)payloadPaymentMethodListType;
+ (Class)payloadPaymentMethodValueType;
+ (Class)payloadPlaceListType;
+ (Class)payloadPlaceType;
+ (Class)payloadPrivateAddMediaIntentDataType;
+ (Class)payloadPrivatePlayMediaIntentDataType;
+ (Class)payloadPrivateSearchForMediaIntentDataType;
+ (Class)payloadPrivateUpdateMediaAffinityIntentDataType;
+ (Class)payloadSendMessageAttachmentType;
+ (Class)payloadSettingMetadataType;
+ (Class)payloadShareDestinationType;
+ (Class)payloadSleepAlarmAttributeType;
+ (Class)payloadSpatialEventTriggerType;
+ (Class)payloadSpeedValueType;
+ (Class)payloadStartCallRequestMetadataType;
+ (Class)payloadStringListType;
+ (Class)payloadStringValueType;
+ (Class)payloadSupportedTrafficIncidentTypeType;
+ (Class)payloadTaskListType;
+ (Class)payloadTaskType;
+ (Class)payloadTemperatureListType;
+ (Class)payloadTemperatureValueType;
+ (Class)payloadTemporalEventTriggerType;
+ (Class)payloadTimerType;
+ (Class)payloadURLValueType;
+ (Class)payloadVoiceCommandDeviceInformationType;
+ (Class)payloadVolumeValueType;
+ (Class)payloadWellnessMetadataPairType;
+ (Class)payloadWellnessObjectResultValueType;
+ (Class)payloadWellnessUnitTypeType;
+ (Class)payloadWellnessValueType;
+ (Class)payloadWorkoutAssociatedItemType;
+ (Class)payloadWorkoutCustomizationType;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)payloadPrimitiveBoolAtIndex:(unint64_t)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)payloadActivities;
- (NSArray)payloadActivityLists;
- (NSArray)payloadAlarmSearchs;
- (NSArray)payloadAlarms;
- (NSArray)payloadAnnouncements;
- (NSArray)payloadAppIdentifiers;
- (NSArray)payloadArchivedObjects;
- (NSArray)payloadBillDetailsValues;
- (NSArray)payloadBillPayeeValues;
- (NSArray)payloadCalendarEvents;
- (NSArray)payloadCallGroupConversations;
- (NSArray)payloadCallGroups;
- (NSArray)payloadCallRecordFilters;
- (NSArray)payloadCallRecordValues;
- (NSArray)payloadChargingConnectorTypes;
- (NSArray)payloadContactEventTriggers;
- (NSArray)payloadContactLists;
- (NSArray)payloadContactValues;
- (NSArray)payloadCurrencyAmounts;
- (NSArray)payloadCustomObjects;
- (NSArray)payloadDataStringLists;
- (NSArray)payloadDataStrings;
- (NSArray)payloadDateTimeRangeLists;
- (NSArray)payloadDateTimeRangeValues;
- (NSArray)payloadDateTimeValues;
- (NSArray)payloadDeviceDetails;
- (NSArray)payloadDevices;
- (NSArray)payloadDialingContacts;
- (NSArray)payloadDistanceLists;
- (NSArray)payloadDistanceValues;
- (NSArray)payloadDoubleLists;
- (NSArray)payloadDoubleValues;
- (NSArray)payloadEnergyValues;
- (NSArray)payloadEnumerations;
- (NSArray)payloadEventLists;
- (NSArray)payloadEventParticipants;
- (NSArray)payloadEvents;
- (NSArray)payloadFileProperties;
- (NSArray)payloadFilePropertyValues;
- (NSArray)payloadFiles;
- (NSArray)payloadFinancialAccountValues;
- (NSArray)payloadGeographicalFeatureLists;
- (NSArray)payloadGeographicalFeatures;
- (NSArray)payloadGetSettingResponseDatas;
- (NSArray)payloadHomeAttributeValues;
- (NSArray)payloadHomeAttributes;
- (NSArray)payloadHomeEntities;
- (NSArray)payloadHomeFilters;
- (NSArray)payloadHomeUserTasks;
- (NSArray)payloadIntegerLists;
- (NSArray)payloadIntegerValues;
- (NSArray)payloadIntentExecutionResults;
- (NSArray)payloadIntents;
- (NSArray)payloadLocationLists;
- (NSArray)payloadLocations;
- (NSArray)payloadLongLists;
- (NSArray)payloadLongValues;
- (NSArray)payloadMassValues;
- (NSArray)payloadMediaDestinations;
- (NSArray)payloadMediaItemGroups;
- (NSArray)payloadMediaItemValues;
- (NSArray)payloadMediaSearchs;
- (NSArray)payloadModifyNicknames;
- (NSArray)payloadModifyRelationships;
- (NSArray)payloadNoteContents;
- (NSArray)payloadNotes;
- (NSArray)payloadNumericSettingValues;
- (NSArray)payloadPaymentAmountValues;
- (NSArray)payloadPaymentMethodLists;
- (NSArray)payloadPaymentMethodValues;
- (NSArray)payloadPlaceLists;
- (NSArray)payloadPlaces;
- (NSArray)payloadPrimitiveBools;
- (NSArray)payloadPrimitiveDoubles;
- (NSArray)payloadPrimitiveInts;
- (NSArray)payloadPrimitiveLongs;
- (NSArray)payloadPrimitiveStrings;
- (NSArray)payloadPrivateAddMediaIntentDatas;
- (NSArray)payloadPrivatePlayMediaIntentDatas;
- (NSArray)payloadPrivateSearchForMediaIntentDatas;
- (NSArray)payloadPrivateUpdateMediaAffinityIntentDatas;
- (NSArray)payloadSendMessageAttachments;
- (NSArray)payloadSettingMetadatas;
- (NSArray)payloadShareDestinations;
- (NSArray)payloadSleepAlarmAttributes;
- (NSArray)payloadSpatialEventTriggers;
- (NSArray)payloadSpeedValues;
- (NSArray)payloadStartCallRequestMetadatas;
- (NSArray)payloadStringLists;
- (NSArray)payloadStringValues;
- (NSArray)payloadSupportedTrafficIncidentTypes;
- (NSArray)payloadTaskLists;
- (NSArray)payloadTasks;
- (NSArray)payloadTemperatureLists;
- (NSArray)payloadTemperatureValues;
- (NSArray)payloadTemporalEventTriggers;
- (NSArray)payloadTimers;
- (NSArray)payloadURLValues;
- (NSArray)payloadVoiceCommandDeviceInformations;
- (NSArray)payloadVolumeValues;
- (NSArray)payloadWellnessMetadataPairs;
- (NSArray)payloadWellnessObjectResultValues;
- (NSArray)payloadWellnessUnitTypes;
- (NSArray)payloadWellnessValues;
- (NSArray)payloadWorkoutAssociatedItems;
- (NSArray)payloadWorkoutCustomizations;
- (_INPBIntentSlotValue)initWithCoder:(id)a3;
- (double)payloadPrimitiveDoubleAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)payloadAccountTypesAsString:(int)a3;
- (id)payloadActivityAtIndex:(unint64_t)a3;
- (id)payloadActivityListAtIndex:(unint64_t)a3;
- (id)payloadAlarmAtIndex:(unint64_t)a3;
- (id)payloadAlarmPeriodsAsString:(int)a3;
- (id)payloadAlarmRepeatSchedulesAsString:(int)a3;
- (id)payloadAlarmSearchAtIndex:(unint64_t)a3;
- (id)payloadAlarmSearchTypesAsString:(int)a3;
- (id)payloadAnnouncementAtIndex:(unint64_t)a3;
- (id)payloadAppIdentifierAtIndex:(unint64_t)a3;
- (id)payloadArchivedObjectAtIndex:(unint64_t)a3;
- (id)payloadBalanceTypesAsString:(int)a3;
- (id)payloadBillDetailsValueAtIndex:(unint64_t)a3;
- (id)payloadBillPayeeValueAtIndex:(unint64_t)a3;
- (id)payloadBillTypesAsString:(int)a3;
- (id)payloadBinarySettingValuesAsString:(int)a3;
- (id)payloadBoundedSettingValuesAsString:(int)a3;
- (id)payloadCalendarEventAtIndex:(unint64_t)a3;
- (id)payloadCallAudioRoutesAsString:(int)a3;
- (id)payloadCallCapabilitiesAsString:(int)a3;
- (id)payloadCallDestinationTypesAsString:(int)a3;
- (id)payloadCallGroupAtIndex:(unint64_t)a3;
- (id)payloadCallGroupConversationAtIndex:(unint64_t)a3;
- (id)payloadCallRecordFilterAtIndex:(unint64_t)a3;
- (id)payloadCallRecordTypesAsString:(int)a3;
- (id)payloadCallRecordValueAtIndex:(unint64_t)a3;
- (id)payloadCarAirCirculationModesAsString:(int)a3;
- (id)payloadCarAudioSourcesAsString:(int)a3;
- (id)payloadCarDefrostersAsString:(int)a3;
- (id)payloadCarSeatsAsString:(int)a3;
- (id)payloadCarSignalIdentifiersAsString:(int)a3;
- (id)payloadChangeAlarmStatusOperationsAsString:(int)a3;
- (id)payloadChargingConnectorTypeAtIndex:(unint64_t)a3;
- (id)payloadContactEventTriggerAtIndex:(unint64_t)a3;
- (id)payloadContactListAtIndex:(unint64_t)a3;
- (id)payloadContactValueAtIndex:(unint64_t)a3;
- (id)payloadCurrencyAmountAtIndex:(unint64_t)a3;
- (id)payloadCustomObjectAtIndex:(unint64_t)a3;
- (id)payloadDataStringAtIndex:(unint64_t)a3;
- (id)payloadDataStringListAtIndex:(unint64_t)a3;
- (id)payloadDateSearchTypesAsString:(int)a3;
- (id)payloadDateTimeRangeListAtIndex:(unint64_t)a3;
- (id)payloadDateTimeRangeValueAtIndex:(unint64_t)a3;
- (id)payloadDateTimeValueAtIndex:(unint64_t)a3;
- (id)payloadDeviceAtIndex:(unint64_t)a3;
- (id)payloadDeviceDetailAtIndex:(unint64_t)a3;
- (id)payloadDeviceTypesAsString:(int)a3;
- (id)payloadDialingContactAtIndex:(unint64_t)a3;
- (id)payloadDistanceListAtIndex:(unint64_t)a3;
- (id)payloadDistanceValueAtIndex:(unint64_t)a3;
- (id)payloadDoubleListAtIndex:(unint64_t)a3;
- (id)payloadDoubleValueAtIndex:(unint64_t)a3;
- (id)payloadEnergyValueAtIndex:(unint64_t)a3;
- (id)payloadEventAtIndex:(unint64_t)a3;
- (id)payloadEventAttributesAsString:(int)a3;
- (id)payloadEventListAtIndex:(unint64_t)a3;
- (id)payloadEventParticipantAtIndex:(unint64_t)a3;
- (id)payloadFileAtIndex:(unint64_t)a3;
- (id)payloadFileEntityTypesAsString:(int)a3;
- (id)payloadFilePropertyAtIndex:(unint64_t)a3;
- (id)payloadFilePropertyNamesAsString:(int)a3;
- (id)payloadFilePropertyQualifiersAsString:(int)a3;
- (id)payloadFilePropertyValueAtIndex:(unint64_t)a3;
- (id)payloadFileSearchScopesAsString:(int)a3;
- (id)payloadFileShareModesAsString:(int)a3;
- (id)payloadFileTypesAsString:(int)a3;
- (id)payloadFinancialAccountValueAtIndex:(unint64_t)a3;
- (id)payloadGeographicalFeatureAtIndex:(unint64_t)a3;
- (id)payloadGeographicalFeatureListAtIndex:(unint64_t)a3;
- (id)payloadGetSettingResponseDataAtIndex:(unint64_t)a3;
- (id)payloadHomeAttributeAtIndex:(unint64_t)a3;
- (id)payloadHomeAttributeTypesAsString:(int)a3;
- (id)payloadHomeAttributeValueAtIndex:(unint64_t)a3;
- (id)payloadHomeAttributeValueTypesAsString:(int)a3;
- (id)payloadHomeDeviceTypesAsString:(int)a3;
- (id)payloadHomeEntityAtIndex:(unint64_t)a3;
- (id)payloadHomeEntityTypesAsString:(int)a3;
- (id)payloadHomeFilterAtIndex:(unint64_t)a3;
- (id)payloadHomeUserTaskAtIndex:(unint64_t)a3;
- (id)payloadIntegerListAtIndex:(unint64_t)a3;
- (id)payloadIntegerValueAtIndex:(unint64_t)a3;
- (id)payloadIntentAtIndex:(unint64_t)a3;
- (id)payloadIntentExecutionResultAtIndex:(unint64_t)a3;
- (id)payloadLocationAtIndex:(unint64_t)a3;
- (id)payloadLocationListAtIndex:(unint64_t)a3;
- (id)payloadLocationSearchTypesAsString:(int)a3;
- (id)payloadLongListAtIndex:(unint64_t)a3;
- (id)payloadLongValueAtIndex:(unint64_t)a3;
- (id)payloadMassValueAtIndex:(unint64_t)a3;
- (id)payloadMediaAffinityTypesAsString:(int)a3;
- (id)payloadMediaDestinationAtIndex:(unint64_t)a3;
- (id)payloadMediaItemGroupAtIndex:(unint64_t)a3;
- (id)payloadMediaItemValueAtIndex:(unint64_t)a3;
- (id)payloadMediaSearchAtIndex:(unint64_t)a3;
- (id)payloadMessageAttributesAsString:(int)a3;
- (id)payloadMessageEffectsAsString:(int)a3;
- (id)payloadMessageTypesAsString:(int)a3;
- (id)payloadModifyNicknameAtIndex:(unint64_t)a3;
- (id)payloadModifyRelationshipAtIndex:(unint64_t)a3;
- (id)payloadNoteAtIndex:(unint64_t)a3;
- (id)payloadNoteContentAtIndex:(unint64_t)a3;
- (id)payloadNotebookItemTypesAsString:(int)a3;
- (id)payloadNumericSettingUnitsAsString:(int)a3;
- (id)payloadNumericSettingValueAtIndex:(unint64_t)a3;
- (id)payloadOutgoingMessageTypesAsString:(int)a3;
- (id)payloadParsecCategoriesAsString:(int)a3;
- (id)payloadPaymentAmountValueAtIndex:(unint64_t)a3;
- (id)payloadPaymentMethodListAtIndex:(unint64_t)a3;
- (id)payloadPaymentMethodValueAtIndex:(unint64_t)a3;
- (id)payloadPaymentStatusAsString:(int)a3;
- (id)payloadPersonalPlaceTypesAsString:(int)a3;
- (id)payloadPhotoAttributesAsString:(int)a3;
- (id)payloadPlaceAtIndex:(unint64_t)a3;
- (id)payloadPlaceListAtIndex:(unint64_t)a3;
- (id)payloadPlaybackQueueLocationsAsString:(int)a3;
- (id)payloadPlaybackRepeatModesAsString:(int)a3;
- (id)payloadPreferredCallProvidersAsString:(int)a3;
- (id)payloadPrimitiveStringAtIndex:(unint64_t)a3;
- (id)payloadPrivateAddMediaIntentDataAtIndex:(unint64_t)a3;
- (id)payloadPrivatePlayMediaIntentDataAtIndex:(unint64_t)a3;
- (id)payloadPrivateSearchForMediaIntentDataAtIndex:(unint64_t)a3;
- (id)payloadPrivateUpdateMediaAffinityIntentDataAtIndex:(unint64_t)a3;
- (id)payloadRadioTypesAsString:(int)a3;
- (id)payloadReadActionTypesAsString:(int)a3;
- (id)payloadRelativeReferencesAsString:(int)a3;
- (id)payloadRelativeSettingsAsString:(int)a3;
- (id)payloadSendMessageAttachmentAtIndex:(unint64_t)a3;
- (id)payloadSettingActionsAsString:(int)a3;
- (id)payloadSettingMetadataAtIndex:(unint64_t)a3;
- (id)payloadShareDestinationAtIndex:(unint64_t)a3;
- (id)payloadSleepAlarmAttributeAtIndex:(unint64_t)a3;
- (id)payloadSpatialEventTriggerAtIndex:(unint64_t)a3;
- (id)payloadSpeedValueAtIndex:(unint64_t)a3;
- (id)payloadStartCallRequestMetadataAtIndex:(unint64_t)a3;
- (id)payloadStringListAtIndex:(unint64_t)a3;
- (id)payloadStringValueAtIndex:(unint64_t)a3;
- (id)payloadSupportedTrafficIncidentTypeAtIndex:(unint64_t)a3;
- (id)payloadTaskAtIndex:(unint64_t)a3;
- (id)payloadTaskListAtIndex:(unint64_t)a3;
- (id)payloadTaskPrioritiesAsString:(int)a3;
- (id)payloadTaskReferencesAsString:(int)a3;
- (id)payloadTaskStatusAsString:(int)a3;
- (id)payloadTemperatureListAtIndex:(unint64_t)a3;
- (id)payloadTemperatureValueAtIndex:(unint64_t)a3;
- (id)payloadTemporalEventTriggerAtIndex:(unint64_t)a3;
- (id)payloadTemporalEventTriggerTypesAsString:(int)a3;
- (id)payloadTimerAtIndex:(unint64_t)a3;
- (id)payloadTimerStatesAsString:(int)a3;
- (id)payloadTimerTypesAsString:(int)a3;
- (id)payloadURLValueAtIndex:(unint64_t)a3;
- (id)payloadUpdateAlarmOperationsAsString:(int)a3;
- (id)payloadUserNotificationTypesAsString:(int)a3;
- (id)payloadVisualCodeTypesAsString:(int)a3;
- (id)payloadVoiceCommandDeviceInformationAtIndex:(unint64_t)a3;
- (id)payloadVolumeValueAtIndex:(unint64_t)a3;
- (id)payloadWellnessMetadataPairAtIndex:(unint64_t)a3;
- (id)payloadWellnessObjectResultValueAtIndex:(unint64_t)a3;
- (id)payloadWellnessObjectTypesAsString:(int)a3;
- (id)payloadWellnessQueryResultTypesAsString:(int)a3;
- (id)payloadWellnessQuestionTypesAsString:(int)a3;
- (id)payloadWellnessUnitTypeAtIndex:(unint64_t)a3;
- (id)payloadWellnessValueAtIndex:(unint64_t)a3;
- (id)payloadWorkoutAssociatedItemAtIndex:(unint64_t)a3;
- (id)payloadWorkoutCustomizationAtIndex:(unint64_t)a3;
- (id)payloadWorkoutGoalUnitTypesAsString:(int)a3;
- (id)payloadWorkoutLocationTypesAsString:(int)a3;
- (id)payloadWorkoutSequenceLabelsAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsPayloadAccountTypes:(id)a3;
- (int)StringAsPayloadAlarmPeriods:(id)a3;
- (int)StringAsPayloadAlarmRepeatSchedules:(id)a3;
- (int)StringAsPayloadAlarmSearchTypes:(id)a3;
- (int)StringAsPayloadBalanceTypes:(id)a3;
- (int)StringAsPayloadBillTypes:(id)a3;
- (int)StringAsPayloadBinarySettingValues:(id)a3;
- (int)StringAsPayloadBoundedSettingValues:(id)a3;
- (int)StringAsPayloadCallAudioRoutes:(id)a3;
- (int)StringAsPayloadCallCapabilities:(id)a3;
- (int)StringAsPayloadCallDestinationTypes:(id)a3;
- (int)StringAsPayloadCallRecordTypes:(id)a3;
- (int)StringAsPayloadCarAirCirculationModes:(id)a3;
- (int)StringAsPayloadCarAudioSources:(id)a3;
- (int)StringAsPayloadCarDefrosters:(id)a3;
- (int)StringAsPayloadCarSeats:(id)a3;
- (int)StringAsPayloadCarSignalIdentifiers:(id)a3;
- (int)StringAsPayloadChangeAlarmStatusOperations:(id)a3;
- (int)StringAsPayloadDateSearchTypes:(id)a3;
- (int)StringAsPayloadDeviceTypes:(id)a3;
- (int)StringAsPayloadEventAttributes:(id)a3;
- (int)StringAsPayloadFileEntityTypes:(id)a3;
- (int)StringAsPayloadFilePropertyNames:(id)a3;
- (int)StringAsPayloadFilePropertyQualifiers:(id)a3;
- (int)StringAsPayloadFileSearchScopes:(id)a3;
- (int)StringAsPayloadFileShareModes:(id)a3;
- (int)StringAsPayloadFileTypes:(id)a3;
- (int)StringAsPayloadHomeAttributeTypes:(id)a3;
- (int)StringAsPayloadHomeAttributeValueTypes:(id)a3;
- (int)StringAsPayloadHomeDeviceTypes:(id)a3;
- (int)StringAsPayloadHomeEntityTypes:(id)a3;
- (int)StringAsPayloadLocationSearchTypes:(id)a3;
- (int)StringAsPayloadMediaAffinityTypes:(id)a3;
- (int)StringAsPayloadMessageAttributes:(id)a3;
- (int)StringAsPayloadMessageEffects:(id)a3;
- (int)StringAsPayloadMessageTypes:(id)a3;
- (int)StringAsPayloadNotebookItemTypes:(id)a3;
- (int)StringAsPayloadNumericSettingUnits:(id)a3;
- (int)StringAsPayloadOutgoingMessageTypes:(id)a3;
- (int)StringAsPayloadParsecCategories:(id)a3;
- (int)StringAsPayloadPaymentStatus:(id)a3;
- (int)StringAsPayloadPersonalPlaceTypes:(id)a3;
- (int)StringAsPayloadPhotoAttributes:(id)a3;
- (int)StringAsPayloadPlaybackQueueLocations:(id)a3;
- (int)StringAsPayloadPlaybackRepeatModes:(id)a3;
- (int)StringAsPayloadPreferredCallProviders:(id)a3;
- (int)StringAsPayloadRadioTypes:(id)a3;
- (int)StringAsPayloadReadActionTypes:(id)a3;
- (int)StringAsPayloadRelativeReferences:(id)a3;
- (int)StringAsPayloadRelativeSettings:(id)a3;
- (int)StringAsPayloadSettingActions:(id)a3;
- (int)StringAsPayloadTaskPriorities:(id)a3;
- (int)StringAsPayloadTaskReferences:(id)a3;
- (int)StringAsPayloadTaskStatus:(id)a3;
- (int)StringAsPayloadTemporalEventTriggerTypes:(id)a3;
- (int)StringAsPayloadTimerStates:(id)a3;
- (int)StringAsPayloadTimerTypes:(id)a3;
- (int)StringAsPayloadUpdateAlarmOperations:(id)a3;
- (int)StringAsPayloadUserNotificationTypes:(id)a3;
- (int)StringAsPayloadVisualCodeTypes:(id)a3;
- (int)StringAsPayloadWellnessObjectTypes:(id)a3;
- (int)StringAsPayloadWellnessQueryResultTypes:(id)a3;
- (int)StringAsPayloadWellnessQuestionTypes:(id)a3;
- (int)StringAsPayloadWorkoutGoalUnitTypes:(id)a3;
- (int)StringAsPayloadWorkoutLocationTypes:(id)a3;
- (int)StringAsPayloadWorkoutSequenceLabels:(id)a3;
- (int)StringAsType:(id)a3;
- (int)payloadAccountTypeAtIndex:(unint64_t)a3;
- (int)payloadAccountTypes;
- (int)payloadAlarmPeriodAtIndex:(unint64_t)a3;
- (int)payloadAlarmPeriods;
- (int)payloadAlarmRepeatScheduleAtIndex:(unint64_t)a3;
- (int)payloadAlarmRepeatSchedules;
- (int)payloadAlarmSearchTypeAtIndex:(unint64_t)a3;
- (int)payloadAlarmSearchTypes;
- (int)payloadBalanceTypeAtIndex:(unint64_t)a3;
- (int)payloadBalanceTypes;
- (int)payloadBillTypeAtIndex:(unint64_t)a3;
- (int)payloadBillTypes;
- (int)payloadBinarySettingValueAtIndex:(unint64_t)a3;
- (int)payloadBinarySettingValues;
- (int)payloadBoundedSettingValueAtIndex:(unint64_t)a3;
- (int)payloadBoundedSettingValues;
- (int)payloadCallAudioRouteAtIndex:(unint64_t)a3;
- (int)payloadCallAudioRoutes;
- (int)payloadCallCapabilities;
- (int)payloadCallCapabilityAtIndex:(unint64_t)a3;
- (int)payloadCallDestinationTypeAtIndex:(unint64_t)a3;
- (int)payloadCallDestinationTypes;
- (int)payloadCallRecordTypeAtIndex:(unint64_t)a3;
- (int)payloadCallRecordTypes;
- (int)payloadCarAirCirculationModeAtIndex:(unint64_t)a3;
- (int)payloadCarAirCirculationModes;
- (int)payloadCarAudioSourceAtIndex:(unint64_t)a3;
- (int)payloadCarAudioSources;
- (int)payloadCarDefrosterAtIndex:(unint64_t)a3;
- (int)payloadCarDefrosters;
- (int)payloadCarSeatAtIndex:(unint64_t)a3;
- (int)payloadCarSeats;
- (int)payloadCarSignalIdentifierAtIndex:(unint64_t)a3;
- (int)payloadCarSignalIdentifiers;
- (int)payloadChangeAlarmStatusOperationAtIndex:(unint64_t)a3;
- (int)payloadChangeAlarmStatusOperations;
- (int)payloadDateSearchTypeAtIndex:(unint64_t)a3;
- (int)payloadDateSearchTypes;
- (int)payloadDeviceTypeAtIndex:(unint64_t)a3;
- (int)payloadDeviceTypes;
- (int)payloadEventAttributeAtIndex:(unint64_t)a3;
- (int)payloadEventAttributes;
- (int)payloadFileEntityTypeAtIndex:(unint64_t)a3;
- (int)payloadFileEntityTypes;
- (int)payloadFilePropertyNameAtIndex:(unint64_t)a3;
- (int)payloadFilePropertyNames;
- (int)payloadFilePropertyQualifierAtIndex:(unint64_t)a3;
- (int)payloadFilePropertyQualifiers;
- (int)payloadFileSearchScopeAtIndex:(unint64_t)a3;
- (int)payloadFileSearchScopes;
- (int)payloadFileShareModeAtIndex:(unint64_t)a3;
- (int)payloadFileShareModes;
- (int)payloadFileTypeAtIndex:(unint64_t)a3;
- (int)payloadFileTypes;
- (int)payloadHomeAttributeTypeAtIndex:(unint64_t)a3;
- (int)payloadHomeAttributeTypes;
- (int)payloadHomeAttributeValueTypeAtIndex:(unint64_t)a3;
- (int)payloadHomeAttributeValueTypes;
- (int)payloadHomeDeviceTypeAtIndex:(unint64_t)a3;
- (int)payloadHomeDeviceTypes;
- (int)payloadHomeEntityTypeAtIndex:(unint64_t)a3;
- (int)payloadHomeEntityTypes;
- (int)payloadLocationSearchTypeAtIndex:(unint64_t)a3;
- (int)payloadLocationSearchTypes;
- (int)payloadMediaAffinityTypeAtIndex:(unint64_t)a3;
- (int)payloadMediaAffinityTypes;
- (int)payloadMessageAttributeAtIndex:(unint64_t)a3;
- (int)payloadMessageAttributes;
- (int)payloadMessageEffectAtIndex:(unint64_t)a3;
- (int)payloadMessageEffects;
- (int)payloadMessageTypeAtIndex:(unint64_t)a3;
- (int)payloadMessageTypes;
- (int)payloadNotebookItemTypeAtIndex:(unint64_t)a3;
- (int)payloadNotebookItemTypes;
- (int)payloadNumericSettingUnitAtIndex:(unint64_t)a3;
- (int)payloadNumericSettingUnits;
- (int)payloadOutgoingMessageTypeAtIndex:(unint64_t)a3;
- (int)payloadOutgoingMessageTypes;
- (int)payloadParsecCategories;
- (int)payloadParsecCategoryAtIndex:(unint64_t)a3;
- (int)payloadPaymentStatus;
- (int)payloadPaymentStatusAtIndex:(unint64_t)a3;
- (int)payloadPersonalPlaceTypeAtIndex:(unint64_t)a3;
- (int)payloadPersonalPlaceTypes;
- (int)payloadPhotoAttributeAtIndex:(unint64_t)a3;
- (int)payloadPhotoAttributes;
- (int)payloadPlaybackQueueLocationAtIndex:(unint64_t)a3;
- (int)payloadPlaybackQueueLocations;
- (int)payloadPlaybackRepeatModeAtIndex:(unint64_t)a3;
- (int)payloadPlaybackRepeatModes;
- (int)payloadPreferredCallProviderAtIndex:(unint64_t)a3;
- (int)payloadPreferredCallProviders;
- (int)payloadPrimitiveIntAtIndex:(unint64_t)a3;
- (int)payloadRadioTypeAtIndex:(unint64_t)a3;
- (int)payloadRadioTypes;
- (int)payloadReadActionTypeAtIndex:(unint64_t)a3;
- (int)payloadReadActionTypes;
- (int)payloadRelativeReferenceAtIndex:(unint64_t)a3;
- (int)payloadRelativeReferences;
- (int)payloadRelativeSettingAtIndex:(unint64_t)a3;
- (int)payloadRelativeSettings;
- (int)payloadSettingActionAtIndex:(unint64_t)a3;
- (int)payloadSettingActions;
- (int)payloadTaskPriorities;
- (int)payloadTaskPriorityAtIndex:(unint64_t)a3;
- (int)payloadTaskReferenceAtIndex:(unint64_t)a3;
- (int)payloadTaskReferences;
- (int)payloadTaskStatus;
- (int)payloadTaskStatusAtIndex:(unint64_t)a3;
- (int)payloadTemporalEventTriggerTypeAtIndex:(unint64_t)a3;
- (int)payloadTemporalEventTriggerTypes;
- (int)payloadTimerStateAtIndex:(unint64_t)a3;
- (int)payloadTimerStates;
- (int)payloadTimerTypeAtIndex:(unint64_t)a3;
- (int)payloadTimerTypes;
- (int)payloadUpdateAlarmOperationAtIndex:(unint64_t)a3;
- (int)payloadUpdateAlarmOperations;
- (int)payloadUserNotificationTypeAtIndex:(unint64_t)a3;
- (int)payloadUserNotificationTypes;
- (int)payloadVisualCodeTypeAtIndex:(unint64_t)a3;
- (int)payloadVisualCodeTypes;
- (int)payloadWellnessObjectTypeAtIndex:(unint64_t)a3;
- (int)payloadWellnessObjectTypes;
- (int)payloadWellnessQueryResultTypeAtIndex:(unint64_t)a3;
- (int)payloadWellnessQueryResultTypes;
- (int)payloadWellnessQuestionTypeAtIndex:(unint64_t)a3;
- (int)payloadWellnessQuestionTypes;
- (int)payloadWorkoutGoalUnitTypeAtIndex:(unint64_t)a3;
- (int)payloadWorkoutGoalUnitTypes;
- (int)payloadWorkoutLocationTypeAtIndex:(unint64_t)a3;
- (int)payloadWorkoutLocationTypes;
- (int)payloadWorkoutSequenceLabelAtIndex:(unint64_t)a3;
- (int)payloadWorkoutSequenceLabels;
- (int)type;
- (int64_t)payloadEnumerationAtIndex:(unint64_t)a3;
- (int64_t)payloadPrimitiveLongAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)payloadAccountTypesCount;
- (unint64_t)payloadActivitiesCount;
- (unint64_t)payloadActivityListsCount;
- (unint64_t)payloadAlarmPeriodsCount;
- (unint64_t)payloadAlarmRepeatSchedulesCount;
- (unint64_t)payloadAlarmSearchTypesCount;
- (unint64_t)payloadAlarmSearchsCount;
- (unint64_t)payloadAlarmsCount;
- (unint64_t)payloadAnnouncementsCount;
- (unint64_t)payloadAppIdentifiersCount;
- (unint64_t)payloadArchivedObjectsCount;
- (unint64_t)payloadBalanceTypesCount;
- (unint64_t)payloadBillDetailsValuesCount;
- (unint64_t)payloadBillPayeeValuesCount;
- (unint64_t)payloadBillTypesCount;
- (unint64_t)payloadBinarySettingValuesCount;
- (unint64_t)payloadBoundedSettingValuesCount;
- (unint64_t)payloadCalendarEventsCount;
- (unint64_t)payloadCallAudioRoutesCount;
- (unint64_t)payloadCallCapabilitiesCount;
- (unint64_t)payloadCallDestinationTypesCount;
- (unint64_t)payloadCallGroupConversationsCount;
- (unint64_t)payloadCallGroupsCount;
- (unint64_t)payloadCallRecordFiltersCount;
- (unint64_t)payloadCallRecordTypesCount;
- (unint64_t)payloadCallRecordValuesCount;
- (unint64_t)payloadCarAirCirculationModesCount;
- (unint64_t)payloadCarAudioSourcesCount;
- (unint64_t)payloadCarDefrostersCount;
- (unint64_t)payloadCarSeatsCount;
- (unint64_t)payloadCarSignalIdentifiersCount;
- (unint64_t)payloadChangeAlarmStatusOperationsCount;
- (unint64_t)payloadChargingConnectorTypesCount;
- (unint64_t)payloadContactEventTriggersCount;
- (unint64_t)payloadContactListsCount;
- (unint64_t)payloadContactValuesCount;
- (unint64_t)payloadCurrencyAmountsCount;
- (unint64_t)payloadCustomObjectsCount;
- (unint64_t)payloadDataStringListsCount;
- (unint64_t)payloadDataStringsCount;
- (unint64_t)payloadDateSearchTypesCount;
- (unint64_t)payloadDateTimeRangeListsCount;
- (unint64_t)payloadDateTimeRangeValuesCount;
- (unint64_t)payloadDateTimeValuesCount;
- (unint64_t)payloadDeviceDetailsCount;
- (unint64_t)payloadDeviceTypesCount;
- (unint64_t)payloadDevicesCount;
- (unint64_t)payloadDialingContactsCount;
- (unint64_t)payloadDistanceListsCount;
- (unint64_t)payloadDistanceValuesCount;
- (unint64_t)payloadDoubleListsCount;
- (unint64_t)payloadDoubleValuesCount;
- (unint64_t)payloadEnergyValuesCount;
- (unint64_t)payloadEnumerationsCount;
- (unint64_t)payloadEventAttributesCount;
- (unint64_t)payloadEventListsCount;
- (unint64_t)payloadEventParticipantsCount;
- (unint64_t)payloadEventsCount;
- (unint64_t)payloadFileEntityTypesCount;
- (unint64_t)payloadFilePropertiesCount;
- (unint64_t)payloadFilePropertyNamesCount;
- (unint64_t)payloadFilePropertyQualifiersCount;
- (unint64_t)payloadFilePropertyValuesCount;
- (unint64_t)payloadFileSearchScopesCount;
- (unint64_t)payloadFileShareModesCount;
- (unint64_t)payloadFileTypesCount;
- (unint64_t)payloadFilesCount;
- (unint64_t)payloadFinancialAccountValuesCount;
- (unint64_t)payloadGeographicalFeatureListsCount;
- (unint64_t)payloadGeographicalFeaturesCount;
- (unint64_t)payloadGetSettingResponseDatasCount;
- (unint64_t)payloadHomeAttributeTypesCount;
- (unint64_t)payloadHomeAttributeValueTypesCount;
- (unint64_t)payloadHomeAttributeValuesCount;
- (unint64_t)payloadHomeAttributesCount;
- (unint64_t)payloadHomeDeviceTypesCount;
- (unint64_t)payloadHomeEntitiesCount;
- (unint64_t)payloadHomeEntityTypesCount;
- (unint64_t)payloadHomeFiltersCount;
- (unint64_t)payloadHomeUserTasksCount;
- (unint64_t)payloadIntegerListsCount;
- (unint64_t)payloadIntegerValuesCount;
- (unint64_t)payloadIntentExecutionResultsCount;
- (unint64_t)payloadIntentsCount;
- (unint64_t)payloadLocationListsCount;
- (unint64_t)payloadLocationSearchTypesCount;
- (unint64_t)payloadLocationsCount;
- (unint64_t)payloadLongListsCount;
- (unint64_t)payloadLongValuesCount;
- (unint64_t)payloadMassValuesCount;
- (unint64_t)payloadMediaAffinityTypesCount;
- (unint64_t)payloadMediaDestinationsCount;
- (unint64_t)payloadMediaItemGroupsCount;
- (unint64_t)payloadMediaItemValuesCount;
- (unint64_t)payloadMediaSearchsCount;
- (unint64_t)payloadMessageAttributesCount;
- (unint64_t)payloadMessageEffectsCount;
- (unint64_t)payloadMessageTypesCount;
- (unint64_t)payloadModifyNicknamesCount;
- (unint64_t)payloadModifyRelationshipsCount;
- (unint64_t)payloadNoteContentsCount;
- (unint64_t)payloadNotebookItemTypesCount;
- (unint64_t)payloadNotesCount;
- (unint64_t)payloadNumericSettingUnitsCount;
- (unint64_t)payloadNumericSettingValuesCount;
- (unint64_t)payloadOutgoingMessageTypesCount;
- (unint64_t)payloadParsecCategoriesCount;
- (unint64_t)payloadPaymentAmountValuesCount;
- (unint64_t)payloadPaymentMethodListsCount;
- (unint64_t)payloadPaymentMethodValuesCount;
- (unint64_t)payloadPaymentStatusCount;
- (unint64_t)payloadPersonalPlaceTypesCount;
- (unint64_t)payloadPhotoAttributesCount;
- (unint64_t)payloadPlaceListsCount;
- (unint64_t)payloadPlacesCount;
- (unint64_t)payloadPlaybackQueueLocationsCount;
- (unint64_t)payloadPlaybackRepeatModesCount;
- (unint64_t)payloadPreferredCallProvidersCount;
- (unint64_t)payloadPrimitiveBoolsCount;
- (unint64_t)payloadPrimitiveDoublesCount;
- (unint64_t)payloadPrimitiveIntsCount;
- (unint64_t)payloadPrimitiveLongsCount;
- (unint64_t)payloadPrimitiveStringsCount;
- (unint64_t)payloadPrivateAddMediaIntentDatasCount;
- (unint64_t)payloadPrivatePlayMediaIntentDatasCount;
- (unint64_t)payloadPrivateSearchForMediaIntentDatasCount;
- (unint64_t)payloadPrivateUpdateMediaAffinityIntentDatasCount;
- (unint64_t)payloadRadioTypesCount;
- (unint64_t)payloadReadActionTypesCount;
- (unint64_t)payloadRelativeReferencesCount;
- (unint64_t)payloadRelativeSettingsCount;
- (unint64_t)payloadSendMessageAttachmentsCount;
- (unint64_t)payloadSettingActionsCount;
- (unint64_t)payloadSettingMetadatasCount;
- (unint64_t)payloadShareDestinationsCount;
- (unint64_t)payloadSleepAlarmAttributesCount;
- (unint64_t)payloadSpatialEventTriggersCount;
- (unint64_t)payloadSpeedValuesCount;
- (unint64_t)payloadStartCallRequestMetadatasCount;
- (unint64_t)payloadStringListsCount;
- (unint64_t)payloadStringValuesCount;
- (unint64_t)payloadSupportedTrafficIncidentTypesCount;
- (unint64_t)payloadTaskListsCount;
- (unint64_t)payloadTaskPrioritiesCount;
- (unint64_t)payloadTaskReferencesCount;
- (unint64_t)payloadTaskStatusCount;
- (unint64_t)payloadTasksCount;
- (unint64_t)payloadTemperatureListsCount;
- (unint64_t)payloadTemperatureValuesCount;
- (unint64_t)payloadTemporalEventTriggerTypesCount;
- (unint64_t)payloadTemporalEventTriggersCount;
- (unint64_t)payloadTimerStatesCount;
- (unint64_t)payloadTimerTypesCount;
- (unint64_t)payloadTimersCount;
- (unint64_t)payloadURLValuesCount;
- (unint64_t)payloadUpdateAlarmOperationsCount;
- (unint64_t)payloadUserNotificationTypesCount;
- (unint64_t)payloadVisualCodeTypesCount;
- (unint64_t)payloadVoiceCommandDeviceInformationsCount;
- (unint64_t)payloadVolumeValuesCount;
- (unint64_t)payloadWellnessMetadataPairsCount;
- (unint64_t)payloadWellnessObjectResultValuesCount;
- (unint64_t)payloadWellnessObjectTypesCount;
- (unint64_t)payloadWellnessQueryResultTypesCount;
- (unint64_t)payloadWellnessQuestionTypesCount;
- (unint64_t)payloadWellnessUnitTypesCount;
- (unint64_t)payloadWellnessValuesCount;
- (unint64_t)payloadWorkoutAssociatedItemsCount;
- (unint64_t)payloadWorkoutCustomizationsCount;
- (unint64_t)payloadWorkoutGoalUnitTypesCount;
- (unint64_t)payloadWorkoutLocationTypesCount;
- (unint64_t)payloadWorkoutSequenceLabelsCount;
- (void)addPayloadAccountType:(int)a3;
- (void)addPayloadActivity:(id)a3;
- (void)addPayloadActivityList:(id)a3;
- (void)addPayloadAlarm:(id)a3;
- (void)addPayloadAlarmPeriod:(int)a3;
- (void)addPayloadAlarmRepeatSchedule:(int)a3;
- (void)addPayloadAlarmSearch:(id)a3;
- (void)addPayloadAlarmSearchType:(int)a3;
- (void)addPayloadAnnouncement:(id)a3;
- (void)addPayloadAppIdentifier:(id)a3;
- (void)addPayloadArchivedObject:(id)a3;
- (void)addPayloadBalanceType:(int)a3;
- (void)addPayloadBillDetailsValue:(id)a3;
- (void)addPayloadBillPayeeValue:(id)a3;
- (void)addPayloadBillType:(int)a3;
- (void)addPayloadBinarySettingValue:(int)a3;
- (void)addPayloadBoundedSettingValue:(int)a3;
- (void)addPayloadCalendarEvent:(id)a3;
- (void)addPayloadCallAudioRoute:(int)a3;
- (void)addPayloadCallCapability:(int)a3;
- (void)addPayloadCallDestinationType:(int)a3;
- (void)addPayloadCallGroup:(id)a3;
- (void)addPayloadCallGroupConversation:(id)a3;
- (void)addPayloadCallRecordFilter:(id)a3;
- (void)addPayloadCallRecordType:(int)a3;
- (void)addPayloadCallRecordValue:(id)a3;
- (void)addPayloadCarAirCirculationMode:(int)a3;
- (void)addPayloadCarAudioSource:(int)a3;
- (void)addPayloadCarDefroster:(int)a3;
- (void)addPayloadCarSeat:(int)a3;
- (void)addPayloadCarSignalIdentifier:(int)a3;
- (void)addPayloadChangeAlarmStatusOperation:(int)a3;
- (void)addPayloadChargingConnectorType:(id)a3;
- (void)addPayloadContactEventTrigger:(id)a3;
- (void)addPayloadContactList:(id)a3;
- (void)addPayloadContactValue:(id)a3;
- (void)addPayloadCurrencyAmount:(id)a3;
- (void)addPayloadCustomObject:(id)a3;
- (void)addPayloadDataString:(id)a3;
- (void)addPayloadDataStringList:(id)a3;
- (void)addPayloadDateSearchType:(int)a3;
- (void)addPayloadDateTimeRangeList:(id)a3;
- (void)addPayloadDateTimeRangeValue:(id)a3;
- (void)addPayloadDateTimeValue:(id)a3;
- (void)addPayloadDevice:(id)a3;
- (void)addPayloadDeviceDetail:(id)a3;
- (void)addPayloadDeviceType:(int)a3;
- (void)addPayloadDialingContact:(id)a3;
- (void)addPayloadDistanceList:(id)a3;
- (void)addPayloadDistanceValue:(id)a3;
- (void)addPayloadDoubleList:(id)a3;
- (void)addPayloadDoubleValue:(id)a3;
- (void)addPayloadEnergyValue:(id)a3;
- (void)addPayloadEnumeration:(int64_t)a3;
- (void)addPayloadEvent:(id)a3;
- (void)addPayloadEventAttribute:(int)a3;
- (void)addPayloadEventList:(id)a3;
- (void)addPayloadEventParticipant:(id)a3;
- (void)addPayloadFile:(id)a3;
- (void)addPayloadFileEntityType:(int)a3;
- (void)addPayloadFileProperty:(id)a3;
- (void)addPayloadFilePropertyName:(int)a3;
- (void)addPayloadFilePropertyQualifier:(int)a3;
- (void)addPayloadFilePropertyValue:(id)a3;
- (void)addPayloadFileSearchScope:(int)a3;
- (void)addPayloadFileShareMode:(int)a3;
- (void)addPayloadFileType:(int)a3;
- (void)addPayloadFinancialAccountValue:(id)a3;
- (void)addPayloadGeographicalFeature:(id)a3;
- (void)addPayloadGeographicalFeatureList:(id)a3;
- (void)addPayloadGetSettingResponseData:(id)a3;
- (void)addPayloadHomeAttribute:(id)a3;
- (void)addPayloadHomeAttributeType:(int)a3;
- (void)addPayloadHomeAttributeValue:(id)a3;
- (void)addPayloadHomeAttributeValueType:(int)a3;
- (void)addPayloadHomeDeviceType:(int)a3;
- (void)addPayloadHomeEntity:(id)a3;
- (void)addPayloadHomeEntityType:(int)a3;
- (void)addPayloadHomeFilter:(id)a3;
- (void)addPayloadHomeUserTask:(id)a3;
- (void)addPayloadIntegerList:(id)a3;
- (void)addPayloadIntegerValue:(id)a3;
- (void)addPayloadIntent:(id)a3;
- (void)addPayloadIntentExecutionResult:(id)a3;
- (void)addPayloadLocation:(id)a3;
- (void)addPayloadLocationList:(id)a3;
- (void)addPayloadLocationSearchType:(int)a3;
- (void)addPayloadLongList:(id)a3;
- (void)addPayloadLongValue:(id)a3;
- (void)addPayloadMassValue:(id)a3;
- (void)addPayloadMediaAffinityType:(int)a3;
- (void)addPayloadMediaDestination:(id)a3;
- (void)addPayloadMediaItemGroup:(id)a3;
- (void)addPayloadMediaItemValue:(id)a3;
- (void)addPayloadMediaSearch:(id)a3;
- (void)addPayloadMessageAttribute:(int)a3;
- (void)addPayloadMessageEffect:(int)a3;
- (void)addPayloadMessageType:(int)a3;
- (void)addPayloadModifyNickname:(id)a3;
- (void)addPayloadModifyRelationship:(id)a3;
- (void)addPayloadNote:(id)a3;
- (void)addPayloadNoteContent:(id)a3;
- (void)addPayloadNotebookItemType:(int)a3;
- (void)addPayloadNumericSettingUnit:(int)a3;
- (void)addPayloadNumericSettingValue:(id)a3;
- (void)addPayloadOutgoingMessageType:(int)a3;
- (void)addPayloadParsecCategory:(int)a3;
- (void)addPayloadPaymentAmountValue:(id)a3;
- (void)addPayloadPaymentMethodList:(id)a3;
- (void)addPayloadPaymentMethodValue:(id)a3;
- (void)addPayloadPaymentStatus:(int)a3;
- (void)addPayloadPersonalPlaceType:(int)a3;
- (void)addPayloadPhotoAttribute:(int)a3;
- (void)addPayloadPlace:(id)a3;
- (void)addPayloadPlaceList:(id)a3;
- (void)addPayloadPlaybackQueueLocation:(int)a3;
- (void)addPayloadPlaybackRepeatMode:(int)a3;
- (void)addPayloadPreferredCallProvider:(int)a3;
- (void)addPayloadPrimitiveBool:(BOOL)a3;
- (void)addPayloadPrimitiveDouble:(double)a3;
- (void)addPayloadPrimitiveInt:(int)a3;
- (void)addPayloadPrimitiveLong:(int64_t)a3;
- (void)addPayloadPrimitiveString:(id)a3;
- (void)addPayloadPrivateAddMediaIntentData:(id)a3;
- (void)addPayloadPrivatePlayMediaIntentData:(id)a3;
- (void)addPayloadPrivateSearchForMediaIntentData:(id)a3;
- (void)addPayloadPrivateUpdateMediaAffinityIntentData:(id)a3;
- (void)addPayloadRadioType:(int)a3;
- (void)addPayloadReadActionType:(int)a3;
- (void)addPayloadRelativeReference:(int)a3;
- (void)addPayloadRelativeSetting:(int)a3;
- (void)addPayloadSendMessageAttachment:(id)a3;
- (void)addPayloadSettingAction:(int)a3;
- (void)addPayloadSettingMetadata:(id)a3;
- (void)addPayloadShareDestination:(id)a3;
- (void)addPayloadSleepAlarmAttribute:(id)a3;
- (void)addPayloadSpatialEventTrigger:(id)a3;
- (void)addPayloadSpeedValue:(id)a3;
- (void)addPayloadStartCallRequestMetadata:(id)a3;
- (void)addPayloadStringList:(id)a3;
- (void)addPayloadStringValue:(id)a3;
- (void)addPayloadSupportedTrafficIncidentType:(id)a3;
- (void)addPayloadTask:(id)a3;
- (void)addPayloadTaskList:(id)a3;
- (void)addPayloadTaskPriority:(int)a3;
- (void)addPayloadTaskReference:(int)a3;
- (void)addPayloadTaskStatus:(int)a3;
- (void)addPayloadTemperatureList:(id)a3;
- (void)addPayloadTemperatureValue:(id)a3;
- (void)addPayloadTemporalEventTrigger:(id)a3;
- (void)addPayloadTemporalEventTriggerType:(int)a3;
- (void)addPayloadTimer:(id)a3;
- (void)addPayloadTimerState:(int)a3;
- (void)addPayloadTimerType:(int)a3;
- (void)addPayloadURLValue:(id)a3;
- (void)addPayloadUpdateAlarmOperation:(int)a3;
- (void)addPayloadUserNotificationType:(int)a3;
- (void)addPayloadVisualCodeType:(int)a3;
- (void)addPayloadVoiceCommandDeviceInformation:(id)a3;
- (void)addPayloadVolumeValue:(id)a3;
- (void)addPayloadWellnessMetadataPair:(id)a3;
- (void)addPayloadWellnessObjectResultValue:(id)a3;
- (void)addPayloadWellnessObjectType:(int)a3;
- (void)addPayloadWellnessQueryResultType:(int)a3;
- (void)addPayloadWellnessQuestionType:(int)a3;
- (void)addPayloadWellnessUnitType:(id)a3;
- (void)addPayloadWellnessValue:(id)a3;
- (void)addPayloadWorkoutAssociatedItem:(id)a3;
- (void)addPayloadWorkoutCustomization:(id)a3;
- (void)addPayloadWorkoutGoalUnitType:(int)a3;
- (void)addPayloadWorkoutLocationType:(int)a3;
- (void)addPayloadWorkoutSequenceLabel:(int)a3;
- (void)clearPayloadAccountTypes;
- (void)clearPayloadActivities;
- (void)clearPayloadActivityLists;
- (void)clearPayloadAlarmPeriods;
- (void)clearPayloadAlarmRepeatSchedules;
- (void)clearPayloadAlarmSearchTypes;
- (void)clearPayloadAlarmSearchs;
- (void)clearPayloadAlarms;
- (void)clearPayloadAnnouncements;
- (void)clearPayloadAppIdentifiers;
- (void)clearPayloadArchivedObjects;
- (void)clearPayloadBalanceTypes;
- (void)clearPayloadBillDetailsValues;
- (void)clearPayloadBillPayeeValues;
- (void)clearPayloadBillTypes;
- (void)clearPayloadBinarySettingValues;
- (void)clearPayloadBoundedSettingValues;
- (void)clearPayloadCalendarEvents;
- (void)clearPayloadCallAudioRoutes;
- (void)clearPayloadCallCapabilities;
- (void)clearPayloadCallDestinationTypes;
- (void)clearPayloadCallGroupConversations;
- (void)clearPayloadCallGroups;
- (void)clearPayloadCallRecordFilters;
- (void)clearPayloadCallRecordTypes;
- (void)clearPayloadCallRecordValues;
- (void)clearPayloadCarAirCirculationModes;
- (void)clearPayloadCarAudioSources;
- (void)clearPayloadCarDefrosters;
- (void)clearPayloadCarSeats;
- (void)clearPayloadCarSignalIdentifiers;
- (void)clearPayloadChangeAlarmStatusOperations;
- (void)clearPayloadChargingConnectorTypes;
- (void)clearPayloadContactEventTriggers;
- (void)clearPayloadContactLists;
- (void)clearPayloadContactValues;
- (void)clearPayloadCurrencyAmounts;
- (void)clearPayloadCustomObjects;
- (void)clearPayloadDataStringLists;
- (void)clearPayloadDataStrings;
- (void)clearPayloadDateSearchTypes;
- (void)clearPayloadDateTimeRangeLists;
- (void)clearPayloadDateTimeRangeValues;
- (void)clearPayloadDateTimeValues;
- (void)clearPayloadDeviceDetails;
- (void)clearPayloadDeviceTypes;
- (void)clearPayloadDevices;
- (void)clearPayloadDialingContacts;
- (void)clearPayloadDistanceLists;
- (void)clearPayloadDistanceValues;
- (void)clearPayloadDoubleLists;
- (void)clearPayloadDoubleValues;
- (void)clearPayloadEnergyValues;
- (void)clearPayloadEnumerations;
- (void)clearPayloadEventAttributes;
- (void)clearPayloadEventLists;
- (void)clearPayloadEventParticipants;
- (void)clearPayloadEvents;
- (void)clearPayloadFileEntityTypes;
- (void)clearPayloadFileProperties;
- (void)clearPayloadFilePropertyNames;
- (void)clearPayloadFilePropertyQualifiers;
- (void)clearPayloadFilePropertyValues;
- (void)clearPayloadFileSearchScopes;
- (void)clearPayloadFileShareModes;
- (void)clearPayloadFileTypes;
- (void)clearPayloadFiles;
- (void)clearPayloadFinancialAccountValues;
- (void)clearPayloadGeographicalFeatureLists;
- (void)clearPayloadGeographicalFeatures;
- (void)clearPayloadGetSettingResponseDatas;
- (void)clearPayloadHomeAttributeTypes;
- (void)clearPayloadHomeAttributeValueTypes;
- (void)clearPayloadHomeAttributeValues;
- (void)clearPayloadHomeAttributes;
- (void)clearPayloadHomeDeviceTypes;
- (void)clearPayloadHomeEntities;
- (void)clearPayloadHomeEntityTypes;
- (void)clearPayloadHomeFilters;
- (void)clearPayloadHomeUserTasks;
- (void)clearPayloadIntegerLists;
- (void)clearPayloadIntegerValues;
- (void)clearPayloadIntentExecutionResults;
- (void)clearPayloadIntents;
- (void)clearPayloadLocationLists;
- (void)clearPayloadLocationSearchTypes;
- (void)clearPayloadLocations;
- (void)clearPayloadLongLists;
- (void)clearPayloadLongValues;
- (void)clearPayloadMassValues;
- (void)clearPayloadMediaAffinityTypes;
- (void)clearPayloadMediaDestinations;
- (void)clearPayloadMediaItemGroups;
- (void)clearPayloadMediaItemValues;
- (void)clearPayloadMediaSearchs;
- (void)clearPayloadMessageAttributes;
- (void)clearPayloadMessageEffects;
- (void)clearPayloadMessageTypes;
- (void)clearPayloadModifyNicknames;
- (void)clearPayloadModifyRelationships;
- (void)clearPayloadNoteContents;
- (void)clearPayloadNotebookItemTypes;
- (void)clearPayloadNotes;
- (void)clearPayloadNumericSettingUnits;
- (void)clearPayloadNumericSettingValues;
- (void)clearPayloadOutgoingMessageTypes;
- (void)clearPayloadParsecCategories;
- (void)clearPayloadPaymentAmountValues;
- (void)clearPayloadPaymentMethodLists;
- (void)clearPayloadPaymentMethodValues;
- (void)clearPayloadPaymentStatus;
- (void)clearPayloadPersonalPlaceTypes;
- (void)clearPayloadPhotoAttributes;
- (void)clearPayloadPlaceLists;
- (void)clearPayloadPlaces;
- (void)clearPayloadPlaybackQueueLocations;
- (void)clearPayloadPlaybackRepeatModes;
- (void)clearPayloadPreferredCallProviders;
- (void)clearPayloadPrimitiveBools;
- (void)clearPayloadPrimitiveDoubles;
- (void)clearPayloadPrimitiveInts;
- (void)clearPayloadPrimitiveLongs;
- (void)clearPayloadPrimitiveStrings;
- (void)clearPayloadPrivateAddMediaIntentDatas;
- (void)clearPayloadPrivatePlayMediaIntentDatas;
- (void)clearPayloadPrivateSearchForMediaIntentDatas;
- (void)clearPayloadPrivateUpdateMediaAffinityIntentDatas;
- (void)clearPayloadRadioTypes;
- (void)clearPayloadReadActionTypes;
- (void)clearPayloadRelativeReferences;
- (void)clearPayloadRelativeSettings;
- (void)clearPayloadSendMessageAttachments;
- (void)clearPayloadSettingActions;
- (void)clearPayloadSettingMetadatas;
- (void)clearPayloadShareDestinations;
- (void)clearPayloadSleepAlarmAttributes;
- (void)clearPayloadSpatialEventTriggers;
- (void)clearPayloadSpeedValues;
- (void)clearPayloadStartCallRequestMetadatas;
- (void)clearPayloadStringLists;
- (void)clearPayloadStringValues;
- (void)clearPayloadSupportedTrafficIncidentTypes;
- (void)clearPayloadTaskLists;
- (void)clearPayloadTaskPriorities;
- (void)clearPayloadTaskReferences;
- (void)clearPayloadTaskStatus;
- (void)clearPayloadTasks;
- (void)clearPayloadTemperatureLists;
- (void)clearPayloadTemperatureValues;
- (void)clearPayloadTemporalEventTriggerTypes;
- (void)clearPayloadTemporalEventTriggers;
- (void)clearPayloadTimerStates;
- (void)clearPayloadTimerTypes;
- (void)clearPayloadTimers;
- (void)clearPayloadURLValues;
- (void)clearPayloadUpdateAlarmOperations;
- (void)clearPayloadUserNotificationTypes;
- (void)clearPayloadVisualCodeTypes;
- (void)clearPayloadVoiceCommandDeviceInformations;
- (void)clearPayloadVolumeValues;
- (void)clearPayloadWellnessMetadataPairs;
- (void)clearPayloadWellnessObjectResultValues;
- (void)clearPayloadWellnessObjectTypes;
- (void)clearPayloadWellnessQueryResultTypes;
- (void)clearPayloadWellnessQuestionTypes;
- (void)clearPayloadWellnessUnitTypes;
- (void)clearPayloadWellnessValues;
- (void)clearPayloadWorkoutAssociatedItems;
- (void)clearPayloadWorkoutCustomizations;
- (void)clearPayloadWorkoutGoalUnitTypes;
- (void)clearPayloadWorkoutLocationTypes;
- (void)clearPayloadWorkoutSequenceLabels;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setPayloadAccountTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadActivities:(id)a3;
- (void)setPayloadActivityLists:(id)a3;
- (void)setPayloadAlarmPeriods:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadAlarmRepeatSchedules:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadAlarmSearchTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadAlarmSearchs:(id)a3;
- (void)setPayloadAlarms:(id)a3;
- (void)setPayloadAnnouncements:(id)a3;
- (void)setPayloadAppIdentifiers:(id)a3;
- (void)setPayloadArchivedObjects:(id)a3;
- (void)setPayloadBalanceTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadBillDetailsValues:(id)a3;
- (void)setPayloadBillPayeeValues:(id)a3;
- (void)setPayloadBillTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadBinarySettingValues:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadBoundedSettingValues:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadCalendarEvents:(id)a3;
- (void)setPayloadCallAudioRoutes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadCallCapabilities:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadCallDestinationTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadCallGroupConversations:(id)a3;
- (void)setPayloadCallGroups:(id)a3;
- (void)setPayloadCallRecordFilters:(id)a3;
- (void)setPayloadCallRecordTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadCallRecordValues:(id)a3;
- (void)setPayloadCarAirCirculationModes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadCarAudioSources:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadCarDefrosters:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadCarSeats:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadCarSignalIdentifiers:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadChangeAlarmStatusOperations:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadChargingConnectorTypes:(id)a3;
- (void)setPayloadContactEventTriggers:(id)a3;
- (void)setPayloadContactLists:(id)a3;
- (void)setPayloadContactValues:(id)a3;
- (void)setPayloadCurrencyAmounts:(id)a3;
- (void)setPayloadCustomObjects:(id)a3;
- (void)setPayloadDataStringLists:(id)a3;
- (void)setPayloadDataStrings:(id)a3;
- (void)setPayloadDateSearchTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadDateTimeRangeLists:(id)a3;
- (void)setPayloadDateTimeRangeValues:(id)a3;
- (void)setPayloadDateTimeValues:(id)a3;
- (void)setPayloadDeviceDetails:(id)a3;
- (void)setPayloadDeviceTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadDevices:(id)a3;
- (void)setPayloadDialingContacts:(id)a3;
- (void)setPayloadDistanceLists:(id)a3;
- (void)setPayloadDistanceValues:(id)a3;
- (void)setPayloadDoubleLists:(id)a3;
- (void)setPayloadDoubleValues:(id)a3;
- (void)setPayloadEnergyValues:(id)a3;
- (void)setPayloadEnumerations:(id)a3;
- (void)setPayloadEventAttributes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadEventLists:(id)a3;
- (void)setPayloadEventParticipants:(id)a3;
- (void)setPayloadEvents:(id)a3;
- (void)setPayloadFileEntityTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadFileProperties:(id)a3;
- (void)setPayloadFilePropertyNames:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadFilePropertyQualifiers:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadFilePropertyValues:(id)a3;
- (void)setPayloadFileSearchScopes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadFileShareModes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadFileTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadFiles:(id)a3;
- (void)setPayloadFinancialAccountValues:(id)a3;
- (void)setPayloadGeographicalFeatureLists:(id)a3;
- (void)setPayloadGeographicalFeatures:(id)a3;
- (void)setPayloadGetSettingResponseDatas:(id)a3;
- (void)setPayloadHomeAttributeTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadHomeAttributeValueTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadHomeAttributeValues:(id)a3;
- (void)setPayloadHomeAttributes:(id)a3;
- (void)setPayloadHomeDeviceTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadHomeEntities:(id)a3;
- (void)setPayloadHomeEntityTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadHomeFilters:(id)a3;
- (void)setPayloadHomeUserTasks:(id)a3;
- (void)setPayloadIntegerLists:(id)a3;
- (void)setPayloadIntegerValues:(id)a3;
- (void)setPayloadIntentExecutionResults:(id)a3;
- (void)setPayloadIntents:(id)a3;
- (void)setPayloadLocationLists:(id)a3;
- (void)setPayloadLocationSearchTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadLocations:(id)a3;
- (void)setPayloadLongLists:(id)a3;
- (void)setPayloadLongValues:(id)a3;
- (void)setPayloadMassValues:(id)a3;
- (void)setPayloadMediaAffinityTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadMediaDestinations:(id)a3;
- (void)setPayloadMediaItemGroups:(id)a3;
- (void)setPayloadMediaItemValues:(id)a3;
- (void)setPayloadMediaSearchs:(id)a3;
- (void)setPayloadMessageAttributes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadMessageEffects:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadMessageTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadModifyNicknames:(id)a3;
- (void)setPayloadModifyRelationships:(id)a3;
- (void)setPayloadNoteContents:(id)a3;
- (void)setPayloadNotebookItemTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadNotes:(id)a3;
- (void)setPayloadNumericSettingUnits:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadNumericSettingValues:(id)a3;
- (void)setPayloadOutgoingMessageTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadParsecCategories:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadPaymentAmountValues:(id)a3;
- (void)setPayloadPaymentMethodLists:(id)a3;
- (void)setPayloadPaymentMethodValues:(id)a3;
- (void)setPayloadPaymentStatus:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadPersonalPlaceTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadPhotoAttributes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadPlaceLists:(id)a3;
- (void)setPayloadPlaces:(id)a3;
- (void)setPayloadPlaybackQueueLocations:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadPlaybackRepeatModes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadPreferredCallProviders:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadPrimitiveBools:(id)a3;
- (void)setPayloadPrimitiveDoubles:(id)a3;
- (void)setPayloadPrimitiveInts:(id)a3;
- (void)setPayloadPrimitiveLongs:(id)a3;
- (void)setPayloadPrimitiveStrings:(id)a3;
- (void)setPayloadPrivateAddMediaIntentDatas:(id)a3;
- (void)setPayloadPrivatePlayMediaIntentDatas:(id)a3;
- (void)setPayloadPrivateSearchForMediaIntentDatas:(id)a3;
- (void)setPayloadPrivateUpdateMediaAffinityIntentDatas:(id)a3;
- (void)setPayloadRadioTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadReadActionTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadRelativeReferences:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadRelativeSettings:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadSendMessageAttachments:(id)a3;
- (void)setPayloadSettingActions:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadSettingMetadatas:(id)a3;
- (void)setPayloadShareDestinations:(id)a3;
- (void)setPayloadSleepAlarmAttributes:(id)a3;
- (void)setPayloadSpatialEventTriggers:(id)a3;
- (void)setPayloadSpeedValues:(id)a3;
- (void)setPayloadStartCallRequestMetadatas:(id)a3;
- (void)setPayloadStringLists:(id)a3;
- (void)setPayloadStringValues:(id)a3;
- (void)setPayloadSupportedTrafficIncidentTypes:(id)a3;
- (void)setPayloadTaskLists:(id)a3;
- (void)setPayloadTaskPriorities:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadTaskReferences:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadTaskStatus:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadTasks:(id)a3;
- (void)setPayloadTemperatureLists:(id)a3;
- (void)setPayloadTemperatureValues:(id)a3;
- (void)setPayloadTemporalEventTriggerTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadTemporalEventTriggers:(id)a3;
- (void)setPayloadTimerStates:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadTimerTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadTimers:(id)a3;
- (void)setPayloadURLValues:(id)a3;
- (void)setPayloadUpdateAlarmOperations:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadUserNotificationTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadVisualCodeTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadVoiceCommandDeviceInformations:(id)a3;
- (void)setPayloadVolumeValues:(id)a3;
- (void)setPayloadWellnessMetadataPairs:(id)a3;
- (void)setPayloadWellnessObjectResultValues:(id)a3;
- (void)setPayloadWellnessObjectTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadWellnessQueryResultTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadWellnessQuestionTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadWellnessUnitTypes:(id)a3;
- (void)setPayloadWellnessValues:(id)a3;
- (void)setPayloadWorkoutAssociatedItems:(id)a3;
- (void)setPayloadWorkoutCustomizations:(id)a3;
- (void)setPayloadWorkoutGoalUnitTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadWorkoutLocationTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPayloadWorkoutSequenceLabels:(int *)a3 count:(unint64_t)a4;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBIntentSlotValue

- (unint64_t)payloadTemperatureListsCount
{
  return [(NSArray *)self->_payloadTemperatureLists count];
}

- (void)addPayloadPrimitiveBool:(BOOL)a3
{
  BOOL v3 = a3;
  payloadPrimitiveBools = self->_payloadPrimitiveBools;
  if (!payloadPrimitiveBools)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_payloadPrimitiveBools;
    self->_payloadPrimitiveBools = v6;

    payloadPrimitiveBools = self->_payloadPrimitiveBools;
  }
  id v8 = [NSNumber numberWithBool:v3];
  [(NSArray *)payloadPrimitiveBools addObject:v8];
}

- (void)addPayloadPrimitiveDouble:(double)a3
{
  payloadPrimitiveDoubles = self->_payloadPrimitiveDoubles;
  if (!payloadPrimitiveDoubles)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_payloadPrimitiveDoubles;
    self->_payloadPrimitiveDoubles = v6;

    payloadPrimitiveDoubles = self->_payloadPrimitiveDoubles;
  }
  id v8 = [NSNumber numberWithDouble:a3];
  [(NSArray *)payloadPrimitiveDoubles addObject:v8];
}

- (NSArray)payloadHomeAttributes
{
  return self->_payloadHomeAttributes;
}

- (id)payloadTimerStatesAsString:(int)a3
{
  if (a3 >= 3)
  {
    BOOL v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    BOOL v3 = *(&off_1E551D448 + a3);
  }

  return v3;
}

- (void)addPayloadTimer:(id)a3
{
  id v4 = a3;
  payloadTimers = self->_payloadTimers;
  id v8 = v4;
  if (!payloadTimers)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_payloadTimers;
    self->_payloadTimers = v6;

    id v4 = v8;
    payloadTimers = self->_payloadTimers;
  }
  [(NSArray *)payloadTimers addObject:v4];
}

- (void)addPayloadTemperatureValue:(id)a3
{
  id v4 = a3;
  payloadTemperatureValues = self->_payloadTemperatureValues;
  id v8 = v4;
  if (!payloadTemperatureValues)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_payloadTemperatureValues;
    self->_payloadTemperatureValues = v6;

    id v4 = v8;
    payloadTemperatureValues = self->_payloadTemperatureValues;
  }
  [(NSArray *)payloadTemperatureValues addObject:v4];
}

- (int)StringAsPayloadTemporalEventTriggerTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TEMPORAL_TRIGGER_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NOT_SCHEDULED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SCHEDULED_NON_RECURRING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SCHEDULED_RECURRING"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)addPayloadTemporalEventTrigger:(id)a3
{
  id v4 = a3;
  payloadTemporalEventTriggers = self->_payloadTemporalEventTriggers;
  id v8 = v4;
  if (!payloadTemporalEventTriggers)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_payloadTemporalEventTriggers;
    self->_payloadTemporalEventTriggers = v6;

    id v4 = v8;
    payloadTemporalEventTriggers = self->_payloadTemporalEventTriggers;
  }
  [(NSArray *)payloadTemporalEventTriggers addObject:v4];
}

- (int)payloadPrimitiveIntAtIndex:(unint64_t)a3
{
  id v3 = [(NSArray *)self->_payloadPrimitiveInts objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (id)dictionaryRepresentation
{
  uint64_t v2 = MEMORY[0x1F4188790](self, a2);
  uint64_t v1472 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(void *)(v2 + 16))
  {
    int v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadAccountTypesCount"));
    if ([(id)v2 payloadAccountTypesCount])
    {
      unint64_t v5 = 0;
      do
      {
        unsigned int v6 = *(_DWORD *)(*(void *)(v2 + 8) + 4 * v5) - 1;
        if (v6 >= 7)
        {
          v7 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 8) + 4 * v5));
        }
        else
        {
          v7 = *(&off_1E551C7F8 + v6);
        }
        [v4 addObject:v7];

        ++v5;
      }
      while (v5 < [(id)v2 payloadAccountTypesCount]);
    }
    [v3 setObject:v4 forKeyedSubscript:@"_payloadAccountType"];
  }
  if ([*(id *)(v2 + 1600) count])
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
    long long v1369 = 0u;
    long long v1370 = 0u;
    long long v1371 = 0u;
    long long v1372 = 0u;
    id v9 = *(id *)(v2 + 1600);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v1369 objects:v1471 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v1370;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v1370 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v1369 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v1369 objects:v1471 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"_payloadActivity"];
  }
  if ([*(id *)(v2 + 1608) count])
  {
    v15 = [MEMORY[0x1E4F1CA48] array];
    long long v1365 = 0u;
    long long v1366 = 0u;
    long long v1367 = 0u;
    long long v1368 = 0u;
    id v16 = *(id *)(v2 + 1608);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v1365 objects:v1470 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v1366;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v1366 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v1365 + 1) + 8 * j) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v1365 objects:v1470 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKeyedSubscript:@"_payloadActivityList"];
  }
  if ([*(id *)(v2 + 1616) count])
  {
    v22 = [MEMORY[0x1E4F1CA48] array];
    long long v1361 = 0u;
    long long v1362 = 0u;
    long long v1363 = 0u;
    long long v1364 = 0u;
    id v23 = *(id *)(v2 + 1616);
    uint64_t v24 = [v23 countByEnumeratingWithState:&v1361 objects:v1469 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v1362;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v1362 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [*(id *)(*((void *)&v1361 + 1) + 8 * k) dictionaryRepresentation];
          [v22 addObject:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v1361 objects:v1469 count:16];
      }
      while (v25);
    }

    [v3 setObject:v22 forKeyedSubscript:@"_payloadAlarm"];
  }
  if (*(void *)(v2 + 40))
  {
    v29 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadAlarmPeriodsCount"));
    if ([(id)v2 payloadAlarmPeriodsCount])
    {
      unint64_t v30 = 0;
      do
      {
        uint64_t v31 = *(unsigned int *)(*(void *)(v2 + 32) + 4 * v30);
        if (v31 >= 9)
        {
          v32 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 32) + 4 * v30));
        }
        else
        {
          v32 = *(&off_1E551C830 + v31);
        }
        [v29 addObject:v32];

        ++v30;
      }
      while (v30 < [(id)v2 payloadAlarmPeriodsCount]);
    }
    [v3 setObject:v29 forKeyedSubscript:@"_payloadAlarmPeriod"];
  }
  if (*(void *)(v2 + 64))
  {
    v33 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadAlarmRepeatSchedulesCount"));
    if ([(id)v2 payloadAlarmRepeatSchedulesCount])
    {
      unint64_t v34 = 0;
      do
      {
        uint64_t v35 = *(unsigned int *)(*(void *)(v2 + 56) + 4 * v34);
        if (v35 >= 8)
        {
          v36 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 56) + 4 * v34));
        }
        else
        {
          v36 = *(&off_1E551C878 + v35);
        }
        [v33 addObject:v36];

        ++v34;
      }
      while (v34 < [(id)v2 payloadAlarmRepeatSchedulesCount]);
    }
    [v3 setObject:v33 forKeyedSubscript:@"_payloadAlarmRepeatSchedule"];
  }
  if ([*(id *)(v2 + 1624) count])
  {
    v37 = [MEMORY[0x1E4F1CA48] array];
    long long v1357 = 0u;
    long long v1358 = 0u;
    long long v1359 = 0u;
    long long v1360 = 0u;
    id v38 = *(id *)(v2 + 1624);
    uint64_t v39 = [v38 countByEnumeratingWithState:&v1357 objects:v1468 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v1358;
      do
      {
        for (uint64_t m = 0; m != v40; ++m)
        {
          if (*(void *)v1358 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = [*(id *)(*((void *)&v1357 + 1) + 8 * m) dictionaryRepresentation];
          [v37 addObject:v43];
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v1357 objects:v1468 count:16];
      }
      while (v40);
    }

    [v3 setObject:v37 forKeyedSubscript:@"_payloadAlarmSearch"];
  }
  if (*(void *)(v2 + 88))
  {
    v44 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadAlarmSearchTypesCount"));
    if ([(id)v2 payloadAlarmSearchTypesCount])
    {
      unint64_t v45 = 0;
      do
      {
        uint64_t v46 = *(unsigned int *)(*(void *)(v2 + 80) + 4 * v45);
        if (v46 >= 5)
        {
          v47 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 80) + 4 * v45));
        }
        else
        {
          v47 = *(&off_1E551C8B8 + v46);
        }
        [v44 addObject:v47];

        ++v45;
      }
      while (v45 < [(id)v2 payloadAlarmSearchTypesCount]);
    }
    [v3 setObject:v44 forKeyedSubscript:@"_payloadAlarmSearchType"];
  }
  if ([*(id *)(v2 + 1632) count])
  {
    v48 = [MEMORY[0x1E4F1CA48] array];
    long long v1353 = 0u;
    long long v1354 = 0u;
    long long v1355 = 0u;
    long long v1356 = 0u;
    id v49 = *(id *)(v2 + 1632);
    uint64_t v50 = [v49 countByEnumeratingWithState:&v1353 objects:v1467 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v1354;
      do
      {
        for (uint64_t n = 0; n != v51; ++n)
        {
          if (*(void *)v1354 != v52) {
            objc_enumerationMutation(v49);
          }
          v54 = [*(id *)(*((void *)&v1353 + 1) + 8 * n) dictionaryRepresentation];
          [v48 addObject:v54];
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v1353 objects:v1467 count:16];
      }
      while (v51);
    }

    [v3 setObject:v48 forKeyedSubscript:@"_payloadAnnouncement"];
  }
  if ([*(id *)(v2 + 1640) count])
  {
    v55 = [MEMORY[0x1E4F1CA48] array];
    long long v1349 = 0u;
    long long v1350 = 0u;
    long long v1351 = 0u;
    long long v1352 = 0u;
    id v56 = *(id *)(v2 + 1640);
    uint64_t v57 = [v56 countByEnumeratingWithState:&v1349 objects:v1466 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v1350;
      do
      {
        for (iuint64_t i = 0; ii != v58; ++ii)
        {
          if (*(void *)v1350 != v59) {
            objc_enumerationMutation(v56);
          }
          v61 = [*(id *)(*((void *)&v1349 + 1) + 8 * ii) dictionaryRepresentation];
          [v55 addObject:v61];
        }
        uint64_t v58 = [v56 countByEnumeratingWithState:&v1349 objects:v1466 count:16];
      }
      while (v58);
    }

    [v3 setObject:v55 forKeyedSubscript:@"_payloadAppIdentifier"];
  }
  if ([*(id *)(v2 + 1648) count])
  {
    v62 = [MEMORY[0x1E4F1CA48] array];
    long long v1345 = 0u;
    long long v1346 = 0u;
    long long v1347 = 0u;
    long long v1348 = 0u;
    id v63 = *(id *)(v2 + 1648);
    uint64_t v64 = [v63 countByEnumeratingWithState:&v1345 objects:v1465 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = *(void *)v1346;
      do
      {
        for (juint64_t j = 0; jj != v65; ++jj)
        {
          if (*(void *)v1346 != v66) {
            objc_enumerationMutation(v63);
          }
          v68 = [*(id *)(*((void *)&v1345 + 1) + 8 * jj) dictionaryRepresentation];
          [v62 addObject:v68];
        }
        uint64_t v65 = [v63 countByEnumeratingWithState:&v1345 objects:v1465 count:16];
      }
      while (v65);
    }

    [v3 setObject:v62 forKeyedSubscript:@"_payloadArchivedObject"];
  }
  if (*(void *)(v2 + 112))
  {
    v69 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadBalanceTypesCount"));
    if ([(id)v2 payloadBalanceTypesCount])
    {
      unint64_t v70 = 0;
      do
      {
        unsigned int v71 = *(_DWORD *)(*(void *)(v2 + 104) + 4 * v70) - 1;
        if (v71 >= 3)
        {
          v72 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 104) + 4 * v70));
        }
        else
        {
          v72 = *(&off_1E551C8E0 + v71);
        }
        [v69 addObject:v72];

        ++v70;
      }
      while (v70 < [(id)v2 payloadBalanceTypesCount]);
    }
    [v3 setObject:v69 forKeyedSubscript:@"_payloadBalanceType"];
  }
  if ([*(id *)(v2 + 1656) count])
  {
    v73 = [MEMORY[0x1E4F1CA48] array];
    long long v1341 = 0u;
    long long v1342 = 0u;
    long long v1343 = 0u;
    long long v1344 = 0u;
    id v74 = *(id *)(v2 + 1656);
    uint64_t v75 = [v74 countByEnumeratingWithState:&v1341 objects:v1464 count:16];
    if (v75)
    {
      uint64_t v76 = v75;
      uint64_t v77 = *(void *)v1342;
      do
      {
        for (kuint64_t k = 0; kk != v76; ++kk)
        {
          if (*(void *)v1342 != v77) {
            objc_enumerationMutation(v74);
          }
          v79 = [*(id *)(*((void *)&v1341 + 1) + 8 * kk) dictionaryRepresentation];
          [v73 addObject:v79];
        }
        uint64_t v76 = [v74 countByEnumeratingWithState:&v1341 objects:v1464 count:16];
      }
      while (v76);
    }

    [v3 setObject:v73 forKeyedSubscript:@"_payloadBillDetailsValue"];
  }
  if ([*(id *)(v2 + 1664) count])
  {
    v80 = [MEMORY[0x1E4F1CA48] array];
    long long v1337 = 0u;
    long long v1338 = 0u;
    long long v1339 = 0u;
    long long v1340 = 0u;
    id v81 = *(id *)(v2 + 1664);
    uint64_t v82 = [v81 countByEnumeratingWithState:&v1337 objects:v1463 count:16];
    if (v82)
    {
      uint64_t v83 = v82;
      uint64_t v84 = *(void *)v1338;
      do
      {
        for (muint64_t m = 0; mm != v83; ++mm)
        {
          if (*(void *)v1338 != v84) {
            objc_enumerationMutation(v81);
          }
          v86 = [*(id *)(*((void *)&v1337 + 1) + 8 * mm) dictionaryRepresentation];
          [v80 addObject:v86];
        }
        uint64_t v83 = [v81 countByEnumeratingWithState:&v1337 objects:v1463 count:16];
      }
      while (v83);
    }

    [v3 setObject:v80 forKeyedSubscript:@"_payloadBillPayeeValue"];
  }
  if (*(void *)(v2 + 136))
  {
    v87 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadBillTypesCount"));
    if ([(id)v2 payloadBillTypesCount])
    {
      unint64_t v88 = 0;
      do
      {
        unsigned int v89 = *(_DWORD *)(*(void *)(v2 + 128) + 4 * v88) - 1;
        if (v89 >= 0x16)
        {
          v90 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 128) + 4 * v88));
        }
        else
        {
          v90 = *(&off_1E551C8F8 + v89);
        }
        [v87 addObject:v90];

        ++v88;
      }
      while (v88 < [(id)v2 payloadBillTypesCount]);
    }
    [v3 setObject:v87 forKeyedSubscript:@"_payloadBillType"];
  }
  if (*(void *)(v2 + 160))
  {
    v91 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadBinarySettingValuesCount"));
    if ([(id)v2 payloadBinarySettingValuesCount])
    {
      unint64_t v92 = 0;
      do
      {
        unsigned int v93 = *(_DWORD *)(*(void *)(v2 + 152) + 4 * v92) - 1;
        if (v93 >= 3)
        {
          v94 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 152) + 4 * v92));
        }
        else
        {
          v94 = *(&off_1E551C9A8 + v93);
        }
        [v91 addObject:v94];

        ++v92;
      }
      while (v92 < [(id)v2 payloadBinarySettingValuesCount]);
    }
    [v3 setObject:v91 forKeyedSubscript:@"_payloadBinarySettingValue"];
  }
  if (*(void *)(v2 + 184))
  {
    v95 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadBoundedSettingValuesCount"));
    if ([(id)v2 payloadBoundedSettingValuesCount])
    {
      unint64_t v96 = 0;
      do
      {
        unsigned int v97 = *(_DWORD *)(*(void *)(v2 + 176) + 4 * v96) - 1;
        if (v97 >= 3)
        {
          v98 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 176) + 4 * v96));
        }
        else
        {
          v98 = *(&off_1E551C9C0 + v97);
        }
        [v95 addObject:v98];

        ++v96;
      }
      while (v96 < [(id)v2 payloadBoundedSettingValuesCount]);
    }
    [v3 setObject:v95 forKeyedSubscript:@"_payloadBoundedSettingValue"];
  }
  if ([*(id *)(v2 + 1672) count])
  {
    v99 = [MEMORY[0x1E4F1CA48] array];
    long long v1333 = 0u;
    long long v1334 = 0u;
    long long v1335 = 0u;
    long long v1336 = 0u;
    id v100 = *(id *)(v2 + 1672);
    uint64_t v101 = [v100 countByEnumeratingWithState:&v1333 objects:v1462 count:16];
    if (v101)
    {
      uint64_t v102 = v101;
      uint64_t v103 = *(void *)v1334;
      do
      {
        for (nuint64_t n = 0; nn != v102; ++nn)
        {
          if (*(void *)v1334 != v103) {
            objc_enumerationMutation(v100);
          }
          v105 = [*(id *)(*((void *)&v1333 + 1) + 8 * nn) dictionaryRepresentation];
          [v99 addObject:v105];
        }
        uint64_t v102 = [v100 countByEnumeratingWithState:&v1333 objects:v1462 count:16];
      }
      while (v102);
    }

    [v3 setObject:v99 forKeyedSubscript:@"_payloadCalendarEvent"];
  }
  if (*(void *)(v2 + 208))
  {
    v106 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadCallAudioRoutesCount"));
    if ([(id)v2 payloadCallAudioRoutesCount])
    {
      unint64_t v107 = 0;
      do
      {
        unsigned int v108 = *(_DWORD *)(*(void *)(v2 + 200) + 4 * v107) - 2;
        if (v108 >= 3)
        {
          v109 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 200) + 4 * v107));
        }
        else
        {
          v109 = *(&off_1E551C9D8 + v108);
        }
        [v106 addObject:v109];

        ++v107;
      }
      while (v107 < [(id)v2 payloadCallAudioRoutesCount]);
    }
    [v3 setObject:v106 forKeyedSubscript:@"_payloadCallAudioRoute"];
  }
  if (*(void *)(v2 + 232))
  {
    v110 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadCallCapabilitiesCount"));
    if ([(id)v2 payloadCallCapabilitiesCount])
    {
      unint64_t v111 = 0;
      do
      {
        int v112 = *(_DWORD *)(*(void *)(v2 + 224) + 4 * v111);
        if (v112 == 1)
        {
          v113 = @"AUDIO_CALL";
        }
        else if (v112 == 2)
        {
          v113 = @"VIDEO_CALL";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 224) + 4 * v111));
          v113 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v110 addObject:v113];

        ++v111;
      }
      while (v111 < [(id)v2 payloadCallCapabilitiesCount]);
    }
    [v3 setObject:v110 forKeyedSubscript:@"_payloadCallCapability"];
  }
  if (*(void *)(v2 + 256))
  {
    v114 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadCallDestinationTypesCount"));
    if ([(id)v2 payloadCallDestinationTypesCount])
    {
      unint64_t v115 = 0;
      do
      {
        unsigned int v116 = *(_DWORD *)(*(void *)(v2 + 248) + 4 * v115) - 1;
        if (v116 >= 5)
        {
          v117 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 248) + 4 * v115));
        }
        else
        {
          v117 = *(&off_1E551C9F0 + v116);
        }
        [v114 addObject:v117];

        ++v115;
      }
      while (v115 < [(id)v2 payloadCallDestinationTypesCount]);
    }
    [v3 setObject:v114 forKeyedSubscript:@"_payloadCallDestinationType"];
  }
  if ([*(id *)(v2 + 1680) count])
  {
    v118 = [MEMORY[0x1E4F1CA48] array];
    long long v1329 = 0u;
    long long v1330 = 0u;
    long long v1331 = 0u;
    long long v1332 = 0u;
    id v119 = *(id *)(v2 + 1680);
    uint64_t v120 = [v119 countByEnumeratingWithState:&v1329 objects:v1461 count:16];
    if (v120)
    {
      uint64_t v121 = v120;
      uint64_t v122 = *(void *)v1330;
      do
      {
        for (uint64_t i1 = 0; i1 != v121; ++i1)
        {
          if (*(void *)v1330 != v122) {
            objc_enumerationMutation(v119);
          }
          v124 = [*(id *)(*((void *)&v1329 + 1) + 8 * i1) dictionaryRepresentation];
          [v118 addObject:v124];
        }
        uint64_t v121 = [v119 countByEnumeratingWithState:&v1329 objects:v1461 count:16];
      }
      while (v121);
    }

    [v3 setObject:v118 forKeyedSubscript:@"_payloadCallGroup"];
  }
  if ([*(id *)(v2 + 1688) count])
  {
    v125 = [MEMORY[0x1E4F1CA48] array];
    long long v1325 = 0u;
    long long v1326 = 0u;
    long long v1327 = 0u;
    long long v1328 = 0u;
    id v126 = *(id *)(v2 + 1688);
    uint64_t v127 = [v126 countByEnumeratingWithState:&v1325 objects:v1460 count:16];
    if (v127)
    {
      uint64_t v128 = v127;
      uint64_t v129 = *(void *)v1326;
      do
      {
        for (uint64_t i2 = 0; i2 != v128; ++i2)
        {
          if (*(void *)v1326 != v129) {
            objc_enumerationMutation(v126);
          }
          v131 = [*(id *)(*((void *)&v1325 + 1) + 8 * i2) dictionaryRepresentation];
          [v125 addObject:v131];
        }
        uint64_t v128 = [v126 countByEnumeratingWithState:&v1325 objects:v1460 count:16];
      }
      while (v128);
    }

    [v3 setObject:v125 forKeyedSubscript:@"_payloadCallGroupConversation"];
  }
  if ([*(id *)(v2 + 1696) count])
  {
    v132 = [MEMORY[0x1E4F1CA48] array];
    long long v1321 = 0u;
    long long v1322 = 0u;
    long long v1323 = 0u;
    long long v1324 = 0u;
    id v133 = *(id *)(v2 + 1696);
    uint64_t v134 = [v133 countByEnumeratingWithState:&v1321 objects:v1459 count:16];
    if (v134)
    {
      uint64_t v135 = v134;
      uint64_t v136 = *(void *)v1322;
      do
      {
        for (uint64_t i3 = 0; i3 != v135; ++i3)
        {
          if (*(void *)v1322 != v136) {
            objc_enumerationMutation(v133);
          }
          v138 = [*(id *)(*((void *)&v1321 + 1) + 8 * i3) dictionaryRepresentation];
          [v132 addObject:v138];
        }
        uint64_t v135 = [v133 countByEnumeratingWithState:&v1321 objects:v1459 count:16];
      }
      while (v135);
    }

    [v3 setObject:v132 forKeyedSubscript:@"_payloadCallRecordFilter"];
  }
  if (*(void *)(v2 + 280))
  {
    v139 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadCallRecordTypesCount"));
    if ([(id)v2 payloadCallRecordTypesCount])
    {
      unint64_t v140 = 0;
      do
      {
        unsigned int v141 = *(_DWORD *)(*(void *)(v2 + 272) + 4 * v140) - 2;
        if (v141 < 9 && ((0x1EFu >> v141) & 1) != 0)
        {
          v142 = *(&off_1E551CA18 + v141);
        }
        else
        {
          v142 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 272) + 4 * v140));
        }
        [v139 addObject:v142];

        ++v140;
      }
      while (v140 < [(id)v2 payloadCallRecordTypesCount]);
    }
    [v3 setObject:v139 forKeyedSubscript:@"_payloadCallRecordType"];
  }
  if ([*(id *)(v2 + 1704) count])
  {
    v143 = [MEMORY[0x1E4F1CA48] array];
    long long v1317 = 0u;
    long long v1318 = 0u;
    long long v1319 = 0u;
    long long v1320 = 0u;
    id v144 = *(id *)(v2 + 1704);
    uint64_t v145 = [v144 countByEnumeratingWithState:&v1317 objects:v1458 count:16];
    if (v145)
    {
      uint64_t v146 = v145;
      uint64_t v147 = *(void *)v1318;
      do
      {
        for (uint64_t i4 = 0; i4 != v146; ++i4)
        {
          if (*(void *)v1318 != v147) {
            objc_enumerationMutation(v144);
          }
          v149 = [*(id *)(*((void *)&v1317 + 1) + 8 * i4) dictionaryRepresentation];
          [v143 addObject:v149];
        }
        uint64_t v146 = [v144 countByEnumeratingWithState:&v1317 objects:v1458 count:16];
      }
      while (v146);
    }

    [v3 setObject:v143 forKeyedSubscript:@"_payloadCallRecordValue"];
  }
  if (*(void *)(v2 + 304))
  {
    v150 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadCarAirCirculationModesCount"));
    if ([(id)v2 payloadCarAirCirculationModesCount])
    {
      unint64_t v151 = 0;
      do
      {
        int v152 = *(_DWORD *)(*(void *)(v2 + 296) + 4 * v151);
        if (v152 == 1)
        {
          v153 = @"FRESH_AIR";
        }
        else if (v152 == 2)
        {
          v153 = @"RECIRCULATE_AIR";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 296) + 4 * v151));
          v153 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v150 addObject:v153];

        ++v151;
      }
      while (v151 < [(id)v2 payloadCarAirCirculationModesCount]);
    }
    [v3 setObject:v150 forKeyedSubscript:@"_payloadCarAirCirculationMode"];
  }
  if (*(void *)(v2 + 328))
  {
    v154 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadCarAudioSourcesCount"));
    if ([(id)v2 payloadCarAudioSourcesCount])
    {
      unint64_t v155 = 0;
      do
      {
        unsigned int v156 = *(_DWORD *)(*(void *)(v2 + 320) + 4 * v155) - 1;
        if (v156 >= 9)
        {
          v157 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 320) + 4 * v155));
        }
        else
        {
          v157 = *(&off_1E551CA60 + v156);
        }
        [v154 addObject:v157];

        ++v155;
      }
      while (v155 < [(id)v2 payloadCarAudioSourcesCount]);
    }
    [v3 setObject:v154 forKeyedSubscript:@"_payloadCarAudioSource"];
  }
  if (*(void *)(v2 + 352))
  {
    v158 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadCarDefrostersCount"));
    if ([(id)v2 payloadCarDefrostersCount])
    {
      unint64_t v159 = 0;
      do
      {
        unsigned int v160 = *(_DWORD *)(*(void *)(v2 + 344) + 4 * v159) - 1;
        if (v160 >= 3)
        {
          v161 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 344) + 4 * v159));
        }
        else
        {
          v161 = *(&off_1E551CAA8 + v160);
        }
        [v158 addObject:v161];

        ++v159;
      }
      while (v159 < [(id)v2 payloadCarDefrostersCount]);
    }
    [v3 setObject:v158 forKeyedSubscript:@"_payloadCarDefroster"];
  }
  if (*(void *)(v2 + 376))
  {
    v162 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadCarSeatsCount"));
    if ([(id)v2 payloadCarSeatsCount])
    {
      unint64_t v163 = 0;
      do
      {
        unsigned int v164 = *(_DWORD *)(*(void *)(v2 + 368) + 4 * v163) - 1;
        if (v164 < 0x16 && ((0x3F8383u >> v164) & 1) != 0)
        {
          v165 = *(&off_1E551CAC0 + v164);
        }
        else
        {
          v165 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 368) + 4 * v163));
        }
        [v162 addObject:v165];

        ++v163;
      }
      while (v163 < [(id)v2 payloadCarSeatsCount]);
    }
    [v3 setObject:v162 forKeyedSubscript:@"_payloadCarSeat"];
  }
  if (*(void *)(v2 + 400))
  {
    v166 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadCarSignalIdentifiersCount"));
    if ([(id)v2 payloadCarSignalIdentifiersCount])
    {
      unint64_t v167 = 0;
      do
      {
        int v168 = *(_DWORD *)(*(void *)(v2 + 392) + 4 * v167);
        if (v168 == 1)
        {
          v169 = @"AUDIBLE";
        }
        else if (v168 == 2)
        {
          v169 = @"VISIBLE";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 392) + 4 * v167));
          v169 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v166 addObject:v169];

        ++v167;
      }
      while (v167 < [(id)v2 payloadCarSignalIdentifiersCount]);
    }
    [v3 setObject:v166 forKeyedSubscript:@"_payloadCarSignalIdentifier"];
  }
  if (*(void *)(v2 + 424))
  {
    v170 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadChangeAlarmStatusOperationsCount"));
    if ([(id)v2 payloadChangeAlarmStatusOperationsCount])
    {
      unint64_t v171 = 0;
      do
      {
        unsigned int v172 = *(_DWORD *)(*(void *)(v2 + 416) + 4 * v171) - 1;
        if (v172 >= 3)
        {
          v173 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 416) + 4 * v171));
        }
        else
        {
          v173 = *(&off_1E551CB70 + v172);
        }
        [v170 addObject:v173];

        ++v171;
      }
      while (v171 < [(id)v2 payloadChangeAlarmStatusOperationsCount]);
    }
    [v3 setObject:v170 forKeyedSubscript:@"_payloadChangeAlarmStatusOperation"];
  }
  if (*(void *)(v2 + 1712))
  {
    v174 = [(id)v2 payloadChargingConnectorTypes];
    v175 = (void *)[v174 copy];
    [v3 setObject:v175 forKeyedSubscript:@"_payloadChargingConnectorType"];
  }
  if ([*(id *)(v2 + 1720) count])
  {
    v176 = [MEMORY[0x1E4F1CA48] array];
    long long v1313 = 0u;
    long long v1314 = 0u;
    long long v1315 = 0u;
    long long v1316 = 0u;
    id v177 = *(id *)(v2 + 1720);
    uint64_t v178 = [v177 countByEnumeratingWithState:&v1313 objects:v1457 count:16];
    if (v178)
    {
      uint64_t v179 = v178;
      uint64_t v180 = *(void *)v1314;
      do
      {
        for (uint64_t i5 = 0; i5 != v179; ++i5)
        {
          if (*(void *)v1314 != v180) {
            objc_enumerationMutation(v177);
          }
          v182 = [*(id *)(*((void *)&v1313 + 1) + 8 * i5) dictionaryRepresentation];
          [v176 addObject:v182];
        }
        uint64_t v179 = [v177 countByEnumeratingWithState:&v1313 objects:v1457 count:16];
      }
      while (v179);
    }

    [v3 setObject:v176 forKeyedSubscript:@"_payloadContactEventTrigger"];
  }
  if ([*(id *)(v2 + 1728) count])
  {
    v183 = [MEMORY[0x1E4F1CA48] array];
    long long v1309 = 0u;
    long long v1310 = 0u;
    long long v1311 = 0u;
    long long v1312 = 0u;
    id v184 = *(id *)(v2 + 1728);
    uint64_t v185 = [v184 countByEnumeratingWithState:&v1309 objects:v1456 count:16];
    if (v185)
    {
      uint64_t v186 = v185;
      uint64_t v187 = *(void *)v1310;
      do
      {
        for (uint64_t i6 = 0; i6 != v186; ++i6)
        {
          if (*(void *)v1310 != v187) {
            objc_enumerationMutation(v184);
          }
          v189 = [*(id *)(*((void *)&v1309 + 1) + 8 * i6) dictionaryRepresentation];
          [v183 addObject:v189];
        }
        uint64_t v186 = [v184 countByEnumeratingWithState:&v1309 objects:v1456 count:16];
      }
      while (v186);
    }

    [v3 setObject:v183 forKeyedSubscript:@"_payloadContactList"];
  }
  if ([*(id *)(v2 + 1736) count])
  {
    v190 = [MEMORY[0x1E4F1CA48] array];
    long long v1305 = 0u;
    long long v1306 = 0u;
    long long v1307 = 0u;
    long long v1308 = 0u;
    id v191 = *(id *)(v2 + 1736);
    uint64_t v192 = [v191 countByEnumeratingWithState:&v1305 objects:v1455 count:16];
    if (v192)
    {
      uint64_t v193 = v192;
      uint64_t v194 = *(void *)v1306;
      do
      {
        for (uint64_t i7 = 0; i7 != v193; ++i7)
        {
          if (*(void *)v1306 != v194) {
            objc_enumerationMutation(v191);
          }
          v196 = [*(id *)(*((void *)&v1305 + 1) + 8 * i7) dictionaryRepresentation];
          [v190 addObject:v196];
        }
        uint64_t v193 = [v191 countByEnumeratingWithState:&v1305 objects:v1455 count:16];
      }
      while (v193);
    }

    [v3 setObject:v190 forKeyedSubscript:@"_payloadContactValue"];
  }
  if ([*(id *)(v2 + 1744) count])
  {
    v197 = [MEMORY[0x1E4F1CA48] array];
    long long v1301 = 0u;
    long long v1302 = 0u;
    long long v1303 = 0u;
    long long v1304 = 0u;
    id v198 = *(id *)(v2 + 1744);
    uint64_t v199 = [v198 countByEnumeratingWithState:&v1301 objects:v1454 count:16];
    if (v199)
    {
      uint64_t v200 = v199;
      uint64_t v201 = *(void *)v1302;
      do
      {
        for (uint64_t i8 = 0; i8 != v200; ++i8)
        {
          if (*(void *)v1302 != v201) {
            objc_enumerationMutation(v198);
          }
          v203 = [*(id *)(*((void *)&v1301 + 1) + 8 * i8) dictionaryRepresentation];
          [v197 addObject:v203];
        }
        uint64_t v200 = [v198 countByEnumeratingWithState:&v1301 objects:v1454 count:16];
      }
      while (v200);
    }

    [v3 setObject:v197 forKeyedSubscript:@"_payloadCurrencyAmount"];
  }
  if ([*(id *)(v2 + 1752) count])
  {
    v204 = [MEMORY[0x1E4F1CA48] array];
    long long v1297 = 0u;
    long long v1298 = 0u;
    long long v1299 = 0u;
    long long v1300 = 0u;
    id v205 = *(id *)(v2 + 1752);
    uint64_t v206 = [v205 countByEnumeratingWithState:&v1297 objects:v1453 count:16];
    if (v206)
    {
      uint64_t v207 = v206;
      uint64_t v208 = *(void *)v1298;
      do
      {
        for (uint64_t i9 = 0; i9 != v207; ++i9)
        {
          if (*(void *)v1298 != v208) {
            objc_enumerationMutation(v205);
          }
          v210 = [*(id *)(*((void *)&v1297 + 1) + 8 * i9) dictionaryRepresentation];
          [v204 addObject:v210];
        }
        uint64_t v207 = [v205 countByEnumeratingWithState:&v1297 objects:v1453 count:16];
      }
      while (v207);
    }

    [v3 setObject:v204 forKeyedSubscript:@"_payloadCustomObject"];
  }
  if ([*(id *)(v2 + 1760) count])
  {
    v211 = [MEMORY[0x1E4F1CA48] array];
    long long v1293 = 0u;
    long long v1294 = 0u;
    long long v1295 = 0u;
    long long v1296 = 0u;
    id v212 = *(id *)(v2 + 1760);
    uint64_t v213 = [v212 countByEnumeratingWithState:&v1293 objects:v1452 count:16];
    if (v213)
    {
      uint64_t v214 = v213;
      uint64_t v215 = *(void *)v1294;
      do
      {
        for (uint64_t i10 = 0; i10 != v214; ++i10)
        {
          if (*(void *)v1294 != v215) {
            objc_enumerationMutation(v212);
          }
          v217 = [*(id *)(*((void *)&v1293 + 1) + 8 * i10) dictionaryRepresentation];
          [v211 addObject:v217];
        }
        uint64_t v214 = [v212 countByEnumeratingWithState:&v1293 objects:v1452 count:16];
      }
      while (v214);
    }

    [v3 setObject:v211 forKeyedSubscript:@"_payloadDataString"];
  }
  if ([*(id *)(v2 + 1768) count])
  {
    v218 = [MEMORY[0x1E4F1CA48] array];
    long long v1289 = 0u;
    long long v1290 = 0u;
    long long v1291 = 0u;
    long long v1292 = 0u;
    id v219 = *(id *)(v2 + 1768);
    uint64_t v220 = [v219 countByEnumeratingWithState:&v1289 objects:v1451 count:16];
    if (v220)
    {
      uint64_t v221 = v220;
      uint64_t v222 = *(void *)v1290;
      do
      {
        for (uint64_t i11 = 0; i11 != v221; ++i11)
        {
          if (*(void *)v1290 != v222) {
            objc_enumerationMutation(v219);
          }
          v224 = [*(id *)(*((void *)&v1289 + 1) + 8 * i11) dictionaryRepresentation];
          [v218 addObject:v224];
        }
        uint64_t v221 = [v219 countByEnumeratingWithState:&v1289 objects:v1451 count:16];
      }
      while (v221);
    }

    [v3 setObject:v218 forKeyedSubscript:@"_payloadDataStringList"];
  }
  if (*(void *)(v2 + 448))
  {
    v225 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadDateSearchTypesCount"));
    if ([(id)v2 payloadDateSearchTypesCount])
    {
      for (unint64_t i12 = 0; i12 < [(id)v2 payloadDateSearchTypesCount]; ++i12)
      {
        int v227 = *(_DWORD *)(*(void *)(v2 + 440) + 4 * i12);
        if (v227 > 19)
        {
          if (v227 == 20)
          {
            v228 = @"BY_MODIFIED_DATE";
            goto LABEL_357;
          }
          if (v227 != 30) {
            goto LABEL_354;
          }
          v228 = @"BY_CREATED_DATE";
        }
        else
        {
          if (!v227)
          {
            v228 = @"UNKNOWN_DATE_SEARCH_TYPE";
            goto LABEL_357;
          }
          if (v227 != 10)
          {
LABEL_354:
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 440) + 4 * i12));
            v228 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_357;
          }
          v228 = @"BY_DUE_DATE";
        }
LABEL_357:
        [v225 addObject:v228];
      }
    }
    [v3 setObject:v225 forKeyedSubscript:@"_payloadDateSearchType"];
  }
  if ([*(id *)(v2 + 1776) count])
  {
    v229 = [MEMORY[0x1E4F1CA48] array];
    long long v1285 = 0u;
    long long v1286 = 0u;
    long long v1287 = 0u;
    long long v1288 = 0u;
    id v230 = *(id *)(v2 + 1776);
    uint64_t v231 = [v230 countByEnumeratingWithState:&v1285 objects:v1450 count:16];
    if (v231)
    {
      uint64_t v232 = v231;
      uint64_t v233 = *(void *)v1286;
      do
      {
        for (uint64_t i13 = 0; i13 != v232; ++i13)
        {
          if (*(void *)v1286 != v233) {
            objc_enumerationMutation(v230);
          }
          v235 = [*(id *)(*((void *)&v1285 + 1) + 8 * i13) dictionaryRepresentation];
          [v229 addObject:v235];
        }
        uint64_t v232 = [v230 countByEnumeratingWithState:&v1285 objects:v1450 count:16];
      }
      while (v232);
    }

    [v3 setObject:v229 forKeyedSubscript:@"_payloadDateTimeRangeList"];
  }
  if ([*(id *)(v2 + 1784) count])
  {
    v236 = [MEMORY[0x1E4F1CA48] array];
    long long v1281 = 0u;
    long long v1282 = 0u;
    long long v1283 = 0u;
    long long v1284 = 0u;
    id v237 = *(id *)(v2 + 1784);
    uint64_t v238 = [v237 countByEnumeratingWithState:&v1281 objects:v1449 count:16];
    if (v238)
    {
      uint64_t v239 = v238;
      uint64_t v240 = *(void *)v1282;
      do
      {
        for (uint64_t i14 = 0; i14 != v239; ++i14)
        {
          if (*(void *)v1282 != v240) {
            objc_enumerationMutation(v237);
          }
          v242 = [*(id *)(*((void *)&v1281 + 1) + 8 * i14) dictionaryRepresentation];
          [v236 addObject:v242];
        }
        uint64_t v239 = [v237 countByEnumeratingWithState:&v1281 objects:v1449 count:16];
      }
      while (v239);
    }

    [v3 setObject:v236 forKeyedSubscript:@"_payloadDateTimeRangeValue"];
  }
  if ([*(id *)(v2 + 1792) count])
  {
    v243 = [MEMORY[0x1E4F1CA48] array];
    long long v1277 = 0u;
    long long v1278 = 0u;
    long long v1279 = 0u;
    long long v1280 = 0u;
    id v244 = *(id *)(v2 + 1792);
    uint64_t v245 = [v244 countByEnumeratingWithState:&v1277 objects:v1448 count:16];
    if (v245)
    {
      uint64_t v246 = v245;
      uint64_t v247 = *(void *)v1278;
      do
      {
        for (uint64_t i15 = 0; i15 != v246; ++i15)
        {
          if (*(void *)v1278 != v247) {
            objc_enumerationMutation(v244);
          }
          v249 = [*(id *)(*((void *)&v1277 + 1) + 8 * i15) dictionaryRepresentation];
          [v243 addObject:v249];
        }
        uint64_t v246 = [v244 countByEnumeratingWithState:&v1277 objects:v1448 count:16];
      }
      while (v246);
    }

    [v3 setObject:v243 forKeyedSubscript:@"_payloadDateTimeValue"];
  }
  if ([*(id *)(v2 + 1800) count])
  {
    v250 = [MEMORY[0x1E4F1CA48] array];
    long long v1273 = 0u;
    long long v1274 = 0u;
    long long v1275 = 0u;
    long long v1276 = 0u;
    id v251 = *(id *)(v2 + 1800);
    uint64_t v252 = [v251 countByEnumeratingWithState:&v1273 objects:v1447 count:16];
    if (v252)
    {
      uint64_t v253 = v252;
      uint64_t v254 = *(void *)v1274;
      do
      {
        for (uint64_t i16 = 0; i16 != v253; ++i16)
        {
          if (*(void *)v1274 != v254) {
            objc_enumerationMutation(v251);
          }
          v256 = [*(id *)(*((void *)&v1273 + 1) + 8 * i16) dictionaryRepresentation];
          [v250 addObject:v256];
        }
        uint64_t v253 = [v251 countByEnumeratingWithState:&v1273 objects:v1447 count:16];
      }
      while (v253);
    }

    [v3 setObject:v250 forKeyedSubscript:@"_payloadDevice"];
  }
  if ([*(id *)(v2 + 1808) count])
  {
    v257 = [MEMORY[0x1E4F1CA48] array];
    long long v1269 = 0u;
    long long v1270 = 0u;
    long long v1271 = 0u;
    long long v1272 = 0u;
    id v258 = *(id *)(v2 + 1808);
    uint64_t v259 = [v258 countByEnumeratingWithState:&v1269 objects:v1446 count:16];
    if (v259)
    {
      uint64_t v260 = v259;
      uint64_t v261 = *(void *)v1270;
      do
      {
        for (uint64_t i17 = 0; i17 != v260; ++i17)
        {
          if (*(void *)v1270 != v261) {
            objc_enumerationMutation(v258);
          }
          v263 = [*(id *)(*((void *)&v1269 + 1) + 8 * i17) dictionaryRepresentation];
          [v257 addObject:v263];
        }
        uint64_t v260 = [v258 countByEnumeratingWithState:&v1269 objects:v1446 count:16];
      }
      while (v260);
    }

    [v3 setObject:v257 forKeyedSubscript:@"_payloadDeviceDetail"];
  }
  if (*(void *)(v2 + 472))
  {
    v264 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadDeviceTypesCount"));
    if ([(id)v2 payloadDeviceTypesCount])
    {
      unint64_t v265 = 0;
      do
      {
        uint64_t v266 = *(unsigned int *)(*(void *)(v2 + 464) + 4 * v265);
        if (v266 >= 0xC)
        {
          v267 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 464) + 4 * v265));
        }
        else
        {
          v267 = *(&off_1E551CB88 + v266);
        }
        [v264 addObject:v267];

        ++v265;
      }
      while (v265 < [(id)v2 payloadDeviceTypesCount]);
    }
    [v3 setObject:v264 forKeyedSubscript:@"_payloadDeviceType"];
  }
  if ([*(id *)(v2 + 1816) count])
  {
    v268 = [MEMORY[0x1E4F1CA48] array];
    long long v1265 = 0u;
    long long v1266 = 0u;
    long long v1267 = 0u;
    long long v1268 = 0u;
    id v269 = *(id *)(v2 + 1816);
    uint64_t v270 = [v269 countByEnumeratingWithState:&v1265 objects:v1445 count:16];
    if (v270)
    {
      uint64_t v271 = v270;
      uint64_t v272 = *(void *)v1266;
      do
      {
        for (uint64_t i18 = 0; i18 != v271; ++i18)
        {
          if (*(void *)v1266 != v272) {
            objc_enumerationMutation(v269);
          }
          v274 = [*(id *)(*((void *)&v1265 + 1) + 8 * i18) dictionaryRepresentation];
          [v268 addObject:v274];
        }
        uint64_t v271 = [v269 countByEnumeratingWithState:&v1265 objects:v1445 count:16];
      }
      while (v271);
    }

    [v3 setObject:v268 forKeyedSubscript:@"_payloadDialingContact"];
  }
  if ([*(id *)(v2 + 1824) count])
  {
    v275 = [MEMORY[0x1E4F1CA48] array];
    long long v1261 = 0u;
    long long v1262 = 0u;
    long long v1263 = 0u;
    long long v1264 = 0u;
    id v276 = *(id *)(v2 + 1824);
    uint64_t v277 = [v276 countByEnumeratingWithState:&v1261 objects:v1444 count:16];
    if (v277)
    {
      uint64_t v278 = v277;
      uint64_t v279 = *(void *)v1262;
      do
      {
        for (uint64_t i19 = 0; i19 != v278; ++i19)
        {
          if (*(void *)v1262 != v279) {
            objc_enumerationMutation(v276);
          }
          v281 = [*(id *)(*((void *)&v1261 + 1) + 8 * i19) dictionaryRepresentation];
          [v275 addObject:v281];
        }
        uint64_t v278 = [v276 countByEnumeratingWithState:&v1261 objects:v1444 count:16];
      }
      while (v278);
    }

    [v3 setObject:v275 forKeyedSubscript:@"_payloadDistanceList"];
  }
  if ([*(id *)(v2 + 1832) count])
  {
    v282 = [MEMORY[0x1E4F1CA48] array];
    long long v1257 = 0u;
    long long v1258 = 0u;
    long long v1259 = 0u;
    long long v1260 = 0u;
    id v283 = *(id *)(v2 + 1832);
    uint64_t v284 = [v283 countByEnumeratingWithState:&v1257 objects:v1443 count:16];
    if (v284)
    {
      uint64_t v285 = v284;
      uint64_t v286 = *(void *)v1258;
      do
      {
        for (uint64_t i20 = 0; i20 != v285; ++i20)
        {
          if (*(void *)v1258 != v286) {
            objc_enumerationMutation(v283);
          }
          v288 = [*(id *)(*((void *)&v1257 + 1) + 8 * i20) dictionaryRepresentation];
          [v282 addObject:v288];
        }
        uint64_t v285 = [v283 countByEnumeratingWithState:&v1257 objects:v1443 count:16];
      }
      while (v285);
    }

    [v3 setObject:v282 forKeyedSubscript:@"_payloadDistanceValue"];
  }
  if ([*(id *)(v2 + 1840) count])
  {
    v289 = [MEMORY[0x1E4F1CA48] array];
    long long v1253 = 0u;
    long long v1254 = 0u;
    long long v1255 = 0u;
    long long v1256 = 0u;
    id v290 = *(id *)(v2 + 1840);
    uint64_t v291 = [v290 countByEnumeratingWithState:&v1253 objects:v1442 count:16];
    if (v291)
    {
      uint64_t v292 = v291;
      uint64_t v293 = *(void *)v1254;
      do
      {
        for (uint64_t i21 = 0; i21 != v292; ++i21)
        {
          if (*(void *)v1254 != v293) {
            objc_enumerationMutation(v290);
          }
          v295 = [*(id *)(*((void *)&v1253 + 1) + 8 * i21) dictionaryRepresentation];
          [v289 addObject:v295];
        }
        uint64_t v292 = [v290 countByEnumeratingWithState:&v1253 objects:v1442 count:16];
      }
      while (v292);
    }

    [v3 setObject:v289 forKeyedSubscript:@"_payloadDoubleList"];
  }
  if ([*(id *)(v2 + 1848) count])
  {
    v296 = [MEMORY[0x1E4F1CA48] array];
    long long v1249 = 0u;
    long long v1250 = 0u;
    long long v1251 = 0u;
    long long v1252 = 0u;
    id v297 = *(id *)(v2 + 1848);
    uint64_t v298 = [v297 countByEnumeratingWithState:&v1249 objects:v1441 count:16];
    if (v298)
    {
      uint64_t v299 = v298;
      uint64_t v300 = *(void *)v1250;
      do
      {
        for (uint64_t i22 = 0; i22 != v299; ++i22)
        {
          if (*(void *)v1250 != v300) {
            objc_enumerationMutation(v297);
          }
          v302 = [*(id *)(*((void *)&v1249 + 1) + 8 * i22) dictionaryRepresentation];
          [v296 addObject:v302];
        }
        uint64_t v299 = [v297 countByEnumeratingWithState:&v1249 objects:v1441 count:16];
      }
      while (v299);
    }

    [v3 setObject:v296 forKeyedSubscript:@"_payloadDoubleValue"];
  }
  if ([*(id *)(v2 + 1856) count])
  {
    v303 = [MEMORY[0x1E4F1CA48] array];
    long long v1245 = 0u;
    long long v1246 = 0u;
    long long v1247 = 0u;
    long long v1248 = 0u;
    id v304 = *(id *)(v2 + 1856);
    uint64_t v305 = [v304 countByEnumeratingWithState:&v1245 objects:v1440 count:16];
    if (v305)
    {
      uint64_t v306 = v305;
      uint64_t v307 = *(void *)v1246;
      do
      {
        for (uint64_t i23 = 0; i23 != v306; ++i23)
        {
          if (*(void *)v1246 != v307) {
            objc_enumerationMutation(v304);
          }
          v309 = [*(id *)(*((void *)&v1245 + 1) + 8 * i23) dictionaryRepresentation];
          [v303 addObject:v309];
        }
        uint64_t v306 = [v304 countByEnumeratingWithState:&v1245 objects:v1440 count:16];
      }
      while (v306);
    }

    [v3 setObject:v303 forKeyedSubscript:@"_payloadEnergyValue"];
  }
  if ([*(id *)(v2 + 1864) count])
  {
    v310 = [(id)v2 payloadEnumerations];
    v311 = (void *)[v310 copy];
    [v3 setObject:v311 forKeyedSubscript:@"_payloadEnumeration"];
  }
  if ([*(id *)(v2 + 1872) count])
  {
    v312 = [MEMORY[0x1E4F1CA48] array];
    long long v1241 = 0u;
    long long v1242 = 0u;
    long long v1243 = 0u;
    long long v1244 = 0u;
    id v313 = *(id *)(v2 + 1872);
    uint64_t v314 = [v313 countByEnumeratingWithState:&v1241 objects:v1439 count:16];
    if (v314)
    {
      uint64_t v315 = v314;
      uint64_t v316 = *(void *)v1242;
      do
      {
        for (uint64_t i24 = 0; i24 != v315; ++i24)
        {
          if (*(void *)v1242 != v316) {
            objc_enumerationMutation(v313);
          }
          v318 = [*(id *)(*((void *)&v1241 + 1) + 8 * i24) dictionaryRepresentation];
          [v312 addObject:v318];
        }
        uint64_t v315 = [v313 countByEnumeratingWithState:&v1241 objects:v1439 count:16];
      }
      while (v315);
    }

    [v3 setObject:v312 forKeyedSubscript:@"_payloadEvent"];
  }
  if (*(void *)(v2 + 496))
  {
    v319 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadEventAttributesCount"));
    if ([(id)v2 payloadEventAttributesCount])
    {
      unint64_t v320 = 0;
      do
      {
        unsigned int v321 = *(_DWORD *)(*(void *)(v2 + 488) + 4 * v320) - 1;
        if (v321 >= 3)
        {
          v322 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 488) + 4 * v320));
        }
        else
        {
          v322 = *(&off_1E551CBE8 + v321);
        }
        [v319 addObject:v322];

        ++v320;
      }
      while (v320 < [(id)v2 payloadEventAttributesCount]);
    }
    [v3 setObject:v319 forKeyedSubscript:@"_payloadEventAttribute"];
  }
  if ([*(id *)(v2 + 1880) count])
  {
    v323 = [MEMORY[0x1E4F1CA48] array];
    long long v1237 = 0u;
    long long v1238 = 0u;
    long long v1239 = 0u;
    long long v1240 = 0u;
    id v324 = *(id *)(v2 + 1880);
    uint64_t v325 = [v324 countByEnumeratingWithState:&v1237 objects:v1438 count:16];
    if (v325)
    {
      uint64_t v326 = v325;
      uint64_t v327 = *(void *)v1238;
      do
      {
        for (uint64_t i25 = 0; i25 != v326; ++i25)
        {
          if (*(void *)v1238 != v327) {
            objc_enumerationMutation(v324);
          }
          v329 = [*(id *)(*((void *)&v1237 + 1) + 8 * i25) dictionaryRepresentation];
          [v323 addObject:v329];
        }
        uint64_t v326 = [v324 countByEnumeratingWithState:&v1237 objects:v1438 count:16];
      }
      while (v326);
    }

    [v3 setObject:v323 forKeyedSubscript:@"_payloadEventList"];
  }
  if ([*(id *)(v2 + 1888) count])
  {
    v330 = [MEMORY[0x1E4F1CA48] array];
    long long v1233 = 0u;
    long long v1234 = 0u;
    long long v1235 = 0u;
    long long v1236 = 0u;
    id v331 = *(id *)(v2 + 1888);
    uint64_t v332 = [v331 countByEnumeratingWithState:&v1233 objects:v1437 count:16];
    if (v332)
    {
      uint64_t v333 = v332;
      uint64_t v334 = *(void *)v1234;
      do
      {
        for (uint64_t i26 = 0; i26 != v333; ++i26)
        {
          if (*(void *)v1234 != v334) {
            objc_enumerationMutation(v331);
          }
          v336 = [*(id *)(*((void *)&v1233 + 1) + 8 * i26) dictionaryRepresentation];
          [v330 addObject:v336];
        }
        uint64_t v333 = [v331 countByEnumeratingWithState:&v1233 objects:v1437 count:16];
      }
      while (v333);
    }

    [v3 setObject:v330 forKeyedSubscript:@"_payloadEventParticipant"];
  }
  if ([*(id *)(v2 + 1896) count])
  {
    v337 = [MEMORY[0x1E4F1CA48] array];
    long long v1229 = 0u;
    long long v1230 = 0u;
    long long v1231 = 0u;
    long long v1232 = 0u;
    id v338 = *(id *)(v2 + 1896);
    uint64_t v339 = [v338 countByEnumeratingWithState:&v1229 objects:v1436 count:16];
    if (v339)
    {
      uint64_t v340 = v339;
      uint64_t v341 = *(void *)v1230;
      do
      {
        for (uint64_t i27 = 0; i27 != v340; ++i27)
        {
          if (*(void *)v1230 != v341) {
            objc_enumerationMutation(v338);
          }
          v343 = [*(id *)(*((void *)&v1229 + 1) + 8 * i27) dictionaryRepresentation];
          [v337 addObject:v343];
        }
        uint64_t v340 = [v338 countByEnumeratingWithState:&v1229 objects:v1436 count:16];
      }
      while (v340);
    }

    [v3 setObject:v337 forKeyedSubscript:@"_payloadFile"];
  }
  if (*(void *)(v2 + 520))
  {
    v344 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadFileEntityTypesCount"));
    if ([(id)v2 payloadFileEntityTypesCount])
    {
      unint64_t v345 = 0;
      do
      {
        uint64_t v346 = *(unsigned int *)(*(void *)(v2 + 512) + 4 * v345);
        if (v346 >= 4)
        {
          v347 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 512) + 4 * v345));
        }
        else
        {
          v347 = *(&off_1E551CC00 + v346);
        }
        [v344 addObject:v347];

        ++v345;
      }
      while (v345 < [(id)v2 payloadFileEntityTypesCount]);
    }
    [v3 setObject:v344 forKeyedSubscript:@"_payloadFileEntityType"];
  }
  if ([*(id *)(v2 + 1904) count])
  {
    v348 = [MEMORY[0x1E4F1CA48] array];
    long long v1225 = 0u;
    long long v1226 = 0u;
    long long v1227 = 0u;
    long long v1228 = 0u;
    id v349 = *(id *)(v2 + 1904);
    uint64_t v350 = [v349 countByEnumeratingWithState:&v1225 objects:v1435 count:16];
    if (v350)
    {
      uint64_t v351 = v350;
      uint64_t v352 = *(void *)v1226;
      do
      {
        for (uint64_t i28 = 0; i28 != v351; ++i28)
        {
          if (*(void *)v1226 != v352) {
            objc_enumerationMutation(v349);
          }
          v354 = [*(id *)(*((void *)&v1225 + 1) + 8 * i28) dictionaryRepresentation];
          [v348 addObject:v354];
        }
        uint64_t v351 = [v349 countByEnumeratingWithState:&v1225 objects:v1435 count:16];
      }
      while (v351);
    }

    [v3 setObject:v348 forKeyedSubscript:@"_payloadFileProperty"];
  }
  if (*(void *)(v2 + 544))
  {
    v355 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadFilePropertyNamesCount"));
    if ([(id)v2 payloadFilePropertyNamesCount])
    {
      unint64_t v356 = 0;
      do
      {
        uint64_t v357 = *(unsigned int *)(*(void *)(v2 + 536) + 4 * v356);
        if (v357 >= 0xC)
        {
          v358 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 536) + 4 * v356));
        }
        else
        {
          v358 = *(&off_1E551CC20 + v357);
        }
        [v355 addObject:v358];

        ++v356;
      }
      while (v356 < [(id)v2 payloadFilePropertyNamesCount]);
    }
    [v3 setObject:v355 forKeyedSubscript:@"_payloadFilePropertyName"];
  }
  if (*(void *)(v2 + 568))
  {
    v359 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadFilePropertyQualifiersCount"));
    if ([(id)v2 payloadFilePropertyQualifiersCount])
    {
      unint64_t v360 = 0;
      do
      {
        uint64_t v361 = *(unsigned int *)(*(void *)(v2 + 560) + 4 * v360);
        if (v361 >= 5)
        {
          v362 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 560) + 4 * v360));
        }
        else
        {
          v362 = *(&off_1E551CC80 + v361);
        }
        [v359 addObject:v362];

        ++v360;
      }
      while (v360 < [(id)v2 payloadFilePropertyQualifiersCount]);
    }
    [v3 setObject:v359 forKeyedSubscript:@"_payloadFilePropertyQualifier"];
  }
  if ([*(id *)(v2 + 1912) count])
  {
    v363 = [MEMORY[0x1E4F1CA48] array];
    long long v1221 = 0u;
    long long v1222 = 0u;
    long long v1223 = 0u;
    long long v1224 = 0u;
    id v364 = *(id *)(v2 + 1912);
    uint64_t v365 = [v364 countByEnumeratingWithState:&v1221 objects:v1434 count:16];
    if (v365)
    {
      uint64_t v366 = v365;
      uint64_t v367 = *(void *)v1222;
      do
      {
        for (uint64_t i29 = 0; i29 != v366; ++i29)
        {
          if (*(void *)v1222 != v367) {
            objc_enumerationMutation(v364);
          }
          v369 = [*(id *)(*((void *)&v1221 + 1) + 8 * i29) dictionaryRepresentation];
          [v363 addObject:v369];
        }
        uint64_t v366 = [v364 countByEnumeratingWithState:&v1221 objects:v1434 count:16];
      }
      while (v366);
    }

    [v3 setObject:v363 forKeyedSubscript:@"_payloadFilePropertyValue"];
  }
  if (*(void *)(v2 + 592))
  {
    v370 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadFileSearchScopesCount"));
    if ([(id)v2 payloadFileSearchScopesCount])
    {
      unint64_t v371 = 0;
      do
      {
        uint64_t v372 = *(unsigned int *)(*(void *)(v2 + 584) + 4 * v371);
        if (v372 >= 3)
        {
          v373 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 584) + 4 * v371));
        }
        else
        {
          v373 = *(&off_1E551CCA8 + v372);
        }
        [v370 addObject:v373];

        ++v371;
      }
      while (v371 < [(id)v2 payloadFileSearchScopesCount]);
    }
    [v3 setObject:v370 forKeyedSubscript:@"_payloadFileSearchScope"];
  }
  if (*(void *)(v2 + 616))
  {
    v374 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadFileShareModesCount"));
    if ([(id)v2 payloadFileShareModesCount])
    {
      unint64_t v375 = 0;
      do
      {
        uint64_t v376 = *(unsigned int *)(*(void *)(v2 + 608) + 4 * v375);
        if (v376 >= 3)
        {
          v377 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 608) + 4 * v375));
        }
        else
        {
          v377 = *(&off_1E551CCC0 + v376);
        }
        [v374 addObject:v377];

        ++v375;
      }
      while (v375 < [(id)v2 payloadFileShareModesCount]);
    }
    [v3 setObject:v374 forKeyedSubscript:@"_payloadFileShareMode"];
  }
  if (*(void *)(v2 + 640))
  {
    v378 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadFileTypesCount"));
    if ([(id)v2 payloadFileTypesCount])
    {
      unint64_t v379 = 0;
      do
      {
        uint64_t v380 = *(unsigned int *)(*(void *)(v2 + 632) + 4 * v379);
        if (v380 >= 0xB)
        {
          v381 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 632) + 4 * v379));
        }
        else
        {
          v381 = *(&off_1E551CCD8 + v380);
        }
        [v378 addObject:v381];

        ++v379;
      }
      while (v379 < [(id)v2 payloadFileTypesCount]);
    }
    [v3 setObject:v378 forKeyedSubscript:@"_payloadFileType"];
  }
  if ([*(id *)(v2 + 1920) count])
  {
    v382 = [MEMORY[0x1E4F1CA48] array];
    long long v1217 = 0u;
    long long v1218 = 0u;
    long long v1219 = 0u;
    long long v1220 = 0u;
    id v383 = *(id *)(v2 + 1920);
    uint64_t v384 = [v383 countByEnumeratingWithState:&v1217 objects:v1433 count:16];
    if (v384)
    {
      uint64_t v385 = v384;
      uint64_t v386 = *(void *)v1218;
      do
      {
        for (uint64_t i30 = 0; i30 != v385; ++i30)
        {
          if (*(void *)v1218 != v386) {
            objc_enumerationMutation(v383);
          }
          v388 = [*(id *)(*((void *)&v1217 + 1) + 8 * i30) dictionaryRepresentation];
          [v382 addObject:v388];
        }
        uint64_t v385 = [v383 countByEnumeratingWithState:&v1217 objects:v1433 count:16];
      }
      while (v385);
    }

    [v3 setObject:v382 forKeyedSubscript:@"_payloadFinancialAccountValue"];
  }
  if ([*(id *)(v2 + 1928) count])
  {
    v389 = [MEMORY[0x1E4F1CA48] array];
    long long v1213 = 0u;
    long long v1214 = 0u;
    long long v1215 = 0u;
    long long v1216 = 0u;
    id v390 = *(id *)(v2 + 1928);
    uint64_t v391 = [v390 countByEnumeratingWithState:&v1213 objects:v1432 count:16];
    if (v391)
    {
      uint64_t v392 = v391;
      uint64_t v393 = *(void *)v1214;
      do
      {
        for (uint64_t i31 = 0; i31 != v392; ++i31)
        {
          if (*(void *)v1214 != v393) {
            objc_enumerationMutation(v390);
          }
          v395 = [*(id *)(*((void *)&v1213 + 1) + 8 * i31) dictionaryRepresentation];
          [v389 addObject:v395];
        }
        uint64_t v392 = [v390 countByEnumeratingWithState:&v1213 objects:v1432 count:16];
      }
      while (v392);
    }

    [v3 setObject:v389 forKeyedSubscript:@"_payloadGeographicalFeature"];
  }
  if ([*(id *)(v2 + 1936) count])
  {
    v396 = [MEMORY[0x1E4F1CA48] array];
    long long v1209 = 0u;
    long long v1210 = 0u;
    long long v1211 = 0u;
    long long v1212 = 0u;
    id v397 = *(id *)(v2 + 1936);
    uint64_t v398 = [v397 countByEnumeratingWithState:&v1209 objects:v1431 count:16];
    if (v398)
    {
      uint64_t v399 = v398;
      uint64_t v400 = *(void *)v1210;
      do
      {
        for (uint64_t i32 = 0; i32 != v399; ++i32)
        {
          if (*(void *)v1210 != v400) {
            objc_enumerationMutation(v397);
          }
          v402 = [*(id *)(*((void *)&v1209 + 1) + 8 * i32) dictionaryRepresentation];
          [v396 addObject:v402];
        }
        uint64_t v399 = [v397 countByEnumeratingWithState:&v1209 objects:v1431 count:16];
      }
      while (v399);
    }

    [v3 setObject:v396 forKeyedSubscript:@"_payloadGeographicalFeatureList"];
  }
  if ([*(id *)(v2 + 1944) count])
  {
    v403 = [MEMORY[0x1E4F1CA48] array];
    long long v1205 = 0u;
    long long v1206 = 0u;
    long long v1207 = 0u;
    long long v1208 = 0u;
    id v404 = *(id *)(v2 + 1944);
    uint64_t v405 = [v404 countByEnumeratingWithState:&v1205 objects:v1430 count:16];
    if (v405)
    {
      uint64_t v406 = v405;
      uint64_t v407 = *(void *)v1206;
      do
      {
        for (uint64_t i33 = 0; i33 != v406; ++i33)
        {
          if (*(void *)v1206 != v407) {
            objc_enumerationMutation(v404);
          }
          v409 = [*(id *)(*((void *)&v1205 + 1) + 8 * i33) dictionaryRepresentation];
          [v403 addObject:v409];
        }
        uint64_t v406 = [v404 countByEnumeratingWithState:&v1205 objects:v1430 count:16];
      }
      while (v406);
    }

    [v3 setObject:v403 forKeyedSubscript:@"_payloadGetSettingResponseData"];
  }
  if ([*(id *)(v2 + 1952) count])
  {
    v410 = [MEMORY[0x1E4F1CA48] array];
    long long v1201 = 0u;
    long long v1202 = 0u;
    long long v1203 = 0u;
    long long v1204 = 0u;
    id v411 = *(id *)(v2 + 1952);
    uint64_t v412 = [v411 countByEnumeratingWithState:&v1201 objects:v1429 count:16];
    if (v412)
    {
      uint64_t v413 = v412;
      uint64_t v414 = *(void *)v1202;
      do
      {
        for (uint64_t i34 = 0; i34 != v413; ++i34)
        {
          if (*(void *)v1202 != v414) {
            objc_enumerationMutation(v411);
          }
          v416 = [*(id *)(*((void *)&v1201 + 1) + 8 * i34) dictionaryRepresentation];
          [v410 addObject:v416];
        }
        uint64_t v413 = [v411 countByEnumeratingWithState:&v1201 objects:v1429 count:16];
      }
      while (v413);
    }

    [v3 setObject:v410 forKeyedSubscript:@"_payloadHomeAttribute"];
  }
  if (*(void *)(v2 + 664))
  {
    v417 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadHomeAttributeTypesCount"));
    if ([(id)v2 payloadHomeAttributeTypesCount])
    {
      unint64_t v418 = 0;
      do
      {
        uint64_t v419 = *(unsigned int *)(*(void *)(v2 + 656) + 4 * v418);
        if (v419 >= 0x42)
        {
          v420 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 656) + 4 * v418));
        }
        else
        {
          v420 = *(&off_1E551CD30 + v419);
        }
        [v417 addObject:v420];

        ++v418;
      }
      while (v418 < [(id)v2 payloadHomeAttributeTypesCount]);
    }
    [v3 setObject:v417 forKeyedSubscript:@"_payloadHomeAttributeType"];
  }
  if ([*(id *)(v2 + 1960) count])
  {
    v421 = [MEMORY[0x1E4F1CA48] array];
    long long v1197 = 0u;
    long long v1198 = 0u;
    long long v1199 = 0u;
    long long v1200 = 0u;
    id v422 = *(id *)(v2 + 1960);
    uint64_t v423 = [v422 countByEnumeratingWithState:&v1197 objects:v1428 count:16];
    if (v423)
    {
      uint64_t v424 = v423;
      uint64_t v425 = *(void *)v1198;
      do
      {
        for (uint64_t i35 = 0; i35 != v424; ++i35)
        {
          if (*(void *)v1198 != v425) {
            objc_enumerationMutation(v422);
          }
          v427 = [*(id *)(*((void *)&v1197 + 1) + 8 * i35) dictionaryRepresentation];
          [v421 addObject:v427];
        }
        uint64_t v424 = [v422 countByEnumeratingWithState:&v1197 objects:v1428 count:16];
      }
      while (v424);
    }

    [v3 setObject:v421 forKeyedSubscript:@"_payloadHomeAttributeValue"];
  }
  if (*(void *)(v2 + 688))
  {
    v428 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadHomeAttributeValueTypesCount"));
    if ([(id)v2 payloadHomeAttributeValueTypesCount])
    {
      unint64_t v429 = 0;
      do
      {
        uint64_t v430 = *(unsigned int *)(*(void *)(v2 + 680) + 4 * v429);
        if (v430 >= 6)
        {
          v431 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 680) + 4 * v429));
        }
        else
        {
          v431 = *(&off_1E551CF40 + v430);
        }
        [v428 addObject:v431];

        ++v429;
      }
      while (v429 < [(id)v2 payloadHomeAttributeValueTypesCount]);
    }
    [v3 setObject:v428 forKeyedSubscript:@"_payloadHomeAttributeValueType"];
  }
  if (*(void *)(v2 + 712))
  {
    v432 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadHomeDeviceTypesCount"));
    if ([(id)v2 payloadHomeDeviceTypesCount])
    {
      unint64_t v433 = 0;
      do
      {
        uint64_t v434 = *(unsigned int *)(*(void *)(v2 + 704) + 4 * v433);
        if v434 < 0x32 && ((0x3FFFFF79FFEEFuLL >> v434))
        {
          v435 = *(&off_1E551CF70 + v434);
        }
        else
        {
          v435 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 704) + 4 * v433));
        }
        [v432 addObject:v435];

        ++v433;
      }
      while (v433 < [(id)v2 payloadHomeDeviceTypesCount]);
    }
    [v3 setObject:v432 forKeyedSubscript:@"_payloadHomeDeviceType"];
  }
  if ([*(id *)(v2 + 1968) count])
  {
    v436 = [MEMORY[0x1E4F1CA48] array];
    long long v1193 = 0u;
    long long v1194 = 0u;
    long long v1195 = 0u;
    long long v1196 = 0u;
    id v437 = *(id *)(v2 + 1968);
    uint64_t v438 = [v437 countByEnumeratingWithState:&v1193 objects:v1427 count:16];
    if (v438)
    {
      uint64_t v439 = v438;
      uint64_t v440 = *(void *)v1194;
      do
      {
        for (uint64_t i36 = 0; i36 != v439; ++i36)
        {
          if (*(void *)v1194 != v440) {
            objc_enumerationMutation(v437);
          }
          v442 = [*(id *)(*((void *)&v1193 + 1) + 8 * i36) dictionaryRepresentation];
          [v436 addObject:v442];
        }
        uint64_t v439 = [v437 countByEnumeratingWithState:&v1193 objects:v1427 count:16];
      }
      while (v439);
    }

    [v3 setObject:v436 forKeyedSubscript:@"_payloadHomeEntity"];
  }
  if (*(void *)(v2 + 736))
  {
    v443 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadHomeEntityTypesCount"));
    if ([(id)v2 payloadHomeEntityTypesCount])
    {
      unint64_t v444 = 0;
      do
      {
        uint64_t v445 = *(unsigned int *)(*(void *)(v2 + 728) + 4 * v444);
        if (v445 >= 7)
        {
          v446 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 728) + 4 * v444));
        }
        else
        {
          v446 = *(&off_1E551D100 + v445);
        }
        [v443 addObject:v446];

        ++v444;
      }
      while (v444 < [(id)v2 payloadHomeEntityTypesCount]);
    }
    [v3 setObject:v443 forKeyedSubscript:@"_payloadHomeEntityType"];
  }
  if ([*(id *)(v2 + 1976) count])
  {
    v447 = [MEMORY[0x1E4F1CA48] array];
    long long v1189 = 0u;
    long long v1190 = 0u;
    long long v1191 = 0u;
    long long v1192 = 0u;
    id v448 = *(id *)(v2 + 1976);
    uint64_t v449 = [v448 countByEnumeratingWithState:&v1189 objects:v1426 count:16];
    if (v449)
    {
      uint64_t v450 = v449;
      uint64_t v451 = *(void *)v1190;
      do
      {
        for (uint64_t i37 = 0; i37 != v450; ++i37)
        {
          if (*(void *)v1190 != v451) {
            objc_enumerationMutation(v448);
          }
          v453 = [*(id *)(*((void *)&v1189 + 1) + 8 * i37) dictionaryRepresentation];
          [v447 addObject:v453];
        }
        uint64_t v450 = [v448 countByEnumeratingWithState:&v1189 objects:v1426 count:16];
      }
      while (v450);
    }

    [v3 setObject:v447 forKeyedSubscript:@"_payloadHomeFilter"];
  }
  if ([*(id *)(v2 + 1984) count])
  {
    v454 = [MEMORY[0x1E4F1CA48] array];
    long long v1185 = 0u;
    long long v1186 = 0u;
    long long v1187 = 0u;
    long long v1188 = 0u;
    id v455 = *(id *)(v2 + 1984);
    uint64_t v456 = [v455 countByEnumeratingWithState:&v1185 objects:v1425 count:16];
    if (v456)
    {
      uint64_t v457 = v456;
      uint64_t v458 = *(void *)v1186;
      do
      {
        for (uint64_t i38 = 0; i38 != v457; ++i38)
        {
          if (*(void *)v1186 != v458) {
            objc_enumerationMutation(v455);
          }
          v460 = [*(id *)(*((void *)&v1185 + 1) + 8 * i38) dictionaryRepresentation];
          [v454 addObject:v460];
        }
        uint64_t v457 = [v455 countByEnumeratingWithState:&v1185 objects:v1425 count:16];
      }
      while (v457);
    }

    [v3 setObject:v454 forKeyedSubscript:@"_payloadHomeUserTask"];
  }
  if ([*(id *)(v2 + 1992) count])
  {
    v461 = [MEMORY[0x1E4F1CA48] array];
    long long v1181 = 0u;
    long long v1182 = 0u;
    long long v1183 = 0u;
    long long v1184 = 0u;
    id v462 = *(id *)(v2 + 1992);
    uint64_t v463 = [v462 countByEnumeratingWithState:&v1181 objects:v1424 count:16];
    if (v463)
    {
      uint64_t v464 = v463;
      uint64_t v465 = *(void *)v1182;
      do
      {
        for (uint64_t i39 = 0; i39 != v464; ++i39)
        {
          if (*(void *)v1182 != v465) {
            objc_enumerationMutation(v462);
          }
          v467 = [*(id *)(*((void *)&v1181 + 1) + 8 * i39) dictionaryRepresentation];
          [v461 addObject:v467];
        }
        uint64_t v464 = [v462 countByEnumeratingWithState:&v1181 objects:v1424 count:16];
      }
      while (v464);
    }

    [v3 setObject:v461 forKeyedSubscript:@"_payloadIntegerList"];
  }
  if ([*(id *)(v2 + 2000) count])
  {
    v468 = [MEMORY[0x1E4F1CA48] array];
    long long v1177 = 0u;
    long long v1178 = 0u;
    long long v1179 = 0u;
    long long v1180 = 0u;
    id v469 = *(id *)(v2 + 2000);
    uint64_t v470 = [v469 countByEnumeratingWithState:&v1177 objects:v1423 count:16];
    if (v470)
    {
      uint64_t v471 = v470;
      uint64_t v472 = *(void *)v1178;
      do
      {
        for (uint64_t i40 = 0; i40 != v471; ++i40)
        {
          if (*(void *)v1178 != v472) {
            objc_enumerationMutation(v469);
          }
          v474 = [*(id *)(*((void *)&v1177 + 1) + 8 * i40) dictionaryRepresentation];
          [v468 addObject:v474];
        }
        uint64_t v471 = [v469 countByEnumeratingWithState:&v1177 objects:v1423 count:16];
      }
      while (v471);
    }

    [v3 setObject:v468 forKeyedSubscript:@"_payloadIntegerValue"];
  }
  if ([*(id *)(v2 + 2008) count])
  {
    v475 = [MEMORY[0x1E4F1CA48] array];
    long long v1173 = 0u;
    long long v1174 = 0u;
    long long v1175 = 0u;
    long long v1176 = 0u;
    id v476 = *(id *)(v2 + 2008);
    uint64_t v477 = [v476 countByEnumeratingWithState:&v1173 objects:v1422 count:16];
    if (v477)
    {
      uint64_t v478 = v477;
      uint64_t v479 = *(void *)v1174;
      do
      {
        for (uint64_t i41 = 0; i41 != v478; ++i41)
        {
          if (*(void *)v1174 != v479) {
            objc_enumerationMutation(v476);
          }
          v481 = [*(id *)(*((void *)&v1173 + 1) + 8 * i41) dictionaryRepresentation];
          [v475 addObject:v481];
        }
        uint64_t v478 = [v476 countByEnumeratingWithState:&v1173 objects:v1422 count:16];
      }
      while (v478);
    }

    [v3 setObject:v475 forKeyedSubscript:@"_payloadIntent"];
  }
  if ([*(id *)(v2 + 2016) count])
  {
    v482 = [MEMORY[0x1E4F1CA48] array];
    long long v1169 = 0u;
    long long v1170 = 0u;
    long long v1171 = 0u;
    long long v1172 = 0u;
    id v483 = *(id *)(v2 + 2016);
    uint64_t v484 = [v483 countByEnumeratingWithState:&v1169 objects:v1421 count:16];
    if (v484)
    {
      uint64_t v485 = v484;
      uint64_t v486 = *(void *)v1170;
      do
      {
        for (uint64_t i42 = 0; i42 != v485; ++i42)
        {
          if (*(void *)v1170 != v486) {
            objc_enumerationMutation(v483);
          }
          v488 = [*(id *)(*((void *)&v1169 + 1) + 8 * i42) dictionaryRepresentation];
          [v482 addObject:v488];
        }
        uint64_t v485 = [v483 countByEnumeratingWithState:&v1169 objects:v1421 count:16];
      }
      while (v485);
    }

    [v3 setObject:v482 forKeyedSubscript:@"_payloadIntentExecutionResult"];
  }
  if ([*(id *)(v2 + 2024) count])
  {
    v489 = [MEMORY[0x1E4F1CA48] array];
    long long v1165 = 0u;
    long long v1166 = 0u;
    long long v1167 = 0u;
    long long v1168 = 0u;
    id v490 = *(id *)(v2 + 2024);
    uint64_t v491 = [v490 countByEnumeratingWithState:&v1165 objects:v1420 count:16];
    if (v491)
    {
      uint64_t v492 = v491;
      uint64_t v493 = *(void *)v1166;
      do
      {
        for (uint64_t i43 = 0; i43 != v492; ++i43)
        {
          if (*(void *)v1166 != v493) {
            objc_enumerationMutation(v490);
          }
          v495 = [*(id *)(*((void *)&v1165 + 1) + 8 * i43) dictionaryRepresentation];
          [v489 addObject:v495];
        }
        uint64_t v492 = [v490 countByEnumeratingWithState:&v1165 objects:v1420 count:16];
      }
      while (v492);
    }

    [v3 setObject:v489 forKeyedSubscript:@"_payloadLocation"];
  }
  if ([*(id *)(v2 + 2032) count])
  {
    v496 = [MEMORY[0x1E4F1CA48] array];
    long long v1161 = 0u;
    long long v1162 = 0u;
    long long v1163 = 0u;
    long long v1164 = 0u;
    id v497 = *(id *)(v2 + 2032);
    uint64_t v498 = [v497 countByEnumeratingWithState:&v1161 objects:v1419 count:16];
    if (v498)
    {
      uint64_t v499 = v498;
      uint64_t v500 = *(void *)v1162;
      do
      {
        for (uint64_t i44 = 0; i44 != v499; ++i44)
        {
          if (*(void *)v1162 != v500) {
            objc_enumerationMutation(v497);
          }
          v502 = [*(id *)(*((void *)&v1161 + 1) + 8 * i44) dictionaryRepresentation];
          [v496 addObject:v502];
        }
        uint64_t v499 = [v497 countByEnumeratingWithState:&v1161 objects:v1419 count:16];
      }
      while (v499);
    }

    [v3 setObject:v496 forKeyedSubscript:@"_payloadLocationList"];
  }
  if (*(void *)(v2 + 760))
  {
    v503 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadLocationSearchTypesCount"));
    if ([(id)v2 payloadLocationSearchTypesCount])
    {
      unint64_t v504 = 0;
      do
      {
        int v505 = *(_DWORD *)(*(void *)(v2 + 752) + 4 * v504);
        if (v505)
        {
          if (v505 == 10)
          {
            v506 = @"BY_LOCATION_TRIGGER";
          }
          else
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 752) + 4 * v504));
            v506 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v506 = @"UNKNOWN_LOCATION_SEARCH_TYPE";
        }
        [v503 addObject:v506];

        ++v504;
      }
      while (v504 < [(id)v2 payloadLocationSearchTypesCount]);
    }
    [v3 setObject:v503 forKeyedSubscript:@"_payloadLocationSearchType"];
  }
  if ([*(id *)(v2 + 2040) count])
  {
    v507 = [MEMORY[0x1E4F1CA48] array];
    long long v1157 = 0u;
    long long v1158 = 0u;
    long long v1159 = 0u;
    long long v1160 = 0u;
    id v508 = *(id *)(v2 + 2040);
    uint64_t v509 = [v508 countByEnumeratingWithState:&v1157 objects:v1418 count:16];
    if (v509)
    {
      uint64_t v510 = v509;
      uint64_t v511 = *(void *)v1158;
      do
      {
        for (uint64_t i45 = 0; i45 != v510; ++i45)
        {
          if (*(void *)v1158 != v511) {
            objc_enumerationMutation(v508);
          }
          v513 = [*(id *)(*((void *)&v1157 + 1) + 8 * i45) dictionaryRepresentation];
          [v507 addObject:v513];
        }
        uint64_t v510 = [v508 countByEnumeratingWithState:&v1157 objects:v1418 count:16];
      }
      while (v510);
    }

    [v3 setObject:v507 forKeyedSubscript:@"_payloadLongList"];
  }
  if ([*(id *)(v2 + 2048) count])
  {
    v514 = [MEMORY[0x1E4F1CA48] array];
    long long v1153 = 0u;
    long long v1154 = 0u;
    long long v1155 = 0u;
    long long v1156 = 0u;
    id v515 = *(id *)(v2 + 2048);
    uint64_t v516 = [v515 countByEnumeratingWithState:&v1153 objects:v1417 count:16];
    if (v516)
    {
      uint64_t v517 = v516;
      uint64_t v518 = *(void *)v1154;
      do
      {
        for (uint64_t i46 = 0; i46 != v517; ++i46)
        {
          if (*(void *)v1154 != v518) {
            objc_enumerationMutation(v515);
          }
          v520 = [*(id *)(*((void *)&v1153 + 1) + 8 * i46) dictionaryRepresentation];
          [v514 addObject:v520];
        }
        uint64_t v517 = [v515 countByEnumeratingWithState:&v1153 objects:v1417 count:16];
      }
      while (v517);
    }

    [v3 setObject:v514 forKeyedSubscript:@"_payloadLongValue"];
  }
  if ([*(id *)(v2 + 2056) count])
  {
    v521 = [MEMORY[0x1E4F1CA48] array];
    long long v1149 = 0u;
    long long v1150 = 0u;
    long long v1151 = 0u;
    long long v1152 = 0u;
    id v522 = *(id *)(v2 + 2056);
    uint64_t v523 = [v522 countByEnumeratingWithState:&v1149 objects:v1416 count:16];
    if (v523)
    {
      uint64_t v524 = v523;
      uint64_t v525 = *(void *)v1150;
      do
      {
        for (uint64_t i47 = 0; i47 != v524; ++i47)
        {
          if (*(void *)v1150 != v525) {
            objc_enumerationMutation(v522);
          }
          v527 = [*(id *)(*((void *)&v1149 + 1) + 8 * i47) dictionaryRepresentation];
          [v521 addObject:v527];
        }
        uint64_t v524 = [v522 countByEnumeratingWithState:&v1149 objects:v1416 count:16];
      }
      while (v524);
    }

    [v3 setObject:v521 forKeyedSubscript:@"_payloadMassValue"];
  }
  if (*(void *)(v2 + 784))
  {
    v528 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadMediaAffinityTypesCount"));
    if ([(id)v2 payloadMediaAffinityTypesCount])
    {
      unint64_t v529 = 0;
      do
      {
        uint64_t v530 = *(unsigned int *)(*(void *)(v2 + 776) + 4 * v529);
        if (v530 >= 3)
        {
          v531 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 776) + 4 * v529));
        }
        else
        {
          v531 = *(&off_1E551D138 + v530);
        }
        [v528 addObject:v531];

        ++v529;
      }
      while (v529 < [(id)v2 payloadMediaAffinityTypesCount]);
    }
    [v3 setObject:v528 forKeyedSubscript:@"_payloadMediaAffinityType"];
  }
  if ([*(id *)(v2 + 2064) count])
  {
    v532 = [MEMORY[0x1E4F1CA48] array];
    long long v1145 = 0u;
    long long v1146 = 0u;
    long long v1147 = 0u;
    long long v1148 = 0u;
    id v533 = *(id *)(v2 + 2064);
    uint64_t v534 = [v533 countByEnumeratingWithState:&v1145 objects:v1415 count:16];
    if (v534)
    {
      uint64_t v535 = v534;
      uint64_t v536 = *(void *)v1146;
      do
      {
        for (uint64_t i48 = 0; i48 != v535; ++i48)
        {
          if (*(void *)v1146 != v536) {
            objc_enumerationMutation(v533);
          }
          v538 = [*(id *)(*((void *)&v1145 + 1) + 8 * i48) dictionaryRepresentation];
          [v532 addObject:v538];
        }
        uint64_t v535 = [v533 countByEnumeratingWithState:&v1145 objects:v1415 count:16];
      }
      while (v535);
    }

    [v3 setObject:v532 forKeyedSubscript:@"_payloadMediaDestination"];
  }
  if ([*(id *)(v2 + 2072) count])
  {
    v539 = [MEMORY[0x1E4F1CA48] array];
    long long v1141 = 0u;
    long long v1142 = 0u;
    long long v1143 = 0u;
    long long v1144 = 0u;
    id v540 = *(id *)(v2 + 2072);
    uint64_t v541 = [v540 countByEnumeratingWithState:&v1141 objects:v1414 count:16];
    if (v541)
    {
      uint64_t v542 = v541;
      uint64_t v543 = *(void *)v1142;
      do
      {
        for (uint64_t i49 = 0; i49 != v542; ++i49)
        {
          if (*(void *)v1142 != v543) {
            objc_enumerationMutation(v540);
          }
          v545 = [*(id *)(*((void *)&v1141 + 1) + 8 * i49) dictionaryRepresentation];
          [v539 addObject:v545];
        }
        uint64_t v542 = [v540 countByEnumeratingWithState:&v1141 objects:v1414 count:16];
      }
      while (v542);
    }

    [v3 setObject:v539 forKeyedSubscript:@"_payloadMediaItemGroup"];
  }
  if ([*(id *)(v2 + 2080) count])
  {
    v546 = [MEMORY[0x1E4F1CA48] array];
    long long v1137 = 0u;
    long long v1138 = 0u;
    long long v1139 = 0u;
    long long v1140 = 0u;
    id v547 = *(id *)(v2 + 2080);
    uint64_t v548 = [v547 countByEnumeratingWithState:&v1137 objects:v1413 count:16];
    if (v548)
    {
      uint64_t v549 = v548;
      uint64_t v550 = *(void *)v1138;
      do
      {
        for (uint64_t i50 = 0; i50 != v549; ++i50)
        {
          if (*(void *)v1138 != v550) {
            objc_enumerationMutation(v547);
          }
          v552 = [*(id *)(*((void *)&v1137 + 1) + 8 * i50) dictionaryRepresentation];
          [v546 addObject:v552];
        }
        uint64_t v549 = [v547 countByEnumeratingWithState:&v1137 objects:v1413 count:16];
      }
      while (v549);
    }

    [v3 setObject:v546 forKeyedSubscript:@"_payloadMediaItemValue"];
  }
  if ([*(id *)(v2 + 2088) count])
  {
    v553 = [MEMORY[0x1E4F1CA48] array];
    long long v1133 = 0u;
    long long v1134 = 0u;
    long long v1135 = 0u;
    long long v1136 = 0u;
    id v554 = *(id *)(v2 + 2088);
    uint64_t v555 = [v554 countByEnumeratingWithState:&v1133 objects:v1412 count:16];
    if (v555)
    {
      uint64_t v556 = v555;
      uint64_t v557 = *(void *)v1134;
      do
      {
        for (uint64_t i51 = 0; i51 != v556; ++i51)
        {
          if (*(void *)v1134 != v557) {
            objc_enumerationMutation(v554);
          }
          v559 = [*(id *)(*((void *)&v1133 + 1) + 8 * i51) dictionaryRepresentation];
          [v553 addObject:v559];
        }
        uint64_t v556 = [v554 countByEnumeratingWithState:&v1133 objects:v1412 count:16];
      }
      while (v556);
    }

    [v3 setObject:v553 forKeyedSubscript:@"_payloadMediaSearch"];
  }
  if (*(void *)(v2 + 808))
  {
    v560 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadMessageAttributesCount"));
    if ([(id)v2 payloadMessageAttributesCount])
    {
      unint64_t v561 = 0;
      do
      {
        unsigned int v562 = *(_DWORD *)(*(void *)(v2 + 800) + 4 * v561) - 1;
        if (v562 >= 5)
        {
          v563 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 800) + 4 * v561));
        }
        else
        {
          v563 = *(&off_1E551D150 + v562);
        }
        [v560 addObject:v563];

        ++v561;
      }
      while (v561 < [(id)v2 payloadMessageAttributesCount]);
    }
    [v3 setObject:v560 forKeyedSubscript:@"_payloadMessageAttribute"];
  }
  if (*(void *)(v2 + 832))
  {
    v564 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadMessageEffectsCount"));
    if ([(id)v2 payloadMessageEffectsCount])
    {
      unint64_t v565 = 0;
      do
      {
        unsigned int v566 = *(_DWORD *)(*(void *)(v2 + 824) + 4 * v565) - 1;
        if (v566 >= 0xD)
        {
          v567 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 824) + 4 * v565));
        }
        else
        {
          v567 = *(&off_1E551D178 + v566);
        }
        [v564 addObject:v567];

        ++v565;
      }
      while (v565 < [(id)v2 payloadMessageEffectsCount]);
    }
    [v3 setObject:v564 forKeyedSubscript:@"_payloadMessageEffect"];
  }
  if (*(void *)(v2 + 856))
  {
    v568 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadMessageTypesCount"));
    if ([(id)v2 payloadMessageTypesCount])
    {
      unint64_t v569 = 0;
      do
      {
        unsigned int v570 = *(_DWORD *)(*(void *)(v2 + 848) + 4 * v569) - 1;
        if (v570 >= 0x22)
        {
          v571 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 848) + 4 * v569));
        }
        else
        {
          v571 = *(&off_1E551D1E0 + v570);
        }
        [v568 addObject:v571];

        ++v569;
      }
      while (v569 < [(id)v2 payloadMessageTypesCount]);
    }
    [v3 setObject:v568 forKeyedSubscript:@"_payloadMessageType"];
  }
  if ([*(id *)(v2 + 2096) count])
  {
    v572 = [MEMORY[0x1E4F1CA48] array];
    long long v1129 = 0u;
    long long v1130 = 0u;
    long long v1131 = 0u;
    long long v1132 = 0u;
    id v573 = *(id *)(v2 + 2096);
    uint64_t v574 = [v573 countByEnumeratingWithState:&v1129 objects:v1411 count:16];
    if (v574)
    {
      uint64_t v575 = v574;
      uint64_t v576 = *(void *)v1130;
      do
      {
        for (uint64_t i52 = 0; i52 != v575; ++i52)
        {
          if (*(void *)v1130 != v576) {
            objc_enumerationMutation(v573);
          }
          v578 = [*(id *)(*((void *)&v1129 + 1) + 8 * i52) dictionaryRepresentation];
          [v572 addObject:v578];
        }
        uint64_t v575 = [v573 countByEnumeratingWithState:&v1129 objects:v1411 count:16];
      }
      while (v575);
    }

    [v3 setObject:v572 forKeyedSubscript:@"_payloadModifyNickname"];
  }
  if ([*(id *)(v2 + 2104) count])
  {
    v579 = [MEMORY[0x1E4F1CA48] array];
    long long v1125 = 0u;
    long long v1126 = 0u;
    long long v1127 = 0u;
    long long v1128 = 0u;
    id v580 = *(id *)(v2 + 2104);
    uint64_t v581 = [v580 countByEnumeratingWithState:&v1125 objects:v1410 count:16];
    if (v581)
    {
      uint64_t v582 = v581;
      uint64_t v583 = *(void *)v1126;
      do
      {
        for (uint64_t i53 = 0; i53 != v582; ++i53)
        {
          if (*(void *)v1126 != v583) {
            objc_enumerationMutation(v580);
          }
          v585 = [*(id *)(*((void *)&v1125 + 1) + 8 * i53) dictionaryRepresentation];
          [v579 addObject:v585];
        }
        uint64_t v582 = [v580 countByEnumeratingWithState:&v1125 objects:v1410 count:16];
      }
      while (v582);
    }

    [v3 setObject:v579 forKeyedSubscript:@"_payloadModifyRelationship"];
  }
  if ([*(id *)(v2 + 2112) count])
  {
    v586 = [MEMORY[0x1E4F1CA48] array];
    long long v1121 = 0u;
    long long v1122 = 0u;
    long long v1123 = 0u;
    long long v1124 = 0u;
    id v587 = *(id *)(v2 + 2112);
    uint64_t v588 = [v587 countByEnumeratingWithState:&v1121 objects:v1409 count:16];
    if (v588)
    {
      uint64_t v589 = v588;
      uint64_t v590 = *(void *)v1122;
      do
      {
        for (uint64_t i54 = 0; i54 != v589; ++i54)
        {
          if (*(void *)v1122 != v590) {
            objc_enumerationMutation(v587);
          }
          v592 = [*(id *)(*((void *)&v1121 + 1) + 8 * i54) dictionaryRepresentation];
          [v586 addObject:v592];
        }
        uint64_t v589 = [v587 countByEnumeratingWithState:&v1121 objects:v1409 count:16];
      }
      while (v589);
    }

    [v3 setObject:v586 forKeyedSubscript:@"_payloadNote"];
  }
  if ([*(id *)(v2 + 2120) count])
  {
    v593 = [MEMORY[0x1E4F1CA48] array];
    long long v1117 = 0u;
    long long v1118 = 0u;
    long long v1119 = 0u;
    long long v1120 = 0u;
    id v594 = *(id *)(v2 + 2120);
    uint64_t v595 = [v594 countByEnumeratingWithState:&v1117 objects:v1408 count:16];
    if (v595)
    {
      uint64_t v596 = v595;
      uint64_t v597 = *(void *)v1118;
      do
      {
        for (uint64_t i55 = 0; i55 != v596; ++i55)
        {
          if (*(void *)v1118 != v597) {
            objc_enumerationMutation(v594);
          }
          v599 = [*(id *)(*((void *)&v1117 + 1) + 8 * i55) dictionaryRepresentation];
          [v593 addObject:v599];
        }
        uint64_t v596 = [v594 countByEnumeratingWithState:&v1117 objects:v1408 count:16];
      }
      while (v596);
    }

    [v3 setObject:v593 forKeyedSubscript:@"_payloadNoteContent"];
  }
  if (*(void *)(v2 + 880))
  {
    v600 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadNotebookItemTypesCount"));
    if ([(id)v2 payloadNotebookItemTypesCount])
    {
      for (unint64_t i56 = 0; i56 < [(id)v2 payloadNotebookItemTypesCount]; ++i56)
      {
        int v602 = *(_DWORD *)(*(void *)(v2 + 872) + 4 * i56);
        if (v602 > 19)
        {
          if (v602 == 20)
          {
            v603 = @"TASK_LIST";
            goto LABEL_900;
          }
          if (v602 != 30) {
            goto LABEL_897;
          }
          v603 = @"TASK";
        }
        else
        {
          if (!v602)
          {
            v603 = @"UNKNOWN_NOTE_TYPE";
            goto LABEL_900;
          }
          if (v602 != 10)
          {
LABEL_897:
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 872) + 4 * i56));
            v603 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_900;
          }
          v603 = @"NOTE";
        }
LABEL_900:
        [v600 addObject:v603];
      }
    }
    [v3 setObject:v600 forKeyedSubscript:@"_payloadNotebookItemType"];
  }
  if (*(void *)(v2 + 904))
  {
    v604 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadNumericSettingUnitsCount"));
    if ([(id)v2 payloadNumericSettingUnitsCount])
    {
      unint64_t v605 = 0;
      do
      {
        v606 = @"PERCENTAGE";
        if (*(_DWORD *)(*(void *)(v2 + 896) + 4 * v605) != 1)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 896) + 4 * v605));
          v606 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v604 addObject:v606];

        ++v605;
      }
      while (v605 < [(id)v2 payloadNumericSettingUnitsCount]);
    }
    [v3 setObject:v604 forKeyedSubscript:@"_payloadNumericSettingUnit"];
  }
  if ([*(id *)(v2 + 2128) count])
  {
    v607 = [MEMORY[0x1E4F1CA48] array];
    long long v1113 = 0u;
    long long v1114 = 0u;
    long long v1115 = 0u;
    long long v1116 = 0u;
    id v608 = *(id *)(v2 + 2128);
    uint64_t v609 = [v608 countByEnumeratingWithState:&v1113 objects:v1407 count:16];
    if (v609)
    {
      uint64_t v610 = v609;
      uint64_t v611 = *(void *)v1114;
      do
      {
        for (uint64_t i57 = 0; i57 != v610; ++i57)
        {
          if (*(void *)v1114 != v611) {
            objc_enumerationMutation(v608);
          }
          v613 = [*(id *)(*((void *)&v1113 + 1) + 8 * i57) dictionaryRepresentation];
          [v607 addObject:v613];
        }
        uint64_t v610 = [v608 countByEnumeratingWithState:&v1113 objects:v1407 count:16];
      }
      while (v610);
    }

    [v3 setObject:v607 forKeyedSubscript:@"_payloadNumericSettingValue"];
  }
  if (*(void *)(v2 + 928))
  {
    v614 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadOutgoingMessageTypesCount"));
    if ([(id)v2 payloadOutgoingMessageTypesCount])
    {
      unint64_t v615 = 0;
      do
      {
        int v616 = *(_DWORD *)(*(void *)(v2 + 920) + 4 * v615);
        if (v616 == 1)
        {
          v617 = @"OUTGOING_MESSAGE_TEXT";
        }
        else if (v616 == 2)
        {
          v617 = @"OUTGOING_MESSAGE_AUDIO";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 920) + 4 * v615));
          v617 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v614 addObject:v617];

        ++v615;
      }
      while (v615 < [(id)v2 payloadOutgoingMessageTypesCount]);
    }
    [v3 setObject:v614 forKeyedSubscript:@"_payloadOutgoingMessageType"];
  }
  if (*(void *)(v2 + 952))
  {
    v618 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadParsecCategoriesCount"));
    if ([(id)v2 payloadParsecCategoriesCount])
    {
      unint64_t v619 = 0;
      do
      {
        uint64_t v620 = *(unsigned int *)(*(void *)(v2 + 944) + 4 * v619);
        if (v620 >= 9)
        {
          v621 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 944) + 4 * v619));
        }
        else
        {
          v621 = *(&off_1E551D2F0 + v620);
        }
        [v618 addObject:v621];

        ++v619;
      }
      while (v619 < [(id)v2 payloadParsecCategoriesCount]);
    }
    [v3 setObject:v618 forKeyedSubscript:@"_payloadParsecCategory"];
  }
  if ([*(id *)(v2 + 2136) count])
  {
    v622 = [MEMORY[0x1E4F1CA48] array];
    long long v1109 = 0u;
    long long v1110 = 0u;
    long long v1111 = 0u;
    long long v1112 = 0u;
    id v623 = *(id *)(v2 + 2136);
    uint64_t v624 = [v623 countByEnumeratingWithState:&v1109 objects:v1406 count:16];
    if (v624)
    {
      uint64_t v625 = v624;
      uint64_t v626 = *(void *)v1110;
      do
      {
        for (uint64_t i58 = 0; i58 != v625; ++i58)
        {
          if (*(void *)v1110 != v626) {
            objc_enumerationMutation(v623);
          }
          v628 = [*(id *)(*((void *)&v1109 + 1) + 8 * i58) dictionaryRepresentation];
          [v622 addObject:v628];
        }
        uint64_t v625 = [v623 countByEnumeratingWithState:&v1109 objects:v1406 count:16];
      }
      while (v625);
    }

    [v3 setObject:v622 forKeyedSubscript:@"_payloadPaymentAmountValue"];
  }
  if ([*(id *)(v2 + 2144) count])
  {
    v629 = [MEMORY[0x1E4F1CA48] array];
    long long v1105 = 0u;
    long long v1106 = 0u;
    long long v1107 = 0u;
    long long v1108 = 0u;
    id v630 = *(id *)(v2 + 2144);
    uint64_t v631 = [v630 countByEnumeratingWithState:&v1105 objects:v1405 count:16];
    if (v631)
    {
      uint64_t v632 = v631;
      uint64_t v633 = *(void *)v1106;
      do
      {
        for (uint64_t i59 = 0; i59 != v632; ++i59)
        {
          if (*(void *)v1106 != v633) {
            objc_enumerationMutation(v630);
          }
          v635 = [*(id *)(*((void *)&v1105 + 1) + 8 * i59) dictionaryRepresentation];
          [v629 addObject:v635];
        }
        uint64_t v632 = [v630 countByEnumeratingWithState:&v1105 objects:v1405 count:16];
      }
      while (v632);
    }

    [v3 setObject:v629 forKeyedSubscript:@"_payloadPaymentMethodList"];
  }
  if ([*(id *)(v2 + 2152) count])
  {
    v636 = [MEMORY[0x1E4F1CA48] array];
    long long v1101 = 0u;
    long long v1102 = 0u;
    long long v1103 = 0u;
    long long v1104 = 0u;
    id v637 = *(id *)(v2 + 2152);
    uint64_t v638 = [v637 countByEnumeratingWithState:&v1101 objects:v1404 count:16];
    if (v638)
    {
      uint64_t v639 = v638;
      uint64_t v640 = *(void *)v1102;
      do
      {
        for (uint64_t i60 = 0; i60 != v639; ++i60)
        {
          if (*(void *)v1102 != v640) {
            objc_enumerationMutation(v637);
          }
          v642 = [*(id *)(*((void *)&v1101 + 1) + 8 * i60) dictionaryRepresentation];
          [v636 addObject:v642];
        }
        uint64_t v639 = [v637 countByEnumeratingWithState:&v1101 objects:v1404 count:16];
      }
      while (v639);
    }

    [v3 setObject:v636 forKeyedSubscript:@"_payloadPaymentMethodValue"];
  }
  if (*(void *)(v2 + 976))
  {
    v643 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadPaymentStatusCount"));
    if ([(id)v2 payloadPaymentStatusCount])
    {
      unint64_t v644 = 0;
      do
      {
        unsigned int v645 = *(_DWORD *)(*(void *)(v2 + 968) + 4 * v644) - 1;
        if (v645 >= 5)
        {
          v646 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 968) + 4 * v644));
        }
        else
        {
          v646 = *(&off_1E551D338 + v645);
        }
        [v643 addObject:v646];

        ++v644;
      }
      while (v644 < [(id)v2 payloadPaymentStatusCount]);
    }
    [v3 setObject:v643 forKeyedSubscript:@"_payloadPaymentStatus"];
  }
  if (*(void *)(v2 + 1000))
  {
    v647 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadPersonalPlaceTypesCount"));
    if ([(id)v2 payloadPersonalPlaceTypesCount])
    {
      unint64_t v648 = 0;
      do
      {
        int v649 = *(_DWORD *)(*(void *)(v2 + 992) + 4 * v648);
        if (v649 == 2)
        {
          v650 = @"HOME";
        }
        else if (v649 == 3)
        {
          v650 = @"WORK";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 992) + 4 * v648));
          v650 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v647 addObject:v650];

        ++v648;
      }
      while (v648 < [(id)v2 payloadPersonalPlaceTypesCount]);
    }
    [v3 setObject:v647 forKeyedSubscript:@"_payloadPersonalPlaceType"];
  }
  if (*(void *)(v2 + 1024))
  {
    v651 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadPhotoAttributesCount"));
    if ([(id)v2 payloadPhotoAttributesCount])
    {
      unint64_t v652 = 0;
      do
      {
        int v653 = *(_DWORD *)(*(void *)(v2 + 1016) + 4 * v652);
        if (v653 <= 49)
        {
          v654 = @"PHOTO";
          switch(v653)
          {
            case 2:
              break;
            case 3:
              v654 = @"VIDEO";
              break;
            case 4:
              v654 = @"GIF";
              break;
            case 10:
              v654 = @"FLASH";
              break;
            case 11:
              v654 = @"LANDSCAPE_ORIENTATION";
              break;
            case 12:
              v654 = @"PORTRAIT_ORIENTATION";
              break;
            case 13:
              v654 = @"FAVORITE";
              break;
            case 14:
              v654 = @"SELFIE";
              break;
            case 15:
              v654 = @"FRONT_FACING_CAMERA";
              break;
            case 16:
              v654 = @"SCREENSHOT";
              break;
            default:
LABEL_1019:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1016) + 4 * v652));
              v654 = (__CFString *)objc_claimAutoreleasedReturnValue();
              break;
          }
        }
        else if (v653 > 80)
        {
          switch(v653)
          {
            case 300:
              v654 = @"NOIR_FILTER";
              break;
            case 301:
              v654 = @"CHROME_FILTER";
              break;
            case 302:
              v654 = @"INSTANT_FILTER";
              break;
            case 303:
              v654 = @"TONAL_FILTER";
              break;
            case 304:
              v654 = @"TRANSFER_FILTER";
              break;
            case 305:
              v654 = @"MONO_FILTER";
              break;
            case 306:
              v654 = @"FADE_FILTER";
              break;
            case 307:
              v654 = @"PROCESS_FILTER";
              break;
            default:
              if (v653 != 81) {
                goto LABEL_1019;
              }
              v654 = @"SLOW_MOTION_VIDEO";
              break;
          }
        }
        else
        {
          switch(v653)
          {
            case '2':
              v654 = @"BURST_PHOTO";
              break;
            case '3':
              v654 = @"HDR_PHOTO";
              break;
            case '4':
              v654 = @"SQUARE_PHOTO";
              break;
            case '5':
              v654 = @"PANORAMA_PHOTO";
              break;
            case '6':
              v654 = @"PORTRAIT_PHOTO";
              break;
            case '7':
              v654 = @"LIVE_PHOTO";
              break;
            case '8':
              v654 = @"LOOP_PHOTO";
              break;
            case '9':
              v654 = @"BOUNCE_PHOTO";
              break;
            case ':':
              v654 = @"LONG_EXPOSURE_PHOTO";
              break;
            default:
              if (v653 != 80) {
                goto LABEL_1019;
              }
              v654 = @"TIME_LAPSE_VIDEO";
              break;
          }
        }
        [v651 addObject:v654];

        ++v652;
      }
      while (v652 < [(id)v2 payloadPhotoAttributesCount]);
    }
    [v3 setObject:v651 forKeyedSubscript:@"_payloadPhotoAttribute"];
  }
  if ([*(id *)(v2 + 2160) count])
  {
    v655 = [MEMORY[0x1E4F1CA48] array];
    long long v1097 = 0u;
    long long v1098 = 0u;
    long long v1099 = 0u;
    long long v1100 = 0u;
    id v656 = *(id *)(v2 + 2160);
    uint64_t v657 = [v656 countByEnumeratingWithState:&v1097 objects:v1403 count:16];
    if (v657)
    {
      uint64_t v658 = v657;
      uint64_t v659 = *(void *)v1098;
      do
      {
        for (uint64_t i61 = 0; i61 != v658; ++i61)
        {
          if (*(void *)v1098 != v659) {
            objc_enumerationMutation(v656);
          }
          v661 = [*(id *)(*((void *)&v1097 + 1) + 8 * i61) dictionaryRepresentation];
          [v655 addObject:v661];
        }
        uint64_t v658 = [v656 countByEnumeratingWithState:&v1097 objects:v1403 count:16];
      }
      while (v658);
    }

    [v3 setObject:v655 forKeyedSubscript:@"_payloadPlace"];
  }
  if ([*(id *)(v2 + 2168) count])
  {
    v662 = [MEMORY[0x1E4F1CA48] array];
    long long v1093 = 0u;
    long long v1094 = 0u;
    long long v1095 = 0u;
    long long v1096 = 0u;
    id v663 = *(id *)(v2 + 2168);
    uint64_t v664 = [v663 countByEnumeratingWithState:&v1093 objects:v1402 count:16];
    if (v664)
    {
      uint64_t v665 = v664;
      uint64_t v666 = *(void *)v1094;
      do
      {
        for (uint64_t i62 = 0; i62 != v665; ++i62)
        {
          if (*(void *)v1094 != v666) {
            objc_enumerationMutation(v663);
          }
          v668 = [*(id *)(*((void *)&v1093 + 1) + 8 * i62) dictionaryRepresentation];
          [v662 addObject:v668];
        }
        uint64_t v665 = [v663 countByEnumeratingWithState:&v1093 objects:v1402 count:16];
      }
      while (v665);
    }

    [v3 setObject:v662 forKeyedSubscript:@"_payloadPlaceList"];
  }
  if (*(void *)(v2 + 1048))
  {
    v669 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadPlaybackQueueLocationsCount"));
    if ([(id)v2 payloadPlaybackQueueLocationsCount])
    {
      unint64_t v670 = 0;
      do
      {
        uint64_t v671 = *(unsigned int *)(*(void *)(v2 + 1040) + 4 * v670);
        if (v671 >= 4)
        {
          v672 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1040) + 4 * v670));
        }
        else
        {
          v672 = *(&off_1E551D360 + v671);
        }
        [v669 addObject:v672];

        ++v670;
      }
      while (v670 < [(id)v2 payloadPlaybackQueueLocationsCount]);
    }
    [v3 setObject:v669 forKeyedSubscript:@"_payloadPlaybackQueueLocation"];
  }
  if (*(void *)(v2 + 1072))
  {
    v673 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadPlaybackRepeatModesCount"));
    if ([(id)v2 payloadPlaybackRepeatModesCount])
    {
      unint64_t v674 = 0;
      do
      {
        uint64_t v675 = *(unsigned int *)(*(void *)(v2 + 1064) + 4 * v674);
        if (v675 >= 3)
        {
          v676 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1064) + 4 * v674));
        }
        else
        {
          v676 = *(&off_1E551D380 + v675);
        }
        [v673 addObject:v676];

        ++v674;
      }
      while (v674 < [(id)v2 payloadPlaybackRepeatModesCount]);
    }
    [v3 setObject:v673 forKeyedSubscript:@"_payloadPlaybackRepeatMode"];
  }
  if (*(void *)(v2 + 1096))
  {
    v677 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadPreferredCallProvidersCount"));
    if ([(id)v2 payloadPreferredCallProvidersCount])
    {
      unint64_t v678 = 0;
      do
      {
        unsigned int v679 = *(_DWORD *)(*(void *)(v2 + 1088) + 4 * v678) - 2;
        if (v679 >= 3)
        {
          v680 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1088) + 4 * v678));
        }
        else
        {
          v680 = *(&off_1E551D398 + v679);
        }
        [v677 addObject:v680];

        ++v678;
      }
      while (v678 < [(id)v2 payloadPreferredCallProvidersCount]);
    }
    [v3 setObject:v677 forKeyedSubscript:@"_payloadPreferredCallProvider"];
  }
  if ([*(id *)(v2 + 2176) count])
  {
    v681 = [(id)v2 payloadPrimitiveBools];
    v682 = (void *)[v681 copy];
    [v3 setObject:v682 forKeyedSubscript:@"_payloadPrimitiveBool"];
  }
  if ([*(id *)(v2 + 2184) count])
  {
    v683 = [(id)v2 payloadPrimitiveDoubles];
    v684 = (void *)[v683 copy];
    [v3 setObject:v684 forKeyedSubscript:@"_payloadPrimitiveDouble"];
  }
  if ([*(id *)(v2 + 2192) count])
  {
    v685 = [(id)v2 payloadPrimitiveInts];
    v686 = (void *)[v685 copy];
    [v3 setObject:v686 forKeyedSubscript:@"_payloadPrimitiveInt"];
  }
  if ([*(id *)(v2 + 2200) count])
  {
    v687 = [(id)v2 payloadPrimitiveLongs];
    v688 = (void *)[v687 copy];
    [v3 setObject:v688 forKeyedSubscript:@"_payloadPrimitiveLong"];
  }
  if (*(void *)(v2 + 2208))
  {
    v689 = [(id)v2 payloadPrimitiveStrings];
    v690 = (void *)[v689 copy];
    [v3 setObject:v690 forKeyedSubscript:@"_payloadPrimitiveString"];
  }
  if ([*(id *)(v2 + 2216) count])
  {
    v691 = [MEMORY[0x1E4F1CA48] array];
    long long v1089 = 0u;
    long long v1090 = 0u;
    long long v1091 = 0u;
    long long v1092 = 0u;
    id v692 = *(id *)(v2 + 2216);
    uint64_t v693 = [v692 countByEnumeratingWithState:&v1089 objects:v1401 count:16];
    if (v693)
    {
      uint64_t v694 = v693;
      uint64_t v695 = *(void *)v1090;
      do
      {
        for (uint64_t i63 = 0; i63 != v694; ++i63)
        {
          if (*(void *)v1090 != v695) {
            objc_enumerationMutation(v692);
          }
          v697 = [*(id *)(*((void *)&v1089 + 1) + 8 * i63) dictionaryRepresentation];
          [v691 addObject:v697];
        }
        uint64_t v694 = [v692 countByEnumeratingWithState:&v1089 objects:v1401 count:16];
      }
      while (v694);
    }

    [v3 setObject:v691 forKeyedSubscript:@"_payloadPrivateAddMediaIntentData"];
  }
  if ([*(id *)(v2 + 2224) count])
  {
    v698 = [MEMORY[0x1E4F1CA48] array];
    long long v1085 = 0u;
    long long v1086 = 0u;
    long long v1087 = 0u;
    long long v1088 = 0u;
    id v699 = *(id *)(v2 + 2224);
    uint64_t v700 = [v699 countByEnumeratingWithState:&v1085 objects:v1400 count:16];
    if (v700)
    {
      uint64_t v701 = v700;
      uint64_t v702 = *(void *)v1086;
      do
      {
        for (uint64_t i64 = 0; i64 != v701; ++i64)
        {
          if (*(void *)v1086 != v702) {
            objc_enumerationMutation(v699);
          }
          v704 = [*(id *)(*((void *)&v1085 + 1) + 8 * i64) dictionaryRepresentation];
          [v698 addObject:v704];
        }
        uint64_t v701 = [v699 countByEnumeratingWithState:&v1085 objects:v1400 count:16];
      }
      while (v701);
    }

    [v3 setObject:v698 forKeyedSubscript:@"_payloadPrivatePlayMediaIntentData"];
  }
  if ([*(id *)(v2 + 2232) count])
  {
    v705 = [MEMORY[0x1E4F1CA48] array];
    long long v1081 = 0u;
    long long v1082 = 0u;
    long long v1083 = 0u;
    long long v1084 = 0u;
    id v706 = *(id *)(v2 + 2232);
    uint64_t v707 = [v706 countByEnumeratingWithState:&v1081 objects:v1399 count:16];
    if (v707)
    {
      uint64_t v708 = v707;
      uint64_t v709 = *(void *)v1082;
      do
      {
        for (uint64_t i65 = 0; i65 != v708; ++i65)
        {
          if (*(void *)v1082 != v709) {
            objc_enumerationMutation(v706);
          }
          v711 = [*(id *)(*((void *)&v1081 + 1) + 8 * i65) dictionaryRepresentation];
          [v705 addObject:v711];
        }
        uint64_t v708 = [v706 countByEnumeratingWithState:&v1081 objects:v1399 count:16];
      }
      while (v708);
    }

    [v3 setObject:v705 forKeyedSubscript:@"_payloadPrivateSearchForMediaIntentData"];
  }
  if ([*(id *)(v2 + 2240) count])
  {
    v712 = [MEMORY[0x1E4F1CA48] array];
    long long v1077 = 0u;
    long long v1078 = 0u;
    long long v1079 = 0u;
    long long v1080 = 0u;
    id v713 = *(id *)(v2 + 2240);
    uint64_t v714 = [v713 countByEnumeratingWithState:&v1077 objects:v1398 count:16];
    if (v714)
    {
      uint64_t v715 = v714;
      uint64_t v716 = *(void *)v1078;
      do
      {
        for (uint64_t i66 = 0; i66 != v715; ++i66)
        {
          if (*(void *)v1078 != v716) {
            objc_enumerationMutation(v713);
          }
          v718 = [*(id *)(*((void *)&v1077 + 1) + 8 * i66) dictionaryRepresentation];
          [v712 addObject:v718];
        }
        uint64_t v715 = [v713 countByEnumeratingWithState:&v1077 objects:v1398 count:16];
      }
      while (v715);
    }

    [v3 setObject:v712 forKeyedSubscript:@"_payloadPrivateUpdateMediaAffinityIntentData"];
  }
  if (*(void *)(v2 + 1120))
  {
    v719 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadRadioTypesCount"));
    if ([(id)v2 payloadRadioTypesCount])
    {
      unint64_t v720 = 0;
      do
      {
        unsigned int v721 = *(_DWORD *)(*(void *)(v2 + 1112) + 4 * v720) - 1;
        if (v721 >= 5)
        {
          v722 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1112) + 4 * v720));
        }
        else
        {
          v722 = *(&off_1E551D3B0 + v721);
        }
        [v719 addObject:v722];

        ++v720;
      }
      while (v720 < [(id)v2 payloadRadioTypesCount]);
    }
    [v3 setObject:v719 forKeyedSubscript:@"_payloadRadioType"];
  }
  if (*(void *)(v2 + 1144))
  {
    v723 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadReadActionTypesCount"));
    if ([(id)v2 payloadReadActionTypesCount])
    {
      unint64_t v724 = 0;
      do
      {
        int v725 = *(_DWORD *)(*(void *)(v2 + 1136) + 4 * v724);
        if (v725 == 1)
        {
          v726 = @"READ";
        }
        else if (v725 == 2)
        {
          v726 = @"REPEAT";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1136) + 4 * v724));
          v726 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v723 addObject:v726];

        ++v724;
      }
      while (v724 < [(id)v2 payloadReadActionTypesCount]);
    }
    [v3 setObject:v723 forKeyedSubscript:@"_payloadReadActionType"];
  }
  if (*(void *)(v2 + 1168))
  {
    v727 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadRelativeReferencesCount"));
    if ([(id)v2 payloadRelativeReferencesCount])
    {
      unint64_t v728 = 0;
      do
      {
        int v729 = *(_DWORD *)(*(void *)(v2 + 1160) + 4 * v728);
        if (v729 == 1)
        {
          v730 = @"NEXT";
        }
        else if (v729 == 2)
        {
          v730 = @"PREVIOUS";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1160) + 4 * v728));
          v730 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v727 addObject:v730];

        ++v728;
      }
      while (v728 < [(id)v2 payloadRelativeReferencesCount]);
    }
    [v3 setObject:v727 forKeyedSubscript:@"_payloadRelativeReference"];
  }
  if (*(void *)(v2 + 1192))
  {
    v731 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadRelativeSettingsCount"));
    if ([(id)v2 payloadRelativeSettingsCount])
    {
      unint64_t v732 = 0;
      do
      {
        unsigned int v733 = *(_DWORD *)(*(void *)(v2 + 1184) + 4 * v732) - 1;
        if (v733 >= 4)
        {
          v734 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1184) + 4 * v732));
        }
        else
        {
          v734 = *(&off_1E551D3D8 + v733);
        }
        [v731 addObject:v734];

        ++v732;
      }
      while (v732 < [(id)v2 payloadRelativeSettingsCount]);
    }
    [v3 setObject:v731 forKeyedSubscript:@"_payloadRelativeSetting"];
  }
  if ([*(id *)(v2 + 2248) count])
  {
    v735 = [MEMORY[0x1E4F1CA48] array];
    long long v1073 = 0u;
    long long v1074 = 0u;
    long long v1075 = 0u;
    long long v1076 = 0u;
    id v736 = *(id *)(v2 + 2248);
    uint64_t v737 = [v736 countByEnumeratingWithState:&v1073 objects:v1397 count:16];
    if (v737)
    {
      uint64_t v738 = v737;
      uint64_t v739 = *(void *)v1074;
      do
      {
        for (uint64_t i67 = 0; i67 != v738; ++i67)
        {
          if (*(void *)v1074 != v739) {
            objc_enumerationMutation(v736);
          }
          v741 = [*(id *)(*((void *)&v1073 + 1) + 8 * i67) dictionaryRepresentation];
          [v735 addObject:v741];
        }
        uint64_t v738 = [v736 countByEnumeratingWithState:&v1073 objects:v1397 count:16];
      }
      while (v738);
    }

    [v3 setObject:v735 forKeyedSubscript:@"_payloadSendMessageAttachment"];
  }
  if (*(void *)(v2 + 1216))
  {
    v742 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadSettingActionsCount"));
    if ([(id)v2 payloadSettingActionsCount])
    {
      unint64_t v743 = 0;
      do
      {
        unsigned int v744 = *(_DWORD *)(*(void *)(v2 + 1208) + 4 * v743) - 1;
        if (v744 >= 3)
        {
          v745 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1208) + 4 * v743));
        }
        else
        {
          v745 = *(&off_1E551D3F8 + v744);
        }
        [v742 addObject:v745];

        ++v743;
      }
      while (v743 < [(id)v2 payloadSettingActionsCount]);
    }
    [v3 setObject:v742 forKeyedSubscript:@"_payloadSettingAction"];
  }
  if ([*(id *)(v2 + 2256) count])
  {
    v746 = [MEMORY[0x1E4F1CA48] array];
    long long v1069 = 0u;
    long long v1070 = 0u;
    long long v1071 = 0u;
    long long v1072 = 0u;
    id v747 = *(id *)(v2 + 2256);
    uint64_t v748 = [v747 countByEnumeratingWithState:&v1069 objects:v1396 count:16];
    if (v748)
    {
      uint64_t v749 = v748;
      uint64_t v750 = *(void *)v1070;
      do
      {
        for (uint64_t i68 = 0; i68 != v749; ++i68)
        {
          if (*(void *)v1070 != v750) {
            objc_enumerationMutation(v747);
          }
          v752 = [*(id *)(*((void *)&v1069 + 1) + 8 * i68) dictionaryRepresentation];
          [v746 addObject:v752];
        }
        uint64_t v749 = [v747 countByEnumeratingWithState:&v1069 objects:v1396 count:16];
      }
      while (v749);
    }

    [v3 setObject:v746 forKeyedSubscript:@"_payloadSettingMetadata"];
  }
  if ([*(id *)(v2 + 2264) count])
  {
    v753 = [MEMORY[0x1E4F1CA48] array];
    long long v1065 = 0u;
    long long v1066 = 0u;
    long long v1067 = 0u;
    long long v1068 = 0u;
    id v754 = *(id *)(v2 + 2264);
    uint64_t v755 = [v754 countByEnumeratingWithState:&v1065 objects:v1395 count:16];
    if (v755)
    {
      uint64_t v756 = v755;
      uint64_t v757 = *(void *)v1066;
      do
      {
        for (uint64_t i69 = 0; i69 != v756; ++i69)
        {
          if (*(void *)v1066 != v757) {
            objc_enumerationMutation(v754);
          }
          v759 = [*(id *)(*((void *)&v1065 + 1) + 8 * i69) dictionaryRepresentation];
          [v753 addObject:v759];
        }
        uint64_t v756 = [v754 countByEnumeratingWithState:&v1065 objects:v1395 count:16];
      }
      while (v756);
    }

    [v3 setObject:v753 forKeyedSubscript:@"_payloadShareDestination"];
  }
  if ([*(id *)(v2 + 2272) count])
  {
    v760 = [MEMORY[0x1E4F1CA48] array];
    long long v1061 = 0u;
    long long v1062 = 0u;
    long long v1063 = 0u;
    long long v1064 = 0u;
    id v761 = *(id *)(v2 + 2272);
    uint64_t v762 = [v761 countByEnumeratingWithState:&v1061 objects:v1394 count:16];
    if (v762)
    {
      uint64_t v763 = v762;
      uint64_t v764 = *(void *)v1062;
      do
      {
        for (uint64_t i70 = 0; i70 != v763; ++i70)
        {
          if (*(void *)v1062 != v764) {
            objc_enumerationMutation(v761);
          }
          v766 = [*(id *)(*((void *)&v1061 + 1) + 8 * i70) dictionaryRepresentation];
          [v760 addObject:v766];
        }
        uint64_t v763 = [v761 countByEnumeratingWithState:&v1061 objects:v1394 count:16];
      }
      while (v763);
    }

    [v3 setObject:v760 forKeyedSubscript:@"_payloadSleepAlarmAttribute"];
  }
  if ([*(id *)(v2 + 2280) count])
  {
    v767 = [MEMORY[0x1E4F1CA48] array];
    long long v1057 = 0u;
    long long v1058 = 0u;
    long long v1059 = 0u;
    long long v1060 = 0u;
    id v768 = *(id *)(v2 + 2280);
    uint64_t v769 = [v768 countByEnumeratingWithState:&v1057 objects:v1393 count:16];
    if (v769)
    {
      uint64_t v770 = v769;
      uint64_t v771 = *(void *)v1058;
      do
      {
        for (uint64_t i71 = 0; i71 != v770; ++i71)
        {
          if (*(void *)v1058 != v771) {
            objc_enumerationMutation(v768);
          }
          v773 = [*(id *)(*((void *)&v1057 + 1) + 8 * i71) dictionaryRepresentation];
          [v767 addObject:v773];
        }
        uint64_t v770 = [v768 countByEnumeratingWithState:&v1057 objects:v1393 count:16];
      }
      while (v770);
    }

    [v3 setObject:v767 forKeyedSubscript:@"_payloadSpatialEventTrigger"];
  }
  if ([*(id *)(v2 + 2288) count])
  {
    v774 = [MEMORY[0x1E4F1CA48] array];
    long long v1053 = 0u;
    long long v1054 = 0u;
    long long v1055 = 0u;
    long long v1056 = 0u;
    id v775 = *(id *)(v2 + 2288);
    uint64_t v776 = [v775 countByEnumeratingWithState:&v1053 objects:v1392 count:16];
    if (v776)
    {
      uint64_t v777 = v776;
      uint64_t v778 = *(void *)v1054;
      do
      {
        for (uint64_t i72 = 0; i72 != v777; ++i72)
        {
          if (*(void *)v1054 != v778) {
            objc_enumerationMutation(v775);
          }
          v780 = [*(id *)(*((void *)&v1053 + 1) + 8 * i72) dictionaryRepresentation];
          [v774 addObject:v780];
        }
        uint64_t v777 = [v775 countByEnumeratingWithState:&v1053 objects:v1392 count:16];
      }
      while (v777);
    }

    [v3 setObject:v774 forKeyedSubscript:@"_payloadSpeedValue"];
  }
  if ([*(id *)(v2 + 2296) count])
  {
    v781 = [MEMORY[0x1E4F1CA48] array];
    long long v1049 = 0u;
    long long v1050 = 0u;
    long long v1051 = 0u;
    long long v1052 = 0u;
    id v782 = *(id *)(v2 + 2296);
    uint64_t v783 = [v782 countByEnumeratingWithState:&v1049 objects:v1391 count:16];
    if (v783)
    {
      uint64_t v784 = v783;
      uint64_t v785 = *(void *)v1050;
      do
      {
        for (uint64_t i73 = 0; i73 != v784; ++i73)
        {
          if (*(void *)v1050 != v785) {
            objc_enumerationMutation(v782);
          }
          v787 = [*(id *)(*((void *)&v1049 + 1) + 8 * i73) dictionaryRepresentation];
          [v781 addObject:v787];
        }
        uint64_t v784 = [v782 countByEnumeratingWithState:&v1049 objects:v1391 count:16];
      }
      while (v784);
    }

    [v3 setObject:v781 forKeyedSubscript:@"_payloadStartCallRequestMetadata"];
  }
  if ([*(id *)(v2 + 2304) count])
  {
    v788 = [MEMORY[0x1E4F1CA48] array];
    long long v1045 = 0u;
    long long v1046 = 0u;
    long long v1047 = 0u;
    long long v1048 = 0u;
    id v789 = *(id *)(v2 + 2304);
    uint64_t v790 = [v789 countByEnumeratingWithState:&v1045 objects:v1390 count:16];
    if (v790)
    {
      uint64_t v791 = v790;
      uint64_t v792 = *(void *)v1046;
      do
      {
        for (uint64_t i74 = 0; i74 != v791; ++i74)
        {
          if (*(void *)v1046 != v792) {
            objc_enumerationMutation(v789);
          }
          v794 = [*(id *)(*((void *)&v1045 + 1) + 8 * i74) dictionaryRepresentation];
          [v788 addObject:v794];
        }
        uint64_t v791 = [v789 countByEnumeratingWithState:&v1045 objects:v1390 count:16];
      }
      while (v791);
    }

    [v3 setObject:v788 forKeyedSubscript:@"_payloadStringList"];
  }
  if ([*(id *)(v2 + 2312) count])
  {
    v795 = [MEMORY[0x1E4F1CA48] array];
    long long v1041 = 0u;
    long long v1042 = 0u;
    long long v1043 = 0u;
    long long v1044 = 0u;
    id v796 = *(id *)(v2 + 2312);
    uint64_t v797 = [v796 countByEnumeratingWithState:&v1041 objects:v1389 count:16];
    if (v797)
    {
      uint64_t v798 = v797;
      uint64_t v799 = *(void *)v1042;
      do
      {
        for (uint64_t i75 = 0; i75 != v798; ++i75)
        {
          if (*(void *)v1042 != v799) {
            objc_enumerationMutation(v796);
          }
          v801 = [*(id *)(*((void *)&v1041 + 1) + 8 * i75) dictionaryRepresentation];
          [v795 addObject:v801];
        }
        uint64_t v798 = [v796 countByEnumeratingWithState:&v1041 objects:v1389 count:16];
      }
      while (v798);
    }

    [v3 setObject:v795 forKeyedSubscript:@"_payloadStringValue"];
  }
  if ([*(id *)(v2 + 2320) count])
  {
    v802 = [MEMORY[0x1E4F1CA48] array];
    long long v1037 = 0u;
    long long v1038 = 0u;
    long long v1039 = 0u;
    long long v1040 = 0u;
    id v803 = *(id *)(v2 + 2320);
    uint64_t v804 = [v803 countByEnumeratingWithState:&v1037 objects:v1388 count:16];
    if (v804)
    {
      uint64_t v805 = v804;
      uint64_t v806 = *(void *)v1038;
      do
      {
        for (uint64_t i76 = 0; i76 != v805; ++i76)
        {
          if (*(void *)v1038 != v806) {
            objc_enumerationMutation(v803);
          }
          v808 = [*(id *)(*((void *)&v1037 + 1) + 8 * i76) dictionaryRepresentation];
          [v802 addObject:v808];
        }
        uint64_t v805 = [v803 countByEnumeratingWithState:&v1037 objects:v1388 count:16];
      }
      while (v805);
    }

    [v3 setObject:v802 forKeyedSubscript:@"_payloadSupportedTrafficIncidentType"];
  }
  if ([*(id *)(v2 + 2328) count])
  {
    v809 = [MEMORY[0x1E4F1CA48] array];
    long long v1033 = 0u;
    long long v1034 = 0u;
    long long v1035 = 0u;
    long long v1036 = 0u;
    id v810 = *(id *)(v2 + 2328);
    uint64_t v811 = [v810 countByEnumeratingWithState:&v1033 objects:v1387 count:16];
    if (v811)
    {
      uint64_t v812 = v811;
      uint64_t v813 = *(void *)v1034;
      do
      {
        for (uint64_t i77 = 0; i77 != v812; ++i77)
        {
          if (*(void *)v1034 != v813) {
            objc_enumerationMutation(v810);
          }
          v815 = [*(id *)(*((void *)&v1033 + 1) + 8 * i77) dictionaryRepresentation];
          [v809 addObject:v815];
        }
        uint64_t v812 = [v810 countByEnumeratingWithState:&v1033 objects:v1387 count:16];
      }
      while (v812);
    }

    [v3 setObject:v809 forKeyedSubscript:@"_payloadTask"];
  }
  if ([*(id *)(v2 + 2336) count])
  {
    v816 = [MEMORY[0x1E4F1CA48] array];
    long long v1029 = 0u;
    long long v1030 = 0u;
    long long v1031 = 0u;
    long long v1032 = 0u;
    id v817 = *(id *)(v2 + 2336);
    uint64_t v818 = [v817 countByEnumeratingWithState:&v1029 objects:v1386 count:16];
    if (v818)
    {
      uint64_t v819 = v818;
      uint64_t v820 = *(void *)v1030;
      do
      {
        for (uint64_t i78 = 0; i78 != v819; ++i78)
        {
          if (*(void *)v1030 != v820) {
            objc_enumerationMutation(v817);
          }
          v822 = [*(id *)(*((void *)&v1029 + 1) + 8 * i78) dictionaryRepresentation];
          [v816 addObject:v822];
        }
        uint64_t v819 = [v817 countByEnumeratingWithState:&v1029 objects:v1386 count:16];
      }
      while (v819);
    }

    [v3 setObject:v816 forKeyedSubscript:@"_payloadTaskList"];
  }
  if (*(void *)(v2 + 1240))
  {
    v823 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadTaskPrioritiesCount"));
    if ([(id)v2 payloadTaskPrioritiesCount])
    {
      unint64_t v824 = 0;
      do
      {
        uint64_t v825 = *(unsigned int *)(*(void *)(v2 + 1232) + 4 * v824);
        if (v825 >= 3)
        {
          v826 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1232) + 4 * v824));
        }
        else
        {
          v826 = *(&off_1E551D410 + v825);
        }
        [v823 addObject:v826];

        ++v824;
      }
      while (v824 < [(id)v2 payloadTaskPrioritiesCount]);
    }
    [v3 setObject:v823 forKeyedSubscript:@"_payloadTaskPriority"];
  }
  if (*(void *)(v2 + 1264))
  {
    v827 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadTaskReferencesCount"));
    if ([(id)v2 payloadTaskReferencesCount])
    {
      unint64_t v828 = 0;
      do
      {
        if (*(_DWORD *)(*(void *)(v2 + 1256) + 4 * v828))
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1256) + 4 * v828));
          v829 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v829 = @"CURRENT_ACTIVITY";
        }
        [v827 addObject:v829];

        ++v828;
      }
      while (v828 < [(id)v2 payloadTaskReferencesCount]);
    }
    [v3 setObject:v827 forKeyedSubscript:@"_payloadTaskReference"];
  }
  if (*(void *)(v2 + 1288))
  {
    v830 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadTaskStatusCount"));
    if ([(id)v2 payloadTaskStatusCount])
    {
      unint64_t v831 = 0;
      do
      {
        int v832 = *(_DWORD *)(*(void *)(v2 + 1280) + 4 * v831);
        if (v832)
        {
          if (v832 == 20)
          {
            v833 = @"COMPLETED";
          }
          else if (v832 == 10)
          {
            v833 = @"NOT_COMPLETED";
          }
          else
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1280) + 4 * v831));
            v833 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v833 = @"UNKNOWN_STATUS";
        }
        [v830 addObject:v833];

        ++v831;
      }
      while (v831 < [(id)v2 payloadTaskStatusCount]);
    }
    [v3 setObject:v830 forKeyedSubscript:@"_payloadTaskStatus"];
  }
  if ([*(id *)(v2 + 2344) count])
  {
    v834 = [MEMORY[0x1E4F1CA48] array];
    long long v1025 = 0u;
    long long v1026 = 0u;
    long long v1027 = 0u;
    long long v1028 = 0u;
    id v835 = *(id *)(v2 + 2344);
    uint64_t v836 = [v835 countByEnumeratingWithState:&v1025 objects:v1385 count:16];
    if (v836)
    {
      uint64_t v837 = v836;
      uint64_t v838 = *(void *)v1026;
      do
      {
        for (uint64_t i79 = 0; i79 != v837; ++i79)
        {
          if (*(void *)v1026 != v838) {
            objc_enumerationMutation(v835);
          }
          v840 = [*(id *)(*((void *)&v1025 + 1) + 8 * i79) dictionaryRepresentation];
          [v834 addObject:v840];
        }
        uint64_t v837 = [v835 countByEnumeratingWithState:&v1025 objects:v1385 count:16];
      }
      while (v837);
    }

    [v3 setObject:v834 forKeyedSubscript:@"_payloadTemperatureList"];
  }
  if ([*(id *)(v2 + 2352) count])
  {
    v841 = [MEMORY[0x1E4F1CA48] array];
    long long v1021 = 0u;
    long long v1022 = 0u;
    long long v1023 = 0u;
    long long v1024 = 0u;
    id v842 = *(id *)(v2 + 2352);
    uint64_t v843 = [v842 countByEnumeratingWithState:&v1021 objects:v1384 count:16];
    if (v843)
    {
      uint64_t v844 = v843;
      uint64_t v845 = *(void *)v1022;
      do
      {
        for (uint64_t i80 = 0; i80 != v844; ++i80)
        {
          if (*(void *)v1022 != v845) {
            objc_enumerationMutation(v842);
          }
          v847 = [*(id *)(*((void *)&v1021 + 1) + 8 * i80) dictionaryRepresentation];
          [v841 addObject:v847];
        }
        uint64_t v844 = [v842 countByEnumeratingWithState:&v1021 objects:v1384 count:16];
      }
      while (v844);
    }

    [v3 setObject:v841 forKeyedSubscript:@"_payloadTemperatureValue"];
  }
  if ([*(id *)(v2 + 2360) count])
  {
    v848 = [MEMORY[0x1E4F1CA48] array];
    long long v1017 = 0u;
    long long v1018 = 0u;
    long long v1019 = 0u;
    long long v1020 = 0u;
    id v849 = *(id *)(v2 + 2360);
    uint64_t v850 = [v849 countByEnumeratingWithState:&v1017 objects:v1383 count:16];
    if (v850)
    {
      uint64_t v851 = v850;
      uint64_t v852 = *(void *)v1018;
      do
      {
        for (uint64_t i81 = 0; i81 != v851; ++i81)
        {
          if (*(void *)v1018 != v852) {
            objc_enumerationMutation(v849);
          }
          v854 = [*(id *)(*((void *)&v1017 + 1) + 8 * i81) dictionaryRepresentation];
          [v848 addObject:v854];
        }
        uint64_t v851 = [v849 countByEnumeratingWithState:&v1017 objects:v1383 count:16];
      }
      while (v851);
    }

    [v3 setObject:v848 forKeyedSubscript:@"_payloadTemporalEventTrigger"];
  }
  if (*(void *)(v2 + 1312))
  {
    v855 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadTemporalEventTriggerTypesCount"));
    if ([(id)v2 payloadTemporalEventTriggerTypesCount])
    {
      unint64_t v856 = 0;
      do
      {
        uint64_t v857 = *(unsigned int *)(*(void *)(v2 + 1304) + 4 * v856);
        if (v857 >= 4)
        {
          v858 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1304) + 4 * v856));
        }
        else
        {
          v858 = *(&off_1E551D428 + v857);
        }
        [v855 addObject:v858];

        ++v856;
      }
      while (v856 < [(id)v2 payloadTemporalEventTriggerTypesCount]);
    }
    [v3 setObject:v855 forKeyedSubscript:@"_payloadTemporalEventTriggerType"];
  }
  if ([*(id *)(v2 + 2368) count])
  {
    v859 = [MEMORY[0x1E4F1CA48] array];
    long long v1013 = 0u;
    long long v1014 = 0u;
    long long v1015 = 0u;
    long long v1016 = 0u;
    id v860 = *(id *)(v2 + 2368);
    uint64_t v861 = [v860 countByEnumeratingWithState:&v1013 objects:v1382 count:16];
    if (v861)
    {
      uint64_t v862 = v861;
      uint64_t v863 = *(void *)v1014;
      do
      {
        for (uint64_t i82 = 0; i82 != v862; ++i82)
        {
          if (*(void *)v1014 != v863) {
            objc_enumerationMutation(v860);
          }
          v865 = [*(id *)(*((void *)&v1013 + 1) + 8 * i82) dictionaryRepresentation];
          [v859 addObject:v865];
        }
        uint64_t v862 = [v860 countByEnumeratingWithState:&v1013 objects:v1382 count:16];
      }
      while (v862);
    }

    [v3 setObject:v859 forKeyedSubscript:@"_payloadTimer"];
  }
  if (*(void *)(v2 + 1336))
  {
    v866 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadTimerStatesCount"));
    if ([(id)v2 payloadTimerStatesCount])
    {
      unint64_t v867 = 0;
      do
      {
        uint64_t v868 = *(unsigned int *)(*(void *)(v2 + 1328) + 4 * v867);
        if (v868 >= 3)
        {
          v869 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1328) + 4 * v867));
        }
        else
        {
          v869 = *(&off_1E551D448 + v868);
        }
        [v866 addObject:v869];

        ++v867;
      }
      while (v867 < [(id)v2 payloadTimerStatesCount]);
    }
    [v3 setObject:v866 forKeyedSubscript:@"_payloadTimerState"];
  }
  if (*(void *)(v2 + 1360))
  {
    v870 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadTimerTypesCount"));
    if ([(id)v2 payloadTimerTypesCount])
    {
      unint64_t v871 = 0;
      do
      {
        uint64_t v872 = *(unsigned int *)(*(void *)(v2 + 1352) + 4 * v871);
        if (v872 >= 3)
        {
          v873 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1352) + 4 * v871));
        }
        else
        {
          v873 = *(&off_1E551D460 + v872);
        }
        [v870 addObject:v873];

        ++v871;
      }
      while (v871 < [(id)v2 payloadTimerTypesCount]);
    }
    [v3 setObject:v870 forKeyedSubscript:@"_payloadTimerType"];
  }
  if ([*(id *)(v2 + 2376) count])
  {
    v874 = [MEMORY[0x1E4F1CA48] array];
    long long v1009 = 0u;
    long long v1010 = 0u;
    long long v1011 = 0u;
    long long v1012 = 0u;
    id v875 = *(id *)(v2 + 2376);
    uint64_t v876 = [v875 countByEnumeratingWithState:&v1009 objects:v1381 count:16];
    if (v876)
    {
      uint64_t v877 = v876;
      uint64_t v878 = *(void *)v1010;
      do
      {
        for (uint64_t i83 = 0; i83 != v877; ++i83)
        {
          if (*(void *)v1010 != v878) {
            objc_enumerationMutation(v875);
          }
          v880 = [*(id *)(*((void *)&v1009 + 1) + 8 * i83) dictionaryRepresentation];
          [v874 addObject:v880];
        }
        uint64_t v877 = [v875 countByEnumeratingWithState:&v1009 objects:v1381 count:16];
      }
      while (v877);
    }

    [v3 setObject:v874 forKeyedSubscript:@"_payloadURLValue"];
  }
  if (*(void *)(v2 + 1384))
  {
    v881 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadUpdateAlarmOperationsCount"));
    if ([(id)v2 payloadUpdateAlarmOperationsCount])
    {
      unint64_t v882 = 0;
      do
      {
        int v883 = *(_DWORD *)(*(void *)(v2 + 1376) + 4 * v882);
        if (v883 == 1)
        {
          v884 = @"UPDATE_LABEL";
        }
        else if (v883 == 2)
        {
          v884 = @"UPDATE_TIME";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1376) + 4 * v882));
          v884 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v881 addObject:v884];

        ++v882;
      }
      while (v882 < [(id)v2 payloadUpdateAlarmOperationsCount]);
    }
    [v3 setObject:v881 forKeyedSubscript:@"_payloadUpdateAlarmOperation"];
  }
  if (*(void *)(v2 + 1408))
  {
    v885 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadUserNotificationTypesCount"));
    if ([(id)v2 payloadUserNotificationTypesCount])
    {
      unint64_t v886 = 0;
      do
      {
        int v887 = *(_DWORD *)(*(void *)(v2 + 1400) + 4 * v886);
        if (v887 == 1)
        {
          v888 = @"ANNOUNCEMENT";
        }
        else if (v887 == 2)
        {
          v888 = @"DELIVERY_FAILURE";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1400) + 4 * v886));
          v888 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v885 addObject:v888];

        ++v886;
      }
      while (v886 < [(id)v2 payloadUserNotificationTypesCount]);
    }
    [v3 setObject:v885 forKeyedSubscript:@"_payloadUserNotificationType"];
  }
  if (*(void *)(v2 + 1432))
  {
    v889 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadVisualCodeTypesCount"));
    if ([(id)v2 payloadVisualCodeTypesCount])
    {
      unint64_t v890 = 0;
      do
      {
        uint64_t v891 = *(unsigned int *)(*(void *)(v2 + 1424) + 4 * v890);
        if (v891 >= 7)
        {
          v892 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1424) + 4 * v890));
        }
        else
        {
          v892 = *(&off_1E551D478 + v891);
        }
        [v889 addObject:v892];

        ++v890;
      }
      while (v890 < [(id)v2 payloadVisualCodeTypesCount]);
    }
    [v3 setObject:v889 forKeyedSubscript:@"_payloadVisualCodeType"];
  }
  if ([*(id *)(v2 + 2384) count])
  {
    v893 = [MEMORY[0x1E4F1CA48] array];
    long long v1005 = 0u;
    long long v1006 = 0u;
    long long v1007 = 0u;
    long long v1008 = 0u;
    id v894 = *(id *)(v2 + 2384);
    uint64_t v895 = [v894 countByEnumeratingWithState:&v1005 objects:v1380 count:16];
    if (v895)
    {
      uint64_t v896 = v895;
      uint64_t v897 = *(void *)v1006;
      do
      {
        for (uint64_t i84 = 0; i84 != v896; ++i84)
        {
          if (*(void *)v1006 != v897) {
            objc_enumerationMutation(v894);
          }
          v899 = [*(id *)(*((void *)&v1005 + 1) + 8 * i84) dictionaryRepresentation];
          [v893 addObject:v899];
        }
        uint64_t v896 = [v894 countByEnumeratingWithState:&v1005 objects:v1380 count:16];
      }
      while (v896);
    }

    [v3 setObject:v893 forKeyedSubscript:@"_payloadVoiceCommandDeviceInformation"];
  }
  if ([*(id *)(v2 + 2392) count])
  {
    v900 = [MEMORY[0x1E4F1CA48] array];
    long long v1001 = 0u;
    long long v1002 = 0u;
    long long v1003 = 0u;
    long long v1004 = 0u;
    id v901 = *(id *)(v2 + 2392);
    uint64_t v902 = [v901 countByEnumeratingWithState:&v1001 objects:v1379 count:16];
    if (v902)
    {
      uint64_t v903 = v902;
      uint64_t v904 = *(void *)v1002;
      do
      {
        for (uint64_t i85 = 0; i85 != v903; ++i85)
        {
          if (*(void *)v1002 != v904) {
            objc_enumerationMutation(v901);
          }
          v906 = [*(id *)(*((void *)&v1001 + 1) + 8 * i85) dictionaryRepresentation];
          [v900 addObject:v906];
        }
        uint64_t v903 = [v901 countByEnumeratingWithState:&v1001 objects:v1379 count:16];
      }
      while (v903);
    }

    [v3 setObject:v900 forKeyedSubscript:@"_payloadVolumeValue"];
  }
  if ([*(id *)(v2 + 2400) count])
  {
    v907 = [MEMORY[0x1E4F1CA48] array];
    long long v997 = 0u;
    long long v998 = 0u;
    long long v999 = 0u;
    long long v1000 = 0u;
    id v908 = *(id *)(v2 + 2400);
    uint64_t v909 = [v908 countByEnumeratingWithState:&v997 objects:v1378 count:16];
    if (v909)
    {
      uint64_t v910 = v909;
      uint64_t v911 = *(void *)v998;
      do
      {
        for (uint64_t i86 = 0; i86 != v910; ++i86)
        {
          if (*(void *)v998 != v911) {
            objc_enumerationMutation(v908);
          }
          v913 = [*(id *)(*((void *)&v997 + 1) + 8 * i86) dictionaryRepresentation];
          [v907 addObject:v913];
        }
        uint64_t v910 = [v908 countByEnumeratingWithState:&v997 objects:v1378 count:16];
      }
      while (v910);
    }

    [v3 setObject:v907 forKeyedSubscript:@"_payloadWellnessMetadataPair"];
  }
  if ([*(id *)(v2 + 2408) count])
  {
    v914 = [MEMORY[0x1E4F1CA48] array];
    long long v993 = 0u;
    long long v994 = 0u;
    long long v995 = 0u;
    long long v996 = 0u;
    id v915 = *(id *)(v2 + 2408);
    uint64_t v916 = [v915 countByEnumeratingWithState:&v993 objects:v1377 count:16];
    if (v916)
    {
      uint64_t v917 = v916;
      uint64_t v918 = *(void *)v994;
      do
      {
        for (uint64_t i87 = 0; i87 != v917; ++i87)
        {
          if (*(void *)v994 != v918) {
            objc_enumerationMutation(v915);
          }
          v920 = [*(id *)(*((void *)&v993 + 1) + 8 * i87) dictionaryRepresentation];
          [v914 addObject:v920];
        }
        uint64_t v917 = [v915 countByEnumeratingWithState:&v993 objects:v1377 count:16];
      }
      while (v917);
    }

    [v3 setObject:v914 forKeyedSubscript:@"_payloadWellnessObjectResultValue"];
  }
  if (*(void *)(v2 + 1456))
  {
    v921 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadWellnessObjectTypesCount"));
    if ([(id)v2 payloadWellnessObjectTypesCount])
    {
      unint64_t v922 = 0;
      do
      {
        uint64_t v923 = *(unsigned int *)(*(void *)(v2 + 1448) + 4 * v922);
        if (v923 >= 0x4B)
        {
          v924 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1448) + 4 * v922));
        }
        else
        {
          v924 = *(&off_1E551D4B0 + v923);
        }
        [v921 addObject:v924];

        ++v922;
      }
      while (v922 < [(id)v2 payloadWellnessObjectTypesCount]);
    }
    [v3 setObject:v921 forKeyedSubscript:@"_payloadWellnessObjectType"];
  }
  if (*(void *)(v2 + 1480))
  {
    v925 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadWellnessQueryResultTypesCount"));
    if ([(id)v2 payloadWellnessQueryResultTypesCount])
    {
      unint64_t v926 = 0;
      do
      {
        uint64_t v927 = *(unsigned int *)(*(void *)(v2 + 1472) + 4 * v926);
        if (v927 >= 0xA)
        {
          v928 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1472) + 4 * v926));
        }
        else
        {
          v928 = *(&off_1E551D708 + v927);
        }
        [v925 addObject:v928];

        ++v926;
      }
      while (v926 < [(id)v2 payloadWellnessQueryResultTypesCount]);
    }
    [v3 setObject:v925 forKeyedSubscript:@"_payloadWellnessQueryResultType"];
  }
  if (*(void *)(v2 + 1504))
  {
    v929 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadWellnessQuestionTypesCount"));
    if ([(id)v2 payloadWellnessQuestionTypesCount])
    {
      unint64_t v930 = 0;
      do
      {
        uint64_t v931 = *(unsigned int *)(*(void *)(v2 + 1496) + 4 * v930);
        if (v931 >= 8)
        {
          v932 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1496) + 4 * v930));
        }
        else
        {
          v932 = *(&off_1E551D758 + v931);
        }
        [v929 addObject:v932];

        ++v930;
      }
      while (v930 < [(id)v2 payloadWellnessQuestionTypesCount]);
    }
    [v3 setObject:v929 forKeyedSubscript:@"_payloadWellnessQuestionType"];
  }
  if ([*(id *)(v2 + 2416) count])
  {
    v933 = [MEMORY[0x1E4F1CA48] array];
    long long v989 = 0u;
    long long v990 = 0u;
    long long v991 = 0u;
    long long v992 = 0u;
    id v934 = *(id *)(v2 + 2416);
    uint64_t v935 = [v934 countByEnumeratingWithState:&v989 objects:v1376 count:16];
    if (v935)
    {
      uint64_t v936 = v935;
      uint64_t v937 = *(void *)v990;
      do
      {
        for (uint64_t i88 = 0; i88 != v936; ++i88)
        {
          if (*(void *)v990 != v937) {
            objc_enumerationMutation(v934);
          }
          v939 = [*(id *)(*((void *)&v989 + 1) + 8 * i88) dictionaryRepresentation];
          [v933 addObject:v939];
        }
        uint64_t v936 = [v934 countByEnumeratingWithState:&v989 objects:v1376 count:16];
      }
      while (v936);
    }

    [v3 setObject:v933 forKeyedSubscript:@"_payloadWellnessUnitType"];
  }
  if ([*(id *)(v2 + 2424) count])
  {
    v940 = [MEMORY[0x1E4F1CA48] array];
    long long v985 = 0u;
    long long v986 = 0u;
    long long v987 = 0u;
    long long v988 = 0u;
    id v941 = *(id *)(v2 + 2424);
    uint64_t v942 = [v941 countByEnumeratingWithState:&v985 objects:v1375 count:16];
    if (v942)
    {
      uint64_t v943 = v942;
      uint64_t v944 = *(void *)v986;
      do
      {
        for (uint64_t i89 = 0; i89 != v943; ++i89)
        {
          if (*(void *)v986 != v944) {
            objc_enumerationMutation(v941);
          }
          v946 = [*(id *)(*((void *)&v985 + 1) + 8 * i89) dictionaryRepresentation];
          [v940 addObject:v946];
        }
        uint64_t v943 = [v941 countByEnumeratingWithState:&v985 objects:v1375 count:16];
      }
      while (v943);
    }

    [v3 setObject:v940 forKeyedSubscript:@"_payloadWellnessValue"];
  }
  if ([*(id *)(v2 + 2432) count])
  {
    v947 = [MEMORY[0x1E4F1CA48] array];
    long long v981 = 0u;
    long long v982 = 0u;
    long long v983 = 0u;
    long long v984 = 0u;
    id v948 = *(id *)(v2 + 2432);
    uint64_t v949 = [v948 countByEnumeratingWithState:&v981 objects:v1374 count:16];
    if (v949)
    {
      uint64_t v950 = v949;
      uint64_t v951 = *(void *)v982;
      do
      {
        for (uint64_t i90 = 0; i90 != v950; ++i90)
        {
          if (*(void *)v982 != v951) {
            objc_enumerationMutation(v948);
          }
          v953 = [*(id *)(*((void *)&v981 + 1) + 8 * i90) dictionaryRepresentation];
          [v947 addObject:v953];
        }
        uint64_t v950 = [v948 countByEnumeratingWithState:&v981 objects:v1374 count:16];
      }
      while (v950);
    }

    [v3 setObject:v947 forKeyedSubscript:@"_payloadWorkoutAssociatedItem"];
  }
  if ([*(id *)(v2 + 2440) count])
  {
    v954 = [MEMORY[0x1E4F1CA48] array];
    long long v977 = 0u;
    long long v978 = 0u;
    long long v979 = 0u;
    long long v980 = 0u;
    id v955 = *(id *)(v2 + 2440);
    uint64_t v956 = [v955 countByEnumeratingWithState:&v977 objects:v1373 count:16];
    if (v956)
    {
      uint64_t v957 = v956;
      uint64_t v958 = *(void *)v978;
      do
      {
        for (uint64_t i91 = 0; i91 != v957; ++i91)
        {
          if (*(void *)v978 != v958) {
            objc_enumerationMutation(v955);
          }
          v960 = [*(id *)(*((void *)&v977 + 1) + 8 * i91) dictionaryRepresentation];
          [v954 addObject:v960];
        }
        uint64_t v957 = [v955 countByEnumeratingWithState:&v977 objects:v1373 count:16];
      }
      while (v957);
    }

    [v3 setObject:v954 forKeyedSubscript:@"_payloadWorkoutCustomization"];
  }
  if (*(void *)(v2 + 1528))
  {
    v961 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadWorkoutGoalUnitTypesCount"));
    if ([(id)v2 payloadWorkoutGoalUnitTypesCount])
    {
      unint64_t v962 = 0;
      do
      {
        uint64_t v963 = *(unsigned int *)(*(void *)(v2 + 1520) + 4 * v962);
        if (v963 >= 0xA)
        {
          v964 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1520) + 4 * v962));
        }
        else
        {
          v964 = *(&off_1E551D798 + v963);
        }
        [v961 addObject:v964];

        ++v962;
      }
      while (v962 < [(id)v2 payloadWorkoutGoalUnitTypesCount]);
    }
    [v3 setObject:v961 forKeyedSubscript:@"_payloadWorkoutGoalUnitType"];
  }
  if (*(void *)(v2 + 1552))
  {
    v965 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadWorkoutLocationTypesCount"));
    if ([(id)v2 payloadWorkoutLocationTypesCount])
    {
      unint64_t v966 = 0;
      do
      {
        int v967 = *(_DWORD *)(*(void *)(v2 + 1544) + 4 * v966);
        if (v967)
        {
          if (v967 == 1)
          {
            v968 = @"INDOOR";
          }
          else
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1544) + 4 * v966));
            v968 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v968 = @"OUTDOOR";
        }
        [v965 addObject:v968];

        ++v966;
      }
      while (v966 < [(id)v2 payloadWorkoutLocationTypesCount]);
    }
    [v3 setObject:v965 forKeyedSubscript:@"_payloadWorkoutLocationType"];
  }
  if (*(void *)(v2 + 1576))
  {
    v969 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v2, "payloadWorkoutSequenceLabelsCount"));
    if ([(id)v2 payloadWorkoutSequenceLabelsCount])
    {
      unint64_t v970 = 0;
      do
      {
        int v971 = *(_DWORD *)(*(void *)(v2 + 1568) + 4 * v970);
        if (v971)
        {
          if (v971 == 1)
          {
            v972 = @"next";
          }
          else
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(*(void *)(v2 + 1568) + 4 * v970));
            v972 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v972 = @"last";
        }
        [v969 addObject:v972];

        ++v970;
      }
      while (v970 < [(id)v2 payloadWorkoutSequenceLabelsCount]);
    }
    [v3 setObject:v969 forKeyedSubscript:@"_payloadWorkoutSequenceLabel"];
  }
  if ([(id)v2 hasType])
  {
    uint64_t v973 = [(id)v2 type];
    v974 = @"String";
    switch((int)v973)
    {
      case 1:
        break;
      case 2:
        v974 = @"Double";
        break;
      case 3:
        v974 = @"Integer";
        break;
      case 4:
        v974 = @"Contact";
        break;
      case 5:
        v974 = @"DateTimeRange";
        break;
      case 6:
        v974 = @"Location";
        break;
      case 7:
        v974 = @"DataString";
        break;
      case 8:
        v974 = @"Long";
        break;
      case 9:
        v974 = @"PaymentMethod";
        break;
      case 10:
        v974 = @"Temperature";
        break;
      case 11:
        v974 = @"Distance";
        break;
      case 12:
        v974 = @"FinancialAccount";
        break;
      case 13:
        v974 = @"BillType";
        break;
      case 14:
        v974 = @"Mass";
        break;
      case 15:
        v974 = @"Volume";
        break;
      case 16:
        v974 = @"Speed";
        break;
      case 17:
        v974 = @"Energy";
        break;
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
LABEL_1518:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v973);
        v974 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case 50:
        v974 = @"StringList";
        break;
      case 51:
        v974 = @"DoubleList";
        break;
      case 52:
        v974 = @"IntegerList";
        break;
      case 53:
        v974 = @"ContactList";
        break;
      case 54:
        v974 = @"DateTimeRangeList";
        break;
      case 55:
        v974 = @"LocationList";
        break;
      case 56:
        v974 = @"DataStringList";
        break;
      case 57:
        v974 = @"LongList";
        break;
      case 58:
        v974 = @"PaymentMethodList";
        break;
      case 59:
        v974 = @"TemperatureList";
        break;
      case 60:
        v974 = @"DistanceList";
        break;
      default:
        switch((int)v973)
        {
          case 'd':
            v974 = @"PrimitiveBool";
            break;
          case 'e':
            v974 = @"PrimitiveInt";
            break;
          case 'f':
            v974 = @"PrimitiveLong";
            break;
          case 'g':
            v974 = @"PrimitiveDouble";
            break;
          case 'h':
            v974 = @"PrimitiveString";
            break;
          case 'i':
            v974 = @"DateTime";
            break;
          case 'j':
            goto LABEL_1518;
          case 'k':
            v974 = @"Intent";
            break;
          case 'l':
            v974 = @"ModifyRelationship";
            break;
          case 'm':
            v974 = @"ModifyNickname";
            break;
          case 'n':
            v974 = @"CalendarEvent";
            break;
          case 'o':
            v974 = @"EventParticipant";
            break;
          case 'p':
            v974 = @"EventAttribute";
            break;
          default:
            if (v973 != 1000) {
              goto LABEL_1518;
            }
            v974 = @"Extension";
            break;
        }
        break;
    }
    [v3 setObject:v974 forKeyedSubscript:@"type"];
  }
  id v975 = v3;

  return v975;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || !PBRepeatedInt32IsEqual()) {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadActivities];
  unsigned int v6 = [v4 payloadActivities];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v7 = [(_INPBIntentSlotValue *)self payloadActivities];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = [(_INPBIntentSlotValue *)self payloadActivities];
    uint64_t v10 = [v4 payloadActivities];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadActivityLists];
  unsigned int v6 = [v4 payloadActivityLists];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v12 = [(_INPBIntentSlotValue *)self payloadActivityLists];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBIntentSlotValue *)self payloadActivityLists];
    v15 = [v4 payloadActivityLists];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadAlarms];
  unsigned int v6 = [v4 payloadAlarms];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v17 = [(_INPBIntentSlotValue *)self payloadAlarms];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_INPBIntentSlotValue *)self payloadAlarms];
    v20 = [v4 payloadAlarms];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual() || !PBRepeatedInt32IsEqual()) {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadAlarmSearchs];
  unsigned int v6 = [v4 payloadAlarmSearchs];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v22 = [(_INPBIntentSlotValue *)self payloadAlarmSearchs];
  if (v22)
  {
    id v23 = (void *)v22;
    uint64_t v24 = [(_INPBIntentSlotValue *)self payloadAlarmSearchs];
    uint64_t v25 = [v4 payloadAlarmSearchs];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadAnnouncements];
  unsigned int v6 = [v4 payloadAnnouncements];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v27 = [(_INPBIntentSlotValue *)self payloadAnnouncements];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBIntentSlotValue *)self payloadAnnouncements];
    unint64_t v30 = [v4 payloadAnnouncements];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadAppIdentifiers];
  unsigned int v6 = [v4 payloadAppIdentifiers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v32 = [(_INPBIntentSlotValue *)self payloadAppIdentifiers];
  if (v32)
  {
    v33 = (void *)v32;
    unint64_t v34 = [(_INPBIntentSlotValue *)self payloadAppIdentifiers];
    uint64_t v35 = [v4 payloadAppIdentifiers];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadArchivedObjects];
  unsigned int v6 = [v4 payloadArchivedObjects];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v37 = [(_INPBIntentSlotValue *)self payloadArchivedObjects];
  if (v37)
  {
    id v38 = (void *)v37;
    uint64_t v39 = [(_INPBIntentSlotValue *)self payloadArchivedObjects];
    uint64_t v40 = [v4 payloadArchivedObjects];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadBillDetailsValues];
  unsigned int v6 = [v4 payloadBillDetailsValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v42 = [(_INPBIntentSlotValue *)self payloadBillDetailsValues];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(_INPBIntentSlotValue *)self payloadBillDetailsValues];
    unint64_t v45 = [v4 payloadBillDetailsValues];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadBillPayeeValues];
  unsigned int v6 = [v4 payloadBillPayeeValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v47 = [(_INPBIntentSlotValue *)self payloadBillPayeeValues];
  if (v47)
  {
    v48 = (void *)v47;
    id v49 = [(_INPBIntentSlotValue *)self payloadBillPayeeValues];
    uint64_t v50 = [v4 payloadBillPayeeValues];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadCalendarEvents];
  unsigned int v6 = [v4 payloadCalendarEvents];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v52 = [(_INPBIntentSlotValue *)self payloadCalendarEvents];
  if (v52)
  {
    v53 = (void *)v52;
    v54 = [(_INPBIntentSlotValue *)self payloadCalendarEvents];
    v55 = [v4 payloadCalendarEvents];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadCallGroups];
  unsigned int v6 = [v4 payloadCallGroups];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v57 = [(_INPBIntentSlotValue *)self payloadCallGroups];
  if (v57)
  {
    uint64_t v58 = (void *)v57;
    uint64_t v59 = [(_INPBIntentSlotValue *)self payloadCallGroups];
    v60 = [v4 payloadCallGroups];
    int v61 = [v59 isEqual:v60];

    if (!v61) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadCallGroupConversations];
  unsigned int v6 = [v4 payloadCallGroupConversations];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v62 = [(_INPBIntentSlotValue *)self payloadCallGroupConversations];
  if (v62)
  {
    id v63 = (void *)v62;
    uint64_t v64 = [(_INPBIntentSlotValue *)self payloadCallGroupConversations];
    uint64_t v65 = [v4 payloadCallGroupConversations];
    int v66 = [v64 isEqual:v65];

    if (!v66) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadCallRecordFilters];
  unsigned int v6 = [v4 payloadCallRecordFilters];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v67 = [(_INPBIntentSlotValue *)self payloadCallRecordFilters];
  if (v67)
  {
    v68 = (void *)v67;
    v69 = [(_INPBIntentSlotValue *)self payloadCallRecordFilters];
    unint64_t v70 = [v4 payloadCallRecordFilters];
    int v71 = [v69 isEqual:v70];

    if (!v71) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadCallRecordValues];
  unsigned int v6 = [v4 payloadCallRecordValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v72 = [(_INPBIntentSlotValue *)self payloadCallRecordValues];
  if (v72)
  {
    v73 = (void *)v72;
    id v74 = [(_INPBIntentSlotValue *)self payloadCallRecordValues];
    uint64_t v75 = [v4 payloadCallRecordValues];
    int v76 = [v74 isEqual:v75];

    if (!v76) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadChargingConnectorTypes];
  unsigned int v6 = [v4 payloadChargingConnectorTypes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v77 = [(_INPBIntentSlotValue *)self payloadChargingConnectorTypes];
  if (v77)
  {
    v78 = (void *)v77;
    v79 = [(_INPBIntentSlotValue *)self payloadChargingConnectorTypes];
    v80 = [v4 payloadChargingConnectorTypes];
    int v81 = [v79 isEqual:v80];

    if (!v81) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadContactEventTriggers];
  unsigned int v6 = [v4 payloadContactEventTriggers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v82 = [(_INPBIntentSlotValue *)self payloadContactEventTriggers];
  if (v82)
  {
    uint64_t v83 = (void *)v82;
    uint64_t v84 = [(_INPBIntentSlotValue *)self payloadContactEventTriggers];
    v85 = [v4 payloadContactEventTriggers];
    int v86 = [v84 isEqual:v85];

    if (!v86) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadContactLists];
  unsigned int v6 = [v4 payloadContactLists];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v87 = [(_INPBIntentSlotValue *)self payloadContactLists];
  if (v87)
  {
    unint64_t v88 = (void *)v87;
    unsigned int v89 = [(_INPBIntentSlotValue *)self payloadContactLists];
    v90 = [v4 payloadContactLists];
    int v91 = [v89 isEqual:v90];

    if (!v91) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadContactValues];
  unsigned int v6 = [v4 payloadContactValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v92 = [(_INPBIntentSlotValue *)self payloadContactValues];
  if (v92)
  {
    unsigned int v93 = (void *)v92;
    v94 = [(_INPBIntentSlotValue *)self payloadContactValues];
    v95 = [v4 payloadContactValues];
    int v96 = [v94 isEqual:v95];

    if (!v96) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadCurrencyAmounts];
  unsigned int v6 = [v4 payloadCurrencyAmounts];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v97 = [(_INPBIntentSlotValue *)self payloadCurrencyAmounts];
  if (v97)
  {
    v98 = (void *)v97;
    v99 = [(_INPBIntentSlotValue *)self payloadCurrencyAmounts];
    id v100 = [v4 payloadCurrencyAmounts];
    int v101 = [v99 isEqual:v100];

    if (!v101) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadCustomObjects];
  unsigned int v6 = [v4 payloadCustomObjects];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v102 = [(_INPBIntentSlotValue *)self payloadCustomObjects];
  if (v102)
  {
    uint64_t v103 = (void *)v102;
    v104 = [(_INPBIntentSlotValue *)self payloadCustomObjects];
    v105 = [v4 payloadCustomObjects];
    int v106 = [v104 isEqual:v105];

    if (!v106) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadDataStrings];
  unsigned int v6 = [v4 payloadDataStrings];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v107 = [(_INPBIntentSlotValue *)self payloadDataStrings];
  if (v107)
  {
    unsigned int v108 = (void *)v107;
    v109 = [(_INPBIntentSlotValue *)self payloadDataStrings];
    v110 = [v4 payloadDataStrings];
    int v111 = [v109 isEqual:v110];

    if (!v111) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadDataStringLists];
  unsigned int v6 = [v4 payloadDataStringLists];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v112 = [(_INPBIntentSlotValue *)self payloadDataStringLists];
  if (v112)
  {
    v113 = (void *)v112;
    v114 = [(_INPBIntentSlotValue *)self payloadDataStringLists];
    unint64_t v115 = [v4 payloadDataStringLists];
    int v116 = [v114 isEqual:v115];

    if (!v116) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadDateTimeRangeLists];
  unsigned int v6 = [v4 payloadDateTimeRangeLists];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v117 = [(_INPBIntentSlotValue *)self payloadDateTimeRangeLists];
  if (v117)
  {
    v118 = (void *)v117;
    id v119 = [(_INPBIntentSlotValue *)self payloadDateTimeRangeLists];
    uint64_t v120 = [v4 payloadDateTimeRangeLists];
    int v121 = [v119 isEqual:v120];

    if (!v121) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadDateTimeRangeValues];
  unsigned int v6 = [v4 payloadDateTimeRangeValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v122 = [(_INPBIntentSlotValue *)self payloadDateTimeRangeValues];
  if (v122)
  {
    v123 = (void *)v122;
    v124 = [(_INPBIntentSlotValue *)self payloadDateTimeRangeValues];
    v125 = [v4 payloadDateTimeRangeValues];
    int v126 = [v124 isEqual:v125];

    if (!v126) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadDateTimeValues];
  unsigned int v6 = [v4 payloadDateTimeValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v127 = [(_INPBIntentSlotValue *)self payloadDateTimeValues];
  if (v127)
  {
    uint64_t v128 = (void *)v127;
    uint64_t v129 = [(_INPBIntentSlotValue *)self payloadDateTimeValues];
    v130 = [v4 payloadDateTimeValues];
    int v131 = [v129 isEqual:v130];

    if (!v131) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadDevices];
  unsigned int v6 = [v4 payloadDevices];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v132 = [(_INPBIntentSlotValue *)self payloadDevices];
  if (v132)
  {
    id v133 = (void *)v132;
    uint64_t v134 = [(_INPBIntentSlotValue *)self payloadDevices];
    uint64_t v135 = [v4 payloadDevices];
    int v136 = [v134 isEqual:v135];

    if (!v136) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadDeviceDetails];
  unsigned int v6 = [v4 payloadDeviceDetails];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v137 = [(_INPBIntentSlotValue *)self payloadDeviceDetails];
  if (v137)
  {
    v138 = (void *)v137;
    v139 = [(_INPBIntentSlotValue *)self payloadDeviceDetails];
    unint64_t v140 = [v4 payloadDeviceDetails];
    int v141 = [v139 isEqual:v140];

    if (!v141) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadDialingContacts];
  unsigned int v6 = [v4 payloadDialingContacts];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v142 = [(_INPBIntentSlotValue *)self payloadDialingContacts];
  if (v142)
  {
    v143 = (void *)v142;
    id v144 = [(_INPBIntentSlotValue *)self payloadDialingContacts];
    uint64_t v145 = [v4 payloadDialingContacts];
    int v146 = [v144 isEqual:v145];

    if (!v146) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadDistanceLists];
  unsigned int v6 = [v4 payloadDistanceLists];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v147 = [(_INPBIntentSlotValue *)self payloadDistanceLists];
  if (v147)
  {
    v148 = (void *)v147;
    v149 = [(_INPBIntentSlotValue *)self payloadDistanceLists];
    v150 = [v4 payloadDistanceLists];
    int v151 = [v149 isEqual:v150];

    if (!v151) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadDistanceValues];
  unsigned int v6 = [v4 payloadDistanceValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v152 = [(_INPBIntentSlotValue *)self payloadDistanceValues];
  if (v152)
  {
    v153 = (void *)v152;
    v154 = [(_INPBIntentSlotValue *)self payloadDistanceValues];
    unint64_t v155 = [v4 payloadDistanceValues];
    int v156 = [v154 isEqual:v155];

    if (!v156) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadDoubleLists];
  unsigned int v6 = [v4 payloadDoubleLists];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v157 = [(_INPBIntentSlotValue *)self payloadDoubleLists];
  if (v157)
  {
    v158 = (void *)v157;
    unint64_t v159 = [(_INPBIntentSlotValue *)self payloadDoubleLists];
    unsigned int v160 = [v4 payloadDoubleLists];
    int v161 = [v159 isEqual:v160];

    if (!v161) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadDoubleValues];
  unsigned int v6 = [v4 payloadDoubleValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v162 = [(_INPBIntentSlotValue *)self payloadDoubleValues];
  if (v162)
  {
    unint64_t v163 = (void *)v162;
    unsigned int v164 = [(_INPBIntentSlotValue *)self payloadDoubleValues];
    v165 = [v4 payloadDoubleValues];
    int v166 = [v164 isEqual:v165];

    if (!v166) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadEnergyValues];
  unsigned int v6 = [v4 payloadEnergyValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v167 = [(_INPBIntentSlotValue *)self payloadEnergyValues];
  if (v167)
  {
    int v168 = (void *)v167;
    v169 = [(_INPBIntentSlotValue *)self payloadEnergyValues];
    v170 = [v4 payloadEnergyValues];
    int v171 = [v169 isEqual:v170];

    if (!v171) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadEnumerations];
  unsigned int v6 = [v4 payloadEnumerations];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v172 = [(_INPBIntentSlotValue *)self payloadEnumerations];
  if (v172)
  {
    v173 = (void *)v172;
    v174 = [(_INPBIntentSlotValue *)self payloadEnumerations];
    v175 = [v4 payloadEnumerations];
    int v176 = [v174 isEqual:v175];

    if (!v176) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadEvents];
  unsigned int v6 = [v4 payloadEvents];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v177 = [(_INPBIntentSlotValue *)self payloadEvents];
  if (v177)
  {
    uint64_t v178 = (void *)v177;
    uint64_t v179 = [(_INPBIntentSlotValue *)self payloadEvents];
    uint64_t v180 = [v4 payloadEvents];
    int v181 = [v179 isEqual:v180];

    if (!v181) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadEventLists];
  unsigned int v6 = [v4 payloadEventLists];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v182 = [(_INPBIntentSlotValue *)self payloadEventLists];
  if (v182)
  {
    v183 = (void *)v182;
    id v184 = [(_INPBIntentSlotValue *)self payloadEventLists];
    uint64_t v185 = [v4 payloadEventLists];
    int v186 = [v184 isEqual:v185];

    if (!v186) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadEventParticipants];
  unsigned int v6 = [v4 payloadEventParticipants];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v187 = [(_INPBIntentSlotValue *)self payloadEventParticipants];
  if (v187)
  {
    v188 = (void *)v187;
    v189 = [(_INPBIntentSlotValue *)self payloadEventParticipants];
    v190 = [v4 payloadEventParticipants];
    int v191 = [v189 isEqual:v190];

    if (!v191) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadFiles];
  unsigned int v6 = [v4 payloadFiles];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v192 = [(_INPBIntentSlotValue *)self payloadFiles];
  if (v192)
  {
    uint64_t v193 = (void *)v192;
    uint64_t v194 = [(_INPBIntentSlotValue *)self payloadFiles];
    v195 = [v4 payloadFiles];
    int v196 = [v194 isEqual:v195];

    if (!v196) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadFileProperties];
  unsigned int v6 = [v4 payloadFileProperties];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v197 = [(_INPBIntentSlotValue *)self payloadFileProperties];
  if (v197)
  {
    id v198 = (void *)v197;
    uint64_t v199 = [(_INPBIntentSlotValue *)self payloadFileProperties];
    uint64_t v200 = [v4 payloadFileProperties];
    int v201 = [v199 isEqual:v200];

    if (!v201) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual() || !PBRepeatedInt32IsEqual()) {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadFilePropertyValues];
  unsigned int v6 = [v4 payloadFilePropertyValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v202 = [(_INPBIntentSlotValue *)self payloadFilePropertyValues];
  if (v202)
  {
    v203 = (void *)v202;
    v204 = [(_INPBIntentSlotValue *)self payloadFilePropertyValues];
    id v205 = [v4 payloadFilePropertyValues];
    int v206 = [v204 isEqual:v205];

    if (!v206) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadFinancialAccountValues];
  unsigned int v6 = [v4 payloadFinancialAccountValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v207 = [(_INPBIntentSlotValue *)self payloadFinancialAccountValues];
  if (v207)
  {
    uint64_t v208 = (void *)v207;
    v209 = [(_INPBIntentSlotValue *)self payloadFinancialAccountValues];
    v210 = [v4 payloadFinancialAccountValues];
    int v211 = [v209 isEqual:v210];

    if (!v211) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadGeographicalFeatures];
  unsigned int v6 = [v4 payloadGeographicalFeatures];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v212 = [(_INPBIntentSlotValue *)self payloadGeographicalFeatures];
  if (v212)
  {
    uint64_t v213 = (void *)v212;
    uint64_t v214 = [(_INPBIntentSlotValue *)self payloadGeographicalFeatures];
    uint64_t v215 = [v4 payloadGeographicalFeatures];
    int v216 = [v214 isEqual:v215];

    if (!v216) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadGeographicalFeatureLists];
  unsigned int v6 = [v4 payloadGeographicalFeatureLists];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v217 = [(_INPBIntentSlotValue *)self payloadGeographicalFeatureLists];
  if (v217)
  {
    v218 = (void *)v217;
    id v219 = [(_INPBIntentSlotValue *)self payloadGeographicalFeatureLists];
    uint64_t v220 = [v4 payloadGeographicalFeatureLists];
    int v221 = [v219 isEqual:v220];

    if (!v221) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadGetSettingResponseDatas];
  unsigned int v6 = [v4 payloadGetSettingResponseDatas];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v222 = [(_INPBIntentSlotValue *)self payloadGetSettingResponseDatas];
  if (v222)
  {
    v223 = (void *)v222;
    v224 = [(_INPBIntentSlotValue *)self payloadGetSettingResponseDatas];
    v225 = [v4 payloadGetSettingResponseDatas];
    int v226 = [v224 isEqual:v225];

    if (!v226) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadHomeAttributes];
  unsigned int v6 = [v4 payloadHomeAttributes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v227 = [(_INPBIntentSlotValue *)self payloadHomeAttributes];
  if (v227)
  {
    v228 = (void *)v227;
    v229 = [(_INPBIntentSlotValue *)self payloadHomeAttributes];
    id v230 = [v4 payloadHomeAttributes];
    int v231 = [v229 isEqual:v230];

    if (!v231) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadHomeAttributeValues];
  unsigned int v6 = [v4 payloadHomeAttributeValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v232 = [(_INPBIntentSlotValue *)self payloadHomeAttributeValues];
  if (v232)
  {
    uint64_t v233 = (void *)v232;
    v234 = [(_INPBIntentSlotValue *)self payloadHomeAttributeValues];
    v235 = [v4 payloadHomeAttributeValues];
    int v236 = [v234 isEqual:v235];

    if (!v236) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual() || !PBRepeatedInt32IsEqual()) {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadHomeEntities];
  unsigned int v6 = [v4 payloadHomeEntities];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v237 = [(_INPBIntentSlotValue *)self payloadHomeEntities];
  if (v237)
  {
    uint64_t v238 = (void *)v237;
    uint64_t v239 = [(_INPBIntentSlotValue *)self payloadHomeEntities];
    uint64_t v240 = [v4 payloadHomeEntities];
    int v241 = [v239 isEqual:v240];

    if (!v241) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadHomeFilters];
  unsigned int v6 = [v4 payloadHomeFilters];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v242 = [(_INPBIntentSlotValue *)self payloadHomeFilters];
  if (v242)
  {
    v243 = (void *)v242;
    id v244 = [(_INPBIntentSlotValue *)self payloadHomeFilters];
    uint64_t v245 = [v4 payloadHomeFilters];
    int v246 = [v244 isEqual:v245];

    if (!v246) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadHomeUserTasks];
  unsigned int v6 = [v4 payloadHomeUserTasks];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v247 = [(_INPBIntentSlotValue *)self payloadHomeUserTasks];
  if (v247)
  {
    v248 = (void *)v247;
    v249 = [(_INPBIntentSlotValue *)self payloadHomeUserTasks];
    v250 = [v4 payloadHomeUserTasks];
    int v251 = [v249 isEqual:v250];

    if (!v251) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadIntegerLists];
  unsigned int v6 = [v4 payloadIntegerLists];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v252 = [(_INPBIntentSlotValue *)self payloadIntegerLists];
  if (v252)
  {
    uint64_t v253 = (void *)v252;
    uint64_t v254 = [(_INPBIntentSlotValue *)self payloadIntegerLists];
    v255 = [v4 payloadIntegerLists];
    int v256 = [v254 isEqual:v255];

    if (!v256) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadIntegerValues];
  unsigned int v6 = [v4 payloadIntegerValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v257 = [(_INPBIntentSlotValue *)self payloadIntegerValues];
  if (v257)
  {
    id v258 = (void *)v257;
    uint64_t v259 = [(_INPBIntentSlotValue *)self payloadIntegerValues];
    uint64_t v260 = [v4 payloadIntegerValues];
    int v261 = [v259 isEqual:v260];

    if (!v261) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadIntents];
  unsigned int v6 = [v4 payloadIntents];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v262 = [(_INPBIntentSlotValue *)self payloadIntents];
  if (v262)
  {
    v263 = (void *)v262;
    v264 = [(_INPBIntentSlotValue *)self payloadIntents];
    unint64_t v265 = [v4 payloadIntents];
    int v266 = [v264 isEqual:v265];

    if (!v266) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadIntentExecutionResults];
  unsigned int v6 = [v4 payloadIntentExecutionResults];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v267 = [(_INPBIntentSlotValue *)self payloadIntentExecutionResults];
  if (v267)
  {
    v268 = (void *)v267;
    id v269 = [(_INPBIntentSlotValue *)self payloadIntentExecutionResults];
    uint64_t v270 = [v4 payloadIntentExecutionResults];
    int v271 = [v269 isEqual:v270];

    if (!v271) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadLocations];
  unsigned int v6 = [v4 payloadLocations];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v272 = [(_INPBIntentSlotValue *)self payloadLocations];
  if (v272)
  {
    v273 = (void *)v272;
    v274 = [(_INPBIntentSlotValue *)self payloadLocations];
    v275 = [v4 payloadLocations];
    int v276 = [v274 isEqual:v275];

    if (!v276) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadLocationLists];
  unsigned int v6 = [v4 payloadLocationLists];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v277 = [(_INPBIntentSlotValue *)self payloadLocationLists];
  if (v277)
  {
    uint64_t v278 = (void *)v277;
    uint64_t v279 = [(_INPBIntentSlotValue *)self payloadLocationLists];
    v280 = [v4 payloadLocationLists];
    int v281 = [v279 isEqual:v280];

    if (!v281) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadLongLists];
  unsigned int v6 = [v4 payloadLongLists];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v282 = [(_INPBIntentSlotValue *)self payloadLongLists];
  if (v282)
  {
    id v283 = (void *)v282;
    uint64_t v284 = [(_INPBIntentSlotValue *)self payloadLongLists];
    uint64_t v285 = [v4 payloadLongLists];
    int v286 = [v284 isEqual:v285];

    if (!v286) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadLongValues];
  unsigned int v6 = [v4 payloadLongValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v287 = [(_INPBIntentSlotValue *)self payloadLongValues];
  if (v287)
  {
    v288 = (void *)v287;
    v289 = [(_INPBIntentSlotValue *)self payloadLongValues];
    id v290 = [v4 payloadLongValues];
    int v291 = [v289 isEqual:v290];

    if (!v291) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadMassValues];
  unsigned int v6 = [v4 payloadMassValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v292 = [(_INPBIntentSlotValue *)self payloadMassValues];
  if (v292)
  {
    uint64_t v293 = (void *)v292;
    v294 = [(_INPBIntentSlotValue *)self payloadMassValues];
    v295 = [v4 payloadMassValues];
    int v296 = [v294 isEqual:v295];

    if (!v296) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadMediaDestinations];
  unsigned int v6 = [v4 payloadMediaDestinations];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v297 = [(_INPBIntentSlotValue *)self payloadMediaDestinations];
  if (v297)
  {
    uint64_t v298 = (void *)v297;
    uint64_t v299 = [(_INPBIntentSlotValue *)self payloadMediaDestinations];
    uint64_t v300 = [v4 payloadMediaDestinations];
    int v301 = [v299 isEqual:v300];

    if (!v301) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadMediaItemGroups];
  unsigned int v6 = [v4 payloadMediaItemGroups];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v302 = [(_INPBIntentSlotValue *)self payloadMediaItemGroups];
  if (v302)
  {
    v303 = (void *)v302;
    id v304 = [(_INPBIntentSlotValue *)self payloadMediaItemGroups];
    uint64_t v305 = [v4 payloadMediaItemGroups];
    int v306 = [v304 isEqual:v305];

    if (!v306) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadMediaItemValues];
  unsigned int v6 = [v4 payloadMediaItemValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v307 = [(_INPBIntentSlotValue *)self payloadMediaItemValues];
  if (v307)
  {
    v308 = (void *)v307;
    v309 = [(_INPBIntentSlotValue *)self payloadMediaItemValues];
    v310 = [v4 payloadMediaItemValues];
    int v311 = [v309 isEqual:v310];

    if (!v311) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadMediaSearchs];
  unsigned int v6 = [v4 payloadMediaSearchs];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v312 = [(_INPBIntentSlotValue *)self payloadMediaSearchs];
  if (v312)
  {
    id v313 = (void *)v312;
    uint64_t v314 = [(_INPBIntentSlotValue *)self payloadMediaSearchs];
    uint64_t v315 = [v4 payloadMediaSearchs];
    int v316 = [v314 isEqual:v315];

    if (!v316) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadModifyNicknames];
  unsigned int v6 = [v4 payloadModifyNicknames];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v317 = [(_INPBIntentSlotValue *)self payloadModifyNicknames];
  if (v317)
  {
    v318 = (void *)v317;
    v319 = [(_INPBIntentSlotValue *)self payloadModifyNicknames];
    unint64_t v320 = [v4 payloadModifyNicknames];
    int v321 = [v319 isEqual:v320];

    if (!v321) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadModifyRelationships];
  unsigned int v6 = [v4 payloadModifyRelationships];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v322 = [(_INPBIntentSlotValue *)self payloadModifyRelationships];
  if (v322)
  {
    v323 = (void *)v322;
    id v324 = [(_INPBIntentSlotValue *)self payloadModifyRelationships];
    uint64_t v325 = [v4 payloadModifyRelationships];
    int v326 = [v324 isEqual:v325];

    if (!v326) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadNotes];
  unsigned int v6 = [v4 payloadNotes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v327 = [(_INPBIntentSlotValue *)self payloadNotes];
  if (v327)
  {
    v328 = (void *)v327;
    v329 = [(_INPBIntentSlotValue *)self payloadNotes];
    v330 = [v4 payloadNotes];
    int v331 = [v329 isEqual:v330];

    if (!v331) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadNoteContents];
  unsigned int v6 = [v4 payloadNoteContents];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v332 = [(_INPBIntentSlotValue *)self payloadNoteContents];
  if (v332)
  {
    uint64_t v333 = (void *)v332;
    uint64_t v334 = [(_INPBIntentSlotValue *)self payloadNoteContents];
    v335 = [v4 payloadNoteContents];
    int v336 = [v334 isEqual:v335];

    if (!v336) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual() || !PBRepeatedInt32IsEqual()) {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadNumericSettingValues];
  unsigned int v6 = [v4 payloadNumericSettingValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v337 = [(_INPBIntentSlotValue *)self payloadNumericSettingValues];
  if (v337)
  {
    id v338 = (void *)v337;
    uint64_t v339 = [(_INPBIntentSlotValue *)self payloadNumericSettingValues];
    uint64_t v340 = [v4 payloadNumericSettingValues];
    int v341 = [v339 isEqual:v340];

    if (!v341) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual() || !PBRepeatedInt32IsEqual()) {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadPaymentAmountValues];
  unsigned int v6 = [v4 payloadPaymentAmountValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v342 = [(_INPBIntentSlotValue *)self payloadPaymentAmountValues];
  if (v342)
  {
    v343 = (void *)v342;
    v344 = [(_INPBIntentSlotValue *)self payloadPaymentAmountValues];
    unint64_t v345 = [v4 payloadPaymentAmountValues];
    int v346 = [v344 isEqual:v345];

    if (!v346) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadPaymentMethodLists];
  unsigned int v6 = [v4 payloadPaymentMethodLists];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v347 = [(_INPBIntentSlotValue *)self payloadPaymentMethodLists];
  if (v347)
  {
    v348 = (void *)v347;
    id v349 = [(_INPBIntentSlotValue *)self payloadPaymentMethodLists];
    uint64_t v350 = [v4 payloadPaymentMethodLists];
    int v351 = [v349 isEqual:v350];

    if (!v351) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadPaymentMethodValues];
  unsigned int v6 = [v4 payloadPaymentMethodValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v352 = [(_INPBIntentSlotValue *)self payloadPaymentMethodValues];
  if (v352)
  {
    v353 = (void *)v352;
    v354 = [(_INPBIntentSlotValue *)self payloadPaymentMethodValues];
    v355 = [v4 payloadPaymentMethodValues];
    int v356 = [v354 isEqual:v355];

    if (!v356) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadPlaces];
  unsigned int v6 = [v4 payloadPlaces];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v357 = [(_INPBIntentSlotValue *)self payloadPlaces];
  if (v357)
  {
    v358 = (void *)v357;
    v359 = [(_INPBIntentSlotValue *)self payloadPlaces];
    unint64_t v360 = [v4 payloadPlaces];
    int v361 = [v359 isEqual:v360];

    if (!v361) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadPlaceLists];
  unsigned int v6 = [v4 payloadPlaceLists];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v362 = [(_INPBIntentSlotValue *)self payloadPlaceLists];
  if (v362)
  {
    v363 = (void *)v362;
    id v364 = [(_INPBIntentSlotValue *)self payloadPlaceLists];
    uint64_t v365 = [v4 payloadPlaceLists];
    int v366 = [v364 isEqual:v365];

    if (!v366) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadPrimitiveBools];
  unsigned int v6 = [v4 payloadPrimitiveBools];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v367 = [(_INPBIntentSlotValue *)self payloadPrimitiveBools];
  if (v367)
  {
    v368 = (void *)v367;
    v369 = [(_INPBIntentSlotValue *)self payloadPrimitiveBools];
    v370 = [v4 payloadPrimitiveBools];
    int v371 = [v369 isEqual:v370];

    if (!v371) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadPrimitiveDoubles];
  unsigned int v6 = [v4 payloadPrimitiveDoubles];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v372 = [(_INPBIntentSlotValue *)self payloadPrimitiveDoubles];
  if (v372)
  {
    v373 = (void *)v372;
    v374 = [(_INPBIntentSlotValue *)self payloadPrimitiveDoubles];
    unint64_t v375 = [v4 payloadPrimitiveDoubles];
    int v376 = [v374 isEqual:v375];

    if (!v376) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadPrimitiveInts];
  unsigned int v6 = [v4 payloadPrimitiveInts];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v377 = [(_INPBIntentSlotValue *)self payloadPrimitiveInts];
  if (v377)
  {
    v378 = (void *)v377;
    unint64_t v379 = [(_INPBIntentSlotValue *)self payloadPrimitiveInts];
    uint64_t v380 = [v4 payloadPrimitiveInts];
    int v381 = [v379 isEqual:v380];

    if (!v381) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadPrimitiveLongs];
  unsigned int v6 = [v4 payloadPrimitiveLongs];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v382 = [(_INPBIntentSlotValue *)self payloadPrimitiveLongs];
  if (v382)
  {
    id v383 = (void *)v382;
    uint64_t v384 = [(_INPBIntentSlotValue *)self payloadPrimitiveLongs];
    uint64_t v385 = [v4 payloadPrimitiveLongs];
    int v386 = [v384 isEqual:v385];

    if (!v386) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadPrimitiveStrings];
  unsigned int v6 = [v4 payloadPrimitiveStrings];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v387 = [(_INPBIntentSlotValue *)self payloadPrimitiveStrings];
  if (v387)
  {
    v388 = (void *)v387;
    v389 = [(_INPBIntentSlotValue *)self payloadPrimitiveStrings];
    id v390 = [v4 payloadPrimitiveStrings];
    int v391 = [v389 isEqual:v390];

    if (!v391) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadPrivateAddMediaIntentDatas];
  unsigned int v6 = [v4 payloadPrivateAddMediaIntentDatas];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v392 = [(_INPBIntentSlotValue *)self payloadPrivateAddMediaIntentDatas];
  if (v392)
  {
    uint64_t v393 = (void *)v392;
    v394 = [(_INPBIntentSlotValue *)self payloadPrivateAddMediaIntentDatas];
    v395 = [v4 payloadPrivateAddMediaIntentDatas];
    int v396 = [v394 isEqual:v395];

    if (!v396) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadPrivatePlayMediaIntentDatas];
  unsigned int v6 = [v4 payloadPrivatePlayMediaIntentDatas];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v397 = [(_INPBIntentSlotValue *)self payloadPrivatePlayMediaIntentDatas];
  if (v397)
  {
    uint64_t v398 = (void *)v397;
    uint64_t v399 = [(_INPBIntentSlotValue *)self payloadPrivatePlayMediaIntentDatas];
    uint64_t v400 = [v4 payloadPrivatePlayMediaIntentDatas];
    int v401 = [v399 isEqual:v400];

    if (!v401) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadPrivateSearchForMediaIntentDatas];
  unsigned int v6 = [v4 payloadPrivateSearchForMediaIntentDatas];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v402 = [(_INPBIntentSlotValue *)self payloadPrivateSearchForMediaIntentDatas];
  if (v402)
  {
    v403 = (void *)v402;
    id v404 = [(_INPBIntentSlotValue *)self payloadPrivateSearchForMediaIntentDatas];
    uint64_t v405 = [v4 payloadPrivateSearchForMediaIntentDatas];
    int v406 = [v404 isEqual:v405];

    if (!v406) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadPrivateUpdateMediaAffinityIntentDatas];
  unsigned int v6 = [v4 payloadPrivateUpdateMediaAffinityIntentDatas];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v407 = [(_INPBIntentSlotValue *)self payloadPrivateUpdateMediaAffinityIntentDatas];
  if (v407)
  {
    v408 = (void *)v407;
    v409 = [(_INPBIntentSlotValue *)self payloadPrivateUpdateMediaAffinityIntentDatas];
    v410 = [v4 payloadPrivateUpdateMediaAffinityIntentDatas];
    int v411 = [v409 isEqual:v410];

    if (!v411) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadSendMessageAttachments];
  unsigned int v6 = [v4 payloadSendMessageAttachments];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v412 = [(_INPBIntentSlotValue *)self payloadSendMessageAttachments];
  if (v412)
  {
    uint64_t v413 = (void *)v412;
    uint64_t v414 = [(_INPBIntentSlotValue *)self payloadSendMessageAttachments];
    v415 = [v4 payloadSendMessageAttachments];
    int v416 = [v414 isEqual:v415];

    if (!v416) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadSettingMetadatas];
  unsigned int v6 = [v4 payloadSettingMetadatas];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v417 = [(_INPBIntentSlotValue *)self payloadSettingMetadatas];
  if (v417)
  {
    unint64_t v418 = (void *)v417;
    uint64_t v419 = [(_INPBIntentSlotValue *)self payloadSettingMetadatas];
    v420 = [v4 payloadSettingMetadatas];
    int v421 = [v419 isEqual:v420];

    if (!v421) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadShareDestinations];
  unsigned int v6 = [v4 payloadShareDestinations];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v422 = [(_INPBIntentSlotValue *)self payloadShareDestinations];
  if (v422)
  {
    uint64_t v423 = (void *)v422;
    uint64_t v424 = [(_INPBIntentSlotValue *)self payloadShareDestinations];
    uint64_t v425 = [v4 payloadShareDestinations];
    int v426 = [v424 isEqual:v425];

    if (!v426) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadSleepAlarmAttributes];
  unsigned int v6 = [v4 payloadSleepAlarmAttributes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v427 = [(_INPBIntentSlotValue *)self payloadSleepAlarmAttributes];
  if (v427)
  {
    v428 = (void *)v427;
    unint64_t v429 = [(_INPBIntentSlotValue *)self payloadSleepAlarmAttributes];
    uint64_t v430 = [v4 payloadSleepAlarmAttributes];
    int v431 = [v429 isEqual:v430];

    if (!v431) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadSpatialEventTriggers];
  unsigned int v6 = [v4 payloadSpatialEventTriggers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v432 = [(_INPBIntentSlotValue *)self payloadSpatialEventTriggers];
  if (v432)
  {
    unint64_t v433 = (void *)v432;
    uint64_t v434 = [(_INPBIntentSlotValue *)self payloadSpatialEventTriggers];
    v435 = [v4 payloadSpatialEventTriggers];
    int v436 = [v434 isEqual:v435];

    if (!v436) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadSpeedValues];
  unsigned int v6 = [v4 payloadSpeedValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v437 = [(_INPBIntentSlotValue *)self payloadSpeedValues];
  if (v437)
  {
    uint64_t v438 = (void *)v437;
    uint64_t v439 = [(_INPBIntentSlotValue *)self payloadSpeedValues];
    uint64_t v440 = [v4 payloadSpeedValues];
    int v441 = [v439 isEqual:v440];

    if (!v441) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadStartCallRequestMetadatas];
  unsigned int v6 = [v4 payloadStartCallRequestMetadatas];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v442 = [(_INPBIntentSlotValue *)self payloadStartCallRequestMetadatas];
  if (v442)
  {
    v443 = (void *)v442;
    unint64_t v444 = [(_INPBIntentSlotValue *)self payloadStartCallRequestMetadatas];
    uint64_t v445 = [v4 payloadStartCallRequestMetadatas];
    int v446 = [v444 isEqual:v445];

    if (!v446) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadStringLists];
  unsigned int v6 = [v4 payloadStringLists];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v447 = [(_INPBIntentSlotValue *)self payloadStringLists];
  if (v447)
  {
    id v448 = (void *)v447;
    uint64_t v449 = [(_INPBIntentSlotValue *)self payloadStringLists];
    uint64_t v450 = [v4 payloadStringLists];
    int v451 = [v449 isEqual:v450];

    if (!v451) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadStringValues];
  unsigned int v6 = [v4 payloadStringValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v452 = [(_INPBIntentSlotValue *)self payloadStringValues];
  if (v452)
  {
    v453 = (void *)v452;
    v454 = [(_INPBIntentSlotValue *)self payloadStringValues];
    id v455 = [v4 payloadStringValues];
    int v456 = [v454 isEqual:v455];

    if (!v456) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadSupportedTrafficIncidentTypes];
  unsigned int v6 = [v4 payloadSupportedTrafficIncidentTypes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v457 = [(_INPBIntentSlotValue *)self payloadSupportedTrafficIncidentTypes];
  if (v457)
  {
    uint64_t v458 = (void *)v457;
    v459 = [(_INPBIntentSlotValue *)self payloadSupportedTrafficIncidentTypes];
    v460 = [v4 payloadSupportedTrafficIncidentTypes];
    int v461 = [v459 isEqual:v460];

    if (!v461) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadTasks];
  unsigned int v6 = [v4 payloadTasks];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v462 = [(_INPBIntentSlotValue *)self payloadTasks];
  if (v462)
  {
    uint64_t v463 = (void *)v462;
    uint64_t v464 = [(_INPBIntentSlotValue *)self payloadTasks];
    uint64_t v465 = [v4 payloadTasks];
    int v466 = [v464 isEqual:v465];

    if (!v466) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadTaskLists];
  unsigned int v6 = [v4 payloadTaskLists];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v467 = [(_INPBIntentSlotValue *)self payloadTaskLists];
  if (v467)
  {
    v468 = (void *)v467;
    id v469 = [(_INPBIntentSlotValue *)self payloadTaskLists];
    uint64_t v470 = [v4 payloadTaskLists];
    int v471 = [v469 isEqual:v470];

    if (!v471) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadTemperatureLists];
  unsigned int v6 = [v4 payloadTemperatureLists];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v472 = [(_INPBIntentSlotValue *)self payloadTemperatureLists];
  if (v472)
  {
    v473 = (void *)v472;
    v474 = [(_INPBIntentSlotValue *)self payloadTemperatureLists];
    v475 = [v4 payloadTemperatureLists];
    int v476 = [v474 isEqual:v475];

    if (!v476) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadTemperatureValues];
  unsigned int v6 = [v4 payloadTemperatureValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v477 = [(_INPBIntentSlotValue *)self payloadTemperatureValues];
  if (v477)
  {
    uint64_t v478 = (void *)v477;
    uint64_t v479 = [(_INPBIntentSlotValue *)self payloadTemperatureValues];
    v480 = [v4 payloadTemperatureValues];
    int v481 = [v479 isEqual:v480];

    if (!v481) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadTemporalEventTriggers];
  unsigned int v6 = [v4 payloadTemporalEventTriggers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v482 = [(_INPBIntentSlotValue *)self payloadTemporalEventTriggers];
  if (v482)
  {
    id v483 = (void *)v482;
    uint64_t v484 = [(_INPBIntentSlotValue *)self payloadTemporalEventTriggers];
    uint64_t v485 = [v4 payloadTemporalEventTriggers];
    int v486 = [v484 isEqual:v485];

    if (!v486) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadTimers];
  unsigned int v6 = [v4 payloadTimers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v487 = [(_INPBIntentSlotValue *)self payloadTimers];
  if (v487)
  {
    v488 = (void *)v487;
    v489 = [(_INPBIntentSlotValue *)self payloadTimers];
    id v490 = [v4 payloadTimers];
    int v491 = [v489 isEqual:v490];

    if (!v491) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual() || !PBRepeatedInt32IsEqual()) {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadURLValues];
  unsigned int v6 = [v4 payloadURLValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v492 = [(_INPBIntentSlotValue *)self payloadURLValues];
  if (v492)
  {
    uint64_t v493 = (void *)v492;
    v494 = [(_INPBIntentSlotValue *)self payloadURLValues];
    v495 = [v4 payloadURLValues];
    int v496 = [v494 isEqual:v495];

    if (!v496) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadVoiceCommandDeviceInformations];
  unsigned int v6 = [v4 payloadVoiceCommandDeviceInformations];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v497 = [(_INPBIntentSlotValue *)self payloadVoiceCommandDeviceInformations];
  if (v497)
  {
    uint64_t v498 = (void *)v497;
    uint64_t v499 = [(_INPBIntentSlotValue *)self payloadVoiceCommandDeviceInformations];
    uint64_t v500 = [v4 payloadVoiceCommandDeviceInformations];
    int v501 = [v499 isEqual:v500];

    if (!v501) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadVolumeValues];
  unsigned int v6 = [v4 payloadVolumeValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v502 = [(_INPBIntentSlotValue *)self payloadVolumeValues];
  if (v502)
  {
    v503 = (void *)v502;
    unint64_t v504 = [(_INPBIntentSlotValue *)self payloadVolumeValues];
    int v505 = [v4 payloadVolumeValues];
    int v506 = [v504 isEqual:v505];

    if (!v506) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadWellnessMetadataPairs];
  unsigned int v6 = [v4 payloadWellnessMetadataPairs];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v507 = [(_INPBIntentSlotValue *)self payloadWellnessMetadataPairs];
  if (v507)
  {
    id v508 = (void *)v507;
    uint64_t v509 = [(_INPBIntentSlotValue *)self payloadWellnessMetadataPairs];
    uint64_t v510 = [v4 payloadWellnessMetadataPairs];
    int v511 = [v509 isEqual:v510];

    if (!v511) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadWellnessObjectResultValues];
  unsigned int v6 = [v4 payloadWellnessObjectResultValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v512 = [(_INPBIntentSlotValue *)self payloadWellnessObjectResultValues];
  if (v512)
  {
    v513 = (void *)v512;
    v514 = [(_INPBIntentSlotValue *)self payloadWellnessObjectResultValues];
    id v515 = [v4 payloadWellnessObjectResultValues];
    int v516 = [v514 isEqual:v515];

    if (!v516) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_595;
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadWellnessUnitTypes];
  unsigned int v6 = [v4 payloadWellnessUnitTypes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v517 = [(_INPBIntentSlotValue *)self payloadWellnessUnitTypes];
  if (v517)
  {
    uint64_t v518 = (void *)v517;
    v519 = [(_INPBIntentSlotValue *)self payloadWellnessUnitTypes];
    v520 = [v4 payloadWellnessUnitTypes];
    int v521 = [v519 isEqual:v520];

    if (!v521) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadWellnessValues];
  unsigned int v6 = [v4 payloadWellnessValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v522 = [(_INPBIntentSlotValue *)self payloadWellnessValues];
  if (v522)
  {
    uint64_t v523 = (void *)v522;
    uint64_t v524 = [(_INPBIntentSlotValue *)self payloadWellnessValues];
    uint64_t v525 = [v4 payloadWellnessValues];
    int v526 = [v524 isEqual:v525];

    if (!v526) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadWorkoutAssociatedItems];
  unsigned int v6 = [v4 payloadWorkoutAssociatedItems];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_594;
  }
  uint64_t v527 = [(_INPBIntentSlotValue *)self payloadWorkoutAssociatedItems];
  if (v527)
  {
    v528 = (void *)v527;
    unint64_t v529 = [(_INPBIntentSlotValue *)self payloadWorkoutAssociatedItems];
    uint64_t v530 = [v4 payloadWorkoutAssociatedItems];
    int v531 = [v529 isEqual:v530];

    if (!v531) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBIntentSlotValue *)self payloadWorkoutCustomizations];
  unsigned int v6 = [v4 payloadWorkoutCustomizations];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_594:

    goto LABEL_595;
  }
  uint64_t v532 = [(_INPBIntentSlotValue *)self payloadWorkoutCustomizations];
  if (v532)
  {
    id v533 = (void *)v532;
    uint64_t v534 = [(_INPBIntentSlotValue *)self payloadWorkoutCustomizations];
    uint64_t v535 = [v4 payloadWorkoutCustomizations];
    int v536 = [v534 isEqual:v535];

    if (!v536) {
      goto LABEL_595;
    }
  }
  else
  {
  }
  if (PBRepeatedInt32IsEqual())
  {
    if (PBRepeatedInt32IsEqual())
    {
      if (PBRepeatedInt32IsEqual())
      {
        int v539 = [(_INPBIntentSlotValue *)self hasType];
        if (v539 == [v4 hasType])
        {
          if (![(_INPBIntentSlotValue *)self hasType]
            || ![v4 hasType]
            || (int type = self->_type, type == [v4 type]))
          {
            BOOL v537 = 1;
            goto LABEL_596;
          }
        }
      }
    }
  }
LABEL_595:
  BOOL v537 = 0;
LABEL_596:

  return v537;
}

- (void)writeTo:(id)a3
{
  uint64_t v1131 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_payloadAccountTypes.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_payloadAccountTypes.count);
  }
  long long v1024 = 0u;
  long long v1023 = 0u;
  long long v1022 = 0u;
  long long v1021 = 0u;
  unsigned int v6 = self->_payloadActivities;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v1021 objects:v1130 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v1022;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v1022 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v1021 objects:v1130 count:16];
    }
    while (v8);
  }

  long long v1020 = 0u;
  long long v1019 = 0u;
  long long v1018 = 0u;
  long long v1017 = 0u;
  int v11 = self->_payloadActivityLists;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v1017 objects:v1129 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v1018;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v1018 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v1017 objects:v1129 count:16];
    }
    while (v13);
  }

  long long v1016 = 0u;
  long long v1015 = 0u;
  long long v1014 = 0u;
  long long v1013 = 0u;
  int v16 = self->_payloadAlarms;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v1013 objects:v1128 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v1014;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v1014 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v1013 objects:v1128 count:16];
    }
    while (v18);
  }

  if (self->_payloadAlarmPeriods.count)
  {
    unint64_t v21 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v21;
    }
    while (v21 < self->_payloadAlarmPeriods.count);
  }
  if (self->_payloadAlarmRepeatSchedules.count)
  {
    unint64_t v22 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v22;
    }
    while (v22 < self->_payloadAlarmRepeatSchedules.count);
  }
  long long v1012 = 0u;
  long long v1011 = 0u;
  long long v1010 = 0u;
  long long v1009 = 0u;
  id v23 = self->_payloadAlarmSearchs;
  uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v1009 objects:v1127 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v1010;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v1010 != v26) {
          objc_enumerationMutation(v23);
        }
        PBDataWriterWriteSubmessage();
        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [(NSArray *)v23 countByEnumeratingWithState:&v1009 objects:v1127 count:16];
    }
    while (v25);
  }

  if (self->_payloadAlarmSearchTypes.count)
  {
    unint64_t v28 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v28;
    }
    while (v28 < self->_payloadAlarmSearchTypes.count);
  }
  long long v1008 = 0u;
  long long v1007 = 0u;
  long long v1006 = 0u;
  long long v1005 = 0u;
  v29 = self->_payloadAnnouncements;
  uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v1005 objects:v1126 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v1006;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v1006 != v32) {
          objc_enumerationMutation(v29);
        }
        PBDataWriterWriteSubmessage();
        ++v33;
      }
      while (v31 != v33);
      uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v1005 objects:v1126 count:16];
    }
    while (v31);
  }

  long long v1004 = 0u;
  long long v1003 = 0u;
  long long v1002 = 0u;
  long long v1001 = 0u;
  unint64_t v34 = self->_payloadAppIdentifiers;
  uint64_t v35 = [(NSArray *)v34 countByEnumeratingWithState:&v1001 objects:v1125 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v1002;
    do
    {
      uint64_t v38 = 0;
      do
      {
        if (*(void *)v1002 != v37) {
          objc_enumerationMutation(v34);
        }
        PBDataWriterWriteSubmessage();
        ++v38;
      }
      while (v36 != v38);
      uint64_t v36 = [(NSArray *)v34 countByEnumeratingWithState:&v1001 objects:v1125 count:16];
    }
    while (v36);
  }

  long long v1000 = 0u;
  long long v999 = 0u;
  long long v998 = 0u;
  long long v997 = 0u;
  uint64_t v39 = self->_payloadArchivedObjects;
  uint64_t v40 = [(NSArray *)v39 countByEnumeratingWithState:&v997 objects:v1124 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v998;
    do
    {
      uint64_t v43 = 0;
      do
      {
        if (*(void *)v998 != v42) {
          objc_enumerationMutation(v39);
        }
        PBDataWriterWriteSubmessage();
        ++v43;
      }
      while (v41 != v43);
      uint64_t v41 = [(NSArray *)v39 countByEnumeratingWithState:&v997 objects:v1124 count:16];
    }
    while (v41);
  }

  if (self->_payloadBalanceTypes.count)
  {
    unint64_t v44 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v44;
    }
    while (v44 < self->_payloadBalanceTypes.count);
  }
  long long v996 = 0u;
  long long v995 = 0u;
  long long v994 = 0u;
  long long v993 = 0u;
  unint64_t v45 = self->_payloadBillDetailsValues;
  uint64_t v46 = [(NSArray *)v45 countByEnumeratingWithState:&v993 objects:v1123 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v994;
    do
    {
      uint64_t v49 = 0;
      do
      {
        if (*(void *)v994 != v48) {
          objc_enumerationMutation(v45);
        }
        PBDataWriterWriteSubmessage();
        ++v49;
      }
      while (v47 != v49);
      uint64_t v47 = [(NSArray *)v45 countByEnumeratingWithState:&v993 objects:v1123 count:16];
    }
    while (v47);
  }

  long long v992 = 0u;
  long long v991 = 0u;
  long long v990 = 0u;
  long long v989 = 0u;
  uint64_t v50 = self->_payloadBillPayeeValues;
  uint64_t v51 = [(NSArray *)v50 countByEnumeratingWithState:&v989 objects:v1122 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v990;
    do
    {
      uint64_t v54 = 0;
      do
      {
        if (*(void *)v990 != v53) {
          objc_enumerationMutation(v50);
        }
        PBDataWriterWriteSubmessage();
        ++v54;
      }
      while (v52 != v54);
      uint64_t v52 = [(NSArray *)v50 countByEnumeratingWithState:&v989 objects:v1122 count:16];
    }
    while (v52);
  }

  if (self->_payloadBillTypes.count)
  {
    unint64_t v55 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v55;
    }
    while (v55 < self->_payloadBillTypes.count);
  }
  if (self->_payloadBinarySettingValues.count)
  {
    unint64_t v56 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v56;
    }
    while (v56 < self->_payloadBinarySettingValues.count);
  }
  if (self->_payloadBoundedSettingValues.count)
  {
    unint64_t v57 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v57;
    }
    while (v57 < self->_payloadBoundedSettingValues.count);
  }
  long long v988 = 0u;
  long long v987 = 0u;
  long long v986 = 0u;
  long long v985 = 0u;
  uint64_t v58 = self->_payloadCalendarEvents;
  uint64_t v59 = [(NSArray *)v58 countByEnumeratingWithState:&v985 objects:v1121 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v986;
    do
    {
      uint64_t v62 = 0;
      do
      {
        if (*(void *)v986 != v61) {
          objc_enumerationMutation(v58);
        }
        PBDataWriterWriteSubmessage();
        ++v62;
      }
      while (v60 != v62);
      uint64_t v60 = [(NSArray *)v58 countByEnumeratingWithState:&v985 objects:v1121 count:16];
    }
    while (v60);
  }

  if (self->_payloadCallAudioRoutes.count)
  {
    unint64_t v63 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v63;
    }
    while (v63 < self->_payloadCallAudioRoutes.count);
  }
  if (self->_payloadCallCapabilities.count)
  {
    unint64_t v64 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v64;
    }
    while (v64 < self->_payloadCallCapabilities.count);
  }
  if (self->_payloadCallDestinationTypes.count)
  {
    unint64_t v65 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v65;
    }
    while (v65 < self->_payloadCallDestinationTypes.count);
  }
  long long v984 = 0u;
  long long v983 = 0u;
  long long v982 = 0u;
  long long v981 = 0u;
  int v66 = self->_payloadCallGroups;
  uint64_t v67 = [(NSArray *)v66 countByEnumeratingWithState:&v981 objects:v1120 count:16];
  if (v67)
  {
    uint64_t v68 = v67;
    uint64_t v69 = *(void *)v982;
    do
    {
      uint64_t v70 = 0;
      do
      {
        if (*(void *)v982 != v69) {
          objc_enumerationMutation(v66);
        }
        PBDataWriterWriteSubmessage();
        ++v70;
      }
      while (v68 != v70);
      uint64_t v68 = [(NSArray *)v66 countByEnumeratingWithState:&v981 objects:v1120 count:16];
    }
    while (v68);
  }

  long long v980 = 0u;
  long long v979 = 0u;
  long long v978 = 0u;
  long long v977 = 0u;
  int v71 = self->_payloadCallGroupConversations;
  uint64_t v72 = [(NSArray *)v71 countByEnumeratingWithState:&v977 objects:v1119 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = *(void *)v978;
    do
    {
      uint64_t v75 = 0;
      do
      {
        if (*(void *)v978 != v74) {
          objc_enumerationMutation(v71);
        }
        PBDataWriterWriteSubmessage();
        ++v75;
      }
      while (v73 != v75);
      uint64_t v73 = [(NSArray *)v71 countByEnumeratingWithState:&v977 objects:v1119 count:16];
    }
    while (v73);
  }

  long long v976 = 0u;
  long long v975 = 0u;
  long long v974 = 0u;
  long long v973 = 0u;
  int v76 = self->_payloadCallRecordFilters;
  uint64_t v77 = [(NSArray *)v76 countByEnumeratingWithState:&v973 objects:v1118 count:16];
  if (v77)
  {
    uint64_t v78 = v77;
    uint64_t v79 = *(void *)v974;
    do
    {
      uint64_t v80 = 0;
      do
      {
        if (*(void *)v974 != v79) {
          objc_enumerationMutation(v76);
        }
        PBDataWriterWriteSubmessage();
        ++v80;
      }
      while (v78 != v80);
      uint64_t v78 = [(NSArray *)v76 countByEnumeratingWithState:&v973 objects:v1118 count:16];
    }
    while (v78);
  }

  if (self->_payloadCallRecordTypes.count)
  {
    unint64_t v81 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v81;
    }
    while (v81 < self->_payloadCallRecordTypes.count);
  }
  long long v972 = 0u;
  long long v971 = 0u;
  long long v970 = 0u;
  long long v969 = 0u;
  uint64_t v82 = self->_payloadCallRecordValues;
  uint64_t v83 = [(NSArray *)v82 countByEnumeratingWithState:&v969 objects:v1117 count:16];
  if (v83)
  {
    uint64_t v84 = v83;
    uint64_t v85 = *(void *)v970;
    do
    {
      uint64_t v86 = 0;
      do
      {
        if (*(void *)v970 != v85) {
          objc_enumerationMutation(v82);
        }
        PBDataWriterWriteSubmessage();
        ++v86;
      }
      while (v84 != v86);
      uint64_t v84 = [(NSArray *)v82 countByEnumeratingWithState:&v969 objects:v1117 count:16];
    }
    while (v84);
  }

  if (self->_payloadCarAirCirculationModes.count)
  {
    unint64_t v87 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v87;
    }
    while (v87 < self->_payloadCarAirCirculationModes.count);
  }
  if (self->_payloadCarAudioSources.count)
  {
    unint64_t v88 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v88;
    }
    while (v88 < self->_payloadCarAudioSources.count);
  }
  if (self->_payloadCarDefrosters.count)
  {
    unint64_t v89 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v89;
    }
    while (v89 < self->_payloadCarDefrosters.count);
  }
  if (self->_payloadCarSeats.count)
  {
    unint64_t v90 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v90;
    }
    while (v90 < self->_payloadCarSeats.count);
  }
  if (self->_payloadCarSignalIdentifiers.count)
  {
    unint64_t v91 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v91;
    }
    while (v91 < self->_payloadCarSignalIdentifiers.count);
  }
  if (self->_payloadChangeAlarmStatusOperations.count)
  {
    unint64_t v92 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v92;
    }
    while (v92 < self->_payloadChangeAlarmStatusOperations.count);
  }
  long long v968 = 0u;
  long long v967 = 0u;
  long long v966 = 0u;
  long long v965 = 0u;
  unsigned int v93 = self->_payloadChargingConnectorTypes;
  uint64_t v94 = [(NSArray *)v93 countByEnumeratingWithState:&v965 objects:v1116 count:16];
  if (v94)
  {
    uint64_t v95 = v94;
    uint64_t v96 = *(void *)v966;
    do
    {
      uint64_t v97 = 0;
      do
      {
        if (*(void *)v966 != v96) {
          objc_enumerationMutation(v93);
        }
        PBDataWriterWriteStringField();
        ++v97;
      }
      while (v95 != v97);
      uint64_t v95 = [(NSArray *)v93 countByEnumeratingWithState:&v965 objects:v1116 count:16];
    }
    while (v95);
  }

  long long v964 = 0u;
  long long v963 = 0u;
  long long v962 = 0u;
  long long v961 = 0u;
  v98 = self->_payloadContactEventTriggers;
  uint64_t v99 = [(NSArray *)v98 countByEnumeratingWithState:&v961 objects:v1115 count:16];
  if (v99)
  {
    uint64_t v100 = v99;
    uint64_t v101 = *(void *)v962;
    do
    {
      uint64_t v102 = 0;
      do
      {
        if (*(void *)v962 != v101) {
          objc_enumerationMutation(v98);
        }
        PBDataWriterWriteSubmessage();
        ++v102;
      }
      while (v100 != v102);
      uint64_t v100 = [(NSArray *)v98 countByEnumeratingWithState:&v961 objects:v1115 count:16];
    }
    while (v100);
  }

  long long v960 = 0u;
  long long v959 = 0u;
  long long v958 = 0u;
  long long v957 = 0u;
  uint64_t v103 = self->_payloadContactLists;
  uint64_t v104 = [(NSArray *)v103 countByEnumeratingWithState:&v957 objects:v1114 count:16];
  if (v104)
  {
    uint64_t v105 = v104;
    uint64_t v106 = *(void *)v958;
    do
    {
      uint64_t v107 = 0;
      do
      {
        if (*(void *)v958 != v106) {
          objc_enumerationMutation(v103);
        }
        PBDataWriterWriteSubmessage();
        ++v107;
      }
      while (v105 != v107);
      uint64_t v105 = [(NSArray *)v103 countByEnumeratingWithState:&v957 objects:v1114 count:16];
    }
    while (v105);
  }

  long long v956 = 0u;
  long long v955 = 0u;
  long long v954 = 0u;
  long long v953 = 0u;
  unsigned int v108 = self->_payloadContactValues;
  uint64_t v109 = [(NSArray *)v108 countByEnumeratingWithState:&v953 objects:v1113 count:16];
  if (v109)
  {
    uint64_t v110 = v109;
    uint64_t v111 = *(void *)v954;
    do
    {
      uint64_t v112 = 0;
      do
      {
        if (*(void *)v954 != v111) {
          objc_enumerationMutation(v108);
        }
        PBDataWriterWriteSubmessage();
        ++v112;
      }
      while (v110 != v112);
      uint64_t v110 = [(NSArray *)v108 countByEnumeratingWithState:&v953 objects:v1113 count:16];
    }
    while (v110);
  }

  long long v952 = 0u;
  long long v951 = 0u;
  long long v950 = 0u;
  long long v949 = 0u;
  v113 = self->_payloadCurrencyAmounts;
  uint64_t v114 = [(NSArray *)v113 countByEnumeratingWithState:&v949 objects:v1112 count:16];
  if (v114)
  {
    uint64_t v115 = v114;
    uint64_t v116 = *(void *)v950;
    do
    {
      uint64_t v117 = 0;
      do
      {
        if (*(void *)v950 != v116) {
          objc_enumerationMutation(v113);
        }
        PBDataWriterWriteSubmessage();
        ++v117;
      }
      while (v115 != v117);
      uint64_t v115 = [(NSArray *)v113 countByEnumeratingWithState:&v949 objects:v1112 count:16];
    }
    while (v115);
  }

  long long v948 = 0u;
  long long v947 = 0u;
  long long v946 = 0u;
  long long v945 = 0u;
  v118 = self->_payloadCustomObjects;
  uint64_t v119 = [(NSArray *)v118 countByEnumeratingWithState:&v945 objects:v1111 count:16];
  if (v119)
  {
    uint64_t v120 = v119;
    uint64_t v121 = *(void *)v946;
    do
    {
      uint64_t v122 = 0;
      do
      {
        if (*(void *)v946 != v121) {
          objc_enumerationMutation(v118);
        }
        PBDataWriterWriteSubmessage();
        ++v122;
      }
      while (v120 != v122);
      uint64_t v120 = [(NSArray *)v118 countByEnumeratingWithState:&v945 objects:v1111 count:16];
    }
    while (v120);
  }

  long long v944 = 0u;
  long long v943 = 0u;
  long long v942 = 0u;
  long long v941 = 0u;
  v123 = self->_payloadDataStrings;
  uint64_t v124 = [(NSArray *)v123 countByEnumeratingWithState:&v941 objects:v1110 count:16];
  if (v124)
  {
    uint64_t v125 = v124;
    uint64_t v126 = *(void *)v942;
    do
    {
      uint64_t v127 = 0;
      do
      {
        if (*(void *)v942 != v126) {
          objc_enumerationMutation(v123);
        }
        PBDataWriterWriteSubmessage();
        ++v127;
      }
      while (v125 != v127);
      uint64_t v125 = [(NSArray *)v123 countByEnumeratingWithState:&v941 objects:v1110 count:16];
    }
    while (v125);
  }

  long long v940 = 0u;
  long long v939 = 0u;
  long long v938 = 0u;
  long long v937 = 0u;
  uint64_t v128 = self->_payloadDataStringLists;
  uint64_t v129 = [(NSArray *)v128 countByEnumeratingWithState:&v937 objects:v1109 count:16];
  if (v129)
  {
    uint64_t v130 = v129;
    uint64_t v131 = *(void *)v938;
    do
    {
      uint64_t v132 = 0;
      do
      {
        if (*(void *)v938 != v131) {
          objc_enumerationMutation(v128);
        }
        PBDataWriterWriteSubmessage();
        ++v132;
      }
      while (v130 != v132);
      uint64_t v130 = [(NSArray *)v128 countByEnumeratingWithState:&v937 objects:v1109 count:16];
    }
    while (v130);
  }

  if (self->_payloadDateSearchTypes.count)
  {
    unint64_t v133 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v133;
    }
    while (v133 < self->_payloadDateSearchTypes.count);
  }
  long long v936 = 0u;
  long long v935 = 0u;
  long long v934 = 0u;
  long long v933 = 0u;
  uint64_t v134 = self->_payloadDateTimeRangeLists;
  uint64_t v135 = [(NSArray *)v134 countByEnumeratingWithState:&v933 objects:v1108 count:16];
  if (v135)
  {
    uint64_t v136 = v135;
    uint64_t v137 = *(void *)v934;
    do
    {
      uint64_t v138 = 0;
      do
      {
        if (*(void *)v934 != v137) {
          objc_enumerationMutation(v134);
        }
        PBDataWriterWriteSubmessage();
        ++v138;
      }
      while (v136 != v138);
      uint64_t v136 = [(NSArray *)v134 countByEnumeratingWithState:&v933 objects:v1108 count:16];
    }
    while (v136);
  }

  long long v932 = 0u;
  long long v931 = 0u;
  long long v930 = 0u;
  long long v929 = 0u;
  v139 = self->_payloadDateTimeRangeValues;
  uint64_t v140 = [(NSArray *)v139 countByEnumeratingWithState:&v929 objects:v1107 count:16];
  if (v140)
  {
    uint64_t v141 = v140;
    uint64_t v142 = *(void *)v930;
    do
    {
      uint64_t v143 = 0;
      do
      {
        if (*(void *)v930 != v142) {
          objc_enumerationMutation(v139);
        }
        PBDataWriterWriteSubmessage();
        ++v143;
      }
      while (v141 != v143);
      uint64_t v141 = [(NSArray *)v139 countByEnumeratingWithState:&v929 objects:v1107 count:16];
    }
    while (v141);
  }

  long long v928 = 0u;
  long long v927 = 0u;
  long long v926 = 0u;
  long long v925 = 0u;
  id v144 = self->_payloadDateTimeValues;
  uint64_t v145 = [(NSArray *)v144 countByEnumeratingWithState:&v925 objects:v1106 count:16];
  if (v145)
  {
    uint64_t v146 = v145;
    uint64_t v147 = *(void *)v926;
    do
    {
      uint64_t v148 = 0;
      do
      {
        if (*(void *)v926 != v147) {
          objc_enumerationMutation(v144);
        }
        PBDataWriterWriteSubmessage();
        ++v148;
      }
      while (v146 != v148);
      uint64_t v146 = [(NSArray *)v144 countByEnumeratingWithState:&v925 objects:v1106 count:16];
    }
    while (v146);
  }

  long long v924 = 0u;
  long long v923 = 0u;
  long long v922 = 0u;
  long long v921 = 0u;
  v149 = self->_payloadDevices;
  uint64_t v150 = [(NSArray *)v149 countByEnumeratingWithState:&v921 objects:v1105 count:16];
  if (v150)
  {
    uint64_t v151 = v150;
    uint64_t v152 = *(void *)v922;
    do
    {
      uint64_t v153 = 0;
      do
      {
        if (*(void *)v922 != v152) {
          objc_enumerationMutation(v149);
        }
        PBDataWriterWriteSubmessage();
        ++v153;
      }
      while (v151 != v153);
      uint64_t v151 = [(NSArray *)v149 countByEnumeratingWithState:&v921 objects:v1105 count:16];
    }
    while (v151);
  }

  long long v920 = 0u;
  long long v919 = 0u;
  long long v918 = 0u;
  long long v917 = 0u;
  v154 = self->_payloadDeviceDetails;
  uint64_t v155 = [(NSArray *)v154 countByEnumeratingWithState:&v917 objects:v1104 count:16];
  if (v155)
  {
    uint64_t v156 = v155;
    uint64_t v157 = *(void *)v918;
    do
    {
      uint64_t v158 = 0;
      do
      {
        if (*(void *)v918 != v157) {
          objc_enumerationMutation(v154);
        }
        PBDataWriterWriteSubmessage();
        ++v158;
      }
      while (v156 != v158);
      uint64_t v156 = [(NSArray *)v154 countByEnumeratingWithState:&v917 objects:v1104 count:16];
    }
    while (v156);
  }

  if (self->_payloadDeviceTypes.count)
  {
    unint64_t v159 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v159;
    }
    while (v159 < self->_payloadDeviceTypes.count);
  }
  long long v916 = 0u;
  long long v915 = 0u;
  long long v914 = 0u;
  long long v913 = 0u;
  unsigned int v160 = self->_payloadDialingContacts;
  uint64_t v161 = [(NSArray *)v160 countByEnumeratingWithState:&v913 objects:v1103 count:16];
  if (v161)
  {
    uint64_t v162 = v161;
    uint64_t v163 = *(void *)v914;
    do
    {
      uint64_t v164 = 0;
      do
      {
        if (*(void *)v914 != v163) {
          objc_enumerationMutation(v160);
        }
        PBDataWriterWriteSubmessage();
        ++v164;
      }
      while (v162 != v164);
      uint64_t v162 = [(NSArray *)v160 countByEnumeratingWithState:&v913 objects:v1103 count:16];
    }
    while (v162);
  }

  long long v912 = 0u;
  long long v911 = 0u;
  long long v910 = 0u;
  long long v909 = 0u;
  v165 = self->_payloadDistanceLists;
  uint64_t v166 = [(NSArray *)v165 countByEnumeratingWithState:&v909 objects:v1102 count:16];
  if (v166)
  {
    uint64_t v167 = v166;
    uint64_t v168 = *(void *)v910;
    do
    {
      uint64_t v169 = 0;
      do
      {
        if (*(void *)v910 != v168) {
          objc_enumerationMutation(v165);
        }
        PBDataWriterWriteSubmessage();
        ++v169;
      }
      while (v167 != v169);
      uint64_t v167 = [(NSArray *)v165 countByEnumeratingWithState:&v909 objects:v1102 count:16];
    }
    while (v167);
  }

  long long v908 = 0u;
  long long v907 = 0u;
  long long v906 = 0u;
  long long v905 = 0u;
  v170 = self->_payloadDistanceValues;
  uint64_t v171 = [(NSArray *)v170 countByEnumeratingWithState:&v905 objects:v1101 count:16];
  if (v171)
  {
    uint64_t v172 = v171;
    uint64_t v173 = *(void *)v906;
    do
    {
      uint64_t v174 = 0;
      do
      {
        if (*(void *)v906 != v173) {
          objc_enumerationMutation(v170);
        }
        PBDataWriterWriteSubmessage();
        ++v174;
      }
      while (v172 != v174);
      uint64_t v172 = [(NSArray *)v170 countByEnumeratingWithState:&v905 objects:v1101 count:16];
    }
    while (v172);
  }

  long long v904 = 0u;
  long long v903 = 0u;
  long long v902 = 0u;
  long long v901 = 0u;
  v175 = self->_payloadDoubleLists;
  uint64_t v176 = [(NSArray *)v175 countByEnumeratingWithState:&v901 objects:v1100 count:16];
  if (v176)
  {
    uint64_t v177 = v176;
    uint64_t v178 = *(void *)v902;
    do
    {
      uint64_t v179 = 0;
      do
      {
        if (*(void *)v902 != v178) {
          objc_enumerationMutation(v175);
        }
        PBDataWriterWriteSubmessage();
        ++v179;
      }
      while (v177 != v179);
      uint64_t v177 = [(NSArray *)v175 countByEnumeratingWithState:&v901 objects:v1100 count:16];
    }
    while (v177);
  }

  long long v900 = 0u;
  long long v899 = 0u;
  long long v898 = 0u;
  long long v897 = 0u;
  uint64_t v180 = self->_payloadDoubleValues;
  uint64_t v181 = [(NSArray *)v180 countByEnumeratingWithState:&v897 objects:v1099 count:16];
  if (v181)
  {
    uint64_t v182 = v181;
    uint64_t v183 = *(void *)v898;
    do
    {
      uint64_t v184 = 0;
      do
      {
        if (*(void *)v898 != v183) {
          objc_enumerationMutation(v180);
        }
        PBDataWriterWriteSubmessage();
        ++v184;
      }
      while (v182 != v184);
      uint64_t v182 = [(NSArray *)v180 countByEnumeratingWithState:&v897 objects:v1099 count:16];
    }
    while (v182);
  }

  long long v896 = 0u;
  long long v895 = 0u;
  long long v894 = 0u;
  long long v893 = 0u;
  uint64_t v185 = self->_payloadEnergyValues;
  uint64_t v186 = [(NSArray *)v185 countByEnumeratingWithState:&v893 objects:v1098 count:16];
  if (v186)
  {
    uint64_t v187 = v186;
    uint64_t v188 = *(void *)v894;
    do
    {
      uint64_t v189 = 0;
      do
      {
        if (*(void *)v894 != v188) {
          objc_enumerationMutation(v185);
        }
        PBDataWriterWriteSubmessage();
        ++v189;
      }
      while (v187 != v189);
      uint64_t v187 = [(NSArray *)v185 countByEnumeratingWithState:&v893 objects:v1098 count:16];
    }
    while (v187);
  }

  long long v892 = 0u;
  long long v891 = 0u;
  long long v890 = 0u;
  long long v889 = 0u;
  v190 = self->_payloadEnumerations;
  uint64_t v191 = [(NSArray *)v190 countByEnumeratingWithState:&v889 objects:v1097 count:16];
  if (v191)
  {
    uint64_t v192 = v191;
    uint64_t v193 = *(void *)v890;
    do
    {
      uint64_t v194 = 0;
      do
      {
        if (*(void *)v890 != v193) {
          objc_enumerationMutation(v190);
        }
        [*(id *)(*((void *)&v889 + 1) + 8 * v194) longLongValue];
        PBDataWriterWriteInt64Field();
        ++v194;
      }
      while (v192 != v194);
      uint64_t v192 = [(NSArray *)v190 countByEnumeratingWithState:&v889 objects:v1097 count:16];
    }
    while (v192);
  }

  long long v888 = 0u;
  long long v887 = 0u;
  long long v886 = 0u;
  long long v885 = 0u;
  v195 = self->_payloadEvents;
  uint64_t v196 = [(NSArray *)v195 countByEnumeratingWithState:&v885 objects:v1096 count:16];
  if (v196)
  {
    uint64_t v197 = v196;
    uint64_t v198 = *(void *)v886;
    do
    {
      uint64_t v199 = 0;
      do
      {
        if (*(void *)v886 != v198) {
          objc_enumerationMutation(v195);
        }
        PBDataWriterWriteSubmessage();
        ++v199;
      }
      while (v197 != v199);
      uint64_t v197 = [(NSArray *)v195 countByEnumeratingWithState:&v885 objects:v1096 count:16];
    }
    while (v197);
  }

  if (self->_payloadEventAttributes.count)
  {
    unint64_t v200 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v200;
    }
    while (v200 < self->_payloadEventAttributes.count);
  }
  long long v884 = 0u;
  long long v883 = 0u;
  long long v882 = 0u;
  long long v881 = 0u;
  int v201 = self->_payloadEventLists;
  uint64_t v202 = [(NSArray *)v201 countByEnumeratingWithState:&v881 objects:v1095 count:16];
  if (v202)
  {
    uint64_t v203 = v202;
    uint64_t v204 = *(void *)v882;
    do
    {
      uint64_t v205 = 0;
      do
      {
        if (*(void *)v882 != v204) {
          objc_enumerationMutation(v201);
        }
        PBDataWriterWriteSubmessage();
        ++v205;
      }
      while (v203 != v205);
      uint64_t v203 = [(NSArray *)v201 countByEnumeratingWithState:&v881 objects:v1095 count:16];
    }
    while (v203);
  }

  long long v880 = 0u;
  long long v879 = 0u;
  long long v878 = 0u;
  long long v877 = 0u;
  int v206 = self->_payloadEventParticipants;
  uint64_t v207 = [(NSArray *)v206 countByEnumeratingWithState:&v877 objects:v1094 count:16];
  if (v207)
  {
    uint64_t v208 = v207;
    uint64_t v209 = *(void *)v878;
    do
    {
      uint64_t v210 = 0;
      do
      {
        if (*(void *)v878 != v209) {
          objc_enumerationMutation(v206);
        }
        PBDataWriterWriteSubmessage();
        ++v210;
      }
      while (v208 != v210);
      uint64_t v208 = [(NSArray *)v206 countByEnumeratingWithState:&v877 objects:v1094 count:16];
    }
    while (v208);
  }

  long long v876 = 0u;
  long long v875 = 0u;
  long long v874 = 0u;
  long long v873 = 0u;
  int v211 = self->_payloadFiles;
  uint64_t v212 = [(NSArray *)v211 countByEnumeratingWithState:&v873 objects:v1093 count:16];
  if (v212)
  {
    uint64_t v213 = v212;
    uint64_t v214 = *(void *)v874;
    do
    {
      uint64_t v215 = 0;
      do
      {
        if (*(void *)v874 != v214) {
          objc_enumerationMutation(v211);
        }
        PBDataWriterWriteSubmessage();
        ++v215;
      }
      while (v213 != v215);
      uint64_t v213 = [(NSArray *)v211 countByEnumeratingWithState:&v873 objects:v1093 count:16];
    }
    while (v213);
  }

  if (self->_payloadFileEntityTypes.count)
  {
    unint64_t v216 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v216;
    }
    while (v216 < self->_payloadFileEntityTypes.count);
  }
  long long v872 = 0u;
  long long v871 = 0u;
  long long v870 = 0u;
  long long v869 = 0u;
  uint64_t v217 = self->_payloadFileProperties;
  uint64_t v218 = [(NSArray *)v217 countByEnumeratingWithState:&v869 objects:v1092 count:16];
  if (v218)
  {
    uint64_t v219 = v218;
    uint64_t v220 = *(void *)v870;
    do
    {
      uint64_t v221 = 0;
      do
      {
        if (*(void *)v870 != v220) {
          objc_enumerationMutation(v217);
        }
        PBDataWriterWriteSubmessage();
        ++v221;
      }
      while (v219 != v221);
      uint64_t v219 = [(NSArray *)v217 countByEnumeratingWithState:&v869 objects:v1092 count:16];
    }
    while (v219);
  }

  if (self->_payloadFilePropertyNames.count)
  {
    unint64_t v222 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v222;
    }
    while (v222 < self->_payloadFilePropertyNames.count);
  }
  if (self->_payloadFilePropertyQualifiers.count)
  {
    unint64_t v223 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v223;
    }
    while (v223 < self->_payloadFilePropertyQualifiers.count);
  }
  long long v868 = 0u;
  long long v867 = 0u;
  long long v866 = 0u;
  long long v865 = 0u;
  v224 = self->_payloadFilePropertyValues;
  uint64_t v225 = [(NSArray *)v224 countByEnumeratingWithState:&v865 objects:v1091 count:16];
  if (v225)
  {
    uint64_t v226 = v225;
    uint64_t v227 = *(void *)v866;
    do
    {
      uint64_t v228 = 0;
      do
      {
        if (*(void *)v866 != v227) {
          objc_enumerationMutation(v224);
        }
        PBDataWriterWriteSubmessage();
        ++v228;
      }
      while (v226 != v228);
      uint64_t v226 = [(NSArray *)v224 countByEnumeratingWithState:&v865 objects:v1091 count:16];
    }
    while (v226);
  }

  if (self->_payloadFileSearchScopes.count)
  {
    unint64_t v229 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v229;
    }
    while (v229 < self->_payloadFileSearchScopes.count);
  }
  if (self->_payloadFileShareModes.count)
  {
    unint64_t v230 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v230;
    }
    while (v230 < self->_payloadFileShareModes.count);
  }
  if (self->_payloadFileTypes.count)
  {
    unint64_t v231 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v231;
    }
    while (v231 < self->_payloadFileTypes.count);
  }
  long long v864 = 0u;
  long long v863 = 0u;
  long long v862 = 0u;
  long long v861 = 0u;
  uint64_t v232 = self->_payloadFinancialAccountValues;
  uint64_t v233 = [(NSArray *)v232 countByEnumeratingWithState:&v861 objects:v1090 count:16];
  if (v233)
  {
    uint64_t v234 = v233;
    uint64_t v235 = *(void *)v862;
    do
    {
      uint64_t v236 = 0;
      do
      {
        if (*(void *)v862 != v235) {
          objc_enumerationMutation(v232);
        }
        PBDataWriterWriteSubmessage();
        ++v236;
      }
      while (v234 != v236);
      uint64_t v234 = [(NSArray *)v232 countByEnumeratingWithState:&v861 objects:v1090 count:16];
    }
    while (v234);
  }

  long long v860 = 0u;
  long long v859 = 0u;
  long long v858 = 0u;
  long long v857 = 0u;
  uint64_t v237 = self->_payloadGeographicalFeatures;
  uint64_t v238 = [(NSArray *)v237 countByEnumeratingWithState:&v857 objects:v1089 count:16];
  if (v238)
  {
    uint64_t v239 = v238;
    uint64_t v240 = *(void *)v858;
    do
    {
      uint64_t v241 = 0;
      do
      {
        if (*(void *)v858 != v240) {
          objc_enumerationMutation(v237);
        }
        PBDataWriterWriteSubmessage();
        ++v241;
      }
      while (v239 != v241);
      uint64_t v239 = [(NSArray *)v237 countByEnumeratingWithState:&v857 objects:v1089 count:16];
    }
    while (v239);
  }

  long long v856 = 0u;
  long long v855 = 0u;
  long long v854 = 0u;
  long long v853 = 0u;
  uint64_t v242 = self->_payloadGeographicalFeatureLists;
  uint64_t v243 = [(NSArray *)v242 countByEnumeratingWithState:&v853 objects:v1088 count:16];
  if (v243)
  {
    uint64_t v244 = v243;
    uint64_t v245 = *(void *)v854;
    do
    {
      uint64_t v246 = 0;
      do
      {
        if (*(void *)v854 != v245) {
          objc_enumerationMutation(v242);
        }
        PBDataWriterWriteSubmessage();
        ++v246;
      }
      while (v244 != v246);
      uint64_t v244 = [(NSArray *)v242 countByEnumeratingWithState:&v853 objects:v1088 count:16];
    }
    while (v244);
  }

  long long v852 = 0u;
  long long v851 = 0u;
  long long v850 = 0u;
  long long v849 = 0u;
  uint64_t v247 = self->_payloadGetSettingResponseDatas;
  uint64_t v248 = [(NSArray *)v247 countByEnumeratingWithState:&v849 objects:v1087 count:16];
  if (v248)
  {
    uint64_t v249 = v248;
    uint64_t v250 = *(void *)v850;
    do
    {
      uint64_t v251 = 0;
      do
      {
        if (*(void *)v850 != v250) {
          objc_enumerationMutation(v247);
        }
        PBDataWriterWriteSubmessage();
        ++v251;
      }
      while (v249 != v251);
      uint64_t v249 = [(NSArray *)v247 countByEnumeratingWithState:&v849 objects:v1087 count:16];
    }
    while (v249);
  }

  long long v848 = 0u;
  long long v847 = 0u;
  long long v846 = 0u;
  long long v845 = 0u;
  uint64_t v252 = self->_payloadHomeAttributes;
  uint64_t v253 = [(NSArray *)v252 countByEnumeratingWithState:&v845 objects:v1086 count:16];
  if (v253)
  {
    uint64_t v254 = v253;
    uint64_t v255 = *(void *)v846;
    do
    {
      uint64_t v256 = 0;
      do
      {
        if (*(void *)v846 != v255) {
          objc_enumerationMutation(v252);
        }
        PBDataWriterWriteSubmessage();
        ++v256;
      }
      while (v254 != v256);
      uint64_t v254 = [(NSArray *)v252 countByEnumeratingWithState:&v845 objects:v1086 count:16];
    }
    while (v254);
  }

  if (self->_payloadHomeAttributeTypes.count)
  {
    unint64_t v257 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v257;
    }
    while (v257 < self->_payloadHomeAttributeTypes.count);
  }
  long long v844 = 0u;
  long long v843 = 0u;
  long long v842 = 0u;
  long long v841 = 0u;
  id v258 = self->_payloadHomeAttributeValues;
  uint64_t v259 = [(NSArray *)v258 countByEnumeratingWithState:&v841 objects:v1085 count:16];
  if (v259)
  {
    uint64_t v260 = v259;
    uint64_t v261 = *(void *)v842;
    do
    {
      uint64_t v262 = 0;
      do
      {
        if (*(void *)v842 != v261) {
          objc_enumerationMutation(v258);
        }
        PBDataWriterWriteSubmessage();
        ++v262;
      }
      while (v260 != v262);
      uint64_t v260 = [(NSArray *)v258 countByEnumeratingWithState:&v841 objects:v1085 count:16];
    }
    while (v260);
  }

  if (self->_payloadHomeAttributeValueTypes.count)
  {
    unint64_t v263 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v263;
    }
    while (v263 < self->_payloadHomeAttributeValueTypes.count);
  }
  if (self->_payloadHomeDeviceTypes.count)
  {
    unint64_t v264 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v264;
    }
    while (v264 < self->_payloadHomeDeviceTypes.count);
  }
  long long v840 = 0u;
  long long v839 = 0u;
  long long v838 = 0u;
  long long v837 = 0u;
  unint64_t v265 = self->_payloadHomeEntities;
  uint64_t v266 = [(NSArray *)v265 countByEnumeratingWithState:&v837 objects:v1084 count:16];
  if (v266)
  {
    uint64_t v267 = v266;
    uint64_t v268 = *(void *)v838;
    do
    {
      uint64_t v269 = 0;
      do
      {
        if (*(void *)v838 != v268) {
          objc_enumerationMutation(v265);
        }
        PBDataWriterWriteSubmessage();
        ++v269;
      }
      while (v267 != v269);
      uint64_t v267 = [(NSArray *)v265 countByEnumeratingWithState:&v837 objects:v1084 count:16];
    }
    while (v267);
  }

  if (self->_payloadHomeEntityTypes.count)
  {
    unint64_t v270 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v270;
    }
    while (v270 < self->_payloadHomeEntityTypes.count);
  }
  long long v836 = 0u;
  long long v835 = 0u;
  long long v834 = 0u;
  long long v833 = 0u;
  int v271 = self->_payloadHomeFilters;
  uint64_t v272 = [(NSArray *)v271 countByEnumeratingWithState:&v833 objects:v1083 count:16];
  if (v272)
  {
    uint64_t v273 = v272;
    uint64_t v274 = *(void *)v834;
    do
    {
      uint64_t v275 = 0;
      do
      {
        if (*(void *)v834 != v274) {
          objc_enumerationMutation(v271);
        }
        PBDataWriterWriteSubmessage();
        ++v275;
      }
      while (v273 != v275);
      uint64_t v273 = [(NSArray *)v271 countByEnumeratingWithState:&v833 objects:v1083 count:16];
    }
    while (v273);
  }

  long long v832 = 0u;
  long long v831 = 0u;
  long long v830 = 0u;
  long long v829 = 0u;
  int v276 = self->_payloadHomeUserTasks;
  uint64_t v277 = [(NSArray *)v276 countByEnumeratingWithState:&v829 objects:v1082 count:16];
  if (v277)
  {
    uint64_t v278 = v277;
    uint64_t v279 = *(void *)v830;
    do
    {
      uint64_t v280 = 0;
      do
      {
        if (*(void *)v830 != v279) {
          objc_enumerationMutation(v276);
        }
        PBDataWriterWriteSubmessage();
        ++v280;
      }
      while (v278 != v280);
      uint64_t v278 = [(NSArray *)v276 countByEnumeratingWithState:&v829 objects:v1082 count:16];
    }
    while (v278);
  }

  long long v828 = 0u;
  long long v827 = 0u;
  long long v826 = 0u;
  long long v825 = 0u;
  int v281 = self->_payloadIntegerLists;
  uint64_t v282 = [(NSArray *)v281 countByEnumeratingWithState:&v825 objects:v1081 count:16];
  if (v282)
  {
    uint64_t v283 = v282;
    uint64_t v284 = *(void *)v826;
    do
    {
      uint64_t v285 = 0;
      do
      {
        if (*(void *)v826 != v284) {
          objc_enumerationMutation(v281);
        }
        PBDataWriterWriteSubmessage();
        ++v285;
      }
      while (v283 != v285);
      uint64_t v283 = [(NSArray *)v281 countByEnumeratingWithState:&v825 objects:v1081 count:16];
    }
    while (v283);
  }

  long long v824 = 0u;
  long long v823 = 0u;
  long long v822 = 0u;
  long long v821 = 0u;
  int v286 = self->_payloadIntegerValues;
  uint64_t v287 = [(NSArray *)v286 countByEnumeratingWithState:&v821 objects:v1080 count:16];
  if (v287)
  {
    uint64_t v288 = v287;
    uint64_t v289 = *(void *)v822;
    do
    {
      uint64_t v290 = 0;
      do
      {
        if (*(void *)v822 != v289) {
          objc_enumerationMutation(v286);
        }
        PBDataWriterWriteSubmessage();
        ++v290;
      }
      while (v288 != v290);
      uint64_t v288 = [(NSArray *)v286 countByEnumeratingWithState:&v821 objects:v1080 count:16];
    }
    while (v288);
  }

  long long v820 = 0u;
  long long v819 = 0u;
  long long v818 = 0u;
  long long v817 = 0u;
  int v291 = self->_payloadIntents;
  uint64_t v292 = [(NSArray *)v291 countByEnumeratingWithState:&v817 objects:v1079 count:16];
  if (v292)
  {
    uint64_t v293 = v292;
    uint64_t v294 = *(void *)v818;
    do
    {
      uint64_t v295 = 0;
      do
      {
        if (*(void *)v818 != v294) {
          objc_enumerationMutation(v291);
        }
        PBDataWriterWriteSubmessage();
        ++v295;
      }
      while (v293 != v295);
      uint64_t v293 = [(NSArray *)v291 countByEnumeratingWithState:&v817 objects:v1079 count:16];
    }
    while (v293);
  }

  long long v816 = 0u;
  long long v815 = 0u;
  long long v814 = 0u;
  long long v813 = 0u;
  int v296 = self->_payloadIntentExecutionResults;
  uint64_t v297 = [(NSArray *)v296 countByEnumeratingWithState:&v813 objects:v1078 count:16];
  if (v297)
  {
    uint64_t v298 = v297;
    uint64_t v299 = *(void *)v814;
    do
    {
      uint64_t v300 = 0;
      do
      {
        if (*(void *)v814 != v299) {
          objc_enumerationMutation(v296);
        }
        PBDataWriterWriteSubmessage();
        ++v300;
      }
      while (v298 != v300);
      uint64_t v298 = [(NSArray *)v296 countByEnumeratingWithState:&v813 objects:v1078 count:16];
    }
    while (v298);
  }

  long long v812 = 0u;
  long long v811 = 0u;
  long long v810 = 0u;
  long long v809 = 0u;
  int v301 = self->_payloadLocations;
  uint64_t v302 = [(NSArray *)v301 countByEnumeratingWithState:&v809 objects:v1077 count:16];
  if (v302)
  {
    uint64_t v303 = v302;
    uint64_t v304 = *(void *)v810;
    do
    {
      uint64_t v305 = 0;
      do
      {
        if (*(void *)v810 != v304) {
          objc_enumerationMutation(v301);
        }
        PBDataWriterWriteSubmessage();
        ++v305;
      }
      while (v303 != v305);
      uint64_t v303 = [(NSArray *)v301 countByEnumeratingWithState:&v809 objects:v1077 count:16];
    }
    while (v303);
  }

  long long v808 = 0u;
  long long v807 = 0u;
  long long v806 = 0u;
  long long v805 = 0u;
  int v306 = self->_payloadLocationLists;
  uint64_t v307 = [(NSArray *)v306 countByEnumeratingWithState:&v805 objects:v1076 count:16];
  if (v307)
  {
    uint64_t v308 = v307;
    uint64_t v309 = *(void *)v806;
    do
    {
      uint64_t v310 = 0;
      do
      {
        if (*(void *)v806 != v309) {
          objc_enumerationMutation(v306);
        }
        PBDataWriterWriteSubmessage();
        ++v310;
      }
      while (v308 != v310);
      uint64_t v308 = [(NSArray *)v306 countByEnumeratingWithState:&v805 objects:v1076 count:16];
    }
    while (v308);
  }

  if (self->_payloadLocationSearchTypes.count)
  {
    unint64_t v311 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v311;
    }
    while (v311 < self->_payloadLocationSearchTypes.count);
  }
  long long v804 = 0u;
  long long v803 = 0u;
  long long v802 = 0u;
  long long v801 = 0u;
  uint64_t v312 = self->_payloadLongLists;
  uint64_t v313 = [(NSArray *)v312 countByEnumeratingWithState:&v801 objects:v1075 count:16];
  if (v313)
  {
    uint64_t v314 = v313;
    uint64_t v315 = *(void *)v802;
    do
    {
      uint64_t v316 = 0;
      do
      {
        if (*(void *)v802 != v315) {
          objc_enumerationMutation(v312);
        }
        PBDataWriterWriteSubmessage();
        ++v316;
      }
      while (v314 != v316);
      uint64_t v314 = [(NSArray *)v312 countByEnumeratingWithState:&v801 objects:v1075 count:16];
    }
    while (v314);
  }

  long long v800 = 0u;
  long long v799 = 0u;
  long long v798 = 0u;
  long long v797 = 0u;
  uint64_t v317 = self->_payloadLongValues;
  uint64_t v318 = [(NSArray *)v317 countByEnumeratingWithState:&v797 objects:v1074 count:16];
  if (v318)
  {
    uint64_t v319 = v318;
    uint64_t v320 = *(void *)v798;
    do
    {
      uint64_t v321 = 0;
      do
      {
        if (*(void *)v798 != v320) {
          objc_enumerationMutation(v317);
        }
        PBDataWriterWriteSubmessage();
        ++v321;
      }
      while (v319 != v321);
      uint64_t v319 = [(NSArray *)v317 countByEnumeratingWithState:&v797 objects:v1074 count:16];
    }
    while (v319);
  }

  long long v796 = 0u;
  long long v795 = 0u;
  long long v794 = 0u;
  long long v793 = 0u;
  uint64_t v322 = self->_payloadMassValues;
  uint64_t v323 = [(NSArray *)v322 countByEnumeratingWithState:&v793 objects:v1073 count:16];
  if (v323)
  {
    uint64_t v324 = v323;
    uint64_t v325 = *(void *)v794;
    do
    {
      uint64_t v326 = 0;
      do
      {
        if (*(void *)v794 != v325) {
          objc_enumerationMutation(v322);
        }
        PBDataWriterWriteSubmessage();
        ++v326;
      }
      while (v324 != v326);
      uint64_t v324 = [(NSArray *)v322 countByEnumeratingWithState:&v793 objects:v1073 count:16];
    }
    while (v324);
  }

  if (self->_payloadMediaAffinityTypes.count)
  {
    unint64_t v327 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v327;
    }
    while (v327 < self->_payloadMediaAffinityTypes.count);
  }
  long long v792 = 0u;
  long long v791 = 0u;
  long long v790 = 0u;
  long long v789 = 0u;
  v328 = self->_payloadMediaDestinations;
  uint64_t v329 = [(NSArray *)v328 countByEnumeratingWithState:&v789 objects:v1072 count:16];
  if (v329)
  {
    uint64_t v330 = v329;
    uint64_t v331 = *(void *)v790;
    do
    {
      uint64_t v332 = 0;
      do
      {
        if (*(void *)v790 != v331) {
          objc_enumerationMutation(v328);
        }
        PBDataWriterWriteSubmessage();
        ++v332;
      }
      while (v330 != v332);
      uint64_t v330 = [(NSArray *)v328 countByEnumeratingWithState:&v789 objects:v1072 count:16];
    }
    while (v330);
  }

  long long v788 = 0u;
  long long v787 = 0u;
  long long v786 = 0u;
  long long v785 = 0u;
  uint64_t v333 = self->_payloadMediaItemGroups;
  uint64_t v334 = [(NSArray *)v333 countByEnumeratingWithState:&v785 objects:v1071 count:16];
  if (v334)
  {
    uint64_t v335 = v334;
    uint64_t v336 = *(void *)v786;
    do
    {
      uint64_t v337 = 0;
      do
      {
        if (*(void *)v786 != v336) {
          objc_enumerationMutation(v333);
        }
        PBDataWriterWriteSubmessage();
        ++v337;
      }
      while (v335 != v337);
      uint64_t v335 = [(NSArray *)v333 countByEnumeratingWithState:&v785 objects:v1071 count:16];
    }
    while (v335);
  }

  long long v784 = 0u;
  long long v783 = 0u;
  long long v782 = 0u;
  long long v781 = 0u;
  id v338 = self->_payloadMediaItemValues;
  uint64_t v339 = [(NSArray *)v338 countByEnumeratingWithState:&v781 objects:v1070 count:16];
  if (v339)
  {
    uint64_t v340 = v339;
    uint64_t v341 = *(void *)v782;
    do
    {
      uint64_t v342 = 0;
      do
      {
        if (*(void *)v782 != v341) {
          objc_enumerationMutation(v338);
        }
        PBDataWriterWriteSubmessage();
        ++v342;
      }
      while (v340 != v342);
      uint64_t v340 = [(NSArray *)v338 countByEnumeratingWithState:&v781 objects:v1070 count:16];
    }
    while (v340);
  }

  long long v780 = 0u;
  long long v779 = 0u;
  long long v778 = 0u;
  long long v777 = 0u;
  v343 = self->_payloadMediaSearchs;
  uint64_t v344 = [(NSArray *)v343 countByEnumeratingWithState:&v777 objects:v1069 count:16];
  if (v344)
  {
    uint64_t v345 = v344;
    uint64_t v346 = *(void *)v778;
    do
    {
      uint64_t v347 = 0;
      do
      {
        if (*(void *)v778 != v346) {
          objc_enumerationMutation(v343);
        }
        PBDataWriterWriteSubmessage();
        ++v347;
      }
      while (v345 != v347);
      uint64_t v345 = [(NSArray *)v343 countByEnumeratingWithState:&v777 objects:v1069 count:16];
    }
    while (v345);
  }

  if (self->_payloadMessageAttributes.count)
  {
    unint64_t v348 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v348;
    }
    while (v348 < self->_payloadMessageAttributes.count);
  }
  if (self->_payloadMessageEffects.count)
  {
    unint64_t v349 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v349;
    }
    while (v349 < self->_payloadMessageEffects.count);
  }
  if (self->_payloadMessageTypes.count)
  {
    unint64_t v350 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v350;
    }
    while (v350 < self->_payloadMessageTypes.count);
  }
  long long v776 = 0u;
  long long v775 = 0u;
  long long v774 = 0u;
  long long v773 = 0u;
  int v351 = self->_payloadModifyNicknames;
  uint64_t v352 = [(NSArray *)v351 countByEnumeratingWithState:&v773 objects:v1068 count:16];
  if (v352)
  {
    uint64_t v353 = v352;
    uint64_t v354 = *(void *)v774;
    do
    {
      uint64_t v355 = 0;
      do
      {
        if (*(void *)v774 != v354) {
          objc_enumerationMutation(v351);
        }
        PBDataWriterWriteSubmessage();
        ++v355;
      }
      while (v353 != v355);
      uint64_t v353 = [(NSArray *)v351 countByEnumeratingWithState:&v773 objects:v1068 count:16];
    }
    while (v353);
  }

  long long v772 = 0u;
  long long v771 = 0u;
  long long v770 = 0u;
  long long v769 = 0u;
  int v356 = self->_payloadModifyRelationships;
  uint64_t v357 = [(NSArray *)v356 countByEnumeratingWithState:&v769 objects:v1067 count:16];
  if (v357)
  {
    uint64_t v358 = v357;
    uint64_t v359 = *(void *)v770;
    do
    {
      uint64_t v360 = 0;
      do
      {
        if (*(void *)v770 != v359) {
          objc_enumerationMutation(v356);
        }
        PBDataWriterWriteSubmessage();
        ++v360;
      }
      while (v358 != v360);
      uint64_t v358 = [(NSArray *)v356 countByEnumeratingWithState:&v769 objects:v1067 count:16];
    }
    while (v358);
  }

  long long v768 = 0u;
  long long v767 = 0u;
  long long v766 = 0u;
  long long v765 = 0u;
  int v361 = self->_payloadNotes;
  uint64_t v362 = [(NSArray *)v361 countByEnumeratingWithState:&v765 objects:v1066 count:16];
  if (v362)
  {
    uint64_t v363 = v362;
    uint64_t v364 = *(void *)v766;
    do
    {
      uint64_t v365 = 0;
      do
      {
        if (*(void *)v766 != v364) {
          objc_enumerationMutation(v361);
        }
        PBDataWriterWriteSubmessage();
        ++v365;
      }
      while (v363 != v365);
      uint64_t v363 = [(NSArray *)v361 countByEnumeratingWithState:&v765 objects:v1066 count:16];
    }
    while (v363);
  }

  long long v764 = 0u;
  long long v763 = 0u;
  long long v762 = 0u;
  long long v761 = 0u;
  int v366 = self->_payloadNoteContents;
  uint64_t v367 = [(NSArray *)v366 countByEnumeratingWithState:&v761 objects:v1065 count:16];
  if (v367)
  {
    uint64_t v368 = v367;
    uint64_t v369 = *(void *)v762;
    do
    {
      uint64_t v370 = 0;
      do
      {
        if (*(void *)v762 != v369) {
          objc_enumerationMutation(v366);
        }
        PBDataWriterWriteSubmessage();
        ++v370;
      }
      while (v368 != v370);
      uint64_t v368 = [(NSArray *)v366 countByEnumeratingWithState:&v761 objects:v1065 count:16];
    }
    while (v368);
  }

  if (self->_payloadNotebookItemTypes.count)
  {
    unint64_t v371 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v371;
    }
    while (v371 < self->_payloadNotebookItemTypes.count);
  }
  if (self->_payloadNumericSettingUnits.count)
  {
    unint64_t v372 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v372;
    }
    while (v372 < self->_payloadNumericSettingUnits.count);
  }
  long long v760 = 0u;
  long long v759 = 0u;
  long long v758 = 0u;
  long long v757 = 0u;
  v373 = self->_payloadNumericSettingValues;
  uint64_t v374 = [(NSArray *)v373 countByEnumeratingWithState:&v757 objects:v1064 count:16];
  if (v374)
  {
    uint64_t v375 = v374;
    uint64_t v376 = *(void *)v758;
    do
    {
      uint64_t v377 = 0;
      do
      {
        if (*(void *)v758 != v376) {
          objc_enumerationMutation(v373);
        }
        PBDataWriterWriteSubmessage();
        ++v377;
      }
      while (v375 != v377);
      uint64_t v375 = [(NSArray *)v373 countByEnumeratingWithState:&v757 objects:v1064 count:16];
    }
    while (v375);
  }

  if (self->_payloadOutgoingMessageTypes.count)
  {
    unint64_t v378 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v378;
    }
    while (v378 < self->_payloadOutgoingMessageTypes.count);
  }
  if (self->_payloadParsecCategories.count)
  {
    unint64_t v379 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v379;
    }
    while (v379 < self->_payloadParsecCategories.count);
  }
  long long v756 = 0u;
  long long v755 = 0u;
  long long v754 = 0u;
  long long v753 = 0u;
  uint64_t v380 = self->_payloadPaymentAmountValues;
  uint64_t v381 = [(NSArray *)v380 countByEnumeratingWithState:&v753 objects:v1063 count:16];
  if (v381)
  {
    uint64_t v382 = v381;
    uint64_t v383 = *(void *)v754;
    do
    {
      uint64_t v384 = 0;
      do
      {
        if (*(void *)v754 != v383) {
          objc_enumerationMutation(v380);
        }
        PBDataWriterWriteSubmessage();
        ++v384;
      }
      while (v382 != v384);
      uint64_t v382 = [(NSArray *)v380 countByEnumeratingWithState:&v753 objects:v1063 count:16];
    }
    while (v382);
  }

  long long v752 = 0u;
  long long v751 = 0u;
  long long v750 = 0u;
  long long v749 = 0u;
  uint64_t v385 = self->_payloadPaymentMethodLists;
  uint64_t v386 = [(NSArray *)v385 countByEnumeratingWithState:&v749 objects:v1062 count:16];
  if (v386)
  {
    uint64_t v387 = v386;
    uint64_t v388 = *(void *)v750;
    do
    {
      uint64_t v389 = 0;
      do
      {
        if (*(void *)v750 != v388) {
          objc_enumerationMutation(v385);
        }
        PBDataWriterWriteSubmessage();
        ++v389;
      }
      while (v387 != v389);
      uint64_t v387 = [(NSArray *)v385 countByEnumeratingWithState:&v749 objects:v1062 count:16];
    }
    while (v387);
  }

  long long v748 = 0u;
  long long v747 = 0u;
  long long v746 = 0u;
  long long v745 = 0u;
  id v390 = self->_payloadPaymentMethodValues;
  uint64_t v391 = [(NSArray *)v390 countByEnumeratingWithState:&v745 objects:v1061 count:16];
  if (v391)
  {
    uint64_t v392 = v391;
    uint64_t v393 = *(void *)v746;
    do
    {
      uint64_t v394 = 0;
      do
      {
        if (*(void *)v746 != v393) {
          objc_enumerationMutation(v390);
        }
        PBDataWriterWriteSubmessage();
        ++v394;
      }
      while (v392 != v394);
      uint64_t v392 = [(NSArray *)v390 countByEnumeratingWithState:&v745 objects:v1061 count:16];
    }
    while (v392);
  }

  if (self->_payloadPaymentStatus.count)
  {
    unint64_t v395 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v395;
    }
    while (v395 < self->_payloadPaymentStatus.count);
  }
  if (self->_payloadPersonalPlaceTypes.count)
  {
    unint64_t v396 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v396;
    }
    while (v396 < self->_payloadPersonalPlaceTypes.count);
  }
  if (self->_payloadPhotoAttributes.count)
  {
    unint64_t v397 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v397;
    }
    while (v397 < self->_payloadPhotoAttributes.count);
  }
  long long v744 = 0u;
  long long v743 = 0u;
  long long v742 = 0u;
  long long v741 = 0u;
  uint64_t v398 = self->_payloadPlaces;
  uint64_t v399 = [(NSArray *)v398 countByEnumeratingWithState:&v741 objects:v1060 count:16];
  if (v399)
  {
    uint64_t v400 = v399;
    uint64_t v401 = *(void *)v742;
    do
    {
      uint64_t v402 = 0;
      do
      {
        if (*(void *)v742 != v401) {
          objc_enumerationMutation(v398);
        }
        PBDataWriterWriteSubmessage();
        ++v402;
      }
      while (v400 != v402);
      uint64_t v400 = [(NSArray *)v398 countByEnumeratingWithState:&v741 objects:v1060 count:16];
    }
    while (v400);
  }

  long long v740 = 0u;
  long long v739 = 0u;
  long long v738 = 0u;
  long long v737 = 0u;
  v403 = self->_payloadPlaceLists;
  uint64_t v404 = [(NSArray *)v403 countByEnumeratingWithState:&v737 objects:v1059 count:16];
  if (v404)
  {
    uint64_t v405 = v404;
    uint64_t v406 = *(void *)v738;
    do
    {
      uint64_t v407 = 0;
      do
      {
        if (*(void *)v738 != v406) {
          objc_enumerationMutation(v403);
        }
        PBDataWriterWriteSubmessage();
        ++v407;
      }
      while (v405 != v407);
      uint64_t v405 = [(NSArray *)v403 countByEnumeratingWithState:&v737 objects:v1059 count:16];
    }
    while (v405);
  }

  if (self->_payloadPlaybackQueueLocations.count)
  {
    unint64_t v408 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v408;
    }
    while (v408 < self->_payloadPlaybackQueueLocations.count);
  }
  if (self->_payloadPlaybackRepeatModes.count)
  {
    unint64_t v409 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v409;
    }
    while (v409 < self->_payloadPlaybackRepeatModes.count);
  }
  if (self->_payloadPreferredCallProviders.count)
  {
    unint64_t v410 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v410;
    }
    while (v410 < self->_payloadPreferredCallProviders.count);
  }
  long long v736 = 0u;
  long long v735 = 0u;
  long long v734 = 0u;
  long long v733 = 0u;
  int v411 = self->_payloadPrimitiveBools;
  uint64_t v412 = [(NSArray *)v411 countByEnumeratingWithState:&v733 objects:v1058 count:16];
  if (v412)
  {
    uint64_t v413 = v412;
    uint64_t v414 = *(void *)v734;
    do
    {
      uint64_t v415 = 0;
      do
      {
        if (*(void *)v734 != v414) {
          objc_enumerationMutation(v411);
        }
        [*(id *)(*((void *)&v733 + 1) + 8 * v415) BOOLValue];
        PBDataWriterWriteBOOLField();
        ++v415;
      }
      while (v413 != v415);
      uint64_t v413 = [(NSArray *)v411 countByEnumeratingWithState:&v733 objects:v1058 count:16];
    }
    while (v413);
  }

  long long v732 = 0u;
  long long v731 = 0u;
  long long v730 = 0u;
  long long v729 = 0u;
  int v416 = self->_payloadPrimitiveDoubles;
  uint64_t v417 = [(NSArray *)v416 countByEnumeratingWithState:&v729 objects:v1057 count:16];
  if (v417)
  {
    uint64_t v418 = v417;
    uint64_t v419 = *(void *)v730;
    do
    {
      uint64_t v420 = 0;
      do
      {
        if (*(void *)v730 != v419) {
          objc_enumerationMutation(v416);
        }
        [*(id *)(*((void *)&v729 + 1) + 8 * v420) doubleValue];
        PBDataWriterWriteDoubleField();
        ++v420;
      }
      while (v418 != v420);
      uint64_t v418 = [(NSArray *)v416 countByEnumeratingWithState:&v729 objects:v1057 count:16];
    }
    while (v418);
  }

  long long v728 = 0u;
  long long v727 = 0u;
  long long v726 = 0u;
  long long v725 = 0u;
  int v421 = self->_payloadPrimitiveInts;
  uint64_t v422 = [(NSArray *)v421 countByEnumeratingWithState:&v725 objects:v1056 count:16];
  if (v422)
  {
    uint64_t v423 = v422;
    uint64_t v424 = *(void *)v726;
    do
    {
      uint64_t v425 = 0;
      do
      {
        if (*(void *)v726 != v424) {
          objc_enumerationMutation(v421);
        }
        [*(id *)(*((void *)&v725 + 1) + 8 * v425) intValue];
        PBDataWriterWriteInt32Field();
        ++v425;
      }
      while (v423 != v425);
      uint64_t v423 = [(NSArray *)v421 countByEnumeratingWithState:&v725 objects:v1056 count:16];
    }
    while (v423);
  }

  long long v724 = 0u;
  long long v723 = 0u;
  long long v722 = 0u;
  long long v721 = 0u;
  int v426 = self->_payloadPrimitiveLongs;
  uint64_t v427 = [(NSArray *)v426 countByEnumeratingWithState:&v721 objects:v1055 count:16];
  if (v427)
  {
    uint64_t v428 = v427;
    uint64_t v429 = *(void *)v722;
    do
    {
      uint64_t v430 = 0;
      do
      {
        if (*(void *)v722 != v429) {
          objc_enumerationMutation(v426);
        }
        [*(id *)(*((void *)&v721 + 1) + 8 * v430) longLongValue];
        PBDataWriterWriteInt64Field();
        ++v430;
      }
      while (v428 != v430);
      uint64_t v428 = [(NSArray *)v426 countByEnumeratingWithState:&v721 objects:v1055 count:16];
    }
    while (v428);
  }

  long long v720 = 0u;
  long long v719 = 0u;
  long long v718 = 0u;
  long long v717 = 0u;
  int v431 = self->_payloadPrimitiveStrings;
  uint64_t v432 = [(NSArray *)v431 countByEnumeratingWithState:&v717 objects:v1054 count:16];
  if (v432)
  {
    uint64_t v433 = v432;
    uint64_t v434 = *(void *)v718;
    do
    {
      uint64_t v435 = 0;
      do
      {
        if (*(void *)v718 != v434) {
          objc_enumerationMutation(v431);
        }
        PBDataWriterWriteStringField();
        ++v435;
      }
      while (v433 != v435);
      uint64_t v433 = [(NSArray *)v431 countByEnumeratingWithState:&v717 objects:v1054 count:16];
    }
    while (v433);
  }

  long long v716 = 0u;
  long long v715 = 0u;
  long long v714 = 0u;
  long long v713 = 0u;
  int v436 = self->_payloadPrivateAddMediaIntentDatas;
  uint64_t v437 = [(NSArray *)v436 countByEnumeratingWithState:&v713 objects:v1053 count:16];
  if (v437)
  {
    uint64_t v438 = v437;
    uint64_t v439 = *(void *)v714;
    do
    {
      uint64_t v440 = 0;
      do
      {
        if (*(void *)v714 != v439) {
          objc_enumerationMutation(v436);
        }
        PBDataWriterWriteSubmessage();
        ++v440;
      }
      while (v438 != v440);
      uint64_t v438 = [(NSArray *)v436 countByEnumeratingWithState:&v713 objects:v1053 count:16];
    }
    while (v438);
  }

  long long v712 = 0u;
  long long v711 = 0u;
  long long v710 = 0u;
  long long v709 = 0u;
  int v441 = self->_payloadPrivatePlayMediaIntentDatas;
  uint64_t v442 = [(NSArray *)v441 countByEnumeratingWithState:&v709 objects:v1052 count:16];
  if (v442)
  {
    uint64_t v443 = v442;
    uint64_t v444 = *(void *)v710;
    do
    {
      uint64_t v445 = 0;
      do
      {
        if (*(void *)v710 != v444) {
          objc_enumerationMutation(v441);
        }
        PBDataWriterWriteSubmessage();
        ++v445;
      }
      while (v443 != v445);
      uint64_t v443 = [(NSArray *)v441 countByEnumeratingWithState:&v709 objects:v1052 count:16];
    }
    while (v443);
  }

  long long v708 = 0u;
  long long v707 = 0u;
  long long v706 = 0u;
  long long v705 = 0u;
  int v446 = self->_payloadPrivateSearchForMediaIntentDatas;
  uint64_t v447 = [(NSArray *)v446 countByEnumeratingWithState:&v705 objects:v1051 count:16];
  if (v447)
  {
    uint64_t v448 = v447;
    uint64_t v449 = *(void *)v706;
    do
    {
      uint64_t v450 = 0;
      do
      {
        if (*(void *)v706 != v449) {
          objc_enumerationMutation(v446);
        }
        PBDataWriterWriteSubmessage();
        ++v450;
      }
      while (v448 != v450);
      uint64_t v448 = [(NSArray *)v446 countByEnumeratingWithState:&v705 objects:v1051 count:16];
    }
    while (v448);
  }

  long long v704 = 0u;
  long long v703 = 0u;
  long long v702 = 0u;
  long long v701 = 0u;
  int v451 = self->_payloadPrivateUpdateMediaAffinityIntentDatas;
  uint64_t v452 = [(NSArray *)v451 countByEnumeratingWithState:&v701 objects:v1050 count:16];
  if (v452)
  {
    uint64_t v453 = v452;
    uint64_t v454 = *(void *)v702;
    do
    {
      uint64_t v455 = 0;
      do
      {
        if (*(void *)v702 != v454) {
          objc_enumerationMutation(v451);
        }
        PBDataWriterWriteSubmessage();
        ++v455;
      }
      while (v453 != v455);
      uint64_t v453 = [(NSArray *)v451 countByEnumeratingWithState:&v701 objects:v1050 count:16];
    }
    while (v453);
  }

  if (self->_payloadRadioTypes.count)
  {
    unint64_t v456 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v456;
    }
    while (v456 < self->_payloadRadioTypes.count);
  }
  if (self->_payloadReadActionTypes.count)
  {
    unint64_t v457 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v457;
    }
    while (v457 < self->_payloadReadActionTypes.count);
  }
  if (self->_payloadRelativeReferences.count)
  {
    unint64_t v458 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v458;
    }
    while (v458 < self->_payloadRelativeReferences.count);
  }
  if (self->_payloadRelativeSettings.count)
  {
    unint64_t v459 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v459;
    }
    while (v459 < self->_payloadRelativeSettings.count);
  }
  long long v700 = 0u;
  long long v699 = 0u;
  long long v698 = 0u;
  long long v697 = 0u;
  v460 = self->_payloadSendMessageAttachments;
  uint64_t v461 = [(NSArray *)v460 countByEnumeratingWithState:&v697 objects:v1049 count:16];
  if (v461)
  {
    uint64_t v462 = v461;
    uint64_t v463 = *(void *)v698;
    do
    {
      uint64_t v464 = 0;
      do
      {
        if (*(void *)v698 != v463) {
          objc_enumerationMutation(v460);
        }
        PBDataWriterWriteSubmessage();
        ++v464;
      }
      while (v462 != v464);
      uint64_t v462 = [(NSArray *)v460 countByEnumeratingWithState:&v697 objects:v1049 count:16];
    }
    while (v462);
  }

  if (self->_payloadSettingActions.count)
  {
    unint64_t v465 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v465;
    }
    while (v465 < self->_payloadSettingActions.count);
  }
  long long v696 = 0u;
  long long v695 = 0u;
  long long v694 = 0u;
  long long v693 = 0u;
  int v466 = self->_payloadSettingMetadatas;
  uint64_t v467 = [(NSArray *)v466 countByEnumeratingWithState:&v693 objects:v1048 count:16];
  if (v467)
  {
    uint64_t v468 = v467;
    uint64_t v469 = *(void *)v694;
    do
    {
      uint64_t v470 = 0;
      do
      {
        if (*(void *)v694 != v469) {
          objc_enumerationMutation(v466);
        }
        PBDataWriterWriteSubmessage();
        ++v470;
      }
      while (v468 != v470);
      uint64_t v468 = [(NSArray *)v466 countByEnumeratingWithState:&v693 objects:v1048 count:16];
    }
    while (v468);
  }

  long long v692 = 0u;
  long long v691 = 0u;
  long long v690 = 0u;
  long long v689 = 0u;
  int v471 = self->_payloadShareDestinations;
  uint64_t v472 = [(NSArray *)v471 countByEnumeratingWithState:&v689 objects:v1047 count:16];
  if (v472)
  {
    uint64_t v473 = v472;
    uint64_t v474 = *(void *)v690;
    do
    {
      uint64_t v475 = 0;
      do
      {
        if (*(void *)v690 != v474) {
          objc_enumerationMutation(v471);
        }
        PBDataWriterWriteSubmessage();
        ++v475;
      }
      while (v473 != v475);
      uint64_t v473 = [(NSArray *)v471 countByEnumeratingWithState:&v689 objects:v1047 count:16];
    }
    while (v473);
  }

  long long v688 = 0u;
  long long v687 = 0u;
  long long v686 = 0u;
  long long v685 = 0u;
  int v476 = self->_payloadSleepAlarmAttributes;
  uint64_t v477 = [(NSArray *)v476 countByEnumeratingWithState:&v685 objects:v1046 count:16];
  if (v477)
  {
    uint64_t v478 = v477;
    uint64_t v479 = *(void *)v686;
    do
    {
      uint64_t v480 = 0;
      do
      {
        if (*(void *)v686 != v479) {
          objc_enumerationMutation(v476);
        }
        PBDataWriterWriteSubmessage();
        ++v480;
      }
      while (v478 != v480);
      uint64_t v478 = [(NSArray *)v476 countByEnumeratingWithState:&v685 objects:v1046 count:16];
    }
    while (v478);
  }

  long long v684 = 0u;
  long long v683 = 0u;
  long long v682 = 0u;
  long long v681 = 0u;
  int v481 = self->_payloadSpatialEventTriggers;
  uint64_t v482 = [(NSArray *)v481 countByEnumeratingWithState:&v681 objects:v1045 count:16];
  if (v482)
  {
    uint64_t v483 = v482;
    uint64_t v484 = *(void *)v682;
    do
    {
      uint64_t v485 = 0;
      do
      {
        if (*(void *)v682 != v484) {
          objc_enumerationMutation(v481);
        }
        PBDataWriterWriteSubmessage();
        ++v485;
      }
      while (v483 != v485);
      uint64_t v483 = [(NSArray *)v481 countByEnumeratingWithState:&v681 objects:v1045 count:16];
    }
    while (v483);
  }

  long long v680 = 0u;
  long long v679 = 0u;
  long long v678 = 0u;
  long long v677 = 0u;
  int v486 = self->_payloadSpeedValues;
  uint64_t v487 = [(NSArray *)v486 countByEnumeratingWithState:&v677 objects:v1044 count:16];
  if (v487)
  {
    uint64_t v488 = v487;
    uint64_t v489 = *(void *)v678;
    do
    {
      uint64_t v490 = 0;
      do
      {
        if (*(void *)v678 != v489) {
          objc_enumerationMutation(v486);
        }
        PBDataWriterWriteSubmessage();
        ++v490;
      }
      while (v488 != v490);
      uint64_t v488 = [(NSArray *)v486 countByEnumeratingWithState:&v677 objects:v1044 count:16];
    }
    while (v488);
  }

  long long v676 = 0u;
  long long v675 = 0u;
  long long v674 = 0u;
  long long v673 = 0u;
  int v491 = self->_payloadStartCallRequestMetadatas;
  uint64_t v492 = [(NSArray *)v491 countByEnumeratingWithState:&v673 objects:v1043 count:16];
  if (v492)
  {
    uint64_t v493 = v492;
    uint64_t v494 = *(void *)v674;
    do
    {
      uint64_t v495 = 0;
      do
      {
        if (*(void *)v674 != v494) {
          objc_enumerationMutation(v491);
        }
        PBDataWriterWriteSubmessage();
        ++v495;
      }
      while (v493 != v495);
      uint64_t v493 = [(NSArray *)v491 countByEnumeratingWithState:&v673 objects:v1043 count:16];
    }
    while (v493);
  }

  long long v672 = 0u;
  long long v671 = 0u;
  long long v670 = 0u;
  long long v669 = 0u;
  int v496 = self->_payloadStringLists;
  uint64_t v497 = [(NSArray *)v496 countByEnumeratingWithState:&v669 objects:v1042 count:16];
  if (v497)
  {
    uint64_t v498 = v497;
    uint64_t v499 = *(void *)v670;
    do
    {
      uint64_t v500 = 0;
      do
      {
        if (*(void *)v670 != v499) {
          objc_enumerationMutation(v496);
        }
        PBDataWriterWriteSubmessage();
        ++v500;
      }
      while (v498 != v500);
      uint64_t v498 = [(NSArray *)v496 countByEnumeratingWithState:&v669 objects:v1042 count:16];
    }
    while (v498);
  }

  long long v668 = 0u;
  long long v667 = 0u;
  long long v666 = 0u;
  long long v665 = 0u;
  int v501 = self->_payloadStringValues;
  uint64_t v502 = [(NSArray *)v501 countByEnumeratingWithState:&v665 objects:v1041 count:16];
  if (v502)
  {
    uint64_t v503 = v502;
    uint64_t v504 = *(void *)v666;
    do
    {
      uint64_t v505 = 0;
      do
      {
        if (*(void *)v666 != v504) {
          objc_enumerationMutation(v501);
        }
        PBDataWriterWriteSubmessage();
        ++v505;
      }
      while (v503 != v505);
      uint64_t v503 = [(NSArray *)v501 countByEnumeratingWithState:&v665 objects:v1041 count:16];
    }
    while (v503);
  }

  long long v663 = 0u;
  long long v664 = 0u;
  long long v661 = 0u;
  long long v662 = 0u;
  int v506 = self->_payloadSupportedTrafficIncidentTypes;
  uint64_t v507 = [(NSArray *)v506 countByEnumeratingWithState:&v661 objects:v1040 count:16];
  if (v507)
  {
    uint64_t v508 = v507;
    uint64_t v509 = *(void *)v662;
    do
    {
      uint64_t v510 = 0;
      do
      {
        if (*(void *)v662 != v509) {
          objc_enumerationMutation(v506);
        }
        PBDataWriterWriteSubmessage();
        ++v510;
      }
      while (v508 != v510);
      uint64_t v508 = [(NSArray *)v506 countByEnumeratingWithState:&v661 objects:v1040 count:16];
    }
    while (v508);
  }

  long long v659 = 0u;
  long long v660 = 0u;
  long long v657 = 0u;
  long long v658 = 0u;
  int v511 = self->_payloadTasks;
  uint64_t v512 = [(NSArray *)v511 countByEnumeratingWithState:&v657 objects:v1039 count:16];
  if (v512)
  {
    uint64_t v513 = v512;
    uint64_t v514 = *(void *)v658;
    do
    {
      uint64_t v515 = 0;
      do
      {
        if (*(void *)v658 != v514) {
          objc_enumerationMutation(v511);
        }
        PBDataWriterWriteSubmessage();
        ++v515;
      }
      while (v513 != v515);
      uint64_t v513 = [(NSArray *)v511 countByEnumeratingWithState:&v657 objects:v1039 count:16];
    }
    while (v513);
  }

  long long v655 = 0u;
  long long v656 = 0u;
  long long v653 = 0u;
  long long v654 = 0u;
  int v516 = self->_payloadTaskLists;
  uint64_t v517 = [(NSArray *)v516 countByEnumeratingWithState:&v653 objects:v1038 count:16];
  if (v517)
  {
    uint64_t v518 = v517;
    uint64_t v519 = *(void *)v654;
    do
    {
      uint64_t v520 = 0;
      do
      {
        if (*(void *)v654 != v519) {
          objc_enumerationMutation(v516);
        }
        PBDataWriterWriteSubmessage();
        ++v520;
      }
      while (v518 != v520);
      uint64_t v518 = [(NSArray *)v516 countByEnumeratingWithState:&v653 objects:v1038 count:16];
    }
    while (v518);
  }

  if (self->_payloadTaskPriorities.count)
  {
    unint64_t v521 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v521;
    }
    while (v521 < self->_payloadTaskPriorities.count);
  }
  if (self->_payloadTaskReferences.count)
  {
    unint64_t v522 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v522;
    }
    while (v522 < self->_payloadTaskReferences.count);
  }
  if (self->_payloadTaskStatus.count)
  {
    unint64_t v523 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v523;
    }
    while (v523 < self->_payloadTaskStatus.count);
  }
  long long v651 = 0u;
  long long v652 = 0u;
  long long v649 = 0u;
  long long v650 = 0u;
  uint64_t v524 = self->_payloadTemperatureLists;
  uint64_t v525 = [(NSArray *)v524 countByEnumeratingWithState:&v649 objects:v1037 count:16];
  if (v525)
  {
    uint64_t v526 = v525;
    uint64_t v527 = *(void *)v650;
    do
    {
      uint64_t v528 = 0;
      do
      {
        if (*(void *)v650 != v527) {
          objc_enumerationMutation(v524);
        }
        PBDataWriterWriteSubmessage();
        ++v528;
      }
      while (v526 != v528);
      uint64_t v526 = [(NSArray *)v524 countByEnumeratingWithState:&v649 objects:v1037 count:16];
    }
    while (v526);
  }

  long long v647 = 0u;
  long long v648 = 0u;
  long long v645 = 0u;
  long long v646 = 0u;
  unint64_t v529 = self->_payloadTemperatureValues;
  uint64_t v530 = [(NSArray *)v529 countByEnumeratingWithState:&v645 objects:v1036 count:16];
  if (v530)
  {
    uint64_t v531 = v530;
    uint64_t v532 = *(void *)v646;
    do
    {
      uint64_t v533 = 0;
      do
      {
        if (*(void *)v646 != v532) {
          objc_enumerationMutation(v529);
        }
        PBDataWriterWriteSubmessage();
        ++v533;
      }
      while (v531 != v533);
      uint64_t v531 = [(NSArray *)v529 countByEnumeratingWithState:&v645 objects:v1036 count:16];
    }
    while (v531);
  }

  long long v643 = 0u;
  long long v644 = 0u;
  long long v641 = 0u;
  long long v642 = 0u;
  uint64_t v534 = self->_payloadTemporalEventTriggers;
  uint64_t v535 = [(NSArray *)v534 countByEnumeratingWithState:&v641 objects:v1035 count:16];
  if (v535)
  {
    uint64_t v536 = v535;
    uint64_t v537 = *(void *)v642;
    do
    {
      uint64_t v538 = 0;
      do
      {
        if (*(void *)v642 != v537) {
          objc_enumerationMutation(v534);
        }
        PBDataWriterWriteSubmessage();
        ++v538;
      }
      while (v536 != v538);
      uint64_t v536 = [(NSArray *)v534 countByEnumeratingWithState:&v641 objects:v1035 count:16];
    }
    while (v536);
  }

  if (self->_payloadTemporalEventTriggerTypes.count)
  {
    unint64_t v539 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v539;
    }
    while (v539 < self->_payloadTemporalEventTriggerTypes.count);
  }
  long long v639 = 0u;
  long long v640 = 0u;
  long long v637 = 0u;
  long long v638 = 0u;
  id v540 = self->_payloadTimers;
  uint64_t v541 = [(NSArray *)v540 countByEnumeratingWithState:&v637 objects:v1034 count:16];
  if (v541)
  {
    uint64_t v542 = v541;
    uint64_t v543 = *(void *)v638;
    do
    {
      uint64_t v544 = 0;
      do
      {
        if (*(void *)v638 != v543) {
          objc_enumerationMutation(v540);
        }
        PBDataWriterWriteSubmessage();
        ++v544;
      }
      while (v542 != v544);
      uint64_t v542 = [(NSArray *)v540 countByEnumeratingWithState:&v637 objects:v1034 count:16];
    }
    while (v542);
  }

  if (self->_payloadTimerStates.count)
  {
    unint64_t v545 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v545;
    }
    while (v545 < self->_payloadTimerStates.count);
  }
  if (self->_payloadTimerTypes.count)
  {
    unint64_t v546 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v546;
    }
    while (v546 < self->_payloadTimerTypes.count);
  }
  long long v635 = 0u;
  long long v636 = 0u;
  long long v633 = 0u;
  long long v634 = 0u;
  id v547 = self->_payloadURLValues;
  uint64_t v548 = [(NSArray *)v547 countByEnumeratingWithState:&v633 objects:v1033 count:16];
  if (v548)
  {
    uint64_t v549 = v548;
    uint64_t v550 = *(void *)v634;
    do
    {
      uint64_t v551 = 0;
      do
      {
        if (*(void *)v634 != v550) {
          objc_enumerationMutation(v547);
        }
        PBDataWriterWriteSubmessage();
        ++v551;
      }
      while (v549 != v551);
      uint64_t v549 = [(NSArray *)v547 countByEnumeratingWithState:&v633 objects:v1033 count:16];
    }
    while (v549);
  }

  if (self->_payloadUpdateAlarmOperations.count)
  {
    unint64_t v552 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v552;
    }
    while (v552 < self->_payloadUpdateAlarmOperations.count);
  }
  if (self->_payloadUserNotificationTypes.count)
  {
    unint64_t v553 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v553;
    }
    while (v553 < self->_payloadUserNotificationTypes.count);
  }
  if (self->_payloadVisualCodeTypes.count)
  {
    unint64_t v554 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v554;
    }
    while (v554 < self->_payloadVisualCodeTypes.count);
  }
  long long v631 = 0u;
  long long v632 = 0u;
  long long v629 = 0u;
  long long v630 = 0u;
  uint64_t v555 = self->_payloadVoiceCommandDeviceInformations;
  uint64_t v556 = [(NSArray *)v555 countByEnumeratingWithState:&v629 objects:v1032 count:16];
  if (v556)
  {
    uint64_t v557 = v556;
    uint64_t v558 = *(void *)v630;
    do
    {
      uint64_t v559 = 0;
      do
      {
        if (*(void *)v630 != v558) {
          objc_enumerationMutation(v555);
        }
        PBDataWriterWriteSubmessage();
        ++v559;
      }
      while (v557 != v559);
      uint64_t v557 = [(NSArray *)v555 countByEnumeratingWithState:&v629 objects:v1032 count:16];
    }
    while (v557);
  }

  long long v627 = 0u;
  long long v628 = 0u;
  long long v625 = 0u;
  long long v626 = 0u;
  v560 = self->_payloadVolumeValues;
  uint64_t v561 = [(NSArray *)v560 countByEnumeratingWithState:&v625 objects:v1031 count:16];
  if (v561)
  {
    uint64_t v562 = v561;
    uint64_t v563 = *(void *)v626;
    do
    {
      uint64_t v564 = 0;
      do
      {
        if (*(void *)v626 != v563) {
          objc_enumerationMutation(v560);
        }
        PBDataWriterWriteSubmessage();
        ++v564;
      }
      while (v562 != v564);
      uint64_t v562 = [(NSArray *)v560 countByEnumeratingWithState:&v625 objects:v1031 count:16];
    }
    while (v562);
  }

  long long v623 = 0u;
  long long v624 = 0u;
  long long v621 = 0u;
  long long v622 = 0u;
  unint64_t v565 = self->_payloadWellnessMetadataPairs;
  uint64_t v566 = [(NSArray *)v565 countByEnumeratingWithState:&v621 objects:v1030 count:16];
  if (v566)
  {
    uint64_t v567 = v566;
    uint64_t v568 = *(void *)v622;
    do
    {
      uint64_t v569 = 0;
      do
      {
        if (*(void *)v622 != v568) {
          objc_enumerationMutation(v565);
        }
        PBDataWriterWriteSubmessage();
        ++v569;
      }
      while (v567 != v569);
      uint64_t v567 = [(NSArray *)v565 countByEnumeratingWithState:&v621 objects:v1030 count:16];
    }
    while (v567);
  }

  long long v619 = 0u;
  long long v620 = 0u;
  long long v617 = 0u;
  long long v618 = 0u;
  unsigned int v570 = self->_payloadWellnessObjectResultValues;
  uint64_t v571 = [(NSArray *)v570 countByEnumeratingWithState:&v617 objects:v1029 count:16];
  if (v571)
  {
    uint64_t v572 = v571;
    uint64_t v573 = *(void *)v618;
    do
    {
      uint64_t v574 = 0;
      do
      {
        if (*(void *)v618 != v573) {
          objc_enumerationMutation(v570);
        }
        PBDataWriterWriteSubmessage();
        ++v574;
      }
      while (v572 != v574);
      uint64_t v572 = [(NSArray *)v570 countByEnumeratingWithState:&v617 objects:v1029 count:16];
    }
    while (v572);
  }

  if (self->_payloadWellnessObjectTypes.count)
  {
    unint64_t v575 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v575;
    }
    while (v575 < self->_payloadWellnessObjectTypes.count);
  }
  if (self->_payloadWellnessQueryResultTypes.count)
  {
    unint64_t v576 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v576;
    }
    while (v576 < self->_payloadWellnessQueryResultTypes.count);
  }
  if (self->_payloadWellnessQuestionTypes.count)
  {
    unint64_t v577 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v577;
    }
    while (v577 < self->_payloadWellnessQuestionTypes.count);
  }
  long long v615 = 0u;
  long long v616 = 0u;
  long long v613 = 0u;
  long long v614 = 0u;
  v578 = self->_payloadWellnessUnitTypes;
  uint64_t v579 = [(NSArray *)v578 countByEnumeratingWithState:&v613 objects:v1028 count:16];
  if (v579)
  {
    uint64_t v580 = v579;
    uint64_t v581 = *(void *)v614;
    do
    {
      uint64_t v582 = 0;
      do
      {
        if (*(void *)v614 != v581) {
          objc_enumerationMutation(v578);
        }
        PBDataWriterWriteSubmessage();
        ++v582;
      }
      while (v580 != v582);
      uint64_t v580 = [(NSArray *)v578 countByEnumeratingWithState:&v613 objects:v1028 count:16];
    }
    while (v580);
  }

  long long v611 = 0u;
  long long v612 = 0u;
  long long v609 = 0u;
  long long v610 = 0u;
  uint64_t v583 = self->_payloadWellnessValues;
  uint64_t v584 = [(NSArray *)v583 countByEnumeratingWithState:&v609 objects:v1027 count:16];
  if (v584)
  {
    uint64_t v585 = v584;
    uint64_t v586 = *(void *)v610;
    do
    {
      uint64_t v587 = 0;
      do
      {
        if (*(void *)v610 != v586) {
          objc_enumerationMutation(v583);
        }
        PBDataWriterWriteSubmessage();
        ++v587;
      }
      while (v585 != v587);
      uint64_t v585 = [(NSArray *)v583 countByEnumeratingWithState:&v609 objects:v1027 count:16];
    }
    while (v585);
  }

  long long v607 = 0u;
  long long v608 = 0u;
  long long v605 = 0u;
  long long v606 = 0u;
  uint64_t v588 = self->_payloadWorkoutAssociatedItems;
  uint64_t v589 = [(NSArray *)v588 countByEnumeratingWithState:&v605 objects:v1026 count:16];
  if (v589)
  {
    uint64_t v590 = v589;
    uint64_t v591 = *(void *)v606;
    do
    {
      uint64_t v592 = 0;
      do
      {
        if (*(void *)v606 != v591) {
          objc_enumerationMutation(v588);
        }
        PBDataWriterWriteSubmessage();
        ++v592;
      }
      while (v590 != v592);
      uint64_t v590 = [(NSArray *)v588 countByEnumeratingWithState:&v605 objects:v1026 count:16];
    }
    while (v590);
  }

  long long v603 = 0u;
  long long v604 = 0u;
  long long v601 = 0u;
  long long v602 = 0u;
  v593 = self->_payloadWorkoutCustomizations;
  uint64_t v594 = [(NSArray *)v593 countByEnumeratingWithState:&v601 objects:v1025 count:16];
  if (v594)
  {
    uint64_t v595 = v594;
    uint64_t v596 = *(void *)v602;
    do
    {
      uint64_t v597 = 0;
      do
      {
        if (*(void *)v602 != v596) {
          objc_enumerationMutation(v593);
        }
        PBDataWriterWriteSubmessage();
        ++v597;
      }
      while (v595 != v597);
      uint64_t v595 = [(NSArray *)v593 countByEnumeratingWithState:&v601 objects:v1025 count:16];
    }
    while (v595);
  }

  if (self->_payloadWorkoutGoalUnitTypes.count)
  {
    unint64_t v598 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v598;
    }
    while (v598 < self->_payloadWorkoutGoalUnitTypes.count);
  }
  if (self->_payloadWorkoutLocationTypes.count)
  {
    unint64_t v599 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v599;
    }
    while (v599 < self->_payloadWorkoutLocationTypes.count);
  }
  if (self->_payloadWorkoutSequenceLabels.count)
  {
    unint64_t v600 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v600;
    }
    while (v600 < self->_payloadWorkoutSequenceLabels.count);
  }
  if ([(_INPBIntentSlotValue *)self hasType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)setPayloadPrimitiveInts:(id)a3
{
  self->_payloadPrimitiveInts = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadWorkoutCustomizations, 0);
  objc_storeStrong((id *)&self->_payloadWorkoutAssociatedItems, 0);
  objc_storeStrong((id *)&self->_payloadWellnessValues, 0);
  objc_storeStrong((id *)&self->_payloadWellnessUnitTypes, 0);
  objc_storeStrong((id *)&self->_payloadWellnessObjectResultValues, 0);
  objc_storeStrong((id *)&self->_payloadWellnessMetadataPairs, 0);
  objc_storeStrong((id *)&self->_payloadVolumeValues, 0);
  objc_storeStrong((id *)&self->_payloadVoiceCommandDeviceInformations, 0);
  objc_storeStrong((id *)&self->_payloadURLValues, 0);
  objc_storeStrong((id *)&self->_payloadTimers, 0);
  objc_storeStrong((id *)&self->_payloadTemporalEventTriggers, 0);
  objc_storeStrong((id *)&self->_payloadTemperatureValues, 0);
  objc_storeStrong((id *)&self->_payloadTemperatureLists, 0);
  objc_storeStrong((id *)&self->_payloadTaskLists, 0);
  objc_storeStrong((id *)&self->_payloadTasks, 0);
  objc_storeStrong((id *)&self->_payloadSupportedTrafficIncidentTypes, 0);
  objc_storeStrong((id *)&self->_payloadStringValues, 0);
  objc_storeStrong((id *)&self->_payloadStringLists, 0);
  objc_storeStrong((id *)&self->_payloadStartCallRequestMetadatas, 0);
  objc_storeStrong((id *)&self->_payloadSpeedValues, 0);
  objc_storeStrong((id *)&self->_payloadSpatialEventTriggers, 0);
  objc_storeStrong((id *)&self->_payloadSleepAlarmAttributes, 0);
  objc_storeStrong((id *)&self->_payloadShareDestinations, 0);
  objc_storeStrong((id *)&self->_payloadSettingMetadatas, 0);
  objc_storeStrong((id *)&self->_payloadSendMessageAttachments, 0);
  objc_storeStrong((id *)&self->_payloadPrivateUpdateMediaAffinityIntentDatas, 0);
  objc_storeStrong((id *)&self->_payloadPrivateSearchForMediaIntentDatas, 0);
  objc_storeStrong((id *)&self->_payloadPrivatePlayMediaIntentDatas, 0);
  objc_storeStrong((id *)&self->_payloadPrivateAddMediaIntentDatas, 0);
  objc_storeStrong((id *)&self->_payloadPrimitiveStrings, 0);
  objc_storeStrong((id *)&self->_payloadPrimitiveLongs, 0);
  objc_storeStrong((id *)&self->_payloadPrimitiveInts, 0);
  objc_storeStrong((id *)&self->_payloadPrimitiveDoubles, 0);
  objc_storeStrong((id *)&self->_payloadPrimitiveBools, 0);
  objc_storeStrong((id *)&self->_payloadPlaceLists, 0);
  objc_storeStrong((id *)&self->_payloadPlaces, 0);
  objc_storeStrong((id *)&self->_payloadPaymentMethodValues, 0);
  objc_storeStrong((id *)&self->_payloadPaymentMethodLists, 0);
  objc_storeStrong((id *)&self->_payloadPaymentAmountValues, 0);
  objc_storeStrong((id *)&self->_payloadNumericSettingValues, 0);
  objc_storeStrong((id *)&self->_payloadNoteContents, 0);
  objc_storeStrong((id *)&self->_payloadNotes, 0);
  objc_storeStrong((id *)&self->_payloadModifyRelationships, 0);
  objc_storeStrong((id *)&self->_payloadModifyNicknames, 0);
  objc_storeStrong((id *)&self->_payloadMediaSearchs, 0);
  objc_storeStrong((id *)&self->_payloadMediaItemValues, 0);
  objc_storeStrong((id *)&self->_payloadMediaItemGroups, 0);
  objc_storeStrong((id *)&self->_payloadMediaDestinations, 0);
  objc_storeStrong((id *)&self->_payloadMassValues, 0);
  objc_storeStrong((id *)&self->_payloadLongValues, 0);
  objc_storeStrong((id *)&self->_payloadLongLists, 0);
  objc_storeStrong((id *)&self->_payloadLocationLists, 0);
  objc_storeStrong((id *)&self->_payloadLocations, 0);
  objc_storeStrong((id *)&self->_payloadIntentExecutionResults, 0);
  objc_storeStrong((id *)&self->_payloadIntents, 0);
  objc_storeStrong((id *)&self->_payloadIntegerValues, 0);
  objc_storeStrong((id *)&self->_payloadIntegerLists, 0);
  objc_storeStrong((id *)&self->_payloadHomeUserTasks, 0);
  objc_storeStrong((id *)&self->_payloadHomeFilters, 0);
  objc_storeStrong((id *)&self->_payloadHomeEntities, 0);
  objc_storeStrong((id *)&self->_payloadHomeAttributeValues, 0);
  objc_storeStrong((id *)&self->_payloadHomeAttributes, 0);
  objc_storeStrong((id *)&self->_payloadGetSettingResponseDatas, 0);
  objc_storeStrong((id *)&self->_payloadGeographicalFeatureLists, 0);
  objc_storeStrong((id *)&self->_payloadGeographicalFeatures, 0);
  objc_storeStrong((id *)&self->_payloadFinancialAccountValues, 0);
  objc_storeStrong((id *)&self->_payloadFilePropertyValues, 0);
  objc_storeStrong((id *)&self->_payloadFileProperties, 0);
  objc_storeStrong((id *)&self->_payloadFiles, 0);
  objc_storeStrong((id *)&self->_payloadEventParticipants, 0);
  objc_storeStrong((id *)&self->_payloadEventLists, 0);
  objc_storeStrong((id *)&self->_payloadEvents, 0);
  objc_storeStrong((id *)&self->_payloadEnumerations, 0);
  objc_storeStrong((id *)&self->_payloadEnergyValues, 0);
  objc_storeStrong((id *)&self->_payloadDoubleValues, 0);
  objc_storeStrong((id *)&self->_payloadDoubleLists, 0);
  objc_storeStrong((id *)&self->_payloadDistanceValues, 0);
  objc_storeStrong((id *)&self->_payloadDistanceLists, 0);
  objc_storeStrong((id *)&self->_payloadDialingContacts, 0);
  objc_storeStrong((id *)&self->_payloadDeviceDetails, 0);
  objc_storeStrong((id *)&self->_payloadDevices, 0);
  objc_storeStrong((id *)&self->_payloadDateTimeValues, 0);
  objc_storeStrong((id *)&self->_payloadDateTimeRangeValues, 0);
  objc_storeStrong((id *)&self->_payloadDateTimeRangeLists, 0);
  objc_storeStrong((id *)&self->_payloadDataStringLists, 0);
  objc_storeStrong((id *)&self->_payloadDataStrings, 0);
  objc_storeStrong((id *)&self->_payloadCustomObjects, 0);
  objc_storeStrong((id *)&self->_payloadCurrencyAmounts, 0);
  objc_storeStrong((id *)&self->_payloadContactValues, 0);
  objc_storeStrong((id *)&self->_payloadContactLists, 0);
  objc_storeStrong((id *)&self->_payloadContactEventTriggers, 0);
  objc_storeStrong((id *)&self->_payloadChargingConnectorTypes, 0);
  objc_storeStrong((id *)&self->_payloadCallRecordValues, 0);
  objc_storeStrong((id *)&self->_payloadCallRecordFilters, 0);
  objc_storeStrong((id *)&self->_payloadCallGroupConversations, 0);
  objc_storeStrong((id *)&self->_payloadCallGroups, 0);
  objc_storeStrong((id *)&self->_payloadCalendarEvents, 0);
  objc_storeStrong((id *)&self->_payloadBillPayeeValues, 0);
  objc_storeStrong((id *)&self->_payloadBillDetailsValues, 0);
  objc_storeStrong((id *)&self->_payloadArchivedObjects, 0);
  objc_storeStrong((id *)&self->_payloadAppIdentifiers, 0);
  objc_storeStrong((id *)&self->_payloadAnnouncements, 0);
  objc_storeStrong((id *)&self->_payloadAlarmSearchs, 0);
  objc_storeStrong((id *)&self->_payloadAlarms, 0);
  objc_storeStrong((id *)&self->_payloadActivityLists, 0);

  objc_storeStrong((id *)&self->_payloadActivities, 0);
}

- (int)type
{
  return self->_type;
}

- (NSArray)payloadWorkoutCustomizations
{
  return self->_payloadWorkoutCustomizations;
}

- (NSArray)payloadWorkoutAssociatedItems
{
  return self->_payloadWorkoutAssociatedItems;
}

- (NSArray)payloadWellnessValues
{
  return self->_payloadWellnessValues;
}

- (NSArray)payloadWellnessUnitTypes
{
  return self->_payloadWellnessUnitTypes;
}

- (NSArray)payloadWellnessObjectResultValues
{
  return self->_payloadWellnessObjectResultValues;
}

- (NSArray)payloadWellnessMetadataPairs
{
  return self->_payloadWellnessMetadataPairs;
}

- (NSArray)payloadVolumeValues
{
  return self->_payloadVolumeValues;
}

- (NSArray)payloadVoiceCommandDeviceInformations
{
  return self->_payloadVoiceCommandDeviceInformations;
}

- (NSArray)payloadURLValues
{
  return self->_payloadURLValues;
}

- (NSArray)payloadTimers
{
  return self->_payloadTimers;
}

- (NSArray)payloadTemporalEventTriggers
{
  return self->_payloadTemporalEventTriggers;
}

- (NSArray)payloadTemperatureValues
{
  return self->_payloadTemperatureValues;
}

- (NSArray)payloadTemperatureLists
{
  return self->_payloadTemperatureLists;
}

- (NSArray)payloadTaskLists
{
  return self->_payloadTaskLists;
}

- (NSArray)payloadTasks
{
  return self->_payloadTasks;
}

- (NSArray)payloadSupportedTrafficIncidentTypes
{
  return self->_payloadSupportedTrafficIncidentTypes;
}

- (NSArray)payloadStringValues
{
  return self->_payloadStringValues;
}

- (NSArray)payloadStringLists
{
  return self->_payloadStringLists;
}

- (NSArray)payloadStartCallRequestMetadatas
{
  return self->_payloadStartCallRequestMetadatas;
}

- (NSArray)payloadSpeedValues
{
  return self->_payloadSpeedValues;
}

- (NSArray)payloadSpatialEventTriggers
{
  return self->_payloadSpatialEventTriggers;
}

- (NSArray)payloadSleepAlarmAttributes
{
  return self->_payloadSleepAlarmAttributes;
}

- (NSArray)payloadShareDestinations
{
  return self->_payloadShareDestinations;
}

- (NSArray)payloadSettingMetadatas
{
  return self->_payloadSettingMetadatas;
}

- (NSArray)payloadSendMessageAttachments
{
  return self->_payloadSendMessageAttachments;
}

- (NSArray)payloadPrivateUpdateMediaAffinityIntentDatas
{
  return self->_payloadPrivateUpdateMediaAffinityIntentDatas;
}

- (NSArray)payloadPrivateSearchForMediaIntentDatas
{
  return self->_payloadPrivateSearchForMediaIntentDatas;
}

- (NSArray)payloadPrivatePlayMediaIntentDatas
{
  return self->_payloadPrivatePlayMediaIntentDatas;
}

- (NSArray)payloadPrivateAddMediaIntentDatas
{
  return self->_payloadPrivateAddMediaIntentDatas;
}

- (NSArray)payloadPrimitiveStrings
{
  return self->_payloadPrimitiveStrings;
}

- (NSArray)payloadPrimitiveLongs
{
  return self->_payloadPrimitiveLongs;
}

- (NSArray)payloadPrimitiveInts
{
  return self->_payloadPrimitiveInts;
}

- (NSArray)payloadPrimitiveDoubles
{
  return self->_payloadPrimitiveDoubles;
}

- (NSArray)payloadPrimitiveBools
{
  return self->_payloadPrimitiveBools;
}

- (NSArray)payloadPlaceLists
{
  return self->_payloadPlaceLists;
}

- (NSArray)payloadPlaces
{
  return self->_payloadPlaces;
}

- (NSArray)payloadPaymentMethodValues
{
  return self->_payloadPaymentMethodValues;
}

- (NSArray)payloadPaymentMethodLists
{
  return self->_payloadPaymentMethodLists;
}

- (NSArray)payloadPaymentAmountValues
{
  return self->_payloadPaymentAmountValues;
}

- (NSArray)payloadNumericSettingValues
{
  return self->_payloadNumericSettingValues;
}

- (NSArray)payloadNoteContents
{
  return self->_payloadNoteContents;
}

- (NSArray)payloadNotes
{
  return self->_payloadNotes;
}

- (NSArray)payloadModifyRelationships
{
  return self->_payloadModifyRelationships;
}

- (NSArray)payloadModifyNicknames
{
  return self->_payloadModifyNicknames;
}

- (NSArray)payloadMediaSearchs
{
  return self->_payloadMediaSearchs;
}

- (NSArray)payloadMediaItemValues
{
  return self->_payloadMediaItemValues;
}

- (NSArray)payloadMediaItemGroups
{
  return self->_payloadMediaItemGroups;
}

- (NSArray)payloadMediaDestinations
{
  return self->_payloadMediaDestinations;
}

- (NSArray)payloadMassValues
{
  return self->_payloadMassValues;
}

- (NSArray)payloadLongValues
{
  return self->_payloadLongValues;
}

- (NSArray)payloadLongLists
{
  return self->_payloadLongLists;
}

- (NSArray)payloadLocationLists
{
  return self->_payloadLocationLists;
}

- (NSArray)payloadLocations
{
  return self->_payloadLocations;
}

- (NSArray)payloadIntentExecutionResults
{
  return self->_payloadIntentExecutionResults;
}

- (NSArray)payloadIntents
{
  return self->_payloadIntents;
}

- (NSArray)payloadIntegerValues
{
  return self->_payloadIntegerValues;
}

- (NSArray)payloadIntegerLists
{
  return self->_payloadIntegerLists;
}

- (NSArray)payloadHomeUserTasks
{
  return self->_payloadHomeUserTasks;
}

- (NSArray)payloadHomeFilters
{
  return self->_payloadHomeFilters;
}

- (NSArray)payloadHomeEntities
{
  return self->_payloadHomeEntities;
}

- (NSArray)payloadHomeAttributeValues
{
  return self->_payloadHomeAttributeValues;
}

- (NSArray)payloadGetSettingResponseDatas
{
  return self->_payloadGetSettingResponseDatas;
}

- (NSArray)payloadGeographicalFeatureLists
{
  return self->_payloadGeographicalFeatureLists;
}

- (NSArray)payloadGeographicalFeatures
{
  return self->_payloadGeographicalFeatures;
}

- (NSArray)payloadFinancialAccountValues
{
  return self->_payloadFinancialAccountValues;
}

- (NSArray)payloadFilePropertyValues
{
  return self->_payloadFilePropertyValues;
}

- (NSArray)payloadFileProperties
{
  return self->_payloadFileProperties;
}

- (NSArray)payloadFiles
{
  return self->_payloadFiles;
}

- (NSArray)payloadEventParticipants
{
  return self->_payloadEventParticipants;
}

- (NSArray)payloadEventLists
{
  return self->_payloadEventLists;
}

- (NSArray)payloadEvents
{
  return self->_payloadEvents;
}

- (NSArray)payloadEnumerations
{
  return self->_payloadEnumerations;
}

- (NSArray)payloadEnergyValues
{
  return self->_payloadEnergyValues;
}

- (NSArray)payloadDoubleValues
{
  return self->_payloadDoubleValues;
}

- (NSArray)payloadDoubleLists
{
  return self->_payloadDoubleLists;
}

- (NSArray)payloadDistanceValues
{
  return self->_payloadDistanceValues;
}

- (NSArray)payloadDistanceLists
{
  return self->_payloadDistanceLists;
}

- (NSArray)payloadDialingContacts
{
  return self->_payloadDialingContacts;
}

- (NSArray)payloadDeviceDetails
{
  return self->_payloadDeviceDetails;
}

- (NSArray)payloadDevices
{
  return self->_payloadDevices;
}

- (NSArray)payloadDateTimeValues
{
  return self->_payloadDateTimeValues;
}

- (NSArray)payloadDateTimeRangeValues
{
  return self->_payloadDateTimeRangeValues;
}

- (NSArray)payloadDateTimeRangeLists
{
  return self->_payloadDateTimeRangeLists;
}

- (NSArray)payloadDataStringLists
{
  return self->_payloadDataStringLists;
}

- (NSArray)payloadDataStrings
{
  return self->_payloadDataStrings;
}

- (NSArray)payloadCustomObjects
{
  return self->_payloadCustomObjects;
}

- (NSArray)payloadCurrencyAmounts
{
  return self->_payloadCurrencyAmounts;
}

- (NSArray)payloadContactValues
{
  return self->_payloadContactValues;
}

- (NSArray)payloadContactLists
{
  return self->_payloadContactLists;
}

- (NSArray)payloadContactEventTriggers
{
  return self->_payloadContactEventTriggers;
}

- (NSArray)payloadChargingConnectorTypes
{
  return self->_payloadChargingConnectorTypes;
}

- (NSArray)payloadCallRecordValues
{
  return self->_payloadCallRecordValues;
}

- (NSArray)payloadCallRecordFilters
{
  return self->_payloadCallRecordFilters;
}

- (NSArray)payloadCallGroupConversations
{
  return self->_payloadCallGroupConversations;
}

- (NSArray)payloadCallGroups
{
  return self->_payloadCallGroups;
}

- (NSArray)payloadCalendarEvents
{
  return self->_payloadCalendarEvents;
}

- (NSArray)payloadBillPayeeValues
{
  return self->_payloadBillPayeeValues;
}

- (NSArray)payloadBillDetailsValues
{
  return self->_payloadBillDetailsValues;
}

- (NSArray)payloadArchivedObjects
{
  return self->_payloadArchivedObjects;
}

- (NSArray)payloadAppIdentifiers
{
  return self->_payloadAppIdentifiers;
}

- (NSArray)payloadAnnouncements
{
  return self->_payloadAnnouncements;
}

- (NSArray)payloadAlarmSearchs
{
  return self->_payloadAlarmSearchs;
}

- (NSArray)payloadAlarms
{
  return self->_payloadAlarms;
}

- (NSArray)payloadActivityLists
{
  return self->_payloadActivityLists;
}

- (NSArray)payloadActivities
{
  return self->_payloadActivities;
}

- (unint64_t)hash
{
  uint64_t v177 = PBRepeatedInt32Hash();
  uint64_t v176 = [(NSArray *)self->_payloadActivities hash];
  uint64_t v175 = [(NSArray *)self->_payloadActivityLists hash];
  uint64_t v174 = [(NSArray *)self->_payloadAlarms hash];
  uint64_t v173 = PBRepeatedInt32Hash();
  uint64_t v172 = PBRepeatedInt32Hash();
  uint64_t v171 = [(NSArray *)self->_payloadAlarmSearchs hash];
  uint64_t v170 = PBRepeatedInt32Hash();
  uint64_t v169 = [(NSArray *)self->_payloadAnnouncements hash];
  uint64_t v168 = [(NSArray *)self->_payloadAppIdentifiers hash];
  uint64_t v167 = [(NSArray *)self->_payloadArchivedObjects hash];
  uint64_t v166 = PBRepeatedInt32Hash();
  uint64_t v165 = [(NSArray *)self->_payloadBillDetailsValues hash];
  uint64_t v164 = [(NSArray *)self->_payloadBillPayeeValues hash];
  uint64_t v163 = PBRepeatedInt32Hash();
  uint64_t v162 = PBRepeatedInt32Hash();
  uint64_t v161 = PBRepeatedInt32Hash();
  uint64_t v160 = [(NSArray *)self->_payloadCalendarEvents hash];
  uint64_t v159 = PBRepeatedInt32Hash();
  uint64_t v158 = PBRepeatedInt32Hash();
  uint64_t v157 = PBRepeatedInt32Hash();
  uint64_t v156 = [(NSArray *)self->_payloadCallGroups hash];
  uint64_t v155 = [(NSArray *)self->_payloadCallGroupConversations hash];
  uint64_t v154 = [(NSArray *)self->_payloadCallRecordFilters hash];
  uint64_t v153 = PBRepeatedInt32Hash();
  uint64_t v152 = [(NSArray *)self->_payloadCallRecordValues hash];
  uint64_t v151 = PBRepeatedInt32Hash();
  uint64_t v150 = PBRepeatedInt32Hash();
  uint64_t v149 = PBRepeatedInt32Hash();
  uint64_t v148 = PBRepeatedInt32Hash();
  uint64_t v147 = PBRepeatedInt32Hash();
  uint64_t v146 = PBRepeatedInt32Hash();
  uint64_t v145 = [(NSArray *)self->_payloadChargingConnectorTypes hash];
  uint64_t v144 = [(NSArray *)self->_payloadContactEventTriggers hash];
  uint64_t v143 = [(NSArray *)self->_payloadContactLists hash];
  uint64_t v142 = [(NSArray *)self->_payloadContactValues hash];
  uint64_t v141 = [(NSArray *)self->_payloadCurrencyAmounts hash];
  uint64_t v140 = [(NSArray *)self->_payloadCustomObjects hash];
  uint64_t v139 = [(NSArray *)self->_payloadDataStrings hash];
  uint64_t v138 = [(NSArray *)self->_payloadDataStringLists hash];
  uint64_t v137 = PBRepeatedInt32Hash();
  uint64_t v136 = [(NSArray *)self->_payloadDateTimeRangeLists hash];
  uint64_t v135 = [(NSArray *)self->_payloadDateTimeRangeValues hash];
  uint64_t v134 = [(NSArray *)self->_payloadDateTimeValues hash];
  uint64_t v133 = [(NSArray *)self->_payloadDevices hash];
  uint64_t v132 = [(NSArray *)self->_payloadDeviceDetails hash];
  uint64_t v131 = PBRepeatedInt32Hash();
  uint64_t v130 = [(NSArray *)self->_payloadDialingContacts hash];
  uint64_t v129 = [(NSArray *)self->_payloadDistanceLists hash];
  uint64_t v128 = [(NSArray *)self->_payloadDistanceValues hash];
  uint64_t v127 = [(NSArray *)self->_payloadDoubleLists hash];
  uint64_t v126 = [(NSArray *)self->_payloadDoubleValues hash];
  uint64_t v125 = [(NSArray *)self->_payloadEnergyValues hash];
  uint64_t v124 = [(NSArray *)self->_payloadEnumerations hash];
  uint64_t v123 = [(NSArray *)self->_payloadEvents hash];
  uint64_t v122 = PBRepeatedInt32Hash();
  uint64_t v121 = [(NSArray *)self->_payloadEventLists hash];
  uint64_t v120 = [(NSArray *)self->_payloadEventParticipants hash];
  uint64_t v119 = [(NSArray *)self->_payloadFiles hash];
  uint64_t v118 = PBRepeatedInt32Hash();
  uint64_t v117 = [(NSArray *)self->_payloadFileProperties hash];
  uint64_t v116 = PBRepeatedInt32Hash();
  uint64_t v115 = PBRepeatedInt32Hash();
  uint64_t v114 = [(NSArray *)self->_payloadFilePropertyValues hash];
  uint64_t v113 = PBRepeatedInt32Hash();
  uint64_t v112 = PBRepeatedInt32Hash();
  uint64_t v111 = PBRepeatedInt32Hash();
  uint64_t v110 = [(NSArray *)self->_payloadFinancialAccountValues hash];
  uint64_t v109 = [(NSArray *)self->_payloadGeographicalFeatures hash];
  uint64_t v108 = [(NSArray *)self->_payloadGeographicalFeatureLists hash];
  uint64_t v107 = [(NSArray *)self->_payloadGetSettingResponseDatas hash];
  uint64_t v106 = [(NSArray *)self->_payloadHomeAttributes hash];
  uint64_t v105 = PBRepeatedInt32Hash();
  uint64_t v104 = [(NSArray *)self->_payloadHomeAttributeValues hash];
  uint64_t v103 = PBRepeatedInt32Hash();
  uint64_t v102 = PBRepeatedInt32Hash();
  uint64_t v101 = [(NSArray *)self->_payloadHomeEntities hash];
  uint64_t v100 = PBRepeatedInt32Hash();
  uint64_t v99 = [(NSArray *)self->_payloadHomeFilters hash];
  uint64_t v98 = [(NSArray *)self->_payloadHomeUserTasks hash];
  uint64_t v97 = [(NSArray *)self->_payloadIntegerLists hash];
  uint64_t v96 = [(NSArray *)self->_payloadIntegerValues hash];
  uint64_t v95 = [(NSArray *)self->_payloadIntents hash];
  uint64_t v94 = [(NSArray *)self->_payloadIntentExecutionResults hash];
  uint64_t v93 = [(NSArray *)self->_payloadLocations hash];
  uint64_t v92 = [(NSArray *)self->_payloadLocationLists hash];
  uint64_t v91 = PBRepeatedInt32Hash();
  uint64_t v90 = [(NSArray *)self->_payloadLongLists hash];
  uint64_t v89 = [(NSArray *)self->_payloadLongValues hash];
  uint64_t v88 = [(NSArray *)self->_payloadMassValues hash];
  uint64_t v87 = PBRepeatedInt32Hash();
  uint64_t v86 = [(NSArray *)self->_payloadMediaDestinations hash];
  uint64_t v85 = [(NSArray *)self->_payloadMediaItemGroups hash];
  uint64_t v84 = [(NSArray *)self->_payloadMediaItemValues hash];
  uint64_t v83 = [(NSArray *)self->_payloadMediaSearchs hash];
  uint64_t v82 = PBRepeatedInt32Hash();
  uint64_t v81 = PBRepeatedInt32Hash();
  uint64_t v80 = PBRepeatedInt32Hash();
  uint64_t v79 = [(NSArray *)self->_payloadModifyNicknames hash];
  uint64_t v78 = [(NSArray *)self->_payloadModifyRelationships hash];
  uint64_t v77 = [(NSArray *)self->_payloadNotes hash];
  uint64_t v76 = [(NSArray *)self->_payloadNoteContents hash];
  uint64_t v75 = PBRepeatedInt32Hash();
  uint64_t v74 = PBRepeatedInt32Hash();
  uint64_t v73 = [(NSArray *)self->_payloadNumericSettingValues hash];
  uint64_t v72 = PBRepeatedInt32Hash();
  uint64_t v71 = PBRepeatedInt32Hash();
  uint64_t v70 = [(NSArray *)self->_payloadPaymentAmountValues hash];
  uint64_t v69 = [(NSArray *)self->_payloadPaymentMethodLists hash];
  uint64_t v68 = [(NSArray *)self->_payloadPaymentMethodValues hash];
  uint64_t v67 = PBRepeatedInt32Hash();
  uint64_t v66 = PBRepeatedInt32Hash();
  uint64_t v65 = PBRepeatedInt32Hash();
  uint64_t v64 = [(NSArray *)self->_payloadPlaces hash];
  uint64_t v63 = [(NSArray *)self->_payloadPlaceLists hash];
  uint64_t v62 = PBRepeatedInt32Hash();
  uint64_t v61 = PBRepeatedInt32Hash();
  uint64_t v60 = PBRepeatedInt32Hash();
  uint64_t v59 = [(NSArray *)self->_payloadPrimitiveBools hash];
  uint64_t v58 = [(NSArray *)self->_payloadPrimitiveDoubles hash];
  uint64_t v57 = [(NSArray *)self->_payloadPrimitiveInts hash];
  uint64_t v56 = [(NSArray *)self->_payloadPrimitiveLongs hash];
  uint64_t v55 = [(NSArray *)self->_payloadPrimitiveStrings hash];
  uint64_t v54 = [(NSArray *)self->_payloadPrivateAddMediaIntentDatas hash];
  uint64_t v53 = [(NSArray *)self->_payloadPrivatePlayMediaIntentDatas hash];
  uint64_t v52 = [(NSArray *)self->_payloadPrivateSearchForMediaIntentDatas hash];
  uint64_t v51 = [(NSArray *)self->_payloadPrivateUpdateMediaAffinityIntentDatas hash];
  uint64_t v50 = PBRepeatedInt32Hash();
  uint64_t v49 = PBRepeatedInt32Hash();
  uint64_t v48 = PBRepeatedInt32Hash();
  uint64_t v47 = PBRepeatedInt32Hash();
  uint64_t v46 = [(NSArray *)self->_payloadSendMessageAttachments hash];
  uint64_t v45 = PBRepeatedInt32Hash();
  uint64_t v44 = [(NSArray *)self->_payloadSettingMetadatas hash];
  uint64_t v43 = [(NSArray *)self->_payloadShareDestinations hash];
  uint64_t v42 = [(NSArray *)self->_payloadSleepAlarmAttributes hash];
  uint64_t v41 = [(NSArray *)self->_payloadSpatialEventTriggers hash];
  uint64_t v40 = [(NSArray *)self->_payloadSpeedValues hash];
  uint64_t v39 = [(NSArray *)self->_payloadStartCallRequestMetadatas hash];
  uint64_t v38 = [(NSArray *)self->_payloadStringLists hash];
  uint64_t v37 = [(NSArray *)self->_payloadStringValues hash];
  uint64_t v36 = [(NSArray *)self->_payloadSupportedTrafficIncidentTypes hash];
  uint64_t v35 = [(NSArray *)self->_payloadTasks hash];
  uint64_t v34 = [(NSArray *)self->_payloadTaskLists hash];
  uint64_t v33 = PBRepeatedInt32Hash();
  uint64_t v32 = PBRepeatedInt32Hash();
  uint64_t v31 = PBRepeatedInt32Hash();
  uint64_t v30 = [(NSArray *)self->_payloadTemperatureLists hash];
  uint64_t v29 = [(NSArray *)self->_payloadTemperatureValues hash];
  uint64_t v28 = [(NSArray *)self->_payloadTemporalEventTriggers hash];
  uint64_t v27 = PBRepeatedInt32Hash();
  uint64_t v26 = [(NSArray *)self->_payloadTimers hash];
  uint64_t v25 = PBRepeatedInt32Hash();
  uint64_t v24 = PBRepeatedInt32Hash();
  uint64_t v23 = [(NSArray *)self->_payloadURLValues hash];
  uint64_t v22 = PBRepeatedInt32Hash();
  uint64_t v21 = PBRepeatedInt32Hash();
  uint64_t v20 = PBRepeatedInt32Hash();
  uint64_t v19 = [(NSArray *)self->_payloadVoiceCommandDeviceInformations hash];
  uint64_t v18 = [(NSArray *)self->_payloadVolumeValues hash];
  uint64_t v17 = [(NSArray *)self->_payloadWellnessMetadataPairs hash];
  uint64_t v16 = [(NSArray *)self->_payloadWellnessObjectResultValues hash];
  uint64_t v15 = PBRepeatedInt32Hash();
  uint64_t v3 = PBRepeatedInt32Hash();
  uint64_t v4 = PBRepeatedInt32Hash();
  uint64_t v5 = [(NSArray *)self->_payloadWellnessUnitTypes hash];
  uint64_t v6 = [(NSArray *)self->_payloadWellnessValues hash];
  uint64_t v7 = [(NSArray *)self->_payloadWorkoutAssociatedItems hash];
  uint64_t v8 = [(NSArray *)self->_payloadWorkoutCustomizations hash];
  uint64_t v9 = PBRepeatedInt32Hash();
  uint64_t v10 = PBRepeatedInt32Hash();
  uint64_t v11 = PBRepeatedInt32Hash();
  if ([(_INPBIntentSlotValue *)self hasType]) {
    uint64_t v12 = 2654435761 * self->_type;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = v176 ^ v177 ^ v175 ^ v174 ^ v173 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v157 ^ v156 ^ v155 ^ v154 ^ v153 ^ v152 ^ v151 ^ v150 ^ v149 ^ v148 ^ v147 ^ v146 ^ v145 ^ v144 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v132 ^ v131 ^ v130 ^ v129 ^ v128 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v117 ^ v116 ^ v115 ^ v114 ^ v113 ^ v112 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97;
  return v13 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBIntentSlotValue allocWithZone:](_INPBIntentSlotValue, "allocWithZone:") init];
  PBRepeatedInt32Copy();
  uint64_t v6 = (void *)[(NSArray *)self->_payloadActivities copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadActivities:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_payloadActivityLists copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadActivityLists:v7];

  uint64_t v8 = (void *)[(NSArray *)self->_payloadAlarms copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadAlarms:v8];

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  uint64_t v9 = (void *)[(NSArray *)self->_payloadAlarmSearchs copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadAlarmSearchs:v9];

  PBRepeatedInt32Copy();
  uint64_t v10 = (void *)[(NSArray *)self->_payloadAnnouncements copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadAnnouncements:v10];

  uint64_t v11 = (void *)[(NSArray *)self->_payloadAppIdentifiers copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadAppIdentifiers:v11];

  uint64_t v12 = (void *)[(NSArray *)self->_payloadArchivedObjects copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadArchivedObjects:v12];

  PBRepeatedInt32Copy();
  uint64_t v13 = (void *)[(NSArray *)self->_payloadBillDetailsValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadBillDetailsValues:v13];

  uint64_t v14 = (void *)[(NSArray *)self->_payloadBillPayeeValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadBillPayeeValues:v14];

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  uint64_t v15 = (void *)[(NSArray *)self->_payloadCalendarEvents copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadCalendarEvents:v15];

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  uint64_t v16 = (void *)[(NSArray *)self->_payloadCallGroups copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadCallGroups:v16];

  uint64_t v17 = (void *)[(NSArray *)self->_payloadCallGroupConversations copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadCallGroupConversations:v17];

  uint64_t v18 = (void *)[(NSArray *)self->_payloadCallRecordFilters copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadCallRecordFilters:v18];

  PBRepeatedInt32Copy();
  uint64_t v19 = (void *)[(NSArray *)self->_payloadCallRecordValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadCallRecordValues:v19];

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  uint64_t v20 = (void *)[(NSArray *)self->_payloadChargingConnectorTypes copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadChargingConnectorTypes:v20];

  uint64_t v21 = (void *)[(NSArray *)self->_payloadContactEventTriggers copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadContactEventTriggers:v21];

  uint64_t v22 = (void *)[(NSArray *)self->_payloadContactLists copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadContactLists:v22];

  uint64_t v23 = (void *)[(NSArray *)self->_payloadContactValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadContactValues:v23];

  uint64_t v24 = (void *)[(NSArray *)self->_payloadCurrencyAmounts copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadCurrencyAmounts:v24];

  uint64_t v25 = (void *)[(NSArray *)self->_payloadCustomObjects copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadCustomObjects:v25];

  uint64_t v26 = (void *)[(NSArray *)self->_payloadDataStrings copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadDataStrings:v26];

  uint64_t v27 = (void *)[(NSArray *)self->_payloadDataStringLists copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadDataStringLists:v27];

  PBRepeatedInt32Copy();
  uint64_t v28 = (void *)[(NSArray *)self->_payloadDateTimeRangeLists copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadDateTimeRangeLists:v28];

  uint64_t v29 = (void *)[(NSArray *)self->_payloadDateTimeRangeValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadDateTimeRangeValues:v29];

  uint64_t v30 = (void *)[(NSArray *)self->_payloadDateTimeValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadDateTimeValues:v30];

  uint64_t v31 = (void *)[(NSArray *)self->_payloadDevices copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadDevices:v31];

  uint64_t v32 = (void *)[(NSArray *)self->_payloadDeviceDetails copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadDeviceDetails:v32];

  PBRepeatedInt32Copy();
  uint64_t v33 = (void *)[(NSArray *)self->_payloadDialingContacts copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadDialingContacts:v33];

  uint64_t v34 = (void *)[(NSArray *)self->_payloadDistanceLists copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadDistanceLists:v34];

  uint64_t v35 = (void *)[(NSArray *)self->_payloadDistanceValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadDistanceValues:v35];

  uint64_t v36 = (void *)[(NSArray *)self->_payloadDoubleLists copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadDoubleLists:v36];

  uint64_t v37 = (void *)[(NSArray *)self->_payloadDoubleValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadDoubleValues:v37];

  uint64_t v38 = (void *)[(NSArray *)self->_payloadEnergyValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadEnergyValues:v38];

  uint64_t v39 = (void *)[(NSArray *)self->_payloadEnumerations copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadEnumerations:v39];

  uint64_t v40 = (void *)[(NSArray *)self->_payloadEvents copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadEvents:v40];

  PBRepeatedInt32Copy();
  uint64_t v41 = (void *)[(NSArray *)self->_payloadEventLists copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadEventLists:v41];

  uint64_t v42 = (void *)[(NSArray *)self->_payloadEventParticipants copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadEventParticipants:v42];

  uint64_t v43 = (void *)[(NSArray *)self->_payloadFiles copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadFiles:v43];

  PBRepeatedInt32Copy();
  uint64_t v44 = (void *)[(NSArray *)self->_payloadFileProperties copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadFileProperties:v44];

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  uint64_t v45 = (void *)[(NSArray *)self->_payloadFilePropertyValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadFilePropertyValues:v45];

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  uint64_t v46 = (void *)[(NSArray *)self->_payloadFinancialAccountValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadFinancialAccountValues:v46];

  uint64_t v47 = (void *)[(NSArray *)self->_payloadGeographicalFeatures copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadGeographicalFeatures:v47];

  uint64_t v48 = (void *)[(NSArray *)self->_payloadGeographicalFeatureLists copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadGeographicalFeatureLists:v48];

  uint64_t v49 = (void *)[(NSArray *)self->_payloadGetSettingResponseDatas copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadGetSettingResponseDatas:v49];

  uint64_t v50 = (void *)[(NSArray *)self->_payloadHomeAttributes copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadHomeAttributes:v50];

  PBRepeatedInt32Copy();
  uint64_t v51 = (void *)[(NSArray *)self->_payloadHomeAttributeValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadHomeAttributeValues:v51];

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  uint64_t v52 = (void *)[(NSArray *)self->_payloadHomeEntities copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadHomeEntities:v52];

  PBRepeatedInt32Copy();
  uint64_t v53 = (void *)[(NSArray *)self->_payloadHomeFilters copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadHomeFilters:v53];

  uint64_t v54 = (void *)[(NSArray *)self->_payloadHomeUserTasks copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadHomeUserTasks:v54];

  uint64_t v55 = (void *)[(NSArray *)self->_payloadIntegerLists copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadIntegerLists:v55];

  uint64_t v56 = (void *)[(NSArray *)self->_payloadIntegerValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadIntegerValues:v56];

  uint64_t v57 = (void *)[(NSArray *)self->_payloadIntents copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadIntents:v57];

  uint64_t v58 = (void *)[(NSArray *)self->_payloadIntentExecutionResults copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadIntentExecutionResults:v58];

  uint64_t v59 = (void *)[(NSArray *)self->_payloadLocations copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadLocations:v59];

  uint64_t v60 = (void *)[(NSArray *)self->_payloadLocationLists copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadLocationLists:v60];

  PBRepeatedInt32Copy();
  uint64_t v61 = (void *)[(NSArray *)self->_payloadLongLists copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadLongLists:v61];

  uint64_t v62 = (void *)[(NSArray *)self->_payloadLongValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadLongValues:v62];

  uint64_t v63 = (void *)[(NSArray *)self->_payloadMassValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadMassValues:v63];

  PBRepeatedInt32Copy();
  uint64_t v64 = (void *)[(NSArray *)self->_payloadMediaDestinations copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadMediaDestinations:v64];

  uint64_t v65 = (void *)[(NSArray *)self->_payloadMediaItemGroups copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadMediaItemGroups:v65];

  uint64_t v66 = (void *)[(NSArray *)self->_payloadMediaItemValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadMediaItemValues:v66];

  uint64_t v67 = (void *)[(NSArray *)self->_payloadMediaSearchs copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadMediaSearchs:v67];

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  uint64_t v68 = (void *)[(NSArray *)self->_payloadModifyNicknames copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadModifyNicknames:v68];

  uint64_t v69 = (void *)[(NSArray *)self->_payloadModifyRelationships copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadModifyRelationships:v69];

  uint64_t v70 = (void *)[(NSArray *)self->_payloadNotes copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadNotes:v70];

  uint64_t v71 = (void *)[(NSArray *)self->_payloadNoteContents copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadNoteContents:v71];

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  uint64_t v72 = (void *)[(NSArray *)self->_payloadNumericSettingValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadNumericSettingValues:v72];

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  uint64_t v73 = (void *)[(NSArray *)self->_payloadPaymentAmountValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadPaymentAmountValues:v73];

  uint64_t v74 = (void *)[(NSArray *)self->_payloadPaymentMethodLists copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadPaymentMethodLists:v74];

  uint64_t v75 = (void *)[(NSArray *)self->_payloadPaymentMethodValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadPaymentMethodValues:v75];

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  uint64_t v76 = (void *)[(NSArray *)self->_payloadPlaces copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadPlaces:v76];

  uint64_t v77 = (void *)[(NSArray *)self->_payloadPlaceLists copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadPlaceLists:v77];

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  uint64_t v78 = (void *)[(NSArray *)self->_payloadPrimitiveBools copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadPrimitiveBools:v78];

  uint64_t v79 = (void *)[(NSArray *)self->_payloadPrimitiveDoubles copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadPrimitiveDoubles:v79];

  uint64_t v80 = (void *)[(NSArray *)self->_payloadPrimitiveInts copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadPrimitiveInts:v80];

  uint64_t v81 = (void *)[(NSArray *)self->_payloadPrimitiveLongs copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadPrimitiveLongs:v81];

  uint64_t v82 = (void *)[(NSArray *)self->_payloadPrimitiveStrings copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadPrimitiveStrings:v82];

  uint64_t v83 = (void *)[(NSArray *)self->_payloadPrivateAddMediaIntentDatas copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadPrivateAddMediaIntentDatas:v83];

  uint64_t v84 = (void *)[(NSArray *)self->_payloadPrivatePlayMediaIntentDatas copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadPrivatePlayMediaIntentDatas:v84];

  uint64_t v85 = (void *)[(NSArray *)self->_payloadPrivateSearchForMediaIntentDatas copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadPrivateSearchForMediaIntentDatas:v85];

  uint64_t v86 = (void *)[(NSArray *)self->_payloadPrivateUpdateMediaAffinityIntentDatas copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadPrivateUpdateMediaAffinityIntentDatas:v86];

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  uint64_t v87 = (void *)[(NSArray *)self->_payloadSendMessageAttachments copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadSendMessageAttachments:v87];

  PBRepeatedInt32Copy();
  uint64_t v88 = (void *)[(NSArray *)self->_payloadSettingMetadatas copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadSettingMetadatas:v88];

  uint64_t v89 = (void *)[(NSArray *)self->_payloadShareDestinations copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadShareDestinations:v89];

  uint64_t v90 = (void *)[(NSArray *)self->_payloadSleepAlarmAttributes copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadSleepAlarmAttributes:v90];

  uint64_t v91 = (void *)[(NSArray *)self->_payloadSpatialEventTriggers copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadSpatialEventTriggers:v91];

  uint64_t v92 = (void *)[(NSArray *)self->_payloadSpeedValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadSpeedValues:v92];

  uint64_t v93 = (void *)[(NSArray *)self->_payloadStartCallRequestMetadatas copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadStartCallRequestMetadatas:v93];

  uint64_t v94 = (void *)[(NSArray *)self->_payloadStringLists copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadStringLists:v94];

  uint64_t v95 = (void *)[(NSArray *)self->_payloadStringValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadStringValues:v95];

  uint64_t v96 = (void *)[(NSArray *)self->_payloadSupportedTrafficIncidentTypes copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadSupportedTrafficIncidentTypes:v96];

  uint64_t v97 = (void *)[(NSArray *)self->_payloadTasks copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadTasks:v97];

  uint64_t v98 = (void *)[(NSArray *)self->_payloadTaskLists copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadTaskLists:v98];

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  uint64_t v99 = (void *)[(NSArray *)self->_payloadTemperatureLists copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadTemperatureLists:v99];

  uint64_t v100 = (void *)[(NSArray *)self->_payloadTemperatureValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadTemperatureValues:v100];

  uint64_t v101 = (void *)[(NSArray *)self->_payloadTemporalEventTriggers copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadTemporalEventTriggers:v101];

  PBRepeatedInt32Copy();
  uint64_t v102 = (void *)[(NSArray *)self->_payloadTimers copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadTimers:v102];

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  uint64_t v103 = (void *)[(NSArray *)self->_payloadURLValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadURLValues:v103];

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  uint64_t v104 = (void *)[(NSArray *)self->_payloadVoiceCommandDeviceInformations copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadVoiceCommandDeviceInformations:v104];

  uint64_t v105 = (void *)[(NSArray *)self->_payloadVolumeValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadVolumeValues:v105];

  uint64_t v106 = (void *)[(NSArray *)self->_payloadWellnessMetadataPairs copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadWellnessMetadataPairs:v106];

  uint64_t v107 = (void *)[(NSArray *)self->_payloadWellnessObjectResultValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadWellnessObjectResultValues:v107];

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  uint64_t v108 = (void *)[(NSArray *)self->_payloadWellnessUnitTypes copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadWellnessUnitTypes:v108];

  uint64_t v109 = (void *)[(NSArray *)self->_payloadWellnessValues copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadWellnessValues:v109];

  uint64_t v110 = (void *)[(NSArray *)self->_payloadWorkoutAssociatedItems copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadWorkoutAssociatedItems:v110];

  uint64_t v111 = (void *)[(NSArray *)self->_payloadWorkoutCustomizations copyWithZone:a3];
  [(_INPBIntentSlotValue *)v5 setPayloadWorkoutCustomizations:v111];

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  if ([(_INPBIntentSlotValue *)self hasType]) {
    [(_INPBIntentSlotValue *)v5 setType:[(_INPBIntentSlotValue *)self type]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBIntentSlotValue *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBIntentSlotValue)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBIntentSlotValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBIntentSlotValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBIntentSlotValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(_INPBIntentSlotValue *)self clearPayloadAccountTypes];
  [(_INPBIntentSlotValue *)self clearPayloadAlarmPeriods];
  [(_INPBIntentSlotValue *)self clearPayloadAlarmRepeatSchedules];
  [(_INPBIntentSlotValue *)self clearPayloadAlarmSearchTypes];
  [(_INPBIntentSlotValue *)self clearPayloadBalanceTypes];
  [(_INPBIntentSlotValue *)self clearPayloadBillTypes];
  [(_INPBIntentSlotValue *)self clearPayloadBinarySettingValues];
  [(_INPBIntentSlotValue *)self clearPayloadBoundedSettingValues];
  [(_INPBIntentSlotValue *)self clearPayloadCallAudioRoutes];
  [(_INPBIntentSlotValue *)self clearPayloadCallCapabilities];
  [(_INPBIntentSlotValue *)self clearPayloadCallDestinationTypes];
  [(_INPBIntentSlotValue *)self clearPayloadCallRecordTypes];
  [(_INPBIntentSlotValue *)self clearPayloadCarAirCirculationModes];
  [(_INPBIntentSlotValue *)self clearPayloadCarAudioSources];
  [(_INPBIntentSlotValue *)self clearPayloadCarDefrosters];
  [(_INPBIntentSlotValue *)self clearPayloadCarSeats];
  [(_INPBIntentSlotValue *)self clearPayloadCarSignalIdentifiers];
  [(_INPBIntentSlotValue *)self clearPayloadChangeAlarmStatusOperations];
  [(_INPBIntentSlotValue *)self clearPayloadDateSearchTypes];
  [(_INPBIntentSlotValue *)self clearPayloadDeviceTypes];
  [(_INPBIntentSlotValue *)self clearPayloadEventAttributes];
  [(_INPBIntentSlotValue *)self clearPayloadFileEntityTypes];
  [(_INPBIntentSlotValue *)self clearPayloadFilePropertyNames];
  [(_INPBIntentSlotValue *)self clearPayloadFilePropertyQualifiers];
  [(_INPBIntentSlotValue *)self clearPayloadFileSearchScopes];
  [(_INPBIntentSlotValue *)self clearPayloadFileShareModes];
  [(_INPBIntentSlotValue *)self clearPayloadFileTypes];
  [(_INPBIntentSlotValue *)self clearPayloadHomeAttributeTypes];
  [(_INPBIntentSlotValue *)self clearPayloadHomeAttributeValueTypes];
  [(_INPBIntentSlotValue *)self clearPayloadHomeDeviceTypes];
  [(_INPBIntentSlotValue *)self clearPayloadHomeEntityTypes];
  [(_INPBIntentSlotValue *)self clearPayloadLocationSearchTypes];
  [(_INPBIntentSlotValue *)self clearPayloadMediaAffinityTypes];
  [(_INPBIntentSlotValue *)self clearPayloadMessageAttributes];
  [(_INPBIntentSlotValue *)self clearPayloadMessageEffects];
  [(_INPBIntentSlotValue *)self clearPayloadMessageTypes];
  [(_INPBIntentSlotValue *)self clearPayloadNotebookItemTypes];
  [(_INPBIntentSlotValue *)self clearPayloadNumericSettingUnits];
  [(_INPBIntentSlotValue *)self clearPayloadOutgoingMessageTypes];
  [(_INPBIntentSlotValue *)self clearPayloadParsecCategories];
  [(_INPBIntentSlotValue *)self clearPayloadPaymentStatus];
  [(_INPBIntentSlotValue *)self clearPayloadPersonalPlaceTypes];
  [(_INPBIntentSlotValue *)self clearPayloadPhotoAttributes];
  [(_INPBIntentSlotValue *)self clearPayloadPlaybackQueueLocations];
  [(_INPBIntentSlotValue *)self clearPayloadPlaybackRepeatModes];
  [(_INPBIntentSlotValue *)self clearPayloadPreferredCallProviders];
  [(_INPBIntentSlotValue *)self clearPayloadRadioTypes];
  [(_INPBIntentSlotValue *)self clearPayloadReadActionTypes];
  [(_INPBIntentSlotValue *)self clearPayloadRelativeReferences];
  [(_INPBIntentSlotValue *)self clearPayloadRelativeSettings];
  [(_INPBIntentSlotValue *)self clearPayloadSettingActions];
  [(_INPBIntentSlotValue *)self clearPayloadTaskPriorities];
  [(_INPBIntentSlotValue *)self clearPayloadTaskReferences];
  [(_INPBIntentSlotValue *)self clearPayloadTaskStatus];
  [(_INPBIntentSlotValue *)self clearPayloadTemporalEventTriggerTypes];
  [(_INPBIntentSlotValue *)self clearPayloadTimerStates];
  [(_INPBIntentSlotValue *)self clearPayloadTimerTypes];
  [(_INPBIntentSlotValue *)self clearPayloadUpdateAlarmOperations];
  [(_INPBIntentSlotValue *)self clearPayloadUserNotificationTypes];
  [(_INPBIntentSlotValue *)self clearPayloadVisualCodeTypes];
  [(_INPBIntentSlotValue *)self clearPayloadWellnessObjectTypes];
  [(_INPBIntentSlotValue *)self clearPayloadWellnessQueryResultTypes];
  [(_INPBIntentSlotValue *)self clearPayloadWellnessQuestionTypes];
  [(_INPBIntentSlotValue *)self clearPayloadWorkoutGoalUnitTypes];
  [(_INPBIntentSlotValue *)self clearPayloadWorkoutLocationTypes];
  [(_INPBIntentSlotValue *)self clearPayloadWorkoutSequenceLabels];
  v3.receiver = self;
  v3.super_class = (Class)_INPBIntentSlotValue;
  [(_INPBIntentSlotValue *)&v3 dealloc];
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentSlotValueReadFrom(self, (uint64_t)a3);
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"String"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Double"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Integer"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Contact"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"DateTimeRange"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Location"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"DataString"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Long"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"PaymentMethod"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"Temperature"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"Distance"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"FinancialAccount"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"BillType"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"Mass"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"Volume"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"Speed"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"Energy"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"StringList"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"DoubleList"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"IntegerList"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"ContactList"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"DateTimeRangeList"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"LocationList"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"DataStringList"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"LongList"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"PaymentMethodList"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"TemperatureList"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"DistanceList"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"PrimitiveBool"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"PrimitiveInt"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"PrimitiveLong"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"PrimitiveDouble"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"PrimitiveString"])
  {
    int v4 = 104;
  }
  else if ([v3 isEqualToString:@"DateTime"])
  {
    int v4 = 105;
  }
  else if ([v3 isEqualToString:@"Intent"])
  {
    int v4 = 107;
  }
  else if ([v3 isEqualToString:@"ModifyRelationship"])
  {
    int v4 = 108;
  }
  else if ([v3 isEqualToString:@"ModifyNickname"])
  {
    int v4 = 109;
  }
  else if ([v3 isEqualToString:@"CalendarEvent"])
  {
    int v4 = 110;
  }
  else if ([v3 isEqualToString:@"EventParticipant"])
  {
    int v4 = 111;
  }
  else if ([v3 isEqualToString:@"EventAttribute"])
  {
    int v4 = 112;
  }
  else if ([v3 isEqualToString:@"Extension"])
  {
    int v4 = 1000;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  int v4 = @"String";
  switch(a3)
  {
    case 1:
      goto LABEL_14;
    case 2:
      int v4 = @"Double";
      break;
    case 3:
      int v4 = @"Integer";
      break;
    case 4:
      int v4 = @"Contact";
      break;
    case 5:
      int v4 = @"DateTimeRange";
      break;
    case 6:
      int v4 = @"Location";
      break;
    case 7:
      int v4 = @"DataString";
      break;
    case 8:
      int v4 = @"Long";
      break;
    case 9:
      int v4 = @"PaymentMethod";
      break;
    case 10:
      int v4 = @"Temperature";
      break;
    case 11:
      int v4 = @"Distance";
      break;
    case 12:
      int v4 = @"FinancialAccount";
      break;
    case 13:
      int v4 = @"BillType";
      break;
    case 14:
      int v4 = @"Mass";
      break;
    case 15:
      int v4 = @"Volume";
      break;
    case 16:
      int v4 = @"Speed";
      break;
    case 17:
      int v4 = @"Energy";
      break;
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
LABEL_13:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      break;
    case 50:
      int v4 = @"StringList";
      break;
    case 51:
      int v4 = @"DoubleList";
      break;
    case 52:
      int v4 = @"IntegerList";
      break;
    case 53:
      int v4 = @"ContactList";
      break;
    case 54:
      int v4 = @"DateTimeRangeList";
      break;
    case 55:
      int v4 = @"LocationList";
      break;
    case 56:
      int v4 = @"DataStringList";
      break;
    case 57:
      int v4 = @"LongList";
      break;
    case 58:
      int v4 = @"PaymentMethodList";
      break;
    case 59:
      int v4 = @"TemperatureList";
      break;
    case 60:
      int v4 = @"DistanceList";
      break;
    default:
      switch(a3)
      {
        case 'd':
          int v4 = @"PrimitiveBool";
          break;
        case 'e':
          int v4 = @"PrimitiveInt";
          break;
        case 'f':
          int v4 = @"PrimitiveLong";
          break;
        case 'g':
          int v4 = @"PrimitiveDouble";
          break;
        case 'h':
          int v4 = @"PrimitiveString";
          break;
        case 'i':
          int v4 = @"DateTime";
          break;
        case 'j':
          goto LABEL_13;
        case 'k':
          int v4 = @"Intent";
          break;
        case 'l':
          int v4 = @"ModifyRelationship";
          break;
        case 'm':
          int v4 = @"ModifyNickname";
          break;
        case 'n':
          int v4 = @"CalendarEvent";
          break;
        case 'o':
          int v4 = @"EventParticipant";
          break;
        case 'p':
          int v4 = @"EventAttribute";
          break;
        default:
          if (a3 != 1000) {
            goto LABEL_13;
          }
          int v4 = @"Extension";
          break;
      }
      break;
  }
  return v4;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int type = a3;
  }
}

- (int)StringAsPayloadWorkoutSequenceLabels:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"last"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"next"];
  }

  return v4;
}

- (id)payloadWorkoutSequenceLabelsAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"next";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"last";
  }
  return v4;
}

- (int)payloadWorkoutSequenceLabelAtIndex:(unint64_t)a3
{
  return self->_payloadWorkoutSequenceLabels.list[a3];
}

- (unint64_t)payloadWorkoutSequenceLabelsCount
{
  return self->_payloadWorkoutSequenceLabels.count;
}

- (void)addPayloadWorkoutSequenceLabel:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadWorkoutSequenceLabels
{
}

- (int)payloadWorkoutSequenceLabels
{
  return self->_payloadWorkoutSequenceLabels.list;
}

- (void)setPayloadWorkoutSequenceLabels:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadWorkoutLocationTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"OUTDOOR"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"INDOOR"];
  }

  return v4;
}

- (id)payloadWorkoutLocationTypesAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"INDOOR";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"OUTDOOR";
  }
  return v4;
}

- (int)payloadWorkoutLocationTypeAtIndex:(unint64_t)a3
{
  return self->_payloadWorkoutLocationTypes.list[a3];
}

- (unint64_t)payloadWorkoutLocationTypesCount
{
  return self->_payloadWorkoutLocationTypes.count;
}

- (void)addPayloadWorkoutLocationType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadWorkoutLocationTypes
{
}

- (int)payloadWorkoutLocationTypes
{
  return self->_payloadWorkoutLocationTypes.list;
}

- (void)setPayloadWorkoutLocationTypes:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadWorkoutGoalUnitTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Inch"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Meter"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Foot"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Mile"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Yard"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Second"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Minute"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Hour"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Joule"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"KiloCalorie"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadWorkoutGoalUnitTypesAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551D798 + a3);
  }

  return v3;
}

- (int)payloadWorkoutGoalUnitTypeAtIndex:(unint64_t)a3
{
  return self->_payloadWorkoutGoalUnitTypes.list[a3];
}

- (unint64_t)payloadWorkoutGoalUnitTypesCount
{
  return self->_payloadWorkoutGoalUnitTypes.count;
}

- (void)addPayloadWorkoutGoalUnitType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadWorkoutGoalUnitTypes
{
}

- (int)payloadWorkoutGoalUnitTypes
{
  return self->_payloadWorkoutGoalUnitTypes.list;
}

- (void)setPayloadWorkoutGoalUnitTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadWorkoutCustomizationAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadWorkoutCustomizations objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadWorkoutCustomizationsCount
{
  return [(NSArray *)self->_payloadWorkoutCustomizations count];
}

- (void)addPayloadWorkoutCustomization:(id)a3
{
  id v4 = a3;
  payloadWorkoutCustomizations = self->_payloadWorkoutCustomizations;
  id v8 = v4;
  if (!payloadWorkoutCustomizations)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadWorkoutCustomizations;
    self->_payloadWorkoutCustomizations = v6;

    id v4 = v8;
    payloadWorkoutCustomizations = self->_payloadWorkoutCustomizations;
  }
  [(NSArray *)payloadWorkoutCustomizations addObject:v4];
}

- (void)clearPayloadWorkoutCustomizations
{
}

- (void)setPayloadWorkoutCustomizations:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadWorkoutCustomizations = self->_payloadWorkoutCustomizations;
  self->_payloadWorkoutCustomizations = v4;

  MEMORY[0x1F41817F8](v4, payloadWorkoutCustomizations);
}

- (id)payloadWorkoutAssociatedItemAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadWorkoutAssociatedItems objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadWorkoutAssociatedItemsCount
{
  return [(NSArray *)self->_payloadWorkoutAssociatedItems count];
}

- (void)addPayloadWorkoutAssociatedItem:(id)a3
{
  id v4 = a3;
  payloadWorkoutAssociatedItems = self->_payloadWorkoutAssociatedItems;
  id v8 = v4;
  if (!payloadWorkoutAssociatedItems)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadWorkoutAssociatedItems;
    self->_payloadWorkoutAssociatedItems = v6;

    id v4 = v8;
    payloadWorkoutAssociatedItems = self->_payloadWorkoutAssociatedItems;
  }
  [(NSArray *)payloadWorkoutAssociatedItems addObject:v4];
}

- (void)clearPayloadWorkoutAssociatedItems
{
}

- (void)setPayloadWorkoutAssociatedItems:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadWorkoutAssociatedItems = self->_payloadWorkoutAssociatedItems;
  self->_payloadWorkoutAssociatedItems = v4;

  MEMORY[0x1F41817F8](v4, payloadWorkoutAssociatedItems);
}

- (id)payloadWellnessValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadWellnessValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadWellnessValuesCount
{
  return [(NSArray *)self->_payloadWellnessValues count];
}

- (void)addPayloadWellnessValue:(id)a3
{
  id v4 = a3;
  payloadWellnessValues = self->_payloadWellnessValues;
  id v8 = v4;
  if (!payloadWellnessValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadWellnessValues;
    self->_payloadWellnessValues = v6;

    id v4 = v8;
    payloadWellnessValues = self->_payloadWellnessValues;
  }
  [(NSArray *)payloadWellnessValues addObject:v4];
}

- (void)clearPayloadWellnessValues
{
}

- (void)setPayloadWellnessValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadWellnessValues = self->_payloadWellnessValues;
  self->_payloadWellnessValues = v4;

  MEMORY[0x1F41817F8](v4, payloadWellnessValues);
}

- (id)payloadWellnessUnitTypeAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadWellnessUnitTypes objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadWellnessUnitTypesCount
{
  return [(NSArray *)self->_payloadWellnessUnitTypes count];
}

- (void)addPayloadWellnessUnitType:(id)a3
{
  id v4 = a3;
  payloadWellnessUnitTypes = self->_payloadWellnessUnitTypes;
  id v8 = v4;
  if (!payloadWellnessUnitTypes)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadWellnessUnitTypes;
    self->_payloadWellnessUnitTypes = v6;

    id v4 = v8;
    payloadWellnessUnitTypes = self->_payloadWellnessUnitTypes;
  }
  [(NSArray *)payloadWellnessUnitTypes addObject:v4];
}

- (void)clearPayloadWellnessUnitTypes
{
}

- (void)setPayloadWellnessUnitTypes:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadWellnessUnitTypes = self->_payloadWellnessUnitTypes;
  self->_payloadWellnessUnitTypes = v4;

  MEMORY[0x1F41817F8](v4, payloadWellnessUnitTypes);
}

- (int)StringAsPayloadWellnessQuestionTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_QUESTION_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VERIFICATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"QUANTIFICATION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TEMPORAL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"COMPARISON"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"QUALITY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SPEED_RATE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"INSTANCE_COUNT"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadWellnessQuestionTypesAsString:(int)a3
{
  if (a3 >= 8)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551D758 + a3);
  }

  return v3;
}

- (int)payloadWellnessQuestionTypeAtIndex:(unint64_t)a3
{
  return self->_payloadWellnessQuestionTypes.list[a3];
}

- (unint64_t)payloadWellnessQuestionTypesCount
{
  return self->_payloadWellnessQuestionTypes.count;
}

- (void)addPayloadWellnessQuestionType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadWellnessQuestionTypes
{
}

- (int)payloadWellnessQuestionTypes
{
  return self->_payloadWellnessQuestionTypes.list;
}

- (void)setPayloadWellnessQuestionTypes:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadWellnessQueryResultTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_RESULT_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RAW"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AVERAGE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MINIMUM"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MAXIMUM"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SUM"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FIRST"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LAST"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ABOVE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"BELOW"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadWellnessQueryResultTypesAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551D708 + a3);
  }

  return v3;
}

- (int)payloadWellnessQueryResultTypeAtIndex:(unint64_t)a3
{
  return self->_payloadWellnessQueryResultTypes.list[a3];
}

- (unint64_t)payloadWellnessQueryResultTypesCount
{
  return self->_payloadWellnessQueryResultTypes.count;
}

- (void)addPayloadWellnessQueryResultType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadWellnessQueryResultTypes
{
}

- (int)payloadWellnessQueryResultTypes
{
  return self->_payloadWellnessQueryResultTypes.list;
}

- (void)setPayloadWellnessQueryResultTypes:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadWellnessObjectTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BASAL_BODY_TEMPERATURE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BIOTIN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BLOOD_ALCOHOL_CONTENT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BLOOD_GLUCOSE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"BLOOD_PRESSURE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"BLOOD_PRESSURE_DIASTOLIC"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"BLOOD_PRESSURE_SYSTOLIC"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"BLOOD_TYPE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"BODY_FAT_PERCENTAGE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"BODY_MASS_INDEX"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"BODY_TEMPERATURE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"CAFFEINE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"CALCIUM"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"CARBOHYDRATES"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"CHLORIDE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"CHROMIUM"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"COPPER"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"DIETARY_CHOLESTEROL"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"DIETARY_SUGAR"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"ELECTRODERMAL_ACTIVITY"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"ENERGY_CONSUMED"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"FAT_MONOUN_SATURATED"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"FAT_POLYUN_SATURATED"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"FAT_SATURATED"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"FAT_TOTAL"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"FIBER"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"FOLATE"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"FORCED_EXPIRATORY_VOLUME"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"FORCED_VITAL_CAPACITY"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"HEART_RATE"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"HEART_RATE_VARIABILITY_SDNN"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"HEIGHT"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"INHALER_USAGE"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"INSULIN_DELIVERY"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"IODINE"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"IRON"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"LEAN_BODY_MASS"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"MAGNESIUM"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"MANGANESE"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"MOLYBDENUM"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"NIACIN"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"NUMBER_OF_TIMES_FALLEN"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"OXYGEN_SATURATION"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"PANTOTHENIC_ACID"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"PEAK_EXPIRATORY_FLOW_RATE"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"PERIPHERAL_PERFUSION_INDEX"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"PHOSPHORUS"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"POTASSIUM"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"PROTEIN"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"RESPIRATORY_RATE"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"RESTINGHEART_RATE"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"RIBOFLAVIN"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"SELENIUM"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"SODIUM"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"THIAMIN"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"UV_INDEX"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"VITAMIN_A"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"VITAMIN_B12"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"VITAMIN_B6"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"VITAMIN_C"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"VITAMIN_D"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"VITAMIN_E"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"VITAMIN_K"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"WAIST_CIRCUMFERENCE"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"WALKING_HEART_RATE_AVERAGE"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"WATER"])
  {
    int v4 = 66;
  }
  else if ([v3 isEqualToString:@"WEIGHT"])
  {
    int v4 = 67;
  }
  else if ([v3 isEqualToString:@"ZINC"])
  {
    int v4 = 68;
  }
  else if ([v3 isEqualToString:@"CERVICAL_MUCUS_QUALITY"])
  {
    int v4 = 69;
  }
  else if ([v3 isEqualToString:@"OVULATION_TEST_RESULT"])
  {
    int v4 = 70;
  }
  else if ([v3 isEqualToString:@"MENSTRUAL_FLOW"])
  {
    int v4 = 71;
  }
  else if ([v3 isEqualToString:@"INTERMENSTRUAL_BLEEDING"])
  {
    int v4 = 72;
  }
  else if ([v3 isEqualToString:@"SEXUAL_ACTIVITY"])
  {
    int v4 = 73;
  }
  else if ([v3 isEqualToString:@"MINDFUL_SESSION"])
  {
    int v4 = 74;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadWellnessObjectTypesAsString:(int)a3
{
  if (a3 >= 0x4B)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551D4B0 + a3);
  }

  return v3;
}

- (int)payloadWellnessObjectTypeAtIndex:(unint64_t)a3
{
  return self->_payloadWellnessObjectTypes.list[a3];
}

- (unint64_t)payloadWellnessObjectTypesCount
{
  return self->_payloadWellnessObjectTypes.count;
}

- (void)addPayloadWellnessObjectType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadWellnessObjectTypes
{
}

- (int)payloadWellnessObjectTypes
{
  return self->_payloadWellnessObjectTypes.list;
}

- (void)setPayloadWellnessObjectTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadWellnessObjectResultValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadWellnessObjectResultValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadWellnessObjectResultValuesCount
{
  return [(NSArray *)self->_payloadWellnessObjectResultValues count];
}

- (void)addPayloadWellnessObjectResultValue:(id)a3
{
  id v4 = a3;
  payloadWellnessObjectResultValues = self->_payloadWellnessObjectResultValues;
  id v8 = v4;
  if (!payloadWellnessObjectResultValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadWellnessObjectResultValues;
    self->_payloadWellnessObjectResultValues = v6;

    id v4 = v8;
    payloadWellnessObjectResultValues = self->_payloadWellnessObjectResultValues;
  }
  [(NSArray *)payloadWellnessObjectResultValues addObject:v4];
}

- (void)clearPayloadWellnessObjectResultValues
{
}

- (void)setPayloadWellnessObjectResultValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadWellnessObjectResultValues = self->_payloadWellnessObjectResultValues;
  self->_payloadWellnessObjectResultValues = v4;

  MEMORY[0x1F41817F8](v4, payloadWellnessObjectResultValues);
}

- (id)payloadWellnessMetadataPairAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadWellnessMetadataPairs objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadWellnessMetadataPairsCount
{
  return [(NSArray *)self->_payloadWellnessMetadataPairs count];
}

- (void)addPayloadWellnessMetadataPair:(id)a3
{
  id v4 = a3;
  payloadWellnessMetadataPairs = self->_payloadWellnessMetadataPairs;
  id v8 = v4;
  if (!payloadWellnessMetadataPairs)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadWellnessMetadataPairs;
    self->_payloadWellnessMetadataPairs = v6;

    id v4 = v8;
    payloadWellnessMetadataPairs = self->_payloadWellnessMetadataPairs;
  }
  [(NSArray *)payloadWellnessMetadataPairs addObject:v4];
}

- (void)clearPayloadWellnessMetadataPairs
{
}

- (void)setPayloadWellnessMetadataPairs:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadWellnessMetadataPairs = self->_payloadWellnessMetadataPairs;
  self->_payloadWellnessMetadataPairs = v4;

  MEMORY[0x1F41817F8](v4, payloadWellnessMetadataPairs);
}

- (id)payloadVolumeValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadVolumeValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadVolumeValuesCount
{
  return [(NSArray *)self->_payloadVolumeValues count];
}

- (void)addPayloadVolumeValue:(id)a3
{
  id v4 = a3;
  payloadVolumeValues = self->_payloadVolumeValues;
  id v8 = v4;
  if (!payloadVolumeValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadVolumeValues;
    self->_payloadVolumeValues = v6;

    id v4 = v8;
    payloadVolumeValues = self->_payloadVolumeValues;
  }
  [(NSArray *)payloadVolumeValues addObject:v4];
}

- (void)clearPayloadVolumeValues
{
}

- (void)setPayloadVolumeValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadVolumeValues = self->_payloadVolumeValues;
  self->_payloadVolumeValues = v4;

  MEMORY[0x1F41817F8](v4, payloadVolumeValues);
}

- (id)payloadVoiceCommandDeviceInformationAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadVoiceCommandDeviceInformations objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadVoiceCommandDeviceInformationsCount
{
  return [(NSArray *)self->_payloadVoiceCommandDeviceInformations count];
}

- (void)addPayloadVoiceCommandDeviceInformation:(id)a3
{
  id v4 = a3;
  payloadVoiceCommandDeviceInformations = self->_payloadVoiceCommandDeviceInformations;
  id v8 = v4;
  if (!payloadVoiceCommandDeviceInformations)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadVoiceCommandDeviceInformations;
    self->_payloadVoiceCommandDeviceInformations = v6;

    id v4 = v8;
    payloadVoiceCommandDeviceInformations = self->_payloadVoiceCommandDeviceInformations;
  }
  [(NSArray *)payloadVoiceCommandDeviceInformations addObject:v4];
}

- (void)clearPayloadVoiceCommandDeviceInformations
{
}

- (void)setPayloadVoiceCommandDeviceInformations:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadVoiceCommandDeviceInformations = self->_payloadVoiceCommandDeviceInformations;
  self->_payloadVoiceCommandDeviceInformations = v4;

  MEMORY[0x1F41817F8](v4, payloadVoiceCommandDeviceInformations);
}

- (int)StringAsPayloadVisualCodeTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CONTACT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REQUEST_PAYMENT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SEND_PAYMENT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"BUS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SUBWAY"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadVisualCodeTypesAsString:(int)a3
{
  if (a3 >= 7)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551D478 + a3);
  }

  return v3;
}

- (int)payloadVisualCodeTypeAtIndex:(unint64_t)a3
{
  return self->_payloadVisualCodeTypes.list[a3];
}

- (unint64_t)payloadVisualCodeTypesCount
{
  return self->_payloadVisualCodeTypes.count;
}

- (void)addPayloadVisualCodeType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadVisualCodeTypes
{
}

- (int)payloadVisualCodeTypes
{
  return self->_payloadVisualCodeTypes.list;
}

- (void)setPayloadVisualCodeTypes:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadUserNotificationTypes:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"ANNOUNCEMENT"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"DELIVERY_FAILURE"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)payloadUserNotificationTypesAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"ANNOUNCEMENT";
  }
  else if (a3 == 2)
  {
    int v4 = @"DELIVERY_FAILURE";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)payloadUserNotificationTypeAtIndex:(unint64_t)a3
{
  return self->_payloadUserNotificationTypes.list[a3];
}

- (unint64_t)payloadUserNotificationTypesCount
{
  return self->_payloadUserNotificationTypes.count;
}

- (void)addPayloadUserNotificationType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadUserNotificationTypes
{
}

- (int)payloadUserNotificationTypes
{
  return self->_payloadUserNotificationTypes.list;
}

- (void)setPayloadUserNotificationTypes:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadUpdateAlarmOperations:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"UPDATE_LABEL"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"UPDATE_TIME"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)payloadUpdateAlarmOperationsAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"UPDATE_LABEL";
  }
  else if (a3 == 2)
  {
    int v4 = @"UPDATE_TIME";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)payloadUpdateAlarmOperationAtIndex:(unint64_t)a3
{
  return self->_payloadUpdateAlarmOperations.list[a3];
}

- (unint64_t)payloadUpdateAlarmOperationsCount
{
  return self->_payloadUpdateAlarmOperations.count;
}

- (void)addPayloadUpdateAlarmOperation:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadUpdateAlarmOperations
{
}

- (int)payloadUpdateAlarmOperations
{
  return self->_payloadUpdateAlarmOperations.list;
}

- (void)setPayloadUpdateAlarmOperations:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadURLValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadURLValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadURLValuesCount
{
  return [(NSArray *)self->_payloadURLValues count];
}

- (void)addPayloadURLValue:(id)a3
{
  id v4 = a3;
  payloadURLValues = self->_payloadURLValues;
  id v8 = v4;
  if (!payloadURLValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadURLValues;
    self->_payloadURLValues = v6;

    id v4 = v8;
    payloadURLValues = self->_payloadURLValues;
  }
  [(NSArray *)payloadURLValues addObject:v4];
}

- (void)clearPayloadURLValues
{
}

- (void)setPayloadURLValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadURLValues = self->_payloadURLValues;
  self->_payloadURLValues = v4;

  MEMORY[0x1F41817F8](v4, payloadURLValues);
}

- (int)StringAsPayloadTimerTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DEFAULT_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SLEEP_TIMER"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadTimerTypesAsString:(int)a3
{
  if (a3 >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551D460 + a3);
  }

  return v3;
}

- (int)payloadTimerTypeAtIndex:(unint64_t)a3
{
  return self->_payloadTimerTypes.list[a3];
}

- (unint64_t)payloadTimerTypesCount
{
  return self->_payloadTimerTypes.count;
}

- (void)addPayloadTimerType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadTimerTypes
{
}

- (int)payloadTimerTypes
{
  return self->_payloadTimerTypes.list;
}

- (void)setPayloadTimerTypes:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadTimerStates:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TIMER_RUNNING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TIMER_PAUSED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)payloadTimerStateAtIndex:(unint64_t)a3
{
  return self->_payloadTimerStates.list[a3];
}

- (unint64_t)payloadTimerStatesCount
{
  return self->_payloadTimerStates.count;
}

- (void)addPayloadTimerState:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadTimerStates
{
}

- (int)payloadTimerStates
{
  return self->_payloadTimerStates.list;
}

- (void)setPayloadTimerStates:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadTimerAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadTimers objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadTimersCount
{
  return [(NSArray *)self->_payloadTimers count];
}

- (void)clearPayloadTimers
{
}

- (void)setPayloadTimers:(id)a3
{
  int v4 = (NSArray *)[a3 mutableCopy];
  payloadTimers = self->_payloadTimers;
  self->_payloadTimers = v4;

  MEMORY[0x1F41817F8](v4, payloadTimers);
}

- (id)payloadTemporalEventTriggerTypesAsString:(int)a3
{
  if (a3 >= 4)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551D428 + a3);
  }

  return v3;
}

- (int)payloadTemporalEventTriggerTypeAtIndex:(unint64_t)a3
{
  return self->_payloadTemporalEventTriggerTypes.list[a3];
}

- (unint64_t)payloadTemporalEventTriggerTypesCount
{
  return self->_payloadTemporalEventTriggerTypes.count;
}

- (void)addPayloadTemporalEventTriggerType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadTemporalEventTriggerTypes
{
}

- (int)payloadTemporalEventTriggerTypes
{
  return self->_payloadTemporalEventTriggerTypes.list;
}

- (void)setPayloadTemporalEventTriggerTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadTemporalEventTriggerAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadTemporalEventTriggers objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadTemporalEventTriggersCount
{
  return [(NSArray *)self->_payloadTemporalEventTriggers count];
}

- (void)clearPayloadTemporalEventTriggers
{
}

- (void)setPayloadTemporalEventTriggers:(id)a3
{
  int v4 = (NSArray *)[a3 mutableCopy];
  payloadTemporalEventTriggers = self->_payloadTemporalEventTriggers;
  self->_payloadTemporalEventTriggers = v4;

  MEMORY[0x1F41817F8](v4, payloadTemporalEventTriggers);
}

- (id)payloadTemperatureValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadTemperatureValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadTemperatureValuesCount
{
  return [(NSArray *)self->_payloadTemperatureValues count];
}

- (void)clearPayloadTemperatureValues
{
}

- (void)setPayloadTemperatureValues:(id)a3
{
  int v4 = (NSArray *)[a3 mutableCopy];
  payloadTemperatureValues = self->_payloadTemperatureValues;
  self->_payloadTemperatureValues = v4;

  MEMORY[0x1F41817F8](v4, payloadTemperatureValues);
}

- (id)payloadTemperatureListAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadTemperatureLists objectAtIndexedSubscript:a3];
}

- (void)addPayloadTemperatureList:(id)a3
{
  id v4 = a3;
  payloadTemperatureLists = self->_payloadTemperatureLists;
  id v8 = v4;
  if (!payloadTemperatureLists)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadTemperatureLists;
    self->_payloadTemperatureLists = v6;

    id v4 = v8;
    payloadTemperatureLists = self->_payloadTemperatureLists;
  }
  [(NSArray *)payloadTemperatureLists addObject:v4];
}

- (void)clearPayloadTemperatureLists
{
}

- (void)setPayloadTemperatureLists:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadTemperatureLists = self->_payloadTemperatureLists;
  self->_payloadTemperatureLists = v4;

  MEMORY[0x1F41817F8](v4, payloadTemperatureLists);
}

- (int)StringAsPayloadTaskStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_STATUS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NOT_COMPLETED"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"COMPLETED"])
  {
    int v4 = 20;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadTaskStatusAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 20)
    {
      int v4 = @"COMPLETED";
    }
    else if (a3 == 10)
    {
      int v4 = @"NOT_COMPLETED";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"UNKNOWN_STATUS";
  }
  return v4;
}

- (int)payloadTaskStatusAtIndex:(unint64_t)a3
{
  return self->_payloadTaskStatus.list[a3];
}

- (unint64_t)payloadTaskStatusCount
{
  return self->_payloadTaskStatus.count;
}

- (void)addPayloadTaskStatus:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadTaskStatus
{
}

- (int)payloadTaskStatus
{
  return self->_payloadTaskStatus.list;
}

- (void)setPayloadTaskStatus:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadTaskReferences:(id)a3
{
  return 0;
}

- (id)payloadTaskReferencesAsString:(int)a3
{
  if (a3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v4 = @"CURRENT_ACTIVITY";
  }
  return v4;
}

- (int)payloadTaskReferenceAtIndex:(unint64_t)a3
{
  return self->_payloadTaskReferences.list[a3];
}

- (unint64_t)payloadTaskReferencesCount
{
  return self->_payloadTaskReferences.count;
}

- (void)addPayloadTaskReference:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadTaskReferences
{
}

- (int)payloadTaskReferences
{
  return self->_payloadTaskReferences.list;
}

- (void)setPayloadTaskReferences:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadTaskPriorities:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PRIORITY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NOT_FLAGGED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FLAGGED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadTaskPrioritiesAsString:(int)a3
{
  if (a3 >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551D410 + a3);
  }

  return v3;
}

- (int)payloadTaskPriorityAtIndex:(unint64_t)a3
{
  return self->_payloadTaskPriorities.list[a3];
}

- (unint64_t)payloadTaskPrioritiesCount
{
  return self->_payloadTaskPriorities.count;
}

- (void)addPayloadTaskPriority:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadTaskPriorities
{
}

- (int)payloadTaskPriorities
{
  return self->_payloadTaskPriorities.list;
}

- (void)setPayloadTaskPriorities:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadTaskListAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadTaskLists objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadTaskListsCount
{
  return [(NSArray *)self->_payloadTaskLists count];
}

- (void)addPayloadTaskList:(id)a3
{
  id v4 = a3;
  payloadTaskLists = self->_payloadTaskLists;
  id v8 = v4;
  if (!payloadTaskLists)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadTaskLists;
    self->_payloadTaskLists = v6;

    id v4 = v8;
    payloadTaskLists = self->_payloadTaskLists;
  }
  [(NSArray *)payloadTaskLists addObject:v4];
}

- (void)clearPayloadTaskLists
{
}

- (void)setPayloadTaskLists:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadTaskLists = self->_payloadTaskLists;
  self->_payloadTaskLists = v4;

  MEMORY[0x1F41817F8](v4, payloadTaskLists);
}

- (id)payloadTaskAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadTasks objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadTasksCount
{
  return [(NSArray *)self->_payloadTasks count];
}

- (void)addPayloadTask:(id)a3
{
  id v4 = a3;
  payloadTasks = self->_payloadTasks;
  id v8 = v4;
  if (!payloadTasks)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadTasks;
    self->_payloadTasks = v6;

    id v4 = v8;
    payloadTasks = self->_payloadTasks;
  }
  [(NSArray *)payloadTasks addObject:v4];
}

- (void)clearPayloadTasks
{
}

- (void)setPayloadTasks:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadTasks = self->_payloadTasks;
  self->_payloadTasks = v4;

  MEMORY[0x1F41817F8](v4, payloadTasks);
}

- (id)payloadSupportedTrafficIncidentTypeAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadSupportedTrafficIncidentTypes objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadSupportedTrafficIncidentTypesCount
{
  return [(NSArray *)self->_payloadSupportedTrafficIncidentTypes count];
}

- (void)addPayloadSupportedTrafficIncidentType:(id)a3
{
  id v4 = a3;
  payloadSupportedTrafficIncidentTypes = self->_payloadSupportedTrafficIncidentTypes;
  id v8 = v4;
  if (!payloadSupportedTrafficIncidentTypes)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadSupportedTrafficIncidentTypes;
    self->_payloadSupportedTrafficIncidentTypes = v6;

    id v4 = v8;
    payloadSupportedTrafficIncidentTypes = self->_payloadSupportedTrafficIncidentTypes;
  }
  [(NSArray *)payloadSupportedTrafficIncidentTypes addObject:v4];
}

- (void)clearPayloadSupportedTrafficIncidentTypes
{
}

- (void)setPayloadSupportedTrafficIncidentTypes:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadSupportedTrafficIncidentTypes = self->_payloadSupportedTrafficIncidentTypes;
  self->_payloadSupportedTrafficIncidentTypes = v4;

  MEMORY[0x1F41817F8](v4, payloadSupportedTrafficIncidentTypes);
}

- (id)payloadStringValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadStringValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadStringValuesCount
{
  return [(NSArray *)self->_payloadStringValues count];
}

- (void)addPayloadStringValue:(id)a3
{
  id v4 = a3;
  payloadStringValues = self->_payloadStringValues;
  id v8 = v4;
  if (!payloadStringValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadStringValues;
    self->_payloadStringValues = v6;

    id v4 = v8;
    payloadStringValues = self->_payloadStringValues;
  }
  [(NSArray *)payloadStringValues addObject:v4];
}

- (void)clearPayloadStringValues
{
}

- (void)setPayloadStringValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadStringValues = self->_payloadStringValues;
  self->_payloadStringValues = v4;

  MEMORY[0x1F41817F8](v4, payloadStringValues);
}

- (id)payloadStringListAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadStringLists objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadStringListsCount
{
  return [(NSArray *)self->_payloadStringLists count];
}

- (void)addPayloadStringList:(id)a3
{
  id v4 = a3;
  payloadStringLists = self->_payloadStringLists;
  id v8 = v4;
  if (!payloadStringLists)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadStringLists;
    self->_payloadStringLists = v6;

    id v4 = v8;
    payloadStringLists = self->_payloadStringLists;
  }
  [(NSArray *)payloadStringLists addObject:v4];
}

- (void)clearPayloadStringLists
{
}

- (void)setPayloadStringLists:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadStringLists = self->_payloadStringLists;
  self->_payloadStringLists = v4;

  MEMORY[0x1F41817F8](v4, payloadStringLists);
}

- (id)payloadStartCallRequestMetadataAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadStartCallRequestMetadatas objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadStartCallRequestMetadatasCount
{
  return [(NSArray *)self->_payloadStartCallRequestMetadatas count];
}

- (void)addPayloadStartCallRequestMetadata:(id)a3
{
  id v4 = a3;
  payloadStartCallRequestMetadatas = self->_payloadStartCallRequestMetadatas;
  id v8 = v4;
  if (!payloadStartCallRequestMetadatas)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadStartCallRequestMetadatas;
    self->_payloadStartCallRequestMetadatas = v6;

    id v4 = v8;
    payloadStartCallRequestMetadatas = self->_payloadStartCallRequestMetadatas;
  }
  [(NSArray *)payloadStartCallRequestMetadatas addObject:v4];
}

- (void)clearPayloadStartCallRequestMetadatas
{
}

- (void)setPayloadStartCallRequestMetadatas:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadStartCallRequestMetadatas = self->_payloadStartCallRequestMetadatas;
  self->_payloadStartCallRequestMetadatas = v4;

  MEMORY[0x1F41817F8](v4, payloadStartCallRequestMetadatas);
}

- (id)payloadSpeedValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadSpeedValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadSpeedValuesCount
{
  return [(NSArray *)self->_payloadSpeedValues count];
}

- (void)addPayloadSpeedValue:(id)a3
{
  id v4 = a3;
  payloadSpeedValues = self->_payloadSpeedValues;
  id v8 = v4;
  if (!payloadSpeedValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadSpeedValues;
    self->_payloadSpeedValues = v6;

    id v4 = v8;
    payloadSpeedValues = self->_payloadSpeedValues;
  }
  [(NSArray *)payloadSpeedValues addObject:v4];
}

- (void)clearPayloadSpeedValues
{
}

- (void)setPayloadSpeedValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadSpeedValues = self->_payloadSpeedValues;
  self->_payloadSpeedValues = v4;

  MEMORY[0x1F41817F8](v4, payloadSpeedValues);
}

- (id)payloadSpatialEventTriggerAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadSpatialEventTriggers objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadSpatialEventTriggersCount
{
  return [(NSArray *)self->_payloadSpatialEventTriggers count];
}

- (void)addPayloadSpatialEventTrigger:(id)a3
{
  id v4 = a3;
  payloadSpatialEventTriggers = self->_payloadSpatialEventTriggers;
  id v8 = v4;
  if (!payloadSpatialEventTriggers)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadSpatialEventTriggers;
    self->_payloadSpatialEventTriggers = v6;

    id v4 = v8;
    payloadSpatialEventTriggers = self->_payloadSpatialEventTriggers;
  }
  [(NSArray *)payloadSpatialEventTriggers addObject:v4];
}

- (void)clearPayloadSpatialEventTriggers
{
}

- (void)setPayloadSpatialEventTriggers:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadSpatialEventTriggers = self->_payloadSpatialEventTriggers;
  self->_payloadSpatialEventTriggers = v4;

  MEMORY[0x1F41817F8](v4, payloadSpatialEventTriggers);
}

- (id)payloadSleepAlarmAttributeAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadSleepAlarmAttributes objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadSleepAlarmAttributesCount
{
  return [(NSArray *)self->_payloadSleepAlarmAttributes count];
}

- (void)addPayloadSleepAlarmAttribute:(id)a3
{
  id v4 = a3;
  payloadSleepAlarmAttributes = self->_payloadSleepAlarmAttributes;
  id v8 = v4;
  if (!payloadSleepAlarmAttributes)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadSleepAlarmAttributes;
    self->_payloadSleepAlarmAttributes = v6;

    id v4 = v8;
    payloadSleepAlarmAttributes = self->_payloadSleepAlarmAttributes;
  }
  [(NSArray *)payloadSleepAlarmAttributes addObject:v4];
}

- (void)clearPayloadSleepAlarmAttributes
{
}

- (void)setPayloadSleepAlarmAttributes:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadSleepAlarmAttributes = self->_payloadSleepAlarmAttributes;
  self->_payloadSleepAlarmAttributes = v4;

  MEMORY[0x1F41817F8](v4, payloadSleepAlarmAttributes);
}

- (id)payloadShareDestinationAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadShareDestinations objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadShareDestinationsCount
{
  return [(NSArray *)self->_payloadShareDestinations count];
}

- (void)addPayloadShareDestination:(id)a3
{
  id v4 = a3;
  payloadShareDestinations = self->_payloadShareDestinations;
  id v8 = v4;
  if (!payloadShareDestinations)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadShareDestinations;
    self->_payloadShareDestinations = v6;

    id v4 = v8;
    payloadShareDestinations = self->_payloadShareDestinations;
  }
  [(NSArray *)payloadShareDestinations addObject:v4];
}

- (void)clearPayloadShareDestinations
{
}

- (void)setPayloadShareDestinations:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadShareDestinations = self->_payloadShareDestinations;
  self->_payloadShareDestinations = v4;

  MEMORY[0x1F41817F8](v4, payloadShareDestinations);
}

- (id)payloadSettingMetadataAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadSettingMetadatas objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadSettingMetadatasCount
{
  return [(NSArray *)self->_payloadSettingMetadatas count];
}

- (void)addPayloadSettingMetadata:(id)a3
{
  id v4 = a3;
  payloadSettingMetadatas = self->_payloadSettingMetadatas;
  id v8 = v4;
  if (!payloadSettingMetadatas)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadSettingMetadatas;
    self->_payloadSettingMetadatas = v6;

    id v4 = v8;
    payloadSettingMetadatas = self->_payloadSettingMetadatas;
  }
  [(NSArray *)payloadSettingMetadatas addObject:v4];
}

- (void)clearPayloadSettingMetadatas
{
}

- (void)setPayloadSettingMetadatas:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadSettingMetadatas = self->_payloadSettingMetadatas;
  self->_payloadSettingMetadatas = v4;

  MEMORY[0x1F41817F8](v4, payloadSettingMetadatas);
}

- (int)StringAsPayloadSettingActions:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SET"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INCREASE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DECREASE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)payloadSettingActionsAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551D3F8 + (a3 - 1));
  }

  return v3;
}

- (int)payloadSettingActionAtIndex:(unint64_t)a3
{
  return self->_payloadSettingActions.list[a3];
}

- (unint64_t)payloadSettingActionsCount
{
  return self->_payloadSettingActions.count;
}

- (void)addPayloadSettingAction:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadSettingActions
{
}

- (int)payloadSettingActions
{
  return self->_payloadSettingActions.list;
}

- (void)setPayloadSettingActions:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadSendMessageAttachmentAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadSendMessageAttachments objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadSendMessageAttachmentsCount
{
  return [(NSArray *)self->_payloadSendMessageAttachments count];
}

- (void)addPayloadSendMessageAttachment:(id)a3
{
  id v4 = a3;
  payloadSendMessageAttachments = self->_payloadSendMessageAttachments;
  id v8 = v4;
  if (!payloadSendMessageAttachments)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadSendMessageAttachments;
    self->_payloadSendMessageAttachments = v6;

    id v4 = v8;
    payloadSendMessageAttachments = self->_payloadSendMessageAttachments;
  }
  [(NSArray *)payloadSendMessageAttachments addObject:v4];
}

- (void)clearPayloadSendMessageAttachments
{
}

- (void)setPayloadSendMessageAttachments:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadSendMessageAttachments = self->_payloadSendMessageAttachments;
  self->_payloadSendMessageAttachments = v4;

  MEMORY[0x1F41817F8](v4, payloadSendMessageAttachments);
}

- (int)StringAsPayloadRelativeSettings:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LOWEST"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LOWER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HIGHER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HIGHEST"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)payloadRelativeSettingsAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551D3D8 + (a3 - 1));
  }

  return v3;
}

- (int)payloadRelativeSettingAtIndex:(unint64_t)a3
{
  return self->_payloadRelativeSettings.list[a3];
}

- (unint64_t)payloadRelativeSettingsCount
{
  return self->_payloadRelativeSettings.count;
}

- (void)addPayloadRelativeSetting:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadRelativeSettings
{
}

- (int)payloadRelativeSettings
{
  return self->_payloadRelativeSettings.list;
}

- (void)setPayloadRelativeSettings:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadRelativeReferences:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"NEXT"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"PREVIOUS"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)payloadRelativeReferencesAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"NEXT";
  }
  else if (a3 == 2)
  {
    int v4 = @"PREVIOUS";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)payloadRelativeReferenceAtIndex:(unint64_t)a3
{
  return self->_payloadRelativeReferences.list[a3];
}

- (unint64_t)payloadRelativeReferencesCount
{
  return self->_payloadRelativeReferences.count;
}

- (void)addPayloadRelativeReference:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadRelativeReferences
{
}

- (int)payloadRelativeReferences
{
  return self->_payloadRelativeReferences.list;
}

- (void)setPayloadRelativeReferences:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadReadActionTypes:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"READ"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"REPEAT"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)payloadReadActionTypesAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"READ";
  }
  else if (a3 == 2)
  {
    int v4 = @"REPEAT";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)payloadReadActionTypeAtIndex:(unint64_t)a3
{
  return self->_payloadReadActionTypes.list[a3];
}

- (unint64_t)payloadReadActionTypesCount
{
  return self->_payloadReadActionTypes.count;
}

- (void)addPayloadReadActionType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadReadActionTypes
{
}

- (int)payloadReadActionTypes
{
  return self->_payloadReadActionTypes.list;
}

- (void)setPayloadReadActionTypes:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadRadioTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AM"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HD"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SATELLITE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"DAB"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)payloadRadioTypesAsString:(int)a3
{
  if ((a3 - 1) >= 5)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551D3B0 + (a3 - 1));
  }

  return v3;
}

- (int)payloadRadioTypeAtIndex:(unint64_t)a3
{
  return self->_payloadRadioTypes.list[a3];
}

- (unint64_t)payloadRadioTypesCount
{
  return self->_payloadRadioTypes.count;
}

- (void)addPayloadRadioType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadRadioTypes
{
}

- (int)payloadRadioTypes
{
  return self->_payloadRadioTypes.list;
}

- (void)setPayloadRadioTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadPrivateUpdateMediaAffinityIntentDataAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadPrivateUpdateMediaAffinityIntentDatas objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadPrivateUpdateMediaAffinityIntentDatasCount
{
  return [(NSArray *)self->_payloadPrivateUpdateMediaAffinityIntentDatas count];
}

- (void)addPayloadPrivateUpdateMediaAffinityIntentData:(id)a3
{
  id v4 = a3;
  payloadPrivateUpdateMediaAffinityIntentDatas = self->_payloadPrivateUpdateMediaAffinityIntentDatas;
  id v8 = v4;
  if (!payloadPrivateUpdateMediaAffinityIntentDatas)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadPrivateUpdateMediaAffinityIntentDatas;
    self->_payloadPrivateUpdateMediaAffinityIntentDatas = v6;

    id v4 = v8;
    payloadPrivateUpdateMediaAffinityIntentDatas = self->_payloadPrivateUpdateMediaAffinityIntentDatas;
  }
  [(NSArray *)payloadPrivateUpdateMediaAffinityIntentDatas addObject:v4];
}

- (void)clearPayloadPrivateUpdateMediaAffinityIntentDatas
{
}

- (void)setPayloadPrivateUpdateMediaAffinityIntentDatas:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadPrivateUpdateMediaAffinityIntentDatas = self->_payloadPrivateUpdateMediaAffinityIntentDatas;
  self->_payloadPrivateUpdateMediaAffinityIntentDatas = v4;

  MEMORY[0x1F41817F8](v4, payloadPrivateUpdateMediaAffinityIntentDatas);
}

- (id)payloadPrivateSearchForMediaIntentDataAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadPrivateSearchForMediaIntentDatas objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadPrivateSearchForMediaIntentDatasCount
{
  return [(NSArray *)self->_payloadPrivateSearchForMediaIntentDatas count];
}

- (void)addPayloadPrivateSearchForMediaIntentData:(id)a3
{
  id v4 = a3;
  payloadPrivateSearchForMediaIntentDatas = self->_payloadPrivateSearchForMediaIntentDatas;
  id v8 = v4;
  if (!payloadPrivateSearchForMediaIntentDatas)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadPrivateSearchForMediaIntentDatas;
    self->_payloadPrivateSearchForMediaIntentDatas = v6;

    id v4 = v8;
    payloadPrivateSearchForMediaIntentDatas = self->_payloadPrivateSearchForMediaIntentDatas;
  }
  [(NSArray *)payloadPrivateSearchForMediaIntentDatas addObject:v4];
}

- (void)clearPayloadPrivateSearchForMediaIntentDatas
{
}

- (void)setPayloadPrivateSearchForMediaIntentDatas:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadPrivateSearchForMediaIntentDatas = self->_payloadPrivateSearchForMediaIntentDatas;
  self->_payloadPrivateSearchForMediaIntentDatas = v4;

  MEMORY[0x1F41817F8](v4, payloadPrivateSearchForMediaIntentDatas);
}

- (id)payloadPrivatePlayMediaIntentDataAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadPrivatePlayMediaIntentDatas objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadPrivatePlayMediaIntentDatasCount
{
  return [(NSArray *)self->_payloadPrivatePlayMediaIntentDatas count];
}

- (void)addPayloadPrivatePlayMediaIntentData:(id)a3
{
  id v4 = a3;
  payloadPrivatePlayMediaIntentDatas = self->_payloadPrivatePlayMediaIntentDatas;
  id v8 = v4;
  if (!payloadPrivatePlayMediaIntentDatas)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadPrivatePlayMediaIntentDatas;
    self->_payloadPrivatePlayMediaIntentDatas = v6;

    id v4 = v8;
    payloadPrivatePlayMediaIntentDatas = self->_payloadPrivatePlayMediaIntentDatas;
  }
  [(NSArray *)payloadPrivatePlayMediaIntentDatas addObject:v4];
}

- (void)clearPayloadPrivatePlayMediaIntentDatas
{
}

- (void)setPayloadPrivatePlayMediaIntentDatas:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadPrivatePlayMediaIntentDatas = self->_payloadPrivatePlayMediaIntentDatas;
  self->_payloadPrivatePlayMediaIntentDatas = v4;

  MEMORY[0x1F41817F8](v4, payloadPrivatePlayMediaIntentDatas);
}

- (id)payloadPrivateAddMediaIntentDataAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadPrivateAddMediaIntentDatas objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadPrivateAddMediaIntentDatasCount
{
  return [(NSArray *)self->_payloadPrivateAddMediaIntentDatas count];
}

- (void)addPayloadPrivateAddMediaIntentData:(id)a3
{
  id v4 = a3;
  payloadPrivateAddMediaIntentDatas = self->_payloadPrivateAddMediaIntentDatas;
  id v8 = v4;
  if (!payloadPrivateAddMediaIntentDatas)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadPrivateAddMediaIntentDatas;
    self->_payloadPrivateAddMediaIntentDatas = v6;

    id v4 = v8;
    payloadPrivateAddMediaIntentDatas = self->_payloadPrivateAddMediaIntentDatas;
  }
  [(NSArray *)payloadPrivateAddMediaIntentDatas addObject:v4];
}

- (void)clearPayloadPrivateAddMediaIntentDatas
{
}

- (void)setPayloadPrivateAddMediaIntentDatas:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadPrivateAddMediaIntentDatas = self->_payloadPrivateAddMediaIntentDatas;
  self->_payloadPrivateAddMediaIntentDatas = v4;

  MEMORY[0x1F41817F8](v4, payloadPrivateAddMediaIntentDatas);
}

- (id)payloadPrimitiveStringAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadPrimitiveStrings objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadPrimitiveStringsCount
{
  return [(NSArray *)self->_payloadPrimitiveStrings count];
}

- (void)addPayloadPrimitiveString:(id)a3
{
  id v4 = a3;
  payloadPrimitiveStrings = self->_payloadPrimitiveStrings;
  id v8 = v4;
  if (!payloadPrimitiveStrings)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadPrimitiveStrings;
    self->_payloadPrimitiveStrings = v6;

    id v4 = v8;
    payloadPrimitiveStrings = self->_payloadPrimitiveStrings;
  }
  [(NSArray *)payloadPrimitiveStrings addObject:v4];
}

- (void)clearPayloadPrimitiveStrings
{
}

- (void)setPayloadPrimitiveStrings:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadPrimitiveStrings = self->_payloadPrimitiveStrings;
  self->_payloadPrimitiveStrings = v4;

  MEMORY[0x1F41817F8](v4, payloadPrimitiveStrings);
}

- (int64_t)payloadPrimitiveLongAtIndex:(unint64_t)a3
{
  id v3 = [(NSArray *)self->_payloadPrimitiveLongs objectAtIndexedSubscript:a3];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (unint64_t)payloadPrimitiveLongsCount
{
  return [(NSArray *)self->_payloadPrimitiveLongs count];
}

- (void)addPayloadPrimitiveLong:(int64_t)a3
{
  payloadPrimitiveLongs = self->_payloadPrimitiveLongs;
  if (!payloadPrimitiveLongs)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadPrimitiveLongs;
    self->_payloadPrimitiveLongs = v6;

    payloadPrimitiveLongs = self->_payloadPrimitiveLongs;
  }
  id v8 = [NSNumber numberWithLongLong:a3];
  [(NSArray *)payloadPrimitiveLongs addObject:v8];
}

- (void)clearPayloadPrimitiveLongs
{
}

- (void)setPayloadPrimitiveLongs:(id)a3
{
  int64_t v4 = (NSArray *)[a3 mutableCopy];
  payloadPrimitiveLongs = self->_payloadPrimitiveLongs;
  self->_payloadPrimitiveLongs = v4;

  MEMORY[0x1F41817F8](v4, payloadPrimitiveLongs);
}

- (unint64_t)payloadPrimitiveIntsCount
{
  return [(NSArray *)self->_payloadPrimitiveInts count];
}

- (void)addPayloadPrimitiveInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  payloadPrimitiveInts = self->_payloadPrimitiveInts;
  if (!payloadPrimitiveInts)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadPrimitiveInts;
    self->_payloadPrimitiveInts = v6;

    payloadPrimitiveInts = self->_payloadPrimitiveInts;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)payloadPrimitiveInts addObject:v8];
}

- (void)clearPayloadPrimitiveInts
{
}

- (double)payloadPrimitiveDoubleAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_payloadPrimitiveDoubles objectAtIndexedSubscript:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (unint64_t)payloadPrimitiveDoublesCount
{
  return [(NSArray *)self->_payloadPrimitiveDoubles count];
}

- (void)clearPayloadPrimitiveDoubles
{
}

- (void)setPayloadPrimitiveDoubles:(id)a3
{
  double v4 = (NSArray *)[a3 mutableCopy];
  payloadPrimitiveDoubles = self->_payloadPrimitiveDoubles;
  self->_payloadPrimitiveDoubles = v4;

  MEMORY[0x1F41817F8](v4, payloadPrimitiveDoubles);
}

- (BOOL)payloadPrimitiveBoolAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_payloadPrimitiveBools objectAtIndexedSubscript:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (unint64_t)payloadPrimitiveBoolsCount
{
  return [(NSArray *)self->_payloadPrimitiveBools count];
}

- (void)clearPayloadPrimitiveBools
{
}

- (void)setPayloadPrimitiveBools:(id)a3
{
  char v4 = (NSArray *)[a3 mutableCopy];
  payloadPrimitiveBools = self->_payloadPrimitiveBools;
  self->_payloadPrimitiveBools = v4;

  MEMORY[0x1F41817F8](v4, payloadPrimitiveBools);
}

- (int)StringAsPayloadPreferredCallProviders:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TELEPHONY_PROVIDER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FACETIME_PROVIDER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"THIRD_PARTY_PROVIDER"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 2;
  }

  return v4;
}

- (id)payloadPreferredCallProvidersAsString:(int)a3
{
  if ((a3 - 2) >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551D398 + (a3 - 2));
  }

  return v3;
}

- (int)payloadPreferredCallProviderAtIndex:(unint64_t)a3
{
  return self->_payloadPreferredCallProviders.list[a3];
}

- (unint64_t)payloadPreferredCallProvidersCount
{
  return self->_payloadPreferredCallProviders.count;
}

- (void)addPayloadPreferredCallProvider:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadPreferredCallProviders
{
}

- (int)payloadPreferredCallProviders
{
  return self->_payloadPreferredCallProviders.list;
}

- (void)setPayloadPreferredCallProviders:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadPlaybackRepeatModes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ALL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ONE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadPlaybackRepeatModesAsString:(int)a3
{
  if (a3 >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551D380 + a3);
  }

  return v3;
}

- (int)payloadPlaybackRepeatModeAtIndex:(unint64_t)a3
{
  return self->_payloadPlaybackRepeatModes.list[a3];
}

- (unint64_t)payloadPlaybackRepeatModesCount
{
  return self->_payloadPlaybackRepeatModes.count;
}

- (void)addPayloadPlaybackRepeatMode:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadPlaybackRepeatModes
{
}

- (int)payloadPlaybackRepeatModes
{
  return self->_payloadPlaybackRepeatModes.list;
}

- (void)setPayloadPlaybackRepeatModes:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadPlaybackQueueLocations:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PLAYBACK_QUEUE_LOCATION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NOW"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NEXT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LATER"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadPlaybackQueueLocationsAsString:(int)a3
{
  if (a3 >= 4)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551D360 + a3);
  }

  return v3;
}

- (int)payloadPlaybackQueueLocationAtIndex:(unint64_t)a3
{
  return self->_payloadPlaybackQueueLocations.list[a3];
}

- (unint64_t)payloadPlaybackQueueLocationsCount
{
  return self->_payloadPlaybackQueueLocations.count;
}

- (void)addPayloadPlaybackQueueLocation:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadPlaybackQueueLocations
{
}

- (int)payloadPlaybackQueueLocations
{
  return self->_payloadPlaybackQueueLocations.list;
}

- (void)setPayloadPlaybackQueueLocations:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadPlaceListAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadPlaceLists objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadPlaceListsCount
{
  return [(NSArray *)self->_payloadPlaceLists count];
}

- (void)addPayloadPlaceList:(id)a3
{
  id v4 = a3;
  payloadPlaceLists = self->_payloadPlaceLists;
  id v8 = v4;
  if (!payloadPlaceLists)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadPlaceLists;
    self->_payloadPlaceLists = v6;

    id v4 = v8;
    payloadPlaceLists = self->_payloadPlaceLists;
  }
  [(NSArray *)payloadPlaceLists addObject:v4];
}

- (void)clearPayloadPlaceLists
{
}

- (void)setPayloadPlaceLists:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadPlaceLists = self->_payloadPlaceLists;
  self->_payloadPlaceLists = v4;

  MEMORY[0x1F41817F8](v4, payloadPlaceLists);
}

- (id)payloadPlaceAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadPlaces objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadPlacesCount
{
  return [(NSArray *)self->_payloadPlaces count];
}

- (void)addPayloadPlace:(id)a3
{
  id v4 = a3;
  payloadPlaces = self->_payloadPlaces;
  id v8 = v4;
  if (!payloadPlaces)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadPlaces;
    self->_payloadPlaces = v6;

    id v4 = v8;
    payloadPlaces = self->_payloadPlaces;
  }
  [(NSArray *)payloadPlaces addObject:v4];
}

- (void)clearPayloadPlaces
{
}

- (void)setPayloadPlaces:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadPlaces = self->_payloadPlaces;
  self->_payloadPlaces = v4;

  MEMORY[0x1F41817F8](v4, payloadPlaces);
}

- (int)StringAsPayloadPhotoAttributes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PHOTO"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VIDEO"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"GIF"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FLASH"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"LANDSCAPE_ORIENTATION"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"PORTRAIT_ORIENTATION"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"FAVORITE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SELFIE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"FRONT_FACING_CAMERA"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SCREENSHOT"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"BURST_PHOTO"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"HDR_PHOTO"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"SQUARE_PHOTO"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"PANORAMA_PHOTO"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"TIME_LAPSE_VIDEO"])
  {
    int v4 = 80;
  }
  else if ([v3 isEqualToString:@"SLOW_MOTION_VIDEO"])
  {
    int v4 = 81;
  }
  else if ([v3 isEqualToString:@"NOIR_FILTER"])
  {
    int v4 = 300;
  }
  else if ([v3 isEqualToString:@"CHROME_FILTER"])
  {
    int v4 = 301;
  }
  else if ([v3 isEqualToString:@"INSTANT_FILTER"])
  {
    int v4 = 302;
  }
  else if ([v3 isEqualToString:@"TONAL_FILTER"])
  {
    int v4 = 303;
  }
  else if ([v3 isEqualToString:@"TRANSFER_FILTER"])
  {
    int v4 = 304;
  }
  else if ([v3 isEqualToString:@"MONO_FILTER"])
  {
    int v4 = 305;
  }
  else if ([v3 isEqualToString:@"FADE_FILTER"])
  {
    int v4 = 306;
  }
  else if ([v3 isEqualToString:@"PROCESS_FILTER"])
  {
    int v4 = 307;
  }
  else if ([v3 isEqualToString:@"PORTRAIT_PHOTO"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"LIVE_PHOTO"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"LOOP_PHOTO"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"BOUNCE_PHOTO"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"LONG_EXPOSURE_PHOTO"])
  {
    int v4 = 58;
  }
  else
  {
    int v4 = 2;
  }

  return v4;
}

- (id)payloadPhotoAttributesAsString:(int)a3
{
  if (a3 <= 49)
  {
    int v4 = @"PHOTO";
    switch(a3)
    {
      case 2:
        goto LABEL_93;
      case 3:
        int v4 = @"VIDEO";
        break;
      case 4:
        int v4 = @"GIF";
        break;
      case 10:
        int v4 = @"FLASH";
        break;
      case 11:
        int v4 = @"LANDSCAPE_ORIENTATION";
        break;
      case 12:
        int v4 = @"PORTRAIT_ORIENTATION";
        break;
      case 13:
        int v4 = @"FAVORITE";
        break;
      case 14:
        int v4 = @"SELFIE";
        break;
      case 15:
        int v4 = @"FRONT_FACING_CAMERA";
        break;
      case 16:
        int v4 = @"SCREENSHOT";
        break;
      default:
LABEL_92:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_93:
        break;
    }
  }
  else if (a3 > 80)
  {
    switch(a3)
    {
      case 300:
        int v4 = @"NOIR_FILTER";
        break;
      case 301:
        int v4 = @"CHROME_FILTER";
        break;
      case 302:
        int v4 = @"INSTANT_FILTER";
        break;
      case 303:
        int v4 = @"TONAL_FILTER";
        break;
      case 304:
        int v4 = @"TRANSFER_FILTER";
        break;
      case 305:
        int v4 = @"MONO_FILTER";
        break;
      case 306:
        int v4 = @"FADE_FILTER";
        break;
      case 307:
        int v4 = @"PROCESS_FILTER";
        break;
      default:
        if (a3 != 81) {
          goto LABEL_92;
        }
        int v4 = @"SLOW_MOTION_VIDEO";
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case '2':
        int v4 = @"BURST_PHOTO";
        break;
      case '3':
        int v4 = @"HDR_PHOTO";
        break;
      case '4':
        int v4 = @"SQUARE_PHOTO";
        break;
      case '5':
        int v4 = @"PANORAMA_PHOTO";
        break;
      case '6':
        int v4 = @"PORTRAIT_PHOTO";
        break;
      case '7':
        int v4 = @"LIVE_PHOTO";
        break;
      case '8':
        int v4 = @"LOOP_PHOTO";
        break;
      case '9':
        int v4 = @"BOUNCE_PHOTO";
        break;
      case ':':
        int v4 = @"LONG_EXPOSURE_PHOTO";
        break;
      default:
        if (a3 != 80) {
          goto LABEL_92;
        }
        int v4 = @"TIME_LAPSE_VIDEO";
        break;
    }
  }
  return v4;
}

- (int)payloadPhotoAttributeAtIndex:(unint64_t)a3
{
  return self->_payloadPhotoAttributes.list[a3];
}

- (unint64_t)payloadPhotoAttributesCount
{
  return self->_payloadPhotoAttributes.count;
}

- (void)addPayloadPhotoAttribute:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadPhotoAttributes
{
}

- (int)payloadPhotoAttributes
{
  return self->_payloadPhotoAttributes.list;
}

- (void)setPayloadPhotoAttributes:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadPersonalPlaceTypes:(id)a3
{
  id v3 = a3;
  int v4 = 2;
  if (([v3 isEqualToString:@"HOME"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"WORK"]) {
      int v4 = 3;
    }
    else {
      int v4 = 2;
    }
  }

  return v4;
}

- (id)payloadPersonalPlaceTypesAsString:(int)a3
{
  if (a3 == 2)
  {
    int v4 = @"HOME";
  }
  else if (a3 == 3)
  {
    int v4 = @"WORK";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)payloadPersonalPlaceTypeAtIndex:(unint64_t)a3
{
  return self->_payloadPersonalPlaceTypes.list[a3];
}

- (unint64_t)payloadPersonalPlaceTypesCount
{
  return self->_payloadPersonalPlaceTypes.count;
}

- (void)addPayloadPersonalPlaceType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadPersonalPlaceTypes
{
}

- (int)payloadPersonalPlaceTypes
{
  return self->_payloadPersonalPlaceTypes.list;
}

- (void)setPayloadPersonalPlaceTypes:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadPaymentStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PENDING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"COMPLETED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CANCELED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FAILED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"UNPAID"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)payloadPaymentStatusAsString:(int)a3
{
  if ((a3 - 1) >= 5)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551D338 + (a3 - 1));
  }

  return v3;
}

- (int)payloadPaymentStatusAtIndex:(unint64_t)a3
{
  return self->_payloadPaymentStatus.list[a3];
}

- (unint64_t)payloadPaymentStatusCount
{
  return self->_payloadPaymentStatus.count;
}

- (void)addPayloadPaymentStatus:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadPaymentStatus
{
}

- (int)payloadPaymentStatus
{
  return self->_payloadPaymentStatus.list;
}

- (void)setPayloadPaymentStatus:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadPaymentMethodValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadPaymentMethodValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadPaymentMethodValuesCount
{
  return [(NSArray *)self->_payloadPaymentMethodValues count];
}

- (void)addPayloadPaymentMethodValue:(id)a3
{
  id v4 = a3;
  payloadPaymentMethodValues = self->_payloadPaymentMethodValues;
  id v8 = v4;
  if (!payloadPaymentMethodValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadPaymentMethodValues;
    self->_payloadPaymentMethodValues = v6;

    id v4 = v8;
    payloadPaymentMethodValues = self->_payloadPaymentMethodValues;
  }
  [(NSArray *)payloadPaymentMethodValues addObject:v4];
}

- (void)clearPayloadPaymentMethodValues
{
}

- (void)setPayloadPaymentMethodValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadPaymentMethodValues = self->_payloadPaymentMethodValues;
  self->_payloadPaymentMethodValues = v4;

  MEMORY[0x1F41817F8](v4, payloadPaymentMethodValues);
}

- (id)payloadPaymentMethodListAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadPaymentMethodLists objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadPaymentMethodListsCount
{
  return [(NSArray *)self->_payloadPaymentMethodLists count];
}

- (void)addPayloadPaymentMethodList:(id)a3
{
  id v4 = a3;
  payloadPaymentMethodLists = self->_payloadPaymentMethodLists;
  id v8 = v4;
  if (!payloadPaymentMethodLists)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadPaymentMethodLists;
    self->_payloadPaymentMethodLists = v6;

    id v4 = v8;
    payloadPaymentMethodLists = self->_payloadPaymentMethodLists;
  }
  [(NSArray *)payloadPaymentMethodLists addObject:v4];
}

- (void)clearPayloadPaymentMethodLists
{
}

- (void)setPayloadPaymentMethodLists:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadPaymentMethodLists = self->_payloadPaymentMethodLists;
  self->_payloadPaymentMethodLists = v4;

  MEMORY[0x1F41817F8](v4, payloadPaymentMethodLists);
}

- (id)payloadPaymentAmountValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadPaymentAmountValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadPaymentAmountValuesCount
{
  return [(NSArray *)self->_payloadPaymentAmountValues count];
}

- (void)addPayloadPaymentAmountValue:(id)a3
{
  id v4 = a3;
  payloadPaymentAmountValues = self->_payloadPaymentAmountValues;
  id v8 = v4;
  if (!payloadPaymentAmountValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadPaymentAmountValues;
    self->_payloadPaymentAmountValues = v6;

    id v4 = v8;
    payloadPaymentAmountValues = self->_payloadPaymentAmountValues;
  }
  [(NSArray *)payloadPaymentAmountValues addObject:v4];
}

- (void)clearPayloadPaymentAmountValues
{
}

- (void)setPayloadPaymentAmountValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadPaymentAmountValues = self->_payloadPaymentAmountValues;
  self->_payloadPaymentAmountValues = v4;

  MEMORY[0x1F41817F8](v4, payloadPaymentAmountValues);
}

- (int)StringAsPayloadParsecCategories:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MOVIE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TV"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WEB_VIDEO"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MUSIC"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PODCAST"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"APP"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"BOOK"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"OTHER"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadParsecCategoriesAsString:(int)a3
{
  if (a3 >= 9)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551D2F0 + a3);
  }

  return v3;
}

- (int)payloadParsecCategoryAtIndex:(unint64_t)a3
{
  return self->_payloadParsecCategories.list[a3];
}

- (unint64_t)payloadParsecCategoriesCount
{
  return self->_payloadParsecCategories.count;
}

- (void)addPayloadParsecCategory:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadParsecCategories
{
}

- (int)payloadParsecCategories
{
  return self->_payloadParsecCategories.list;
}

- (void)setPayloadParsecCategories:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadOutgoingMessageTypes:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"OUTGOING_MESSAGE_TEXT"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"OUTGOING_MESSAGE_AUDIO"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)payloadOutgoingMessageTypesAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"OUTGOING_MESSAGE_TEXT";
  }
  else if (a3 == 2)
  {
    int v4 = @"OUTGOING_MESSAGE_AUDIO";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)payloadOutgoingMessageTypeAtIndex:(unint64_t)a3
{
  return self->_payloadOutgoingMessageTypes.list[a3];
}

- (unint64_t)payloadOutgoingMessageTypesCount
{
  return self->_payloadOutgoingMessageTypes.count;
}

- (void)addPayloadOutgoingMessageType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadOutgoingMessageTypes
{
}

- (int)payloadOutgoingMessageTypes
{
  return self->_payloadOutgoingMessageTypes.list;
}

- (void)setPayloadOutgoingMessageTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadNumericSettingValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadNumericSettingValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadNumericSettingValuesCount
{
  return [(NSArray *)self->_payloadNumericSettingValues count];
}

- (void)addPayloadNumericSettingValue:(id)a3
{
  id v4 = a3;
  payloadNumericSettingValues = self->_payloadNumericSettingValues;
  id v8 = v4;
  if (!payloadNumericSettingValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadNumericSettingValues;
    self->_payloadNumericSettingValues = v6;

    id v4 = v8;
    payloadNumericSettingValues = self->_payloadNumericSettingValues;
  }
  [(NSArray *)payloadNumericSettingValues addObject:v4];
}

- (void)clearPayloadNumericSettingValues
{
}

- (void)setPayloadNumericSettingValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadNumericSettingValues = self->_payloadNumericSettingValues;
  self->_payloadNumericSettingValues = v4;

  MEMORY[0x1F41817F8](v4, payloadNumericSettingValues);
}

- (int)StringAsPayloadNumericSettingUnits:(id)a3
{
  return 1;
}

- (id)payloadNumericSettingUnitsAsString:(int)a3
{
  if (a3 == 1)
  {
    id v4 = @"PERCENTAGE";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)payloadNumericSettingUnitAtIndex:(unint64_t)a3
{
  return self->_payloadNumericSettingUnits.list[a3];
}

- (unint64_t)payloadNumericSettingUnitsCount
{
  return self->_payloadNumericSettingUnits.count;
}

- (void)addPayloadNumericSettingUnit:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadNumericSettingUnits
{
}

- (int)payloadNumericSettingUnits
{
  return self->_payloadNumericSettingUnits.list;
}

- (void)setPayloadNumericSettingUnits:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadNotebookItemTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_NOTE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NOTE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"TASK_LIST"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"TASK"])
  {
    int v4 = 30;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadNotebookItemTypesAsString:(int)a3
{
  if (a3 > 19)
  {
    if (a3 == 20)
    {
      int v4 = @"TASK_LIST";
    }
    else
    {
      if (a3 != 30)
      {
LABEL_12:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      int v4 = @"TASK";
    }
  }
  else
  {
    if (a3)
    {
      if (a3 == 10)
      {
        int v4 = @"NOTE";
        return v4;
      }
      goto LABEL_12;
    }
    int v4 = @"UNKNOWN_NOTE_TYPE";
  }
  return v4;
}

- (int)payloadNotebookItemTypeAtIndex:(unint64_t)a3
{
  return self->_payloadNotebookItemTypes.list[a3];
}

- (unint64_t)payloadNotebookItemTypesCount
{
  return self->_payloadNotebookItemTypes.count;
}

- (void)addPayloadNotebookItemType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadNotebookItemTypes
{
}

- (int)payloadNotebookItemTypes
{
  return self->_payloadNotebookItemTypes.list;
}

- (void)setPayloadNotebookItemTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadNoteContentAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadNoteContents objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadNoteContentsCount
{
  return [(NSArray *)self->_payloadNoteContents count];
}

- (void)addPayloadNoteContent:(id)a3
{
  id v4 = a3;
  payloadNoteContents = self->_payloadNoteContents;
  id v8 = v4;
  if (!payloadNoteContents)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadNoteContents;
    self->_payloadNoteContents = v6;

    id v4 = v8;
    payloadNoteContents = self->_payloadNoteContents;
  }
  [(NSArray *)payloadNoteContents addObject:v4];
}

- (void)clearPayloadNoteContents
{
}

- (void)setPayloadNoteContents:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadNoteContents = self->_payloadNoteContents;
  self->_payloadNoteContents = v4;

  MEMORY[0x1F41817F8](v4, payloadNoteContents);
}

- (id)payloadNoteAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadNotes objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadNotesCount
{
  return [(NSArray *)self->_payloadNotes count];
}

- (void)addPayloadNote:(id)a3
{
  id v4 = a3;
  payloadNotes = self->_payloadNotes;
  id v8 = v4;
  if (!payloadNotes)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadNotes;
    self->_payloadNotes = v6;

    id v4 = v8;
    payloadNotes = self->_payloadNotes;
  }
  [(NSArray *)payloadNotes addObject:v4];
}

- (void)clearPayloadNotes
{
}

- (void)setPayloadNotes:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadNotes = self->_payloadNotes;
  self->_payloadNotes = v4;

  MEMORY[0x1F41817F8](v4, payloadNotes);
}

- (id)payloadModifyRelationshipAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadModifyRelationships objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadModifyRelationshipsCount
{
  return [(NSArray *)self->_payloadModifyRelationships count];
}

- (void)addPayloadModifyRelationship:(id)a3
{
  id v4 = a3;
  payloadModifyRelationships = self->_payloadModifyRelationships;
  id v8 = v4;
  if (!payloadModifyRelationships)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadModifyRelationships;
    self->_payloadModifyRelationships = v6;

    id v4 = v8;
    payloadModifyRelationships = self->_payloadModifyRelationships;
  }
  [(NSArray *)payloadModifyRelationships addObject:v4];
}

- (void)clearPayloadModifyRelationships
{
}

- (void)setPayloadModifyRelationships:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadModifyRelationships = self->_payloadModifyRelationships;
  self->_payloadModifyRelationships = v4;

  MEMORY[0x1F41817F8](v4, payloadModifyRelationships);
}

- (id)payloadModifyNicknameAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadModifyNicknames objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadModifyNicknamesCount
{
  return [(NSArray *)self->_payloadModifyNicknames count];
}

- (void)addPayloadModifyNickname:(id)a3
{
  id v4 = a3;
  payloadModifyNicknames = self->_payloadModifyNicknames;
  id v8 = v4;
  if (!payloadModifyNicknames)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadModifyNicknames;
    self->_payloadModifyNicknames = v6;

    id v4 = v8;
    payloadModifyNicknames = self->_payloadModifyNicknames;
  }
  [(NSArray *)payloadModifyNicknames addObject:v4];
}

- (void)clearPayloadModifyNicknames
{
}

- (void)setPayloadModifyNicknames:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadModifyNicknames = self->_payloadModifyNicknames;
  self->_payloadModifyNicknames = v4;

  MEMORY[0x1F41817F8](v4, payloadModifyNicknames);
}

- (int)StringAsPayloadMessageTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TEXT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AUDIO"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DIGITAL_TOUCH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HANDWRITING"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"STICKER"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TAPBACK_LIKED"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"TAPBACK_DISLIKED"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"TAPBACK_EMPHASIZED"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"TAPBACK_LOVED"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"TAPBACK_QUESTIONED"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"TAPBACK_LAUGHED"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"MEDIA_TYPE_CALENDAR"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"MEDIA_TYPE_LOCATION"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"MEDIA_TYPE_ADDRESS_CARD"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"MEDIA_TYPE_IMAGE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"MEDIA_TYPE_VIDEO"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"MEDIA_TYPE_PASS"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"MEDIA_TYPE_AUDIO"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"PAYMENT_SENT"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"PAYMENT_REQUEST"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"PAYMENT_NOTE"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"ANIMOJI"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"ACTIVITY_SNIPPET"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"FILE"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"LINK"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"MESSAGE_REACTION"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"SAFETY_MONITOR"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"LOCATION_REQUEST"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"SHARED_LOCATION"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"FIND_MY"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"SCREEN_TIME_REQUEST"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"ASK_TO"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"MEDIA_TYPE_ANIMATED_IMAGE"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"THIRD_PARTY_ATTACHMENT"])
  {
    int v4 = 34;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)payloadMessageTypesAsString:(int)a3
{
  if ((a3 - 1) >= 0x22)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551D1E0 + (a3 - 1));
  }

  return v3;
}

- (int)payloadMessageTypeAtIndex:(unint64_t)a3
{
  return self->_payloadMessageTypes.list[a3];
}

- (unint64_t)payloadMessageTypesCount
{
  return self->_payloadMessageTypes.count;
}

- (void)addPayloadMessageType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadMessageTypes
{
}

- (int)payloadMessageTypes
{
  return self->_payloadMessageTypes.list;
}

- (void)setPayloadMessageTypes:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadMessageEffects:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"HAPPY_BIRTHDAY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CONFETTI"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LASERS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FIREWORKS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SHOOTING_STAR"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"INVISBLE_INK"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"GENTLE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"LOUD"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"IMPACT"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SPARKLES"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"HEART"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ECHO"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SPOTLIGHT"])
  {
    int v4 = 13;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)payloadMessageEffectsAsString:(int)a3
{
  if ((a3 - 1) >= 0xD)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551D178 + (a3 - 1));
  }

  return v3;
}

- (int)payloadMessageEffectAtIndex:(unint64_t)a3
{
  return self->_payloadMessageEffects.list[a3];
}

- (unint64_t)payloadMessageEffectsCount
{
  return self->_payloadMessageEffects.count;
}

- (void)addPayloadMessageEffect:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadMessageEffects
{
}

- (int)payloadMessageEffects
{
  return self->_payloadMessageEffects.list;
}

- (void)setPayloadMessageEffects:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadMessageAttributes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"READ"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"UNREAD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FLAGGED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNFLAGGED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PLAYED"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)payloadMessageAttributesAsString:(int)a3
{
  if ((a3 - 1) >= 5)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551D150 + (a3 - 1));
  }

  return v3;
}

- (int)payloadMessageAttributeAtIndex:(unint64_t)a3
{
  return self->_payloadMessageAttributes.list[a3];
}

- (unint64_t)payloadMessageAttributesCount
{
  return self->_payloadMessageAttributes.count;
}

- (void)addPayloadMessageAttribute:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadMessageAttributes
{
}

- (int)payloadMessageAttributes
{
  return self->_payloadMessageAttributes.list;
}

- (void)setPayloadMessageAttributes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadMediaSearchAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadMediaSearchs objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadMediaSearchsCount
{
  return [(NSArray *)self->_payloadMediaSearchs count];
}

- (void)addPayloadMediaSearch:(id)a3
{
  id v4 = a3;
  payloadMediaSearchs = self->_payloadMediaSearchs;
  id v8 = v4;
  if (!payloadMediaSearchs)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadMediaSearchs;
    self->_payloadMediaSearchs = v6;

    id v4 = v8;
    payloadMediaSearchs = self->_payloadMediaSearchs;
  }
  [(NSArray *)payloadMediaSearchs addObject:v4];
}

- (void)clearPayloadMediaSearchs
{
}

- (void)setPayloadMediaSearchs:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadMediaSearchs = self->_payloadMediaSearchs;
  self->_payloadMediaSearchs = v4;

  MEMORY[0x1F41817F8](v4, payloadMediaSearchs);
}

- (id)payloadMediaItemValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadMediaItemValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadMediaItemValuesCount
{
  return [(NSArray *)self->_payloadMediaItemValues count];
}

- (void)addPayloadMediaItemValue:(id)a3
{
  id v4 = a3;
  payloadMediaItemValues = self->_payloadMediaItemValues;
  id v8 = v4;
  if (!payloadMediaItemValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadMediaItemValues;
    self->_payloadMediaItemValues = v6;

    id v4 = v8;
    payloadMediaItemValues = self->_payloadMediaItemValues;
  }
  [(NSArray *)payloadMediaItemValues addObject:v4];
}

- (void)clearPayloadMediaItemValues
{
}

- (void)setPayloadMediaItemValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadMediaItemValues = self->_payloadMediaItemValues;
  self->_payloadMediaItemValues = v4;

  MEMORY[0x1F41817F8](v4, payloadMediaItemValues);
}

- (id)payloadMediaItemGroupAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadMediaItemGroups objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadMediaItemGroupsCount
{
  return [(NSArray *)self->_payloadMediaItemGroups count];
}

- (void)addPayloadMediaItemGroup:(id)a3
{
  id v4 = a3;
  payloadMediaItemGroups = self->_payloadMediaItemGroups;
  id v8 = v4;
  if (!payloadMediaItemGroups)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadMediaItemGroups;
    self->_payloadMediaItemGroups = v6;

    id v4 = v8;
    payloadMediaItemGroups = self->_payloadMediaItemGroups;
  }
  [(NSArray *)payloadMediaItemGroups addObject:v4];
}

- (void)clearPayloadMediaItemGroups
{
}

- (void)setPayloadMediaItemGroups:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadMediaItemGroups = self->_payloadMediaItemGroups;
  self->_payloadMediaItemGroups = v4;

  MEMORY[0x1F41817F8](v4, payloadMediaItemGroups);
}

- (id)payloadMediaDestinationAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadMediaDestinations objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadMediaDestinationsCount
{
  return [(NSArray *)self->_payloadMediaDestinations count];
}

- (void)addPayloadMediaDestination:(id)a3
{
  id v4 = a3;
  payloadMediaDestinations = self->_payloadMediaDestinations;
  id v8 = v4;
  if (!payloadMediaDestinations)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadMediaDestinations;
    self->_payloadMediaDestinations = v6;

    id v4 = v8;
    payloadMediaDestinations = self->_payloadMediaDestinations;
  }
  [(NSArray *)payloadMediaDestinations addObject:v4];
}

- (void)clearPayloadMediaDestinations
{
}

- (void)setPayloadMediaDestinations:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadMediaDestinations = self->_payloadMediaDestinations;
  self->_payloadMediaDestinations = v4;

  MEMORY[0x1F41817F8](v4, payloadMediaDestinations);
}

- (int)StringAsPayloadMediaAffinityTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_AFFINITY_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LIKE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DISLIKE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadMediaAffinityTypesAsString:(int)a3
{
  if (a3 >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551D138 + a3);
  }

  return v3;
}

- (int)payloadMediaAffinityTypeAtIndex:(unint64_t)a3
{
  return self->_payloadMediaAffinityTypes.list[a3];
}

- (unint64_t)payloadMediaAffinityTypesCount
{
  return self->_payloadMediaAffinityTypes.count;
}

- (void)addPayloadMediaAffinityType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadMediaAffinityTypes
{
}

- (int)payloadMediaAffinityTypes
{
  return self->_payloadMediaAffinityTypes.list;
}

- (void)setPayloadMediaAffinityTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadMassValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadMassValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadMassValuesCount
{
  return [(NSArray *)self->_payloadMassValues count];
}

- (void)addPayloadMassValue:(id)a3
{
  id v4 = a3;
  payloadMassValues = self->_payloadMassValues;
  id v8 = v4;
  if (!payloadMassValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadMassValues;
    self->_payloadMassValues = v6;

    id v4 = v8;
    payloadMassValues = self->_payloadMassValues;
  }
  [(NSArray *)payloadMassValues addObject:v4];
}

- (void)clearPayloadMassValues
{
}

- (void)setPayloadMassValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadMassValues = self->_payloadMassValues;
  self->_payloadMassValues = v4;

  MEMORY[0x1F41817F8](v4, payloadMassValues);
}

- (id)payloadLongValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadLongValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadLongValuesCount
{
  return [(NSArray *)self->_payloadLongValues count];
}

- (void)addPayloadLongValue:(id)a3
{
  id v4 = a3;
  payloadLongValues = self->_payloadLongValues;
  id v8 = v4;
  if (!payloadLongValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadLongValues;
    self->_payloadLongValues = v6;

    id v4 = v8;
    payloadLongValues = self->_payloadLongValues;
  }
  [(NSArray *)payloadLongValues addObject:v4];
}

- (void)clearPayloadLongValues
{
}

- (void)setPayloadLongValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadLongValues = self->_payloadLongValues;
  self->_payloadLongValues = v4;

  MEMORY[0x1F41817F8](v4, payloadLongValues);
}

- (id)payloadLongListAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadLongLists objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadLongListsCount
{
  return [(NSArray *)self->_payloadLongLists count];
}

- (void)addPayloadLongList:(id)a3
{
  id v4 = a3;
  payloadLongLists = self->_payloadLongLists;
  id v8 = v4;
  if (!payloadLongLists)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadLongLists;
    self->_payloadLongLists = v6;

    id v4 = v8;
    payloadLongLists = self->_payloadLongLists;
  }
  [(NSArray *)payloadLongLists addObject:v4];
}

- (void)clearPayloadLongLists
{
}

- (void)setPayloadLongLists:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadLongLists = self->_payloadLongLists;
  self->_payloadLongLists = v4;

  MEMORY[0x1F41817F8](v4, payloadLongLists);
}

- (int)StringAsPayloadLocationSearchTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_LOCATION_SEARCH_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BY_LOCATION_TRIGGER"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadLocationSearchTypesAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 10)
    {
      int v4 = @"BY_LOCATION_TRIGGER";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"UNKNOWN_LOCATION_SEARCH_TYPE";
  }
  return v4;
}

- (int)payloadLocationSearchTypeAtIndex:(unint64_t)a3
{
  return self->_payloadLocationSearchTypes.list[a3];
}

- (unint64_t)payloadLocationSearchTypesCount
{
  return self->_payloadLocationSearchTypes.count;
}

- (void)addPayloadLocationSearchType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadLocationSearchTypes
{
}

- (int)payloadLocationSearchTypes
{
  return self->_payloadLocationSearchTypes.list;
}

- (void)setPayloadLocationSearchTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadLocationListAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadLocationLists objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadLocationListsCount
{
  return [(NSArray *)self->_payloadLocationLists count];
}

- (void)addPayloadLocationList:(id)a3
{
  id v4 = a3;
  payloadLocationLists = self->_payloadLocationLists;
  id v8 = v4;
  if (!payloadLocationLists)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadLocationLists;
    self->_payloadLocationLists = v6;

    id v4 = v8;
    payloadLocationLists = self->_payloadLocationLists;
  }
  [(NSArray *)payloadLocationLists addObject:v4];
}

- (void)clearPayloadLocationLists
{
}

- (void)setPayloadLocationLists:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadLocationLists = self->_payloadLocationLists;
  self->_payloadLocationLists = v4;

  MEMORY[0x1F41817F8](v4, payloadLocationLists);
}

- (id)payloadLocationAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadLocations objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadLocationsCount
{
  return [(NSArray *)self->_payloadLocations count];
}

- (void)addPayloadLocation:(id)a3
{
  id v4 = a3;
  payloadLocations = self->_payloadLocations;
  id v8 = v4;
  if (!payloadLocations)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadLocations;
    self->_payloadLocations = v6;

    id v4 = v8;
    payloadLocations = self->_payloadLocations;
  }
  [(NSArray *)payloadLocations addObject:v4];
}

- (void)clearPayloadLocations
{
}

- (void)setPayloadLocations:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadLocations = self->_payloadLocations;
  self->_payloadLocations = v4;

  MEMORY[0x1F41817F8](v4, payloadLocations);
}

- (id)payloadIntentExecutionResultAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadIntentExecutionResults objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadIntentExecutionResultsCount
{
  return [(NSArray *)self->_payloadIntentExecutionResults count];
}

- (void)addPayloadIntentExecutionResult:(id)a3
{
  id v4 = a3;
  payloadIntentExecutionResults = self->_payloadIntentExecutionResults;
  id v8 = v4;
  if (!payloadIntentExecutionResults)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadIntentExecutionResults;
    self->_payloadIntentExecutionResults = v6;

    id v4 = v8;
    payloadIntentExecutionResults = self->_payloadIntentExecutionResults;
  }
  [(NSArray *)payloadIntentExecutionResults addObject:v4];
}

- (void)clearPayloadIntentExecutionResults
{
}

- (void)setPayloadIntentExecutionResults:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadIntentExecutionResults = self->_payloadIntentExecutionResults;
  self->_payloadIntentExecutionResults = v4;

  MEMORY[0x1F41817F8](v4, payloadIntentExecutionResults);
}

- (id)payloadIntentAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadIntents objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadIntentsCount
{
  return [(NSArray *)self->_payloadIntents count];
}

- (void)addPayloadIntent:(id)a3
{
  id v4 = a3;
  payloadIntents = self->_payloadIntents;
  id v8 = v4;
  if (!payloadIntents)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadIntents;
    self->_payloadIntents = v6;

    id v4 = v8;
    payloadIntents = self->_payloadIntents;
  }
  [(NSArray *)payloadIntents addObject:v4];
}

- (void)clearPayloadIntents
{
}

- (void)setPayloadIntents:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadIntents = self->_payloadIntents;
  self->_payloadIntents = v4;

  MEMORY[0x1F41817F8](v4, payloadIntents);
}

- (id)payloadIntegerValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadIntegerValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadIntegerValuesCount
{
  return [(NSArray *)self->_payloadIntegerValues count];
}

- (void)addPayloadIntegerValue:(id)a3
{
  id v4 = a3;
  payloadIntegerValues = self->_payloadIntegerValues;
  id v8 = v4;
  if (!payloadIntegerValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadIntegerValues;
    self->_payloadIntegerValues = v6;

    id v4 = v8;
    payloadIntegerValues = self->_payloadIntegerValues;
  }
  [(NSArray *)payloadIntegerValues addObject:v4];
}

- (void)clearPayloadIntegerValues
{
}

- (void)setPayloadIntegerValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadIntegerValues = self->_payloadIntegerValues;
  self->_payloadIntegerValues = v4;

  MEMORY[0x1F41817F8](v4, payloadIntegerValues);
}

- (id)payloadIntegerListAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadIntegerLists objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadIntegerListsCount
{
  return [(NSArray *)self->_payloadIntegerLists count];
}

- (void)addPayloadIntegerList:(id)a3
{
  id v4 = a3;
  payloadIntegerLists = self->_payloadIntegerLists;
  id v8 = v4;
  if (!payloadIntegerLists)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadIntegerLists;
    self->_payloadIntegerLists = v6;

    id v4 = v8;
    payloadIntegerLists = self->_payloadIntegerLists;
  }
  [(NSArray *)payloadIntegerLists addObject:v4];
}

- (void)clearPayloadIntegerLists
{
}

- (void)setPayloadIntegerLists:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadIntegerLists = self->_payloadIntegerLists;
  self->_payloadIntegerLists = v4;

  MEMORY[0x1F41817F8](v4, payloadIntegerLists);
}

- (id)payloadHomeUserTaskAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadHomeUserTasks objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadHomeUserTasksCount
{
  return [(NSArray *)self->_payloadHomeUserTasks count];
}

- (void)addPayloadHomeUserTask:(id)a3
{
  id v4 = a3;
  payloadHomeUserTasks = self->_payloadHomeUserTasks;
  id v8 = v4;
  if (!payloadHomeUserTasks)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadHomeUserTasks;
    self->_payloadHomeUserTasks = v6;

    id v4 = v8;
    payloadHomeUserTasks = self->_payloadHomeUserTasks;
  }
  [(NSArray *)payloadHomeUserTasks addObject:v4];
}

- (void)clearPayloadHomeUserTasks
{
}

- (void)setPayloadHomeUserTasks:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadHomeUserTasks = self->_payloadHomeUserTasks;
  self->_payloadHomeUserTasks = v4;

  MEMORY[0x1F41817F8](v4, payloadHomeUserTasks);
}

- (id)payloadHomeFilterAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadHomeFilters objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadHomeFiltersCount
{
  return [(NSArray *)self->_payloadHomeFilters count];
}

- (void)addPayloadHomeFilter:(id)a3
{
  id v4 = a3;
  payloadHomeFilters = self->_payloadHomeFilters;
  id v8 = v4;
  if (!payloadHomeFilters)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadHomeFilters;
    self->_payloadHomeFilters = v6;

    id v4 = v8;
    payloadHomeFilters = self->_payloadHomeFilters;
  }
  [(NSArray *)payloadHomeFilters addObject:v4];
}

- (void)clearPayloadHomeFilters
{
}

- (void)setPayloadHomeFilters:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadHomeFilters = self->_payloadHomeFilters;
  self->_payloadHomeFilters = v4;

  MEMORY[0x1F41817F8](v4, payloadHomeFilters);
}

- (int)StringAsPayloadHomeEntityTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"HOME"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ZONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ROOM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GROUP"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SCENE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TRIGGER"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"DEVICE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadHomeEntityTypesAsString:(int)a3
{
  if (a3 >= 7)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551D100 + a3);
  }

  return v3;
}

- (int)payloadHomeEntityTypeAtIndex:(unint64_t)a3
{
  return self->_payloadHomeEntityTypes.list[a3];
}

- (unint64_t)payloadHomeEntityTypesCount
{
  return self->_payloadHomeEntityTypes.count;
}

- (void)addPayloadHomeEntityType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadHomeEntityTypes
{
}

- (int)payloadHomeEntityTypes
{
  return self->_payloadHomeEntityTypes.list;
}

- (void)setPayloadHomeEntityTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadHomeEntityAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadHomeEntities objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadHomeEntitiesCount
{
  return [(NSArray *)self->_payloadHomeEntities count];
}

- (void)addPayloadHomeEntity:(id)a3
{
  id v4 = a3;
  payloadHomeEntities = self->_payloadHomeEntities;
  id v8 = v4;
  if (!payloadHomeEntities)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadHomeEntities;
    self->_payloadHomeEntities = v6;

    id v4 = v8;
    payloadHomeEntities = self->_payloadHomeEntities;
  }
  [(NSArray *)payloadHomeEntities addObject:v4];
}

- (void)clearPayloadHomeEntities
{
}

- (void)setPayloadHomeEntities:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadHomeEntities = self->_payloadHomeEntities;
  self->_payloadHomeEntities = v4;

  MEMORY[0x1F41817F8](v4, payloadHomeEntities);
}

- (int)StringAsPayloadHomeDeviceTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LIGHTBULB"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SWITCH"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"THERMOSTAT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GARAGE_DOOR_OPENER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FAN"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"OUTLET"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"DOOR_LOCK"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"AIR_QUALITY_SENSOR"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"BATTERY"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"CARBON_DIOXIDE_SENSOR"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"CARBON_MONOXIDE_SENSOR"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"CONTACT_SENSOR"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"DOOR"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"HUMIDITY_SENSOR"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"LEAK_SENSOR"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"LIGHT_SENSOR"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"MOTION_SENSOR"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"OCCUPANCY_SENSOR"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"SECURITY_SYSTEM"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"SMOKE_SENSOR"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"TEMPERATURE_SENSOR"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"WINDOW"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"SHADES"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"IP_CAMERA"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"MICROPHONE"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"SPEAKER"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"MOTORIZED_DOOR"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"MOTORIZED_WINDOW"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"HEATER_COOLER"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"HUMIDIFIER_DEHUMIDIFIER"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"SLAT"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"SPRINKLER"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"VALVE"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"FAUCET"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"SHOWER"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"TELEVISION"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"CUSTOM"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"DOOR_BELL"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"AIR_PURIFIER"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"FILTER"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"APPLE_TV"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"CAMERA_RECORDING"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"SENSOR"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"AIRPORT_EXPRESS"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"SINK"])
  {
    int v4 = 49;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadHomeDeviceTypesAsString:(int)a3
{
  if a3 < 0x32 && ((0x3FFFFF79FFEEFuLL >> a3))
  {
    id v3 = *(&off_1E551CF70 + a3);
  }
  else
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }

  return v3;
}

- (int)payloadHomeDeviceTypeAtIndex:(unint64_t)a3
{
  return self->_payloadHomeDeviceTypes.list[a3];
}

- (unint64_t)payloadHomeDeviceTypesCount
{
  return self->_payloadHomeDeviceTypes.count;
}

- (void)addPayloadHomeDeviceType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadHomeDeviceTypes
{
}

- (int)payloadHomeDeviceTypes
{
  return self->_payloadHomeDeviceTypes.list;
}

- (void)setPayloadHomeDeviceTypes:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadHomeAttributeValueTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BOOLEAN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DOUBLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STRING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INTEGER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LIMIT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RANGE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadHomeAttributeValueTypesAsString:(int)a3
{
  if (a3 >= 6)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551CF40 + a3);
  }

  return v3;
}

- (int)payloadHomeAttributeValueTypeAtIndex:(unint64_t)a3
{
  return self->_payloadHomeAttributeValueTypes.list[a3];
}

- (unint64_t)payloadHomeAttributeValueTypesCount
{
  return self->_payloadHomeAttributeValueTypes.count;
}

- (void)addPayloadHomeAttributeValueType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadHomeAttributeValueTypes
{
}

- (int)payloadHomeAttributeValueTypes
{
  return self->_payloadHomeAttributeValueTypes.list;
}

- (void)setPayloadHomeAttributeValueTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadHomeAttributeValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadHomeAttributeValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadHomeAttributeValuesCount
{
  return [(NSArray *)self->_payloadHomeAttributeValues count];
}

- (void)addPayloadHomeAttributeValue:(id)a3
{
  id v4 = a3;
  payloadHomeAttributeValues = self->_payloadHomeAttributeValues;
  id v8 = v4;
  if (!payloadHomeAttributeValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadHomeAttributeValues;
    self->_payloadHomeAttributeValues = v6;

    id v4 = v8;
    payloadHomeAttributeValues = self->_payloadHomeAttributeValues;
  }
  [(NSArray *)payloadHomeAttributeValues addObject:v4];
}

- (void)clearPayloadHomeAttributeValues
{
}

- (void)setPayloadHomeAttributeValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadHomeAttributeValues = self->_payloadHomeAttributeValues;
  self->_payloadHomeAttributeValues = v4;

  MEMORY[0x1F41817F8](v4, payloadHomeAttributeValues);
}

- (int)StringAsPayloadHomeAttributeTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ENABLED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BRIGHTNESS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HUE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SATURATION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"COLOR_VALUE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TEMPERATURE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"HUMIDITY"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LOCK"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"POSITION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"RAISE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ROTATION_SPEED"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ROTATION_DIRECTION"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SECURITY_SYSTEM_STATE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"HEATING_COOLING_MODE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"HEATER_COOLER_MODE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"CONTROL_LOCK"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"COOLING_THRESHOLD"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"FAN_OPERATING_MODE"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"HEATING_THRESHOLD"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"HUMIDIFIER_DEHUMIDIFIER_MODE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"SLAT_OPERATING_MODE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"SWING_MODE"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"HUMIDIFIER_THRESHOLD"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"DEHUMIDIFIER_THRESHOLD"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"PROGRAM_MODE"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"DURATION"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"POWER"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"AIR_QUALITY_RATING"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"AIR_PARTICULATE_DENSITY"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"AIR_PARTICULATE_SIZE"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"SMOKE_DETECTED"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"CARBON_MONOXIDE_DETECTED"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"CARBON_MONOXIDE_LEVEL"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"CARBON_MONOXIDE_PEAK_LEVEL"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"CARBON_DIOXIDE_DETECTED"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"CARBON_DIOXIDE_LEVEL"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"CARBON_DIOXIDE_PEAK_LEVEL"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"CONTACT_DETECTED"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"OCCUPANCY_DETECTED"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"LEAK_DETECTED"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"MOTION_DETECTED"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"AMBIENT_LIGHT_LEVEL"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"BATTERY_LEVEL"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"CHARGING_STATE"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"LOW_BATTERY"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"IN_USE"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"AIR_PURIFIER_OPERATING_MODE"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"FILTER_CHANGE"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"FILTER_LIFE"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"WATER_LEVEL"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"REMAINING_DURATION"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"STATUS_FAULT"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"SULPHUR_DIOXIDE_DENSITY"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"NITROGEN_DIOXIDE_DENSITY"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"PARTICULATE_MATTER_2_5_DENSITY"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"PARTICULATE_MATTER_10_DENSITY"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"VOLATILE_ORGANIC_COMPOUND_DENSITY"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"OZONE_DENSITY"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"COLOR_TEMPERATURE"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"COUNT"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"LOCATION"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"INVENTORY"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"CAPABILITIES"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"OPEN"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"MEDIA"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"ADAPTIVE_LIGHTING"])
  {
    int v4 = 65;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadHomeAttributeTypesAsString:(int)a3
{
  if (a3 >= 0x42)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551CD30 + a3);
  }

  return v3;
}

- (int)payloadHomeAttributeTypeAtIndex:(unint64_t)a3
{
  return self->_payloadHomeAttributeTypes.list[a3];
}

- (unint64_t)payloadHomeAttributeTypesCount
{
  return self->_payloadHomeAttributeTypes.count;
}

- (void)addPayloadHomeAttributeType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadHomeAttributeTypes
{
}

- (int)payloadHomeAttributeTypes
{
  return self->_payloadHomeAttributeTypes.list;
}

- (void)setPayloadHomeAttributeTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadHomeAttributeAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadHomeAttributes objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadHomeAttributesCount
{
  return [(NSArray *)self->_payloadHomeAttributes count];
}

- (void)addPayloadHomeAttribute:(id)a3
{
  id v4 = a3;
  payloadHomeAttributes = self->_payloadHomeAttributes;
  id v8 = v4;
  if (!payloadHomeAttributes)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadHomeAttributes;
    self->_payloadHomeAttributes = v6;

    id v4 = v8;
    payloadHomeAttributes = self->_payloadHomeAttributes;
  }
  [(NSArray *)payloadHomeAttributes addObject:v4];
}

- (void)clearPayloadHomeAttributes
{
}

- (void)setPayloadHomeAttributes:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadHomeAttributes = self->_payloadHomeAttributes;
  self->_payloadHomeAttributes = v4;

  MEMORY[0x1F41817F8](v4, payloadHomeAttributes);
}

- (id)payloadGetSettingResponseDataAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadGetSettingResponseDatas objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadGetSettingResponseDatasCount
{
  return [(NSArray *)self->_payloadGetSettingResponseDatas count];
}

- (void)addPayloadGetSettingResponseData:(id)a3
{
  id v4 = a3;
  payloadGetSettingResponseDatas = self->_payloadGetSettingResponseDatas;
  id v8 = v4;
  if (!payloadGetSettingResponseDatas)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadGetSettingResponseDatas;
    self->_payloadGetSettingResponseDatas = v6;

    id v4 = v8;
    payloadGetSettingResponseDatas = self->_payloadGetSettingResponseDatas;
  }
  [(NSArray *)payloadGetSettingResponseDatas addObject:v4];
}

- (void)clearPayloadGetSettingResponseDatas
{
}

- (void)setPayloadGetSettingResponseDatas:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadGetSettingResponseDatas = self->_payloadGetSettingResponseDatas;
  self->_payloadGetSettingResponseDatas = v4;

  MEMORY[0x1F41817F8](v4, payloadGetSettingResponseDatas);
}

- (id)payloadGeographicalFeatureListAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadGeographicalFeatureLists objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadGeographicalFeatureListsCount
{
  return [(NSArray *)self->_payloadGeographicalFeatureLists count];
}

- (void)addPayloadGeographicalFeatureList:(id)a3
{
  id v4 = a3;
  payloadGeographicalFeatureLists = self->_payloadGeographicalFeatureLists;
  id v8 = v4;
  if (!payloadGeographicalFeatureLists)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadGeographicalFeatureLists;
    self->_payloadGeographicalFeatureLists = v6;

    id v4 = v8;
    payloadGeographicalFeatureLists = self->_payloadGeographicalFeatureLists;
  }
  [(NSArray *)payloadGeographicalFeatureLists addObject:v4];
}

- (void)clearPayloadGeographicalFeatureLists
{
}

- (void)setPayloadGeographicalFeatureLists:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadGeographicalFeatureLists = self->_payloadGeographicalFeatureLists;
  self->_payloadGeographicalFeatureLists = v4;

  MEMORY[0x1F41817F8](v4, payloadGeographicalFeatureLists);
}

- (id)payloadGeographicalFeatureAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadGeographicalFeatures objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadGeographicalFeaturesCount
{
  return [(NSArray *)self->_payloadGeographicalFeatures count];
}

- (void)addPayloadGeographicalFeature:(id)a3
{
  id v4 = a3;
  payloadGeographicalFeatures = self->_payloadGeographicalFeatures;
  id v8 = v4;
  if (!payloadGeographicalFeatures)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadGeographicalFeatures;
    self->_payloadGeographicalFeatures = v6;

    id v4 = v8;
    payloadGeographicalFeatures = self->_payloadGeographicalFeatures;
  }
  [(NSArray *)payloadGeographicalFeatures addObject:v4];
}

- (void)clearPayloadGeographicalFeatures
{
}

- (void)setPayloadGeographicalFeatures:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadGeographicalFeatures = self->_payloadGeographicalFeatures;
  self->_payloadGeographicalFeatures = v4;

  MEMORY[0x1F41817F8](v4, payloadGeographicalFeatures);
}

- (id)payloadFinancialAccountValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadFinancialAccountValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadFinancialAccountValuesCount
{
  return [(NSArray *)self->_payloadFinancialAccountValues count];
}

- (void)addPayloadFinancialAccountValue:(id)a3
{
  id v4 = a3;
  payloadFinancialAccountValues = self->_payloadFinancialAccountValues;
  id v8 = v4;
  if (!payloadFinancialAccountValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadFinancialAccountValues;
    self->_payloadFinancialAccountValues = v6;

    id v4 = v8;
    payloadFinancialAccountValues = self->_payloadFinancialAccountValues;
  }
  [(NSArray *)payloadFinancialAccountValues addObject:v4];
}

- (void)clearPayloadFinancialAccountValues
{
}

- (void)setPayloadFinancialAccountValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadFinancialAccountValues = self->_payloadFinancialAccountValues;
  self->_payloadFinancialAccountValues = v4;

  MEMORY[0x1F41817F8](v4, payloadFinancialAccountValues);
}

- (int)StringAsPayloadFileTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"OTHER"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"APPLICATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DOCUMENT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MUSIC"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MOVIE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PDF"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PRESENTATION"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"IMAGE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SOURCE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SPREADSHEET"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"TEXT"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadFileTypesAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551CCD8 + a3);
  }

  return v3;
}

- (int)payloadFileTypeAtIndex:(unint64_t)a3
{
  return self->_payloadFileTypes.list[a3];
}

- (unint64_t)payloadFileTypesCount
{
  return self->_payloadFileTypes.count;
}

- (void)addPayloadFileType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadFileTypes
{
}

- (int)payloadFileTypes
{
  return self->_payloadFileTypes.list;
}

- (void)setPayloadFileTypes:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadFileShareModes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AIRDROP"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MESSAGE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MAIL"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadFileShareModesAsString:(int)a3
{
  if (a3 >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551CCC0 + a3);
  }

  return v3;
}

- (int)payloadFileShareModeAtIndex:(unint64_t)a3
{
  return self->_payloadFileShareModes.list[a3];
}

- (unint64_t)payloadFileShareModesCount
{
  return self->_payloadFileShareModes.count;
}

- (void)addPayloadFileShareMode:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadFileShareModes
{
}

- (int)payloadFileShareModes
{
  return self->_payloadFileShareModes.list;
}

- (void)setPayloadFileShareModes:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadFileSearchScopes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DIRECTORY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VOLUME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"COMPUTER"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadFileSearchScopesAsString:(int)a3
{
  if (a3 >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551CCA8 + a3);
  }

  return v3;
}

- (int)payloadFileSearchScopeAtIndex:(unint64_t)a3
{
  return self->_payloadFileSearchScopes.list[a3];
}

- (unint64_t)payloadFileSearchScopesCount
{
  return self->_payloadFileSearchScopes.count;
}

- (void)addPayloadFileSearchScope:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadFileSearchScopes
{
}

- (int)payloadFileSearchScopes
{
  return self->_payloadFileSearchScopes.list;
}

- (void)setPayloadFileSearchScopes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadFilePropertyValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadFilePropertyValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadFilePropertyValuesCount
{
  return [(NSArray *)self->_payloadFilePropertyValues count];
}

- (void)addPayloadFilePropertyValue:(id)a3
{
  id v4 = a3;
  payloadFilePropertyValues = self->_payloadFilePropertyValues;
  id v8 = v4;
  if (!payloadFilePropertyValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadFilePropertyValues;
    self->_payloadFilePropertyValues = v6;

    id v4 = v8;
    payloadFilePropertyValues = self->_payloadFilePropertyValues;
  }
  [(NSArray *)payloadFilePropertyValues addObject:v4];
}

- (void)clearPayloadFilePropertyValues
{
}

- (void)setPayloadFilePropertyValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadFilePropertyValues = self->_payloadFilePropertyValues;
  self->_payloadFilePropertyValues = v4;

  MEMORY[0x1F41817F8](v4, payloadFilePropertyValues);
}

- (int)StringAsPayloadFilePropertyQualifiers:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"EQUAL"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AT_LEAST"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AT_MOST"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MIN"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MAX"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadFilePropertyQualifiersAsString:(int)a3
{
  if (a3 >= 5)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551CC80 + a3);
  }

  return v3;
}

- (int)payloadFilePropertyQualifierAtIndex:(unint64_t)a3
{
  return self->_payloadFilePropertyQualifiers.list[a3];
}

- (unint64_t)payloadFilePropertyQualifiersCount
{
  return self->_payloadFilePropertyQualifiers.count;
}

- (void)addPayloadFilePropertyQualifier:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadFilePropertyQualifiers
{
}

- (int)payloadFilePropertyQualifiers
{
  return self->_payloadFilePropertyQualifiers.list;
}

- (void)setPayloadFilePropertyQualifiers:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadFilePropertyNames:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SIZE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CONTENTS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AUTHOR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CREATION_TIME"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ACCESSED_TIME"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MODIFIED_TIME"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PRINTED_TIME"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SENDER"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RECIPIENT"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"PAGE_COUNT"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"TAG"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"FILE_TYPE"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadFilePropertyNamesAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551CC20 + a3);
  }

  return v3;
}

- (int)payloadFilePropertyNameAtIndex:(unint64_t)a3
{
  return self->_payloadFilePropertyNames.list[a3];
}

- (unint64_t)payloadFilePropertyNamesCount
{
  return self->_payloadFilePropertyNames.count;
}

- (void)addPayloadFilePropertyName:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadFilePropertyNames
{
}

- (int)payloadFilePropertyNames
{
  return self->_payloadFilePropertyNames.list;
}

- (void)setPayloadFilePropertyNames:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadFilePropertyAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadFileProperties objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadFilePropertiesCount
{
  return [(NSArray *)self->_payloadFileProperties count];
}

- (void)addPayloadFileProperty:(id)a3
{
  id v4 = a3;
  payloadFileProperties = self->_payloadFileProperties;
  id v8 = v4;
  if (!payloadFileProperties)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadFileProperties;
    self->_payloadFileProperties = v6;

    id v4 = v8;
    payloadFileProperties = self->_payloadFileProperties;
  }
  [(NSArray *)payloadFileProperties addObject:v4];
}

- (void)clearPayloadFileProperties
{
}

- (void)setPayloadFileProperties:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadFileProperties = self->_payloadFileProperties;
  self->_payloadFileProperties = v4;

  MEMORY[0x1F41817F8](v4, payloadFileProperties);
}

- (int)StringAsPayloadFileEntityTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FILE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FOLDER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REFERENCE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"URL"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadFileEntityTypesAsString:(int)a3
{
  if (a3 >= 4)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551CC00 + a3);
  }

  return v3;
}

- (int)payloadFileEntityTypeAtIndex:(unint64_t)a3
{
  return self->_payloadFileEntityTypes.list[a3];
}

- (unint64_t)payloadFileEntityTypesCount
{
  return self->_payloadFileEntityTypes.count;
}

- (void)addPayloadFileEntityType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadFileEntityTypes
{
}

- (int)payloadFileEntityTypes
{
  return self->_payloadFileEntityTypes.list;
}

- (void)setPayloadFileEntityTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadFileAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadFiles objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadFilesCount
{
  return [(NSArray *)self->_payloadFiles count];
}

- (void)addPayloadFile:(id)a3
{
  id v4 = a3;
  payloadFiles = self->_payloadFiles;
  id v8 = v4;
  if (!payloadFiles)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadFiles;
    self->_payloadFiles = v6;

    id v4 = v8;
    payloadFiles = self->_payloadFiles;
  }
  [(NSArray *)payloadFiles addObject:v4];
}

- (void)clearPayloadFiles
{
}

- (void)setPayloadFiles:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadFiles = self->_payloadFiles;
  self->_payloadFiles = v4;

  MEMORY[0x1F41817F8](v4, payloadFiles);
}

- (id)payloadEventParticipantAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadEventParticipants objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadEventParticipantsCount
{
  return [(NSArray *)self->_payloadEventParticipants count];
}

- (void)addPayloadEventParticipant:(id)a3
{
  id v4 = a3;
  payloadEventParticipants = self->_payloadEventParticipants;
  id v8 = v4;
  if (!payloadEventParticipants)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadEventParticipants;
    self->_payloadEventParticipants = v6;

    id v4 = v8;
    payloadEventParticipants = self->_payloadEventParticipants;
  }
  [(NSArray *)payloadEventParticipants addObject:v4];
}

- (void)clearPayloadEventParticipants
{
}

- (void)setPayloadEventParticipants:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadEventParticipants = self->_payloadEventParticipants;
  self->_payloadEventParticipants = v4;

  MEMORY[0x1F41817F8](v4, payloadEventParticipants);
}

- (id)payloadEventListAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadEventLists objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadEventListsCount
{
  return [(NSArray *)self->_payloadEventLists count];
}

- (void)addPayloadEventList:(id)a3
{
  id v4 = a3;
  payloadEventLists = self->_payloadEventLists;
  id v8 = v4;
  if (!payloadEventLists)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadEventLists;
    self->_payloadEventLists = v6;

    id v4 = v8;
    payloadEventLists = self->_payloadEventLists;
  }
  [(NSArray *)payloadEventLists addObject:v4];
}

- (void)clearPayloadEventLists
{
}

- (void)setPayloadEventLists:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadEventLists = self->_payloadEventLists;
  self->_payloadEventLists = v4;

  MEMORY[0x1F41817F8](v4, payloadEventLists);
}

- (int)StringAsPayloadEventAttributes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"EVENT_LOCATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PARTICIPANTS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DATETIME"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)payloadEventAttributesAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551CBE8 + (a3 - 1));
  }

  return v3;
}

- (int)payloadEventAttributeAtIndex:(unint64_t)a3
{
  return self->_payloadEventAttributes.list[a3];
}

- (unint64_t)payloadEventAttributesCount
{
  return self->_payloadEventAttributes.count;
}

- (void)addPayloadEventAttribute:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadEventAttributes
{
}

- (int)payloadEventAttributes
{
  return self->_payloadEventAttributes.list;
}

- (void)setPayloadEventAttributes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadEventAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadEvents objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadEventsCount
{
  return [(NSArray *)self->_payloadEvents count];
}

- (void)addPayloadEvent:(id)a3
{
  id v4 = a3;
  payloadEvents = self->_payloadEvents;
  id v8 = v4;
  if (!payloadEvents)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadEvents;
    self->_payloadEvents = v6;

    id v4 = v8;
    payloadEvents = self->_payloadEvents;
  }
  [(NSArray *)payloadEvents addObject:v4];
}

- (void)clearPayloadEvents
{
}

- (void)setPayloadEvents:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadEvents = self->_payloadEvents;
  self->_payloadEvents = v4;

  MEMORY[0x1F41817F8](v4, payloadEvents);
}

- (int64_t)payloadEnumerationAtIndex:(unint64_t)a3
{
  id v3 = [(NSArray *)self->_payloadEnumerations objectAtIndexedSubscript:a3];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (unint64_t)payloadEnumerationsCount
{
  return [(NSArray *)self->_payloadEnumerations count];
}

- (void)addPayloadEnumeration:(int64_t)a3
{
  payloadEnumerations = self->_payloadEnumerations;
  if (!payloadEnumerations)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadEnumerations;
    self->_payloadEnumerations = v6;

    payloadEnumerations = self->_payloadEnumerations;
  }
  id v8 = [NSNumber numberWithLongLong:a3];
  [(NSArray *)payloadEnumerations addObject:v8];
}

- (void)clearPayloadEnumerations
{
}

- (void)setPayloadEnumerations:(id)a3
{
  int64_t v4 = (NSArray *)[a3 mutableCopy];
  payloadEnumerations = self->_payloadEnumerations;
  self->_payloadEnumerations = v4;

  MEMORY[0x1F41817F8](v4, payloadEnumerations);
}

- (id)payloadEnergyValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadEnergyValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadEnergyValuesCount
{
  return [(NSArray *)self->_payloadEnergyValues count];
}

- (void)addPayloadEnergyValue:(id)a3
{
  id v4 = a3;
  payloadEnergyValues = self->_payloadEnergyValues;
  id v8 = v4;
  if (!payloadEnergyValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadEnergyValues;
    self->_payloadEnergyValues = v6;

    id v4 = v8;
    payloadEnergyValues = self->_payloadEnergyValues;
  }
  [(NSArray *)payloadEnergyValues addObject:v4];
}

- (void)clearPayloadEnergyValues
{
}

- (void)setPayloadEnergyValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadEnergyValues = self->_payloadEnergyValues;
  self->_payloadEnergyValues = v4;

  MEMORY[0x1F41817F8](v4, payloadEnergyValues);
}

- (id)payloadDoubleValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadDoubleValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadDoubleValuesCount
{
  return [(NSArray *)self->_payloadDoubleValues count];
}

- (void)addPayloadDoubleValue:(id)a3
{
  id v4 = a3;
  payloadDoubleValues = self->_payloadDoubleValues;
  id v8 = v4;
  if (!payloadDoubleValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadDoubleValues;
    self->_payloadDoubleValues = v6;

    id v4 = v8;
    payloadDoubleValues = self->_payloadDoubleValues;
  }
  [(NSArray *)payloadDoubleValues addObject:v4];
}

- (void)clearPayloadDoubleValues
{
}

- (void)setPayloadDoubleValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadDoubleValues = self->_payloadDoubleValues;
  self->_payloadDoubleValues = v4;

  MEMORY[0x1F41817F8](v4, payloadDoubleValues);
}

- (id)payloadDoubleListAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadDoubleLists objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadDoubleListsCount
{
  return [(NSArray *)self->_payloadDoubleLists count];
}

- (void)addPayloadDoubleList:(id)a3
{
  id v4 = a3;
  payloadDoubleLists = self->_payloadDoubleLists;
  id v8 = v4;
  if (!payloadDoubleLists)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadDoubleLists;
    self->_payloadDoubleLists = v6;

    id v4 = v8;
    payloadDoubleLists = self->_payloadDoubleLists;
  }
  [(NSArray *)payloadDoubleLists addObject:v4];
}

- (void)clearPayloadDoubleLists
{
}

- (void)setPayloadDoubleLists:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadDoubleLists = self->_payloadDoubleLists;
  self->_payloadDoubleLists = v4;

  MEMORY[0x1F41817F8](v4, payloadDoubleLists);
}

- (id)payloadDistanceValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadDistanceValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadDistanceValuesCount
{
  return [(NSArray *)self->_payloadDistanceValues count];
}

- (void)addPayloadDistanceValue:(id)a3
{
  id v4 = a3;
  payloadDistanceValues = self->_payloadDistanceValues;
  id v8 = v4;
  if (!payloadDistanceValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadDistanceValues;
    self->_payloadDistanceValues = v6;

    id v4 = v8;
    payloadDistanceValues = self->_payloadDistanceValues;
  }
  [(NSArray *)payloadDistanceValues addObject:v4];
}

- (void)clearPayloadDistanceValues
{
}

- (void)setPayloadDistanceValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadDistanceValues = self->_payloadDistanceValues;
  self->_payloadDistanceValues = v4;

  MEMORY[0x1F41817F8](v4, payloadDistanceValues);
}

- (id)payloadDistanceListAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadDistanceLists objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadDistanceListsCount
{
  return [(NSArray *)self->_payloadDistanceLists count];
}

- (void)addPayloadDistanceList:(id)a3
{
  id v4 = a3;
  payloadDistanceLists = self->_payloadDistanceLists;
  id v8 = v4;
  if (!payloadDistanceLists)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadDistanceLists;
    self->_payloadDistanceLists = v6;

    id v4 = v8;
    payloadDistanceLists = self->_payloadDistanceLists;
  }
  [(NSArray *)payloadDistanceLists addObject:v4];
}

- (void)clearPayloadDistanceLists
{
}

- (void)setPayloadDistanceLists:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadDistanceLists = self->_payloadDistanceLists;
  self->_payloadDistanceLists = v4;

  MEMORY[0x1F41817F8](v4, payloadDistanceLists);
}

- (id)payloadDialingContactAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadDialingContacts objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadDialingContactsCount
{
  return [(NSArray *)self->_payloadDialingContacts count];
}

- (void)addPayloadDialingContact:(id)a3
{
  id v4 = a3;
  payloadDialingContacts = self->_payloadDialingContacts;
  id v8 = v4;
  if (!payloadDialingContacts)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadDialingContacts;
    self->_payloadDialingContacts = v6;

    id v4 = v8;
    payloadDialingContacts = self->_payloadDialingContacts;
  }
  [(NSArray *)payloadDialingContacts addObject:v4];
}

- (void)clearPayloadDialingContacts
{
}

- (void)setPayloadDialingContacts:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadDialingContacts = self->_payloadDialingContacts;
  self->_payloadDialingContacts = v4;

  MEMORY[0x1F41817F8](v4, payloadDialingContacts);
}

- (int)StringAsPayloadDeviceTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"APPLE_TV"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"APPLE_WATCH"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IPHONE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"IPAD"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"IPOD"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"IMAC"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MAC"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MACBOOK"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"MACBOOK_AIR"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"MACBOOK_PRO"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"MAC_MINI"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"MAC_PRO"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadDeviceTypesAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551CB88 + a3);
  }

  return v3;
}

- (int)payloadDeviceTypeAtIndex:(unint64_t)a3
{
  return self->_payloadDeviceTypes.list[a3];
}

- (unint64_t)payloadDeviceTypesCount
{
  return self->_payloadDeviceTypes.count;
}

- (void)addPayloadDeviceType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadDeviceTypes
{
}

- (int)payloadDeviceTypes
{
  return self->_payloadDeviceTypes.list;
}

- (void)setPayloadDeviceTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadDeviceDetailAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadDeviceDetails objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadDeviceDetailsCount
{
  return [(NSArray *)self->_payloadDeviceDetails count];
}

- (void)addPayloadDeviceDetail:(id)a3
{
  id v4 = a3;
  payloadDeviceDetails = self->_payloadDeviceDetails;
  id v8 = v4;
  if (!payloadDeviceDetails)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadDeviceDetails;
    self->_payloadDeviceDetails = v6;

    id v4 = v8;
    payloadDeviceDetails = self->_payloadDeviceDetails;
  }
  [(NSArray *)payloadDeviceDetails addObject:v4];
}

- (void)clearPayloadDeviceDetails
{
}

- (void)setPayloadDeviceDetails:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadDeviceDetails = self->_payloadDeviceDetails;
  self->_payloadDeviceDetails = v4;

  MEMORY[0x1F41817F8](v4, payloadDeviceDetails);
}

- (id)payloadDeviceAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadDevices objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadDevicesCount
{
  return [(NSArray *)self->_payloadDevices count];
}

- (void)addPayloadDevice:(id)a3
{
  id v4 = a3;
  payloadDevices = self->_payloadDevices;
  id v8 = v4;
  if (!payloadDevices)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadDevices;
    self->_payloadDevices = v6;

    id v4 = v8;
    payloadDevices = self->_payloadDevices;
  }
  [(NSArray *)payloadDevices addObject:v4];
}

- (void)clearPayloadDevices
{
}

- (void)setPayloadDevices:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadDevices = self->_payloadDevices;
  self->_payloadDevices = v4;

  MEMORY[0x1F41817F8](v4, payloadDevices);
}

- (id)payloadDateTimeValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadDateTimeValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadDateTimeValuesCount
{
  return [(NSArray *)self->_payloadDateTimeValues count];
}

- (void)addPayloadDateTimeValue:(id)a3
{
  id v4 = a3;
  payloadDateTimeValues = self->_payloadDateTimeValues;
  id v8 = v4;
  if (!payloadDateTimeValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadDateTimeValues;
    self->_payloadDateTimeValues = v6;

    id v4 = v8;
    payloadDateTimeValues = self->_payloadDateTimeValues;
  }
  [(NSArray *)payloadDateTimeValues addObject:v4];
}

- (void)clearPayloadDateTimeValues
{
}

- (void)setPayloadDateTimeValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadDateTimeValues = self->_payloadDateTimeValues;
  self->_payloadDateTimeValues = v4;

  MEMORY[0x1F41817F8](v4, payloadDateTimeValues);
}

- (id)payloadDateTimeRangeValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadDateTimeRangeValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadDateTimeRangeValuesCount
{
  return [(NSArray *)self->_payloadDateTimeRangeValues count];
}

- (void)addPayloadDateTimeRangeValue:(id)a3
{
  id v4 = a3;
  payloadDateTimeRangeValues = self->_payloadDateTimeRangeValues;
  id v8 = v4;
  if (!payloadDateTimeRangeValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadDateTimeRangeValues;
    self->_payloadDateTimeRangeValues = v6;

    id v4 = v8;
    payloadDateTimeRangeValues = self->_payloadDateTimeRangeValues;
  }
  [(NSArray *)payloadDateTimeRangeValues addObject:v4];
}

- (void)clearPayloadDateTimeRangeValues
{
}

- (void)setPayloadDateTimeRangeValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadDateTimeRangeValues = self->_payloadDateTimeRangeValues;
  self->_payloadDateTimeRangeValues = v4;

  MEMORY[0x1F41817F8](v4, payloadDateTimeRangeValues);
}

- (id)payloadDateTimeRangeListAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadDateTimeRangeLists objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadDateTimeRangeListsCount
{
  return [(NSArray *)self->_payloadDateTimeRangeLists count];
}

- (void)addPayloadDateTimeRangeList:(id)a3
{
  id v4 = a3;
  payloadDateTimeRangeLists = self->_payloadDateTimeRangeLists;
  id v8 = v4;
  if (!payloadDateTimeRangeLists)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadDateTimeRangeLists;
    self->_payloadDateTimeRangeLists = v6;

    id v4 = v8;
    payloadDateTimeRangeLists = self->_payloadDateTimeRangeLists;
  }
  [(NSArray *)payloadDateTimeRangeLists addObject:v4];
}

- (void)clearPayloadDateTimeRangeLists
{
}

- (void)setPayloadDateTimeRangeLists:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadDateTimeRangeLists = self->_payloadDateTimeRangeLists;
  self->_payloadDateTimeRangeLists = v4;

  MEMORY[0x1F41817F8](v4, payloadDateTimeRangeLists);
}

- (int)StringAsPayloadDateSearchTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_DATE_SEARCH_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BY_DUE_DATE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"BY_MODIFIED_DATE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"BY_CREATED_DATE"])
  {
    int v4 = 30;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadDateSearchTypesAsString:(int)a3
{
  if (a3 > 19)
  {
    if (a3 == 20)
    {
      int v4 = @"BY_MODIFIED_DATE";
    }
    else
    {
      if (a3 != 30)
      {
LABEL_12:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      int v4 = @"BY_CREATED_DATE";
    }
  }
  else
  {
    if (a3)
    {
      if (a3 == 10)
      {
        int v4 = @"BY_DUE_DATE";
        return v4;
      }
      goto LABEL_12;
    }
    int v4 = @"UNKNOWN_DATE_SEARCH_TYPE";
  }
  return v4;
}

- (int)payloadDateSearchTypeAtIndex:(unint64_t)a3
{
  return self->_payloadDateSearchTypes.list[a3];
}

- (unint64_t)payloadDateSearchTypesCount
{
  return self->_payloadDateSearchTypes.count;
}

- (void)addPayloadDateSearchType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadDateSearchTypes
{
}

- (int)payloadDateSearchTypes
{
  return self->_payloadDateSearchTypes.list;
}

- (void)setPayloadDateSearchTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadDataStringListAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadDataStringLists objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadDataStringListsCount
{
  return [(NSArray *)self->_payloadDataStringLists count];
}

- (void)addPayloadDataStringList:(id)a3
{
  id v4 = a3;
  payloadDataStringLists = self->_payloadDataStringLists;
  id v8 = v4;
  if (!payloadDataStringLists)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadDataStringLists;
    self->_payloadDataStringLists = v6;

    id v4 = v8;
    payloadDataStringLists = self->_payloadDataStringLists;
  }
  [(NSArray *)payloadDataStringLists addObject:v4];
}

- (void)clearPayloadDataStringLists
{
}

- (void)setPayloadDataStringLists:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadDataStringLists = self->_payloadDataStringLists;
  self->_payloadDataStringLists = v4;

  MEMORY[0x1F41817F8](v4, payloadDataStringLists);
}

- (id)payloadDataStringAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadDataStrings objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadDataStringsCount
{
  return [(NSArray *)self->_payloadDataStrings count];
}

- (void)addPayloadDataString:(id)a3
{
  id v4 = a3;
  payloadDataStrings = self->_payloadDataStrings;
  id v8 = v4;
  if (!payloadDataStrings)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadDataStrings;
    self->_payloadDataStrings = v6;

    id v4 = v8;
    payloadDataStrings = self->_payloadDataStrings;
  }
  [(NSArray *)payloadDataStrings addObject:v4];
}

- (void)clearPayloadDataStrings
{
}

- (void)setPayloadDataStrings:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadDataStrings = self->_payloadDataStrings;
  self->_payloadDataStrings = v4;

  MEMORY[0x1F41817F8](v4, payloadDataStrings);
}

- (id)payloadCustomObjectAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadCustomObjects objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadCustomObjectsCount
{
  return [(NSArray *)self->_payloadCustomObjects count];
}

- (void)addPayloadCustomObject:(id)a3
{
  id v4 = a3;
  payloadCustomObjects = self->_payloadCustomObjects;
  id v8 = v4;
  if (!payloadCustomObjects)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadCustomObjects;
    self->_payloadCustomObjects = v6;

    id v4 = v8;
    payloadCustomObjects = self->_payloadCustomObjects;
  }
  [(NSArray *)payloadCustomObjects addObject:v4];
}

- (void)clearPayloadCustomObjects
{
}

- (void)setPayloadCustomObjects:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadCustomObjects = self->_payloadCustomObjects;
  self->_payloadCustomObjects = v4;

  MEMORY[0x1F41817F8](v4, payloadCustomObjects);
}

- (id)payloadCurrencyAmountAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadCurrencyAmounts objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadCurrencyAmountsCount
{
  return [(NSArray *)self->_payloadCurrencyAmounts count];
}

- (void)addPayloadCurrencyAmount:(id)a3
{
  id v4 = a3;
  payloadCurrencyAmounts = self->_payloadCurrencyAmounts;
  id v8 = v4;
  if (!payloadCurrencyAmounts)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadCurrencyAmounts;
    self->_payloadCurrencyAmounts = v6;

    id v4 = v8;
    payloadCurrencyAmounts = self->_payloadCurrencyAmounts;
  }
  [(NSArray *)payloadCurrencyAmounts addObject:v4];
}

- (void)clearPayloadCurrencyAmounts
{
}

- (void)setPayloadCurrencyAmounts:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadCurrencyAmounts = self->_payloadCurrencyAmounts;
  self->_payloadCurrencyAmounts = v4;

  MEMORY[0x1F41817F8](v4, payloadCurrencyAmounts);
}

- (id)payloadContactValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadContactValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadContactValuesCount
{
  return [(NSArray *)self->_payloadContactValues count];
}

- (void)addPayloadContactValue:(id)a3
{
  id v4 = a3;
  payloadContactValues = self->_payloadContactValues;
  id v8 = v4;
  if (!payloadContactValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadContactValues;
    self->_payloadContactValues = v6;

    id v4 = v8;
    payloadContactValues = self->_payloadContactValues;
  }
  [(NSArray *)payloadContactValues addObject:v4];
}

- (void)clearPayloadContactValues
{
}

- (void)setPayloadContactValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadContactValues = self->_payloadContactValues;
  self->_payloadContactValues = v4;

  MEMORY[0x1F41817F8](v4, payloadContactValues);
}

- (id)payloadContactListAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadContactLists objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadContactListsCount
{
  return [(NSArray *)self->_payloadContactLists count];
}

- (void)addPayloadContactList:(id)a3
{
  id v4 = a3;
  payloadContactLists = self->_payloadContactLists;
  id v8 = v4;
  if (!payloadContactLists)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadContactLists;
    self->_payloadContactLists = v6;

    id v4 = v8;
    payloadContactLists = self->_payloadContactLists;
  }
  [(NSArray *)payloadContactLists addObject:v4];
}

- (void)clearPayloadContactLists
{
}

- (void)setPayloadContactLists:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadContactLists = self->_payloadContactLists;
  self->_payloadContactLists = v4;

  MEMORY[0x1F41817F8](v4, payloadContactLists);
}

- (id)payloadContactEventTriggerAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadContactEventTriggers objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadContactEventTriggersCount
{
  return [(NSArray *)self->_payloadContactEventTriggers count];
}

- (void)addPayloadContactEventTrigger:(id)a3
{
  id v4 = a3;
  payloadContactEventTriggers = self->_payloadContactEventTriggers;
  id v8 = v4;
  if (!payloadContactEventTriggers)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadContactEventTriggers;
    self->_payloadContactEventTriggers = v6;

    id v4 = v8;
    payloadContactEventTriggers = self->_payloadContactEventTriggers;
  }
  [(NSArray *)payloadContactEventTriggers addObject:v4];
}

- (void)clearPayloadContactEventTriggers
{
}

- (void)setPayloadContactEventTriggers:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadContactEventTriggers = self->_payloadContactEventTriggers;
  self->_payloadContactEventTriggers = v4;

  MEMORY[0x1F41817F8](v4, payloadContactEventTriggers);
}

- (id)payloadChargingConnectorTypeAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadChargingConnectorTypes objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadChargingConnectorTypesCount
{
  return [(NSArray *)self->_payloadChargingConnectorTypes count];
}

- (void)addPayloadChargingConnectorType:(id)a3
{
  id v4 = a3;
  payloadChargingConnectorTypes = self->_payloadChargingConnectorTypes;
  id v8 = v4;
  if (!payloadChargingConnectorTypes)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadChargingConnectorTypes;
    self->_payloadChargingConnectorTypes = v6;

    id v4 = v8;
    payloadChargingConnectorTypes = self->_payloadChargingConnectorTypes;
  }
  [(NSArray *)payloadChargingConnectorTypes addObject:v4];
}

- (void)clearPayloadChargingConnectorTypes
{
}

- (void)setPayloadChargingConnectorTypes:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadChargingConnectorTypes = self->_payloadChargingConnectorTypes;
  self->_payloadChargingConnectorTypes = v4;

  MEMORY[0x1F41817F8](v4, payloadChargingConnectorTypes);
}

- (int)StringAsPayloadChangeAlarmStatusOperations:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ENABLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DISABLE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DISMISS"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)payloadChangeAlarmStatusOperationsAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551CB70 + (a3 - 1));
  }

  return v3;
}

- (int)payloadChangeAlarmStatusOperationAtIndex:(unint64_t)a3
{
  return self->_payloadChangeAlarmStatusOperations.list[a3];
}

- (unint64_t)payloadChangeAlarmStatusOperationsCount
{
  return self->_payloadChangeAlarmStatusOperations.count;
}

- (void)addPayloadChangeAlarmStatusOperation:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadChangeAlarmStatusOperations
{
}

- (int)payloadChangeAlarmStatusOperations
{
  return self->_payloadChangeAlarmStatusOperations.list;
}

- (void)setPayloadChangeAlarmStatusOperations:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadCarSignalIdentifiers:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"AUDIBLE"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"VISIBLE"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)payloadCarSignalIdentifiersAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"AUDIBLE";
  }
  else if (a3 == 2)
  {
    int v4 = @"VISIBLE";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)payloadCarSignalIdentifierAtIndex:(unint64_t)a3
{
  return self->_payloadCarSignalIdentifiers.list[a3];
}

- (unint64_t)payloadCarSignalIdentifiersCount
{
  return self->_payloadCarSignalIdentifiers.count;
}

- (void)addPayloadCarSignalIdentifier:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadCarSignalIdentifiers
{
}

- (int)payloadCarSignalIdentifiers
{
  return self->_payloadCarSignalIdentifiers.list;
}

- (void)setPayloadCarSignalIdentifiers:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadCarSeats:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DRIVER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PASSENGER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FRONT_LEFT"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"FRONT_RIGHT"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"FRONT"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"REAR_LEFT"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"REAR_RIGHT"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"REAR"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"THIRD_ROW_LEFT"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"THIRD_ROW_RIGHT"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"THIRD_ROW"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"ALL"])
  {
    int v4 = 22;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)payloadCarSeatsAsString:(int)a3
{
  unsigned int v3 = a3 - 1;
  if (a3 - 1) < 0x16 && ((0x3F8383u >> v3))
  {
    int v4 = *(&off_1E551CAC0 + v3);
  }
  else
  {
    int v4 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }

  return v4;
}

- (int)payloadCarSeatAtIndex:(unint64_t)a3
{
  return self->_payloadCarSeats.list[a3];
}

- (unint64_t)payloadCarSeatsCount
{
  return self->_payloadCarSeats.count;
}

- (void)addPayloadCarSeat:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadCarSeats
{
}

- (int)payloadCarSeats
{
  return self->_payloadCarSeats.list;
}

- (void)setPayloadCarSeats:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadCarDefrosters:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FRONT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REAR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ALL"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)payloadCarDefrostersAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551CAA8 + (a3 - 1));
  }

  return v3;
}

- (int)payloadCarDefrosterAtIndex:(unint64_t)a3
{
  return self->_payloadCarDefrosters.list[a3];
}

- (unint64_t)payloadCarDefrostersCount
{
  return self->_payloadCarDefrosters.count;
}

- (void)addPayloadCarDefroster:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadCarDefrosters
{
}

- (int)payloadCarDefrosters
{
  return self->_payloadCarDefrosters.list;
}

- (void)setPayloadCarDefrosters:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadCarAudioSources:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CARPLAY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IPOD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RADIO"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BLUETOOTH"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"AUX"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"USB"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MEMORY_CARD"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"OPTICAL_DRIVE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"HARD_DRIVE"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)payloadCarAudioSourcesAsString:(int)a3
{
  if ((a3 - 1) >= 9)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551CA60 + (a3 - 1));
  }

  return v3;
}

- (int)payloadCarAudioSourceAtIndex:(unint64_t)a3
{
  return self->_payloadCarAudioSources.list[a3];
}

- (unint64_t)payloadCarAudioSourcesCount
{
  return self->_payloadCarAudioSources.count;
}

- (void)addPayloadCarAudioSource:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadCarAudioSources
{
}

- (int)payloadCarAudioSources
{
  return self->_payloadCarAudioSources.list;
}

- (void)setPayloadCarAudioSources:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadCarAirCirculationModes:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"FRESH_AIR"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"RECIRCULATE_AIR"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)payloadCarAirCirculationModesAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"FRESH_AIR";
  }
  else if (a3 == 2)
  {
    int v4 = @"RECIRCULATE_AIR";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)payloadCarAirCirculationModeAtIndex:(unint64_t)a3
{
  return self->_payloadCarAirCirculationModes.list[a3];
}

- (unint64_t)payloadCarAirCirculationModesCount
{
  return self->_payloadCarAirCirculationModes.count;
}

- (void)addPayloadCarAirCirculationMode:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadCarAirCirculationModes
{
}

- (int)payloadCarAirCirculationModes
{
  return self->_payloadCarAirCirculationModes.list;
}

- (void)setPayloadCarAirCirculationModes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadCallRecordValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadCallRecordValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadCallRecordValuesCount
{
  return [(NSArray *)self->_payloadCallRecordValues count];
}

- (void)addPayloadCallRecordValue:(id)a3
{
  id v4 = a3;
  payloadCallRecordValues = self->_payloadCallRecordValues;
  id v8 = v4;
  if (!payloadCallRecordValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadCallRecordValues;
    self->_payloadCallRecordValues = v6;

    id v4 = v8;
    payloadCallRecordValues = self->_payloadCallRecordValues;
  }
  [(NSArray *)payloadCallRecordValues addObject:v4];
}

- (void)clearPayloadCallRecordValues
{
}

- (void)setPayloadCallRecordValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadCallRecordValues = self->_payloadCallRecordValues;
  self->_payloadCallRecordValues = v4;

  MEMORY[0x1F41817F8](v4, payloadCallRecordValues);
}

- (int)StringAsPayloadCallRecordTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"OUTGOING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MISSED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RECEIVED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LATEST"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"VOICEMAIL"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RINGING"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"IN_PROGRESS"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ON_HOLD"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 2;
  }

  return v4;
}

- (id)payloadCallRecordTypesAsString:(int)a3
{
  unsigned int v3 = a3 - 2;
  if (a3 - 2) < 9 && ((0x1EFu >> v3))
  {
    int v4 = *(&off_1E551CA18 + v3);
  }
  else
  {
    int v4 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }

  return v4;
}

- (int)payloadCallRecordTypeAtIndex:(unint64_t)a3
{
  return self->_payloadCallRecordTypes.list[a3];
}

- (unint64_t)payloadCallRecordTypesCount
{
  return self->_payloadCallRecordTypes.count;
}

- (void)addPayloadCallRecordType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadCallRecordTypes
{
}

- (int)payloadCallRecordTypes
{
  return self->_payloadCallRecordTypes.list;
}

- (void)setPayloadCallRecordTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadCallRecordFilterAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadCallRecordFilters objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadCallRecordFiltersCount
{
  return [(NSArray *)self->_payloadCallRecordFilters count];
}

- (void)addPayloadCallRecordFilter:(id)a3
{
  id v4 = a3;
  payloadCallRecordFilters = self->_payloadCallRecordFilters;
  id v8 = v4;
  if (!payloadCallRecordFilters)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadCallRecordFilters;
    self->_payloadCallRecordFilters = v6;

    id v4 = v8;
    payloadCallRecordFilters = self->_payloadCallRecordFilters;
  }
  [(NSArray *)payloadCallRecordFilters addObject:v4];
}

- (void)clearPayloadCallRecordFilters
{
}

- (void)setPayloadCallRecordFilters:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadCallRecordFilters = self->_payloadCallRecordFilters;
  self->_payloadCallRecordFilters = v4;

  MEMORY[0x1F41817F8](v4, payloadCallRecordFilters);
}

- (id)payloadCallGroupConversationAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadCallGroupConversations objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadCallGroupConversationsCount
{
  return [(NSArray *)self->_payloadCallGroupConversations count];
}

- (void)addPayloadCallGroupConversation:(id)a3
{
  id v4 = a3;
  payloadCallGroupConversations = self->_payloadCallGroupConversations;
  id v8 = v4;
  if (!payloadCallGroupConversations)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadCallGroupConversations;
    self->_payloadCallGroupConversations = v6;

    id v4 = v8;
    payloadCallGroupConversations = self->_payloadCallGroupConversations;
  }
  [(NSArray *)payloadCallGroupConversations addObject:v4];
}

- (void)clearPayloadCallGroupConversations
{
}

- (void)setPayloadCallGroupConversations:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadCallGroupConversations = self->_payloadCallGroupConversations;
  self->_payloadCallGroupConversations = v4;

  MEMORY[0x1F41817F8](v4, payloadCallGroupConversations);
}

- (id)payloadCallGroupAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadCallGroups objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadCallGroupsCount
{
  return [(NSArray *)self->_payloadCallGroups count];
}

- (void)addPayloadCallGroup:(id)a3
{
  id v4 = a3;
  payloadCallGroups = self->_payloadCallGroups;
  id v8 = v4;
  if (!payloadCallGroups)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadCallGroups;
    self->_payloadCallGroups = v6;

    id v4 = v8;
    payloadCallGroups = self->_payloadCallGroups;
  }
  [(NSArray *)payloadCallGroups addObject:v4];
}

- (void)clearPayloadCallGroups
{
}

- (void)setPayloadCallGroups:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadCallGroups = self->_payloadCallGroups;
  self->_payloadCallGroups = v4;

  MEMORY[0x1F41817F8](v4, payloadCallGroups);
}

- (int)StringAsPayloadCallDestinationTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NORMAL_DESTINATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EMERGENCY_DESTINATION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VOICEMAIL_DESTINATION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"REDIAL_DESTINATION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CALL_BACK_DESTINATION"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)payloadCallDestinationTypesAsString:(int)a3
{
  if ((a3 - 1) >= 5)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551C9F0 + (a3 - 1));
  }

  return v3;
}

- (int)payloadCallDestinationTypeAtIndex:(unint64_t)a3
{
  return self->_payloadCallDestinationTypes.list[a3];
}

- (unint64_t)payloadCallDestinationTypesCount
{
  return self->_payloadCallDestinationTypes.count;
}

- (void)addPayloadCallDestinationType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadCallDestinationTypes
{
}

- (int)payloadCallDestinationTypes
{
  return self->_payloadCallDestinationTypes.list;
}

- (void)setPayloadCallDestinationTypes:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadCallCapabilities:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"AUDIO_CALL"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"VIDEO_CALL"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)payloadCallCapabilitiesAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"AUDIO_CALL";
  }
  else if (a3 == 2)
  {
    int v4 = @"VIDEO_CALL";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)payloadCallCapabilityAtIndex:(unint64_t)a3
{
  return self->_payloadCallCapabilities.list[a3];
}

- (unint64_t)payloadCallCapabilitiesCount
{
  return self->_payloadCallCapabilities.count;
}

- (void)addPayloadCallCapability:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadCallCapabilities
{
}

- (int)payloadCallCapabilities
{
  return self->_payloadCallCapabilities.list;
}

- (void)setPayloadCallCapabilities:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadCallAudioRoutes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SPEAKERPHONE_AUDIO_ROUTE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BLUETOOTH_AUDIO_ROUTE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HEY_SIRI_AUDIO_ROUTE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 2;
  }

  return v4;
}

- (id)payloadCallAudioRoutesAsString:(int)a3
{
  if ((a3 - 2) >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551C9D8 + (a3 - 2));
  }

  return v3;
}

- (int)payloadCallAudioRouteAtIndex:(unint64_t)a3
{
  return self->_payloadCallAudioRoutes.list[a3];
}

- (unint64_t)payloadCallAudioRoutesCount
{
  return self->_payloadCallAudioRoutes.count;
}

- (void)addPayloadCallAudioRoute:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadCallAudioRoutes
{
}

- (int)payloadCallAudioRoutes
{
  return self->_payloadCallAudioRoutes.list;
}

- (void)setPayloadCallAudioRoutes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadCalendarEventAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadCalendarEvents objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadCalendarEventsCount
{
  return [(NSArray *)self->_payloadCalendarEvents count];
}

- (void)addPayloadCalendarEvent:(id)a3
{
  id v4 = a3;
  payloadCalendarEvents = self->_payloadCalendarEvents;
  id v8 = v4;
  if (!payloadCalendarEvents)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadCalendarEvents;
    self->_payloadCalendarEvents = v6;

    id v4 = v8;
    payloadCalendarEvents = self->_payloadCalendarEvents;
  }
  [(NSArray *)payloadCalendarEvents addObject:v4];
}

- (void)clearPayloadCalendarEvents
{
}

- (void)setPayloadCalendarEvents:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadCalendarEvents = self->_payloadCalendarEvents;
  self->_payloadCalendarEvents = v4;

  MEMORY[0x1F41817F8](v4, payloadCalendarEvents);
}

- (int)StringAsPayloadBoundedSettingValues:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MIN"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MEDIAN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MAX"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)payloadBoundedSettingValuesAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551C9C0 + (a3 - 1));
  }

  return v3;
}

- (int)payloadBoundedSettingValueAtIndex:(unint64_t)a3
{
  return self->_payloadBoundedSettingValues.list[a3];
}

- (unint64_t)payloadBoundedSettingValuesCount
{
  return self->_payloadBoundedSettingValues.count;
}

- (void)addPayloadBoundedSettingValue:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadBoundedSettingValues
{
}

- (int)payloadBoundedSettingValues
{
  return self->_payloadBoundedSettingValues.list;
}

- (void)setPayloadBoundedSettingValues:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadBinarySettingValues:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ON"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"OFF"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TOGGLE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)payloadBinarySettingValuesAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551C9A8 + (a3 - 1));
  }

  return v3;
}

- (int)payloadBinarySettingValueAtIndex:(unint64_t)a3
{
  return self->_payloadBinarySettingValues.list[a3];
}

- (unint64_t)payloadBinarySettingValuesCount
{
  return self->_payloadBinarySettingValues.count;
}

- (void)addPayloadBinarySettingValue:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadBinarySettingValues
{
}

- (int)payloadBinarySettingValues
{
  return self->_payloadBinarySettingValues.list;
}

- (void)setPayloadBinarySettingValues:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadBillTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTO_INSURANCE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CABLE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CAR_LEASE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CAR_LOAN"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CREDIT_CARD"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ELECTRICITY"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"GAS"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"GARBAGE_AND_RECYCLING"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"HEALTH_INSURANCE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"HOME_INSURANCE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"INTERNET"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"LIFE_INSURANCE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"MORTGAGE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"MUSIC_STREAMING"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"PHONE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"RENT"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"SEWER"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"STUDENT_LOAN"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_TICKET"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"TUITION"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"UTILITIES"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"WATER"])
  {
    int v4 = 22;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)payloadBillTypesAsString:(int)a3
{
  if ((a3 - 1) >= 0x16)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551C8F8 + (a3 - 1));
  }

  return v3;
}

- (int)payloadBillTypeAtIndex:(unint64_t)a3
{
  return self->_payloadBillTypes.list[a3];
}

- (unint64_t)payloadBillTypesCount
{
  return self->_payloadBillTypes.count;
}

- (void)addPayloadBillType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadBillTypes
{
}

- (int)payloadBillTypes
{
  return self->_payloadBillTypes.list;
}

- (void)setPayloadBillTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadBillPayeeValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadBillPayeeValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadBillPayeeValuesCount
{
  return [(NSArray *)self->_payloadBillPayeeValues count];
}

- (void)addPayloadBillPayeeValue:(id)a3
{
  id v4 = a3;
  payloadBillPayeeValues = self->_payloadBillPayeeValues;
  id v8 = v4;
  if (!payloadBillPayeeValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadBillPayeeValues;
    self->_payloadBillPayeeValues = v6;

    id v4 = v8;
    payloadBillPayeeValues = self->_payloadBillPayeeValues;
  }
  [(NSArray *)payloadBillPayeeValues addObject:v4];
}

- (void)clearPayloadBillPayeeValues
{
}

- (void)setPayloadBillPayeeValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadBillPayeeValues = self->_payloadBillPayeeValues;
  self->_payloadBillPayeeValues = v4;

  MEMORY[0x1F41817F8](v4, payloadBillPayeeValues);
}

- (id)payloadBillDetailsValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadBillDetailsValues objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadBillDetailsValuesCount
{
  return [(NSArray *)self->_payloadBillDetailsValues count];
}

- (void)addPayloadBillDetailsValue:(id)a3
{
  id v4 = a3;
  payloadBillDetailsValues = self->_payloadBillDetailsValues;
  id v8 = v4;
  if (!payloadBillDetailsValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadBillDetailsValues;
    self->_payloadBillDetailsValues = v6;

    id v4 = v8;
    payloadBillDetailsValues = self->_payloadBillDetailsValues;
  }
  [(NSArray *)payloadBillDetailsValues addObject:v4];
}

- (void)clearPayloadBillDetailsValues
{
}

- (void)setPayloadBillDetailsValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadBillDetailsValues = self->_payloadBillDetailsValues;
  self->_payloadBillDetailsValues = v4;

  MEMORY[0x1F41817F8](v4, payloadBillDetailsValues);
}

- (int)StringAsPayloadBalanceTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MONEY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"POINTS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MILES"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)payloadBalanceTypesAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551C8E0 + (a3 - 1));
  }

  return v3;
}

- (int)payloadBalanceTypeAtIndex:(unint64_t)a3
{
  return self->_payloadBalanceTypes.list[a3];
}

- (unint64_t)payloadBalanceTypesCount
{
  return self->_payloadBalanceTypes.count;
}

- (void)addPayloadBalanceType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadBalanceTypes
{
}

- (int)payloadBalanceTypes
{
  return self->_payloadBalanceTypes.list;
}

- (void)setPayloadBalanceTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadArchivedObjectAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadArchivedObjects objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadArchivedObjectsCount
{
  return [(NSArray *)self->_payloadArchivedObjects count];
}

- (void)addPayloadArchivedObject:(id)a3
{
  id v4 = a3;
  payloadArchivedObjects = self->_payloadArchivedObjects;
  id v8 = v4;
  if (!payloadArchivedObjects)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadArchivedObjects;
    self->_payloadArchivedObjects = v6;

    id v4 = v8;
    payloadArchivedObjects = self->_payloadArchivedObjects;
  }
  [(NSArray *)payloadArchivedObjects addObject:v4];
}

- (void)clearPayloadArchivedObjects
{
}

- (void)setPayloadArchivedObjects:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadArchivedObjects = self->_payloadArchivedObjects;
  self->_payloadArchivedObjects = v4;

  MEMORY[0x1F41817F8](v4, payloadArchivedObjects);
}

- (id)payloadAppIdentifierAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadAppIdentifiers objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadAppIdentifiersCount
{
  return [(NSArray *)self->_payloadAppIdentifiers count];
}

- (void)addPayloadAppIdentifier:(id)a3
{
  id v4 = a3;
  payloadAppIdentifiers = self->_payloadAppIdentifiers;
  id v8 = v4;
  if (!payloadAppIdentifiers)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadAppIdentifiers;
    self->_payloadAppIdentifiers = v6;

    id v4 = v8;
    payloadAppIdentifiers = self->_payloadAppIdentifiers;
  }
  [(NSArray *)payloadAppIdentifiers addObject:v4];
}

- (void)clearPayloadAppIdentifiers
{
}

- (void)setPayloadAppIdentifiers:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadAppIdentifiers = self->_payloadAppIdentifiers;
  self->_payloadAppIdentifiers = v4;

  MEMORY[0x1F41817F8](v4, payloadAppIdentifiers);
}

- (id)payloadAnnouncementAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadAnnouncements objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadAnnouncementsCount
{
  return [(NSArray *)self->_payloadAnnouncements count];
}

- (void)addPayloadAnnouncement:(id)a3
{
  id v4 = a3;
  payloadAnnouncements = self->_payloadAnnouncements;
  id v8 = v4;
  if (!payloadAnnouncements)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadAnnouncements;
    self->_payloadAnnouncements = v6;

    id v4 = v8;
    payloadAnnouncements = self->_payloadAnnouncements;
  }
  [(NSArray *)payloadAnnouncements addObject:v4];
}

- (void)clearPayloadAnnouncements
{
}

- (void)setPayloadAnnouncements:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadAnnouncements = self->_payloadAnnouncements;
  self->_payloadAnnouncements = v4;

  MEMORY[0x1F41817F8](v4, payloadAnnouncements);
}

- (int)StringAsPayloadAlarmSearchTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FIND"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WHEN_IS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HOW_LONG_UNTIL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"READ"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HOW_MANY"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadAlarmSearchTypesAsString:(int)a3
{
  if (a3 >= 5)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551C8B8 + a3);
  }

  return v3;
}

- (int)payloadAlarmSearchTypeAtIndex:(unint64_t)a3
{
  return self->_payloadAlarmSearchTypes.list[a3];
}

- (unint64_t)payloadAlarmSearchTypesCount
{
  return self->_payloadAlarmSearchTypes.count;
}

- (void)addPayloadAlarmSearchType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadAlarmSearchTypes
{
}

- (int)payloadAlarmSearchTypes
{
  return self->_payloadAlarmSearchTypes.list;
}

- (void)setPayloadAlarmSearchTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadAlarmSearchAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadAlarmSearchs objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadAlarmSearchsCount
{
  return [(NSArray *)self->_payloadAlarmSearchs count];
}

- (void)addPayloadAlarmSearch:(id)a3
{
  id v4 = a3;
  payloadAlarmSearchs = self->_payloadAlarmSearchs;
  id v8 = v4;
  if (!payloadAlarmSearchs)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadAlarmSearchs;
    self->_payloadAlarmSearchs = v6;

    id v4 = v8;
    payloadAlarmSearchs = self->_payloadAlarmSearchs;
  }
  [(NSArray *)payloadAlarmSearchs addObject:v4];
}

- (void)clearPayloadAlarmSearchs
{
}

- (void)setPayloadAlarmSearchs:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadAlarmSearchs = self->_payloadAlarmSearchs;
  self->_payloadAlarmSearchs = v4;

  MEMORY[0x1F41817F8](v4, payloadAlarmSearchs);
}

- (int)StringAsPayloadAlarmRepeatSchedules:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MONDAY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TUESDAY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WEDNESDAY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"THURSDAY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FRIDAY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SATURDAY"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SUNDAY"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadAlarmRepeatSchedulesAsString:(int)a3
{
  if (a3 >= 8)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551C878 + a3);
  }

  return v3;
}

- (int)payloadAlarmRepeatScheduleAtIndex:(unint64_t)a3
{
  return self->_payloadAlarmRepeatSchedules.list[a3];
}

- (unint64_t)payloadAlarmRepeatSchedulesCount
{
  return self->_payloadAlarmRepeatSchedules.count;
}

- (void)addPayloadAlarmRepeatSchedule:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadAlarmRepeatSchedules
{
}

- (int)payloadAlarmRepeatSchedules
{
  return self->_payloadAlarmRepeatSchedules.list;
}

- (void)setPayloadAlarmRepeatSchedules:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsPayloadAlarmPeriods:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PERIOD"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MORNING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AFTERNOON"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EVENING"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NIGHT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"NOON"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MIDNIGHT"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"TODAY"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"TOMORROW"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)payloadAlarmPeriodsAsString:(int)a3
{
  if (a3 >= 9)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551C830 + a3);
  }

  return v3;
}

- (int)payloadAlarmPeriodAtIndex:(unint64_t)a3
{
  return self->_payloadAlarmPeriods.list[a3];
}

- (unint64_t)payloadAlarmPeriodsCount
{
  return self->_payloadAlarmPeriods.count;
}

- (void)addPayloadAlarmPeriod:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadAlarmPeriods
{
}

- (int)payloadAlarmPeriods
{
  return self->_payloadAlarmPeriods.list;
}

- (void)setPayloadAlarmPeriods:(int *)a3 count:(unint64_t)a4
{
}

- (id)payloadAlarmAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadAlarms objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadAlarmsCount
{
  return [(NSArray *)self->_payloadAlarms count];
}

- (void)addPayloadAlarm:(id)a3
{
  id v4 = a3;
  payloadAlarms = self->_payloadAlarms;
  id v8 = v4;
  if (!payloadAlarms)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadAlarms;
    self->_payloadAlarms = v6;

    id v4 = v8;
    payloadAlarms = self->_payloadAlarms;
  }
  [(NSArray *)payloadAlarms addObject:v4];
}

- (void)clearPayloadAlarms
{
}

- (void)setPayloadAlarms:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadAlarms = self->_payloadAlarms;
  self->_payloadAlarms = v4;

  MEMORY[0x1F41817F8](v4, payloadAlarms);
}

- (id)payloadActivityListAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadActivityLists objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadActivityListsCount
{
  return [(NSArray *)self->_payloadActivityLists count];
}

- (void)addPayloadActivityList:(id)a3
{
  id v4 = a3;
  payloadActivityLists = self->_payloadActivityLists;
  id v8 = v4;
  if (!payloadActivityLists)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadActivityLists;
    self->_payloadActivityLists = v6;

    id v4 = v8;
    payloadActivityLists = self->_payloadActivityLists;
  }
  [(NSArray *)payloadActivityLists addObject:v4];
}

- (void)clearPayloadActivityLists
{
}

- (void)setPayloadActivityLists:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadActivityLists = self->_payloadActivityLists;
  self->_payloadActivityLists = v4;

  MEMORY[0x1F41817F8](v4, payloadActivityLists);
}

- (id)payloadActivityAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_payloadActivities objectAtIndexedSubscript:a3];
}

- (unint64_t)payloadActivitiesCount
{
  return [(NSArray *)self->_payloadActivities count];
}

- (void)addPayloadActivity:(id)a3
{
  id v4 = a3;
  payloadActivities = self->_payloadActivities;
  id v8 = v4;
  if (!payloadActivities)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_payloadActivities;
    self->_payloadActivities = v6;

    id v4 = v8;
    payloadActivities = self->_payloadActivities;
  }
  [(NSArray *)payloadActivities addObject:v4];
}

- (void)clearPayloadActivities
{
}

- (void)setPayloadActivities:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  payloadActivities = self->_payloadActivities;
  self->_payloadActivities = v4;

  MEMORY[0x1F41817F8](v4, payloadActivities);
}

- (int)StringAsPayloadAccountTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CHECKING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CREDIT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DEBIT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"INVESTMENT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MORTGAGE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PREPAID"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SAVING"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)payloadAccountTypesAsString:(int)a3
{
  if ((a3 - 1) >= 7)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551C7F8 + (a3 - 1));
  }

  return v3;
}

- (int)payloadAccountTypeAtIndex:(unint64_t)a3
{
  return self->_payloadAccountTypes.list[a3];
}

- (unint64_t)payloadAccountTypesCount
{
  return self->_payloadAccountTypes.count;
}

- (void)addPayloadAccountType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearPayloadAccountTypes
{
}

- (int)payloadAccountTypes
{
  return self->_payloadAccountTypes.list;
}

- (void)setPayloadAccountTypes:(int *)a3 count:(unint64_t)a4
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)payloadWorkoutCustomizationType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadWorkoutAssociatedItemType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadWellnessValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadWellnessUnitTypeType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadWellnessObjectResultValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadWellnessMetadataPairType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadVolumeValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadVoiceCommandDeviceInformationType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadURLValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadTimerType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadTemporalEventTriggerType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadTemperatureValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadTemperatureListType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadTaskListType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadTaskType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadSupportedTrafficIncidentTypeType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadStringValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadStringListType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadStartCallRequestMetadataType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadSpeedValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadSpatialEventTriggerType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadSleepAlarmAttributeType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadShareDestinationType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadSettingMetadataType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadSendMessageAttachmentType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadPrivateUpdateMediaAffinityIntentDataType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadPrivateSearchForMediaIntentDataType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadPrivatePlayMediaIntentDataType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadPrivateAddMediaIntentDataType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadPlaceListType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadPlaceType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadPaymentMethodValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadPaymentMethodListType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadPaymentAmountValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadNumericSettingValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadNoteContentType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadNoteType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadModifyRelationshipType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadModifyNicknameType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadMediaSearchType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadMediaItemValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadMediaItemGroupType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadMediaDestinationType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadMassValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadLongValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadLongListType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadLocationListType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadLocationType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadIntentExecutionResultType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadIntentType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadIntegerValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadIntegerListType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadHomeUserTaskType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadHomeFilterType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadHomeEntityType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadHomeAttributeValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadHomeAttributeType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadGetSettingResponseDataType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadGeographicalFeatureListType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadGeographicalFeatureType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadFinancialAccountValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadFilePropertyValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadFilePropertyType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadFileType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadEventParticipantType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadEventListType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadEventType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadEnergyValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadDoubleValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadDoubleListType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadDistanceValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadDistanceListType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadDialingContactType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadDeviceDetailType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadDeviceType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadDateTimeValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadDateTimeRangeValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadDateTimeRangeListType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadDataStringListType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadDataStringType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadCustomObjectType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadCurrencyAmountType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadContactValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadContactListType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadContactEventTriggerType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadCallRecordValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadCallRecordFilterType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadCallGroupConversationType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadCallGroupType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadCalendarEventType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadBillPayeeValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadBillDetailsValueType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadArchivedObjectType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadAppIdentifierType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadAnnouncementType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadAlarmSearchType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadAlarmType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadActivityListType
{
  return (Class)objc_opt_class();
}

+ (Class)payloadActivityType
{
  return (Class)objc_opt_class();
}

@end