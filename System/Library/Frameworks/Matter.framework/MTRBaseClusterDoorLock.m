@interface MTRBaseClusterDoorLock
+ (void)readAttributeAcceptedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAcceptedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeActuatorEnabledWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeActuatorEnabledWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAliroBLEAdvertisingVersionWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeAliroExpeditedTransactionSupportedProtocolVersionsWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeAliroGroupResolvingKeyWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeAliroReaderGroupIdentifierWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeAliroReaderGroupSubIdentifierWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeAliroReaderVerificationKeyWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeAliroSupportedBLEUWBProtocolVersionsWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeAppleAliroBLEAdvertisingVersionWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeAppleAliroExpeditedTransactionSupportedProtocolVersionsWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeAppleAliroGroupResolvingKeyWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeAppleAliroReaderGroupIdentifierWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeAppleAliroReaderGroupSubIdentifierWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeAppleAliroReaderVerificationKeyWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeAppleAliroSupportedBLEUWBProtocolVersionsWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeAppleNumberOfAliroCredentialIssuerKeysSupportedWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeAppleNumberOfAliroEndpointKeysSupportedWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeAttributeListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAttributeListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAutoRelockTimeWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAutoRelockTimeWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeClusterRevisionWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeClusterRevisionWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeCredentialRulesSupportWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeCredentialRulesSupportWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeDefaultConfigurationRegisterWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeDefaultConfigurationRegisterWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeDoorClosedEventsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeDoorClosedEventsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeDoorOpenEventsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeDoorOpenEventsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeDoorStateWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeDoorStateWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeEnableInsideStatusLEDWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeEnableInsideStatusLEDWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeEnableLocalProgrammingWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeEnableLocalProgrammingWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeEnableOneTouchLockingWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeEnableOneTouchLockingWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeEnablePrivacyModeButtonWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeEnablePrivacyModeButtonWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeEventListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeExpiringUserTimeoutWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeExpiringUserTimeoutWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeFeatureMapWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeFeatureMapWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeGeneratedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeGeneratedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeLEDSettingsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeLEDSettingsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeLanguageWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeLanguageWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeLocalProgrammingFeaturesWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeLocalProgrammingFeaturesWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeLockStateWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeLockStateWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeLockTypeWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeLockTypeWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeMaxPINCodeLengthWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeMaxPINCodeLengthWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeMaxRFIDCodeLengthWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeMaxRFIDCodeLengthWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeMinPINCodeLengthWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeMinPINCodeLengthWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeMinRFIDCodeLengthWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeMinRFIDCodeLengthWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNumberOfAliroCredentialIssuerKeysSupportedWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeNumberOfAliroEndpointKeysSupportedWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeNumberOfCredentialsSupportedPerUserWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeNumberOfCredentialsSupportedPerUserWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNumberOfHolidaySchedulesSupportedWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeNumberOfHolidaySchedulesSupportedWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNumberOfPINUsersSupportedWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeNumberOfPINUsersSupportedWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNumberOfRFIDUsersSupportedWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeNumberOfRFIDUsersSupportedWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNumberOfTotalUsersSupportedWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeNumberOfTotalUsersSupportedWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNumberOfWeekDaySchedulesSupportedPerUserWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeNumberOfWeekDaySchedulesSupportedPerUserWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNumberOfYearDaySchedulesSupportedPerUserWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeNumberOfYearDaySchedulesSupportedPerUserWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeOpenPeriodWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeOpenPeriodWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeOperatingModeWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeOperatingModeWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRequirePINforRemoteOperationWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRequirePINforRemoteOperationWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeSendPINOverTheAirWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeSendPINOverTheAirWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeSoundVolumeWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeSoundVolumeWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeSupportedOperatingModesWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeSupportedOperatingModesWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeUserCodeTemporaryDisableTimeWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeUserCodeTemporaryDisableTimeWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeWrongCodeEntryLimitWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeWrongCodeEntryLimitWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
- (MTRBaseClusterDoorLock)initWithDevice:(MTRBaseDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue;
- (void)appleClearAliroCredentialWithParams:(id)a3 completion:(id)a4;
- (void)appleClearAliroReaderConfigWithCompletion:(id)a3;
- (void)appleClearAliroReaderConfigWithParams:(id)a3 completion:(id)a4;
- (void)appleGetAliroCredentialStatusWithParams:(id)a3 completion:(id)a4;
- (void)appleSetAliroCredentialWithParams:(id)a3 completion:(id)a4;
- (void)appleSetAliroReaderConfigWithParams:(id)a3 completion:(id)a4;
- (void)clearAliroReaderConfigWithCompletion:(id)a3;
- (void)clearAliroReaderConfigWithParams:(id)a3 completion:(id)a4;
- (void)clearCredentialWithParams:(MTRDoorLockClusterClearCredentialParams *)params completion:(MTRStatusCompletion)completion;
- (void)clearCredentialWithParams:(MTRDoorLockClusterClearCredentialParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)clearHolidayScheduleWithParams:(MTRDoorLockClusterClearHolidayScheduleParams *)params completion:(MTRStatusCompletion)completion;
- (void)clearHolidayScheduleWithParams:(MTRDoorLockClusterClearHolidayScheduleParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)clearUserWithParams:(MTRDoorLockClusterClearUserParams *)params completion:(MTRStatusCompletion)completion;
- (void)clearUserWithParams:(MTRDoorLockClusterClearUserParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)clearWeekDayScheduleWithParams:(MTRDoorLockClusterClearWeekDayScheduleParams *)params completion:(MTRStatusCompletion)completion;
- (void)clearWeekDayScheduleWithParams:(MTRDoorLockClusterClearWeekDayScheduleParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)clearYearDayScheduleWithParams:(MTRDoorLockClusterClearYearDayScheduleParams *)params completion:(MTRStatusCompletion)completion;
- (void)clearYearDayScheduleWithParams:(MTRDoorLockClusterClearYearDayScheduleParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)getCredentialStatusWithParams:(MTRDoorLockClusterGetCredentialStatusParams *)params completion:(void *)completion;
- (void)getCredentialStatusWithParams:(MTRDoorLockClusterGetCredentialStatusParams *)params completionHandler:(void *)completionHandler;
- (void)getHolidayScheduleWithParams:(MTRDoorLockClusterGetHolidayScheduleParams *)params completion:(void *)completion;
- (void)getHolidayScheduleWithParams:(MTRDoorLockClusterGetHolidayScheduleParams *)params completionHandler:(void *)completionHandler;
- (void)getUserWithParams:(MTRDoorLockClusterGetUserParams *)params completion:(void *)completion;
- (void)getUserWithParams:(MTRDoorLockClusterGetUserParams *)params completionHandler:(void *)completionHandler;
- (void)getWeekDayScheduleWithParams:(MTRDoorLockClusterGetWeekDayScheduleParams *)params completion:(void *)completion;
- (void)getWeekDayScheduleWithParams:(MTRDoorLockClusterGetWeekDayScheduleParams *)params completionHandler:(void *)completionHandler;
- (void)getYearDayScheduleWithParams:(MTRDoorLockClusterGetYearDayScheduleParams *)params completion:(void *)completion;
- (void)getYearDayScheduleWithParams:(MTRDoorLockClusterGetYearDayScheduleParams *)params completionHandler:(void *)completionHandler;
- (void)lockDoorWithCompletion:(id)a3;
- (void)lockDoorWithParams:(MTRDoorLockClusterLockDoorParams *)params completion:(MTRStatusCompletion)completion;
- (void)lockDoorWithParams:(MTRDoorLockClusterLockDoorParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)readAttributeAcceptedCommandListWithCompletion:(void *)completion;
- (void)readAttributeAcceptedCommandListWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeActuatorEnabledWithCompletion:(void *)completion;
- (void)readAttributeActuatorEnabledWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAliroBLEAdvertisingVersionWithCompletion:(id)a3;
- (void)readAttributeAliroExpeditedTransactionSupportedProtocolVersionsWithCompletion:(id)a3;
- (void)readAttributeAliroGroupResolvingKeyWithCompletion:(id)a3;
- (void)readAttributeAliroReaderGroupIdentifierWithCompletion:(id)a3;
- (void)readAttributeAliroReaderGroupSubIdentifierWithCompletion:(id)a3;
- (void)readAttributeAliroReaderVerificationKeyWithCompletion:(id)a3;
- (void)readAttributeAliroSupportedBLEUWBProtocolVersionsWithCompletion:(id)a3;
- (void)readAttributeAppleAliroBLEAdvertisingVersionWithCompletion:(id)a3;
- (void)readAttributeAppleAliroExpeditedTransactionSupportedProtocolVersionsWithCompletion:(id)a3;
- (void)readAttributeAppleAliroGroupResolvingKeyWithCompletion:(id)a3;
- (void)readAttributeAppleAliroReaderGroupIdentifierWithCompletion:(id)a3;
- (void)readAttributeAppleAliroReaderGroupSubIdentifierWithCompletion:(id)a3;
- (void)readAttributeAppleAliroReaderVerificationKeyWithCompletion:(id)a3;
- (void)readAttributeAppleAliroSupportedBLEUWBProtocolVersionsWithCompletion:(id)a3;
- (void)readAttributeAppleNumberOfAliroCredentialIssuerKeysSupportedWithCompletion:(id)a3;
- (void)readAttributeAppleNumberOfAliroEndpointKeysSupportedWithCompletion:(id)a3;
- (void)readAttributeAttributeListWithCompletion:(void *)completion;
- (void)readAttributeAttributeListWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAutoRelockTimeWithCompletion:(void *)completion;
- (void)readAttributeAutoRelockTimeWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeClusterRevisionWithCompletion:(void *)completion;
- (void)readAttributeClusterRevisionWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeCredentialRulesSupportWithCompletion:(void *)completion;
- (void)readAttributeCredentialRulesSupportWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeDefaultConfigurationRegisterWithCompletion:(void *)completion;
- (void)readAttributeDefaultConfigurationRegisterWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeDoorClosedEventsWithCompletion:(void *)completion;
- (void)readAttributeDoorClosedEventsWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeDoorOpenEventsWithCompletion:(void *)completion;
- (void)readAttributeDoorOpenEventsWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeDoorStateWithCompletion:(void *)completion;
- (void)readAttributeDoorStateWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeEnableInsideStatusLEDWithCompletion:(void *)completion;
- (void)readAttributeEnableInsideStatusLEDWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeEnableLocalProgrammingWithCompletion:(void *)completion;
- (void)readAttributeEnableLocalProgrammingWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeEnableOneTouchLockingWithCompletion:(void *)completion;
- (void)readAttributeEnableOneTouchLockingWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeEnablePrivacyModeButtonWithCompletion:(void *)completion;
- (void)readAttributeEnablePrivacyModeButtonWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeEventListWithCompletion:(id)a3;
- (void)readAttributeExpiringUserTimeoutWithCompletion:(void *)completion;
- (void)readAttributeExpiringUserTimeoutWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeFeatureMapWithCompletion:(void *)completion;
- (void)readAttributeFeatureMapWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeGeneratedCommandListWithCompletion:(void *)completion;
- (void)readAttributeGeneratedCommandListWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeLEDSettingsWithCompletion:(void *)completion;
- (void)readAttributeLEDSettingsWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeLanguageWithCompletion:(void *)completion;
- (void)readAttributeLanguageWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeLocalProgrammingFeaturesWithCompletion:(void *)completion;
- (void)readAttributeLocalProgrammingFeaturesWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeLockStateWithCompletion:(void *)completion;
- (void)readAttributeLockStateWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeLockTypeWithCompletion:(void *)completion;
- (void)readAttributeLockTypeWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeMaxPINCodeLengthWithCompletion:(void *)completion;
- (void)readAttributeMaxPINCodeLengthWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeMaxRFIDCodeLengthWithCompletion:(void *)completion;
- (void)readAttributeMaxRFIDCodeLengthWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeMinPINCodeLengthWithCompletion:(void *)completion;
- (void)readAttributeMinPINCodeLengthWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeMinRFIDCodeLengthWithCompletion:(void *)completion;
- (void)readAttributeMinRFIDCodeLengthWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeNumberOfAliroCredentialIssuerKeysSupportedWithCompletion:(id)a3;
- (void)readAttributeNumberOfAliroEndpointKeysSupportedWithCompletion:(id)a3;
- (void)readAttributeNumberOfCredentialsSupportedPerUserWithCompletion:(void *)completion;
- (void)readAttributeNumberOfCredentialsSupportedPerUserWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeNumberOfHolidaySchedulesSupportedWithCompletion:(void *)completion;
- (void)readAttributeNumberOfHolidaySchedulesSupportedWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeNumberOfPINUsersSupportedWithCompletion:(void *)completion;
- (void)readAttributeNumberOfPINUsersSupportedWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeNumberOfRFIDUsersSupportedWithCompletion:(void *)completion;
- (void)readAttributeNumberOfRFIDUsersSupportedWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeNumberOfTotalUsersSupportedWithCompletion:(void *)completion;
- (void)readAttributeNumberOfTotalUsersSupportedWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeNumberOfWeekDaySchedulesSupportedPerUserWithCompletion:(void *)completion;
- (void)readAttributeNumberOfWeekDaySchedulesSupportedPerUserWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeNumberOfYearDaySchedulesSupportedPerUserWithCompletion:(void *)completion;
- (void)readAttributeNumberOfYearDaySchedulesSupportedPerUserWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeOpenPeriodWithCompletion:(void *)completion;
- (void)readAttributeOpenPeriodWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeOperatingModeWithCompletion:(void *)completion;
- (void)readAttributeOperatingModeWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRequirePINforRemoteOperationWithCompletion:(void *)completion;
- (void)readAttributeRequirePINforRemoteOperationWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeSendPINOverTheAirWithCompletion:(void *)completion;
- (void)readAttributeSendPINOverTheAirWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeSoundVolumeWithCompletion:(void *)completion;
- (void)readAttributeSoundVolumeWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeSupportedOperatingModesWithCompletion:(void *)completion;
- (void)readAttributeSupportedOperatingModesWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeUserCodeTemporaryDisableTimeWithCompletion:(void *)completion;
- (void)readAttributeUserCodeTemporaryDisableTimeWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeWrongCodeEntryLimitWithCompletion:(void *)completion;
- (void)readAttributeWrongCodeEntryLimitWithCompletionHandler:(void *)completionHandler;
- (void)setAliroReaderConfigWithParams:(id)a3 completion:(id)a4;
- (void)setCredentialWithParams:(MTRDoorLockClusterSetCredentialParams *)params completion:(void *)completion;
- (void)setCredentialWithParams:(MTRDoorLockClusterSetCredentialParams *)params completionHandler:(void *)completionHandler;
- (void)setHolidayScheduleWithParams:(MTRDoorLockClusterSetHolidayScheduleParams *)params completion:(MTRStatusCompletion)completion;
- (void)setHolidayScheduleWithParams:(MTRDoorLockClusterSetHolidayScheduleParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)setUserWithParams:(MTRDoorLockClusterSetUserParams *)params completion:(MTRStatusCompletion)completion;
- (void)setUserWithParams:(MTRDoorLockClusterSetUserParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)setWeekDayScheduleWithParams:(MTRDoorLockClusterSetWeekDayScheduleParams *)params completion:(MTRStatusCompletion)completion;
- (void)setWeekDayScheduleWithParams:(MTRDoorLockClusterSetWeekDayScheduleParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)setYearDayScheduleWithParams:(MTRDoorLockClusterSetYearDayScheduleParams *)params completion:(MTRStatusCompletion)completion;
- (void)setYearDayScheduleWithParams:(MTRDoorLockClusterSetYearDayScheduleParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)subscribeAttributeAcceptedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcceptedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActuatorEnabledWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActuatorEnabledWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAliroBLEAdvertisingVersionWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeAliroExpeditedTransactionSupportedProtocolVersionsWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeAliroGroupResolvingKeyWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeAliroReaderGroupIdentifierWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeAliroReaderGroupSubIdentifierWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeAliroReaderVerificationKeyWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeAliroSupportedBLEUWBProtocolVersionsWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeAppleAliroBLEAdvertisingVersionWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeAppleAliroExpeditedTransactionSupportedProtocolVersionsWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeAppleAliroGroupResolvingKeyWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeAppleAliroReaderGroupIdentifierWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeAppleAliroReaderGroupSubIdentifierWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeAppleAliroReaderVerificationKeyWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeAppleAliroSupportedBLEUWBProtocolVersionsWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeAppleNumberOfAliroCredentialIssuerKeysSupportedWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeAppleNumberOfAliroEndpointKeysSupportedWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeAttributeListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAttributeListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAutoRelockTimeWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAutoRelockTimeWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeClusterRevisionWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeClusterRevisionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeCredentialRulesSupportWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeCredentialRulesSupportWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDefaultConfigurationRegisterWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDefaultConfigurationRegisterWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDoorClosedEventsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDoorClosedEventsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDoorOpenEventsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDoorOpenEventsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDoorStateWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDoorStateWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeEnableInsideStatusLEDWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeEnableInsideStatusLEDWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeEnableLocalProgrammingWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeEnableLocalProgrammingWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeEnableOneTouchLockingWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeEnableOneTouchLockingWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeEnablePrivacyModeButtonWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeEnablePrivacyModeButtonWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeEventListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeExpiringUserTimeoutWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeExpiringUserTimeoutWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeFeatureMapWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeFeatureMapWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeGeneratedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeGeneratedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeLEDSettingsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeLEDSettingsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeLanguageWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeLanguageWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeLocalProgrammingFeaturesWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeLocalProgrammingFeaturesWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeLockStateWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeLockStateWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeLockTypeWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeLockTypeWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMaxPINCodeLengthWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMaxPINCodeLengthWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMaxRFIDCodeLengthWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMaxRFIDCodeLengthWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMinPINCodeLengthWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMinPINCodeLengthWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMinRFIDCodeLengthWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMinRFIDCodeLengthWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNumberOfAliroCredentialIssuerKeysSupportedWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeNumberOfAliroEndpointKeysSupportedWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeNumberOfCredentialsSupportedPerUserWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNumberOfCredentialsSupportedPerUserWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNumberOfHolidaySchedulesSupportedWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNumberOfHolidaySchedulesSupportedWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNumberOfPINUsersSupportedWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNumberOfPINUsersSupportedWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNumberOfRFIDUsersSupportedWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNumberOfRFIDUsersSupportedWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNumberOfTotalUsersSupportedWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNumberOfTotalUsersSupportedWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNumberOfWeekDaySchedulesSupportedPerUserWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNumberOfWeekDaySchedulesSupportedPerUserWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNumberOfYearDaySchedulesSupportedPerUserWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNumberOfYearDaySchedulesSupportedPerUserWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeOpenPeriodWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeOpenPeriodWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeOperatingModeWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeOperatingModeWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRequirePINforRemoteOperationWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRequirePINforRemoteOperationWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeSendPINOverTheAirWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeSendPINOverTheAirWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeSoundVolumeWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeSoundVolumeWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeSupportedOperatingModesWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeSupportedOperatingModesWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeUserCodeTemporaryDisableTimeWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeUserCodeTemporaryDisableTimeWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeWrongCodeEntryLimitWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeWrongCodeEntryLimitWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)unboltDoorWithCompletion:(id)a3;
- (void)unboltDoorWithParams:(id)a3 completion:(id)a4;
- (void)unlockDoorWithCompletion:(id)a3;
- (void)unlockDoorWithParams:(MTRDoorLockClusterUnlockDoorParams *)params completion:(MTRStatusCompletion)completion;
- (void)unlockDoorWithParams:(MTRDoorLockClusterUnlockDoorParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)unlockWithTimeoutWithParams:(MTRDoorLockClusterUnlockWithTimeoutParams *)params completion:(MTRStatusCompletion)completion;
- (void)unlockWithTimeoutWithParams:(MTRDoorLockClusterUnlockWithTimeoutParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeAutoRelockTimeWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeAutoRelockTimeWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeAutoRelockTimeWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeAutoRelockTimeWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeDoorClosedEventsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeDoorClosedEventsWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeDoorClosedEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeDoorClosedEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeDoorOpenEventsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeDoorOpenEventsWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeDoorOpenEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeDoorOpenEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeEnableInsideStatusLEDWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeEnableInsideStatusLEDWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeEnableInsideStatusLEDWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeEnableInsideStatusLEDWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeEnableLocalProgrammingWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeEnableLocalProgrammingWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeEnableLocalProgrammingWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeEnableLocalProgrammingWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeEnableOneTouchLockingWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeEnableOneTouchLockingWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeEnableOneTouchLockingWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeEnableOneTouchLockingWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeEnablePrivacyModeButtonWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeEnablePrivacyModeButtonWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeEnablePrivacyModeButtonWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeEnablePrivacyModeButtonWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeExpiringUserTimeoutWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeExpiringUserTimeoutWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeExpiringUserTimeoutWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeExpiringUserTimeoutWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeLEDSettingsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeLEDSettingsWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeLEDSettingsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeLEDSettingsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeLanguageWithValue:(NSString *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeLanguageWithValue:(NSString *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeLanguageWithValue:(NSString *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeLanguageWithValue:(NSString *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeLocalProgrammingFeaturesWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeLocalProgrammingFeaturesWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeLocalProgrammingFeaturesWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeLocalProgrammingFeaturesWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeOpenPeriodWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeOpenPeriodWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeOpenPeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeOpenPeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeOperatingModeWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeOperatingModeWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeOperatingModeWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeOperatingModeWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeRequirePINforRemoteOperationWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeRequirePINforRemoteOperationWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeRequirePINforRemoteOperationWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeRequirePINforRemoteOperationWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeSendPINOverTheAirWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeSendPINOverTheAirWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeSendPINOverTheAirWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeSendPINOverTheAirWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeSoundVolumeWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeSoundVolumeWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeSoundVolumeWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeSoundVolumeWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeUserCodeTemporaryDisableTimeWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeUserCodeTemporaryDisableTimeWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeUserCodeTemporaryDisableTimeWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeUserCodeTemporaryDisableTimeWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeWrongCodeEntryLimitWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeWrongCodeEntryLimitWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeWrongCodeEntryLimitWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeWrongCodeEntryLimitWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
@end

@implementation MTRBaseClusterDoorLock

- (void)lockDoorWithCompletion:(id)a3
{
}

- (void)lockDoorWithParams:(MTRDoorLockClusterLockDoorParams *)params completion:(MTRStatusCompletion)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterLockDoorParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_24497A84C;
  v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v26, (uint64_t)v19, &unk_26F9C96D0, &unk_26F9C87D0, v6, v15, v22, 0, v25, v9, v27, v28, v29, v30);
}

- (void)unlockDoorWithCompletion:(id)a3
{
}

- (void)unlockDoorWithParams:(MTRDoorLockClusterUnlockDoorParams *)params completion:(MTRStatusCompletion)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterUnlockDoorParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_24497AA50;
  v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v26, (uint64_t)v19, &unk_26F9C96D0, &unk_26F9C8848, v6, v15, v22, 0, v25, v9, v27, v28, v29, v30);
}

- (void)unlockWithTimeoutWithParams:(MTRDoorLockClusterUnlockWithTimeoutParams *)params completion:(MTRStatusCompletion)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterUnlockWithTimeoutParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_24497AC48;
  v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v26, (uint64_t)v19, &unk_26F9C96D0, &unk_26F9C8878, v6, v15, v22, 0, v25, v9, v27, v28, v29, v30);
}

- (void)setWeekDayScheduleWithParams:(MTRDoorLockClusterSetWeekDayScheduleParams *)params completion:(MTRStatusCompletion)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterSetWeekDayScheduleParams);
  }
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  uint64_t v28 = sub_24497AE34;
  v29 = &unk_265198C08;
  id v8 = v7;
  id v30 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v26);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  uint64_t v18 = objc_msgSend_endpointID(self, v16, v17);
  uint64_t v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v24 = objc_msgSend_callbackQueue(self, v22, v23);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_26F9C96D0, &unk_26F9C8B78, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);
}

- (void)getWeekDayScheduleWithParams:(MTRDoorLockClusterGetWeekDayScheduleParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterGetWeekDayScheduleParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_24497B030;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  uint64_t v18 = objc_msgSend_endpointID(self, v16, v17);
  uint64_t v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9C96D0, &unk_26F9C96E8, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)clearWeekDayScheduleWithParams:(MTRDoorLockClusterClearWeekDayScheduleParams *)params completion:(MTRStatusCompletion)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterClearWeekDayScheduleParams);
  }
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  uint64_t v28 = sub_24497B218;
  v29 = &unk_265198C08;
  id v8 = v7;
  id v30 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v26);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  uint64_t v18 = objc_msgSend_endpointID(self, v16, v17);
  uint64_t v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v24 = objc_msgSend_callbackQueue(self, v22, v23);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_26F9C96D0, &unk_26F9C9700, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);
}

- (void)setYearDayScheduleWithParams:(MTRDoorLockClusterSetYearDayScheduleParams *)params completion:(MTRStatusCompletion)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterSetYearDayScheduleParams);
  }
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  uint64_t v28 = sub_24497B404;
  v29 = &unk_265198C08;
  id v8 = v7;
  id v30 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v26);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  uint64_t v18 = objc_msgSend_endpointID(self, v16, v17);
  uint64_t v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v24 = objc_msgSend_callbackQueue(self, v22, v23);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_26F9C96D0, &unk_26F9C9718, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);
}

- (void)getYearDayScheduleWithParams:(MTRDoorLockClusterGetYearDayScheduleParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterGetYearDayScheduleParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_24497B600;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  uint64_t v18 = objc_msgSend_endpointID(self, v16, v17);
  uint64_t v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9C96D0, &unk_26F9C9730, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)clearYearDayScheduleWithParams:(MTRDoorLockClusterClearYearDayScheduleParams *)params completion:(MTRStatusCompletion)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterClearYearDayScheduleParams);
  }
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  uint64_t v28 = sub_24497B7E8;
  v29 = &unk_265198C08;
  id v8 = v7;
  id v30 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v26);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  uint64_t v18 = objc_msgSend_endpointID(self, v16, v17);
  uint64_t v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v24 = objc_msgSend_callbackQueue(self, v22, v23);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_26F9C96D0, &unk_26F9C9748, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);
}

- (void)setHolidayScheduleWithParams:(MTRDoorLockClusterSetHolidayScheduleParams *)params completion:(MTRStatusCompletion)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterSetHolidayScheduleParams);
  }
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  uint64_t v28 = sub_24497B9D4;
  v29 = &unk_265198C08;
  id v8 = v7;
  id v30 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v26);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  uint64_t v18 = objc_msgSend_endpointID(self, v16, v17);
  uint64_t v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v24 = objc_msgSend_callbackQueue(self, v22, v23);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_26F9C96D0, &unk_26F9C9760, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);
}

- (void)getHolidayScheduleWithParams:(MTRDoorLockClusterGetHolidayScheduleParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterGetHolidayScheduleParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_24497BBD0;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  uint64_t v18 = objc_msgSend_endpointID(self, v16, v17);
  uint64_t v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9C96D0, &unk_26F9C9778, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)clearHolidayScheduleWithParams:(MTRDoorLockClusterClearHolidayScheduleParams *)params completion:(MTRStatusCompletion)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterClearHolidayScheduleParams);
  }
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  uint64_t v28 = sub_24497BDB8;
  v29 = &unk_265198C08;
  id v8 = v7;
  id v30 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v26);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  uint64_t v18 = objc_msgSend_endpointID(self, v16, v17);
  uint64_t v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v24 = objc_msgSend_callbackQueue(self, v22, v23);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_26F9C96D0, &unk_26F9C9790, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);
}

- (void)setUserWithParams:(MTRDoorLockClusterSetUserParams *)params completion:(MTRStatusCompletion)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterSetUserParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_24497BFB0;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  uint64_t v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v26, (uint64_t)v19, &unk_26F9C96D0, &unk_26F9C97A8, v6, v15, v22, 0, v25, v9, v27, v28, v29, v30);
}

- (void)getUserWithParams:(MTRDoorLockClusterGetUserParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterGetUserParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_24497C1AC;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  uint64_t v18 = objc_msgSend_endpointID(self, v16, v17);
  uint64_t v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9C96D0, &unk_26F9C97C0, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)clearUserWithParams:(MTRDoorLockClusterClearUserParams *)params completion:(MTRStatusCompletion)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterClearUserParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_24497C3A0;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  uint64_t v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v26, (uint64_t)v19, &unk_26F9C96D0, &unk_26F9C97D8, v6, v15, v22, 0, v25, v9, v27, v28, v29, v30);
}

- (void)setCredentialWithParams:(MTRDoorLockClusterSetCredentialParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterSetCredentialParams);
  }
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  id v30 = sub_24497C5A8;
  id v31 = &unk_265198C08;
  id v8 = v7;
  id v32 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v28);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  uint64_t v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  uint64_t v23 = objc_opt_class();
  uint64_t v26 = objc_msgSend_callbackQueue(self, v24, v25);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v27, (uint64_t)v19, &unk_26F9C96D0, &unk_26F9C97F0, v6, v15, v22, v23, v26, v9, v28, v29, v30, v31);
}

- (void)getCredentialStatusWithParams:(MTRDoorLockClusterGetCredentialStatusParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterGetCredentialStatusParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  uint64_t v29 = sub_24497C7A0;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  uint64_t v18 = objc_msgSend_endpointID(self, v16, v17);
  uint64_t v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  uint64_t v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9C96D0, &unk_26F9C9808, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)clearCredentialWithParams:(MTRDoorLockClusterClearCredentialParams *)params completion:(MTRStatusCompletion)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterClearCredentialParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  uint64_t v29 = sub_24497C994;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  uint64_t v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  uint64_t v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v26, (uint64_t)v19, &unk_26F9C96D0, &unk_26F9C9820, v6, v15, v22, 0, v25, v9, v27, v28, v29, v30);
}

- (void)unboltDoorWithCompletion:(id)a3
{
}

- (void)unboltDoorWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTRDoorLockClusterUnboltDoorParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterUnboltDoorParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  uint64_t v29 = sub_24497CB98;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  uint64_t v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  uint64_t v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v26, (uint64_t)v19, &unk_26F9C96D0, &unk_26F9C9838, v6, v15, v22, 0, v25, v9, v27, v28, v29, v30);
}

- (void)setAliroReaderConfigWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTRDoorLockClusterSetAliroReaderConfigParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterSetAliroReaderConfigParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  uint64_t v29 = sub_24497CD90;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  uint64_t v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  uint64_t v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v26, (uint64_t)v19, &unk_26F9C96D0, &unk_26F9C9850, v6, v15, v22, 0, v25, v9, v27, v28, v29, v30);
}

- (void)clearAliroReaderConfigWithCompletion:(id)a3
{
}

- (void)clearAliroReaderConfigWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTRDoorLockClusterClearAliroReaderConfigParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterClearAliroReaderConfigParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  uint64_t v29 = sub_24497CF94;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  uint64_t v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  uint64_t v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v26, (uint64_t)v19, &unk_26F9C96D0, &unk_26F9C9868, v6, v15, v22, 0, v25, v9, v27, v28, v29, v30);
}

- (void)appleSetAliroCredentialWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTRDoorLockClusterAppleSetAliroCredentialParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterAppleSetAliroCredentialParams);
  }
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  id v30 = sub_24497D19C;
  id v31 = &unk_265198C08;
  id v8 = v7;
  id v32 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v28);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  uint64_t v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  uint64_t v23 = objc_opt_class();
  uint64_t v26 = objc_msgSend_callbackQueue(self, v24, v25);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v27, (uint64_t)v19, &unk_26F9C96D0, &unk_26F9C9880, v6, v15, v22, v23, v26, v9, v28, v29, v30, v31);
}

- (void)appleGetAliroCredentialStatusWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTRDoorLockClusterAppleGetAliroCredentialStatusParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterAppleGetAliroCredentialStatusParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  uint64_t v29 = sub_24497D394;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  uint64_t v18 = objc_msgSend_endpointID(self, v16, v17);
  uint64_t v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  uint64_t v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9C96D0, &unk_26F9C9898, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)appleClearAliroCredentialWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTRDoorLockClusterAppleClearAliroCredentialParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterAppleClearAliroCredentialParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  uint64_t v29 = sub_24497D588;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  uint64_t v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  uint64_t v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v26, (uint64_t)v19, &unk_26F9C96D0, &unk_26F9C98B0, v6, v15, v22, 0, v25, v9, v27, v28, v29, v30);
}

- (void)appleSetAliroReaderConfigWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTRDoorLockClusterAppleSetAliroReaderConfigParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterAppleSetAliroReaderConfigParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  uint64_t v29 = sub_24497D780;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  uint64_t v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  uint64_t v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v26, (uint64_t)v19, &unk_26F9C96D0, &unk_26F9C98C8, v6, v15, v22, 0, v25, v9, v27, v28, v29, v30);
}

- (void)appleClearAliroReaderConfigWithCompletion:(id)a3
{
}

- (void)appleClearAliroReaderConfigWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTRDoorLockClusterAppleClearAliroReaderConfigParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTRDoorLockClusterAppleClearAliroReaderConfigParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  uint64_t v29 = sub_24497D984;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  uint64_t v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  uint64_t v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v26, (uint64_t)v19, &unk_26F9C96D0, &unk_26F9C98E0, v6, v15, v22, 0, v25, v9, v27, v28, v29, v30);
}

- (void)readAttributeLockStateWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8710, 0, v12, v14);
}

- (void)subscribeAttributeLockStateWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8710, v20, v18, v9, v8);
}

+ (void)readAttributeLockStateWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 0, v10, v11);
}

- (void)readAttributeLockTypeWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8800, 0, v12, v14);
}

- (void)subscribeAttributeLockTypeWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8800, v20, v18, v9, v8);
}

+ (void)readAttributeLockTypeWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 1, v10, v11);
}

- (void)readAttributeActuatorEnabledWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C89C8, 0, v12, v14);
}

- (void)subscribeAttributeActuatorEnabledWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C89C8, v20, v18, v9, v8);
}

+ (void)readAttributeActuatorEnabledWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 2, v10, v11);
}

- (void)readAttributeDoorStateWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C89E0, 0, v12, v14);
}

- (void)subscribeAttributeDoorStateWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C89E0, v20, v18, v9, v8);
}

+ (void)readAttributeDoorStateWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 3, v10, v11);
}

- (void)readAttributeDoorOpenEventsWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C89F8, 0, v12, v14);
}

- (void)writeAttributeDoorOpenEventsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeDoorOpenEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeDoorOpenEventsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C89F8, v20, v18, v9, v8);
}

+ (void)readAttributeDoorOpenEventsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 4, v10, v11);
}

- (void)readAttributeDoorClosedEventsWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8A10, 0, v12, v14);
}

- (void)writeAttributeDoorClosedEventsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeDoorClosedEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeDoorClosedEventsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8A10, v20, v18, v9, v8);
}

+ (void)readAttributeDoorClosedEventsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 5, v10, v11);
}

- (void)readAttributeOpenPeriodWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8A28, 0, v12, v14);
}

- (void)writeAttributeOpenPeriodWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeOpenPeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeOpenPeriodWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8A28, v20, v18, v9, v8);
}

+ (void)readAttributeOpenPeriodWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 6, v10, v11);
}

- (void)readAttributeNumberOfTotalUsersSupportedWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8A70, 0, v12, v14);
}

- (void)subscribeAttributeNumberOfTotalUsersSupportedWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8A70, v20, v18, v9, v8);
}

+ (void)readAttributeNumberOfTotalUsersSupportedWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 17, v10, v11);
}

- (void)readAttributeNumberOfPINUsersSupportedWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8A88, 0, v12, v14);
}

- (void)subscribeAttributeNumberOfPINUsersSupportedWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8A88, v20, v18, v9, v8);
}

+ (void)readAttributeNumberOfPINUsersSupportedWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 18, v10, v11);
}

- (void)readAttributeNumberOfRFIDUsersSupportedWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8AA0, 0, v12, v14);
}

- (void)subscribeAttributeNumberOfRFIDUsersSupportedWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8AA0, v20, v18, v9, v8);
}

+ (void)readAttributeNumberOfRFIDUsersSupportedWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 19, v10, v11);
}

- (void)readAttributeNumberOfWeekDaySchedulesSupportedPerUserWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8AB8, 0, v12, v14);
}

- (void)subscribeAttributeNumberOfWeekDaySchedulesSupportedPerUserWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8AB8, v20, v18, v9, v8);
}

+ (void)readAttributeNumberOfWeekDaySchedulesSupportedPerUserWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 20, v10, v11);
}

- (void)readAttributeNumberOfYearDaySchedulesSupportedPerUserWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8C80, 0, v12, v14);
}

- (void)subscribeAttributeNumberOfYearDaySchedulesSupportedPerUserWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8C80, v20, v18, v9, v8);
}

+ (void)readAttributeNumberOfYearDaySchedulesSupportedPerUserWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 21, v10, v11);
}

- (void)readAttributeNumberOfHolidaySchedulesSupportedWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8C98, 0, v12, v14);
}

- (void)subscribeAttributeNumberOfHolidaySchedulesSupportedWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8C98, v20, v18, v9, v8);
}

+ (void)readAttributeNumberOfHolidaySchedulesSupportedWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 22, v10, v11);
}

- (void)readAttributeMaxPINCodeLengthWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8D58, 0, v12, v14);
}

- (void)subscribeAttributeMaxPINCodeLengthWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8D58, v20, v18, v9, v8);
}

+ (void)readAttributeMaxPINCodeLengthWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 23, v10, v11);
}

- (void)readAttributeMinPINCodeLengthWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8D70, 0, v12, v14);
}

- (void)subscribeAttributeMinPINCodeLengthWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8D70, v20, v18, v9, v8);
}

+ (void)readAttributeMinPINCodeLengthWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 24, v10, v11);
}

- (void)readAttributeMaxRFIDCodeLengthWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8D88, 0, v12, v14);
}

- (void)subscribeAttributeMaxRFIDCodeLengthWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8D88, v20, v18, v9, v8);
}

+ (void)readAttributeMaxRFIDCodeLengthWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 25, v10, v11);
}

- (void)readAttributeMinRFIDCodeLengthWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8DA0, 0, v12, v14);
}

- (void)subscribeAttributeMinRFIDCodeLengthWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8DA0, v20, v18, v9, v8);
}

+ (void)readAttributeMinRFIDCodeLengthWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 26, v10, v11);
}

- (void)readAttributeCredentialRulesSupportWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8DB8, 0, v12, v14);
}

- (void)subscribeAttributeCredentialRulesSupportWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8DB8, v20, v18, v9, v8);
}

+ (void)readAttributeCredentialRulesSupportWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 27, v10, v11);
}

- (void)readAttributeNumberOfCredentialsSupportedPerUserWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8DD0, 0, v12, v14);
}

- (void)subscribeAttributeNumberOfCredentialsSupportedPerUserWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8DD0, v20, v18, v9, v8);
}

+ (void)readAttributeNumberOfCredentialsSupportedPerUserWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 28, v10, v11);
}

- (void)readAttributeLanguageWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8ED8, 0, v12, v14);
}

- (void)writeAttributeLanguageWithValue:(NSString *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeLanguageWithValue:(NSString *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeLanguageWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8ED8, v20, v18, v9, v8);
}

+ (void)readAttributeLanguageWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 33, v10, v11);
}

- (void)readAttributeLEDSettingsWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8EF0, 0, v12, v14);
}

- (void)writeAttributeLEDSettingsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeLEDSettingsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeLEDSettingsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8EF0, v20, v18, v9, v8);
}

+ (void)readAttributeLEDSettingsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 34, v10, v11);
}

- (void)readAttributeAutoRelockTimeWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8F08, 0, v12, v14);
}

- (void)writeAttributeAutoRelockTimeWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeAutoRelockTimeWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeAutoRelockTimeWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8F08, v20, v18, v9, v8);
}

+ (void)readAttributeAutoRelockTimeWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 35, v10, v11);
}

- (void)readAttributeSoundVolumeWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8F20, 0, v12, v14);
}

- (void)writeAttributeSoundVolumeWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeSoundVolumeWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeSoundVolumeWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8F20, v20, v18, v9, v8);
}

+ (void)readAttributeSoundVolumeWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 36, v10, v11);
}

- (void)readAttributeOperatingModeWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8F38, 0, v12, v14);
}

- (void)writeAttributeOperatingModeWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeOperatingModeWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeOperatingModeWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8F38, v20, v18, v9, v8);
}

+ (void)readAttributeOperatingModeWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 37, v10, v11);
}

- (void)readAttributeSupportedOperatingModesWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8F50, 0, v12, v14);
}

- (void)subscribeAttributeSupportedOperatingModesWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8F50, v20, v18, v9, v8);
}

+ (void)readAttributeSupportedOperatingModesWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 38, v10, v11);
}

- (void)readAttributeDefaultConfigurationRegisterWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8F68, 0, v12, v14);
}

- (void)subscribeAttributeDefaultConfigurationRegisterWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8F68, v20, v18, v9, v8);
}

+ (void)readAttributeDefaultConfigurationRegisterWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 39, v10, v11);
}

- (void)readAttributeEnableLocalProgrammingWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8F80, 0, v12, v14);
}

- (void)writeAttributeEnableLocalProgrammingWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeEnableLocalProgrammingWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeEnableLocalProgrammingWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8F80, v20, v18, v9, v8);
}

+ (void)readAttributeEnableLocalProgrammingWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 40, v10, v11);
}

- (void)readAttributeEnableOneTouchLockingWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8F98, 0, v12, v14);
}

- (void)writeAttributeEnableOneTouchLockingWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeEnableOneTouchLockingWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeEnableOneTouchLockingWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8F98, v20, v18, v9, v8);
}

+ (void)readAttributeEnableOneTouchLockingWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 41, v10, v11);
}

- (void)readAttributeEnableInsideStatusLEDWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8FB0, 0, v12, v14);
}

- (void)writeAttributeEnableInsideStatusLEDWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeEnableInsideStatusLEDWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeEnableInsideStatusLEDWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8FB0, v20, v18, v9, v8);
}

+ (void)readAttributeEnableInsideStatusLEDWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 42, v10, v11);
}

- (void)readAttributeEnablePrivacyModeButtonWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8FC8, 0, v12, v14);
}

- (void)writeAttributeEnablePrivacyModeButtonWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeEnablePrivacyModeButtonWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeEnablePrivacyModeButtonWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8FC8, v20, v18, v9, v8);
}

+ (void)readAttributeEnablePrivacyModeButtonWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 43, v10, v11);
}

- (void)readAttributeLocalProgrammingFeaturesWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8FE0, 0, v12, v14);
}

- (void)writeAttributeLocalProgrammingFeaturesWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeLocalProgrammingFeaturesWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeLocalProgrammingFeaturesWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8FE0, v20, v18, v9, v8);
}

+ (void)readAttributeLocalProgrammingFeaturesWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 44, v10, v11);
}

- (void)readAttributeWrongCodeEntryLimitWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C9040, 0, v12, v14);
}

- (void)writeAttributeWrongCodeEntryLimitWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeWrongCodeEntryLimitWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeWrongCodeEntryLimitWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C9040, v20, v18, v9, v8);
}

+ (void)readAttributeWrongCodeEntryLimitWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 48, v10, v11);
}

- (void)readAttributeUserCodeTemporaryDisableTimeWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C9058, 0, v12, v14);
}

- (void)writeAttributeUserCodeTemporaryDisableTimeWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeUserCodeTemporaryDisableTimeWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeUserCodeTemporaryDisableTimeWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C9058, v20, v18, v9, v8);
}

+ (void)readAttributeUserCodeTemporaryDisableTimeWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 49, v10, v11);
}

- (void)readAttributeSendPINOverTheAirWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C9070, 0, v12, v14);
}

- (void)writeAttributeSendPINOverTheAirWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeSendPINOverTheAirWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeSendPINOverTheAirWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C9070, v20, v18, v9, v8);
}

+ (void)readAttributeSendPINOverTheAirWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 50, v10, v11);
}

- (void)readAttributeRequirePINforRemoteOperationWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C9088, 0, v12, v14);
}

- (void)writeAttributeRequirePINforRemoteOperationWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeRequirePINforRemoteOperationWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeRequirePINforRemoteOperationWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C9088, v20, v18, v9, v8);
}

+ (void)readAttributeRequirePINforRemoteOperationWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 51, v10, v11);
}

- (void)readAttributeExpiringUserTimeoutWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C90B8, 0, v12, v14);
}

- (void)writeAttributeExpiringUserTimeoutWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeExpiringUserTimeoutWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeExpiringUserTimeoutWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C90B8, v20, v18, v9, v8);
}

+ (void)readAttributeExpiringUserTimeoutWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 53, v10, v11);
}

- (void)readAttributeAliroReaderVerificationKeyWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C98F8, 0, v12, v14);
}

- (void)subscribeAttributeAliroReaderVerificationKeyWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C98F8, v20, v18, v9, v8);
}

+ (void)readAttributeAliroReaderVerificationKeyWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 128, v10, v11);
}

- (void)readAttributeAliroReaderGroupIdentifierWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C9910, 0, v12, v14);
}

- (void)subscribeAttributeAliroReaderGroupIdentifierWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C9910, v20, v18, v9, v8);
}

+ (void)readAttributeAliroReaderGroupIdentifierWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 129, v10, v11);
}

- (void)readAttributeAliroReaderGroupSubIdentifierWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C9928, 0, v12, v14);
}

- (void)subscribeAttributeAliroReaderGroupSubIdentifierWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C9928, v20, v18, v9, v8);
}

+ (void)readAttributeAliroReaderGroupSubIdentifierWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 130, v10, v11);
}

- (void)readAttributeAliroExpeditedTransactionSupportedProtocolVersionsWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C9940, 0, v12, v14);
}

- (void)subscribeAttributeAliroExpeditedTransactionSupportedProtocolVersionsWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C9940, v20, v18, v9, v8);
}

+ (void)readAttributeAliroExpeditedTransactionSupportedProtocolVersionsWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 131, v10, v11);
}

- (void)readAttributeAliroGroupResolvingKeyWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C9958, 0, v12, v14);
}

- (void)subscribeAttributeAliroGroupResolvingKeyWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C9958, v20, v18, v9, v8);
}

+ (void)readAttributeAliroGroupResolvingKeyWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 132, v10, v11);
}

- (void)readAttributeAliroSupportedBLEUWBProtocolVersionsWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C9970, 0, v12, v14);
}

- (void)subscribeAttributeAliroSupportedBLEUWBProtocolVersionsWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C9970, v20, v18, v9, v8);
}

+ (void)readAttributeAliroSupportedBLEUWBProtocolVersionsWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 133, v10, v11);
}

- (void)readAttributeAliroBLEAdvertisingVersionWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C9988, 0, v12, v14);
}

- (void)subscribeAttributeAliroBLEAdvertisingVersionWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C9988, v20, v18, v9, v8);
}

+ (void)readAttributeAliroBLEAdvertisingVersionWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 134, v10, v11);
}

- (void)readAttributeNumberOfAliroCredentialIssuerKeysSupportedWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C99A0, 0, v12, v14);
}

- (void)subscribeAttributeNumberOfAliroCredentialIssuerKeysSupportedWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C99A0, v20, v18, v9, v8);
}

+ (void)readAttributeNumberOfAliroCredentialIssuerKeysSupportedWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 135, v10, v11);
}

- (void)readAttributeNumberOfAliroEndpointKeysSupportedWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C99B8, 0, v12, v14);
}

- (void)subscribeAttributeNumberOfAliroEndpointKeysSupportedWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C99B8, v20, v18, v9, v8);
}

+ (void)readAttributeNumberOfAliroEndpointKeysSupportedWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 136, v10, v11);
}

- (void)readAttributeGeneratedCommandListWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8728, 0, v12, v14);
}

- (void)subscribeAttributeGeneratedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8728, v20, v18, v9, v8);
}

+ (void)readAttributeGeneratedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 65528, v10, v11);
}

- (void)readAttributeAcceptedCommandListWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8740, 0, v12, v14);
}

- (void)subscribeAttributeAcceptedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8740, v20, v18, v9, v8);
}

+ (void)readAttributeAcceptedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 65529, v10, v11);
}

- (void)readAttributeEventListWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8818, 0, v12, v14);
}

- (void)subscribeAttributeEventListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8818, v20, v18, v9, v8);
}

+ (void)readAttributeEventListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 65530, v10, v11);
}

- (void)readAttributeAttributeListWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8758, 0, v12, v14);
}

- (void)subscribeAttributeAttributeListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8758, v20, v18, v9, v8);
}

+ (void)readAttributeAttributeListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 65531, v10, v11);
}

- (void)readAttributeFeatureMapWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8770, 0, v12, v14);
}

- (void)subscribeAttributeFeatureMapWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8770, v20, v18, v9, v8);
}

+ (void)readAttributeFeatureMapWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 65532, v10, v11);
}

- (void)readAttributeClusterRevisionWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C8788, 0, v12, v14);
}

- (void)subscribeAttributeClusterRevisionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C8788, v20, v18, v9, v8);
}

+ (void)readAttributeClusterRevisionWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 65533, v10, v11);
}

- (void)readAttributeAppleAliroReaderVerificationKeyWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C99D0, 0, v12, v14);
}

- (void)subscribeAttributeAppleAliroReaderVerificationKeyWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C99D0, v20, v18, v9, v8);
}

+ (void)readAttributeAppleAliroReaderVerificationKeyWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 323551232, v10, v11);
}

- (void)readAttributeAppleAliroReaderGroupIdentifierWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C99E8, 0, v12, v14);
}

- (void)subscribeAttributeAppleAliroReaderGroupIdentifierWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C99E8, v20, v18, v9, v8);
}

+ (void)readAttributeAppleAliroReaderGroupIdentifierWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 323551233, v10, v11);
}

- (void)readAttributeAppleAliroReaderGroupSubIdentifierWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C9A00, 0, v12, v14);
}

- (void)subscribeAttributeAppleAliroReaderGroupSubIdentifierWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C9A00, v20, v18, v9, v8);
}

+ (void)readAttributeAppleAliroReaderGroupSubIdentifierWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 323551234, v10, v11);
}

- (void)readAttributeAppleAliroExpeditedTransactionSupportedProtocolVersionsWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C9A18, 0, v12, v14);
}

- (void)subscribeAttributeAppleAliroExpeditedTransactionSupportedProtocolVersionsWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C9A18, v20, v18, v9, v8);
}

+ (void)readAttributeAppleAliroExpeditedTransactionSupportedProtocolVersionsWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 323551235, v10, v11);
}

- (void)readAttributeAppleAliroGroupResolvingKeyWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C9A30, 0, v12, v14);
}

- (void)subscribeAttributeAppleAliroGroupResolvingKeyWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C9A30, v20, v18, v9, v8);
}

+ (void)readAttributeAppleAliroGroupResolvingKeyWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 323551236, v10, v11);
}

- (void)readAttributeAppleAliroSupportedBLEUWBProtocolVersionsWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C9A48, 0, v12, v14);
}

- (void)subscribeAttributeAppleAliroSupportedBLEUWBProtocolVersionsWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C9A48, v20, v18, v9, v8);
}

+ (void)readAttributeAppleAliroSupportedBLEUWBProtocolVersionsWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 323551237, v10, v11);
}

- (void)readAttributeAppleAliroBLEAdvertisingVersionWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C9A60, 0, v12, v14);
}

- (void)subscribeAttributeAppleAliroBLEAdvertisingVersionWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C9A60, v20, v18, v9, v8);
}

+ (void)readAttributeAppleAliroBLEAdvertisingVersionWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 323551238, v10, v11);
}

- (void)readAttributeAppleNumberOfAliroCredentialIssuerKeysSupportedWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C9A78, 0, v12, v14);
}

- (void)subscribeAttributeAppleNumberOfAliroCredentialIssuerKeysSupportedWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C9A78, v20, v18, v9, v8);
}

+ (void)readAttributeAppleNumberOfAliroCredentialIssuerKeysSupportedWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 323551239, v10, v11);
}

- (void)readAttributeAppleNumberOfAliroEndpointKeysSupportedWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C96D0, &unk_26F9C9A90, 0, v12, v14);
}

- (void)subscribeAttributeAppleNumberOfAliroEndpointKeysSupportedWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C96D0, &unk_26F9C9A90, v20, v18, v9, v8);
}

+ (void)readAttributeAppleNumberOfAliroEndpointKeysSupportedWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 257, 323551240, v10, v11);
}

- (void)lockDoorWithParams:(MTRDoorLockClusterLockDoorParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)unlockDoorWithParams:(MTRDoorLockClusterUnlockDoorParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)unlockWithTimeoutWithParams:(MTRDoorLockClusterUnlockWithTimeoutParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)setWeekDayScheduleWithParams:(MTRDoorLockClusterSetWeekDayScheduleParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)getWeekDayScheduleWithParams:(MTRDoorLockClusterGetWeekDayScheduleParams *)params completionHandler:(void *)completionHandler
{
  id v6 = completionHandler;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_24498CEF0;
  v9[3] = &unk_265199090;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend_getWeekDayScheduleWithParams_completion_(self, v8, (uint64_t)params, v9);
}

- (void)clearWeekDayScheduleWithParams:(MTRDoorLockClusterClearWeekDayScheduleParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)setYearDayScheduleWithParams:(MTRDoorLockClusterSetYearDayScheduleParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)getYearDayScheduleWithParams:(MTRDoorLockClusterGetYearDayScheduleParams *)params completionHandler:(void *)completionHandler
{
  id v6 = completionHandler;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_24498CFC4;
  v9[3] = &unk_2651990B8;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend_getYearDayScheduleWithParams_completion_(self, v8, (uint64_t)params, v9);
}

- (void)clearYearDayScheduleWithParams:(MTRDoorLockClusterClearYearDayScheduleParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)setHolidayScheduleWithParams:(MTRDoorLockClusterSetHolidayScheduleParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)getHolidayScheduleWithParams:(MTRDoorLockClusterGetHolidayScheduleParams *)params completionHandler:(void *)completionHandler
{
  id v6 = completionHandler;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_24498D098;
  v9[3] = &unk_2651990E0;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend_getHolidayScheduleWithParams_completion_(self, v8, (uint64_t)params, v9);
}

- (void)clearHolidayScheduleWithParams:(MTRDoorLockClusterClearHolidayScheduleParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)setUserWithParams:(MTRDoorLockClusterSetUserParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)getUserWithParams:(MTRDoorLockClusterGetUserParams *)params completionHandler:(void *)completionHandler
{
  id v6 = completionHandler;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_24498D16C;
  v9[3] = &unk_265199108;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend_getUserWithParams_completion_(self, v8, (uint64_t)params, v9);
}

- (void)clearUserWithParams:(MTRDoorLockClusterClearUserParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)setCredentialWithParams:(MTRDoorLockClusterSetCredentialParams *)params completionHandler:(void *)completionHandler
{
  id v6 = completionHandler;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_24498D23C;
  v9[3] = &unk_265199130;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend_setCredentialWithParams_completion_(self, v8, (uint64_t)params, v9);
}

- (void)getCredentialStatusWithParams:(MTRDoorLockClusterGetCredentialStatusParams *)params completionHandler:(void *)completionHandler
{
  id v6 = completionHandler;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_24498D308;
  v9[3] = &unk_265199158;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend_getCredentialStatusWithParams_completion_(self, v8, (uint64_t)params, v9);
}

- (void)clearCredentialWithParams:(MTRDoorLockClusterClearCredentialParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)readAttributeLockStateWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_24498D3C8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeLockStateWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeLockStateWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_24498D548;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeLockStateWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeLockStateWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_24498D670;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeLockStateWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeLockTypeWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_24498D72C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeLockTypeWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeLockTypeWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_24498D8AC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeLockTypeWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeLockTypeWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_24498D9D4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeLockTypeWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeActuatorEnabledWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_24498DA90;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeActuatorEnabledWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeActuatorEnabledWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_24498DC10;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeActuatorEnabledWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeActuatorEnabledWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_24498DD38;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeActuatorEnabledWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeDoorStateWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_24498DDF4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeDoorStateWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeDoorStateWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_24498DF74;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeDoorStateWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeDoorStateWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_24498E09C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeDoorStateWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeDoorOpenEventsWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_24498E158;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeDoorOpenEventsWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeDoorOpenEventsWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeDoorOpenEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeDoorOpenEventsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_24498E2E8;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeDoorOpenEventsWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeDoorOpenEventsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_24498E410;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeDoorOpenEventsWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeDoorClosedEventsWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_24498E4CC;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeDoorClosedEventsWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeDoorClosedEventsWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeDoorClosedEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeDoorClosedEventsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_24498E65C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeDoorClosedEventsWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeDoorClosedEventsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_24498E784;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeDoorClosedEventsWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeOpenPeriodWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_24498E840;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeOpenPeriodWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeOpenPeriodWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeOpenPeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeOpenPeriodWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_24498E9D0;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeOpenPeriodWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeOpenPeriodWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_24498EAF8;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeOpenPeriodWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeNumberOfTotalUsersSupportedWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_24498EBB4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeNumberOfTotalUsersSupportedWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeNumberOfTotalUsersSupportedWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_24498ED34;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeNumberOfTotalUsersSupportedWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeNumberOfTotalUsersSupportedWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_24498EE5C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeNumberOfTotalUsersSupportedWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeNumberOfPINUsersSupportedWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_24498EF18;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeNumberOfPINUsersSupportedWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeNumberOfPINUsersSupportedWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_24498F098;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeNumberOfPINUsersSupportedWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeNumberOfPINUsersSupportedWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_24498F1C0;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeNumberOfPINUsersSupportedWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeNumberOfRFIDUsersSupportedWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_24498F27C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeNumberOfRFIDUsersSupportedWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeNumberOfRFIDUsersSupportedWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_24498F3FC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeNumberOfRFIDUsersSupportedWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeNumberOfRFIDUsersSupportedWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_24498F524;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeNumberOfRFIDUsersSupportedWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeNumberOfWeekDaySchedulesSupportedPerUserWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_24498F5E0;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeNumberOfWeekDaySchedulesSupportedPerUserWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeNumberOfWeekDaySchedulesSupportedPerUserWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_24498F760;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeNumberOfWeekDaySchedulesSupportedPerUserWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeNumberOfWeekDaySchedulesSupportedPerUserWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_24498F888;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeNumberOfWeekDaySchedulesSupportedPerUserWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeNumberOfYearDaySchedulesSupportedPerUserWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_24498F944;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeNumberOfYearDaySchedulesSupportedPerUserWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeNumberOfYearDaySchedulesSupportedPerUserWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_24498FAC4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeNumberOfYearDaySchedulesSupportedPerUserWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeNumberOfYearDaySchedulesSupportedPerUserWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_24498FBEC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeNumberOfYearDaySchedulesSupportedPerUserWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeNumberOfHolidaySchedulesSupportedWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_24498FCA8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeNumberOfHolidaySchedulesSupportedWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeNumberOfHolidaySchedulesSupportedWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_24498FE28;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeNumberOfHolidaySchedulesSupportedWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeNumberOfHolidaySchedulesSupportedWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_24498FF50;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeNumberOfHolidaySchedulesSupportedWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeMaxPINCodeLengthWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_24499000C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeMaxPINCodeLengthWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeMaxPINCodeLengthWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_24499018C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeMaxPINCodeLengthWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeMaxPINCodeLengthWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2449902B4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeMaxPINCodeLengthWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeMinPINCodeLengthWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244990370;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeMinPINCodeLengthWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeMinPINCodeLengthWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2449904F0;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeMinPINCodeLengthWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeMinPINCodeLengthWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244990618;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeMinPINCodeLengthWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeMaxRFIDCodeLengthWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2449906D4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeMaxRFIDCodeLengthWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeMaxRFIDCodeLengthWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244990854;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeMaxRFIDCodeLengthWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeMaxRFIDCodeLengthWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_24499097C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeMaxRFIDCodeLengthWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeMinRFIDCodeLengthWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244990A38;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeMinRFIDCodeLengthWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeMinRFIDCodeLengthWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244990BB8;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeMinRFIDCodeLengthWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeMinRFIDCodeLengthWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244990CE0;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeMinRFIDCodeLengthWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeCredentialRulesSupportWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244990D9C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeCredentialRulesSupportWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeCredentialRulesSupportWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244990F1C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeCredentialRulesSupportWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeCredentialRulesSupportWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244991044;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeCredentialRulesSupportWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeNumberOfCredentialsSupportedPerUserWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244991100;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeNumberOfCredentialsSupportedPerUserWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeNumberOfCredentialsSupportedPerUserWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244991280;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeNumberOfCredentialsSupportedPerUserWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeNumberOfCredentialsSupportedPerUserWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2449913A8;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeNumberOfCredentialsSupportedPerUserWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeLanguageWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244991464;
  v7[3] = &unk_265198D48;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeLanguageWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeLanguageWithValue:(NSString *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeLanguageWithValue:(NSString *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeLanguageWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2449915F4;
  v26[3] = &unk_265198D48;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeLanguageWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeLanguageWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_24499171C;
  v18[3] = &unk_265198D48;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeLanguageWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeLEDSettingsWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2449917D8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeLEDSettingsWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeLEDSettingsWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeLEDSettingsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeLEDSettingsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244991968;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeLEDSettingsWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeLEDSettingsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244991A90;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeLEDSettingsWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAutoRelockTimeWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244991B4C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAutoRelockTimeWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeAutoRelockTimeWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeAutoRelockTimeWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeAutoRelockTimeWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244991CDC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAutoRelockTimeWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAutoRelockTimeWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244991E04;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAutoRelockTimeWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeSoundVolumeWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244991EC0;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeSoundVolumeWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeSoundVolumeWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeSoundVolumeWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeSoundVolumeWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244992050;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeSoundVolumeWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeSoundVolumeWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244992178;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeSoundVolumeWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeOperatingModeWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244992234;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeOperatingModeWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeOperatingModeWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeOperatingModeWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeOperatingModeWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2449923C4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeOperatingModeWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeOperatingModeWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2449924EC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeOperatingModeWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeSupportedOperatingModesWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2449925A8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeSupportedOperatingModesWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeSupportedOperatingModesWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244992728;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeSupportedOperatingModesWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeSupportedOperatingModesWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244992850;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeSupportedOperatingModesWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeDefaultConfigurationRegisterWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_24499290C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeDefaultConfigurationRegisterWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeDefaultConfigurationRegisterWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244992A8C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeDefaultConfigurationRegisterWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeDefaultConfigurationRegisterWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244992BB4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeDefaultConfigurationRegisterWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeEnableLocalProgrammingWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244992C70;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeEnableLocalProgrammingWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeEnableLocalProgrammingWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeEnableLocalProgrammingWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeEnableLocalProgrammingWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244992E00;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeEnableLocalProgrammingWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeEnableLocalProgrammingWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244992F28;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeEnableLocalProgrammingWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeEnableOneTouchLockingWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244992FE4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeEnableOneTouchLockingWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeEnableOneTouchLockingWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeEnableOneTouchLockingWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeEnableOneTouchLockingWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244993174;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeEnableOneTouchLockingWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeEnableOneTouchLockingWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_24499329C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeEnableOneTouchLockingWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeEnableInsideStatusLEDWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244993358;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeEnableInsideStatusLEDWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeEnableInsideStatusLEDWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeEnableInsideStatusLEDWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeEnableInsideStatusLEDWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2449934E8;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeEnableInsideStatusLEDWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeEnableInsideStatusLEDWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244993610;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeEnableInsideStatusLEDWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeEnablePrivacyModeButtonWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2449936CC;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeEnablePrivacyModeButtonWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeEnablePrivacyModeButtonWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeEnablePrivacyModeButtonWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeEnablePrivacyModeButtonWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_24499385C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeEnablePrivacyModeButtonWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeEnablePrivacyModeButtonWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244993984;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeEnablePrivacyModeButtonWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeLocalProgrammingFeaturesWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244993A40;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeLocalProgrammingFeaturesWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeLocalProgrammingFeaturesWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeLocalProgrammingFeaturesWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeLocalProgrammingFeaturesWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244993BD0;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeLocalProgrammingFeaturesWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeLocalProgrammingFeaturesWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244993CF8;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeLocalProgrammingFeaturesWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeWrongCodeEntryLimitWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244993DB4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeWrongCodeEntryLimitWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeWrongCodeEntryLimitWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeWrongCodeEntryLimitWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeWrongCodeEntryLimitWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244993F44;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeWrongCodeEntryLimitWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeWrongCodeEntryLimitWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_24499406C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeWrongCodeEntryLimitWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeUserCodeTemporaryDisableTimeWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244994128;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeUserCodeTemporaryDisableTimeWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeUserCodeTemporaryDisableTimeWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeUserCodeTemporaryDisableTimeWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeUserCodeTemporaryDisableTimeWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2449942B8;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeUserCodeTemporaryDisableTimeWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeUserCodeTemporaryDisableTimeWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2449943E0;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeUserCodeTemporaryDisableTimeWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeSendPINOverTheAirWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_24499449C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeSendPINOverTheAirWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeSendPINOverTheAirWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeSendPINOverTheAirWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeSendPINOverTheAirWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_24499462C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeSendPINOverTheAirWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeSendPINOverTheAirWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244994754;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeSendPINOverTheAirWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRequirePINforRemoteOperationWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244994810;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRequirePINforRemoteOperationWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeRequirePINforRemoteOperationWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeRequirePINforRemoteOperationWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeRequirePINforRemoteOperationWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2449949A0;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRequirePINforRemoteOperationWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRequirePINforRemoteOperationWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244994AC8;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRequirePINforRemoteOperationWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeExpiringUserTimeoutWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244994B84;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeExpiringUserTimeoutWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeExpiringUserTimeoutWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeExpiringUserTimeoutWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeExpiringUserTimeoutWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244994D14;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeExpiringUserTimeoutWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeExpiringUserTimeoutWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244994E3C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeExpiringUserTimeoutWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeGeneratedCommandListWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244994EF8;
  v7[3] = &unk_265198C80;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeGeneratedCommandListWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeGeneratedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244995078;
  v26[3] = &unk_265198C80;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeGeneratedCommandListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeGeneratedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2449951A0;
  v18[3] = &unk_265198C80;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeGeneratedCommandListWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAcceptedCommandListWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_24499525C;
  v7[3] = &unk_265198C80;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAcceptedCommandListWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAcceptedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2449953DC;
  v26[3] = &unk_265198C80;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAcceptedCommandListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAcceptedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244995504;
  v18[3] = &unk_265198C80;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAcceptedCommandListWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAttributeListWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2449955C0;
  v7[3] = &unk_265198C80;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAttributeListWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAttributeListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244995740;
  v26[3] = &unk_265198C80;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAttributeListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAttributeListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244995868;
  v18[3] = &unk_265198C80;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAttributeListWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeFeatureMapWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244995924;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeFeatureMapWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeFeatureMapWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244995AA4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeFeatureMapWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeFeatureMapWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244995BCC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeFeatureMapWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeClusterRevisionWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244995C88;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeClusterRevisionWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeClusterRevisionWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  uint64_t v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  uint64_t v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    uint64_t v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244995E08;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeClusterRevisionWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeClusterRevisionWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  uint64_t v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244995F30;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeClusterRevisionWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (MTRBaseClusterDoorLock)initWithDevice:(MTRBaseDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6 = endpoint;
  id v8 = device;
  id v9 = queue;
  id v11 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v10, v6);
  uint64_t v13 = (MTRBaseClusterDoorLock *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

@end