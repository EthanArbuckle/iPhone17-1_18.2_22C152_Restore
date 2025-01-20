@interface MTRClusterDoorLock
- (MTRClusterDoorLock)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue;
- (NSDictionary)readAttributeAcceptedCommandListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeActuatorEnabledWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAttributeListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAutoRelockTimeWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeClusterRevisionWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeCredentialRulesSupportWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDefaultConfigurationRegisterWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDoorClosedEventsWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDoorOpenEventsWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDoorStateWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeEnableInsideStatusLEDWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeEnableLocalProgrammingWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeEnableOneTouchLockingWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeEnablePrivacyModeButtonWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeExpiringUserTimeoutWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeFeatureMapWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeGeneratedCommandListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeLEDSettingsWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeLanguageWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeLocalProgrammingFeaturesWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeLockStateWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeLockTypeWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeMaxPINCodeLengthWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeMaxRFIDCodeLengthWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeMinPINCodeLengthWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeMinRFIDCodeLengthWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeNumberOfCredentialsSupportedPerUserWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeNumberOfHolidaySchedulesSupportedWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeNumberOfPINUsersSupportedWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeNumberOfRFIDUsersSupportedWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeNumberOfTotalUsersSupportedWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeNumberOfWeekDaySchedulesSupportedPerUserWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeNumberOfYearDaySchedulesSupportedPerUserWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeOpenPeriodWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeOperatingModeWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRequirePINforRemoteOperationWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeSendPINOverTheAirWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeSoundVolumeWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeSupportedOperatingModesWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeUserCodeTemporaryDisableTimeWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeWrongCodeEntryLimitWithParams:(MTRReadParams *)params;
- (id)readAttributeAliroBLEAdvertisingVersionWithParams:(id)a3;
- (id)readAttributeAliroExpeditedTransactionSupportedProtocolVersionsWithParams:(id)a3;
- (id)readAttributeAliroGroupResolvingKeyWithParams:(id)a3;
- (id)readAttributeAliroReaderGroupIdentifierWithParams:(id)a3;
- (id)readAttributeAliroReaderGroupSubIdentifierWithParams:(id)a3;
- (id)readAttributeAliroReaderVerificationKeyWithParams:(id)a3;
- (id)readAttributeAliroSupportedBLEUWBProtocolVersionsWithParams:(id)a3;
- (id)readAttributeAppleAliroBLEAdvertisingVersionWithParams:(id)a3;
- (id)readAttributeAppleAliroExpeditedTransactionSupportedProtocolVersionsWithParams:(id)a3;
- (id)readAttributeAppleAliroGroupResolvingKeyWithParams:(id)a3;
- (id)readAttributeAppleAliroReaderGroupIdentifierWithParams:(id)a3;
- (id)readAttributeAppleAliroReaderGroupSubIdentifierWithParams:(id)a3;
- (id)readAttributeAppleAliroReaderVerificationKeyWithParams:(id)a3;
- (id)readAttributeAppleAliroSupportedBLEUWBProtocolVersionsWithParams:(id)a3;
- (id)readAttributeAppleNumberOfAliroCredentialIssuerKeysSupportedWithParams:(id)a3;
- (id)readAttributeAppleNumberOfAliroEndpointKeysSupportedWithParams:(id)a3;
- (id)readAttributeEventListWithParams:(id)a3;
- (id)readAttributeNumberOfAliroCredentialIssuerKeysSupportedWithParams:(id)a3;
- (id)readAttributeNumberOfAliroEndpointKeysSupportedWithParams:(id)a3;
- (void)appleClearAliroCredentialWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)appleClearAliroReaderConfigWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5;
- (void)appleClearAliroReaderConfigWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)appleGetAliroCredentialStatusWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)appleSetAliroCredentialWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)appleSetAliroReaderConfigWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)clearAliroReaderConfigWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5;
- (void)clearAliroReaderConfigWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)clearCredentialWithParams:(MTRDoorLockClusterClearCredentialParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)clearCredentialWithParams:(MTRDoorLockClusterClearCredentialParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)clearHolidayScheduleWithParams:(MTRDoorLockClusterClearHolidayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)clearHolidayScheduleWithParams:(MTRDoorLockClusterClearHolidayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)clearUserWithParams:(MTRDoorLockClusterClearUserParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)clearUserWithParams:(MTRDoorLockClusterClearUserParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)clearWeekDayScheduleWithParams:(MTRDoorLockClusterClearWeekDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)clearWeekDayScheduleWithParams:(MTRDoorLockClusterClearWeekDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)clearYearDayScheduleWithParams:(MTRDoorLockClusterClearYearDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)clearYearDayScheduleWithParams:(MTRDoorLockClusterClearYearDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)getCredentialStatusWithParams:(MTRDoorLockClusterGetCredentialStatusParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion;
- (void)getCredentialStatusWithParams:(MTRDoorLockClusterGetCredentialStatusParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler;
- (void)getHolidayScheduleWithParams:(MTRDoorLockClusterGetHolidayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion;
- (void)getHolidayScheduleWithParams:(MTRDoorLockClusterGetHolidayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler;
- (void)getUserWithParams:(MTRDoorLockClusterGetUserParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion;
- (void)getUserWithParams:(MTRDoorLockClusterGetUserParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler;
- (void)getWeekDayScheduleWithParams:(MTRDoorLockClusterGetWeekDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion;
- (void)getWeekDayScheduleWithParams:(MTRDoorLockClusterGetWeekDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler;
- (void)getYearDayScheduleWithParams:(MTRDoorLockClusterGetYearDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion;
- (void)getYearDayScheduleWithParams:(MTRDoorLockClusterGetYearDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler;
- (void)lockDoorWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5;
- (void)lockDoorWithParams:(MTRDoorLockClusterLockDoorParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)lockDoorWithParams:(MTRDoorLockClusterLockDoorParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)setAliroReaderConfigWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)setCredentialWithParams:(MTRDoorLockClusterSetCredentialParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion;
- (void)setCredentialWithParams:(MTRDoorLockClusterSetCredentialParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler;
- (void)setHolidayScheduleWithParams:(MTRDoorLockClusterSetHolidayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)setHolidayScheduleWithParams:(MTRDoorLockClusterSetHolidayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)setUserWithParams:(MTRDoorLockClusterSetUserParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)setUserWithParams:(MTRDoorLockClusterSetUserParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)setWeekDayScheduleWithParams:(MTRDoorLockClusterSetWeekDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)setWeekDayScheduleWithParams:(MTRDoorLockClusterSetWeekDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)setYearDayScheduleWithParams:(MTRDoorLockClusterSetYearDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)setYearDayScheduleWithParams:(MTRDoorLockClusterSetYearDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)unboltDoorWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5;
- (void)unboltDoorWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)unlockDoorWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5;
- (void)unlockDoorWithParams:(MTRDoorLockClusterUnlockDoorParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)unlockDoorWithParams:(MTRDoorLockClusterUnlockDoorParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)unlockWithTimeoutWithParams:(MTRDoorLockClusterUnlockWithTimeoutParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)unlockWithTimeoutWithParams:(MTRDoorLockClusterUnlockWithTimeoutParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeAutoRelockTimeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeAutoRelockTimeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeDoorClosedEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeDoorClosedEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeDoorOpenEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeDoorOpenEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeEnableInsideStatusLEDWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeEnableInsideStatusLEDWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeEnableLocalProgrammingWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeEnableLocalProgrammingWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeEnableOneTouchLockingWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeEnableOneTouchLockingWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeEnablePrivacyModeButtonWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeEnablePrivacyModeButtonWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeExpiringUserTimeoutWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeExpiringUserTimeoutWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeLEDSettingsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeLEDSettingsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeLanguageWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeLanguageWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeLocalProgrammingFeaturesWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeLocalProgrammingFeaturesWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeOpenPeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeOpenPeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeOperatingModeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeOperatingModeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeRequirePINforRemoteOperationWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeRequirePINforRemoteOperationWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeSendPINOverTheAirWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeSendPINOverTheAirWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeSoundVolumeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeSoundVolumeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeUserCodeTemporaryDisableTimeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeUserCodeTemporaryDisableTimeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeWrongCodeEntryLimitWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeWrongCodeEntryLimitWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
@end

@implementation MTRClusterDoorLock

- (void)lockDoorWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5
{
}

- (void)lockDoorWithParams:(MTRDoorLockClusterLockDoorParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterLockDoorParams);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_244C265F0;
  v33[3] = &unk_265198C08;
  id v14 = v13;
  id v34 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v33);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  if (v18) {
    v21 = (void *)v18;
  }
  else {
    v21 = &unk_26F9CBE90;
  }
  v22 = objc_msgSend_device(self, v19, v20);
  v25 = objc_msgSend_endpointID(self, v23, v24);
  v28 = objc_msgSend_serverSideProcessingTimeout(v10, v26, v27);
  v31 = objc_msgSend_callbackQueue(self, v29, v30);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v22, v32, (uint64_t)v25, &unk_26F9CC5C8, &unk_26F9CB500, v10, v11, v12, v21, v28, 0, v31, v15);
}

- (void)unlockDoorWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5
{
}

- (void)unlockDoorWithParams:(MTRDoorLockClusterUnlockDoorParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterUnlockDoorParams);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_244C26830;
  v33[3] = &unk_265198C08;
  id v14 = v13;
  id v34 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v33);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  if (v18) {
    v21 = (void *)v18;
  }
  else {
    v21 = &unk_26F9CBE90;
  }
  v22 = objc_msgSend_device(self, v19, v20);
  v25 = objc_msgSend_endpointID(self, v23, v24);
  v28 = objc_msgSend_serverSideProcessingTimeout(v10, v26, v27);
  v31 = objc_msgSend_callbackQueue(self, v29, v30);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v22, v32, (uint64_t)v25, &unk_26F9CC5C8, &unk_26F9CB590, v10, v11, v12, v21, v28, 0, v31, v15);
}

- (void)unlockWithTimeoutWithParams:(MTRDoorLockClusterUnlockWithTimeoutParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterUnlockWithTimeoutParams);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_244C26A5C;
  v33[3] = &unk_265198C08;
  id v14 = v13;
  id v34 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v33);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  if (v18) {
    v21 = (void *)v18;
  }
  else {
    v21 = &unk_26F9CBE90;
  }
  v22 = objc_msgSend_device(self, v19, v20);
  v25 = objc_msgSend_endpointID(self, v23, v24);
  v28 = objc_msgSend_serverSideProcessingTimeout(v10, v26, v27);
  v31 = objc_msgSend_callbackQueue(self, v29, v30);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v22, v32, (uint64_t)v25, &unk_26F9CC5C8, &unk_26F9CB5C0, v10, v11, v12, v21, v28, 0, v31, v15);
}

- (void)setWeekDayScheduleWithParams:(MTRDoorLockClusterSetWeekDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterSetWeekDayScheduleParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C26C7C;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  uint64_t v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  uint64_t v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CC5C8, &unk_26F9CB8D8, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)getWeekDayScheduleWithParams:(MTRDoorLockClusterGetWeekDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  v10 = params;
  id v33 = expectedDataValueDictionaries;
  v11 = expectedValueIntervalMs;
  v12 = completion;
  v32 = v12;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterGetWeekDayScheduleParams);
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_244C26EB4;
  v34[3] = &unk_265198C08;
  id v13 = v12;
  id v35 = v13;
  id v14 = (void *)MEMORY[0x2456969D0](v34);
  uint64_t v17 = objc_msgSend_timedInvokeTimeoutMs(v10, v15, v16);
  uint64_t v20 = objc_msgSend_device(self, v18, v19);
  uint64_t v23 = objc_msgSend_endpointID(self, v21, v22);
  uint64_t v26 = objc_msgSend_serverSideProcessingTimeout(v10, v24, v25);
  uint64_t v27 = objc_opt_class();
  uint64_t v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_26F9CC5C8, &unk_26F9CC5E0, v10, v33, v11, v17, v26, v27, v30, v14, v32);
}

- (void)clearWeekDayScheduleWithParams:(MTRDoorLockClusterClearWeekDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterClearWeekDayScheduleParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C270D0;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  uint64_t v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  uint64_t v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CC5C8, &unk_26F9CC5F8, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)setYearDayScheduleWithParams:(MTRDoorLockClusterSetYearDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterSetYearDayScheduleParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C272F0;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  uint64_t v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  uint64_t v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CC5C8, &unk_26F9CC610, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)getYearDayScheduleWithParams:(MTRDoorLockClusterGetYearDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  v10 = params;
  id v33 = expectedDataValueDictionaries;
  v11 = expectedValueIntervalMs;
  v12 = completion;
  v32 = v12;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterGetYearDayScheduleParams);
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_244C27528;
  v34[3] = &unk_265198C08;
  id v13 = v12;
  id v35 = v13;
  id v14 = (void *)MEMORY[0x2456969D0](v34);
  uint64_t v17 = objc_msgSend_timedInvokeTimeoutMs(v10, v15, v16);
  uint64_t v20 = objc_msgSend_device(self, v18, v19);
  uint64_t v23 = objc_msgSend_endpointID(self, v21, v22);
  uint64_t v26 = objc_msgSend_serverSideProcessingTimeout(v10, v24, v25);
  uint64_t v27 = objc_opt_class();
  uint64_t v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_26F9CC5C8, &unk_26F9CC628, v10, v33, v11, v17, v26, v27, v30, v14, v32);
}

- (void)clearYearDayScheduleWithParams:(MTRDoorLockClusterClearYearDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterClearYearDayScheduleParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C27744;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  uint64_t v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  uint64_t v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CC5C8, &unk_26F9CC640, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)setHolidayScheduleWithParams:(MTRDoorLockClusterSetHolidayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterSetHolidayScheduleParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C27964;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  uint64_t v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  uint64_t v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CC5C8, &unk_26F9CC658, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)getHolidayScheduleWithParams:(MTRDoorLockClusterGetHolidayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  v10 = params;
  id v33 = expectedDataValueDictionaries;
  v11 = expectedValueIntervalMs;
  v12 = completion;
  v32 = v12;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterGetHolidayScheduleParams);
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_244C27B9C;
  v34[3] = &unk_265198C08;
  id v13 = v12;
  id v35 = v13;
  id v14 = (void *)MEMORY[0x2456969D0](v34);
  uint64_t v17 = objc_msgSend_timedInvokeTimeoutMs(v10, v15, v16);
  uint64_t v20 = objc_msgSend_device(self, v18, v19);
  uint64_t v23 = objc_msgSend_endpointID(self, v21, v22);
  uint64_t v26 = objc_msgSend_serverSideProcessingTimeout(v10, v24, v25);
  uint64_t v27 = objc_opt_class();
  uint64_t v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_26F9CC5C8, &unk_26F9CC670, v10, v33, v11, v17, v26, v27, v30, v14, v32);
}

- (void)clearHolidayScheduleWithParams:(MTRDoorLockClusterClearHolidayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterClearHolidayScheduleParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C27DB8;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  uint64_t v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  uint64_t v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CC5C8, &unk_26F9CC688, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)setUserWithParams:(MTRDoorLockClusterSetUserParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterSetUserParams);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_244C27FE4;
  v33[3] = &unk_265198C08;
  id v14 = v13;
  id v34 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v33);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  if (v18) {
    v21 = (void *)v18;
  }
  else {
    v21 = &unk_26F9CBE90;
  }
  uint64_t v22 = objc_msgSend_device(self, v19, v20);
  uint64_t v25 = objc_msgSend_endpointID(self, v23, v24);
  v28 = objc_msgSend_serverSideProcessingTimeout(v10, v26, v27);
  v31 = objc_msgSend_callbackQueue(self, v29, v30);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v22, v32, (uint64_t)v25, &unk_26F9CC5C8, &unk_26F9CC6A0, v10, v11, v12, v21, v28, 0, v31, v15);
}

- (void)getUserWithParams:(MTRDoorLockClusterGetUserParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  v10 = params;
  id v33 = expectedDataValueDictionaries;
  v11 = expectedValueIntervalMs;
  v12 = completion;
  v32 = v12;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterGetUserParams);
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_244C2821C;
  v34[3] = &unk_265198C08;
  id v13 = v12;
  id v35 = v13;
  id v14 = (void *)MEMORY[0x2456969D0](v34);
  uint64_t v17 = objc_msgSend_timedInvokeTimeoutMs(v10, v15, v16);
  uint64_t v20 = objc_msgSend_device(self, v18, v19);
  uint64_t v23 = objc_msgSend_endpointID(self, v21, v22);
  uint64_t v26 = objc_msgSend_serverSideProcessingTimeout(v10, v24, v25);
  uint64_t v27 = objc_opt_class();
  uint64_t v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_26F9CC5C8, &unk_26F9CC6B8, v10, v33, v11, v17, v26, v27, v30, v14, v32);
}

- (void)clearUserWithParams:(MTRDoorLockClusterClearUserParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterClearUserParams);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_244C28444;
  v33[3] = &unk_265198C08;
  id v14 = v13;
  id v34 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v33);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  if (v18) {
    v21 = (void *)v18;
  }
  else {
    v21 = &unk_26F9CBE90;
  }
  uint64_t v22 = objc_msgSend_device(self, v19, v20);
  uint64_t v25 = objc_msgSend_endpointID(self, v23, v24);
  v28 = objc_msgSend_serverSideProcessingTimeout(v10, v26, v27);
  v31 = objc_msgSend_callbackQueue(self, v29, v30);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v22, v32, (uint64_t)v25, &unk_26F9CC5C8, &unk_26F9CC6D0, v10, v11, v12, v21, v28, 0, v31, v15);
}

- (void)setCredentialWithParams:(MTRDoorLockClusterSetCredentialParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  v10 = params;
  id v34 = expectedDataValueDictionaries;
  v11 = expectedValueIntervalMs;
  v12 = completion;
  id v33 = v12;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterSetCredentialParams);
  }
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = sub_244C28688;
  v35[3] = &unk_265198C08;
  id v13 = v12;
  id v36 = v13;
  id v14 = (void *)MEMORY[0x2456969D0](v35);
  uint64_t v17 = objc_msgSend_timedInvokeTimeoutMs(v10, v15, v16);
  if (v17) {
    uint64_t v20 = (void *)v17;
  }
  else {
    uint64_t v20 = &unk_26F9CBE90;
  }
  v21 = objc_msgSend_device(self, v18, v19);
  uint64_t v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  uint64_t v28 = objc_opt_class();
  v31 = objc_msgSend_callbackQueue(self, v29, v30);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v32, (uint64_t)v24, &unk_26F9CC5C8, &unk_26F9CC6E8, v10, v34, v11, v20, v27, v28, v31, v14, v33);
}

- (void)getCredentialStatusWithParams:(MTRDoorLockClusterGetCredentialStatusParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  v10 = params;
  id v33 = expectedDataValueDictionaries;
  v11 = expectedValueIntervalMs;
  v12 = completion;
  v32 = v12;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterGetCredentialStatusParams);
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_244C288BC;
  v34[3] = &unk_265198C08;
  id v13 = v12;
  id v35 = v13;
  id v14 = (void *)MEMORY[0x2456969D0](v34);
  uint64_t v17 = objc_msgSend_timedInvokeTimeoutMs(v10, v15, v16);
  uint64_t v20 = objc_msgSend_device(self, v18, v19);
  uint64_t v23 = objc_msgSend_endpointID(self, v21, v22);
  uint64_t v26 = objc_msgSend_serverSideProcessingTimeout(v10, v24, v25);
  uint64_t v27 = objc_opt_class();
  uint64_t v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_26F9CC5C8, &unk_26F9CC700, v10, v33, v11, v17, v26, v27, v30, v14, v32);
}

- (void)clearCredentialWithParams:(MTRDoorLockClusterClearCredentialParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterClearCredentialParams);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_244C28AE4;
  v33[3] = &unk_265198C08;
  id v14 = v13;
  id v34 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v33);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  if (v18) {
    v21 = (void *)v18;
  }
  else {
    v21 = &unk_26F9CBE90;
  }
  uint64_t v22 = objc_msgSend_device(self, v19, v20);
  uint64_t v25 = objc_msgSend_endpointID(self, v23, v24);
  uint64_t v28 = objc_msgSend_serverSideProcessingTimeout(v10, v26, v27);
  v31 = objc_msgSend_callbackQueue(self, v29, v30);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v22, v32, (uint64_t)v25, &unk_26F9CC5C8, &unk_26F9CC718, v10, v11, v12, v21, v28, 0, v31, v15);
}

- (void)unboltDoorWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5
{
}

- (void)unboltDoorWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRDoorLockClusterUnboltDoorParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterUnboltDoorParams);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_244C28D24;
  v33[3] = &unk_265198C08;
  id v14 = v13;
  id v34 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v33);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  if (v18) {
    v21 = (void *)v18;
  }
  else {
    v21 = &unk_26F9CBE90;
  }
  uint64_t v22 = objc_msgSend_device(self, v19, v20);
  uint64_t v25 = objc_msgSend_endpointID(self, v23, v24);
  uint64_t v28 = objc_msgSend_serverSideProcessingTimeout(v10, v26, v27);
  v31 = objc_msgSend_callbackQueue(self, v29, v30);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v22, v32, (uint64_t)v25, &unk_26F9CC5C8, &unk_26F9CC730, v10, v11, v12, v21, v28, 0, v31, v15);
}

- (void)setAliroReaderConfigWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRDoorLockClusterSetAliroReaderConfigParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterSetAliroReaderConfigParams);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_244C28F50;
  v33[3] = &unk_265198C08;
  id v14 = v13;
  id v34 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v33);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  if (v18) {
    v21 = (void *)v18;
  }
  else {
    v21 = &unk_26F9CBE90;
  }
  uint64_t v22 = objc_msgSend_device(self, v19, v20);
  uint64_t v25 = objc_msgSend_endpointID(self, v23, v24);
  uint64_t v28 = objc_msgSend_serverSideProcessingTimeout(v10, v26, v27);
  v31 = objc_msgSend_callbackQueue(self, v29, v30);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v22, v32, (uint64_t)v25, &unk_26F9CC5C8, &unk_26F9CC748, v10, v11, v12, v21, v28, 0, v31, v15);
}

- (void)clearAliroReaderConfigWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5
{
}

- (void)clearAliroReaderConfigWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRDoorLockClusterClearAliroReaderConfigParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterClearAliroReaderConfigParams);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_244C29190;
  v33[3] = &unk_265198C08;
  id v14 = v13;
  id v34 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v33);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  if (v18) {
    v21 = (void *)v18;
  }
  else {
    v21 = &unk_26F9CBE90;
  }
  uint64_t v22 = objc_msgSend_device(self, v19, v20);
  uint64_t v25 = objc_msgSend_endpointID(self, v23, v24);
  uint64_t v28 = objc_msgSend_serverSideProcessingTimeout(v10, v26, v27);
  v31 = objc_msgSend_callbackQueue(self, v29, v30);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v22, v32, (uint64_t)v25, &unk_26F9CC5C8, &unk_26F9CC760, v10, v11, v12, v21, v28, 0, v31, v15);
}

- (void)appleSetAliroCredentialWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRDoorLockClusterAppleSetAliroCredentialParams *)a3;
  id v34 = a4;
  id v11 = a5;
  id v12 = a6;
  id v33 = v12;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterAppleSetAliroCredentialParams);
  }
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = sub_244C293D4;
  v35[3] = &unk_265198C08;
  id v13 = v12;
  id v36 = v13;
  id v14 = (void *)MEMORY[0x2456969D0](v35);
  uint64_t v17 = objc_msgSend_timedInvokeTimeoutMs(v10, v15, v16);
  if (v17) {
    uint64_t v20 = (void *)v17;
  }
  else {
    uint64_t v20 = &unk_26F9CBE90;
  }
  v21 = objc_msgSend_device(self, v18, v19);
  uint64_t v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  uint64_t v28 = objc_opt_class();
  v31 = objc_msgSend_callbackQueue(self, v29, v30);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v32, (uint64_t)v24, &unk_26F9CC5C8, &unk_26F9CC778, v10, v34, v11, v20, v27, v28, v31, v14, v33);
}

- (void)appleGetAliroCredentialStatusWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRDoorLockClusterAppleGetAliroCredentialStatusParams *)a3;
  id v33 = a4;
  id v11 = a5;
  id v12 = a6;
  id v32 = v12;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterAppleGetAliroCredentialStatusParams);
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_244C29608;
  v34[3] = &unk_265198C08;
  id v13 = v12;
  id v35 = v13;
  id v14 = (void *)MEMORY[0x2456969D0](v34);
  uint64_t v17 = objc_msgSend_timedInvokeTimeoutMs(v10, v15, v16);
  uint64_t v20 = objc_msgSend_device(self, v18, v19);
  uint64_t v23 = objc_msgSend_endpointID(self, v21, v22);
  uint64_t v26 = objc_msgSend_serverSideProcessingTimeout(v10, v24, v25);
  uint64_t v27 = objc_opt_class();
  uint64_t v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_26F9CC5C8, &unk_26F9CC790, v10, v33, v11, v17, v26, v27, v30, v14, v32);
}

- (void)appleClearAliroCredentialWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRDoorLockClusterAppleClearAliroCredentialParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterAppleClearAliroCredentialParams);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_244C29830;
  v33[3] = &unk_265198C08;
  id v14 = v13;
  id v34 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v33);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  if (v18) {
    v21 = (void *)v18;
  }
  else {
    v21 = &unk_26F9CBE90;
  }
  uint64_t v22 = objc_msgSend_device(self, v19, v20);
  uint64_t v25 = objc_msgSend_endpointID(self, v23, v24);
  uint64_t v28 = objc_msgSend_serverSideProcessingTimeout(v10, v26, v27);
  v31 = objc_msgSend_callbackQueue(self, v29, v30);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v22, v32, (uint64_t)v25, &unk_26F9CC5C8, &unk_26F9CC7A8, v10, v11, v12, v21, v28, 0, v31, v15);
}

- (void)appleSetAliroReaderConfigWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRDoorLockClusterAppleSetAliroReaderConfigParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterAppleSetAliroReaderConfigParams);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_244C29A5C;
  v33[3] = &unk_265198C08;
  id v14 = v13;
  id v34 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v33);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  if (v18) {
    v21 = (void *)v18;
  }
  else {
    v21 = &unk_26F9CBE90;
  }
  uint64_t v22 = objc_msgSend_device(self, v19, v20);
  uint64_t v25 = objc_msgSend_endpointID(self, v23, v24);
  uint64_t v28 = objc_msgSend_serverSideProcessingTimeout(v10, v26, v27);
  v31 = objc_msgSend_callbackQueue(self, v29, v30);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v22, v32, (uint64_t)v25, &unk_26F9CC5C8, &unk_26F9CC7C0, v10, v11, v12, v21, v28, 0, v31, v15);
}

- (void)appleClearAliroReaderConfigWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5
{
}

- (void)appleClearAliroReaderConfigWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRDoorLockClusterAppleClearAliroReaderConfigParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTRDoorLockClusterAppleClearAliroReaderConfigParams);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_244C29C9C;
  v33[3] = &unk_265198C08;
  id v14 = v13;
  id v34 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v33);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  if (v18) {
    v21 = (void *)v18;
  }
  else {
    v21 = &unk_26F9CBE90;
  }
  uint64_t v22 = objc_msgSend_device(self, v19, v20);
  uint64_t v25 = objc_msgSend_endpointID(self, v23, v24);
  uint64_t v28 = objc_msgSend_serverSideProcessingTimeout(v10, v26, v27);
  v31 = objc_msgSend_callbackQueue(self, v29, v30);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v22, v32, (uint64_t)v25, &unk_26F9CC5C8, &unk_26F9CC7D8, v10, v11, v12, v21, v28, 0, v31, v15);
}

- (NSDictionary)readAttributeLockStateWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CB440, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeLockTypeWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CB548, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeActuatorEnabledWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CB758, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDoorStateWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CB530, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDoorOpenEventsWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CB608, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeDoorOpenEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeDoorOpenEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  uint64_t v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CC7F0, &unk_26F9CB608, v19, v8, v11);
}

- (NSDictionary)readAttributeDoorClosedEventsWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CB770, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeDoorClosedEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeDoorClosedEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  uint64_t v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CC7F0, &unk_26F9CB770, v19, v8, v11);
}

- (NSDictionary)readAttributeOpenPeriodWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CB668, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeOpenPeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeOpenPeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  uint64_t v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CC7F0, &unk_26F9CB668, v19, v8, v11);
}

- (NSDictionary)readAttributeNumberOfTotalUsersSupportedWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CB7B8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeNumberOfPINUsersSupportedWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CB7D0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeNumberOfRFIDUsersSupportedWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CB7E8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeNumberOfWeekDaySchedulesSupportedPerUserWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CB800, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeNumberOfYearDaySchedulesSupportedPerUserWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CB9F8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeNumberOfHolidaySchedulesSupportedWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CBA10, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeMaxPINCodeLengthWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CBB00, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeMinPINCodeLengthWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CBB18, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeMaxRFIDCodeLengthWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CBB30, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeMinRFIDCodeLengthWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CBB48, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeCredentialRulesSupportWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CBB60, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeNumberOfCredentialsSupportedPerUserWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CB818, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeLanguageWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CBCB0, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeLanguageWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeLanguageWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  uint64_t v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CC7F0, &unk_26F9CBCB0, v19, v8, v11);
}

- (NSDictionary)readAttributeLEDSettingsWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CBCC8, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeLEDSettingsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeLEDSettingsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  uint64_t v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CC7F0, &unk_26F9CBCC8, v19, v8, v11);
}

- (NSDictionary)readAttributeAutoRelockTimeWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CBCE0, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeAutoRelockTimeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeAutoRelockTimeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  uint64_t v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CC7F0, &unk_26F9CBCE0, v19, v8, v11);
}

- (NSDictionary)readAttributeSoundVolumeWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CBCF8, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeSoundVolumeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeSoundVolumeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  uint64_t v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CC7F0, &unk_26F9CBCF8, v19, v8, v11);
}

- (NSDictionary)readAttributeOperatingModeWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CB8F0, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeOperatingModeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeOperatingModeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  uint64_t v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CC7F0, &unk_26F9CB8F0, v19, v8, v11);
}

- (NSDictionary)readAttributeSupportedOperatingModesWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CBD10, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDefaultConfigurationRegisterWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CBD28, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeEnableLocalProgrammingWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CB938, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeEnableLocalProgrammingWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeEnableLocalProgrammingWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  uint64_t v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CC7F0, &unk_26F9CB938, v19, v8, v11);
}

- (NSDictionary)readAttributeEnableOneTouchLockingWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CBA40, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeEnableOneTouchLockingWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeEnableOneTouchLockingWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  uint64_t v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CC7F0, &unk_26F9CBA40, v19, v8, v11);
}

- (NSDictionary)readAttributeEnableInsideStatusLEDWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CBA70, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeEnableInsideStatusLEDWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeEnableInsideStatusLEDWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  uint64_t v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CC7F0, &unk_26F9CBA70, v19, v8, v11);
}

- (NSDictionary)readAttributeEnablePrivacyModeButtonWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CBA88, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeEnablePrivacyModeButtonWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeEnablePrivacyModeButtonWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  uint64_t v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CC7F0, &unk_26F9CBA88, v19, v8, v11);
}

- (NSDictionary)readAttributeLocalProgrammingFeaturesWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CBAA0, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeLocalProgrammingFeaturesWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeLocalProgrammingFeaturesWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  uint64_t v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CC7F0, &unk_26F9CBAA0, v19, v8, v11);
}

- (NSDictionary)readAttributeWrongCodeEntryLimitWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CBB90, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeWrongCodeEntryLimitWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeWrongCodeEntryLimitWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  uint64_t v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CC7F0, &unk_26F9CBB90, v19, v8, v11);
}

- (NSDictionary)readAttributeUserCodeTemporaryDisableTimeWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CBBC0, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeUserCodeTemporaryDisableTimeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeUserCodeTemporaryDisableTimeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  uint64_t v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CC7F0, &unk_26F9CBBC0, v19, v8, v11);
}

- (NSDictionary)readAttributeSendPINOverTheAirWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CBBF0, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeSendPINOverTheAirWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeSendPINOverTheAirWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  uint64_t v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CC7F0, &unk_26F9CBBF0, v19, v8, v11);
}

- (NSDictionary)readAttributeRequirePINforRemoteOperationWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CBC20, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeRequirePINforRemoteOperationWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeRequirePINforRemoteOperationWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  uint64_t v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CC7F0, &unk_26F9CBC20, v19, v8, v11);
}

- (NSDictionary)readAttributeExpiringUserTimeoutWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CBC80, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeExpiringUserTimeoutWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeExpiringUserTimeoutWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  uint64_t v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CC7F0, &unk_26F9CBC80, v19, v8, v11);
}

- (id)readAttributeAliroReaderVerificationKeyWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CC370, v4);

  return v12;
}

- (id)readAttributeAliroReaderGroupIdentifierWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CC3A0, v4);

  return v12;
}

- (id)readAttributeAliroReaderGroupSubIdentifierWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CC808, v4);

  return v12;
}

- (id)readAttributeAliroExpeditedTransactionSupportedProtocolVersionsWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CC820, v4);

  return v12;
}

- (id)readAttributeAliroGroupResolvingKeyWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CC838, v4);

  return v12;
}

- (id)readAttributeAliroSupportedBLEUWBProtocolVersionsWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CC850, v4);

  return v12;
}

- (id)readAttributeAliroBLEAdvertisingVersionWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CC868, v4);

  return v12;
}

- (id)readAttributeNumberOfAliroCredentialIssuerKeysSupportedWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CC880, v4);

  return v12;
}

- (id)readAttributeNumberOfAliroEndpointKeysSupportedWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CC898, v4);

  return v12;
}

- (NSDictionary)readAttributeGeneratedCommandListWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CB458, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcceptedCommandListWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CB470, v4);

  return (NSDictionary *)v12;
}

- (id)readAttributeEventListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CB560, v4);

  return v12;
}

- (NSDictionary)readAttributeAttributeListWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CB488, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeFeatureMapWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CB4A0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeClusterRevisionWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CB4B8, v4);

  return (NSDictionary *)v12;
}

- (id)readAttributeAppleAliroReaderVerificationKeyWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CC8B0, v4);

  return v12;
}

- (id)readAttributeAppleAliroReaderGroupIdentifierWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CC8C8, v4);

  return v12;
}

- (id)readAttributeAppleAliroReaderGroupSubIdentifierWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CC8E0, v4);

  return v12;
}

- (id)readAttributeAppleAliroExpeditedTransactionSupportedProtocolVersionsWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CC8F8, v4);

  return v12;
}

- (id)readAttributeAppleAliroGroupResolvingKeyWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CC910, v4);

  return v12;
}

- (id)readAttributeAppleAliroSupportedBLEUWBProtocolVersionsWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CC928, v4);

  return v12;
}

- (id)readAttributeAppleAliroBLEAdvertisingVersionWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CC940, v4);

  return v12;
}

- (id)readAttributeAppleNumberOfAliroCredentialIssuerKeysSupportedWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CC958, v4);

  return v12;
}

- (id)readAttributeAppleNumberOfAliroEndpointKeysSupportedWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC7F0, &unk_26F9CC970, v4);

  return v12;
}

- (MTRClusterDoorLock)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6 = endpoint;
  v8 = device;
  uint64_t v9 = queue;
  id v11 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v10, v6);
  uint64_t v13 = (MTRClusterDoorLock *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

- (void)lockDoorWithParams:(MTRDoorLockClusterLockDoorParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)unlockDoorWithParams:(MTRDoorLockClusterUnlockDoorParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)unlockWithTimeoutWithParams:(MTRDoorLockClusterUnlockWithTimeoutParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)setWeekDayScheduleWithParams:(MTRDoorLockClusterSetWeekDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)getWeekDayScheduleWithParams:(MTRDoorLockClusterGetWeekDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler
{
  id v10 = completionHandler;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_244C2DE0C;
  v13[3] = &unk_265199090;
  id v14 = v10;
  id v11 = v10;
  objc_msgSend_getWeekDayScheduleWithParams_expectedValues_expectedValueInterval_completion_(self, v12, (uint64_t)params, expectedDataValueDictionaries, expectedValueIntervalMs, v13);
}

- (void)clearWeekDayScheduleWithParams:(MTRDoorLockClusterClearWeekDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)setYearDayScheduleWithParams:(MTRDoorLockClusterSetYearDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)getYearDayScheduleWithParams:(MTRDoorLockClusterGetYearDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler
{
  id v10 = completionHandler;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_244C2DEF8;
  v13[3] = &unk_2651990B8;
  id v14 = v10;
  id v11 = v10;
  objc_msgSend_getYearDayScheduleWithParams_expectedValues_expectedValueInterval_completion_(self, v12, (uint64_t)params, expectedDataValueDictionaries, expectedValueIntervalMs, v13);
}

- (void)clearYearDayScheduleWithParams:(MTRDoorLockClusterClearYearDayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)setHolidayScheduleWithParams:(MTRDoorLockClusterSetHolidayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)getHolidayScheduleWithParams:(MTRDoorLockClusterGetHolidayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler
{
  id v10 = completionHandler;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_244C2DFE4;
  v13[3] = &unk_2651990E0;
  id v14 = v10;
  id v11 = v10;
  objc_msgSend_getHolidayScheduleWithParams_expectedValues_expectedValueInterval_completion_(self, v12, (uint64_t)params, expectedDataValueDictionaries, expectedValueIntervalMs, v13);
}

- (void)clearHolidayScheduleWithParams:(MTRDoorLockClusterClearHolidayScheduleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)setUserWithParams:(MTRDoorLockClusterSetUserParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)getUserWithParams:(MTRDoorLockClusterGetUserParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler
{
  id v10 = completionHandler;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_244C2E0D0;
  v13[3] = &unk_265199108;
  id v14 = v10;
  id v11 = v10;
  objc_msgSend_getUserWithParams_expectedValues_expectedValueInterval_completion_(self, v12, (uint64_t)params, expectedDataValueDictionaries, expectedValueIntervalMs, v13);
}

- (void)clearUserWithParams:(MTRDoorLockClusterClearUserParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)setCredentialWithParams:(MTRDoorLockClusterSetCredentialParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler
{
  id v10 = completionHandler;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_244C2E1B8;
  v13[3] = &unk_265199130;
  id v14 = v10;
  id v11 = v10;
  objc_msgSend_setCredentialWithParams_expectedValues_expectedValueInterval_completion_(self, v12, (uint64_t)params, expectedDataValueDictionaries, expectedValueIntervalMs, v13);
}

- (void)getCredentialStatusWithParams:(MTRDoorLockClusterGetCredentialStatusParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler
{
  id v10 = completionHandler;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_244C2E29C;
  v13[3] = &unk_265199158;
  id v14 = v10;
  id v11 = v10;
  objc_msgSend_getCredentialStatusWithParams_expectedValues_expectedValueInterval_completion_(self, v12, (uint64_t)params, expectedDataValueDictionaries, expectedValueIntervalMs, v13);
}

- (void)clearCredentialWithParams:(MTRDoorLockClusterClearCredentialParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

@end