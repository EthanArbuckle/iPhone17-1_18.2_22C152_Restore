@interface CoreTelephonyClient
+ (id)sharedMultiplexer;
- ($0AC6E346AE4835514AAA8AC86D8F4844)checkCellularDiagnosticsStatusDetails:(id *)a3;
- ($96EE1C12479E9B303E9C2794B92A11A2)getPrivacyProxyState:(id)a3 error:(id *)a4;
- ($96EE1C12479E9B303E9C2794B92A11A2)reliableNetworkFallback:(id)a3 error:(id *)a4;
- (BOOL)_decodeCardData:(id)a3 smdp:(id *)a4 matchingID:(id *)a5 OID:(id *)a6;
- (BOOL)acknowledgeIncomingMessages:(id)a3 withMessageIDList:(id)a4 withError:(id *)a5;
- (BOOL)addParticipants:(id)a3 toGroupChat:(id)a4 withParticipantsToAdd:(id)a5 withOperationID:(id)a6 withError:(id *)a7;
- (BOOL)changeIcon:(id)a3 forGroupChat:(id)a4 withNewIcon:(id)a5 withOperationID:(id)a6 withError:(id *)a7;
- (BOOL)changeSubject:(id)a3 forGroupChat:(id)a4 withNewSubject:(id)a5 withOperationID:(id)a6 withError:(id *)a7;
- (BOOL)context:(id)a3 isMandatoryDisabledVoLTE:(id *)a4;
- (BOOL)context:(id)a3 isProtectedIdentitySupported:(id)a4 error:(id *)a5;
- (BOOL)create:(id)a3 groupChat:(id)a4 withOperationID:(id)a5 withError:(id *)a6;
- (BOOL)deleteChat:(id)a3 chat:(id)a4 withError:(id *)a5;
- (BOOL)disableBusinessMessaging:(id)a3 withError:(id *)a4;
- (BOOL)disableLazuli:(id)a3 withError:(id *)a4;
- (BOOL)enableBusinessMessaging:(id)a3 withError:(id *)a4;
- (BOOL)enableLazuli:(id)a3 withError:(id *)a4;
- (BOOL)exit:(id)a3 groupChat:(id)a4 withOperationID:(id)a5 withError:(id *)a6;
- (BOOL)fetchRemoteCapabilities:(id)a3 forDestination:(id)a4 withOptions:(id)a5 withOperationID:(id)a6 withError:(id *)a7;
- (BOOL)fetchRenderInformation:(id)a3 forChatBot:(id)a4 withOperationID:(id)a5 withError:(id *)a6;
- (BOOL)get2GSwitchEnabledSync:(id *)a3;
- (BOOL)get2GUserPreferenceSync:(id *)a3;
- (BOOL)getInternationalDataAccessStatusSync:(id *)a3;
- (BOOL)getInternationalDataAccessSync:(id)a3 error:(id *)a4;
- (BOOL)getSupportDynamicDataSimSwitchSync:(id *)a3;
- (BOOL)hasDedicatedBearerSupport;
- (BOOL)interfaceCostExpensive:(id)a3 error:(id *)a4;
- (BOOL)isAnyPlanTransferableFromThisDeviceOrError:(id *)a3;
- (BOOL)isAttachApnSettingAllowed:(id)a3 error:(id *)a4;
- (BOOL)isAutofilleSIMIdAllowedForDomain:(id)a3 clientBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)isAutofilleSIMIdAllowedForDomain:(id)a3 error:(id *)a4;
- (BOOL)isDedicatedBearerPresent:(id)a3 error:(id *)a4;
- (BOOL)isEmergencyNumber:(id)a3 number:(id)a4 error:(id *)a5;
- (BOOL)isEmergencyNumberWithWhitelistIncluded:(id)a3 number:(id)a4 error:(id *)a5;
- (BOOL)isHighDataModeSupported:(id)a3 error:(id *)a4;
- (BOOL)isPNRSupported:(id)a3 outError:(id *)a4;
- (BOOL)isPhoneNumberCredentialValid:(id)a3 outError:(id *)a4;
- (BOOL)isPrivateNetworkEvaluationNeeded:(id *)a3;
- (BOOL)isPrivateNetworkSIM:(id)a3 error:(id *)a4;
- (BOOL)isSmartDataModeSupported:(id *)a3;
- (BOOL)isTetheringEditingSupported:(id)a3 error:(id *)a4;
- (BOOL)lowDataMode:(id)a3 error:(id *)a4;
- (BOOL)overriddenInterfaceCostInexpensive:(id *)a3;
- (BOOL)releaseBootstrapDataService:(id *)a3;
- (BOOL)removeGeofenceProfile;
- (BOOL)removeParticipants:(id)a3 fromGroupChat:(id)a4 withParticipantsToRemove:(id)a5 withOperationID:(id)a6 withError:(id *)a7;
- (BOOL)reportChatbotSpam:(id)a3 forChatbot:(id)a4 withSpamReportInfo:(id)a5 andOperationID:(id)a6 withError:(id *)a7;
- (BOOL)reportLazuliSpamWithContext:(id)a3 destination:(id)a4 spamReportInfo:(id)a5 operationID:(id)a6 error:(id *)a7;
- (BOOL)requestBootstrapDataService:(id *)a3;
- (BOOL)restoreToSystemBundles:(id *)a3;
- (BOOL)revokeMessage:(id)a3 withRevokeData:(id)a4 withMessageID:(id)a5 withError:(id *)a6;
- (BOOL)sendComposingIndicator:(id)a3 toGroupDestination:(id)a4 withMessageID:(id)a5 withIndication:(id)a6 withError:(id *)a7;
- (BOOL)sendComposingIndicatorForContext:(id)a3 to:(id)a4 messageID:(id)a5 indication:(id)a6 error:(id *)a7;
- (BOOL)sendDeviceAction:(id)a3 to:(id)a4 withMessageID:(id)a5 withAction:(id)a6 withError:(id *)a7;
- (BOOL)sendDeviceSettings:(id)a3 to:(id)a4 withMessageID:(id)a5 withSetting:(id)a6 withError:(id *)a7;
- (BOOL)sendDispositionNotificationMessage:(id)a3 to:(id)a4 withMessageID:(id)a5 withDisposition:(int64_t)a6 forMessageID:(id)a7 withError:(id *)a8;
- (BOOL)sendFileTransferMessage:(id)a3 to:(id)a4 withMessageID:(id)a5 withFileInformation:(id)a6 withError:(id *)a7;
- (BOOL)sendFileTransferMessage:(id)a3 toGroupDestination:(id)a4 withMessageID:(id)a5 withFileInformation:(id)a6 withError:(id *)a7;
- (BOOL)sendGeolocationMessage:(id)a3 to:(id)a4 withMessageID:(id)a5 withGeoPush:(id)a6 withError:(id *)a7;
- (BOOL)sendGeolocationMessage:(id)a3 toGroupDestination:(id)a4 withMessageID:(id)a5 withGeoPush:(id)a6 withError:(id *)a7;
- (BOOL)sendGroupDispositionNotificationMessage:(id)a3 toGroup:(id)a4 to:(id)a5 withMessageID:(id)a6 withDisposition:(int64_t)a7 forMessageID:(id)a8 withError:(id *)a9;
- (BOOL)sendOneToManyFileTransferMessage:(id)a3 to:(id)a4 withMessageID:(id)a5 withDescriptor:(id)a6 withError:(id *)a7;
- (BOOL)sendOneToManyGeolocationMessage:(id)a3 to:(id)a4 withMessageID:(id)a5 withGeoPush:(id)a6 withError:(id *)a7;
- (BOOL)sendOneToManyTextMessage:(id)a3 to:(id)a4 withMessageID:(id)a5 withMessage:(id)a6 withError:(id *)a7;
- (BOOL)sendResponseForSuggestedAction:(id)a3 to:(id)a4 withMessageID:(id)a5 response:(id)a6 withError:(id *)a7;
- (BOOL)sendResponseForSuggestedReply:(id)a3 to:(id)a4 withMessageID:(id)a5 response:(id)a6 withError:(id *)a7;
- (BOOL)sendTextMessage:(id)a3 to:(id)a4 withMessageID:(id)a5 withMessage:(id)a6 withError:(id *)a7;
- (BOOL)sendTextMessage:(id)a3 toGroupDestination:(id)a4 withMessageID:(id)a5 withMessage:(id)a6 withError:(id *)a7;
- (BOOL)sendTravelBuddyCAEvent:(id)a3 carrierName:(id)a4 error:(id *)a5;
- (BOOL)shouldShowUserWarningWhenDialingCallOnContext:(id)a3 error:(id *)a4;
- (BOOL)smartDataMode:(id)a3 error:(id *)a4;
- (BOOL)supportsCellular;
- (BOOL)supportsEmbeddedSIM;
- (BOOL)supportsPlanProvisioning:(id)a3 carrierDescriptors:(id)a4 smdpUrl:(id)a5 iccidPrefix:(id)a6;
- (BOOL)supportsRequestWithSelector:(SEL)a3;
- (BOOL)supportsSelector:(SEL)a3 withContext:(id)a4 error:(id *)a5;
- (BOOL)updateGeofenceProfile:(id)a3;
- (BOOL)updateSecureIntentData:(id)a3 error:(id *)a4;
- (BOOL)userDidExitWebsheetFlowForPlan:(id)a3 error:(id *)a4;
- (CoreTelephonyClient)init;
- (CoreTelephonyClient)initWithQueue:(dispatch_queue_s *)a3;
- (CoreTelephonyClient)initWithQueue:(dispatch_queue_s *)a3 multiplexer:(id)a4;
- (CoreTelephonyClientMux)mux;
- (__CTAssertionType)createCTAssertionForConnectionType:(int)a3 allocator:(__CFAllocator *)a4 proxy:(id)a5;
- (id).cxx_construct;
- (id)addDedicatedBearer:(id)a3 error:(id *)a4;
- (id)billingCycleEndDatesForLastPeriods:(unint64_t)a3 error:(id *)a4;
- (id)bootstrapPlanTransferForEndpoint:(unint64_t)a3;
- (id)bootstrapPlanTransferForEndpoint:(unint64_t)a3 usingMessageSession:(id)a4;
- (id)cachedValueForSelector:(SEL)a3;
- (id)cancelSIMToolkitUSSDSession:(id)a3;
- (id)checkEmbeddedSimHealthWithError:(id *)a3;
- (id)context:(id)a3 addPhoneServicesDevice:(id)a4;
- (id)context:(id)a3 canSetCapability:(id)a4 allowed:(BOOL *)a5 with:(id *)a6;
- (id)context:(id)a3 evaluateMobileSubscriberIdentity:(id)a4;
- (id)context:(id)a3 getAttachApnSettings:(id *)a4;
- (id)context:(id)a3 getCapability:(id)a4 status:(BOOL *)a5 with:(id *)a6;
- (id)context:(id)a3 getCarrierBundleValue:(id)a4 error:(id *)a5;
- (id)context:(id)a3 getEncryptedIdentity:(id)a4 error:(id *)a5;
- (id)context:(id)a3 getPhoneNumberSignature:(id *)a4;
- (id)context:(id)a3 getPseudoIdentityFor:(id)a4 error:(id *)a5;
- (id)context:(id)a3 getSystemCapabilities:(id *)a4;
- (id)context:(id)a3 mandatoryDisableVoLTE:(BOOL)a4;
- (id)context:(id)a3 modifyAttachApnSettings:(id)a4;
- (id)context:(id)a3 recheckPhoneServicesAccountStatus:(id)a4;
- (id)context:(id)a3 removePhoneServicesDevice:(id)a4;
- (id)context:(id)a3 setCapability:(id)a4 enabled:(BOOL)a5 with:(id)a6;
- (id)copyBundleIdentifier:(id)a3 bundleType:(id)a4 error:(id *)a5;
- (id)copyBundleLocation:(id)a3 bundleType:(id)a4 error:(id *)a5;
- (id)copyBundleVersion:(id)a3 bundleType:(id)a4 error:(id *)a5;
- (id)copyCarrierBundleLocation:(id)a3 error:(id *)a4;
- (id)copyCarrierBundleValue:(id)a3 key:(id)a4 bundleType:(id)a5 error:(id *)a6;
- (id)copyCarrierBundleValue:(id)a3 keyHierarchy:(id)a4 bundleType:(id)a5 error:(id *)a6;
- (id)copyCarrierBundleValueWithCountryBundleLookup:(id)a3 keyHierarchy:(id)a4 matchingInfo:(id)a5 error:(id *)a6;
- (id)copyCarrierBundleValueWithDefault:(id)a3 key:(id)a4 bundleType:(id)a5 error:(id *)a6;
- (id)copyCarrierBundleValueWithDefault:(id)a3 keyHierarchy:(id)a4 bundleType:(id)a5 error:(id *)a6;
- (id)copyCarrierBundleValues:(id)a3 keyHierarchies:(id)a4 defaultValues:(id)a5 bundleType:(id)a6 withFallbackBundleCheck:(BOOL)a7 error:(id *)a8;
- (id)copyCarrierBundleValues:(id)a3 keys:(id)a4 defaultValues:(id)a5 bundleType:(id)a6 withFallbackBundleCheck:(BOOL)a7 error:(id *)a8;
- (id)copyCarrierBundleVersion:(id)a3 error:(id *)a4;
- (id)copyEmergencyModeWithError:(id *)a3;
- (id)copyGid1:(id)a3 error:(id *)a4;
- (id)copyGid2:(id)a3 error:(id *)a4;
- (id)copyIsInHomeCountry:(id)a3 error:(id *)a4;
- (id)copyLabel:(id)a3 error:(id *)a4;
- (id)copyLastKnownMobileCountryCode:(id)a3 error:(id *)a4;
- (id)copyLastKnownMobileSubscriberCountryCode:(id)a3 error:(id *)a4;
- (id)copyMccOrPlmnsListForIso3CountryCode:(id)a3 error:(id *)a4;
- (id)copyMobileCountryCode:(id)a3 error:(id *)a4;
- (id)copyMobileNetworkCode:(id)a3 error:(id *)a4;
- (id)copyMobileSubscriberCountryCode:(id)a3 error:(id *)a4;
- (id)copyMobileSubscriberIdentity:(id)a3 error:(id *)a4;
- (id)copyMobileSubscriberIso3CountryCode:(id)a3 MNC:(id)a4 error:(id *)a5;
- (id)copyMobileSubscriberIsoCountryCode:(id)a3 error:(id *)a4;
- (id)copyMobileSubscriberIsoSubregionCode:(id)a3 MNC:(id)a4 error:(id *)a5;
- (id)copyMobileSubscriberNetworkCode:(id)a3 error:(id *)a4;
- (id)copyNetworkSelectionInfo:(id)a3 error:(id *)a4;
- (id)copyPublicCellId:(id)a3 error:(id *)a4;
- (id)copyRadioAccessTechnology:(id)a3 error:(id *)a4;
- (id)copyRegistrationDisplayStatus:(id)a3 error:(id *)a4;
- (id)copyRegistrationStatus:(id)a3 error:(id *)a4;
- (id)copySIMIdentity:(id)a3 error:(id *)a4;
- (id)copyServingPlmn:(id)a3 error:(id *)a4;
- (id)decodeSuggestionsBase64:(id)a3 withBase64String:(id)a4 withError:(id *)a5;
- (id)delegate;
- (id)deletePersonalWallet:(id)a3;
- (id)dispatchBlockToClientAsync:(dispatch_queue_s *);
- (id)dispatchBlockToClientAsync:(id *)a1;
- (id)endPlanTransferForEndPoint:(unint64_t)a3;
- (id)enterLoopBackMode;
- (id)fetchBasebandTicket:(BOOL)a3 withError:(id *)a4;
- (id)fetchCallBarringValue:(id)a3 facility:(int)a4 callClass:(int)a5 password:(id)a6;
- (id)fetchCallForwardingValue:(id)a3 reason:(int)a4 callClass:(int)a5;
- (id)fetchCallWaitingValue:(id)a3 callClass:(int)a4;
- (id)fetchCallingLineIdRestrictionValue:(id)a3;
- (id)fetchCallingLinePresentationValue:(id)a3;
- (id)fetchConnectedLineIdRestrictionValue:(id)a3;
- (id)fetchConnectedLinePresentationValue:(id)a3;
- (id)fetchRoadsideProvidersWithContext:(id)a3 error:(id *)a4;
- (id)fetchSIMLockValue:(id)a3 error:(id *)a4;
- (id)forceRollAllTransportKeys;
- (id)getActivationPolicyState:(id *)a3;
- (id)getActiveConnections:(id)a3 error:(id *)a4;
- (id)getActiveContexts:(id *)a3;
- (id)getAllEmergencyNumbersWithError:(id *)a3;
- (id)getAllowDevSignedCarrierBundlesFlag;
- (id)getBandInfo:(id)a3 error:(id *)a4;
- (id)getBasebandRadioFrequencyFrontEndScanData:(id *)a3;
- (id)getBootstrapState:(id *)a3;
- (id)getCallCapabilities:(id)a3 error:(id *)a4;
- (id)getCellularUsageWorkspaceInfo:(id *)a3;
- (id)getConfiguredApns:(id)a3 error:(id *)a4;
- (id)getConnectionAssistantConfigWithError:(id *)a3;
- (id)getConnectionAssistantServicePlotWithError:(id *)a3;
- (id)getConnectionAssistantStateWithError:(id *)a3;
- (id)getConnectionAvailability:(id)a3 connectionType:(int)a4 error:(id *)a5;
- (id)getConnectionState:(id)a3 connectionType:(int)a4 error:(id *)a5;
- (id)getCountryBundleIdentifierForCountryCode:(id)a3 error:(id *)a4;
- (id)getCountryBundleLocationForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)getCountryBundleLocationForMatchingInfo:(id)a3 error:(id *)a4;
- (id)getCurrentDataServiceDescriptorSync:(id *)a3;
- (id)getCurrentDataSubscriptionContextSync:(id *)a3;
- (id)getCurrentRat:(id)a3 error:(id *)a4;
- (id)getDataStatus:(id)a3 error:(id *)a4;
- (id)getDataStatusBasic:(id)a3 error:(id *)a4;
- (id)getDescriptorsForDomain:(int64_t)a3 error:(id *)a4;
- (id)getEmergencyTextNumbers:(id)a3 error:(id *)a4;
- (id)getEncryptionStatus:(id)a3 error:(id *)a4;
- (id)getEnglishCarrierNameFor:(id)a3 error:(id *)a4;
- (id)getEvolvedSubscriptionLabelID:(id)a3 error:(id *)a4;
- (id)getIMSRegistrationStatus:(id)a3 error:(id *)a4;
- (id)getInternetConnectionAvailabilitySync:(id *)a3;
- (id)getInternetConnectionStateSync:(id *)a3;
- (id)getInternetDataStatusBasicSync:(id *)a3;
- (id)getInternetDataStatusSync:(id *)a3;
- (id)getLastKnownSimDeactivationInfoFor:(id)a3 error:(id *)a4;
- (id)getListOfPresentDedicatedBearers;
- (id)getLocalDeviceIdentifierForSIMTransfer:(id *)a3;
- (id)getLocalPolicies:(id)a3 error:(id *)a4;
- (id)getLocalizedOperatorName:(id)a3 error:(id *)a4;
- (id)getMobileEquipmentInfo:(id *)a3;
- (id)getMobileEquipmentInfoFor:(id)a3 error:(id *)a4;
- (id)getMobileSubscriberHomeCountryList:(id)a3 error:(id *)a4;
- (id)getNRStatus:(id)a3 error:(id *)a4;
- (id)getOperatorMultiPartyCallCountMaximum:(id)a3 error:(id *)a4;
- (id)getOperatorName:(id)a3 error:(id *)a4;
- (id)getPNRContext:(id)a3 outError:(id *)a4;
- (id)getPacketContextCount:(unsigned int *)a3;
- (id)getPhoneNumber:(id)a3 error:(id *)a4;
- (id)getPhoneServicesDeviceInfo:(id *)a3;
- (id)getPhoneServicesDeviceList:(id *)a3;
- (id)getPhonebookEntry:(id)a3 atIndex:(int)a4 error:(id *)a5;
- (id)getPrefForKey:(id)a3 heirarchy:(id)a4 storage:(id)a5 error:(id *)a6;
- (id)getPreferredDataServiceDescriptorSync:(id *)a3;
- (id)getPreferredDataSubscriptionContextSync:(id *)a3;
- (id)getPrivateNetworkCapabilitiesForContext:(id)a3 error:(id *)a4;
- (id)getPrivateNetworkSimInfoForContext:(id)a3 error:(id *)a4;
- (id)getProvisioningServerURL:(id)a3 outError:(id *)a4;
- (id)getPublicSignalStrength:(id)a3 error:(id *)a4;
- (id)getQoSLinkCharacteristics:(id *)a3;
- (id)getRadioPersonality:(id)a3 error:(id *)a4;
- (id)getRatSelectionMask:(id)a3 error:(id *)a4;
- (id)getRejectCauseCode:(id)a3 error:(id *)a4;
- (id)getReleaseCandidateFlag;
- (id)getRemainingPINAttemptCount:(id)a3 error:(id *)a4;
- (id)getRemainingPUKAttemptCount:(id)a3 error:(id *)a4;
- (id)getRemoteDeviceForTransferWithEID:(id)a3 error:(id *)a4;
- (id)getRemoteDeviceOfType:(unint64_t)a3 withEID:(id)a4 error:(id *)a5;
- (id)getRemoteDevicesForTransferOrError:(id *)a3;
- (id)getRemoteDevicesOfType:(unint64_t)a3 error:(id *)a4;
- (id)getResumableRoadsideProvider:(id *)a3;
- (id)getRoamingStatus:(id)a3 error:(id *)a4;
- (id)getSIMStatus:(id)a3 error:(id *)a4;
- (id)getSIMToolkitListItems:(id)a3 items:(id *)a4;
- (id)getSIMToolkitMenu:(id)a3 menu:(id *)a4;
- (id)getSIMToolkitUSSDString:(id)a3 ussdString:(id *)a4 needRsp:(BOOL *)a5;
- (id)getSIMTrayStatusOrError:(id *)a3;
- (id)getSatelliteMsgCfgToUpdate:(id *)a3;
- (id)getShortLabel:(id)a3 error:(id *)a4;
- (id)getSignalStrengthInfo:(id)a3 error:(id *)a4;
- (id)getSignalStrengthMeasurements:(id)a3 error:(id *)a4;
- (id)getSimHardwareInfo:(id)a3 error:(id *)a4;
- (id)getSimLabel:(id)a3 error:(id *)a4;
- (id)getSliceTrafficDescriptors:(id *)a3;
- (id)getSliceTrafficDescriptorsInfo:(id)a3 connectionType:(int)a4 error:(id *)a5;
- (id)getSmsReadyState:(id)a3 error:(id *)a4;
- (id)getSmscAddress:(id)a3 error:(id *)a4;
- (id)getStewieSupport:(id *)a3;
- (id)getSubscriptionInfoWithError:(id *)a3;
- (id)getSubscriptionUserFacingName:(id)a3 error:(id *)a4;
- (id)getSupportedDataRates:(id)a3 error:(id *)a4;
- (id)getSupports5G:(id)a3 error:(id *)a4;
- (id)getSupports5GStandalone:(id)a3 error:(id *)a4;
- (id)getSystemConfiguration:(id)a3 withError:(id *)a4;
- (id)getTetheringStatusSync:(id *)a3;
- (id)getTetheringStatusSync:(id *)a3 connectionType:(int)a4;
- (id)getTransportKeysToUpdate:(id *)a3;
- (id)getTypeAllocationCode:(id)a3 error:(id *)a4;
- (id)getUIConfiguredApns:(id)a3 error:(id *)a4;
- (id)getUserAuthToken:(id)a3 error:(id *)a4;
- (id)getUserDefaultVoiceSubscriptionContext:(id *)a3;
- (id)getVoicemailCallInDetails:(id)a3 outError:(id *)a4;
- (id)getWiFiCallingSettingPreferences:(id)a3 key:(id)a4 error:(id *)a5;
- (id)installPrivateNetworkProfile:(id)a3;
- (id)isAnySimReadyWithError:(id *)a3;
- (id)isEmbeddedSIMOnlyConfig:(id *)a3;
- (id)isFactoryDebugEnabled:(id *)a3;
- (id)isNetworkSelectionMenuAvailable:(id)a3 error:(id *)a4;
- (id)isPrivateNetworkContext:(id)a3 error:(id *)a4;
- (id)isSimMatching:(id)a3 carrierDescriptors:(id)a4 error:(id *)a5;
- (id)isVinylTapeSupportedWithError:(id *)a3;
- (id)listPersonalWallets:(id *)a3;
- (id)loadGSMASettings:(id)a3 state:(BOOL)a4;
- (id)needToLaunchSetUpeSIM:(id *)a3;
- (id)private_getActiveConnections:(id)a3 error:(id *)a4;
- (id)private_getConnectionAvailability:(id)a3 connectionType:(int)a4 error:(id *)a5;
- (id)private_getConnectionState:(id)a3 connectionType:(int)a4 error:(id *)a5;
- (id)private_getDataStatus:(id)a3 error:(id *)a4;
- (id)private_getSliceTrafficDescriptors:(id *)a3;
- (id)private_getSliceTrafficDescriptorsInfo:(id)a3 connectionType:(int)a4 error:(id *)a5;
- (id)private_setPacketContextActiveByServiceType:(id)a3 connectionType:(int)a4 active:(BOOL)a5;
- (id)proxyWithErrorHandler:(id)a3;
- (id)readCachedCapabilities:(id)a3 forDestination:(id)a4 withError:(id *)a5;
- (id)readCachedChatBotRenderInformation:(id)a3 forChatBot:(id)a4 withError:(id *)a5;
- (id)removeAllDedicatedBearers;
- (id)removeDedicatedBearer:(id)a3;
- (id)removePrivateNetworkProfile:(id)a3;
- (id)renamePersonalWallet:(id)a3 to:(id)a4;
- (id)reportStewieConnectionAssistantEvent:(id)a3;
- (id)reportStewieDeviceOrientation:(id)a3;
- (id)reprovisionSatelliteMsg:(BOOL)a3;
- (id)requestQoSLinkCharacteristics;
- (id)resetAPNSettings;
- (id)retrieveAllIncomingMessageIDs:(id)a3 withError:(id *)a4;
- (id)retrieveDeviceIdentifier:(unint64_t)a3 clientBundleIdentifier:(id)a4 error:(id *)a5;
- (id)retrieveDeviceIdentifier:(unint64_t)a3 error:(id *)a4;
- (id)retrieveMessage:(id)a3 withMessageID:(id)a4 withError:(id *)a5;
- (id)saveCallBarringValue:(id)a3 facility:(int)a4 callClass:(int)a5 enabled:(BOOL)a6 password:(id)a7;
- (id)saveCallForwardingValue:(id)a3 value:(id)a4;
- (id)saveCallWaitingValue:(id)a3 callClass:(int)a4 enabled:(BOOL)a5;
- (id)saveCallingLineIdRestrictionValue:(id)a3 restrictionValue:(int)a4;
- (id)selectRoadsideProviderWithContext:(id)a3 error:(id *)a4;
- (id)selectSIMToolkitListItem:(id)a3 session:(id)a4 response:(id)a5 index:(id)a6;
- (id)selectSIMToolkitMenuItem:(id)a3 index:(id)a4;
- (id)sendDeadPeerDetection;
- (id)sendSIMToolkitBooleanResponse:(id)a3 session:(id)a4 response:(id)a5 yesNo:(BOOL)a6;
- (id)sendSIMToolkitDisplayReady:(id)a3;
- (id)sendSIMToolkitResponse:(id)a3 session:(id)a4 response:(id)a5;
- (id)sendSIMToolkitStringResponse:(id)a3 session:(id)a4 response:(id)a5 string:(id)a6;
- (id)sendSIMToolkitUSSDResponse:(id)a3 response:(id)a4;
- (id)sendSIMToolkitUserActivity:(id)a3;
- (id)setApplicationCategory:(id)a3;
- (id)setInterfaceCost:(id)a3 expensive:(BOOL)a4;
- (id)setInternationalDataAccessStatus:(BOOL)a3;
- (id)setInternationalDataAccessSync:(id)a3 status:(BOOL)a4;
- (id)setInternetActive:(BOOL)a3;
- (id)setLocalPolicies:(id)a3;
- (id)setLowDataMode:(id)a3 enable:(BOOL)a4;
- (id)setMaxDataRate:(id)a3 rate:(int64_t)a4;
- (id)setOverriddenInterfaceCostInexpensive:(BOOL)a3;
- (id)setPacketContextActiveByServiceType:(id)a3 connectionType:(int)a4 active:(BOOL)a5;
- (id)setPrefForKey:(id)a3 heirarchy:(id)a4 value:(id)a5 storage:(id)a6;
- (id)setPrivacyProxyState:(id)a3 enabled:(BOOL)a4;
- (id)setProvisioningServerURL:(id)a3 url:(id)a4;
- (id)setRatSelectionMask:(id)a3 selection:(unsigned __int8)a4 preferred:(unsigned __int8)a5;
- (id)setReliableNetworkFallback:(id)a3 enable:(BOOL)a4;
- (id)setSatelliteMsgCfgUpdated:(id)a3;
- (id)setSaveDataMode:(id)a3 enable:(BOOL)a4;
- (id)setShouldShowBrandedCallingInfo:(BOOL)a3;
- (id)setSmartDataMode:(id)a3 enable:(BOOL)a4;
- (id)setStewieBlocked:(BOOL)a3;
- (id)setSupportDynamicDataSimSwitch:(BOOL)a3;
- (id)setSupports5GStandalone:(id)a3 enabled:(BOOL)a4;
- (id)setTetheringActive:(BOOL)a3;
- (id)setTransportKeysUpdated:(BOOL)a3 with:(id)a4;
- (id)setVisualVoicemailState:(id)a3 subscribed:(BOOL)a4;
- (id)setWiFiCallingSettingPreferences:(id)a3 key:(id)a4 value:(id)a5;
- (id)shouldAllowSimLockFor:(id)a3;
- (id)shouldAllowSimLockFor:(id)a3 error:(id *)a4;
- (id)shouldShowBrandedCallingInfo:(id *)a3;
- (id)shouldShoweSIMTravelTip:(id *)a3;
- (id)supportsHydraWithError:(id *)a3;
- (id)synchronousProxyWithErrorHandler:(id)a3;
- (id)synchronousRequestWithArrayResult:(id)a3 error:(id *)a4;
- (id)synchronousRequestWithNumberResult:(id)a3 error:(id *)a4;
- (id)synchronousRequestWithStringResult:(id)a3 error:(id *)a4;
- (id)terminateProcess;
- (id)testStewieCommand:(id)a3 error:(id *)a4;
- (id)transferPersonalWallet:(id)a3 to:(id)a4;
- (id)updatePrivateNetworkProfile:(id)a3 setProfileAside:(BOOL)a4;
- (id)updateSecureIntentData:(id)a3;
- (id)usageCollectionEnabledSync:(id *)a3;
- (id)userDidExitWebsheetFlowForPlan:(id)a3;
- (id)userEnteredBillingEndDayOfMont:(id)a3 error:(id *)a4;
- (id)userEnteredMonthlyBudget:(id)a3 error:(id *)a4;
- (id)userEnteredMonthlyRoamingBudget:(id)a3 error:(id *)a4;
- (id)usingBootstrapDataService:(id *)a3;
- (id)wifiCallingCTFollowUpComplete:(id)a3;
- (int)getPhonebookEntryCount:(id)a3 error:(id *)a4;
- (int64_t)checkCellularDiagnosticsStatus:(id *)a3;
- (int64_t)context:(id)a3 supportedIdentityProtectionFor:(id)a4 error:(id *)a5;
- (int64_t)getDualSimCapability:(id *)a3;
- (int64_t)getMaxDataRate:(id)a3 error:(id *)a4;
- (int64_t)isEsimFor:(id)a3 error:(id *)a4;
- (queue)userQueue;
- (unint64_t)getGSMAUIControlSetting:(id)a3 error:(id *)a4;
- (unsigned)getNATTKeepAliveOverCell:(id *)a3;
- (unsigned)getNATTKeepAliveOverCell:(id)a3 error:(id *)a4;
- (unsigned)getNATTKeepAliveOverCellForPreferredDataContext:(id *)a3;
- (unsigned)private_getNATTKeepAliveOverCell:(id)a3 error:(id *)a4;
- (void)SIMUnlockProcedureDidComplete;
- (void)activateProximityTransfer:(unint64_t)a3 completion:(id)a4;
- (void)activateStewieEmergencyTryOutWithCompletion:(id)a3;
- (void)activateTurboMode:(id)a3;
- (void)addLowLatencyFilter:(id)a3 pdp:(int)a4 queueSetId:(unint64_t)a5 uplink:(BOOL)a6 completion:(id)a7;
- (void)addPlanWith:(id)a3 appName:(id)a4 appType:(unint64_t)a5 completionHandler:(id)a6;
- (void)addPlanWith:(id)a3 completionHandler:(id)a4;
- (void)addPlanWith:(id)a3 request:(id)a4 appName:(id)a5 completionHandler:(id)a6;
- (void)addQRCodePlanWith:(id)a3 appType:(unint64_t)a4 completionHandler:(id)a5;
- (void)asynchronousRequest:(id)a3 completion:(id)a4;
- (void)asynchronousRequest:(id)a3 completionWithArray:(id)a4;
- (void)asynchronousRequest:(id)a3 completionWithNumber:(id)a4;
- (void)asynchronousRequest:(id)a3 completionWithString:(id)a4;
- (void)authenticate:(id)a3 request:(id)a4 completion:(id)a5;
- (void)automaticallySelectNetwork:(id)a3 completion:(id)a4;
- (void)bootstrapPlanTransferForEndpoint:(unint64_t)a3 usingMessageSession:(id)a4 completion:(id)a5;
- (void)cacheValue:(id)a3 forSelector:(SEL)a4;
- (void)cancelCellularPlanTransfer:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5;
- (void)cancelCellularPlanTransfer:(id)a3 fromDevice:(id)a4 keepCache:(BOOL)a5 completionHandler:(id)a6;
- (void)carrierOneTimeCodeSendersWithCompletion:(id)a3;
- (void)changePIN:(id)a3 oldPin:(id)a4 newPin:(id)a5 completion:(id)a6;
- (void)changePIN:(id)a3 oldPin:(id)a4 newPin:(id)a5 error:(id *)a6;
- (void)checkForUpdatedBundlesWithAutoInstall:(BOOL)a3 completion:(id)a4;
- (void)checkPreFlightEligibility:(id)a3 mccs:(id)a4 mncs:(id)a5 gid1s:(id)a6 gid2s:(id)a7 smdpUrl:(id)a8 iccidPrefix:(id)a9 completion:(id)a10;
- (void)checkProfileEligibility:(id)a3 metadata:(id)a4 completion:(id)a5;
- (void)checkRadioBootHealth:(id)a3;
- (void)clearUserEnteredBillingEndDayOfMonth:(id)a3 completion:(id)a4;
- (void)clearUserEnteredBillingEndDayOfMonth:(id)a3 error:(id *)a4;
- (void)clearUserEnteredMonthlyBudget:(id)a3 completion:(id)a4;
- (void)clearUserEnteredMonthlyBudget:(id)a3 error:(id *)a4;
- (void)clearUserEnteredMonthlyRoamingBudget:(id)a3 completion:(id)a4;
- (void)clearUserEnteredMonthlyRoamingBudget:(id)a3 error:(id *)a4;
- (void)compressWithStewieCodec:(id)a3 completion:(id)a4;
- (void)context:(id)a3 addPhoneServicesDevice:(id)a4 withCompletion:(id)a5;
- (void)context:(id)a3 canSetCapability:(id)a4 completion:(id)a5;
- (void)context:(id)a3 getCapability:(id)a4 completion:(id)a5;
- (void)context:(id)a3 getCarrierBundleValue:(id)a4 completion:(id)a5;
- (void)context:(id)a3 getPhoneNumberSignatureWithCompletion:(id)a4;
- (void)context:(id)a3 getPseudoIdentityFor:(id)a4 completion:(id)a5;
- (void)context:(id)a3 getSystemCapabilitiesWithCompletion:(id)a4;
- (void)context:(id)a3 isProtectedIdentitySupported:(id)a4 completion:(id)a5;
- (void)context:(id)a3 modifyAttachApnSettings:(id)a4 completion:(id)a5;
- (void)context:(id)a3 removePhoneServicesDevice:(id)a4 withCompletion:(id)a5;
- (void)context:(id)a3 resetPhoneNumber:(id)a4;
- (void)context:(id)a3 setCapability:(id)a4 enabled:(BOOL)a5 with:(id)a6 completion:(id)a7;
- (void)context:(id)a3 supportedIdentityProtectionFor:(id)a4 completion:(id)a5;
- (void)convertPhysicalToeSIMWithCompletionHandler:(id)a3;
- (void)copyAbbreviatedOperatorName:(id)a3 completion:(id)a4;
- (void)copyBandInfo:(id)a3 completion:(id)a4;
- (void)copyBundleIdentifier:(id)a3 bundleType:(id)a4 completion:(id)a5;
- (void)copyBundleLocation:(id)a3 bundleType:(id)a4 completion:(id)a5;
- (void)copyBundleVersion:(id)a3 bundleType:(id)a4 completion:(id)a5;
- (void)copyCarrierBookmarks:(id)a3 completion:(id)a4;
- (void)copyCarrierBundleLocation:(id)a3 completion:(id)a4;
- (void)copyCarrierBundleValue:(id)a3 key:(id)a4 bundleType:(id)a5 completion:(id)a6;
- (void)copyCarrierBundleValue:(id)a3 keyHierarchy:(id)a4 bundleType:(id)a5 completion:(id)a6;
- (void)copyCarrierBundleValueWithDefault:(id)a3 key:(id)a4 bundleType:(id)a5 completion:(id)a6;
- (void)copyCarrierBundleValueWithDefault:(id)a3 keyHierarchy:(id)a4 bundleType:(id)a5 completion:(id)a6;
- (void)copyCarrierBundleValues:(id)a3 keyHierarchies:(id)a4 defaultValues:(id)a5 bundleType:(id)a6 withFallbackBundleCheck:(BOOL)a7 completion:(id)a8;
- (void)copyCarrierBundleValues:(id)a3 keys:(id)a4 defaultValues:(id)a5 bundleType:(id)a6 withFallbackBundleCheck:(BOOL)a7 completion:(id)a8;
- (void)copyCarrierBundleVersion:(id)a3 completion:(id)a4;
- (void)copyCellId:(id)a3 completion:(id)a4;
- (void)copyCellInfo:(id)a3 completion:(id)a4;
- (void)copyEmergencyMode:(id)a3;
- (void)copyFirmwareUpdateInfo:(id)a3;
- (void)copyGid1:(id)a3 completion:(id)a4;
- (void)copyGid2:(id)a3 completion:(id)a4;
- (void)copyIsDataAttached:(id)a3 completion:(id)a4;
- (void)copyIsInHomeCountry:(id)a3 completion:(id)a4;
- (void)copyLabel:(id)a3 completion:(id)a4;
- (void)copyLastKnownMobileCountryCode:(id)a3 completion:(id)a4;
- (void)copyLastKnownMobileSubscriberCountryCode:(id)a3 completion:(id)a4;
- (void)copyLocalizedOperatorName:(id)a3 completion:(id)a4;
- (void)copyLocationAreaCode:(id)a3 completion:(id)a4;
- (void)copyMobileCountryCode:(id)a3 completion:(id)a4;
- (void)copyMobileEquipmentInfo:(id)a3;
- (void)copyMobileNetworkCode:(id)a3 completion:(id)a4;
- (void)copyMobileSubscriberCountryCode:(id)a3 completion:(id)a4;
- (void)copyMobileSubscriberIdentity:(id)a3 completion:(id)a4;
- (void)copyMobileSubscriberNetworkCode:(id)a3 completion:(id)a4;
- (void)copyNetworkList:(id)a3 completion:(id)a4;
- (void)copyNetworkSelection:(id)a3 completion:(id)a4;
- (void)copyNetworkSelectionInfo:(id)a3 completion:(id)a4;
- (void)copyNetworkSelectionMode:(id)a3 completion:(id)a4;
- (void)copyOperatorName:(id)a3 completion:(id)a4;
- (void)copyPriVersion:(id)a3 completion:(id)a4;
- (void)copyRadioAccessTechnology:(id)a3 completion:(id)a4;
- (void)copyRegistrationAgentStatus:(id)a3 completion:(id)a4;
- (void)copyRegistrationDisplayStatus:(id)a3 completion:(id)a4;
- (void)copyRegistrationIMSTransportInfo:(id)a3 completion:(id)a4;
- (void)copyRegistrationStatus:(id)a3 completion:(id)a4;
- (void)copyRejectCauseCode:(id)a3 completion:(id)a4;
- (void)copySIMIdentity:(id)a3 completion:(id)a4;
- (void)copyServingPlmn:(id)a3 completion:(id)a4;
- (void)copyWirelessTechnology:(id)a3 completion:(id)a4;
- (void)createAssertionForConnectionType:(int)a3 allocator:(__CFAllocator *)a4 error:(id *)a5 onReAssertError:(id)a6;
- (void)createEncryptedIdentity:(id)a3 identity:(id)a4 completion:(id)a5;
- (void)dataUsageForLastPeriods:(unint64_t)a3 completion:(id)a4;
- (void)dataUsageForLastPeriodsOnActivePairedDevice:(unint64_t)a3 completion:(id)a4;
- (void)dealloc;
- (void)deleteHiddenSims:(id)a3;
- (void)deleteLowLatencyFilter:(id)a3 pdp:(int)a4 queueSetId:(unint64_t)a5 uplink:(BOOL)a6 completion:(id)a7;
- (void)deletePersonalWallet:(id)a3 completion:(id)a4;
- (void)deleteTransferPlansForImei:(id)a3 completion:(id)a4;
- (void)deleteZone:(id)a3 completion:(id)a4;
- (void)dispatchBlockToClientAsync:(id)a3;
- (void)encryptDataWithCarrierIdentifiers:(id)a3 mnc:(id)a4 gid1:(id)a5 gid2:(id)a6 data:(id)a7 completion:(id)a8;
- (void)evaluateMobileSubscriberIdentity:(id)a3 identity:(id)a4 completion:(id)a5;
- (void)exitStewieWithContext:(id)a3 completion:(id)a4;
- (void)fDataAssertion;
- (void)fetchCallBarringValue:(id)a3 facility:(int)a4 callClass:(int)a5 password:(id)a6 completion:(id)a7;
- (void)fetchCallForwardingValue:(id)a3 reason:(int)a4 callClass:(int)a5 completion:(id)a6;
- (void)fetchCallWaitingValue:(id)a3 callClass:(int)a4 completion:(id)a5;
- (void)fetchCallingLineIdRestrictionValue:(id)a3 completion:(id)a4;
- (void)fetchCallingLinePresentationValue:(id)a3 completion:(id)a4;
- (void)fetchConnectedLineIdRestrictionValue:(id)a3 completion:(id)a4;
- (void)fetchConnectedLinePresentationValue:(id)a3 completion:(id)a4;
- (void)fetchNetworkList:(id)a3 completion:(id)a4;
- (void)fetchPhonebook:(id)a3 completion:(id)a4;
- (void)fetchRoadsideProvidersWithContext:(id)a3 completion:(id)a4;
- (void)fetchSIMLockValue:(id)a3 completion:(id)a4;
- (void)generateAuthenticationInfoUsingSim:(id)a3 authParams:(id)a4 completion:(id)a5;
- (void)get2GSwitchEnabled:(id)a3;
- (void)get2GUserPreference:(id)a3;
- (void)getActionForCardData:(id)a3 completionHandler:(id)a4;
- (void)getActiveConnections:(id)a3 completion:(id)a4;
- (void)getActiveContextsWithCallback:(id)a3;
- (void)getAllEmergencyNumbers:(id)a3;
- (void)getAnbrActivationState:(id)a3 completion:(id)a4;
- (void)getCallCapabilities:(id)a3 completion:(id)a4;
- (void)getCameraScanInfoForCardData:(id)a3 completionHandler:(id)a4;
- (void)getCarrierSetupWithCompletion:(id)a3;
- (void)getConfiguredApns:(id)a3 completion:(id)a4;
- (void)getConnectionAssistantConfig:(id)a3;
- (void)getConnectionAssistantServicePlot:(id)a3;
- (void)getConnectionAssistantState:(id)a3;
- (void)getConnectionAvailability:(id)a3 connectionType:(int)a4 completion:(id)a5;
- (void)getConnectionState:(id)a3 connectionType:(int)a4 completion:(id)a5;
- (void)getCurrentDataServiceDescriptor:(id)a3;
- (void)getCurrentDataSubscriptionContext:(id)a3;
- (void)getDataStatus:(id)a3 completion:(id)a4;
- (void)getDataStatusBasic:(id)a3 completion:(id)a4;
- (void)getDescriptorsForDomain:(int64_t)a3 completion:(id)a4;
- (void)getDeviceInfo:(id)a3;
- (void)getEOSFirmwareUpdateInfo:(id)a3;
- (void)getEmergencyTextNumbers:(id)a3 completion:(id)a4;
- (void)getEnhancedVoiceLinkQualityMetric:(id)a3 completion:(id)a4;
- (void)getEosStatus:(id)a3;
- (void)getEuiccData:(id)a3;
- (void)getEvolvedSubscriptionLabelID:(id)a3 withCallback:(id)a4;
- (void)getIMSRegistrationStatus:(id)a3 completion:(id)a4;
- (void)getInternationalDataAccess:(id)a3 completion:(id)a4;
- (void)getInternationalDataAccessStatus:(id)a3;
- (void)getInternetConnectionAvailability:(id)a3;
- (void)getInternetConnectionState:(id)a3;
- (void)getInternetDataStatus:(id)a3;
- (void)getInternetDataStatusBasic:(id)a3;
- (void)getLocalPolicies:(id)a3 completion:(id)a4;
- (void)getLowLatencyFilters:(int)a3 queueSetId:(unint64_t)a4 completion:(id)a5;
- (void)getMaxDataRate:(id)a3 completion:(id)a4;
- (void)getMobileSubscriberHomeCountryList:(id)a3 completion:(id)a4;
- (void)getNATTKeepAliveOverCell:(id)a3 completion:(id)a4;
- (void)getOperatorMultiPartyCallCountMaximum:(id)a3 completion:(id)a4;
- (void)getPNRContext:(id)a3 completion:(id)a4;
- (void)getPhoneNumberWithCompletion:(id)a3 completion:(id)a4;
- (void)getPhoneServicesDeviceInfoWithCompletion:(id)a3;
- (void)getPhoneServicesDeviceListWithCompletion:(id)a3;
- (void)getPhonebookEntryCountWithCompletion:(id)a3 completion:(id)a4;
- (void)getPhonebookEntryWithCompletion:(id)a3 atIndex:(int)a4 completion:(id)a5;
- (void)getPlanTransferCredentials:(id)a3 completion:(id)a4;
- (void)getPrefForKey:(id)a3 heirarchy:(id)a4 storage:(id)a5 completion:(id)a6;
- (void)getPreferredDataServiceDescriptor:(id)a3;
- (void)getPreferredDataSubscriptionContext:(id)a3;
- (void)getPrivateNetworkCapabilitiesForContext:(id)a3 completion:(id)a4;
- (void)getProximityTransportSession:(unint64_t)a3 remoteDeviceInfo:(id)a4 completion:(id)a5;
- (void)getRadioPersonality:(id)a3 completion:(id)a4;
- (void)getRatSelection:(id)a3 completion:(id)a4;
- (void)getRemainingPINAttemptCount:(id)a3 completion:(id)a4;
- (void)getRemainingPUKAttemptCount:(id)a3 completion:(id)a4;
- (void)getRemoteDevices:(id)a3;
- (void)getRemotePlanManageAccountInfoFor:(id)a3 completion:(id)a4;
- (void)getRemotePolicies:(id)a3 completion:(id)a4;
- (void)getResumableRoadsideProviderWithCompletion:(id)a3;
- (void)getRoamingStatus:(id)a3 completion:(id)a4;
- (void)getSIMStatus:(id)a3 completion:(id)a4;
- (void)getSIMTrayStatus:(id)a3;
- (void)getSatelliteMsgCfgToUpdateWithCompletion:(id)a3;
- (void)getShortLabel:(id)a3 completion:(id)a4;
- (void)getSignalStrengthInfo:(id)a3 completion:(id)a4;
- (void)getSignalStrengthMeasurements:(id)a3 completion:(id)a4;
- (void)getSimLabel:(id)a3 completion:(id)a4;
- (void)getSmsReadyState:(id)a3 completion:(id)a4;
- (void)getSmscAddress:(id)a3 completion:(id)a4;
- (void)getStewieSupportWithCompletion:(id)a3;
- (void)getSubscriptionInfo:(id)a3;
- (void)getSubscriptionUserFacingName:(id)a3 completion:(id)a4;
- (void)getSupportDynamicDataSimSwitch:(id)a3;
- (void)getSupportedDataRates:(id)a3 completion:(id)a4;
- (void)getSweetgumApps:(id)a3 completion:(id)a4;
- (void)getSweetgumCapabilities:(id)a3 completion:(id)a4;
- (void)getSweetgumDataPlanMetrics:(id)a3 completion:(id)a4;
- (void)getSweetgumPlans:(id)a3 completion:(id)a4;
- (void)getSweetgumUsage:(id)a3 completion:(id)a4;
- (void)getSweetgumUserConsentInfo:(id)a3 completion:(id)a4;
- (void)getTetheringStatus:(id)a3;
- (void)getTetheringStatus:(id)a3 connectionType:(int)a4;
- (void)getTransferPlansWithCompletion:(id)a3;
- (void)getTransferType:(id)a3 remoteEid:(id)a4 completion:(id)a5;
- (void)getTransportKeysToUpdateWithCompletion:(id)a3;
- (void)getUIConfiguredApns:(id)a3 completion:(id)a4;
- (void)getVoiceLinkQualityMetric:(id)a3 completion:(id)a4;
- (void)getVoicemailInfo:(id)a3 completion:(id)a4;
- (void)getWiFiCallingSettingPreferences:(id)a3 key:(id)a4 completion:(id)a5;
- (void)handleTermsAndConditionsCompleted:(id)a3 consented:(BOOL)a4 completion:(id)a5;
- (void)handleUserEnteredOtp:(id)a3 otp:(id)a4 completion:(id)a5;
- (void)hiddenTransferPlans:(id)a3;
- (void)hideTransferCellularPlan:(id)a3 fromDevice:(id)a4 completion:(id)a5;
- (void)hideTransferPlan:(id)a3 fromDevice:(id)a4 completion:(id)a5;
- (void)installPendingPlan:(id)a3 completion:(id)a4;
- (void)installPendingPlanList:(id)a3 completion:(id)a4;
- (void)invalidateCrossPlatformPlanTransfer:(id)a3;
- (void)invalidateProximityTransfer:(unint64_t)a3 force:(BOOL)a4 completion:(id)a5;
- (void)isAnyPlanOfTransferCapability:(unint64_t)a3 availableForThisDeviceWithCompletion:(id)a4;
- (void)isAttachApnSettingAllowed:(id)a3 completion:(id)a4;
- (void)isEmergencyNumber:(id)a3 number:(id)a4 completion:(id)a5;
- (void)isEmergencyNumberWithWhitelistIncluded:(id)a3 number:(id)a4 completion:(id)a5;
- (void)isNetworkReselectionNeeded:(id)a3 completion:(id)a4;
- (void)isNetworkSelectionMenuAvailable:(id)a3 completion:(id)a4;
- (void)isPNRSupported:(id)a3 completion:(id)a4;
- (void)isPrivateNetworkContext:(id)a3 completion:(id)a4;
- (void)isPrivateNetworkPreferredOverWifi:(id)a3 completion:(id)a4;
- (void)isPrivateNetworkSIM:(id)a3 completion:(id)a4;
- (void)isTetheringEditingSupported:(id)a3 completion:(id)a4;
- (void)isUnconditionalCallForwardingActive:(id)a3 completion:(id)a4;
- (void)isVinylTestModeEnabledWithCompletion:(id)a3;
- (void)issuePNRRequest:(id)a3 pnrReqType:(id)a4 completion:(id)a5;
- (void)overridePlanSelection:(id)a3 completion:(id)a4;
- (void)performNetworkAccessFlowIfAllowed:(id)a3 ignoreForeground:(BOOL)a4 completion:(id)a5;
- (void)ping:(id)a3;
- (void)plansPendingCrossPlatformTransferWithCompletion:(id)a3;
- (void)plansPendingInstallWithCompletion:(id)a3;
- (void)prepareCrossPlatformCellularPlanLabel:(id)a3 completion:(id)a4;
- (void)prepareCrossPlatformPlanTransfer:(id)a3 completion:(id)a4;
- (void)promptForSIMUnlock:(id)a3 completion:(id)a4;
- (void)purchaseSweetgumPlan:(id)a3 completion:(id)a4;
- (void)queryAnbrBitrate:(id)a3 bitrate:(id)a4 direction:(int)a5 completion:(id)a6;
- (void)refreshCellMonitor:(id)a3 completion:(id)a4;
- (void)refreshSweetgumAll:(id)a3 completion:(id)a4;
- (void)refreshSweetgumApps:(id)a3 completion:(id)a4;
- (void)refreshSweetgumPlans:(id)a3 completion:(id)a4;
- (void)refreshSweetgumUsage:(id)a3 completion:(id)a4;
- (void)refreshUserAuthToken:(id)a3 error:(id *)a4;
- (void)registerBlockForInvalidationNotification:(__CTAssertionType *)a3 callback:(id)a4;
- (void)registerSetUpeSIMLaunchedEvent:(id)a3;
- (void)remotePlanSignupInfoFor:(id)a3 userConsent:(int64_t)a4 completion:(id)a5;
- (void)removePoliciesFromLocalDevice:(id)a3 completion:(id)a4;
- (void)renewOneTimePassword:(id)a3 completion:(id)a4;
- (void)reportStewieConnectionAssistantEvent:(id)a3 completion:(id)a4;
- (void)reportStewieDeviceOrientation:(id)a3 completion:(id)a4;
- (void)requestSliceByUUID:(id)a3 completion:(id)a4;
- (void)requestSliceDeactivation:(id)a3;
- (void)requestStewieWithContext:(id)a3 completion:(id)a4;
- (void)resetAPNSettings:(id)a3;
- (void)resetProximityTransportExtension:(id)a3;
- (void)resetUIConfiguredApns:(id)a3 completion:(id)a4;
- (void)retrieveAppListURLWithCompletion:(id)a3;
- (void)saveCallBarringValue:(id)a3 facility:(int)a4 callClass:(int)a5 enabled:(BOOL)a6 password:(id)a7 completion:(id)a8;
- (void)saveCallForwardingValue:(id)a3 value:(id)a4 completion:(id)a5;
- (void)saveCallWaitingValue:(id)a3 callClass:(int)a4 enabled:(BOOL)a5 completion:(id)a6;
- (void)saveCallingLineIdRestrictionValue:(id)a3 restrictionValue:(int)a4 completion:(id)a5;
- (void)savePhonebookEntry:(id)a3 atIndex:(int)a4 withContactName:(id)a5 contactNumber:(id)a6 completion:(id)a7;
- (void)saveSIMLockValue:(id)a3 enabled:(BOOL)a4 pin:(id)a5 completion:(id)a6;
- (void)saveSIMLockValue:(id)a3 enabled:(BOOL)a4 pin:(id)a5 error:(id *)a6;
- (void)selectNetwork:(id)a3 network:(id)a4 completion:(id)a5;
- (void)selectPhonebook:(id)a3 forPhonebookName:(int)a4 withPassword:(id)a5 completion:(id)a6;
- (void)selectRoadsideProviderWithContext:(id)a3 completion:(id)a4;
- (void)sendComposingIndicator:(id)a3 to:(id)a4 withMessageID:(id)a5 withIndication:(id)a6 withError:(id *)a7;
- (void)sendDeadPeerDetection:(id)a3;
- (void)sendTaggedInfo:(id)a3 type:(unint64_t)a4 payload:(id)a5 completion:(id)a6;
- (void)set2GUserPreference:(BOOL)a3 completion:(id)a4;
- (void)setActiveBandInfo:(id)a3 bands:(id)a4 error:(id *)a5;
- (void)setActiveUserDataSelection:(id)a3 completion:(id)a4;
- (void)setActiveUserDataSelection:(id)a3 error:(id *)a4;
- (void)setBandInfo:(id)a3 bands:(id)a4 completion:(id)a5;
- (void)setCoalescing:(BOOL)a3 udp:(BOOL)a4 completion:(id)a5;
- (void)setDefaultVoice:(id)a3 completion:(id)a4;
- (void)setDefaultVoice:(id)a3 error:(id *)a4;
- (void)setDelegate:(id)a3;
- (void)setEosStatus:(id)a3 assertionState:(id)a4 completion:(id)a5;
- (void)setFDataAssertion:(void *)a3;
- (void)setInternationalDataAccess:(id)a3 status:(BOOL)a4 completion:(id)a5;
- (void)setInternationalDataAccessStatus:(BOOL)a3 completion:(id)a4;
- (void)setInternetActive:(BOOL)a3 completion:(id)a4;
- (void)setLabel:(id)a3 label:(id)a4 completion:(id)a5;
- (void)setLabel:(id)a3 label:(id)a4 error:(id *)a5;
- (void)setLocalPolicies:(id)a3 completion:(id)a4;
- (void)setMaxDataRate:(id)a3 rate:(int64_t)a4 completion:(id)a5;
- (void)setMux:(id)a3;
- (void)setPacketContextActiveByServiceType:(id)a3 connectionType:(int)a4 active:(BOOL)a5 completion:(id)a6;
- (void)setPrefForKey:(id)a3 heirarchy:(id)a4 value:(id)a5 storage:(id)a6 completion:(id)a7;
- (void)setRatSelection:(id)a3 selection:(id)a4 preferred:(id)a5 completion:(id)a6;
- (void)setRemotePolicies:(id)a3 completion:(id)a4;
- (void)setStewieBlocked:(BOOL)a3 completion:(id)a4;
- (void)setSupportDynamicDataSimSwitch:(BOOL)a3 completion:(id)a4;
- (void)setSupportDynamicDataSimSwitch:(BOOL)a3 forIccid:(id)a4 completion:(id)a5;
- (void)setSweetgumUserConsent:(id)a3 userConsent:(BOOL)a4 completion:(id)a5;
- (void)setTetheringActive:(BOOL)a3 completion:(id)a4;
- (void)setUIConfiguredApns:(id)a3 apns:(id)a4 completion:(id)a5;
- (void)setUpeSIMLaunched:(id)a3;
- (void)setUsageCollectionEnabled:(BOOL)a3 completion:(id)a4;
- (void)setUserEntered:(id)a3 monthlyBudget:(id)a4 completion:(id)a5;
- (void)setUserEntered:(id)a3 monthlyBudget:(id)a4 error:(id *)a5;
- (void)setUserEntered:(id)a3 monthlyRoamingBudget:(id)a4 completion:(id)a5;
- (void)setUserEntered:(id)a3 monthlyRoamingBudget:(id)a4 error:(id *)a5;
- (void)setUserEnteredBillingEnd:(id)a3 dayOfMonth:(id)a4 completion:(id)a5;
- (void)setUserEnteredBillingEnd:(id)a3 dayOfMonth:(id)a4 error:(id *)a5;
- (void)setUserQueue:(queue)a3;
- (void)setVinylTestMode:(BOOL)a3 completion:(id)a4;
- (void)setVirtualSimMode:(BOOL)a3 completion:(id)a4;
- (void)setVirtualSimMode:(BOOL)a3 withDualSim:(BOOL)a4 completion:(id)a5;
- (void)setVoLTEAudioCodec:(id)a3 codecInfo:(id)a4 completion:(id)a5;
- (void)setWiFiCallingSettingPreferences:(id)a3 key:(id)a4 value:(id)a5 completion:(id)a6;
- (void)shouldShowUserWarningWhenDialingCallOnContext:(id)a3 completion:(id)a4;
- (void)simulateDataStall:(BOOL)a3 pdp:(int)a4 completion:(id)a5;
- (void)startPendingPlanInstallationForPlan:(id)a3 carrierName:(id)a4 completionHandler:(id)a5;
- (void)submitPlanSetupDetails:(id)a3 completion:(id)a4;
- (void)submitSimSetupUsage:(id)a3 completion:(id)a4;
- (void)synchronousRequest:(id)a3 error:(id *)a4;
- (void)terminateProcess:(id)a3;
- (void)testStewieCommand:(id)a3 completion:(id)a4;
- (void)transferCellularPlan:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5;
- (void)transferCellularPlans:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5;
- (void)transferPlan:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5;
- (void)transferPlans:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5;
- (void)transferRemotePlan:(id)a3 completion:(id)a4;
- (void)transferRemotePlan:(id)a3 fromDevice:(id)a4 completion:(id)a5;
- (void)triggerKeepaliveWakeupEvent:(int)a3 completion:(id)a4;
- (void)unhideTransferPlan:(id)a3 completion:(id)a4;
- (void)unlockPIN:(id)a3 pin:(id)a4 completion:(id)a5;
- (void)unlockPIN:(id)a3 pin:(id)a4 error:(id *)a5;
- (void)unlockPUK:(id)a3 puk:(id)a4 newPin:(id)a5 completion:(id)a6;
- (void)unlockPUK:(id)a3 puk:(id)a4 newPin:(id)a5 error:(id *)a6;
- (void)usageCollectionEnabled:(id)a3;
- (void)userEnteredBillingEndDayOfMont:(id)a3 completion:(id)a4;
- (void)userEnteredMonthlyBudget:(id)a3 completion:(id)a4;
- (void)userEnteredMonthlyRoamingBudget:(id)a3 completion:(id)a4;
- (void)validateProximityTransfer:(unint64_t)a3 pin:(id)a4 completion:(id)a5;
- (void)websheetInfoForIccid:(id)a3 completion:(id)a4;
- (void)websheetInfoForPlan:(id)a3 completion:(id)a4;
- (void)websheetInfoForPlan:(id)a3 inBuddy:(BOOL)a4 completion:(id)a5;
@end

@implementation CoreTelephonyClient

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  return self;
}

- (CoreTelephonyClient)initWithQueue:(dispatch_queue_s *)a3
{
  v5 = [(id)objc_opt_class() sharedMultiplexer];
  v6 = [(CoreTelephonyClient *)self initWithQueue:a3 multiplexer:v5];

  return v6;
}

- (CoreTelephonyClient)initWithQueue:(dispatch_queue_s *)a3 multiplexer:(id)a4
{
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CoreTelephonyClient;
  v8 = [(CoreTelephonyClient *)&v17 init];
  if (v8)
  {
    if (a3) {
      dispatch_retain((dispatch_object_t)a3);
    }
    fObj = v8->_userQueue.fObj.fObj;
    v8->_userQueue.fObj.fObj = (dispatch_object_s *)a3;
    v10 = a3;
    if (fObj)
    {
      dispatch_release(fObj);
      v10 = (dispatch_queue_s *)v8->_userQueue.fObj.fObj;
    }
    if (!v10)
    {
      global_queue = dispatch_get_global_queue(21, 0);
      v13 = global_queue;
      if (global_queue)
      {
        dispatch_retain(global_queue);
        v14 = v8->_userQueue.fObj.fObj;
        v8->_userQueue.fObj.fObj = (dispatch_object_s *)v13;
        if (v14) {
          dispatch_release(v14);
        }
      }
      else
      {
        v8->_userQueue.fObj.fObj = 0;
      }
    }
    objc_storeStrong((id *)&v8->_mux, a4);
    id location = 0;
    objc_initWeak(&location, v8);
    objc_copyWeak(v15, &location);
    v15[1] = a3;
    v8->fOsStateHandle = os_state_add_handler();
    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }

  return v8;
}

+ (id)sharedMultiplexer
{
  WeakRetained = objc_loadWeakRetained(&+[CoreTelephonyClient sharedMultiplexer]::sharedMux);
  if (!WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&+[CoreTelephonyClient sharedMultiplexer]::lock);
    WeakRetained = objc_loadWeakRetained(&+[CoreTelephonyClient sharedMultiplexer]::sharedMux);
    if (!WeakRetained)
    {
      WeakRetained = objc_opt_new();
      objc_storeWeak(&+[CoreTelephonyClient sharedMultiplexer]::sharedMux, WeakRetained);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&+[CoreTelephonyClient sharedMultiplexer]::lock);
  }
  id v3 = WeakRetained;

  return v3;
}

- (id)getDataStatus:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    v8 = [(CoreTelephonyClient *)self private_getDataStatus:v7 error:a4];
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyRegistrationStatus:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__17;
  v23 = __Block_byref_object_dispose__17;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __66__CoreTelephonyClient_Registration__copyRegistrationStatus_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  v18[4] = &v19;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__17;
  v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetRegistrationStatusRequest alloc] initWithContext:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__CoreTelephonyClient_Registration__copyRegistrationStatus_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  v11[4] = &v19;
  v11[5] = &v12;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

- (id)private_getDataStatus:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy_;
    id v24 = __Block_byref_object_dispose_;
    id v25 = 0;
    if (a4) {
      *a4 = 0;
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __63__CoreTelephonyClient_hiddenData__private_getDataStatus_error___block_invoke;
    v19[3] = &unk_1E5260BA0;
    v19[4] = &v20;
    v8 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v19];
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy_;
    id v17 = __Block_byref_object_dispose_;
    id v18 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__CoreTelephonyClient_hiddenData__private_getDataStatus_error___block_invoke_2;
    v12[3] = &unk_1E5260C68;
    v12[4] = &v20;
    v12[5] = &v13;
    [v8 getDataStatus:v7 completion:v12];
    if (a4)
    {
      id v9 = (void *)v21[5];
      if (v9) {
        *a4 = v9;
      }
    }
    id v10 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(&v20, 8);
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    id v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)copyMobileNetworkCode:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __70__CoreTelephonyClient_Registration__copyMobileNetworkCode_completion___block_invoke_2;
    v15[3] = &unk_1E5260CB8;
    id v9 = v8;
    id v16 = v9;
    id v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v15];
    v11 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetMobileNetworkCodeRequest alloc] initWithContext:v7];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__CoreTelephonyClient_Registration__copyMobileNetworkCode_completion___block_invoke_3;
    v13[3] = &unk_1E5263180;
    id v14 = v9;
    [v10 sendRequest:v11 completionHandler:v13];
    uint64_t v12 = &v16;
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __70__CoreTelephonyClient_Registration__copyMobileNetworkCode_completion___block_invoke;
    v17[3] = &unk_1E5260D00;
    id v18 = v8;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v17];
    uint64_t v12 = &v18;
  }
}

- (BOOL)supportsRequestWithSelector:(SEL)a3
{
  BOOL v4 = [(CoreTelephonyClient *)self supportsCellular];
  if (!v4)
  {
    NSStringFromSelector(a3);
    id v5 = objc_claimAutoreleasedReturnValue();
    handleUnsupportedRequestForCurrentBundle((const char *)[v5 UTF8String]);
  }
  return v4;
}

- (BOOL)supportsCellular
{
  if (-[CoreTelephonyClient supportsCellular]::onceToken != -1) {
    dispatch_once(&-[CoreTelephonyClient supportsCellular]::onceToken, &__block_literal_global_7);
  }
  return -[CoreTelephonyClient supportsCellular]::result;
}

- (void)copyMobileCountryCode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__CoreTelephonyClient_Registration__copyMobileCountryCode_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  id v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetMobileCountryCodeRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__CoreTelephonyClient_Registration__copyMobileCountryCode_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

- (id)proxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  fObj = self->_userQueue.fObj.fObj;
  mux = self->_mux;
  dispatch_object_t object = fObj;
  if (fObj) {
    dispatch_retain(fObj);
  }
  id v7 = [(CoreTelephonyClientMux *)mux proxyWithQueue:&object errorHandler:v4];
  if (object) {
    dispatch_release(object);
  }

  return v7;
}

- (id)getSignalStrengthMeasurements:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__17;
  v23 = __Block_byref_object_dispose__17;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__CoreTelephonyClient_Registration__getSignalStrengthMeasurements_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  v18[4] = &v19;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__17;
  id v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  id v8 = [[CTXPCGetSignalStrengthMeasurementsRequest alloc] initWithDescriptor:v6 synchronous:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__CoreTelephonyClient_Registration__getSignalStrengthMeasurements_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  v11[4] = &v19;
  v11[5] = &v12;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

- (id)synchronousProxyWithErrorHandler:(id)a3
{
  id v3 = [(CoreTelephonyClientMux *)self->_mux synchronousProxyWithErrorHandler:a3];

  return v3;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);

    if (WeakRetained != v4)
    {
      id v6 = objc_loadWeakRetained(&self->_delegate);

      if (v6)
      {
        mux = self->_mux;
        id v8 = objc_loadWeakRetained(&self->_delegate);
        [(CoreTelephonyClientMux *)mux removeDelegate:v8];
      }
      objc_storeWeak(&self->_delegate, v4);
      self->fDelegateAddr = v4;
      fObj = self->_userQueue.fObj.fObj;
      id v10 = self->_mux;
      dispatch_object_t object = fObj;
      if (fObj) {
        dispatch_retain(fObj);
      }
      [(CoreTelephonyClientMux *)v10 addDelegate:v4 queue:&object];
      if (object) {
        dispatch_release(object);
      }
    }
  }
  else
  {
    id v11 = self->_mux;
    id v12 = objc_loadWeakRetained(&self->_delegate);
    [(CoreTelephonyClientMux *)v11 removeDelegate:v12];

    objc_storeWeak(&self->_delegate, 0);
    self->fDelegateAddr = 0;
  }
}

void __76__CoreTelephonyClient_Subscriber__asynchronousRequest_completionWithString___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 result];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

void __76__CoreTelephonyClient_Subscriber__synchronousRequestWithStringResult_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v15 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v15;
    id v8 = v15;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v15;
  }

  uint64_t v10 = [v9 result];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

void __70__CoreTelephonyClient_Registration__copyMobileNetworkCode_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = [v9 mnc];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

void __65__CoreTelephonyClient_Registration__copyMobileCountryCode_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v10 = [v9 mcc];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

void __70__CoreTelephonyClient_Registration__copyMobileCountryCode_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = [v9 mcc];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

void __59__CoreTelephonyClient_Registration__getOperatorName_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v10 = [v9 operatorName];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

void __66__CoreTelephonyClient_Registration__copyRegistrationStatus_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v10 = [v9 status];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

void __62__CoreTelephonyClient_SIMToolkit__sendSIMToolkitDisplayReady___block_invoke_2(uint64_t a1, void *a2)
{
}

void __73__CoreTelephonyClient_Registration__getSignalStrengthMeasurements_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v10 = [v9 measurements];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (id)getOperatorName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__17;
  v23 = __Block_byref_object_dispose__17;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __59__CoreTelephonyClient_Registration__getOperatorName_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  v18[4] = &v19;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__17;
  id v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  id v8 = [[CTXPCGetOperatorNameRequest alloc] initWithContext:v6 type:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__CoreTelephonyClient_Registration__getOperatorName_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  v11[4] = &v19;
  v11[5] = &v12;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __63__CoreTelephonyClient_hiddenData__private_getDataStatus_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (CoreTelephonyClient)init
{
  return [(CoreTelephonyClient *)self initWithQueue:0];
}

- (id)sendSIMToolkitDisplayReady:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__9;
  uint64_t v14 = __Block_byref_object_dispose__9;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__CoreTelephonyClient_SIMToolkit__sendSIMToolkitDisplayReady___block_invoke;
  v9[3] = &unk_1E5260BA0;
  v9[4] = &v10;
  id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__CoreTelephonyClient_SIMToolkit__sendSIMToolkitDisplayReady___block_invoke_2;
  v8[3] = &unk_1E5260BA0;
  v8[4] = &v10;
  [v5 sendSIMToolkitDisplayReadyForContext:v4 completion:v8];
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v6;
}

void __83__CoreTelephonyClient_hiddenData__private_getConnectionState_connectionType_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)getVoicemailInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__CoreTelephonyClient_Voicemail__getVoicemailInfo_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 getVoicemailInfo:v6 completion:v8];
}

- (void)refreshCellMonitor:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __66__CoreTelephonyClient_CellMonitor__refreshCellMonitor_completion___block_invoke_2;
    id v15 = &unk_1E5260CB8;
    id v9 = v8;
    id v16 = v9;
    uint64_t v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v12];
    objc_msgSend(v10, "refreshCellMonitor:completion:", v7, v9, v12, v13, v14, v15);
    id v11 = &v16;
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__CoreTelephonyClient_CellMonitor__refreshCellMonitor_completion___block_invoke;
    v17[3] = &unk_1E5260D00;
    id v18 = v8;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v17];
    id v11 = &v18;
  }
}

void __41__CoreTelephonyClient_getActiveContexts___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mux, 0);
  fObj = self->_userQueue.fObj.fObj;
  if (fObj) {
    dispatch_release(fObj);
  }

  objc_destroyWeak(&self->_delegate);
}

- (id)getCurrentDataServiceDescriptorSync:(id *)a3
{
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    if (a3) {
      *a3 = 0;
    }
    id v5 = [(CoreTelephonyClient *)self cachedValueForSelector:sel_getCurrentDataServiceDescriptor_];
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      uint64_t v17 = 0;
      id v18 = &v17;
      uint64_t v19 = 0x3032000000;
      uint64_t v20 = __Block_byref_object_copy_;
      uint64_t v21 = __Block_byref_object_dispose_;
      id v22 = 0;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __65__CoreTelephonyClient_Data__getCurrentDataServiceDescriptorSync___block_invoke;
      v16[3] = &unk_1E5260BA0;
      v16[4] = &v17;
      uint64_t v6 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v16];
      uint64_t v10 = 0;
      id v11 = &v10;
      uint64_t v12 = 0x3032000000;
      uint64_t v13 = __Block_byref_object_copy_;
      uint64_t v14 = __Block_byref_object_dispose_;
      id v15 = 0;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __65__CoreTelephonyClient_Data__getCurrentDataServiceDescriptorSync___block_invoke_2;
      v9[3] = &unk_1E5260E40;
      v9[4] = &v17;
      void v9[5] = &v10;
      [v6 getCurrentDataServiceDescriptor:v9];
      if (a3)
      {
        id v7 = (void *)v18[5];
        if (v7) {
          *a3 = v7;
        }
      }
      [(CoreTelephonyClient *)self cacheValue:v11[5] forSelector:sel_getCurrentDataServiceDescriptor_];
      id v5 = (id)v11[5];
      _Block_object_dispose(&v10, 8);

      _Block_object_dispose(&v17, 8);
    }
  }
  else if (a3)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    id v5 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)cachedValueForSelector:(SEL)a3
{
  return [(CoreTelephonyClientMux *)self->_mux cachedValueForSelector:a3];
}

- (void)cacheValue:(id)a3 forSelector:(SEL)a4
{
}

- (void)dealloc
{
  mux = self->_mux;
  if (mux) {
    [(CoreTelephonyClientMux *)mux removeDelegate:self->fDelegateAddr];
  }
  os_state_remove_handler();
  self->fOsStateHandle = 0;
  v4.receiver = self;
  v4.super_class = (Class)CoreTelephonyClient;
  [(CoreTelephonyClient *)&v4 dealloc];
}

void __52__CoreTelephonyClient_getSubscriptionInfoWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __57__CoreTelephonyClient_Registration__getCurrentRat_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v10 = [v9 rat];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

void __65__CoreTelephonyClient_Data__getCurrentDataServiceDescriptorSync___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)getConnectionState:(id)a3 connectionType:(int)a4 error:(id *)a5
{
  id v5 = [(CoreTelephonyClient *)self private_getConnectionState:a3 connectionType:*(void *)&a4 error:a5];

  return v5;
}

- (id)getInternetConnectionStateSync:(id *)a3
{
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    id v5 = [(CoreTelephonyClient *)self private_getConnectionState:0 connectionType:0 error:a3];
  }
  else if (a3)
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    id v5 = 0;
    *a3 = v6;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)private_getConnectionState:(id)a3 connectionType:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    id v25 = __Block_byref_object_copy_;
    v26 = __Block_byref_object_dispose_;
    id v27 = 0;
    if (a5) {
      *a5 = 0;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __83__CoreTelephonyClient_hiddenData__private_getConnectionState_connectionType_error___block_invoke;
    v21[3] = &unk_1E5260BA0;
    v21[4] = &v22;
    uint64_t v10 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v21];
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy_;
    uint64_t v19 = __Block_byref_object_dispose_;
    id v20 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __83__CoreTelephonyClient_hiddenData__private_getConnectionState_connectionType_error___block_invoke_2;
    v14[3] = &unk_1E5260C18;
    void v14[4] = &v22;
    v14[5] = &v15;
    [v10 getConnectionState:v9 connectionType:v6 completion:v14];
    if (a5)
    {
      uint64_t v11 = (void *)v23[5];
      if (v11) {
        *a5 = v11;
      }
    }
    id v12 = (id)v16[5];
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v22, 8);
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    id v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)getSubscriptionInfoWithError:(id *)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__16;
  id v20 = __Block_byref_object_dispose__16;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __52__CoreTelephonyClient_getSubscriptionInfoWithError___block_invoke;
  v15[3] = &unk_1E5260BA0;
  void v15[4] = &v16;
  objc_super v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v15];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__16;
  id v13 = __Block_byref_object_dispose__16;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__CoreTelephonyClient_getSubscriptionInfoWithError___block_invoke_2;
  v8[3] = &unk_1E52647A0;
  v8[4] = &v16;
  void v8[5] = &v9;
  [v4 getSubscriptionInfo:v8];
  if (a3)
  {
    id v5 = (void *)v17[5];
    if (v5) {
      *a3 = v5;
    }
  }
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v16, 8);

  return v6;
}

- (void)getSubscriptionInfo:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__CoreTelephonyClient_getSubscriptionInfo___block_invoke;
  v7[3] = &unk_1E5260CB8;
  id v5 = v4;
  id v8 = v5;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  [v6 getSubscriptionInfo:v5];
}

- (id)getCurrentRat:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__17;
  v23 = __Block_byref_object_dispose__17;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __57__CoreTelephonyClient_Registration__getCurrentRat_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  v18[4] = &v19;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__17;
  uint64_t v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  id v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetCurrentRatRequest alloc] initWithDescriptor:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__CoreTelephonyClient_Registration__getCurrentRat_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  v11[4] = &v19;
  v11[5] = &v12;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __39__CoreTelephonyClient_supportsCellular__block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  -[CoreTelephonyClient supportsCellular]::result = hasBaseband();
  if (isFrameworkLoggingSupported())
  {
    v0 = CTLogClient();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      if (-[CoreTelephonyClient supportsCellular]::result) {
        v1 = "";
      }
      else {
        v1 = " not";
      }
      int v2 = 136315138;
      id v3 = v1;
      _os_log_impl(&dword_18444A000, v0, OS_LOG_TYPE_DEFAULT, "Device does%s support cellular", (uint8_t *)&v2, 0xCu);
    }
  }
}

void __55__CoreTelephonyClient_Phonebook__getPhoneNumber_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __69__CoreTelephonyClient_Data__getPreferredDataSubscriptionContextSync___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)getUserDefaultVoiceSubscriptionContext:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__10;
  uint64_t v21 = __Block_byref_object_dispose__10;
  id v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__10;
  uint64_t v15 = __Block_byref_object_dispose__10;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__CoreTelephonyClient_Subscriber__getUserDefaultVoiceSubscriptionContext___block_invoke;
  v10[3] = &unk_1E5260BA0;
  void v10[4] = &v11;
  uint64_t v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v10];
  id v5 = objc_alloc_init(CTXPCGetDefaultVoiceRequest);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__CoreTelephonyClient_Subscriber__getUserDefaultVoiceSubscriptionContext___block_invoke_2;
  v9[3] = &unk_1E5261A78;
  v9[4] = &v17;
  void v9[5] = &v11;
  [v4 sendRequest:v5 completionHandler:v9];
  if (a3)
  {
    uint64_t v6 = (void *)v12[5];
    if (v6) {
      *a3 = v6;
    }
  }
  id v7 = (id)v18[5];

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

- (void)getActiveContextsWithCallback:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__CoreTelephonyClient_getActiveContextsWithCallback___block_invoke;
  v7[3] = &unk_1E5260CB8;
  id v5 = v4;
  id v8 = v5;
  uint64_t v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  [v6 getActiveContexts:v5];
}

- (id)getActiveContexts:(id *)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__16;
  uint64_t v19 = __Block_byref_object_dispose__16;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __41__CoreTelephonyClient_getActiveContexts___block_invoke;
  v14[3] = &unk_1E5260BA0;
  void v14[4] = &v15;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v14];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__16;
  uint64_t v12 = __Block_byref_object_dispose__16;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__CoreTelephonyClient_getActiveContexts___block_invoke_2;
  v7[3] = &unk_1E5264818;
  void v7[4] = &v15;
  v7[5] = &v8;
  [v4 getActiveContexts:v7];
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v15, 8);

  return v5;
}

- (void)getSIMStatus:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCSimStatusRequest alloc] initWithContext:v8];
  [(CoreTelephonyClient *)self asynchronousRequest:v7 completionWithString:v6];
}

- (void)asynchronousRequest:(id)a3 completionWithString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__CoreTelephonyClient_Subscriber__asynchronousRequest_completionWithString___block_invoke;
  v13[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v14 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__CoreTelephonyClient_Subscriber__asynchronousRequest_completionWithString___block_invoke_2;
  v11[3] = &unk_1E5263180;
  id v10 = v8;
  id v12 = v10;
  [v9 sendRequest:v6 completionHandler:v11];
}

void __74__CoreTelephonyClient_Subscriber__getUserDefaultVoiceSubscriptionContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v15 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v15;
    id v8 = v15;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v15;
  }

  uint64_t v10 = [v9 context];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

- (id)getSIMStatus:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCSimStatusRequest alloc] initWithContext:v6];
  id v8 = [(CoreTelephonyClient *)self synchronousRequestWithStringResult:v7 error:a4];

  return v8;
}

- (id)synchronousRequestWithStringResult:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__10;
  v23 = __Block_byref_object_dispose__10;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__10;
  uint64_t v17 = __Block_byref_object_dispose__10;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__CoreTelephonyClient_Subscriber__synchronousRequestWithStringResult_error___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__CoreTelephonyClient_Subscriber__synchronousRequestWithStringResult_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  void v11[4] = &v19;
  v11[5] = &v13;
  [v7 sendRequest:v6 completionHandler:v11];
  if (a4)
  {
    id v8 = (void *)v14[5];
    if (v8) {
      *a4 = v8;
    }
  }
  id v9 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

- (id)getPhoneNumber:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy__29;
    v23 = __Block_byref_object_dispose__29;
    id v24 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55__CoreTelephonyClient_Phonebook__getPhoneNumber_error___block_invoke;
    v18[3] = &unk_1E5260BA0;
    v18[4] = &v19;
    id v8 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__29;
    id v16 = __Block_byref_object_dispose__29;
    id v17 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__CoreTelephonyClient_Phonebook__getPhoneNumber_error___block_invoke_2;
    v11[3] = &unk_1E5266CF0;
    void v11[4] = &v19;
    v11[5] = &v12;
    [v8 getPhoneNumberWithCompletion:v7 completion:v11];
    if (a4) {
      *a4 = (id) v20[5];
    }
    id v9 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(&v19, 8);
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    id v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)getPreferredDataSubscriptionContextSync:(id *)a3
{
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy_;
    uint64_t v21 = __Block_byref_object_dispose_;
    id v22 = 0;
    if (a3) {
      *a3 = 0;
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__CoreTelephonyClient_Data__getPreferredDataSubscriptionContextSync___block_invoke;
    v16[3] = &unk_1E5260BA0;
    v16[4] = &v17;
    id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v16];
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = __Block_byref_object_copy_;
    uint64_t v14 = __Block_byref_object_dispose_;
    id v15 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__CoreTelephonyClient_Data__getPreferredDataSubscriptionContextSync___block_invoke_2;
    v9[3] = &unk_1E5260E18;
    v9[4] = &v17;
    void v9[5] = &v10;
    [v5 getPreferredDataSubscriptionContext:v9];
    if (a3)
    {
      id v6 = (void *)v18[5];
      if (v6) {
        *a3 = v6;
      }
    }
    id v7 = (id)v11[5];
    _Block_object_dispose(&v10, 8);

    _Block_object_dispose(&v17, 8);
  }
  else if (a3)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    id v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

char *__49__CoreTelephonyClient_initWithQueue_multiplexer___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
LABEL_11:
    uint64_t v12 = 0;
    goto LABEL_16;
  }
  int v6 = *(_DWORD *)(a2 + 16);
  id v5 = (int *)(a2 + 16);
  if (v6 != 3)
  {
    id v16 = CTLogClient();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __49__CoreTelephonyClient_initWithQueue_multiplexer___block_invoke_cold_3(v5, v16);
    }
    goto LABEL_11;
  }
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(WeakRetained, "supportsCellular"));
  [v7 setObject:v8 forKeyedSubscript:@"hasCellular"];

  id v19 = 0;
  id v9 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:200 options:0 error:&v19];
  id v10 = v19;
  if (v9)
  {
    uint64_t v11 = CTLogClient();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __49__CoreTelephonyClient_initWithQueue_multiplexer___block_invoke_cold_2(buf, [v9 length], v11);
    }
    uint64_t v12 = (char *)malloc_type_calloc(1uLL, [v9 length] + 200, 0x5DFD9F53uLL);
    *(_DWORD *)uint64_t v12 = 1;
    *((_DWORD *)v12 + 1) = [v9 length];
    label = dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 40));
    uint64_t v14 = "unknown";
    if (label) {
      uint64_t v14 = label;
    }
    snprintf(v12 + 136, 0x40uLL, "CoreTelephonyClient: %s", v14);
    id v15 = v9;
    memcpy(v12 + 200, (const void *)[v15 bytes], objc_msgSend(v15, "length"));
  }
  else
  {
    uint64_t v17 = CTLogClient();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __49__CoreTelephonyClient_initWithQueue_multiplexer___block_invoke_cold_1((uint64_t)v10, v17);
    }
    uint64_t v12 = 0;
  }

LABEL_16:
  return v12;
}

- (id)getCurrentDataSubscriptionContextSync:(id *)a3
{
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy_;
    uint64_t v21 = __Block_byref_object_dispose_;
    id v22 = 0;
    if (a3) {
      *a3 = 0;
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__CoreTelephonyClient_Data__getCurrentDataSubscriptionContextSync___block_invoke;
    v16[3] = &unk_1E5260BA0;
    v16[4] = &v17;
    id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v16];
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = __Block_byref_object_copy_;
    uint64_t v14 = __Block_byref_object_dispose_;
    id v15 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__CoreTelephonyClient_Data__getCurrentDataSubscriptionContextSync___block_invoke_2;
    v9[3] = &unk_1E5260E18;
    v9[4] = &v17;
    void v9[5] = &v10;
    [v5 getCurrentDataSubscriptionContext:v9];
    if (a3)
    {
      int v6 = (void *)v18[5];
      if (v6) {
        *a3 = v6;
      }
    }
    id v7 = (id)v11[5];
    _Block_object_dispose(&v10, 8);

    _Block_object_dispose(&v17, 8);
  }
  else if (a3)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    id v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)getCurrentDataSubscriptionContext:(id)a3
{
  id v5 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __63__CoreTelephonyClient_Data__getCurrentDataSubscriptionContext___block_invoke_2;
    uint64_t v12 = &unk_1E5260CB8;
    id v6 = v5;
    id v13 = v6;
    id v7 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v9];
    objc_msgSend(v7, "getCurrentDataSubscriptionContext:", v6, v9, v10, v11, v12);
    id v8 = &v13;
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__CoreTelephonyClient_Data__getCurrentDataSubscriptionContext___block_invoke;
    v14[3] = &unk_1E5260D00;
    id v15 = v5;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v14];
    id v8 = &v15;
  }
}

void __44__CoreTelephonyClient_getDualSimCapability___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (!v6) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

void __67__CoreTelephonyClient_Data__getCurrentDataSubscriptionContextSync___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)getDataStatusBasic:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v9 = v10;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__CoreTelephonyClient_Data__getDataStatusBasic_completion___block_invoke_2;
    v10[3] = &unk_1E5260DC8;
    void v10[4] = v8;
    [(CoreTelephonyClient *)self getDataStatus:v7 completion:v10];
  }
  else
  {
    uint64_t v9 = v11;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__CoreTelephonyClient_Data__getDataStatusBasic_completion___block_invoke;
    v11[3] = &unk_1E5260D00;
    void v11[4] = v8;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v11];
  }
}

- (void)getDataStatus:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __54__CoreTelephonyClient_Data__getDataStatus_completion___block_invoke_2;
    id v15 = &unk_1E5260CB8;
    id v9 = v8;
    id v16 = v9;
    uint64_t v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v12];
    objc_msgSend(v10, "getDataStatus:completion:", v7, v9, v12, v13, v14, v15);
    uint64_t v11 = &v16;
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54__CoreTelephonyClient_Data__getDataStatus_completion___block_invoke;
    v17[3] = &unk_1E5260D00;
    id v18 = v8;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v17];
    uint64_t v11 = &v18;
  }
}

- (int64_t)getDualSimCapability:(id *)a3
{
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__16;
    id v18 = __Block_byref_object_dispose__16;
    id v19 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __44__CoreTelephonyClient_getDualSimCapability___block_invoke;
    v13[3] = &unk_1E5260BA0;
    void v13[4] = &v14;
    id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v13];
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    uint64_t v12 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__CoreTelephonyClient_getDualSimCapability___block_invoke_2;
    v8[3] = &unk_1E52647C8;
    v8[4] = &v14;
    void v8[5] = &v9;
    [v5 getDualSimCapability:v8];
    if (a3) {
      *a3 = (id) v15[5];
    }
    int64_t v6 = v10[3];
    _Block_object_dispose(&v9, 8);

    _Block_object_dispose(&v14, 8);
  }
  else if (a3)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    int64_t v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v6;
}

- (id)copyMobileCountryCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__17;
  v23 = __Block_byref_object_dispose__17;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__CoreTelephonyClient_Registration__copyMobileCountryCode_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  v18[4] = &v19;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__17;
  uint64_t v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  id v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetMobileCountryCodeRequest alloc] initWithContext:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__CoreTelephonyClient_Registration__copyMobileCountryCode_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  void v11[4] = &v19;
  void v11[5] = &v12;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

- (void)getStewieSupportWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__CoreTelephonyClient_Stewie__getStewieSupportWithCompletion___block_invoke;
  v7[3] = &unk_1E5261178;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  [v6 getStewieSupport:v5];
}

- (id)private_setPacketContextActiveByServiceType:(id)a3 connectionType:(int)a4 active:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __101__CoreTelephonyClient_hiddenData__private_setPacketContextActiveByServiceType_connectionType_active___block_invoke;
  v13[3] = &unk_1E5260BA0;
  void v13[4] = &v14;
  id v9 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __101__CoreTelephonyClient_hiddenData__private_setPacketContextActiveByServiceType_connectionType_active___block_invoke_2;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v14;
  [v9 setPacketContextActiveByServiceType:v8 connectionType:v6 active:v5 completion:v12];
  id v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v10;
}

void __101__CoreTelephonyClient_hiddenData__private_setPacketContextActiveByServiceType_connectionType_active___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __101__CoreTelephonyClient_hiddenData__private_setPacketContextActiveByServiceType_connectionType_active___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (id)private_getConnectionAvailability:(id)a3 connectionType:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy_;
  id v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  if (a5) {
    *a5 = 0;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __90__CoreTelephonyClient_hiddenData__private_getConnectionAvailability_connectionType_error___block_invoke;
  v20[3] = &unk_1E5260BA0;
  v20[4] = &v21;
  id v9 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v20];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__CoreTelephonyClient_hiddenData__private_getConnectionAvailability_connectionType_error___block_invoke_2;
  v13[3] = &unk_1E5260BC8;
  void v13[4] = &v21;
  void v13[5] = &v14;
  [v9 getConnectionAvailability:v8 connectionType:v6 completion:v13];
  if (a5)
  {
    id v10 = (void *)v22[5];
    if (v10) {
      *a5 = v10;
    }
  }
  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v21, 8);

  return v11;
}

void __90__CoreTelephonyClient_hiddenData__private_getConnectionAvailability_connectionType_error___block_invoke(uint64_t a1, void *a2)
{
}

void __90__CoreTelephonyClient_hiddenData__private_getConnectionAvailability_connectionType_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)private_getActiveConnections:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy_;
  uint64_t v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  if (a4) {
    *a4 = 0;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __70__CoreTelephonyClient_hiddenData__private_getActiveConnections_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  v18[4] = &v19;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__CoreTelephonyClient_hiddenData__private_getActiveConnections_error___block_invoke_2;
  v11[3] = &unk_1E5260BF0;
  void v11[4] = &v19;
  void v11[5] = &v12;
  [v7 getActiveConnections:v6 completion:v11];
  if (a4)
  {
    id v8 = (void *)v20[5];
    if (v8) {
      *a4 = v8;
    }
  }
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v19, 8);

  return v9;
}

void __70__CoreTelephonyClient_hiddenData__private_getActiveConnections_error___block_invoke(uint64_t a1, void *a2)
{
}

void __70__CoreTelephonyClient_hiddenData__private_getActiveConnections_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __83__CoreTelephonyClient_hiddenData__private_getConnectionState_connectionType_error___block_invoke(uint64_t a1, void *a2)
{
}

- (id)private_getSliceTrafficDescriptorsInfo:(id)a3 connectionType:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    id v25 = __Block_byref_object_copy_;
    id v26 = __Block_byref_object_dispose_;
    id v27 = 0;
    if (a5) {
      *a5 = 0;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __95__CoreTelephonyClient_hiddenData__private_getSliceTrafficDescriptorsInfo_connectionType_error___block_invoke;
    v21[3] = &unk_1E5260BA0;
    v21[4] = &v22;
    id v10 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v21];
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy_;
    uint64_t v19 = __Block_byref_object_dispose_;
    id v20 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __95__CoreTelephonyClient_hiddenData__private_getSliceTrafficDescriptorsInfo_connectionType_error___block_invoke_2;
    v14[3] = &unk_1E5260BF0;
    void v14[4] = &v22;
    void v14[5] = &v15;
    [v10 getSliceTrafficDescriptorsInfo:v9 connectionType:v6 completion:v14];
    if (a5)
    {
      id v11 = (void *)v23[5];
      if (v11) {
        *a5 = v11;
      }
    }
    id v12 = (id)v16[5];
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v22, 8);
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    id v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __95__CoreTelephonyClient_hiddenData__private_getSliceTrafficDescriptorsInfo_connectionType_error___block_invoke(uint64_t a1, void *a2)
{
}

void __95__CoreTelephonyClient_hiddenData__private_getSliceTrafficDescriptorsInfo_connectionType_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)private_getSliceTrafficDescriptors:(id *)a3
{
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy_;
    uint64_t v21 = __Block_byref_object_dispose_;
    id v22 = 0;
    if (a3) {
      *a3 = 0;
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70__CoreTelephonyClient_hiddenData__private_getSliceTrafficDescriptors___block_invoke;
    v16[3] = &unk_1E5260BA0;
    v16[4] = &v17;
    id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v16];
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = __Block_byref_object_copy_;
    uint64_t v14 = __Block_byref_object_dispose_;
    id v15 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__CoreTelephonyClient_hiddenData__private_getSliceTrafficDescriptors___block_invoke_2;
    v9[3] = &unk_1E5260C40;
    v9[4] = &v17;
    void v9[5] = &v10;
    [v5 getSliceTrafficDescriptors:v9];
    if (a3)
    {
      uint64_t v6 = (void *)v18[5];
      if (v6) {
        *a3 = v6;
      }
    }
    id v7 = (id)v11[5];
    _Block_object_dispose(&v10, 8);

    _Block_object_dispose(&v17, 8);
  }
  else if (a3)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    id v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __70__CoreTelephonyClient_hiddenData__private_getSliceTrafficDescriptors___block_invoke(uint64_t a1, void *a2)
{
}

void __70__CoreTelephonyClient_hiddenData__private_getSliceTrafficDescriptors___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __63__CoreTelephonyClient_hiddenData__private_getDataStatus_error___block_invoke(uint64_t a1, void *a2)
{
}

- (unsigned)private_getNATTKeepAliveOverCell:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy_;
    id v22 = __Block_byref_object_dispose_;
    id v23 = 0;
    if (a4) {
      *a4 = 0;
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __74__CoreTelephonyClient_hiddenData__private_getNATTKeepAliveOverCell_error___block_invoke;
    v17[3] = &unk_1E5260BA0;
    void v17[4] = &v18;
    id v8 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    int v16 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__CoreTelephonyClient_hiddenData__private_getNATTKeepAliveOverCell_error___block_invoke_2;
    v12[3] = &unk_1E5260C90;
    void v12[4] = &v18;
    void v12[5] = &v13;
    [v8 getNATTKeepAliveOverCell:v7 completion:v12];
    if (a4)
    {
      id v9 = (void *)v19[5];
      if (v9) {
        *a4 = v9;
      }
    }
    unsigned int v10 = *((_DWORD *)v14 + 6);
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(&v18, 8);
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    unsigned int v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned int v10 = 0;
  }

  return v10;
}

void __74__CoreTelephonyClient_hiddenData__private_getNATTKeepAliveOverCell_error___block_invoke(uint64_t a1, void *a2)
{
}

void __74__CoreTelephonyClient_hiddenData__private_getNATTKeepAliveOverCell_error___block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)setPacketContextActiveByServiceType:(id)a3 connectionType:(int)a4 active:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  id v12 = a3;
  id v10 = a6;
  id v11 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v11 setPacketContextActiveByServiceType:v12 connectionType:v8 active:v7 completion:v10];
}

- (id)setPacketContextActiveByServiceType:(id)a3 connectionType:(int)a4 active:(BOOL)a5
{
  id v5 = [(CoreTelephonyClient *)self private_setPacketContextActiveByServiceType:a3 connectionType:*(void *)&a4 active:a5];

  return v5;
}

- (void)requestSliceByUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__CoreTelephonyClient_Data__requestSliceByUUID_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 requestSliceByUUID:v6 completion:v8];
}

uint64_t __59__CoreTelephonyClient_Data__requestSliceByUUID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestSliceDeactivation:(id)a3
{
  id v5 = a3;
  id v4 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&__block_literal_global];
  [v4 requestSliceDeactivation:v5 completion:&__block_literal_global_19];
}

- (void)setInternetActive:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    id v8 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
    [v8 setPacketContextActiveByServiceType:0 connectionType:0 active:v4 completion:v7];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__CoreTelephonyClient_Data__setInternetActive_completion___block_invoke;
    v9[3] = &unk_1E5260D00;
    id v10 = v7;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v9];
  }
}

void __58__CoreTelephonyClient_Data__setInternetActive_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (id)setInternetActive:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2]) {
    [(CoreTelephonyClient *)self private_setPacketContextActiveByServiceType:0 connectionType:0 active:v3];
  }
  else {
  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  }

  return v5;
}

- (void)setTetheringActive:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    id v8 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
    [v8 setPacketContextActiveByServiceType:0 connectionType:4 active:v4 completion:v7];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__CoreTelephonyClient_Data__setTetheringActive_completion___block_invoke;
    v9[3] = &unk_1E5260D00;
    id v10 = v7;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v9];
  }
}

void __59__CoreTelephonyClient_Data__setTetheringActive_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (id)setTetheringActive:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2]) {
    [(CoreTelephonyClient *)self private_setPacketContextActiveByServiceType:0 connectionType:4 active:v3];
  }
  else {
  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  }

  return v5;
}

- (void)resetAPNSettings:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__CoreTelephonyClient_Data__resetAPNSettings___block_invoke;
  v7[3] = &unk_1E5260CB8;
  id v5 = v4;
  id v8 = v5;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  [v6 resetAPNSettings:v5];
}

uint64_t __46__CoreTelephonyClient_Data__resetAPNSettings___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)resetAPNSettings
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__CoreTelephonyClient_Data__resetAPNSettings__block_invoke;
  v6[3] = &unk_1E5260BA0;
  v6[4] = &v7;
  id v2 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__CoreTelephonyClient_Data__resetAPNSettings__block_invoke_2;
  v5[3] = &unk_1E5260BA0;
  v5[4] = &v7;
  [v2 resetAPNSettings:v5];
  id v3 = (id)v8[5];

  _Block_object_dispose(&v7, 8);

  return v3;
}

void __45__CoreTelephonyClient_Data__resetAPNSettings__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __45__CoreTelephonyClient_Data__resetAPNSettings__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)addLowLatencyFilter:(id)a3 pdp:(int)a4 queueSetId:(unint64_t)a5 uplink:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  uint64_t v10 = *(void *)&a4;
  id v13 = a3;
  id v14 = a7;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __82__CoreTelephonyClient_Data__addLowLatencyFilter_pdp_queueSetId_uplink_completion___block_invoke_2;
    uint64_t v21 = &unk_1E5260CB8;
    id v15 = v14;
    id v22 = v15;
    int v16 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v18];
    objc_msgSend(v16, "addLowLatencyFilter:pdp:queueSetId:uplink:completion:", v13, v10, a5, v8, v15, v18, v19, v20, v21);
    uint64_t v17 = &v22;
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __82__CoreTelephonyClient_Data__addLowLatencyFilter_pdp_queueSetId_uplink_completion___block_invoke;
    v23[3] = &unk_1E5260D00;
    id v24 = v14;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v23];
    uint64_t v17 = &v24;
  }
}

void __82__CoreTelephonyClient_Data__addLowLatencyFilter_pdp_queueSetId_uplink_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

uint64_t __82__CoreTelephonyClient_Data__addLowLatencyFilter_pdp_queueSetId_uplink_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getLowLatencyFilters:(int)a3 queueSetId:(unint64_t)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v9 = a5;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __72__CoreTelephonyClient_Data__getLowLatencyFilters_queueSetId_completion___block_invoke_2;
    int v16 = &unk_1E5260CB8;
    id v10 = v9;
    id v17 = v10;
    id v11 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v13];
    objc_msgSend(v11, "getLowLatencyFilters:queueSetId:completion:", v6, a4, v10, v13, v14, v15, v16);
    id v12 = &v17;
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __72__CoreTelephonyClient_Data__getLowLatencyFilters_queueSetId_completion___block_invoke;
    v18[3] = &unk_1E5260D00;
    id v19 = v9;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v18];
    id v12 = &v19;
  }
}

void __72__CoreTelephonyClient_Data__getLowLatencyFilters_queueSetId_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

uint64_t __72__CoreTelephonyClient_Data__getLowLatencyFilters_queueSetId_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteLowLatencyFilter:(id)a3 pdp:(int)a4 queueSetId:(unint64_t)a5 uplink:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  uint64_t v10 = *(void *)&a4;
  id v13 = a3;
  id v14 = a7;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __85__CoreTelephonyClient_Data__deleteLowLatencyFilter_pdp_queueSetId_uplink_completion___block_invoke_2;
    uint64_t v21 = &unk_1E5260CB8;
    id v15 = v14;
    id v22 = v15;
    int v16 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v18];
    objc_msgSend(v16, "deleteLowLatencyFilter:pdp:queueSetId:uplink:completion:", v13, v10, a5, v8, v15, v18, v19, v20, v21);
    id v17 = &v22;
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __85__CoreTelephonyClient_Data__deleteLowLatencyFilter_pdp_queueSetId_uplink_completion___block_invoke;
    v23[3] = &unk_1E5260D00;
    id v24 = v14;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v23];
    id v17 = &v24;
  }
}

void __85__CoreTelephonyClient_Data__deleteLowLatencyFilter_pdp_queueSetId_uplink_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

uint64_t __85__CoreTelephonyClient_Data__deleteLowLatencyFilter_pdp_queueSetId_uplink_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendDeadPeerDetection:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__CoreTelephonyClient_Data__sendDeadPeerDetection___block_invoke;
  v7[3] = &unk_1E5260CB8;
  id v5 = v4;
  id v8 = v5;
  uint64_t v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  [v6 sendDeadPeerDetection:v5];
}

uint64_t __51__CoreTelephonyClient_Data__sendDeadPeerDetection___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)sendDeadPeerDetection
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__CoreTelephonyClient_Data__sendDeadPeerDetection__block_invoke;
  v6[3] = &unk_1E5260BA0;
  v6[4] = &v7;
  id v2 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__CoreTelephonyClient_Data__sendDeadPeerDetection__block_invoke_2;
  v5[3] = &unk_1E5260BA0;
  v5[4] = &v7;
  [v2 sendDeadPeerDetection:v5];
  id v3 = (id)v8[5];

  _Block_object_dispose(&v7, 8);

  return v3;
}

void __50__CoreTelephonyClient_Data__sendDeadPeerDetection__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __50__CoreTelephonyClient_Data__sendDeadPeerDetection__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)setInternationalDataAccessStatus:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__CoreTelephonyClient_Data__setInternationalDataAccessStatus_completion___block_invoke;
  aBlock[3] = &unk_1E5260D28;
  BOOL v11 = a3;
  aBlock[4] = self;
  id v10 = v6;
  id v7 = v6;
  id v8 = _Block_copy(aBlock);
  [(CoreTelephonyClient *)self getCurrentDataServiceDescriptor:v8];
}

void __73__CoreTelephonyClient_Data__setInternationalDataAccessStatus_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = v8;
  id v7 = v5;
  if (!v8) {
    id v6 = [[CTServiceDescriptor alloc] initWithDomain:1 instance:&unk_1ED01DF50];
  }
  uint64_t v9 = v6;
  objc_msgSend(*(id *)(a1 + 32), "setInternationalDataAccess:status:completion:");
}

- (id)setInternationalDataAccessStatus:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = 0;
  id v5 = [(CoreTelephonyClient *)self getCurrentDataServiceDescriptorSync:&v9];
  id v6 = v9;
  if (!v5) {
    id v5 = [[CTServiceDescriptor alloc] initWithDomain:1 instance:&unk_1ED01DF50];
  }
  id v7 = [(CoreTelephonyClient *)self setInternationalDataAccessSync:v5 status:v3];

  return v7;
}

- (void)setInternationalDataAccess:(id)a3 status:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  id v8 = a5;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v8];
  [v9 setInternationalDataAccess:v10 status:v6 completion:v8];
}

- (id)setInternationalDataAccessSync:(id)a3 status:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  int v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__CoreTelephonyClient_Data__setInternationalDataAccessSync_status___block_invoke;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v12;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__CoreTelephonyClient_Data__setInternationalDataAccessSync_status___block_invoke_2;
  v10[3] = &unk_1E5260BA0;
  void v10[4] = &v12;
  [v7 setInternationalDataAccess:v6 status:v4 completion:v10];
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v8;
}

void __67__CoreTelephonyClient_Data__setInternationalDataAccessSync_status___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __67__CoreTelephonyClient_Data__setInternationalDataAccessSync_status___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)getInternationalDataAccessStatus:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __62__CoreTelephonyClient_Data__getInternationalDataAccessStatus___block_invoke;
  id v10 = &unk_1E5260D50;
  BOOL v11 = self;
  id v12 = v4;
  id v5 = v4;
  id v6 = _Block_copy(&v7);
  -[CoreTelephonyClient getCurrentDataServiceDescriptor:](self, "getCurrentDataServiceDescriptor:", v6, v7, v8, v9, v10, v11);
}

void __62__CoreTelephonyClient_Data__getInternationalDataAccessStatus___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v8 = a2;
  id v5 = a3;
  id v6 = v8;
  id v7 = v5;
  if (!v8) {
    id v6 = [[CTServiceDescriptor alloc] initWithDomain:1 instance:&unk_1ED01DF50];
  }
  id v9 = v6;
  objc_msgSend(*(id *)(a1 + 32), "getInternationalDataAccess:completion:");
}

- (BOOL)getInternationalDataAccessStatusSync:(id *)a3
{
  id v9 = 0;
  id v5 = [(CoreTelephonyClient *)self getCurrentDataServiceDescriptorSync:&v9];
  id v6 = v9;
  if (!v5) {
    id v5 = [[CTServiceDescriptor alloc] initWithDomain:1 instance:&unk_1ED01DF50];
  }
  BOOL v7 = [(CoreTelephonyClient *)self getInternationalDataAccessSync:v5 error:a3];

  return v7;
}

- (void)getInternationalDataAccess:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__CoreTelephonyClient_Data__getInternationalDataAccess_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 getInternationalDataAccess:v6 completion:v8];
}

uint64_t __67__CoreTelephonyClient_Data__getInternationalDataAccess_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)getInternationalDataAccessSync:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  if (a4) {
    *a4 = 0;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__CoreTelephonyClient_Data__getInternationalDataAccessSync_error___block_invoke;
  v16[3] = &unk_1E5260BA0;
  v16[4] = &v17;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v16];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__CoreTelephonyClient_Data__getInternationalDataAccessSync_error___block_invoke_2;
  v11[3] = &unk_1E5260D78;
  void v11[4] = &v17;
  void v11[5] = &v12;
  [v7 getInternationalDataAccess:v6 completion:v11];
  if (a4)
  {
    id v8 = (void *)v18[5];
    if (v8) {
      *a4 = v8;
    }
  }
  char v9 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __66__CoreTelephonyClient_Data__getInternationalDataAccessSync_error___block_invoke(uint64_t a1, void *a2)
{
}

void __66__CoreTelephonyClient_Data__getInternationalDataAccessSync_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)setSupportDynamicDataSimSwitch:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v6 = -[CoreTelephonyClient proxyWithErrorHandler:](self, "proxyWithErrorHandler:");
  [v6 setSupportDynamicDataSimSwitch:v4 completion:v7];
}

- (void)setSupportDynamicDataSimSwitch:(BOOL)a3 forIccid:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v10 = a4;
  id v8 = a5;
  char v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v8];
  [v9 setSupportDynamicDataSimSwitch:v6 forIccid:v10 completion:v8];
}

- (id)setSupportDynamicDataSimSwitch:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy_;
  id v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__CoreTelephonyClient_Data__setSupportDynamicDataSimSwitch___block_invoke;
  v8[3] = &unk_1E5260BA0;
  v8[4] = &v9;
  BOOL v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__CoreTelephonyClient_Data__setSupportDynamicDataSimSwitch___block_invoke_2;
  v7[3] = &unk_1E5260BA0;
  void v7[4] = &v9;
  [v4 setSupportDynamicDataSimSwitch:v3 completion:v7];
  id v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v5;
}

void __60__CoreTelephonyClient_Data__setSupportDynamicDataSimSwitch___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __60__CoreTelephonyClient_Data__setSupportDynamicDataSimSwitch___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)getSupportDynamicDataSimSwitch:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__CoreTelephonyClient_Data__getSupportDynamicDataSimSwitch___block_invoke;
  v7[3] = &unk_1E5260CB8;
  id v5 = v4;
  id v8 = v5;
  BOOL v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  [v6 getSupportDynamicDataSimSwitch:v5];
}

uint64_t __60__CoreTelephonyClient_Data__getSupportDynamicDataSimSwitch___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)getSupportDynamicDataSimSwitchSync:(id *)a3
{
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  if (a3) {
    *a3 = 0;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__CoreTelephonyClient_Data__getSupportDynamicDataSimSwitchSync___block_invoke;
  v13[3] = &unk_1E5260BA0;
  void v13[4] = &v14;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v13];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__CoreTelephonyClient_Data__getSupportDynamicDataSimSwitchSync___block_invoke_2;
  v8[3] = &unk_1E5260D78;
  v8[4] = &v14;
  void v8[5] = &v9;
  [v4 getSupportDynamicDataSimSwitch:v8];
  if (a3)
  {
    id v5 = (void *)v15[5];
    if (v5) {
      *a3 = v5;
    }
  }
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v14, 8);
  return v6;
}

void __64__CoreTelephonyClient_Data__getSupportDynamicDataSimSwitchSync___block_invoke(uint64_t a1, void *a2)
{
}

void __64__CoreTelephonyClient_Data__getSupportDynamicDataSimSwitchSync___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (id)getPacketContextCount:(unsigned int *)a3
{
  if (a3)
  {
    uint64_t v14 = 0;
    char v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy_;
    uint64_t v18 = __Block_byref_object_dispose_;
    id v19 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__CoreTelephonyClient_Data__getPacketContextCount___block_invoke;
    v13[3] = &unk_1E5260BA0;
    void v13[4] = &v14;
    id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v13];
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    int v12 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__CoreTelephonyClient_Data__getPacketContextCount___block_invoke_2;
    v8[3] = &unk_1E5260DA0;
    v8[4] = &v9;
    [v4 getPacketContextCount:v8];
    *a3 = *((_DWORD *)v10 + 6);
    id v5 = (id)v15[5];
    _Block_object_dispose(&v9, 8);

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v5 = (id)[v6 initWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
  }

  return v5;
}

void __51__CoreTelephonyClient_Data__getPacketContextCount___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __51__CoreTelephonyClient_Data__getPacketContextCount___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)getConnectionAvailability:(id)a3 connectionType:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__CoreTelephonyClient_Data__getConnectionAvailability_connectionType_completion___block_invoke;
  v12[3] = &unk_1E5260CB8;
  id v10 = v9;
  id v13 = v10;
  uint64_t v11 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v12];
  [v11 getConnectionAvailability:v8 connectionType:v6 completion:v10];
}

uint64_t __81__CoreTelephonyClient_Data__getConnectionAvailability_connectionType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getConnectionAvailability:(id)a3 connectionType:(int)a4 error:(id *)a5
{
  id v5 = [(CoreTelephonyClient *)self private_getConnectionAvailability:a3 connectionType:*(void *)&a4 error:a5];

  return v5;
}

- (void)getInternetConnectionAvailability:(id)a3
{
  id v5 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __63__CoreTelephonyClient_Data__getInternetConnectionAvailability___block_invoke_2;
    int v12 = &unk_1E5260CB8;
    id v6 = v5;
    id v13 = v6;
    id v7 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v9];
    objc_msgSend(v7, "getConnectionAvailability:connectionType:completion:", 0, 0, v6, v9, v10, v11, v12);
    id v8 = &v13;
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__CoreTelephonyClient_Data__getInternetConnectionAvailability___block_invoke;
    v14[3] = &unk_1E5260D00;
    id v15 = v5;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v14];
    id v8 = &v15;
  }
}

void __63__CoreTelephonyClient_Data__getInternetConnectionAvailability___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

uint64_t __63__CoreTelephonyClient_Data__getInternetConnectionAvailability___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getInternetConnectionAvailabilitySync:(id *)a3
{
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    id v5 = [(CoreTelephonyClient *)self private_getConnectionAvailability:0 connectionType:0 error:a3];
  }
  else if (a3)
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    id v5 = 0;
    *a3 = v6;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)getActiveConnections:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__CoreTelephonyClient_Data__getActiveConnections_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  uint64_t v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 getActiveConnections:v6 completion:v8];
}

uint64_t __61__CoreTelephonyClient_Data__getActiveConnections_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getActiveConnections:(id)a3 error:(id *)a4
{
  id v4 = [(CoreTelephonyClient *)self private_getActiveConnections:a3 error:a4];

  return v4;
}

- (void)getConnectionState:(id)a3 connectionType:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  id v10 = a5;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __74__CoreTelephonyClient_Data__getConnectionState_connectionType_completion___block_invoke_2;
    uint64_t v17 = &unk_1E5260CB8;
    id v11 = v10;
    id v18 = v11;
    int v12 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v14];
    objc_msgSend(v12, "getConnectionState:connectionType:completion:", v9, v6, v11, v14, v15, v16, v17);
    id v13 = &v18;
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __74__CoreTelephonyClient_Data__getConnectionState_connectionType_completion___block_invoke;
    v19[3] = &unk_1E5260D00;
    id v20 = v10;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v19];
    id v13 = &v20;
  }
}

void __74__CoreTelephonyClient_Data__getConnectionState_connectionType_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

uint64_t __74__CoreTelephonyClient_Data__getConnectionState_connectionType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getSliceTrafficDescriptorsInfo:(id)a3 connectionType:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    id v10 = [(CoreTelephonyClient *)self private_getSliceTrafficDescriptorsInfo:v9 connectionType:v6 error:a5];
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    id v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)getSliceTrafficDescriptors:(id *)a3
{
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    id v5 = [(CoreTelephonyClient *)self private_getSliceTrafficDescriptors:a3];
  }
  else if (a3)
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    id v5 = 0;
    *a3 = v6;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)getInternetConnectionState:(id)a3
{
  id v5 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __56__CoreTelephonyClient_Data__getInternetConnectionState___block_invoke_2;
    int v12 = &unk_1E5260CB8;
    id v6 = v5;
    id v13 = v6;
    id v7 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v9];
    objc_msgSend(v7, "getConnectionState:connectionType:completion:", 0, 0, v6, v9, v10, v11, v12);
    id v8 = &v13;
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__CoreTelephonyClient_Data__getInternetConnectionState___block_invoke;
    v14[3] = &unk_1E5260D00;
    id v15 = v5;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v14];
    id v8 = &v15;
  }
}

void __56__CoreTelephonyClient_Data__getInternetConnectionState___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

uint64_t __56__CoreTelephonyClient_Data__getInternetConnectionState___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54__CoreTelephonyClient_Data__getDataStatus_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

uint64_t __54__CoreTelephonyClient_Data__getDataStatus_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__CoreTelephonyClient_Data__getDataStatusBasic_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

void __59__CoreTelephonyClient_Data__getDataStatusBasic_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7) {
    id v6 = (void *)[v7 copyBasic];
  }
  else {
    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getDataStatusBasic:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    id v8 = [(CoreTelephonyClient *)self getDataStatus:v7 error:a4];
    uint64_t v9 = v8;
    if (v8) {
      uint64_t v10 = (void *)[v8 copyBasic];
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    uint64_t v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)getInternetDataStatus:(id)a3
{
  id v5 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __51__CoreTelephonyClient_Data__getInternetDataStatus___block_invoke_2;
    int v12 = &unk_1E5260CB8;
    id v6 = v5;
    id v13 = v6;
    id v7 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v9];
    objc_msgSend(v7, "getDataStatus:completion:", 0, v6, v9, v10, v11, v12);
    id v8 = &v13;
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51__CoreTelephonyClient_Data__getInternetDataStatus___block_invoke;
    v14[3] = &unk_1E5260D00;
    id v15 = v5;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v14];
    id v8 = &v15;
  }
}

void __51__CoreTelephonyClient_Data__getInternetDataStatus___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

uint64_t __51__CoreTelephonyClient_Data__getInternetDataStatus___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getInternetDataStatusSync:(id *)a3
{
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    id v5 = [(CoreTelephonyClient *)self private_getDataStatus:0 error:a3];
  }
  else if (a3)
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    id v5 = 0;
    *a3 = v6;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)getInternetDataStatusBasic:(id)a3
{
  id v5 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    id v6 = v7;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__CoreTelephonyClient_Data__getInternetDataStatusBasic___block_invoke_2;
    v7[3] = &unk_1E5260DC8;
    void v7[4] = v5;
    [(CoreTelephonyClient *)self getInternetDataStatus:v7];
  }
  else
  {
    id v6 = v8;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__CoreTelephonyClient_Data__getInternetDataStatusBasic___block_invoke;
    v8[3] = &unk_1E5260D00;
    v8[4] = v5;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v8];
  }
}

void __56__CoreTelephonyClient_Data__getInternetDataStatusBasic___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

void __56__CoreTelephonyClient_Data__getInternetDataStatusBasic___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7) {
    id v6 = (void *)[v7 copyBasic];
  }
  else {
    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getInternetDataStatusBasicSync:(id *)a3
{
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    id v5 = [(CoreTelephonyClient *)self getInternetDataStatusSync:a3];
    id v6 = v5;
    if (v5) {
      id v7 = (void *)[v5 copyBasic];
    }
    else {
      id v7 = 0;
    }
  }
  else if (a3)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    id v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)getNATTKeepAliveOverCell:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __65__CoreTelephonyClient_Data__getNATTKeepAliveOverCell_completion___block_invoke_2;
    id v15 = &unk_1E5260CB8;
    id v9 = v8;
    id v16 = v9;
    uint64_t v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v12];
    objc_msgSend(v10, "getNATTKeepAliveOverCell:completion:", v7, v9, v12, v13, v14, v15);
    id v11 = &v16;
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__CoreTelephonyClient_Data__getNATTKeepAliveOverCell_completion___block_invoke;
    v17[3] = &unk_1E5260D00;
    id v18 = v8;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v17];
    id v11 = &v18;
  }
}

void __65__CoreTelephonyClient_Data__getNATTKeepAliveOverCell_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

uint64_t __65__CoreTelephonyClient_Data__getNATTKeepAliveOverCell_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unsigned)getNATTKeepAliveOverCell:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    unsigned int v8 = [(CoreTelephonyClient *)self private_getNATTKeepAliveOverCell:v7 error:a4];
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    unsigned int v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned int v8 = 0;
  }

  return v8;
}

- (unsigned)getNATTKeepAliveOverCell:(id *)a3
{
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    return [(CoreTelephonyClient *)self private_getNATTKeepAliveOverCell:0 error:a3];
  }
  else
  {
    if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    }
    return 0;
  }
}

- (unsigned)getNATTKeepAliveOverCellForPreferredDataContext:(id *)a3
{
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    return [(CoreTelephonyClient *)self private_getNATTKeepAliveOverCell:0 error:a3];
  }
  else
  {
    if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    }
    return 0;
  }
}

- (BOOL)isTetheringEditingSupported:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy_;
  id v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __63__CoreTelephonyClient_Data__isTetheringEditingSupported_error___block_invoke;
  v15[3] = &unk_1E5260BA0;
  void v15[4] = &v16;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v15];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__CoreTelephonyClient_Data__isTetheringEditingSupported_error___block_invoke_2;
  v10[3] = &unk_1E5260D78;
  void v10[4] = &v16;
  void v10[5] = &v11;
  [v7 isTetheringEditingSupported:v6 completion:v10];
  if (a4) {
    *a4 = (id) v17[5];
  }
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __63__CoreTelephonyClient_Data__isTetheringEditingSupported_error___block_invoke(uint64_t a1, void *a2)
{
}

void __63__CoreTelephonyClient_Data__isTetheringEditingSupported_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)isTetheringEditingSupported:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__CoreTelephonyClient_Data__isTetheringEditingSupported_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 isTetheringEditingSupported:v6 completion:v8];
}

uint64_t __68__CoreTelephonyClient_Data__isTetheringEditingSupported_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAnbrActivationState:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    char v14 = __63__CoreTelephonyClient_Data__getAnbrActivationState_completion___block_invoke_2;
    id v15 = &unk_1E5260CB8;
    id v9 = v8;
    id v16 = v9;
    uint64_t v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v12];
    objc_msgSend(v10, "getAnbrActivationState:completion:", v7, v9, v12, v13, v14, v15);
    id v11 = &v16;
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63__CoreTelephonyClient_Data__getAnbrActivationState_completion___block_invoke;
    v17[3] = &unk_1E5260D00;
    id v18 = v8;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v17];
    id v11 = &v18;
  }
}

void __63__CoreTelephonyClient_Data__getAnbrActivationState_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

uint64_t __63__CoreTelephonyClient_Data__getAnbrActivationState_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)queryAnbrBitrate:(id)a3 bitrate:(id)a4 direction:(int)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __75__CoreTelephonyClient_Data__queryAnbrBitrate_bitrate_direction_completion___block_invoke_2;
    id v20 = &unk_1E5260CB8;
    id v14 = v13;
    id v21 = v14;
    id v15 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v17];
    objc_msgSend(v15, "queryAnbrBitrate:bitrate:direction:completion:", v11, v12, v7, v14, v17, v18, v19, v20);
    id v16 = &v21;
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __75__CoreTelephonyClient_Data__queryAnbrBitrate_bitrate_direction_completion___block_invoke;
    v22[3] = &unk_1E5260D00;
    id v23 = v13;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v22];
    id v16 = &v23;
  }
}

void __75__CoreTelephonyClient_Data__queryAnbrBitrate_bitrate_direction_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

uint64_t __75__CoreTelephonyClient_Data__queryAnbrBitrate_bitrate_direction_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setCoalescing:(BOOL)a3 udp:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v9 = a5;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __58__CoreTelephonyClient_Data__setCoalescing_udp_completion___block_invoke_2;
    id v16 = &unk_1E5260CB8;
    id v10 = v9;
    id v17 = v10;
    id v11 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v13];
    objc_msgSend(v11, "setCoalescing:udp:completion:", v6, v5, v10, v13, v14, v15, v16);
    id v12 = &v17;
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __58__CoreTelephonyClient_Data__setCoalescing_udp_completion___block_invoke;
    v18[3] = &unk_1E5260D00;
    id v19 = v9;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v18];
    id v12 = &v19;
  }
}

void __58__CoreTelephonyClient_Data__setCoalescing_udp_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

uint64_t __58__CoreTelephonyClient_Data__setCoalescing_udp_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)simulateDataStall:(BOOL)a3 pdp:(int)a4 completion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  BOOL v6 = a3;
  id v9 = a5;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __62__CoreTelephonyClient_Data__simulateDataStall_pdp_completion___block_invoke_2;
    id v16 = &unk_1E5260CB8;
    id v10 = v9;
    id v17 = v10;
    id v11 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v13];
    objc_msgSend(v11, "simulateDataStall:pdp:completion:", v6, v5, v10, v13, v14, v15, v16);
    id v12 = &v17;
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __62__CoreTelephonyClient_Data__simulateDataStall_pdp_completion___block_invoke;
    v18[3] = &unk_1E5260D00;
    id v19 = v9;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v18];
    id v12 = &v19;
  }
}

void __62__CoreTelephonyClient_Data__simulateDataStall_pdp_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

uint64_t __62__CoreTelephonyClient_Data__simulateDataStall_pdp_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__CoreTelephonyClient_Data__getCurrentDataSubscriptionContext___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

uint64_t __63__CoreTelephonyClient_Data__getCurrentDataSubscriptionContext___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getCurrentDataServiceDescriptor:(id)a3
{
  id v5 = a3;
  if (![(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __61__CoreTelephonyClient_Data__getCurrentDataServiceDescriptor___block_invoke;
    v15[3] = &unk_1E5260D00;
    id v16 = v5;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v15];
    uint64_t v7 = v16;
LABEL_9:

    goto LABEL_10;
  }
  if (!v5)
  {
LABEL_8:
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__CoreTelephonyClient_Data__getCurrentDataServiceDescriptor___block_invoke_2;
    v13[3] = &unk_1E5260CB8;
    id v8 = v5;
    id v14 = v8;
    id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__CoreTelephonyClient_Data__getCurrentDataServiceDescriptor___block_invoke_3;
    v10[3] = &unk_1E5260DF0;
    void v10[4] = self;
    id v12 = sel_getCurrentDataServiceDescriptor_;
    id v11 = v8;
    [v9 getCurrentDataServiceDescriptor:v10];

    uint64_t v7 = v14;
    goto LABEL_9;
  }
  BOOL v6 = [(CoreTelephonyClient *)self cachedValueForSelector:sel_getCurrentDataServiceDescriptor_];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    goto LABEL_8;
  }
  (*((void (**)(id, void *, void))v5 + 2))(v5, v6, 0);

LABEL_10:
}

void __61__CoreTelephonyClient_Data__getCurrentDataServiceDescriptor___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

uint64_t __61__CoreTelephonyClient_Data__getCurrentDataServiceDescriptor___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__CoreTelephonyClient_Data__getCurrentDataServiceDescriptor___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) cacheValue:v6 forSelector:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __67__CoreTelephonyClient_Data__getCurrentDataSubscriptionContextSync___block_invoke(uint64_t a1, void *a2)
{
}

void __65__CoreTelephonyClient_Data__getCurrentDataServiceDescriptorSync___block_invoke(uint64_t a1, void *a2)
{
}

- (void)getPreferredDataSubscriptionContext:(id)a3
{
  id v5 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __65__CoreTelephonyClient_Data__getPreferredDataSubscriptionContext___block_invoke_2;
    id v12 = &unk_1E5260CB8;
    id v6 = v5;
    id v13 = v6;
    uint64_t v7 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v9];
    objc_msgSend(v7, "getPreferredDataSubscriptionContext:", v6, v9, v10, v11, v12);
    id v8 = &v13;
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__CoreTelephonyClient_Data__getPreferredDataSubscriptionContext___block_invoke;
    v14[3] = &unk_1E5260D00;
    id v15 = v5;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v14];
    id v8 = &v15;
  }
}

void __65__CoreTelephonyClient_Data__getPreferredDataSubscriptionContext___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

uint64_t __65__CoreTelephonyClient_Data__getPreferredDataSubscriptionContext___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPreferredDataServiceDescriptor:(id)a3
{
  id v5 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __63__CoreTelephonyClient_Data__getPreferredDataServiceDescriptor___block_invoke_2;
    id v12 = &unk_1E5260CB8;
    id v6 = v5;
    id v13 = v6;
    uint64_t v7 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v9];
    objc_msgSend(v7, "getPreferredDataServiceDescriptor:", v6, v9, v10, v11, v12);
    id v8 = &v13;
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__CoreTelephonyClient_Data__getPreferredDataServiceDescriptor___block_invoke;
    v14[3] = &unk_1E5260D00;
    id v15 = v5;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v14];
    id v8 = &v15;
  }
}

void __63__CoreTelephonyClient_Data__getPreferredDataServiceDescriptor___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

uint64_t __63__CoreTelephonyClient_Data__getPreferredDataServiceDescriptor___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__CoreTelephonyClient_Data__getPreferredDataSubscriptionContextSync___block_invoke(uint64_t a1, void *a2)
{
}

- (id)getPreferredDataServiceDescriptorSync:(id *)a3
{
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy_;
    id v21 = __Block_byref_object_dispose_;
    id v22 = 0;
    if (a3) {
      *a3 = 0;
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__CoreTelephonyClient_Data__getPreferredDataServiceDescriptorSync___block_invoke;
    v16[3] = &unk_1E5260BA0;
    v16[4] = &v17;
    id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v16];
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = __Block_byref_object_copy_;
    id v14 = __Block_byref_object_dispose_;
    id v15 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__CoreTelephonyClient_Data__getPreferredDataServiceDescriptorSync___block_invoke_2;
    v9[3] = &unk_1E5260E40;
    void v9[4] = &v17;
    void v9[5] = &v10;
    [v5 getPreferredDataServiceDescriptor:v9];
    if (a3)
    {
      id v6 = (void *)v18[5];
      if (v6) {
        *a3 = v6;
      }
    }
    id v7 = (id)v11[5];
    _Block_object_dispose(&v10, 8);

    _Block_object_dispose(&v17, 8);
  }
  else if (a3)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    id v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __67__CoreTelephonyClient_Data__getPreferredDataServiceDescriptorSync___block_invoke(uint64_t a1, void *a2)
{
}

void __67__CoreTelephonyClient_Data__getPreferredDataServiceDescriptorSync___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)getTetheringStatus:(id)a3
{
  id v5 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    [(CoreTelephonyClient *)self getTetheringStatus:v5 connectionType:4];
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__CoreTelephonyClient_Data__getTetheringStatus___block_invoke;
    v6[3] = &unk_1E5260D00;
    id v7 = v5;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v6];
  }
}

void __48__CoreTelephonyClient_Data__getTetheringStatus___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

- (void)getTetheringStatus:(id)a3 connectionType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __63__CoreTelephonyClient_Data__getTetheringStatus_connectionType___block_invoke_2;
    id v14 = &unk_1E5260CB8;
    id v8 = v7;
    id v15 = v8;
    uint64_t v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v11];
    objc_msgSend(v9, "getTetheringStatus:connectionType:", v8, v4, v11, v12, v13, v14);
    uint64_t v10 = &v15;
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__CoreTelephonyClient_Data__getTetheringStatus_connectionType___block_invoke;
    v16[3] = &unk_1E5260D00;
    id v17 = v7;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v16];
    uint64_t v10 = &v17;
  }
}

void __63__CoreTelephonyClient_Data__getTetheringStatus_connectionType___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

uint64_t __63__CoreTelephonyClient_Data__getTetheringStatus_connectionType___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getTetheringStatusSync:(id *)a3
{
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    id v5 = [(CoreTelephonyClient *)self getTetheringStatusSync:a3 connectionType:4];
  }
  else if (a3)
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    id v5 = 0;
    *a3 = v6;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)getTetheringStatusSync:(id *)a3 connectionType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy_;
    id v23 = __Block_byref_object_dispose_;
    id v24 = 0;
    if (a3) {
      *a3 = 0;
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __67__CoreTelephonyClient_Data__getTetheringStatusSync_connectionType___block_invoke;
    v18[3] = &unk_1E5260BA0;
    void v18[4] = &v19;
    id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy_;
    id v16 = __Block_byref_object_dispose_;
    id v17 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__CoreTelephonyClient_Data__getTetheringStatusSync_connectionType___block_invoke_2;
    v11[3] = &unk_1E5260E68;
    void v11[4] = &v19;
    void v11[5] = &v12;
    [v7 getTetheringStatus:v11 connectionType:v4];
    if (a3)
    {
      id v8 = (void *)v20[5];
      if (v8) {
        *a3 = v8;
      }
    }
    id v9 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(&v19, 8);
  }
  else if (a3)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    id v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __67__CoreTelephonyClient_Data__getTetheringStatusSync_connectionType___block_invoke(uint64_t a1, void *a2)
{
}

void __67__CoreTelephonyClient_Data__getTetheringStatusSync_connectionType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)enterLoopBackMode
{
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x3032000000;
    uint64_t v11 = __Block_byref_object_copy_;
    uint64_t v12 = __Block_byref_object_dispose_;
    id v13 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__CoreTelephonyClient_Data__enterLoopBackMode__block_invoke;
    v7[3] = &unk_1E5260BA0;
    void v7[4] = &v8;
    BOOL v3 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v7];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__CoreTelephonyClient_Data__enterLoopBackMode__block_invoke_2;
    v6[3] = &unk_1E5260BA0;
    void v6[4] = &v8;
    [v3 enterLoopBackMode:v6];
    id v4 = (id)v9[5];

    _Block_object_dispose(&v8, 8);
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  }

  return v4;
}

void __46__CoreTelephonyClient_Data__enterLoopBackMode__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __46__CoreTelephonyClient_Data__enterLoopBackMode__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)createAssertionForConnectionType:(int)a3 allocator:(__CFAllocator *)a4 error:(id *)a5 onReAssertError:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  if (a5) {
    *a5 = 0;
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __94__CoreTelephonyClient_Data__createAssertionForConnectionType_allocator_error_onReAssertError___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  uint64_t v11 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  if (v11)
  {
    uint64_t v12 = [(CoreTelephonyClient *)self createCTAssertionForConnectionType:v8 allocator:a4 proxy:v11];
    if (v12)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __94__CoreTelephonyClient_Data__createAssertionForConnectionType_allocator_error_onReAssertError___block_invoke_2;
      v22[3] = &unk_1E5260BA0;
      void v22[4] = &v24;
      [v11 setAssertionForConnectionType:v8 enable:1 completion:v22];
      id v13 = (void *)v25[5];
      if (!v13)
      {
        id location = 0;
        objc_initWeak(&location, self);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __94__CoreTelephonyClient_Data__createAssertionForConnectionType_allocator_error_onReAssertError___block_invoke_3;
        v17[3] = &unk_1E5260E90;
        objc_copyWeak(&v19, &location);
        id v18 = v10;
        int v20 = v8;
        [(CoreTelephonyClient *)self registerBlockForInvalidationNotification:v12 callback:v17];

        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
        goto LABEL_16;
      }
      if (a5) {
        *a5 = v13;
      }
      CFRelease(v12);
      goto LABEL_14;
    }
    if (a5)
    {
      id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v14 = (id)[v15 initWithDomain:*MEMORY[0x1E4F28798] code:12 userInfo:0];
      goto LABEL_13;
    }
LABEL_14:
    uint64_t v12 = 0;
    goto LABEL_16;
  }
  if (!a5) {
    goto LABEL_14;
  }
  id v14 = (id) v25[5];
LABEL_13:
  uint64_t v12 = 0;
  *a5 = v14;
LABEL_16:

  _Block_object_dispose(&v24, 8);
  return v12;
}

void __94__CoreTelephonyClient_Data__createAssertionForConnectionType_allocator_error_onReAssertError___block_invoke(uint64_t a1, void *a2)
{
}

void __94__CoreTelephonyClient_Data__createAssertionForConnectionType_allocator_error_onReAssertError___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __94__CoreTelephonyClient_Data__createAssertionForConnectionType_allocator_error_onReAssertError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6) {
        (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
      }
    }
    else
    {
      uint64_t v12 = 0;
      id v13 = &v12;
      uint64_t v14 = 0x3032000000;
      id v15 = __Block_byref_object_copy_;
      id v16 = __Block_byref_object_dispose_;
      id v17 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __94__CoreTelephonyClient_Data__createAssertionForConnectionType_allocator_error_onReAssertError___block_invoke_4;
      v11[3] = &unk_1E5260BA0;
      void v11[4] = &v12;
      id v7 = [WeakRetained synchronousProxyWithErrorHandler:v11];
      uint64_t v8 = *(unsigned int *)(a1 + 48);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __94__CoreTelephonyClient_Data__createAssertionForConnectionType_allocator_error_onReAssertError___block_invoke_5;
      v10[3] = &unk_1E5260BA0;
      void v10[4] = &v12;
      [v7 setAssertionForConnectionType:v8 enable:1 completion:v10];
      if (v13[5])
      {
        uint64_t v9 = *(void *)(a1 + 32);
        if (v9) {
          (*(void (**)(void))(v9 + 16))();
        }
      }

      _Block_object_dispose(&v12, 8);
    }
  }
}

void __94__CoreTelephonyClient_Data__createAssertionForConnectionType_allocator_error_onReAssertError___block_invoke_4(uint64_t a1, void *a2)
{
}

void __94__CoreTelephonyClient_Data__createAssertionForConnectionType_allocator_error_onReAssertError___block_invoke_5(uint64_t a1, void *a2)
{
}

- (id)setApplicationCategory:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__CoreTelephonyClient_Data__setApplicationCategory___block_invoke;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v12;
  id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v11];
  uint64_t v6 = v5;
  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__CoreTelephonyClient_Data__setApplicationCategory___block_invoke_2;
    v10[3] = &unk_1E5260BA0;
    void v10[4] = &v12;
    [v5 setApplicationCategory:v4 completion:v10];
    id v7 = (void *)v13[5];
    if (!v7)
    {
      id v8 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    id v7 = (void *)v13[5];
  }
  id v8 = v7;
LABEL_6:

  _Block_object_dispose(&v12, 8);

  return v8;
}

void __52__CoreTelephonyClient_Data__setApplicationCategory___block_invoke(uint64_t a1, void *a2)
{
}

void __52__CoreTelephonyClient_Data__setApplicationCategory___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)setWiFiCallingSettingPreferences:(id)a3 key:(id)a4 value:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__CoreTelephonyClient_Settings__setWiFiCallingSettingPreferences_key_value_completion___block_invoke;
  v16[3] = &unk_1E5260CB8;
  id v14 = v13;
  id v17 = v14;
  id v15 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v16];
  [v15 setWiFiCallingSettingPreferences:v10 key:v11 value:v12 completion:v14];
}

uint64_t __87__CoreTelephonyClient_Settings__setWiFiCallingSettingPreferences_key_value_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getWiFiCallingSettingPreferences:(id)a3 key:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__CoreTelephonyClient_Settings__getWiFiCallingSettingPreferences_key_completion___block_invoke;
  v13[3] = &unk_1E5260CB8;
  id v11 = v10;
  id v14 = v11;
  id v12 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  [v12 getWiFiCallingSettingPreferences:v8 key:v9 completion:v11];
}

uint64_t __81__CoreTelephonyClient_Settings__getWiFiCallingSettingPreferences_key_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getWiFiCallingSettingPreferences:(id)a3 key:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__0;
  id v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __76__CoreTelephonyClient_Settings__getWiFiCallingSettingPreferences_key_error___block_invoke;
  v20[3] = &unk_1E5260BA0;
  v20[4] = &v21;
  id v10 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v20];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__0;
  id v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__CoreTelephonyClient_Settings__getWiFiCallingSettingPreferences_key_error___block_invoke_2;
  v13[3] = &unk_1E5260F78;
  void v13[4] = &v21;
  void v13[5] = &v14;
  [v10 getWiFiCallingSettingPreferences:v8 key:v9 completion:v13];
  if (a5) {
    *a5 = (id) v22[5];
  }
  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v21, 8);

  return v11;
}

void __76__CoreTelephonyClient_Settings__getWiFiCallingSettingPreferences_key_error___block_invoke(uint64_t a1, void *a2)
{
}

void __76__CoreTelephonyClient_Settings__getWiFiCallingSettingPreferences_key_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)setWiFiCallingSettingPreferences:(id)a3 key:(id)a4 value:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__0;
  int v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __76__CoreTelephonyClient_Settings__setWiFiCallingSettingPreferences_key_value___block_invoke;
  v15[3] = &unk_1E5260BA0;
  void v15[4] = &v16;
  id v11 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__CoreTelephonyClient_Settings__setWiFiCallingSettingPreferences_key_value___block_invoke_2;
  v14[3] = &unk_1E5260BA0;
  void v14[4] = &v16;
  [v11 setWiFiCallingSettingPreferences:v8 key:v9 value:v10 completion:v14];
  id v12 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v12;
}

void __76__CoreTelephonyClient_Settings__setWiFiCallingSettingPreferences_key_value___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __76__CoreTelephonyClient_Settings__setWiFiCallingSettingPreferences_key_value___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)copyEmergencyMode:(id)a3
{
  id v5 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __52__CoreTelephonyClient_Emergency__copyEmergencyMode___block_invoke_2;
    id v13 = &unk_1E5261178;
    uint64_t v6 = &v14;
    id v14 = v5;
    id v7 = v5;
    id v8 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v10];
    objc_msgSend(v8, "copyEmergencyMode:", v7, v10, v11, v12, v13);
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __52__CoreTelephonyClient_Emergency__copyEmergencyMode___block_invoke;
    v15[3] = &unk_1E5261150;
    uint64_t v6 = &v16;
    id v16 = v5;
    id v9 = v5;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v15];
  }
}

void __52__CoreTelephonyClient_Emergency__copyEmergencyMode___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, 0, v2);
}

uint64_t __52__CoreTelephonyClient_Emergency__copyEmergencyMode___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)copyEmergencyModeWithError:(id *)a3
{
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    id v19 = __Block_byref_object_copy__1;
    int v20 = __Block_byref_object_dispose__1;
    id v21 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __61__CoreTelephonyClient_Emergency__copyEmergencyModeWithError___block_invoke;
    v15[3] = &unk_1E52611A0;
    void v15[4] = &v16;
    id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v15];
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = __Block_byref_object_copy__1;
    id v13 = __Block_byref_object_dispose__1;
    id v14 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__CoreTelephonyClient_Emergency__copyEmergencyModeWithError___block_invoke_2;
    v8[3] = &unk_1E52611C8;
    v8[4] = &v16;
    void v8[5] = &v9;
    [v5 copyEmergencyMode:v8];
    if (a3) {
      *a3 = (id) v17[5];
    }
    id v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

    _Block_object_dispose(&v16, 8);
    return v6;
  }
  else
  {
    if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    }
    return 0;
  }
}

void __61__CoreTelephonyClient_Emergency__copyEmergencyModeWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __61__CoreTelephonyClient_Emergency__copyEmergencyModeWithError___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a4);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v9 = [[CTEmergencyModeResult alloc] initWithMode:v7 andContext:v12];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (void)getAllEmergencyNumbers:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__CoreTelephonyClient_Emergency__getAllEmergencyNumbers___block_invoke;
  v7[3] = &unk_1E5261178;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  [v6 getAllEmergencyNumbers:v5];
}

uint64_t __57__CoreTelephonyClient_Emergency__getAllEmergencyNumbers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getAllEmergencyNumbersWithError:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__1;
  id v19 = __Block_byref_object_dispose__1;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__CoreTelephonyClient_Emergency__getAllEmergencyNumbersWithError___block_invoke;
  v14[3] = &unk_1E52611A0;
  void v14[4] = &v15;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v14];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__1;
  id v12 = __Block_byref_object_dispose__1;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__CoreTelephonyClient_Emergency__getAllEmergencyNumbersWithError___block_invoke_2;
  v7[3] = &unk_1E52611F0;
  void v7[4] = &v15;
  void v7[5] = &v8;
  [v4 getAllEmergencyNumbers:v7];
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v15, 8);

  return v5;
}

void __66__CoreTelephonyClient_Emergency__getAllEmergencyNumbersWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __66__CoreTelephonyClient_Emergency__getAllEmergencyNumbersWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void __66__CoreTelephonyClient_CellMonitor__refreshCellMonitor_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

uint64_t __66__CoreTelephonyClient_CellMonitor__refreshCellMonitor_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)copyCellInfo:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __60__CoreTelephonyClient_CellMonitor__copyCellInfo_completion___block_invoke_2;
    uint64_t v15 = &unk_1E5260CB8;
    id v9 = v8;
    id v16 = v9;
    uint64_t v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v12];
    objc_msgSend(v10, "copyCellInfo:completion:", v7, v9, v12, v13, v14, v15);
    uint64_t v11 = &v16;
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __60__CoreTelephonyClient_CellMonitor__copyCellInfo_completion___block_invoke;
    v17[3] = &unk_1E5260D00;
    id v18 = v8;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v17];
    uint64_t v11 = &v18;
  }
}

void __60__CoreTelephonyClient_CellMonitor__copyCellInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

uint64_t __60__CoreTelephonyClient_CellMonitor__copyCellInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)copyCellId:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __58__CoreTelephonyClient_CellMonitor__copyCellId_completion___block_invoke_2;
    uint64_t v15 = &unk_1E5260CB8;
    id v9 = v8;
    id v16 = v9;
    uint64_t v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v12];
    objc_msgSend(v10, "copyCellId:completion:", v7, v9, v12, v13, v14, v15);
    uint64_t v11 = &v16;
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__CoreTelephonyClient_CellMonitor__copyCellId_completion___block_invoke;
    v17[3] = &unk_1E5260D00;
    id v18 = v8;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v17];
    uint64_t v11 = &v18;
  }
}

void __58__CoreTelephonyClient_CellMonitor__copyCellId_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

uint64_t __58__CoreTelephonyClient_CellMonitor__copyCellId_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)copyPublicCellId:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy__2;
    uint64_t v23 = __Block_byref_object_dispose__2;
    id v24 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__CoreTelephonyClient_CellMonitor__copyPublicCellId_error___block_invoke;
    v18[3] = &unk_1E5260BA0;
    void v18[4] = &v19;
    id v8 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__2;
    id v16 = __Block_byref_object_dispose__2;
    id v17 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__CoreTelephonyClient_CellMonitor__copyPublicCellId_error___block_invoke_2;
    v11[3] = &unk_1E5261218;
    void v11[4] = &v19;
    void v11[5] = &v12;
    [v8 copyPublicCellId:v7 completion:v11];
    if (a4) {
      *a4 = (id) v20[5];
    }
    id v9 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(&v19, 8);
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    id v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __59__CoreTelephonyClient_CellMonitor__copyPublicCellId_error___block_invoke(uint64_t a1, void *a2)
{
}

void __59__CoreTelephonyClient_CellMonitor__copyPublicCellId_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)copyLocationAreaCode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__CoreTelephonyClient_CellMonitor__copyLocationAreaCode_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 copyLocationAreaCode:v6 completion:v8];
}

uint64_t __68__CoreTelephonyClient_CellMonitor__copyLocationAreaCode_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isEmergencyNumber:(id)a3 number:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__CoreTelephonyClient_Call__isEmergencyNumber_number_completion___block_invoke;
  v13[3] = &unk_1E5261178;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  [v12 isEmergencyNumber:v11 number:v10 completion:v9];
}

uint64_t __65__CoreTelephonyClient_Call__isEmergencyNumber_number_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isEmergencyNumber:(id)a3 number:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__3;
  uint64_t v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __60__CoreTelephonyClient_Call__isEmergencyNumber_number_error___block_invoke;
  v18[3] = &unk_1E52611A0;
  void v18[4] = &v19;
  id v10 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__CoreTelephonyClient_Call__isEmergencyNumber_number_error___block_invoke_2;
  v13[3] = &unk_1E52619D8;
  void v13[4] = &v19;
  void v13[5] = &v14;
  [v10 isEmergencyNumber:v8 number:v9 completion:v13];
  if (a5) {
    *a5 = (id) v20[5];
  }
  char v11 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __60__CoreTelephonyClient_Call__isEmergencyNumber_number_error___block_invoke(uint64_t a1, void *a2)
{
}

void __60__CoreTelephonyClient_Call__isEmergencyNumber_number_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)isEmergencyNumberWithWhitelistIncluded:(id)a3 number:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__CoreTelephonyClient_Call__isEmergencyNumberWithWhitelistIncluded_number_completion___block_invoke;
  v13[3] = &unk_1E5261178;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  [v12 isEmergencyNumberWithWhitelistIncluded:v11 number:v10 completion:v9];
}

uint64_t __86__CoreTelephonyClient_Call__isEmergencyNumberWithWhitelistIncluded_number_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isEmergencyNumberWithWhitelistIncluded:(id)a3 number:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__3;
  uint64_t v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__CoreTelephonyClient_Call__isEmergencyNumberWithWhitelistIncluded_number_error___block_invoke;
  v18[3] = &unk_1E52611A0;
  void v18[4] = &v19;
  id v10 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__CoreTelephonyClient_Call__isEmergencyNumberWithWhitelistIncluded_number_error___block_invoke_2;
  v13[3] = &unk_1E52619D8;
  void v13[4] = &v19;
  void v13[5] = &v14;
  [v10 isEmergencyNumberWithWhitelistIncluded:v8 number:v9 completion:v13];
  if (a5) {
    *a5 = (id) v20[5];
  }
  char v11 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __81__CoreTelephonyClient_Call__isEmergencyNumberWithWhitelistIncluded_number_error___block_invoke(uint64_t a1, void *a2)
{
}

void __81__CoreTelephonyClient_Call__isEmergencyNumberWithWhitelistIncluded_number_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)shouldShowUserWarningWhenDialingCallOnContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__CoreTelephonyClient_Call__shouldShowUserWarningWhenDialingCallOnContext_completion___block_invoke;
  v10[3] = &unk_1E5261178;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 shouldShowUserWarningWhenDialingCallOnContext:v8 completion:v7];
}

uint64_t __86__CoreTelephonyClient_Call__shouldShowUserWarningWhenDialingCallOnContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)shouldShowUserWarningWhenDialingCallOnContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__3;
  id v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __81__CoreTelephonyClient_Call__shouldShowUserWarningWhenDialingCallOnContext_error___block_invoke;
  v15[3] = &unk_1E52611A0;
  void v15[4] = &v16;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v15];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__CoreTelephonyClient_Call__shouldShowUserWarningWhenDialingCallOnContext_error___block_invoke_2;
  v10[3] = &unk_1E52619D8;
  void v10[4] = &v16;
  void v10[5] = &v11;
  [v7 shouldShowUserWarningWhenDialingCallOnContext:v6 completion:v10];
  if (a4) {
    *a4 = (id) v17[5];
  }
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __81__CoreTelephonyClient_Call__shouldShowUserWarningWhenDialingCallOnContext_error___block_invoke(uint64_t a1, void *a2)
{
}

void __81__CoreTelephonyClient_Call__shouldShowUserWarningWhenDialingCallOnContext_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (id)shouldShowBrandedCallingInfo:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__3;
  uint64_t v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__CoreTelephonyClient_Call__shouldShowBrandedCallingInfo___block_invoke;
  v14[3] = &unk_1E52611A0;
  void v14[4] = &v15;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v14];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__3;
  uint64_t v12 = __Block_byref_object_dispose__3;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__CoreTelephonyClient_Call__shouldShowBrandedCallingInfo___block_invoke_2;
  v7[3] = &unk_1E52619D8;
  void v7[4] = &v15;
  void v7[5] = &v8;
  [v4 shouldShowBrandedCallingInfo:v7];
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v15, 8);

  return v5;
}

void __58__CoreTelephonyClient_Call__shouldShowBrandedCallingInfo___block_invoke(uint64_t a1, void *a2)
{
}

void __58__CoreTelephonyClient_Call__shouldShowBrandedCallingInfo___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v9 = obj;
  uint64_t v6 = [NSNumber numberWithBool:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)setShouldShowBrandedCallingInfo:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__3;
  id v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__CoreTelephonyClient_Call__setShouldShowBrandedCallingInfo___block_invoke;
  v8[3] = &unk_1E52611A0;
  v8[4] = &v9;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__CoreTelephonyClient_Call__setShouldShowBrandedCallingInfo___block_invoke_2;
  v7[3] = &unk_1E52611A0;
  void v7[4] = &v9;
  [v4 setShouldShowBrandedCallingInfo:v3 completion:v7];
  id v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v5;
}

void __61__CoreTelephonyClient_Call__setShouldShowBrandedCallingInfo___block_invoke(uint64_t a1, void *a2)
{
}

void __61__CoreTelephonyClient_Call__setShouldShowBrandedCallingInfo___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)getCallCapabilities:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__CoreTelephonyClient_Call__getCallCapabilities_completion___block_invoke;
  v10[3] = &unk_1E5261178;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 getCallCapabilities:v8 completion:v7];
}

uint64_t __60__CoreTelephonyClient_Call__getCallCapabilities_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getCallCapabilities:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__3;
  id v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__CoreTelephonyClient_Call__getCallCapabilities_error___block_invoke;
  v17[3] = &unk_1E52611A0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__3;
  uint64_t v15 = __Block_byref_object_dispose__3;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__CoreTelephonyClient_Call__getCallCapabilities_error___block_invoke_2;
  v10[3] = &unk_1E5261A00;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 getCallCapabilities:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __55__CoreTelephonyClient_Call__getCallCapabilities_error___block_invoke(uint64_t a1, void *a2)
{
}

void __55__CoreTelephonyClient_Call__getCallCapabilities_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)getOperatorMultiPartyCallCountMaximum:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__CoreTelephonyClient_Call__getOperatorMultiPartyCallCountMaximum_completion___block_invoke;
  v10[3] = &unk_1E5261178;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 getOperatorMultiPartyCallCountMaximum:v8 completion:v7];
}

void __78__CoreTelephonyClient_Call__getOperatorMultiPartyCallCountMaximum_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = NSNumber;
  id v4 = a2;
  id v5 = [v3 numberWithInt:0];
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v5, v4);
}

- (id)getOperatorMultiPartyCallCountMaximum:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__3;
  id v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__CoreTelephonyClient_Call__getOperatorMultiPartyCallCountMaximum_error___block_invoke;
  v17[3] = &unk_1E52611A0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__3;
  uint64_t v15 = __Block_byref_object_dispose__3;
  id v16 = 0;
  id v16 = [NSNumber numberWithInt:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__CoreTelephonyClient_Call__getOperatorMultiPartyCallCountMaximum_error___block_invoke_2;
  v10[3] = &unk_1E5261A28;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 getOperatorMultiPartyCallCountMaximum:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __73__CoreTelephonyClient_Call__getOperatorMultiPartyCallCountMaximum_error___block_invoke(uint64_t a1, void *a2)
{
}

void __73__CoreTelephonyClient_Call__getOperatorMultiPartyCallCountMaximum_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)enableLazuli:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__4;
  uint64_t v17 = __Block_byref_object_dispose__4;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__CoreTelephonyClient_Lazuli__enableLazuli_withError___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  id v8 = [[CTXPCSetLazuliStateRequest alloc] initWithContext:v6 shouldEnable:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__CoreTelephonyClient_Lazuli__enableLazuli_withError___block_invoke_2;
  v11[3] = &unk_1E5261A50;
  void v11[4] = &v13;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v14[5];
  }
  BOOL v9 = v14[5] == 0;

  _Block_object_dispose(&v13, 8);
  return v9;
}

void __54__CoreTelephonyClient_Lazuli__enableLazuli_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __54__CoreTelephonyClient_Lazuli__enableLazuli_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)disableLazuli:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__4;
  uint64_t v17 = __Block_byref_object_dispose__4;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__CoreTelephonyClient_Lazuli__disableLazuli_withError___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  id v8 = [[CTXPCSetLazuliStateRequest alloc] initWithContext:v6 shouldEnable:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__CoreTelephonyClient_Lazuli__disableLazuli_withError___block_invoke_2;
  v11[3] = &unk_1E5261A50;
  void v11[4] = &v13;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v14[5];
  }
  BOOL v9 = v14[5] == 0;

  _Block_object_dispose(&v13, 8);
  return v9;
}

void __55__CoreTelephonyClient_Lazuli__disableLazuli_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __55__CoreTelephonyClient_Lazuli__disableLazuli_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (id)retrieveMessage:(id)a3 withMessageID:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x3032000000;
    id v25 = __Block_byref_object_copy__4;
    id v26 = __Block_byref_object_dispose__4;
    id v27 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __71__CoreTelephonyClient_Lazuli__retrieveMessage_withMessageID_withError___block_invoke;
    v21[3] = &unk_1E5260BA0;
    v21[4] = &v22;
    uint64_t v10 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v21];
    uint64_t v11 = [[CTXPCRetrieveMessageRequest alloc] initWithContext:v8 messageID:v9];
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy__4;
    uint64_t v19 = __Block_byref_object_dispose__4;
    id v20 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__CoreTelephonyClient_Lazuli__retrieveMessage_withMessageID_withError___block_invoke_2;
    v14[3] = &unk_1E5261A78;
    void v14[4] = &v22;
    void v14[5] = &v15;
    [v10 sendRequest:v11 completionHandler:v14];
    uint64_t v12 = (void *)v23[5];
    if (v12) {
      *a5 = v12;
    }
    a5 = [(id)v16[5] messageEnvelope];
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v22, 8);
  }

  return a5;
}

void __71__CoreTelephonyClient_Lazuli__retrieveMessage_withMessageID_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __71__CoreTelephonyClient_Lazuli__retrieveMessage_withMessageID_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v10 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v10;
  }
  else {
    id v7 = 0;
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)retrieveAllIncomingMessageIDs:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__4;
  uint64_t v24 = __Block_byref_object_dispose__4;
  id v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__CoreTelephonyClient_Lazuli__retrieveAllIncomingMessageIDs_withError___block_invoke;
  v19[3] = &unk_1E5260BA0;
  void v19[4] = &v20;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v19];
  uint64_t v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCRetrieveAllMessagesRequest alloc] initWithContext:v6];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__4;
  uint64_t v17 = __Block_byref_object_dispose__4;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__CoreTelephonyClient_Lazuli__retrieveAllIncomingMessageIDs_withError___block_invoke_2;
  v12[3] = &unk_1E5261A78;
  void v12[4] = &v20;
  void v12[5] = &v13;
  [v7 sendRequest:v8 completionHandler:v12];
  if (a4)
  {
    id v9 = (void *)v21[5];
    if (v9) {
      *a4 = v9;
    }
  }
  id v10 = [(id)v14[5] messageIDList];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v20, 8);

  return v10;
}

void __71__CoreTelephonyClient_Lazuli__retrieveAllIncomingMessageIDs_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __71__CoreTelephonyClient_Lazuli__retrieveAllIncomingMessageIDs_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v10 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v10;
  }
  else {
    id v7 = 0;
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (BOOL)revokeMessage:(id)a3 withRevokeData:(id)a4 withMessageID:(id)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__4;
  id v25 = __Block_byref_object_dispose__4;
  id v26 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __84__CoreTelephonyClient_Lazuli__revokeMessage_withRevokeData_withMessageID_withError___block_invoke;
  v20[3] = &unk_1E5260BA0;
  v20[4] = &v21;
  uint64_t v13 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v20];
  id v14 = [[CTXPCMessageRevokeRequest alloc] initWithContext:v10 revokeData:v11 messageID:v12];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__CoreTelephonyClient_Lazuli__revokeMessage_withRevokeData_withMessageID_withError___block_invoke_2;
  v19[3] = &unk_1E5261A50;
  void v19[4] = &v21;
  [v13 sendRequest:v14 completionHandler:v19];
  uint64_t v15 = v22;
  if (a6)
  {
    id v16 = (void *)v22[5];
    if (v16)
    {
      *a6 = v16;
      uint64_t v15 = v22;
    }
  }
  BOOL v17 = v15[5] == 0;

  _Block_object_dispose(&v21, 8);
  return v17;
}

void __84__CoreTelephonyClient_Lazuli__revokeMessage_withRevokeData_withMessageID_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __84__CoreTelephonyClient_Lazuli__revokeMessage_withRevokeData_withMessageID_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)acknowledgeIncomingMessages:(id)a3 withMessageIDList:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__4;
  uint64_t v22 = __Block_byref_object_dispose__4;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87__CoreTelephonyClient_Lazuli__acknowledgeIncomingMessages_withMessageIDList_withError___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v10 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  id v11 = [[CTXPCAcknowledgeIncomingMessagesRequest alloc] initWithContext:v8 messageIDList:v9];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__CoreTelephonyClient_Lazuli__acknowledgeIncomingMessages_withMessageIDList_withError___block_invoke_2;
  v16[3] = &unk_1E5261A50;
  void v16[4] = &v18;
  [v10 sendRequest:v11 completionHandler:v16];
  id v12 = v19;
  if (a5)
  {
    uint64_t v13 = (void *)v19[5];
    if (v13)
    {
      *a5 = v13;
      id v12 = v19;
    }
  }
  BOOL v14 = v12[5] == 0;

  _Block_object_dispose(&v18, 8);
  return v14;
}

void __87__CoreTelephonyClient_Lazuli__acknowledgeIncomingMessages_withMessageIDList_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __87__CoreTelephonyClient_Lazuli__acknowledgeIncomingMessages_withMessageIDList_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (id)getSystemConfiguration:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__4;
  uint64_t v24 = __Block_byref_object_dispose__4;
  id v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __64__CoreTelephonyClient_Lazuli__getSystemConfiguration_withError___block_invoke;
  v19[3] = &unk_1E5260BA0;
  void v19[4] = &v20;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v19];
  id v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetSystemConfigRequest alloc] initWithContext:v6];
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__4;
  BOOL v17 = __Block_byref_object_dispose__4;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__CoreTelephonyClient_Lazuli__getSystemConfiguration_withError___block_invoke_2;
  v12[3] = &unk_1E5261A78;
  void v12[4] = &v13;
  void v12[5] = &v20;
  [v7 sendRequest:v8 completionHandler:v12];
  if (a4 && (id v9 = (void *)v21[5]) != 0)
  {
    id v10 = 0;
    *a4 = v9;
  }
  else
  {
    id v10 = [(id)v14[5] config];
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v20, 8);

  return v10;
}

void __64__CoreTelephonyClient_Lazuli__getSystemConfiguration_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __64__CoreTelephonyClient_Lazuli__getSystemConfiguration_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v12;
  }
  else {
    id v7 = 0;
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
}

- (BOOL)fetchRemoteCapabilities:(id)a3 forDestination:(id)a4 withOptions:(id)a5 withOperationID:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__4;
  v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __108__CoreTelephonyClient_Lazuli__fetchRemoteCapabilities_forDestination_withOptions_withOperationID_withError___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  id v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  BOOL v17 = [[CTXPCFetchRemoteCapabilitiesRequest alloc] initWithContext:v12 destination:v13 options:v14 operationID:v15];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __108__CoreTelephonyClient_Lazuli__fetchRemoteCapabilities_forDestination_withOptions_withOperationID_withError___block_invoke_2;
  v22[3] = &unk_1E5261A50;
  void v22[4] = &v24;
  [v16 sendRequest:v17 completionHandler:v22];
  id v18 = v25;
  if (a7)
  {
    uint64_t v19 = (void *)v25[5];
    if (v19)
    {
      *a7 = v19;
      id v18 = v25;
    }
  }
  BOOL v20 = v18[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v20;
}

void __108__CoreTelephonyClient_Lazuli__fetchRemoteCapabilities_forDestination_withOptions_withOperationID_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __108__CoreTelephonyClient_Lazuli__fetchRemoteCapabilities_forDestination_withOptions_withOperationID_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)sendComposingIndicatorForContext:(id)a3 to:(id)a4 messageID:(id)a5 indication:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__4;
  uint64_t v26 = __Block_byref_object_dispose__4;
  id v27 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __94__CoreTelephonyClient_Lazuli__sendComposingIndicatorForContext_to_messageID_indication_error___block_invoke;
  v21[3] = &unk_1E5260BA0;
  v21[4] = &v22;
  id v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v21];
  BOOL v17 = [[CTXPCSendComposingIndicatorRequest alloc] initWithContext:v12 destination:v13 messageID:v14 indication:v15];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __94__CoreTelephonyClient_Lazuli__sendComposingIndicatorForContext_to_messageID_indication_error___block_invoke_2;
  v20[3] = &unk_1E5261A50;
  v20[4] = &v22;
  [v16 sendRequest:v17 completionHandler:v20];
  if (a7) {
    *a7 = (id) v23[5];
  }
  BOOL v18 = v23[5] == 0;

  _Block_object_dispose(&v22, 8);
  return v18;
}

void __94__CoreTelephonyClient_Lazuli__sendComposingIndicatorForContext_to_messageID_indication_error___block_invoke(uint64_t a1, void *a2)
{
}

void __94__CoreTelephonyClient_Lazuli__sendComposingIndicatorForContext_to_messageID_indication_error___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (void)sendComposingIndicator:(id)a3 to:(id)a4 withMessageID:(id)a5 withIndication:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a7)
  {
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    uint64_t v24 = __Block_byref_object_copy__4;
    id v25 = __Block_byref_object_dispose__4;
    id v26 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __96__CoreTelephonyClient_Lazuli__sendComposingIndicator_to_withMessageID_withIndication_withError___block_invoke;
    v20[3] = &unk_1E5260BA0;
    v20[4] = &v21;
    id v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v20];
    BOOL v17 = [[CTXPCSendComposingIndicatorRequest alloc] initWithContext:v12 destination:v13 messageID:v14 indication:v15];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __96__CoreTelephonyClient_Lazuli__sendComposingIndicator_to_withMessageID_withIndication_withError___block_invoke_2;
    v19[3] = &unk_1E5261A50;
    void v19[4] = &v21;
    [v16 sendRequest:v17 completionHandler:v19];
    BOOL v18 = (void *)v22[5];
    if (v18) {
      *a7 = v18;
    }

    _Block_object_dispose(&v21, 8);
  }
}

void __96__CoreTelephonyClient_Lazuli__sendComposingIndicator_to_withMessageID_withIndication_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __96__CoreTelephonyClient_Lazuli__sendComposingIndicator_to_withMessageID_withIndication_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (id)readCachedChatBotRenderInformation:(id)a3 forChatBot:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__4;
  id v27 = __Block_byref_object_dispose__4;
  id v28 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __87__CoreTelephonyClient_Lazuli__readCachedChatBotRenderInformation_forChatBot_withError___block_invoke;
  v22[3] = &unk_1E5260BA0;
  void v22[4] = &v23;
  uint64_t v10 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v22];
  id v11 = [[CTXPCReadCachedChatBotRenderInfoRequest alloc] initWithContext:v8 destination:v9];
  uint64_t v16 = 0;
  BOOL v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__4;
  BOOL v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __87__CoreTelephonyClient_Lazuli__readCachedChatBotRenderInformation_forChatBot_withError___block_invoke_2;
  v15[3] = &unk_1E5261A78;
  void v15[4] = &v23;
  void v15[5] = &v16;
  [v10 sendRequest:v11 completionHandler:v15];
  if (a5)
  {
    id v12 = (void *)v24[5];
    if (v12) {
      *a5 = v12;
    }
  }
  id v13 = [(id)v17[5] info];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v23, 8);

  return v13;
}

void __87__CoreTelephonyClient_Lazuli__readCachedChatBotRenderInformation_forChatBot_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __87__CoreTelephonyClient_Lazuli__readCachedChatBotRenderInformation_forChatBot_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v10 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v10;
  }
  else {
    id v7 = 0;
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (BOOL)fetchRenderInformation:(id)a3 forChatBot:(id)a4 withOperationID:(id)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__4;
  uint64_t v25 = __Block_byref_object_dispose__4;
  id v26 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __91__CoreTelephonyClient_Lazuli__fetchRenderInformation_forChatBot_withOperationID_withError___block_invoke;
  v20[3] = &unk_1E5260BA0;
  v20[4] = &v21;
  id v13 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v20];
  id v14 = [[CTXPCFetchRenderInformationRequest alloc] initWithContext:v10 destination:v11 operationID:v12];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __91__CoreTelephonyClient_Lazuli__fetchRenderInformation_forChatBot_withOperationID_withError___block_invoke_2;
  v19[3] = &unk_1E5261A50;
  void v19[4] = &v21;
  [v13 sendRequest:v14 completionHandler:v19];
  id v15 = v22;
  if (a6)
  {
    uint64_t v16 = (void *)v22[5];
    if (v16)
    {
      *a6 = v16;
      id v15 = v22;
    }
  }
  BOOL v17 = v15[5] == 0;

  _Block_object_dispose(&v21, 8);
  return v17;
}

void __91__CoreTelephonyClient_Lazuli__fetchRenderInformation_forChatBot_withOperationID_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __91__CoreTelephonyClient_Lazuli__fetchRenderInformation_forChatBot_withOperationID_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)sendFileTransferMessage:(id)a3 to:(id)a4 withMessageID:(id)a5 withFileInformation:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__4;
  id v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __102__CoreTelephonyClient_Lazuli__sendFileTransferMessage_to_withMessageID_withFileInformation_withError___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  uint64_t v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  BOOL v17 = [[CTXPCSendFileTransferMessageRequest alloc] initWithContext:v12 destination:v13 messageID:v14 descriptor:v15];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __102__CoreTelephonyClient_Lazuli__sendFileTransferMessage_to_withMessageID_withFileInformation_withError___block_invoke_2;
  v22[3] = &unk_1E5261A50;
  void v22[4] = &v24;
  [v16 sendRequest:v17 completionHandler:v22];
  uint64_t v18 = v25;
  if (a7)
  {
    uint64_t v19 = (void *)v25[5];
    if (v19)
    {
      *a7 = v19;
      uint64_t v18 = v25;
    }
  }
  BOOL v20 = v18[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v20;
}

void __102__CoreTelephonyClient_Lazuli__sendFileTransferMessage_to_withMessageID_withFileInformation_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __102__CoreTelephonyClient_Lazuli__sendFileTransferMessage_to_withMessageID_withFileInformation_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)sendTextMessage:(id)a3 to:(id)a4 withMessageID:(id)a5 withMessage:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__4;
  id v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __86__CoreTelephonyClient_Lazuli__sendTextMessage_to_withMessageID_withMessage_withError___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  uint64_t v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  BOOL v17 = [[CTXPCSendTextMessageRequest alloc] initWithContext:v12 destination:v13 messageID:v14 message:v15];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __86__CoreTelephonyClient_Lazuli__sendTextMessage_to_withMessageID_withMessage_withError___block_invoke_2;
  v22[3] = &unk_1E5261A50;
  void v22[4] = &v24;
  [v16 sendRequest:v17 completionHandler:v22];
  uint64_t v18 = v25;
  if (a7)
  {
    uint64_t v19 = (void *)v25[5];
    if (v19)
    {
      *a7 = v19;
      uint64_t v18 = v25;
    }
  }
  BOOL v20 = v18[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v20;
}

void __86__CoreTelephonyClient_Lazuli__sendTextMessage_to_withMessageID_withMessage_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __86__CoreTelephonyClient_Lazuli__sendTextMessage_to_withMessageID_withMessage_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)sendGeolocationMessage:(id)a3 to:(id)a4 withMessageID:(id)a5 withGeoPush:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__4;
  id v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __93__CoreTelephonyClient_Lazuli__sendGeolocationMessage_to_withMessageID_withGeoPush_withError___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  uint64_t v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  BOOL v17 = [[CTXPCSendGeolocationMessageRequest alloc] initWithContext:v12 destination:v13 messageID:v14 geoLocationPush:v15];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __93__CoreTelephonyClient_Lazuli__sendGeolocationMessage_to_withMessageID_withGeoPush_withError___block_invoke_2;
  v22[3] = &unk_1E5261A50;
  void v22[4] = &v24;
  [v16 sendRequest:v17 completionHandler:v22];
  uint64_t v18 = v25;
  if (a7)
  {
    uint64_t v19 = (void *)v25[5];
    if (v19)
    {
      *a7 = v19;
      uint64_t v18 = v25;
    }
  }
  BOOL v20 = v18[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v20;
}

void __93__CoreTelephonyClient_Lazuli__sendGeolocationMessage_to_withMessageID_withGeoPush_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __93__CoreTelephonyClient_Lazuli__sendGeolocationMessage_to_withMessageID_withGeoPush_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)sendDispositionNotificationMessage:(id)a3 to:(id)a4 withMessageID:(id)a5 withDisposition:(int64_t)a6 forMessageID:(id)a7 withError:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__4;
  v30 = __Block_byref_object_dispose__4;
  id v31 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __122__CoreTelephonyClient_Lazuli__sendDispositionNotificationMessage_to_withMessageID_withDisposition_forMessageID_withError___block_invoke;
  v25[3] = &unk_1E5260BA0;
  v25[4] = &v26;
  uint64_t v18 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v25];
  uint64_t v19 = [[CTXPCSendDispositionNotificationMessageRequest alloc] initWithContext:v14 destination:v15 messageID:v16 notificationType:a6 notificationMessageID:v17];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __122__CoreTelephonyClient_Lazuli__sendDispositionNotificationMessage_to_withMessageID_withDisposition_forMessageID_withError___block_invoke_2;
  v24[3] = &unk_1E5261A50;
  v24[4] = &v26;
  [v18 sendRequest:v19 completionHandler:v24];
  BOOL v20 = v27;
  if (a8)
  {
    uint64_t v21 = (void *)v27[5];
    if (v21)
    {
      *a8 = v21;
      BOOL v20 = v27;
    }
  }
  BOOL v22 = v20[5] == 0;

  _Block_object_dispose(&v26, 8);
  return v22;
}

void __122__CoreTelephonyClient_Lazuli__sendDispositionNotificationMessage_to_withMessageID_withDisposition_forMessageID_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __122__CoreTelephonyClient_Lazuli__sendDispositionNotificationMessage_to_withMessageID_withDisposition_forMessageID_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)sendResponseForSuggestedAction:(id)a3 to:(id)a4 withMessageID:(id)a5 response:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__4;
  uint64_t v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __98__CoreTelephonyClient_Lazuli__sendResponseForSuggestedAction_to_withMessageID_response_withError___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  id v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  id v17 = [[CTXPCSendResponseForSuggestedActionRequest alloc] initWithContext:v12 destination:v13 messageID:v14 response:v15];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __98__CoreTelephonyClient_Lazuli__sendResponseForSuggestedAction_to_withMessageID_response_withError___block_invoke_2;
  v22[3] = &unk_1E5261A50;
  void v22[4] = &v24;
  [v16 sendRequest:v17 completionHandler:v22];
  uint64_t v18 = v25;
  if (a7)
  {
    uint64_t v19 = (void *)v25[5];
    if (v19)
    {
      *a7 = v19;
      uint64_t v18 = v25;
    }
  }
  BOOL v20 = v18[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v20;
}

void __98__CoreTelephonyClient_Lazuli__sendResponseForSuggestedAction_to_withMessageID_response_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __98__CoreTelephonyClient_Lazuli__sendResponseForSuggestedAction_to_withMessageID_response_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)sendResponseForSuggestedReply:(id)a3 to:(id)a4 withMessageID:(id)a5 response:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__4;
  uint64_t v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __97__CoreTelephonyClient_Lazuli__sendResponseForSuggestedReply_to_withMessageID_response_withError___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  id v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  id v17 = [[CTXPCSendResponseForSuggestedReplyRequest alloc] initWithContext:v12 destination:v13 messageID:v14 response:v15];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __97__CoreTelephonyClient_Lazuli__sendResponseForSuggestedReply_to_withMessageID_response_withError___block_invoke_2;
  v22[3] = &unk_1E5261A50;
  void v22[4] = &v24;
  [v16 sendRequest:v17 completionHandler:v22];
  uint64_t v18 = v25;
  if (a7)
  {
    uint64_t v19 = (void *)v25[5];
    if (v19)
    {
      *a7 = v19;
      uint64_t v18 = v25;
    }
  }
  BOOL v20 = v18[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v20;
}

void __97__CoreTelephonyClient_Lazuli__sendResponseForSuggestedReply_to_withMessageID_response_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __97__CoreTelephonyClient_Lazuli__sendResponseForSuggestedReply_to_withMessageID_response_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)reportChatbotSpam:(id)a3 forChatbot:(id)a4 withSpamReportInfo:(id)a5 andOperationID:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__4;
  uint64_t v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __104__CoreTelephonyClient_Lazuli__reportChatbotSpam_forChatbot_withSpamReportInfo_andOperationID_withError___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  id v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  id v17 = [[CTXPCReportChatBotSpamRequest alloc] initWithContext:v12 destination:v13 spamReportInfo:v14 operationID:v15];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __104__CoreTelephonyClient_Lazuli__reportChatbotSpam_forChatbot_withSpamReportInfo_andOperationID_withError___block_invoke_2;
  v22[3] = &unk_1E5261A50;
  void v22[4] = &v24;
  [v16 sendRequest:v17 completionHandler:v22];
  uint64_t v18 = v25;
  if (a7)
  {
    uint64_t v19 = (void *)v25[5];
    if (v19)
    {
      *a7 = v19;
      uint64_t v18 = v25;
    }
  }
  BOOL v20 = v18[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v20;
}

void __104__CoreTelephonyClient_Lazuli__reportChatbotSpam_forChatbot_withSpamReportInfo_andOperationID_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __104__CoreTelephonyClient_Lazuli__reportChatbotSpam_forChatbot_withSpamReportInfo_andOperationID_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)reportLazuliSpamWithContext:(id)a3 destination:(id)a4 spamReportInfo:(id)a5 operationID:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__4;
  uint64_t v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __104__CoreTelephonyClient_Lazuli__reportLazuliSpamWithContext_destination_spamReportInfo_operationID_error___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  id v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  id v17 = [[CTXPCReportSpamRequest alloc] initWithContext:v12 destination:v13 spamReportInfo:v14 operationID:v15];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __104__CoreTelephonyClient_Lazuli__reportLazuliSpamWithContext_destination_spamReportInfo_operationID_error___block_invoke_2;
  v22[3] = &unk_1E5261A50;
  void v22[4] = &v24;
  [v16 sendRequest:v17 completionHandler:v22];
  uint64_t v18 = v25;
  if (a7)
  {
    uint64_t v19 = (void *)v25[5];
    if (v19)
    {
      *a7 = v19;
      uint64_t v18 = v25;
    }
  }
  BOOL v20 = v18[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v20;
}

void __104__CoreTelephonyClient_Lazuli__reportLazuliSpamWithContext_destination_spamReportInfo_operationID_error___block_invoke(uint64_t a1, void *a2)
{
}

void __104__CoreTelephonyClient_Lazuli__reportLazuliSpamWithContext_destination_spamReportInfo_operationID_error___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)sendDeviceAction:(id)a3 to:(id)a4 withMessageID:(id)a5 withAction:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__4;
  uint64_t v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __86__CoreTelephonyClient_Lazuli__sendDeviceAction_to_withMessageID_withAction_withError___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  id v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  id v17 = [[CTXPCSendDeviceActionRequest alloc] initWithContext:v12 destination:v13 messageID:v14 action:v15];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __86__CoreTelephonyClient_Lazuli__sendDeviceAction_to_withMessageID_withAction_withError___block_invoke_2;
  v22[3] = &unk_1E5261A50;
  void v22[4] = &v24;
  [v16 sendRequest:v17 completionHandler:v22];
  uint64_t v18 = v25;
  if (a7)
  {
    uint64_t v19 = (void *)v25[5];
    if (v19)
    {
      *a7 = v19;
      uint64_t v18 = v25;
    }
  }
  BOOL v20 = v18[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v20;
}

void __86__CoreTelephonyClient_Lazuli__sendDeviceAction_to_withMessageID_withAction_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __86__CoreTelephonyClient_Lazuli__sendDeviceAction_to_withMessageID_withAction_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)sendDeviceSettings:(id)a3 to:(id)a4 withMessageID:(id)a5 withSetting:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__4;
  uint64_t v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __89__CoreTelephonyClient_Lazuli__sendDeviceSettings_to_withMessageID_withSetting_withError___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  id v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  id v17 = [[CTXPCSendDeviceSettingsRequest alloc] initWithContext:v12 destination:v13 messageID:v14 settings:v15];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __89__CoreTelephonyClient_Lazuli__sendDeviceSettings_to_withMessageID_withSetting_withError___block_invoke_2;
  v22[3] = &unk_1E5261A50;
  void v22[4] = &v24;
  [v16 sendRequest:v17 completionHandler:v22];
  uint64_t v18 = v25;
  if (a7)
  {
    uint64_t v19 = (void *)v25[5];
    if (v19)
    {
      *a7 = v19;
      uint64_t v18 = v25;
    }
  }
  BOOL v20 = v18[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v20;
}

void __89__CoreTelephonyClient_Lazuli__sendDeviceSettings_to_withMessageID_withSetting_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __89__CoreTelephonyClient_Lazuli__sendDeviceSettings_to_withMessageID_withSetting_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)sendTextMessage:(id)a3 toGroupDestination:(id)a4 withMessageID:(id)a5 withMessage:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__4;
  uint64_t v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __102__CoreTelephonyClient_Lazuli__sendTextMessage_toGroupDestination_withMessageID_withMessage_withError___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  id v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  id v17 = [[CTXPCSendTextMessageRequest alloc] initWithContext:v12 groupChatURI:v13 messageID:v14 message:v15];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __102__CoreTelephonyClient_Lazuli__sendTextMessage_toGroupDestination_withMessageID_withMessage_withError___block_invoke_2;
  v22[3] = &unk_1E5261A50;
  void v22[4] = &v24;
  [v16 sendRequest:v17 completionHandler:v22];
  uint64_t v18 = v25;
  if (a7)
  {
    uint64_t v19 = (void *)v25[5];
    if (v19)
    {
      *a7 = v19;
      uint64_t v18 = v25;
    }
  }
  BOOL v20 = v18[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v20;
}

void __102__CoreTelephonyClient_Lazuli__sendTextMessage_toGroupDestination_withMessageID_withMessage_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __102__CoreTelephonyClient_Lazuli__sendTextMessage_toGroupDestination_withMessageID_withMessage_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)sendGeolocationMessage:(id)a3 toGroupDestination:(id)a4 withMessageID:(id)a5 withGeoPush:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__4;
  uint64_t v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __109__CoreTelephonyClient_Lazuli__sendGeolocationMessage_toGroupDestination_withMessageID_withGeoPush_withError___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  id v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  id v17 = [[CTXPCSendGeolocationMessageRequest alloc] initWithContext:v12 groupChatURI:v13 messageID:v14 geoLocationPush:v15];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __109__CoreTelephonyClient_Lazuli__sendGeolocationMessage_toGroupDestination_withMessageID_withGeoPush_withError___block_invoke_2;
  v22[3] = &unk_1E5261A50;
  void v22[4] = &v24;
  [v16 sendRequest:v17 completionHandler:v22];
  uint64_t v18 = v25;
  if (a7)
  {
    uint64_t v19 = (void *)v25[5];
    if (v19)
    {
      *a7 = v19;
      uint64_t v18 = v25;
    }
  }
  BOOL v20 = v18[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v20;
}

void __109__CoreTelephonyClient_Lazuli__sendGeolocationMessage_toGroupDestination_withMessageID_withGeoPush_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __109__CoreTelephonyClient_Lazuli__sendGeolocationMessage_toGroupDestination_withMessageID_withGeoPush_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)sendFileTransferMessage:(id)a3 toGroupDestination:(id)a4 withMessageID:(id)a5 withFileInformation:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__4;
  uint64_t v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __118__CoreTelephonyClient_Lazuli__sendFileTransferMessage_toGroupDestination_withMessageID_withFileInformation_withError___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  id v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  id v17 = [[CTXPCSendFileTransferMessageRequest alloc] initWithContext:v12 groupChatURI:v13 messageID:v14 descriptor:v15];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __118__CoreTelephonyClient_Lazuli__sendFileTransferMessage_toGroupDestination_withMessageID_withFileInformation_withError___block_invoke_2;
  v22[3] = &unk_1E5261A50;
  void v22[4] = &v24;
  [v16 sendRequest:v17 completionHandler:v22];
  uint64_t v18 = v25;
  if (a7)
  {
    uint64_t v19 = (void *)v25[5];
    if (v19)
    {
      *a7 = v19;
      uint64_t v18 = v25;
    }
  }
  BOOL v20 = v18[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v20;
}

void __118__CoreTelephonyClient_Lazuli__sendFileTransferMessage_toGroupDestination_withMessageID_withFileInformation_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __118__CoreTelephonyClient_Lazuli__sendFileTransferMessage_toGroupDestination_withMessageID_withFileInformation_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)sendComposingIndicator:(id)a3 toGroupDestination:(id)a4 withMessageID:(id)a5 withIndication:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__4;
  uint64_t v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __112__CoreTelephonyClient_Lazuli__sendComposingIndicator_toGroupDestination_withMessageID_withIndication_withError___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  id v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  id v17 = [[CTXPCSendComposingIndicatorRequest alloc] initWithContext:v12 groupChatURI:v13 messageID:v14 indication:v15];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __112__CoreTelephonyClient_Lazuli__sendComposingIndicator_toGroupDestination_withMessageID_withIndication_withError___block_invoke_2;
  v22[3] = &unk_1E5261A50;
  void v22[4] = &v24;
  [v16 sendRequest:v17 completionHandler:v22];
  uint64_t v18 = v25;
  if (a7)
  {
    uint64_t v19 = (void *)v25[5];
    if (v19)
    {
      *a7 = v19;
      uint64_t v18 = v25;
    }
  }
  BOOL v20 = v18[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v20;
}

void __112__CoreTelephonyClient_Lazuli__sendComposingIndicator_toGroupDestination_withMessageID_withIndication_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __112__CoreTelephonyClient_Lazuli__sendComposingIndicator_toGroupDestination_withMessageID_withIndication_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)removeParticipants:(id)a3 fromGroupChat:(id)a4 withParticipantsToRemove:(id)a5 withOperationID:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__4;
  uint64_t v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __115__CoreTelephonyClient_Lazuli__removeParticipants_fromGroupChat_withParticipantsToRemove_withOperationID_withError___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  id v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  id v17 = [[CTXPCRemoveParticipantsRequest alloc] initWithContext:v12 groupChatURI:v13 participants:v14 operationID:v15];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __115__CoreTelephonyClient_Lazuli__removeParticipants_fromGroupChat_withParticipantsToRemove_withOperationID_withError___block_invoke_2;
  v22[3] = &unk_1E5261A50;
  void v22[4] = &v24;
  [v16 sendRequest:v17 completionHandler:v22];
  uint64_t v18 = v25;
  if (a7)
  {
    uint64_t v19 = (void *)v25[5];
    if (v19)
    {
      *a7 = v19;
      uint64_t v18 = v25;
    }
  }
  BOOL v20 = v18[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v20;
}

void __115__CoreTelephonyClient_Lazuli__removeParticipants_fromGroupChat_withParticipantsToRemove_withOperationID_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __115__CoreTelephonyClient_Lazuli__removeParticipants_fromGroupChat_withParticipantsToRemove_withOperationID_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)exit:(id)a3 groupChat:(id)a4 withOperationID:(id)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v21 = 0;
  BOOL v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__4;
  uint64_t v25 = __Block_byref_object_dispose__4;
  id v26 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__CoreTelephonyClient_Lazuli__exit_groupChat_withOperationID_withError___block_invoke;
  v20[3] = &unk_1E5260BA0;
  v20[4] = &v21;
  id v13 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v20];
  id v14 = [[CTXPCExitGroupChatRequest alloc] initWithContext:v10 groupChatURI:v11 operationID:v12];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__CoreTelephonyClient_Lazuli__exit_groupChat_withOperationID_withError___block_invoke_2;
  v19[3] = &unk_1E5261A50;
  void v19[4] = &v21;
  [v13 sendRequest:v14 completionHandler:v19];
  id v15 = v22;
  if (a6)
  {
    id v16 = (void *)v22[5];
    if (v16)
    {
      *a6 = v16;
      id v15 = v22;
    }
  }
  BOOL v17 = v15[5] == 0;

  _Block_object_dispose(&v21, 8);
  return v17;
}

void __72__CoreTelephonyClient_Lazuli__exit_groupChat_withOperationID_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __72__CoreTelephonyClient_Lazuli__exit_groupChat_withOperationID_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)create:(id)a3 groupChat:(id)a4 withOperationID:(id)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v21 = 0;
  BOOL v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__4;
  uint64_t v25 = __Block_byref_object_dispose__4;
  id v26 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __74__CoreTelephonyClient_Lazuli__create_groupChat_withOperationID_withError___block_invoke;
  v20[3] = &unk_1E5260BA0;
  v20[4] = &v21;
  id v13 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v20];
  id v14 = [[CTXPCCreateGroupChatRequest alloc] initWithContext:v10 groupChatInfo:v11 operationID:v12];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__CoreTelephonyClient_Lazuli__create_groupChat_withOperationID_withError___block_invoke_2;
  v19[3] = &unk_1E5261A50;
  void v19[4] = &v21;
  [v13 sendRequest:v14 completionHandler:v19];
  id v15 = v22;
  if (a6)
  {
    id v16 = (void *)v22[5];
    if (v16)
    {
      *a6 = v16;
      id v15 = v22;
    }
  }
  BOOL v17 = v15[5] == 0;

  _Block_object_dispose(&v21, 8);
  return v17;
}

void __74__CoreTelephonyClient_Lazuli__create_groupChat_withOperationID_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __74__CoreTelephonyClient_Lazuli__create_groupChat_withOperationID_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)changeSubject:(id)a3 forGroupChat:(id)a4 withNewSubject:(id)a5 withOperationID:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__4;
  uint64_t v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __99__CoreTelephonyClient_Lazuli__changeSubject_forGroupChat_withNewSubject_withOperationID_withError___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  id v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  BOOL v17 = [[CTXPCChangeSubjectRequest alloc] initWithContext:v12 groupChatURI:v13 subject:v14 operationID:v15];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __99__CoreTelephonyClient_Lazuli__changeSubject_forGroupChat_withNewSubject_withOperationID_withError___block_invoke_2;
  v22[3] = &unk_1E5261A50;
  void v22[4] = &v24;
  [v16 sendRequest:v17 completionHandler:v22];
  uint64_t v18 = v25;
  if (a7)
  {
    uint64_t v19 = (void *)v25[5];
    if (v19)
    {
      *a7 = v19;
      uint64_t v18 = v25;
    }
  }
  BOOL v20 = v18[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v20;
}

void __99__CoreTelephonyClient_Lazuli__changeSubject_forGroupChat_withNewSubject_withOperationID_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __99__CoreTelephonyClient_Lazuli__changeSubject_forGroupChat_withNewSubject_withOperationID_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)changeIcon:(id)a3 forGroupChat:(id)a4 withNewIcon:(id)a5 withOperationID:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__4;
  uint64_t v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __93__CoreTelephonyClient_Lazuli__changeIcon_forGroupChat_withNewIcon_withOperationID_withError___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  id v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  BOOL v17 = [[CTXPCChangeIconRequest alloc] initWithContext:v12 groupChatURI:v13 icon:v14 operationID:v15];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __93__CoreTelephonyClient_Lazuli__changeIcon_forGroupChat_withNewIcon_withOperationID_withError___block_invoke_2;
  v22[3] = &unk_1E5261A50;
  void v22[4] = &v24;
  [v16 sendRequest:v17 completionHandler:v22];
  uint64_t v18 = v25;
  if (a7)
  {
    uint64_t v19 = (void *)v25[5];
    if (v19)
    {
      *a7 = v19;
      uint64_t v18 = v25;
    }
  }
  BOOL v20 = v18[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v20;
}

void __93__CoreTelephonyClient_Lazuli__changeIcon_forGroupChat_withNewIcon_withOperationID_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __93__CoreTelephonyClient_Lazuli__changeIcon_forGroupChat_withNewIcon_withOperationID_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)addParticipants:(id)a3 toGroupChat:(id)a4 withParticipantsToAdd:(id)a5 withOperationID:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__4;
  uint64_t v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __107__CoreTelephonyClient_Lazuli__addParticipants_toGroupChat_withParticipantsToAdd_withOperationID_withError___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  id v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  BOOL v17 = [[CTXPCAddParticipantsRequest alloc] initWithContext:v12 groupChatURI:v13 participants:v14 operationID:v15];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __107__CoreTelephonyClient_Lazuli__addParticipants_toGroupChat_withParticipantsToAdd_withOperationID_withError___block_invoke_2;
  v22[3] = &unk_1E5261A50;
  void v22[4] = &v24;
  [v16 sendRequest:v17 completionHandler:v22];
  uint64_t v18 = v25;
  if (a7)
  {
    uint64_t v19 = (void *)v25[5];
    if (v19)
    {
      *a7 = v19;
      uint64_t v18 = v25;
    }
  }
  BOOL v20 = v18[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v20;
}

void __107__CoreTelephonyClient_Lazuli__addParticipants_toGroupChat_withParticipantsToAdd_withOperationID_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __107__CoreTelephonyClient_Lazuli__addParticipants_toGroupChat_withParticipantsToAdd_withOperationID_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (id)decodeSuggestionsBase64:(id)a3 withBase64String:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__4;
  id v27 = __Block_byref_object_dispose__4;
  id v28 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __82__CoreTelephonyClient_Lazuli__decodeSuggestionsBase64_withBase64String_withError___block_invoke;
  v22[3] = &unk_1E5260BA0;
  void v22[4] = &v23;
  id v10 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v22];
  id v11 = [[CTXPCDecodeSuggestionsBase64Request alloc] initWithContext:v8 base64String:v9];
  uint64_t v16 = 0;
  BOOL v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__4;
  BOOL v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __82__CoreTelephonyClient_Lazuli__decodeSuggestionsBase64_withBase64String_withError___block_invoke_2;
  v15[3] = &unk_1E5261A78;
  void v15[4] = &v16;
  void v15[5] = &v23;
  [v10 sendRequest:v11 completionHandler:v15];
  if (a5)
  {
    id v12 = (void *)v24[5];
    if (v12) {
      *a5 = v12;
    }
  }
  id v13 = [(id)v17[5] decodedPayload];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v23, 8);

  return v13;
}

void __82__CoreTelephonyClient_Lazuli__decodeSuggestionsBase64_withBase64String_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __82__CoreTelephonyClient_Lazuli__decodeSuggestionsBase64_withBase64String_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v12;
  }
  else {
    id v7 = 0;
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
}

- (BOOL)deleteChat:(id)a3 chat:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__4;
  BOOL v22 = __Block_byref_object_dispose__4;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__CoreTelephonyClient_Lazuli__deleteChat_chat_withError___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  uint64_t v10 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  id v11 = [[CTXPCDeleteChatRequest alloc] initWithContext:v8 chat:v9];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__CoreTelephonyClient_Lazuli__deleteChat_chat_withError___block_invoke_2;
  v16[3] = &unk_1E5261A50;
  void v16[4] = &v18;
  [v10 sendRequest:v11 completionHandler:v16];
  id v12 = v19;
  if (a5)
  {
    id v13 = (void *)v19[5];
    if (v13)
    {
      *a5 = v13;
      id v12 = v19;
    }
  }
  BOOL v14 = v12[5] == 0;

  _Block_object_dispose(&v18, 8);
  return v14;
}

void __57__CoreTelephonyClient_Lazuli__deleteChat_chat_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __57__CoreTelephonyClient_Lazuli__deleteChat_chat_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)sendGroupDispositionNotificationMessage:(id)a3 toGroup:(id)a4 to:(id)a5 withMessageID:(id)a6 withDisposition:(int64_t)a7 forMessageID:(id)a8 withError:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__4;
  v32 = __Block_byref_object_dispose__4;
  id v33 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __135__CoreTelephonyClient_Lazuli__sendGroupDispositionNotificationMessage_toGroup_to_withMessageID_withDisposition_forMessageID_withError___block_invoke;
  v27[3] = &unk_1E5260BA0;
  v27[4] = &v28;
  uint64_t v20 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v27];
  id v21 = [[CTXPCSendDispositionNotificationMessageRequest alloc] initWithContext:v15 groupChatURI:v16 destination:v17 messageID:v18 notificationType:a7 notificationMessageID:v19];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __135__CoreTelephonyClient_Lazuli__sendGroupDispositionNotificationMessage_toGroup_to_withMessageID_withDisposition_forMessageID_withError___block_invoke_2;
  v26[3] = &unk_1E5261A50;
  v26[4] = &v28;
  [v20 sendRequest:v21 completionHandler:v26];
  BOOL v22 = v29;
  if (a9)
  {
    id v23 = (void *)v29[5];
    if (v23)
    {
      *a9 = v23;
      BOOL v22 = v29;
    }
  }
  BOOL v24 = v22[5] == 0;

  _Block_object_dispose(&v28, 8);
  return v24;
}

void __135__CoreTelephonyClient_Lazuli__sendGroupDispositionNotificationMessage_toGroup_to_withMessageID_withDisposition_forMessageID_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __135__CoreTelephonyClient_Lazuli__sendGroupDispositionNotificationMessage_toGroup_to_withMessageID_withDisposition_forMessageID_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (id)setProvisioningServerURL:(id)a3 url:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__4;
  id v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__CoreTelephonyClient_Lazuli__setProvisioningServerURL_url___block_invoke;
  v13[3] = &unk_1E5260BA0;
  void v13[4] = &v14;
  id v8 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v13];
  id v9 = [[CTXPCSetProvisioningServerURLRequest alloc] initWithContext:v6 url:v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__CoreTelephonyClient_Lazuli__setProvisioningServerURL_url___block_invoke_2;
  v12[3] = &unk_1E5261A50;
  void v12[4] = &v14;
  [v8 sendRequest:v9 completionHandler:v12];
  id v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v10;
}

void __60__CoreTelephonyClient_Lazuli__setProvisioningServerURL_url___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __60__CoreTelephonyClient_Lazuli__setProvisioningServerURL_url___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (id)getProvisioningServerURL:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__4;
  BOOL v24 = __Block_byref_object_dispose__4;
  id v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__CoreTelephonyClient_Lazuli__getProvisioningServerURL_outError___block_invoke;
  v19[3] = &unk_1E5260BA0;
  void v19[4] = &v20;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v19];
  id v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetProvisioningServerURLRequest alloc] initWithContext:v6];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__4;
  id v17 = __Block_byref_object_dispose__4;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__CoreTelephonyClient_Lazuli__getProvisioningServerURL_outError___block_invoke_2;
  v12[3] = &unk_1E5261A78;
  void v12[4] = &v13;
  void v12[5] = &v20;
  [v7 sendRequest:v8 completionHandler:v12];
  if (a4)
  {
    id v9 = (void *)v21[5];
    if (v9) {
      *a4 = v9;
    }
  }
  id v10 = [(id)v14[5] url];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v20, 8);

  return v10;
}

void __65__CoreTelephonyClient_Lazuli__getProvisioningServerURL_outError___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __65__CoreTelephonyClient_Lazuli__getProvisioningServerURL_outError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v12;
  }
  else {
    id v7 = 0;
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
}

- (id)readCachedCapabilities:(id)a3 forDestination:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0;
  BOOL v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__4;
  id v27 = __Block_byref_object_dispose__4;
  id v28 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __79__CoreTelephonyClient_Lazuli__readCachedCapabilities_forDestination_withError___block_invoke;
  v22[3] = &unk_1E5260BA0;
  void v22[4] = &v23;
  uint64_t v10 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v22];
  id v11 = [[CTXPCReadCachedCapabilitiesRequest alloc] initWithContext:v8 destination:v9];
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__4;
  uint64_t v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __79__CoreTelephonyClient_Lazuli__readCachedCapabilities_forDestination_withError___block_invoke_2;
  v15[3] = &unk_1E5261A78;
  void v15[4] = &v23;
  void v15[5] = &v16;
  [v10 sendRequest:v11 completionHandler:v15];
  if (a5)
  {
    id v12 = (void *)v24[5];
    if (v12) {
      *a5 = v12;
    }
  }
  uint64_t v13 = [(id)v17[5] capabilitiesInfo];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v23, 8);

  return v13;
}

void __79__CoreTelephonyClient_Lazuli__readCachedCapabilities_forDestination_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __79__CoreTelephonyClient_Lazuli__readCachedCapabilities_forDestination_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v10 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v10;
  }
  else {
    id v7 = 0;
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (BOOL)sendOneToManyTextMessage:(id)a3 to:(id)a4 withMessageID:(id)a5 withMessage:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__4;
  id v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __95__CoreTelephonyClient_Lazuli__sendOneToManyTextMessage_to_withMessageID_withMessage_withError___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  uint64_t v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  id v17 = [[CTXPCSendOneToManyTextMessageRequest alloc] initWithContext:v12 to:v13 withMessageID:v14 withMessage:v15];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __95__CoreTelephonyClient_Lazuli__sendOneToManyTextMessage_to_withMessageID_withMessage_withError___block_invoke_2;
  v22[3] = &unk_1E5261A50;
  void v22[4] = &v24;
  [v16 sendRequest:v17 completionHandler:v22];
  uint64_t v18 = v25;
  if (a7)
  {
    id v19 = (void *)v25[5];
    if (v19)
    {
      *a7 = v19;
      uint64_t v18 = v25;
    }
  }
  BOOL v20 = v18[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v20;
}

void __95__CoreTelephonyClient_Lazuli__sendOneToManyTextMessage_to_withMessageID_withMessage_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __95__CoreTelephonyClient_Lazuli__sendOneToManyTextMessage_to_withMessageID_withMessage_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)sendOneToManyGeolocationMessage:(id)a3 to:(id)a4 withMessageID:(id)a5 withGeoPush:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__4;
  id v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __102__CoreTelephonyClient_Lazuli__sendOneToManyGeolocationMessage_to_withMessageID_withGeoPush_withError___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  uint64_t v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  id v17 = [[CTXPCSendOneToManyGeoLocationRequest alloc] initWithContext:v12 to:v13 withMessageID:v14 withGeoPush:v15];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __102__CoreTelephonyClient_Lazuli__sendOneToManyGeolocationMessage_to_withMessageID_withGeoPush_withError___block_invoke_2;
  v22[3] = &unk_1E5261A50;
  void v22[4] = &v24;
  [v16 sendRequest:v17 completionHandler:v22];
  uint64_t v18 = v25;
  if (a7)
  {
    id v19 = (void *)v25[5];
    if (v19)
    {
      *a7 = v19;
      uint64_t v18 = v25;
    }
  }
  BOOL v20 = v18[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v20;
}

void __102__CoreTelephonyClient_Lazuli__sendOneToManyGeolocationMessage_to_withMessageID_withGeoPush_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __102__CoreTelephonyClient_Lazuli__sendOneToManyGeolocationMessage_to_withMessageID_withGeoPush_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)sendOneToManyFileTransferMessage:(id)a3 to:(id)a4 withMessageID:(id)a5 withDescriptor:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__4;
  id v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __106__CoreTelephonyClient_Lazuli__sendOneToManyFileTransferMessage_to_withMessageID_withDescriptor_withError___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  uint64_t v16 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  id v17 = [[CTXPCSendOneToManyFileTransferRequest alloc] initWithContext:v12 to:v13 withMessageID:v14 withDescriptor:v15];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __106__CoreTelephonyClient_Lazuli__sendOneToManyFileTransferMessage_to_withMessageID_withDescriptor_withError___block_invoke_2;
  v22[3] = &unk_1E5261A50;
  void v22[4] = &v24;
  [v16 sendRequest:v17 completionHandler:v22];
  uint64_t v18 = v25;
  if (a7)
  {
    id v19 = (void *)v25[5];
    if (v19)
    {
      *a7 = v19;
      uint64_t v18 = v25;
    }
  }
  BOOL v20 = v18[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v20;
}

void __106__CoreTelephonyClient_Lazuli__sendOneToManyFileTransferMessage_to_withMessageID_withDescriptor_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __106__CoreTelephonyClient_Lazuli__sendOneToManyFileTransferMessage_to_withMessageID_withDescriptor_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)enableBusinessMessaging:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__4;
  id v17 = __Block_byref_object_dispose__4;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__CoreTelephonyClient_Lazuli__enableBusinessMessaging_withError___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  uint64_t v8 = [[CTXPCSetBusinessMessagingStateRequest alloc] initWithContext:v6 shouldEnable:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__CoreTelephonyClient_Lazuli__enableBusinessMessaging_withError___block_invoke_2;
  v11[3] = &unk_1E5261A50;
  void v11[4] = &v13;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v14[5];
  }
  BOOL v9 = v14[5] == 0;

  _Block_object_dispose(&v13, 8);
  return v9;
}

void __65__CoreTelephonyClient_Lazuli__enableBusinessMessaging_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __65__CoreTelephonyClient_Lazuli__enableBusinessMessaging_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)disableBusinessMessaging:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__4;
  id v17 = __Block_byref_object_dispose__4;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__CoreTelephonyClient_Lazuli__disableBusinessMessaging_withError___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  uint64_t v8 = [[CTXPCSetBusinessMessagingStateRequest alloc] initWithContext:v6 shouldEnable:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__CoreTelephonyClient_Lazuli__disableBusinessMessaging_withError___block_invoke_2;
  v11[3] = &unk_1E5261A50;
  void v11[4] = &v13;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v14[5];
  }
  BOOL v9 = v14[5] == 0;

  _Block_object_dispose(&v13, 8);
  return v9;
}

void __66__CoreTelephonyClient_Lazuli__disableBusinessMessaging_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __66__CoreTelephonyClient_Lazuli__disableBusinessMessaging_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (void)getSmsReadyState:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__CoreTelephonyClient_SMS__getSmsReadyState_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  BOOL v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 getSmsReadyState:v6 completion:v8];
}

uint64_t __56__CoreTelephonyClient_SMS__getSmsReadyState_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getSmsReadyState:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__5;
  uint64_t v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__CoreTelephonyClient_SMS__getSmsReadyState_error___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__5;
  uint64_t v15 = __Block_byref_object_dispose__5;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__CoreTelephonyClient_SMS__getSmsReadyState_error___block_invoke_2;
  v10[3] = &unk_1E5260D78;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 getSmsReadyState:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __51__CoreTelephonyClient_SMS__getSmsReadyState_error___block_invoke(uint64_t a1, void *a2)
{
}

void __51__CoreTelephonyClient_SMS__getSmsReadyState_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v6 = v10;
  if (!v10)
  {
    uint64_t v7 = [NSNumber numberWithBool:a2];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v6 = 0;
  }
}

- (void)getSmscAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__CoreTelephonyClient_SMS__getSmscAddress_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  BOOL v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 getSmscAddress:v6 completion:v8];
}

uint64_t __54__CoreTelephonyClient_SMS__getSmscAddress_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getSmscAddress:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__5;
  uint64_t v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __49__CoreTelephonyClient_SMS__getSmscAddress_error___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__5;
  uint64_t v15 = __Block_byref_object_dispose__5;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__CoreTelephonyClient_SMS__getSmscAddress_error___block_invoke_2;
  v10[3] = &unk_1E5261AC0;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 getSmscAddress:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __49__CoreTelephonyClient_SMS__getSmscAddress_error___block_invoke(uint64_t a1, void *a2)
{
}

void __49__CoreTelephonyClient_SMS__getSmscAddress_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (!v5)
  {
    uint64_t v6 = [v9 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (void)getEmergencyTextNumbers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__CoreTelephonyClient_SMS__getEmergencyTextNumbers_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 getEmergencyTextNumbers:v6 completion:v8];
}

uint64_t __63__CoreTelephonyClient_SMS__getEmergencyTextNumbers_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getEmergencyTextNumbers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__5;
  uint64_t v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__CoreTelephonyClient_SMS__getEmergencyTextNumbers_error___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__5;
  uint64_t v15 = __Block_byref_object_dispose__5;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__CoreTelephonyClient_SMS__getEmergencyTextNumbers_error___block_invoke_2;
  v10[3] = &unk_1E5260BF0;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 getEmergencyTextNumbers:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __58__CoreTelephonyClient_SMS__getEmergencyTextNumbers_error___block_invoke(uint64_t a1, void *a2)
{
}

void __58__CoreTelephonyClient_SMS__getEmergencyTextNumbers_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (!v5)
  {
    uint64_t v6 = [v9 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (void)dataUsageForLastPeriods:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__CoreTelephonyClient_DataUsage__dataUsageForLastPeriods_completion___block_invoke;
  v9[3] = &unk_1E5260CB8;
  id v7 = v6;
  id v10 = v7;
  id v8 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v9];
  [v8 dataUsageForLastPeriods:a3 completion:v7];
}

uint64_t __69__CoreTelephonyClient_DataUsage__dataUsageForLastPeriods_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dataUsageForLastPeriodsOnActivePairedDevice:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__CoreTelephonyClient_DataUsage__dataUsageForLastPeriodsOnActivePairedDevice_completion___block_invoke;
  v9[3] = &unk_1E5260CB8;
  id v7 = v6;
  id v10 = v7;
  id v8 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v9];
  [v8 dataUsageForLastPeriodsOnActivePairedDevice:a3 completion:v7];
}

uint64_t __89__CoreTelephonyClient_DataUsage__dataUsageForLastPeriodsOnActivePairedDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)billingCycleEndDatesForLastPeriods:(unint64_t)a3 error:(id *)a4
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__6;
  id v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__CoreTelephonyClient_DataUsage__billingCycleEndDatesForLastPeriods_error___block_invoke;
  v16[3] = &unk_1E5260BA0;
  void v16[4] = &v17;
  id v6 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v16];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__6;
  id v14 = __Block_byref_object_dispose__6;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__CoreTelephonyClient_DataUsage__billingCycleEndDatesForLastPeriods_error___block_invoke_2;
  v9[3] = &unk_1E5260BF0;
  void v9[4] = &v17;
  void v9[5] = &v10;
  [v6 billingCycleEndDatesForLastPeriods:a3 completion:v9];
  if (a4) {
    *a4 = (id) v18[5];
  }
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v17, 8);

  return v7;
}

void __75__CoreTelephonyClient_DataUsage__billingCycleEndDatesForLastPeriods_error___block_invoke(uint64_t a1, void *a2)
{
}

void __75__CoreTelephonyClient_DataUsage__billingCycleEndDatesForLastPeriods_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)usageCollectionEnabled:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__CoreTelephonyClient_DataUsage__usageCollectionEnabled___block_invoke;
  v7[3] = &unk_1E5260CB8;
  id v5 = v4;
  id v8 = v5;
  uint64_t v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  [v6 usageCollectionEnabled:v5];
}

uint64_t __57__CoreTelephonyClient_DataUsage__usageCollectionEnabled___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)usageCollectionEnabledSync:(id *)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__6;
  uint64_t v19 = __Block_byref_object_dispose__6;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__CoreTelephonyClient_DataUsage__usageCollectionEnabledSync___block_invoke;
  v14[3] = &unk_1E5260BA0;
  void v14[4] = &v15;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v14];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__6;
  uint64_t v12 = __Block_byref_object_dispose__6;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__CoreTelephonyClient_DataUsage__usageCollectionEnabledSync___block_invoke_2;
  v7[3] = &unk_1E5262218;
  void v7[4] = &v15;
  void v7[5] = &v8;
  [v4 usageCollectionEnabled:v7];
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v15, 8);

  return v5;
}

void __61__CoreTelephonyClient_DataUsage__usageCollectionEnabledSync___block_invoke(uint64_t a1, void *a2)
{
}

void __61__CoreTelephonyClient_DataUsage__usageCollectionEnabledSync___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)setUsageCollectionEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__CoreTelephonyClient_DataUsage__setUsageCollectionEnabled_completion___block_invoke;
  v9[3] = &unk_1E5260CB8;
  id v7 = v6;
  id v10 = v7;
  id v8 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v9];
  [v8 setUsageCollectionEnabled:v4 completion:v7];
}

uint64_t __71__CoreTelephonyClient_DataUsage__setUsageCollectionEnabled_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)userEnteredMonthlyBudget:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__CoreTelephonyClient_DataUsage__userEnteredMonthlyBudget_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 userEnteredMonthlyBudget:v6 completion:v8];
}

uint64_t __70__CoreTelephonyClient_DataUsage__userEnteredMonthlyBudget_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)userEnteredMonthlyBudget:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__6;
  id v22 = __Block_byref_object_dispose__6;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__CoreTelephonyClient_DataUsage__userEnteredMonthlyBudget_error___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__6;
  uint64_t v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__CoreTelephonyClient_DataUsage__userEnteredMonthlyBudget_error___block_invoke_2;
  v10[3] = &unk_1E5262218;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 userEnteredMonthlyBudget:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __65__CoreTelephonyClient_DataUsage__userEnteredMonthlyBudget_error___block_invoke(uint64_t a1, void *a2)
{
}

void __65__CoreTelephonyClient_DataUsage__userEnteredMonthlyBudget_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)setUserEntered:(id)a3 monthlyBudget:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__CoreTelephonyClient_DataUsage__setUserEntered_monthlyBudget_completion___block_invoke;
  v13[3] = &unk_1E5260CB8;
  id v11 = v10;
  id v14 = v11;
  uint64_t v12 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  [v12 setUserEntered:v8 monthlyBudget:v9 completion:v11];
}

uint64_t __74__CoreTelephonyClient_DataUsage__setUserEntered_monthlyBudget_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setUserEntered:(id)a3 monthlyBudget:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__6;
  uint64_t v17 = __Block_byref_object_dispose__6;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__CoreTelephonyClient_DataUsage__setUserEntered_monthlyBudget_error___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  id v10 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__CoreTelephonyClient_DataUsage__setUserEntered_monthlyBudget_error___block_invoke_2;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v13;
  [v10 setUserEntered:v8 monthlyBudget:v9 completion:v11];
  if (a5) {
    *a5 = (id) v14[5];
  }

  _Block_object_dispose(&v13, 8);
}

void __69__CoreTelephonyClient_DataUsage__setUserEntered_monthlyBudget_error___block_invoke(uint64_t a1, void *a2)
{
}

void __69__CoreTelephonyClient_DataUsage__setUserEntered_monthlyBudget_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)clearUserEnteredMonthlyBudget:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__CoreTelephonyClient_DataUsage__clearUserEnteredMonthlyBudget_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 clearUserEnteredMonthlyBudget:v6 completion:v8];
}

uint64_t __75__CoreTelephonyClient_DataUsage__clearUserEnteredMonthlyBudget_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearUserEnteredMonthlyBudget:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__6;
  id v14 = __Block_byref_object_dispose__6;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__CoreTelephonyClient_DataUsage__clearUserEnteredMonthlyBudget_error___block_invoke;
  v9[3] = &unk_1E5260BA0;
  void v9[4] = &v10;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__CoreTelephonyClient_DataUsage__clearUserEnteredMonthlyBudget_error___block_invoke_2;
  v8[3] = &unk_1E5260BA0;
  v8[4] = &v10;
  [v7 clearUserEnteredMonthlyBudget:v6 completion:v8];
  if (a4) {
    *a4 = (id) v11[5];
  }

  _Block_object_dispose(&v10, 8);
}

void __70__CoreTelephonyClient_DataUsage__clearUserEnteredMonthlyBudget_error___block_invoke(uint64_t a1, void *a2)
{
}

void __70__CoreTelephonyClient_DataUsage__clearUserEnteredMonthlyBudget_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)userEnteredMonthlyRoamingBudget:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__CoreTelephonyClient_DataUsage__userEnteredMonthlyRoamingBudget_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 userEnteredMonthlyRoamingBudget:v6 completion:v8];
}

uint64_t __77__CoreTelephonyClient_DataUsage__userEnteredMonthlyRoamingBudget_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)userEnteredMonthlyRoamingBudget:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__6;
  id v22 = __Block_byref_object_dispose__6;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__CoreTelephonyClient_DataUsage__userEnteredMonthlyRoamingBudget_error___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__6;
  id v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__CoreTelephonyClient_DataUsage__userEnteredMonthlyRoamingBudget_error___block_invoke_2;
  v10[3] = &unk_1E5262218;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 userEnteredMonthlyRoamingBudget:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __72__CoreTelephonyClient_DataUsage__userEnteredMonthlyRoamingBudget_error___block_invoke(uint64_t a1, void *a2)
{
}

void __72__CoreTelephonyClient_DataUsage__userEnteredMonthlyRoamingBudget_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)setUserEntered:(id)a3 monthlyRoamingBudget:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__CoreTelephonyClient_DataUsage__setUserEntered_monthlyRoamingBudget_completion___block_invoke;
  v13[3] = &unk_1E5260CB8;
  id v11 = v10;
  id v14 = v11;
  uint64_t v12 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  [v12 setUserEntered:v8 monthlyRoamingBudget:v9 completion:v11];
}

uint64_t __81__CoreTelephonyClient_DataUsage__setUserEntered_monthlyRoamingBudget_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setUserEntered:(id)a3 monthlyRoamingBudget:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__6;
  uint64_t v17 = __Block_byref_object_dispose__6;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__CoreTelephonyClient_DataUsage__setUserEntered_monthlyRoamingBudget_error___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  id v10 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__CoreTelephonyClient_DataUsage__setUserEntered_monthlyRoamingBudget_error___block_invoke_2;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v13;
  [v10 setUserEntered:v8 monthlyRoamingBudget:v9 completion:v11];
  if (a5) {
    *a5 = (id) v14[5];
  }

  _Block_object_dispose(&v13, 8);
}

void __76__CoreTelephonyClient_DataUsage__setUserEntered_monthlyRoamingBudget_error___block_invoke(uint64_t a1, void *a2)
{
}

void __76__CoreTelephonyClient_DataUsage__setUserEntered_monthlyRoamingBudget_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)clearUserEnteredMonthlyRoamingBudget:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__CoreTelephonyClient_DataUsage__clearUserEnteredMonthlyRoamingBudget_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 clearUserEnteredMonthlyRoamingBudget:v6 completion:v8];
}

uint64_t __82__CoreTelephonyClient_DataUsage__clearUserEnteredMonthlyRoamingBudget_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearUserEnteredMonthlyRoamingBudget:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__6;
  id v14 = __Block_byref_object_dispose__6;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__CoreTelephonyClient_DataUsage__clearUserEnteredMonthlyRoamingBudget_error___block_invoke;
  v9[3] = &unk_1E5260BA0;
  void v9[4] = &v10;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__CoreTelephonyClient_DataUsage__clearUserEnteredMonthlyRoamingBudget_error___block_invoke_2;
  v8[3] = &unk_1E5260BA0;
  v8[4] = &v10;
  [v7 clearUserEnteredMonthlyRoamingBudget:v6 completion:v8];
  if (a4) {
    *a4 = (id) v11[5];
  }

  _Block_object_dispose(&v10, 8);
}

void __77__CoreTelephonyClient_DataUsage__clearUserEnteredMonthlyRoamingBudget_error___block_invoke(uint64_t a1, void *a2)
{
}

void __77__CoreTelephonyClient_DataUsage__clearUserEnteredMonthlyRoamingBudget_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)userEnteredBillingEndDayOfMont:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__CoreTelephonyClient_DataUsage__userEnteredBillingEndDayOfMont_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 userEnteredBillingEndDayOfMont:v6 completion:v8];
}

uint64_t __76__CoreTelephonyClient_DataUsage__userEnteredBillingEndDayOfMont_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)userEnteredBillingEndDayOfMont:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__6;
  id v22 = __Block_byref_object_dispose__6;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__CoreTelephonyClient_DataUsage__userEnteredBillingEndDayOfMont_error___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__6;
  id v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__CoreTelephonyClient_DataUsage__userEnteredBillingEndDayOfMont_error___block_invoke_2;
  v10[3] = &unk_1E5262218;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 userEnteredBillingEndDayOfMont:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __71__CoreTelephonyClient_DataUsage__userEnteredBillingEndDayOfMont_error___block_invoke(uint64_t a1, void *a2)
{
}

void __71__CoreTelephonyClient_DataUsage__userEnteredBillingEndDayOfMont_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)setUserEnteredBillingEnd:(id)a3 dayOfMonth:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__CoreTelephonyClient_DataUsage__setUserEnteredBillingEnd_dayOfMonth_completion___block_invoke;
  v13[3] = &unk_1E5260CB8;
  id v11 = v10;
  id v14 = v11;
  uint64_t v12 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  [v12 setUserEnteredBillingEnd:v8 dayOfMonth:v9 completion:v11];
}

uint64_t __81__CoreTelephonyClient_DataUsage__setUserEnteredBillingEnd_dayOfMonth_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setUserEnteredBillingEnd:(id)a3 dayOfMonth:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__6;
  uint64_t v17 = __Block_byref_object_dispose__6;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__CoreTelephonyClient_DataUsage__setUserEnteredBillingEnd_dayOfMonth_error___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  id v10 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__CoreTelephonyClient_DataUsage__setUserEnteredBillingEnd_dayOfMonth_error___block_invoke_2;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v13;
  [v10 setUserEnteredBillingEnd:v8 dayOfMonth:v9 completion:v11];
  if (a5) {
    *a5 = (id) v14[5];
  }

  _Block_object_dispose(&v13, 8);
}

void __76__CoreTelephonyClient_DataUsage__setUserEnteredBillingEnd_dayOfMonth_error___block_invoke(uint64_t a1, void *a2)
{
}

void __76__CoreTelephonyClient_DataUsage__setUserEnteredBillingEnd_dayOfMonth_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)clearUserEnteredBillingEndDayOfMonth:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__CoreTelephonyClient_DataUsage__clearUserEnteredBillingEndDayOfMonth_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 clearUserEnteredBillingEndDayOfMonth:v6 completion:v8];
}

uint64_t __82__CoreTelephonyClient_DataUsage__clearUserEnteredBillingEndDayOfMonth_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearUserEnteredBillingEndDayOfMonth:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__6;
  id v14 = __Block_byref_object_dispose__6;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__CoreTelephonyClient_DataUsage__clearUserEnteredBillingEndDayOfMonth_error___block_invoke;
  v9[3] = &unk_1E5260BA0;
  void v9[4] = &v10;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__CoreTelephonyClient_DataUsage__clearUserEnteredBillingEndDayOfMonth_error___block_invoke_2;
  v8[3] = &unk_1E5260BA0;
  v8[4] = &v10;
  [v7 clearUserEnteredBillingEndDayOfMonth:v6 completion:v8];
  if (a4) {
    *a4 = (id) v11[5];
  }

  _Block_object_dispose(&v10, 8);
}

void __77__CoreTelephonyClient_DataUsage__clearUserEnteredBillingEndDayOfMonth_error___block_invoke(uint64_t a1, void *a2)
{
}

void __77__CoreTelephonyClient_DataUsage__clearUserEnteredBillingEndDayOfMonth_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)getCellularUsageWorkspaceInfo:(id *)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__6;
  uint64_t v19 = __Block_byref_object_dispose__6;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__CoreTelephonyClient_DataUsage__getCellularUsageWorkspaceInfo___block_invoke;
  v14[3] = &unk_1E5260BA0;
  void v14[4] = &v15;
  BOOL v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v14];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__6;
  uint64_t v12 = __Block_byref_object_dispose__6;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__CoreTelephonyClient_DataUsage__getCellularUsageWorkspaceInfo___block_invoke_2;
  v7[3] = &unk_1E5262240;
  void v7[4] = &v15;
  void v7[5] = &v8;
  [v4 getCellularUsageWorkspaceInfo:v7];
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v15, 8);

  return v5;
}

void __64__CoreTelephonyClient_DataUsage__getCellularUsageWorkspaceInfo___block_invoke(uint64_t a1, void *a2)
{
}

void __64__CoreTelephonyClient_DataUsage__getCellularUsageWorkspaceInfo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)supportsSelector:(SEL)a3 withContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (!v8)
  {
    if (a5)
    {
      uint64_t v10 = 22;
LABEL_8:
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:v10 userInfo:0];
      BOOL v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    BOOL v9 = 0;
    goto LABEL_10;
  }
  if (![(CoreTelephonyClient *)self supportsRequestWithSelector:a3])
  {
    if (a5)
    {
      uint64_t v10 = 19;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  BOOL v9 = 1;
LABEL_10:

  return v9;
}

- (void)copyCarrierBundleValue:(id)a3 key:(id)a4 bundleType:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v28 = 0;
  BOOL v15 = [(CoreTelephonyClient *)self supportsSelector:a2 withContext:v11 error:&v28];
  id v16 = v28;
  if (v15)
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __87__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValue_key_bundleType_completion___block_invoke_2;
    id v23 = &unk_1E5260CB8;
    id v17 = v14;
    id v24 = v17;
    id v18 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v20];
    objc_msgSend(v18, "copyCarrierBundleValue:key:bundleType:completion:", v11, v12, v13, v17, v20, v21, v22, v23);
    uint64_t v19 = &v24;
  }
  else
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __87__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValue_key_bundleType_completion___block_invoke;
    v25[3] = &unk_1E52629A0;
    id v27 = v14;
    id v26 = v16;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v25];
    uint64_t v19 = &v27;
    id v18 = v26;
  }
}

uint64_t __87__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValue_key_bundleType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __87__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValue_key_bundleType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)copyCarrierBundleValue:(id)a3 key:(id)a4 bundleType:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ([(CoreTelephonyClient *)self supportsSelector:a2 withContext:v11 error:a6])
  {
    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x3032000000;
    id v28 = __Block_byref_object_copy__7;
    id v29 = __Block_byref_object_dispose__7;
    id v30 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __82__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValue_key_bundleType_error___block_invoke;
    v24[3] = &unk_1E5260BA0;
    v24[4] = &v25;
    id v14 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v24];
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__7;
    id v22 = __Block_byref_object_dispose__7;
    id v23 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __82__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValue_key_bundleType_error___block_invoke_2;
    v17[3] = &unk_1E5260F78;
    void v17[4] = &v25;
    void v17[5] = &v18;
    [v14 copyCarrierBundleValue:v11 key:v12 bundleType:v13 completion:v17];
    if (a6) {
      *a6 = (id) v26[5];
    }
    id v15 = (id)v19[5];
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

void __82__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValue_key_bundleType_error___block_invoke(uint64_t a1, void *a2)
{
}

void __82__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValue_key_bundleType_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)copyCarrierBundleValue:(id)a3 keyHierarchy:(id)a4 bundleType:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v28 = 0;
  BOOL v15 = [(CoreTelephonyClient *)self supportsSelector:a2 withContext:v11 error:&v28];
  id v16 = v28;
  if (v15)
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __96__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValue_keyHierarchy_bundleType_completion___block_invoke_2;
    id v23 = &unk_1E5260CB8;
    id v17 = v14;
    id v24 = v17;
    uint64_t v18 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v20];
    objc_msgSend(v18, "copyCarrierBundleValue:keyHierarchy:bundleType:completion:", v11, v12, v13, v17, v20, v21, v22, v23);
    uint64_t v19 = &v24;
  }
  else
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __96__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValue_keyHierarchy_bundleType_completion___block_invoke;
    v25[3] = &unk_1E52629A0;
    id v27 = v14;
    id v26 = v16;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v25];
    uint64_t v19 = &v27;
    uint64_t v18 = v26;
  }
}

uint64_t __96__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValue_keyHierarchy_bundleType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __96__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValue_keyHierarchy_bundleType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)copyCarrierBundleValue:(id)a3 keyHierarchy:(id)a4 bundleType:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ([(CoreTelephonyClient *)self supportsSelector:a2 withContext:v11 error:a6])
  {
    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x3032000000;
    id v28 = __Block_byref_object_copy__7;
    id v29 = __Block_byref_object_dispose__7;
    id v30 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __91__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValue_keyHierarchy_bundleType_error___block_invoke;
    v24[3] = &unk_1E5260BA0;
    v24[4] = &v25;
    id v14 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v24];
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__7;
    id v22 = __Block_byref_object_dispose__7;
    id v23 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __91__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValue_keyHierarchy_bundleType_error___block_invoke_2;
    v17[3] = &unk_1E5260F78;
    void v17[4] = &v25;
    void v17[5] = &v18;
    [v14 copyCarrierBundleValue:v11 keyHierarchy:v12 bundleType:v13 completion:v17];
    if (a6) {
      *a6 = (id) v26[5];
    }
    id v15 = (id)v19[5];
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

void __91__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValue_keyHierarchy_bundleType_error___block_invoke(uint64_t a1, void *a2)
{
}

void __91__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValue_keyHierarchy_bundleType_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)copyCarrierBundleValues:(id)a3 keys:(id)a4 defaultValues:(id)a5 bundleType:(id)a6 withFallbackBundleCheck:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v33 = 0;
  BOOL v20 = [(CoreTelephonyClient *)self supportsSelector:a2 withContext:v15 error:&v33];
  id v21 = v33;
  if (v20)
  {
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __127__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValues_keys_defaultValues_bundleType_withFallbackBundleCheck_completion___block_invoke_2;
    id v28 = &unk_1E5260CB8;
    id v22 = v19;
    id v29 = v22;
    id v23 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v25];
    objc_msgSend(v23, "copyCarrierBundleValues:keys:defaultValues:bundleType:withFallbackBundleCheck:completion:", v15, v16, v17, v18, v9, v22, v25, v26, v27, v28);
    id v24 = &v29;
  }
  else
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __127__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValues_keys_defaultValues_bundleType_withFallbackBundleCheck_completion___block_invoke;
    v30[3] = &unk_1E52629A0;
    id v32 = v19;
    id v31 = v21;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v30];
    id v24 = &v32;
    id v23 = v31;
  }
}

uint64_t __127__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValues_keys_defaultValues_bundleType_withFallbackBundleCheck_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __127__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValues_keys_defaultValues_bundleType_withFallbackBundleCheck_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)copyCarrierBundleValues:(id)a3 keys:(id)a4 defaultValues:(id)a5 bundleType:(id)a6 withFallbackBundleCheck:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  if ([(CoreTelephonyClient *)self supportsSelector:a2 withContext:v15 error:a8])
  {
    uint64_t v30 = 0;
    id v31 = &v30;
    uint64_t v32 = 0x3032000000;
    id v33 = __Block_byref_object_copy__7;
    v34 = __Block_byref_object_dispose__7;
    id v35 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __122__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValues_keys_defaultValues_bundleType_withFallbackBundleCheck_error___block_invoke;
    v29[3] = &unk_1E5260BA0;
    v29[4] = &v30;
    id v19 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v29];
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = __Block_byref_object_copy__7;
    uint64_t v27 = __Block_byref_object_dispose__7;
    id v28 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __122__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValues_keys_defaultValues_bundleType_withFallbackBundleCheck_error___block_invoke_2;
    v22[3] = &unk_1E5260BF0;
    void v22[4] = &v30;
    void v22[5] = &v23;
    [v19 copyCarrierBundleValues:v15 keys:v16 defaultValues:v17 bundleType:v18 withFallbackBundleCheck:v9 completion:v22];
    if (a8) {
      *a8 = (id) v31[5];
    }
    id v20 = (id)v24[5];
    _Block_object_dispose(&v23, 8);

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

void __122__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValues_keys_defaultValues_bundleType_withFallbackBundleCheck_error___block_invoke(uint64_t a1, void *a2)
{
}

void __122__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValues_keys_defaultValues_bundleType_withFallbackBundleCheck_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)copyCarrierBundleValues:(id)a3 keyHierarchies:(id)a4 defaultValues:(id)a5 bundleType:(id)a6 withFallbackBundleCheck:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v33 = 0;
  BOOL v20 = [(CoreTelephonyClient *)self supportsSelector:a2 withContext:v15 error:&v33];
  id v21 = v33;
  if (v20)
  {
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __137__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValues_keyHierarchies_defaultValues_bundleType_withFallbackBundleCheck_completion___block_invoke_2;
    id v28 = &unk_1E5260CB8;
    id v22 = v19;
    id v29 = v22;
    uint64_t v23 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v25];
    objc_msgSend(v23, "copyCarrierBundleValues:keyHierarchies:defaultValues:bundleType:withFallbackBundleCheck:completion:", v15, v16, v17, v18, v9, v22, v25, v26, v27, v28);
    id v24 = &v29;
  }
  else
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __137__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValues_keyHierarchies_defaultValues_bundleType_withFallbackBundleCheck_completion___block_invoke;
    v30[3] = &unk_1E52629A0;
    id v32 = v19;
    id v31 = v21;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v30];
    id v24 = &v32;
    uint64_t v23 = v31;
  }
}

uint64_t __137__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValues_keyHierarchies_defaultValues_bundleType_withFallbackBundleCheck_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __137__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValues_keyHierarchies_defaultValues_bundleType_withFallbackBundleCheck_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)copyCarrierBundleValues:(id)a3 keyHierarchies:(id)a4 defaultValues:(id)a5 bundleType:(id)a6 withFallbackBundleCheck:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  if ([(CoreTelephonyClient *)self supportsSelector:a2 withContext:v15 error:a8])
  {
    uint64_t v30 = 0;
    id v31 = &v30;
    uint64_t v32 = 0x3032000000;
    id v33 = __Block_byref_object_copy__7;
    v34 = __Block_byref_object_dispose__7;
    id v35 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __132__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValues_keyHierarchies_defaultValues_bundleType_withFallbackBundleCheck_error___block_invoke;
    v29[3] = &unk_1E5260BA0;
    v29[4] = &v30;
    id v19 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v29];
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = __Block_byref_object_copy__7;
    uint64_t v27 = __Block_byref_object_dispose__7;
    id v28 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __132__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValues_keyHierarchies_defaultValues_bundleType_withFallbackBundleCheck_error___block_invoke_2;
    v22[3] = &unk_1E5260BF0;
    void v22[4] = &v30;
    void v22[5] = &v23;
    [v19 copyCarrierBundleValues:v15 keyHierarchies:v16 defaultValues:v17 bundleType:v18 withFallbackBundleCheck:v9 completion:v22];
    if (a8) {
      *a8 = (id) v31[5];
    }
    id v20 = (id)v24[5];
    _Block_object_dispose(&v23, 8);

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

void __132__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValues_keyHierarchies_defaultValues_bundleType_withFallbackBundleCheck_error___block_invoke(uint64_t a1, void *a2)
{
}

void __132__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValues_keyHierarchies_defaultValues_bundleType_withFallbackBundleCheck_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)copyCarrierBundleValueWithDefault:(id)a3 key:(id)a4 bundleType:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v28 = 0;
  BOOL v15 = [(CoreTelephonyClient *)self supportsSelector:a2 withContext:v11 error:&v28];
  id v16 = v28;
  if (v15)
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __98__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValueWithDefault_key_bundleType_completion___block_invoke_2;
    uint64_t v23 = &unk_1E5260CB8;
    id v17 = v14;
    id v24 = v17;
    id v18 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v20];
    objc_msgSend(v18, "copyCarrierBundleValueWithDefault:key:bundleType:completion:", v11, v12, v13, v17, v20, v21, v22, v23);
    id v19 = &v24;
  }
  else
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __98__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValueWithDefault_key_bundleType_completion___block_invoke;
    v25[3] = &unk_1E52629A0;
    id v27 = v14;
    id v26 = v16;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v25];
    id v19 = &v27;
    id v18 = v26;
  }
}

uint64_t __98__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValueWithDefault_key_bundleType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __98__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValueWithDefault_key_bundleType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)copyCarrierBundleValueWithDefault:(id)a3 key:(id)a4 bundleType:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ([(CoreTelephonyClient *)self supportsSelector:a2 withContext:v11 error:a6])
  {
    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x3032000000;
    id v28 = __Block_byref_object_copy__7;
    id v29 = __Block_byref_object_dispose__7;
    id v30 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __93__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValueWithDefault_key_bundleType_error___block_invoke;
    v24[3] = &unk_1E5260BA0;
    v24[4] = &v25;
    id v14 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v24];
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__7;
    id v22 = __Block_byref_object_dispose__7;
    id v23 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __93__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValueWithDefault_key_bundleType_error___block_invoke_2;
    v17[3] = &unk_1E5260F78;
    void v17[4] = &v25;
    void v17[5] = &v18;
    [v14 copyCarrierBundleValueWithDefault:v11 key:v12 bundleType:v13 completion:v17];
    if (a6) {
      *a6 = (id) v26[5];
    }
    id v15 = (id)v19[5];
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

void __93__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValueWithDefault_key_bundleType_error___block_invoke(uint64_t a1, void *a2)
{
}

void __93__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValueWithDefault_key_bundleType_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)copyCarrierBundleValueWithDefault:(id)a3 keyHierarchy:(id)a4 bundleType:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v28 = 0;
  BOOL v15 = [(CoreTelephonyClient *)self supportsSelector:a2 withContext:v11 error:&v28];
  id v16 = v28;
  if (v15)
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __107__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValueWithDefault_keyHierarchy_bundleType_completion___block_invoke_2;
    id v23 = &unk_1E5260CB8;
    id v17 = v14;
    id v24 = v17;
    uint64_t v18 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v20];
    objc_msgSend(v18, "copyCarrierBundleValueWithDefault:keyHierarchy:bundleType:completion:", v11, v12, v13, v17, v20, v21, v22, v23);
    id v19 = &v24;
  }
  else
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __107__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValueWithDefault_keyHierarchy_bundleType_completion___block_invoke;
    v25[3] = &unk_1E52629A0;
    id v27 = v14;
    id v26 = v16;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v25];
    id v19 = &v27;
    uint64_t v18 = v26;
  }
}

uint64_t __107__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValueWithDefault_keyHierarchy_bundleType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __107__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValueWithDefault_keyHierarchy_bundleType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)copyCarrierBundleValueWithDefault:(id)a3 keyHierarchy:(id)a4 bundleType:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ([(CoreTelephonyClient *)self supportsSelector:a2 withContext:v11 error:a6])
  {
    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x3032000000;
    id v28 = __Block_byref_object_copy__7;
    id v29 = __Block_byref_object_dispose__7;
    id v30 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __102__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValueWithDefault_keyHierarchy_bundleType_error___block_invoke;
    v24[3] = &unk_1E5260BA0;
    v24[4] = &v25;
    id v14 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v24];
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__7;
    id v22 = __Block_byref_object_dispose__7;
    id v23 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __102__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValueWithDefault_keyHierarchy_bundleType_error___block_invoke_2;
    v17[3] = &unk_1E5260F78;
    void v17[4] = &v25;
    void v17[5] = &v18;
    [v14 copyCarrierBundleValueWithDefault:v11 keyHierarchy:v12 bundleType:v13 completion:v17];
    if (a6) {
      *a6 = (id) v26[5];
    }
    id v15 = (id)v19[5];
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

void __102__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValueWithDefault_keyHierarchy_bundleType_error___block_invoke(uint64_t a1, void *a2)
{
}

void __102__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValueWithDefault_keyHierarchy_bundleType_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)copyCarrierBundleValueWithCountryBundleLookup:(id)a3 keyHierarchy:(id)a4 matchingInfo:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ([(CoreTelephonyClient *)self supportsSelector:a2 withContext:v11 error:a6])
  {
    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x3032000000;
    id v28 = __Block_byref_object_copy__7;
    id v29 = __Block_byref_object_dispose__7;
    id v30 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __116__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValueWithCountryBundleLookup_keyHierarchy_matchingInfo_error___block_invoke;
    v24[3] = &unk_1E5260BA0;
    v24[4] = &v25;
    id v14 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v24];
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__7;
    id v22 = __Block_byref_object_dispose__7;
    id v23 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __116__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValueWithCountryBundleLookup_keyHierarchy_matchingInfo_error___block_invoke_2;
    v17[3] = &unk_1E5260F78;
    void v17[4] = &v25;
    void v17[5] = &v18;
    [v14 copyCarrierBundleValueWithCountryBundleLookup:v11 keyHierarchy:v12 matchingInfo:v13 completion:v17];
    if (a6) {
      *a6 = (id) v26[5];
    }
    id v15 = (id)v19[5];
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

void __116__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValueWithCountryBundleLookup_keyHierarchy_matchingInfo_error___block_invoke(uint64_t a1, void *a2)
{
}

void __116__CoreTelephonyClient_CarrierBundle__copyCarrierBundleValueWithCountryBundleLookup_keyHierarchy_matchingInfo_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)context:(id)a3 getCarrierBundleValue:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [[CTBundle alloc] initWithBundleType:1];
  id v11 = [(CoreTelephonyClient *)self copyCarrierBundleValueWithDefault:v8 keyHierarchy:v9 bundleType:v10 error:a5];

  return v11;
}

- (void)context:(id)a3 getCarrierBundleValue:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [[CTBundle alloc] initWithBundleType:1];
  [(CoreTelephonyClient *)self copyCarrierBundleValueWithDefault:v11 keyHierarchy:v8 bundleType:v10 completion:v9];
}

- (void)copyCarrierBundleLocation:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v22 = 0;
  BOOL v9 = [(CoreTelephonyClient *)self supportsSelector:a2 withContext:v7 error:&v22];
  id v10 = v22;
  if (v9)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __75__CoreTelephonyClient_CarrierBundle__copyCarrierBundleLocation_completion___block_invoke_2;
    id v17 = &unk_1E5260CB8;
    id v11 = v8;
    id v18 = v11;
    id v12 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v14];
    objc_msgSend(v12, "copyCarrierBundleLocation:completion:", v7, v11, v14, v15, v16, v17);
    id v13 = &v18;
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __75__CoreTelephonyClient_CarrierBundle__copyCarrierBundleLocation_completion___block_invoke;
    v19[3] = &unk_1E52629A0;
    id v21 = v8;
    id v20 = v10;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v19];
    id v13 = &v21;
    id v12 = v20;
  }
}

uint64_t __75__CoreTelephonyClient_CarrierBundle__copyCarrierBundleLocation_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __75__CoreTelephonyClient_CarrierBundle__copyCarrierBundleLocation_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)copyCarrierBundleLocation:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([(CoreTelephonyClient *)self supportsSelector:a2 withContext:v7 error:a4])
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy__7;
    id v23 = __Block_byref_object_dispose__7;
    id v24 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __70__CoreTelephonyClient_CarrierBundle__copyCarrierBundleLocation_error___block_invoke;
    v18[3] = &unk_1E5260BA0;
    void v18[4] = &v19;
    id v8 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__7;
    id v16 = __Block_byref_object_dispose__7;
    id v17 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__CoreTelephonyClient_CarrierBundle__copyCarrierBundleLocation_error___block_invoke_2;
    v11[3] = &unk_1E5261AC0;
    void v11[4] = &v19;
    void v11[5] = &v12;
    [v8 copyCarrierBundleLocation:v7 completion:v11];
    if (a4) {
      *a4 = (id) v20[5];
    }
    id v9 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __70__CoreTelephonyClient_CarrierBundle__copyCarrierBundleLocation_error___block_invoke(uint64_t a1, void *a2)
{
}

void __70__CoreTelephonyClient_CarrierBundle__copyCarrierBundleLocation_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)copyCarrierBookmarks:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v22 = 0;
  BOOL v9 = [(CoreTelephonyClient *)self supportsSelector:a2 withContext:v7 error:&v22];
  id v10 = v22;
  if (v9)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __70__CoreTelephonyClient_CarrierBundle__copyCarrierBookmarks_completion___block_invoke_2;
    id v17 = &unk_1E5260CB8;
    id v11 = v8;
    id v18 = v11;
    uint64_t v12 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v14];
    objc_msgSend(v12, "copyCarrierBookmarks:completion:", v7, v11, v14, v15, v16, v17);
    id v13 = &v18;
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __70__CoreTelephonyClient_CarrierBundle__copyCarrierBookmarks_completion___block_invoke;
    v19[3] = &unk_1E52629A0;
    id v21 = v8;
    id v20 = v10;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v19];
    id v13 = &v21;
    uint64_t v12 = v20;
  }
}

uint64_t __70__CoreTelephonyClient_CarrierBundle__copyCarrierBookmarks_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __70__CoreTelephonyClient_CarrierBundle__copyCarrierBookmarks_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)copyCarrierBundleVersion:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v22 = 0;
  BOOL v9 = [(CoreTelephonyClient *)self supportsSelector:a2 withContext:v7 error:&v22];
  id v10 = v22;
  if (v9)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __74__CoreTelephonyClient_CarrierBundle__copyCarrierBundleVersion_completion___block_invoke_2;
    id v17 = &unk_1E5260CB8;
    id v11 = v8;
    id v18 = v11;
    uint64_t v12 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v14];
    objc_msgSend(v12, "copyCarrierBundleVersion:completion:", v7, v11, v14, v15, v16, v17);
    id v13 = &v18;
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __74__CoreTelephonyClient_CarrierBundle__copyCarrierBundleVersion_completion___block_invoke;
    v19[3] = &unk_1E52629A0;
    id v21 = v8;
    id v20 = v10;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v19];
    id v13 = &v21;
    uint64_t v12 = v20;
  }
}

uint64_t __74__CoreTelephonyClient_CarrierBundle__copyCarrierBundleVersion_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __74__CoreTelephonyClient_CarrierBundle__copyCarrierBundleVersion_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)copyCarrierBundleVersion:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([(CoreTelephonyClient *)self supportsSelector:a2 withContext:v7 error:a4])
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy__7;
    id v23 = __Block_byref_object_dispose__7;
    id v24 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__CoreTelephonyClient_CarrierBundle__copyCarrierBundleVersion_error___block_invoke;
    v18[3] = &unk_1E5260BA0;
    void v18[4] = &v19;
    id v8 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__7;
    id v16 = __Block_byref_object_dispose__7;
    id v17 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__CoreTelephonyClient_CarrierBundle__copyCarrierBundleVersion_error___block_invoke_2;
    v11[3] = &unk_1E5261AC0;
    void v11[4] = &v19;
    void v11[5] = &v12;
    [v8 copyCarrierBundleVersion:v7 completion:v11];
    if (a4) {
      *a4 = (id) v20[5];
    }
    id v9 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __69__CoreTelephonyClient_CarrierBundle__copyCarrierBundleVersion_error___block_invoke(uint64_t a1, void *a2)
{
}

void __69__CoreTelephonyClient_CarrierBundle__copyCarrierBundleVersion_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)isAttachApnSettingAllowed:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__CoreTelephonyClient_CarrierBundle__isAttachApnSettingAllowed_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 isAttachApnSettingAllowed:v6 completion:v8];
}

uint64_t __75__CoreTelephonyClient_CarrierBundle__isAttachApnSettingAllowed_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isAttachApnSettingAllowed:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__7;
  id v20 = __Block_byref_object_dispose__7;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __70__CoreTelephonyClient_CarrierBundle__isAttachApnSettingAllowed_error___block_invoke;
  v15[3] = &unk_1E5260BA0;
  void v15[4] = &v16;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v15];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__CoreTelephonyClient_CarrierBundle__isAttachApnSettingAllowed_error___block_invoke_2;
  v10[3] = &unk_1E5260D78;
  void v10[4] = &v16;
  void v10[5] = &v11;
  [v7 isAttachApnSettingAllowed:v6 completion:v10];
  if (a4) {
    *a4 = (id) v17[5];
  }
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __70__CoreTelephonyClient_CarrierBundle__isAttachApnSettingAllowed_error___block_invoke(uint64_t a1, void *a2)
{
}

void __70__CoreTelephonyClient_CarrierBundle__isAttachApnSettingAllowed_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (id)context:(id)a3 modifyAttachApnSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__7;
  id v17 = __Block_byref_object_dispose__7;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__CoreTelephonyClient_CarrierBundle__context_modifyAttachApnSettings___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  char v8 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__CoreTelephonyClient_CarrierBundle__context_modifyAttachApnSettings___block_invoke_2;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v13;
  [v8 context:v6 modifyAttachApnSettings:v7 completion:v11];
  id v9 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v9;
}

void __70__CoreTelephonyClient_CarrierBundle__context_modifyAttachApnSettings___block_invoke(uint64_t a1, void *a2)
{
}

void __70__CoreTelephonyClient_CarrierBundle__context_modifyAttachApnSettings___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)context:(id)a3 modifyAttachApnSettings:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__CoreTelephonyClient_CarrierBundle__context_modifyAttachApnSettings_completion___block_invoke;
  v13[3] = &unk_1E5260CB8;
  id v11 = v10;
  id v14 = v11;
  uint64_t v12 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  [v12 context:v8 modifyAttachApnSettings:v9 completion:v11];
}

uint64_t __81__CoreTelephonyClient_CarrierBundle__context_modifyAttachApnSettings_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)context:(id)a3 getAttachApnSettings:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__7;
  id v22 = __Block_byref_object_dispose__7;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__CoreTelephonyClient_CarrierBundle__context_getAttachApnSettings___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__7;
  uint64_t v15 = __Block_byref_object_dispose__7;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__CoreTelephonyClient_CarrierBundle__context_getAttachApnSettings___block_invoke_2;
  v10[3] = &unk_1E52629C8;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 context:v6 getAttachApnSettingsWithCompletion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __67__CoreTelephonyClient_CarrierBundle__context_getAttachApnSettings___block_invoke(uint64_t a1, void *a2)
{
}

void __67__CoreTelephonyClient_CarrierBundle__context_getAttachApnSettings___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)copyBundleVersion:(id)a3 bundleType:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v25 = 0;
  BOOL v12 = [(CoreTelephonyClient *)self supportsSelector:a2 withContext:v9 error:&v25];
  id v13 = v25;
  if (v12)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __78__CoreTelephonyClient_CarrierBundle__copyBundleVersion_bundleType_completion___block_invoke_2;
    uint64_t v20 = &unk_1E5260CB8;
    id v14 = v11;
    id v21 = v14;
    uint64_t v15 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v17];
    objc_msgSend(v15, "copyBundleVersion:bundleType:completion:", v9, v10, v14, v17, v18, v19, v20);
    id v16 = &v21;
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __78__CoreTelephonyClient_CarrierBundle__copyBundleVersion_bundleType_completion___block_invoke;
    v22[3] = &unk_1E52629A0;
    id v24 = v11;
    id v23 = v13;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v22];
    id v16 = &v24;
    uint64_t v15 = v23;
  }
}

uint64_t __78__CoreTelephonyClient_CarrierBundle__copyBundleVersion_bundleType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __78__CoreTelephonyClient_CarrierBundle__copyBundleVersion_bundleType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)copyBundleVersion:(id)a3 bundleType:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if ([(CoreTelephonyClient *)self supportsSelector:a2 withContext:v9 error:a5])
  {
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x3032000000;
    id v25 = __Block_byref_object_copy__7;
    id v26 = __Block_byref_object_dispose__7;
    id v27 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __73__CoreTelephonyClient_CarrierBundle__copyBundleVersion_bundleType_error___block_invoke;
    v21[3] = &unk_1E5260BA0;
    v21[4] = &v22;
    id v11 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v21];
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = __Block_byref_object_copy__7;
    uint64_t v19 = __Block_byref_object_dispose__7;
    id v20 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __73__CoreTelephonyClient_CarrierBundle__copyBundleVersion_bundleType_error___block_invoke_2;
    v14[3] = &unk_1E5261AC0;
    void v14[4] = &v22;
    void v14[5] = &v15;
    [v11 copyBundleVersion:v9 bundleType:v10 completion:v14];
    if (a5) {
      *a5 = (id) v23[5];
    }
    id v12 = (id)v16[5];
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __73__CoreTelephonyClient_CarrierBundle__copyBundleVersion_bundleType_error___block_invoke(uint64_t a1, void *a2)
{
}

void __73__CoreTelephonyClient_CarrierBundle__copyBundleVersion_bundleType_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)copyBundleIdentifier:(id)a3 bundleType:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v25 = 0;
  BOOL v12 = [(CoreTelephonyClient *)self supportsSelector:a2 withContext:v9 error:&v25];
  id v13 = v25;
  if (v12)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __81__CoreTelephonyClient_CarrierBundle__copyBundleIdentifier_bundleType_completion___block_invoke_2;
    id v20 = &unk_1E5260CB8;
    id v14 = v11;
    id v21 = v14;
    uint64_t v15 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v17];
    objc_msgSend(v15, "copyBundleIdentifier:bundleType:completion:", v9, v10, v14, v17, v18, v19, v20);
    id v16 = &v21;
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __81__CoreTelephonyClient_CarrierBundle__copyBundleIdentifier_bundleType_completion___block_invoke;
    v22[3] = &unk_1E52629A0;
    id v24 = v11;
    id v23 = v13;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v22];
    id v16 = &v24;
    uint64_t v15 = v23;
  }
}

uint64_t __81__CoreTelephonyClient_CarrierBundle__copyBundleIdentifier_bundleType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __81__CoreTelephonyClient_CarrierBundle__copyBundleIdentifier_bundleType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)copyBundleIdentifier:(id)a3 bundleType:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if ([(CoreTelephonyClient *)self supportsSelector:a2 withContext:v9 error:a5])
  {
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x3032000000;
    id v25 = __Block_byref_object_copy__7;
    id v26 = __Block_byref_object_dispose__7;
    id v27 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __76__CoreTelephonyClient_CarrierBundle__copyBundleIdentifier_bundleType_error___block_invoke;
    v21[3] = &unk_1E5260BA0;
    v21[4] = &v22;
    id v11 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v21];
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = __Block_byref_object_copy__7;
    uint64_t v19 = __Block_byref_object_dispose__7;
    id v20 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76__CoreTelephonyClient_CarrierBundle__copyBundleIdentifier_bundleType_error___block_invoke_2;
    v14[3] = &unk_1E5261AC0;
    void v14[4] = &v22;
    void v14[5] = &v15;
    [v11 copyBundleIdentifier:v9 bundleType:v10 completion:v14];
    if (a5) {
      *a5 = (id) v23[5];
    }
    id v12 = (id)v16[5];
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __76__CoreTelephonyClient_CarrierBundle__copyBundleIdentifier_bundleType_error___block_invoke(uint64_t a1, void *a2)
{
}

void __76__CoreTelephonyClient_CarrierBundle__copyBundleIdentifier_bundleType_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)restoreToSystemBundles:(id *)a3
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__7;
  uint64_t v17 = __Block_byref_object_dispose__7;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__CoreTelephonyClient_CarrierBundle__restoreToSystemBundles___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  BOOL v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__CoreTelephonyClient_CarrierBundle__restoreToSystemBundles___block_invoke_2;
  v7[3] = &unk_1E5260D78;
  void v7[4] = &v13;
  void v7[5] = &v8;
  [v4 restoreToSystemBundles:v7];
  if (a3) {
    *a3 = (id) v14[5];
  }
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v13, 8);
  return v5;
}

void __61__CoreTelephonyClient_CarrierBundle__restoreToSystemBundles___block_invoke(uint64_t a1, void *a2)
{
}

void __61__CoreTelephonyClient_CarrierBundle__restoreToSystemBundles___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (id)getCountryBundleLocationForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__7;
  uint64_t v22 = __Block_byref_object_dispose__7;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __88__CoreTelephonyClient_CarrierBundle__getCountryBundleLocationForBundleIdentifier_error___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__7;
  uint64_t v15 = __Block_byref_object_dispose__7;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__CoreTelephonyClient_CarrierBundle__getCountryBundleLocationForBundleIdentifier_error___block_invoke_2;
  v10[3] = &unk_1E5261AC0;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 getCountryBundleLocationForBundleIdentifier:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __88__CoreTelephonyClient_CarrierBundle__getCountryBundleLocationForBundleIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __88__CoreTelephonyClient_CarrierBundle__getCountryBundleLocationForBundleIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)getCountryBundleIdentifierForCountryCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__7;
  uint64_t v22 = __Block_byref_object_dispose__7;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85__CoreTelephonyClient_CarrierBundle__getCountryBundleIdentifierForCountryCode_error___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__7;
  uint64_t v15 = __Block_byref_object_dispose__7;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__CoreTelephonyClient_CarrierBundle__getCountryBundleIdentifierForCountryCode_error___block_invoke_2;
  v10[3] = &unk_1E5261AC0;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 getCountryBundleIdentifierForCountryCode:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __85__CoreTelephonyClient_CarrierBundle__getCountryBundleIdentifierForCountryCode_error___block_invoke(uint64_t a1, void *a2)
{
}

void __85__CoreTelephonyClient_CarrierBundle__getCountryBundleIdentifierForCountryCode_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)getEnglishCarrierNameFor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__7;
  uint64_t v22 = __Block_byref_object_dispose__7;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__CoreTelephonyClient_CarrierBundle__getEnglishCarrierNameFor_error___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__7;
  uint64_t v15 = __Block_byref_object_dispose__7;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__CoreTelephonyClient_CarrierBundle__getEnglishCarrierNameFor_error___block_invoke_2;
  v10[3] = &unk_1E5261AC0;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 getEnglishCarrierNameFor:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __69__CoreTelephonyClient_CarrierBundle__getEnglishCarrierNameFor_error___block_invoke(uint64_t a1, void *a2)
{
}

void __69__CoreTelephonyClient_CarrierBundle__getEnglishCarrierNameFor_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)copyBundleLocation:(id)a3 bundleType:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v25 = 0;
  BOOL v12 = [(CoreTelephonyClient *)self supportsSelector:a2 withContext:v9 error:&v25];
  id v13 = v25;
  if (v12)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __79__CoreTelephonyClient_CarrierBundle__copyBundleLocation_bundleType_completion___block_invoke_2;
    uint64_t v20 = &unk_1E5260CB8;
    id v14 = v11;
    id v21 = v14;
    uint64_t v15 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v17];
    objc_msgSend(v15, "copyBundleLocation:bundleType:completion:", v9, v10, v14, v17, v18, v19, v20);
    id v16 = &v21;
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __79__CoreTelephonyClient_CarrierBundle__copyBundleLocation_bundleType_completion___block_invoke;
    v22[3] = &unk_1E52629A0;
    id v24 = v11;
    id v23 = v13;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v22];
    id v16 = &v24;
    uint64_t v15 = v23;
  }
}

uint64_t __79__CoreTelephonyClient_CarrierBundle__copyBundleLocation_bundleType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __79__CoreTelephonyClient_CarrierBundle__copyBundleLocation_bundleType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)copyBundleLocation:(id)a3 bundleType:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if ([(CoreTelephonyClient *)self supportsSelector:a2 withContext:v9 error:a5])
  {
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x3032000000;
    id v25 = __Block_byref_object_copy__7;
    id v26 = __Block_byref_object_dispose__7;
    id v27 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __74__CoreTelephonyClient_CarrierBundle__copyBundleLocation_bundleType_error___block_invoke;
    v21[3] = &unk_1E5260BA0;
    v21[4] = &v22;
    id v11 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v21];
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = __Block_byref_object_copy__7;
    uint64_t v19 = __Block_byref_object_dispose__7;
    id v20 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__CoreTelephonyClient_CarrierBundle__copyBundleLocation_bundleType_error___block_invoke_2;
    v14[3] = &unk_1E5261AC0;
    void v14[4] = &v22;
    void v14[5] = &v15;
    [v11 copyBundleLocation:v9 bundleType:v10 completion:v14];
    if (a5) {
      *a5 = (id) v23[5];
    }
    id v12 = (id)v16[5];
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __74__CoreTelephonyClient_CarrierBundle__copyBundleLocation_bundleType_error___block_invoke(uint64_t a1, void *a2)
{
}

void __74__CoreTelephonyClient_CarrierBundle__copyBundleLocation_bundleType_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)checkForUpdatedBundlesWithAutoInstall:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__CoreTelephonyClient_CarrierBundle__checkForUpdatedBundlesWithAutoInstall_completion___block_invoke;
  v9[3] = &unk_1E5260CB8;
  id v7 = v6;
  id v10 = v7;
  id v8 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v9];
  [v8 checkForUpdatedBundlesWithAutoInstall:v4 completion:v7];
}

uint64_t __87__CoreTelephonyClient_CarrierBundle__checkForUpdatedBundlesWithAutoInstall_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getCountryBundleLocationForMatchingInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__7;
  uint64_t v22 = __Block_byref_object_dispose__7;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__CoreTelephonyClient_CarrierBundle__getCountryBundleLocationForMatchingInfo_error___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__7;
  uint64_t v15 = __Block_byref_object_dispose__7;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__CoreTelephonyClient_CarrierBundle__getCountryBundleLocationForMatchingInfo_error___block_invoke_2;
  v10[3] = &unk_1E5261AC0;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 getCountryBundleLocationForMatchingInfo:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __84__CoreTelephonyClient_CarrierBundle__getCountryBundleLocationForMatchingInfo_error___block_invoke(uint64_t a1, void *a2)
{
}

void __84__CoreTelephonyClient_CarrierBundle__getCountryBundleLocationForMatchingInfo_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (int64_t)checkCellularDiagnosticsStatus:(id *)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__8;
  id v14 = __Block_byref_object_dispose__8;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__CoreTelephonyClient_Radio__checkCellularDiagnosticsStatus___block_invoke;
  v9[3] = &unk_1E5260BA0;
  void v9[4] = &v10;
  BOOL v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__CoreTelephonyClient_Radio__checkCellularDiagnosticsStatus___block_invoke_2;
  v8[3] = &unk_1E5262A88;
  v8[4] = &v16;
  [v4 checkCellularDiagnosticsStatus:v8];
  if (a3)
  {
    id v5 = (void *)v11[5];
    if (v5) {
      *a3 = v5;
    }
  }
  int64_t v6 = v17[3];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
  return v6;
}

void __61__CoreTelephonyClient_Radio__checkCellularDiagnosticsStatus___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __61__CoreTelephonyClient_Radio__checkCellularDiagnosticsStatus___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)checkCellularDiagnosticsStatusDetails:(id *)a3
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x4012000000;
  id v21 = __Block_byref_object_copy__2;
  uint64_t v22 = __Block_byref_object_dispose__3;
  id v23 = &unk_184626B9F;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__8;
  uint64_t v16 = __Block_byref_object_dispose__8;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__CoreTelephonyClient_Radio__checkCellularDiagnosticsStatusDetails___block_invoke;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v12;
  BOOL v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__CoreTelephonyClient_Radio__checkCellularDiagnosticsStatusDetails___block_invoke_2;
  v10[3] = &unk_1E5262A88;
  void v10[4] = &v18;
  [v4 checkCellularDiagnosticsStatus:v10];
  if (a3)
  {
    id v5 = (void *)v13[5];
    if (v5) {
      *a3 = v5;
    }
  }
  int64_t v6 = v19[6];
  int64_t v7 = v19[7];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  int64_t v8 = v6;
  int64_t v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

void __68__CoreTelephonyClient_Radio__checkCellularDiagnosticsStatusDetails___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __68__CoreTelephonyClient_Radio__checkCellularDiagnosticsStatusDetails___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 48) = a2;
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 56) = a3;
  return result;
}

- (void)checkRadioBootHealth:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__CoreTelephonyClient_Radio__checkRadioBootHealth___block_invoke;
    v8[3] = &unk_1E5260CB8;
    id v6 = v4;
    id v9 = v6;
    int64_t v7 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v8];
    [v7 checkRadioBootHealth:v6];
  }
}

uint64_t __51__CoreTelephonyClient_Radio__checkRadioBootHealth___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getBasebandRadioFrequencyFrontEndScanData:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__8;
  uint64_t v19 = __Block_byref_object_dispose__8;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__CoreTelephonyClient_Radio__getBasebandRadioFrequencyFrontEndScanData___block_invoke;
  v14[3] = &unk_1E5260BA0;
  void v14[4] = &v15;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v14];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__8;
  uint64_t v12 = __Block_byref_object_dispose__8;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__CoreTelephonyClient_Radio__getBasebandRadioFrequencyFrontEndScanData___block_invoke_2;
  v7[3] = &unk_1E5262AB0;
  void v7[4] = &v15;
  void v7[5] = &v8;
  [v4 getBasebandRadioFrequencyFrontEndScanData:v7];
  *a3 = (id) v9[5];
  id v5 = (id)v16[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v15, 8);

  return v5;
}

void __72__CoreTelephonyClient_Radio__getBasebandRadioFrequencyFrontEndScanData___block_invoke(uint64_t a1, void *a2)
{
}

void __72__CoreTelephonyClient_Radio__getBasebandRadioFrequencyFrontEndScanData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  int64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)activateTurboMode:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CoreTelephonyClient_Radio__activateTurboMode___block_invoke;
  v7[3] = &unk_1E5260CB8;
  id v5 = v4;
  id v8 = v5;
  uint64_t v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  [v6 activateTurboMode:v5];
}

uint64_t __48__CoreTelephonyClient_Radio__activateTurboMode___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setVoLTEAudioCodec:(id)a3 codecInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__CoreTelephonyClient_FaceTime__setVoLTEAudioCodec_codecInfo_completion___block_invoke;
  v13[3] = &unk_1E5260CB8;
  id v11 = v10;
  id v14 = v11;
  uint64_t v12 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  [v12 setVoLTEAudioCodec:v8 codecInfo:v9 completion:v11];
}

uint64_t __73__CoreTelephonyClient_FaceTime__setVoLTEAudioCodec_codecInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getSIMToolkitMenu:(id)a3 menu:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__9;
  uint64_t v22 = __Block_byref_object_dispose__9;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__CoreTelephonyClient_SIMToolkit__getSIMToolkitMenu_menu___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  int64_t v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__9;
  uint64_t v15 = __Block_byref_object_dispose__9;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__CoreTelephonyClient_SIMToolkit__getSIMToolkitMenu_menu___block_invoke_2;
  v10[3] = &unk_1E5263070;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 getSIMToolkitMenuForContext:v6 completion:v10];
  *a4 = (id) v12[5];
  id v8 = (id)v19[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __58__CoreTelephonyClient_SIMToolkit__getSIMToolkitMenu_menu___block_invoke(uint64_t a1, void *a2)
{
}

void __58__CoreTelephonyClient_SIMToolkit__getSIMToolkitMenu_menu___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  int64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)selectSIMToolkitMenuItem:(id)a3 index:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__9;
  uint64_t v17 = __Block_byref_object_dispose__9;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__CoreTelephonyClient_SIMToolkit__selectSIMToolkitMenuItem_index___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  id v8 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__CoreTelephonyClient_SIMToolkit__selectSIMToolkitMenuItem_index___block_invoke_2;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v13;
  [v8 selectSIMToolkitMenuItemForContext:v6 index:v7 completion:v11];
  id v9 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v9;
}

void __66__CoreTelephonyClient_SIMToolkit__selectSIMToolkitMenuItem_index___block_invoke(uint64_t a1, void *a2)
{
}

void __66__CoreTelephonyClient_SIMToolkit__selectSIMToolkitMenuItem_index___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)getSIMToolkitListItems:(id)a3 items:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__9;
  uint64_t v22 = __Block_byref_object_dispose__9;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__CoreTelephonyClient_SIMToolkit__getSIMToolkitListItems_items___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__9;
  uint64_t v15 = __Block_byref_object_dispose__9;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__CoreTelephonyClient_SIMToolkit__getSIMToolkitListItems_items___block_invoke_2;
  v10[3] = &unk_1E5263098;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 getSIMToolkitListItemsForContext:v6 completion:v10];
  *a4 = (id) v12[5];
  id v8 = (id)v19[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __64__CoreTelephonyClient_SIMToolkit__getSIMToolkitListItems_items___block_invoke(uint64_t a1, void *a2)
{
}

void __64__CoreTelephonyClient_SIMToolkit__getSIMToolkitListItems_items___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)selectSIMToolkitListItem:(id)a3 session:(id)a4 response:(id)a5 index:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__9;
  id v23 = __Block_byref_object_dispose__9;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__CoreTelephonyClient_SIMToolkit__selectSIMToolkitListItem_session_response_index___block_invoke;
  v18[3] = &unk_1E5260BA0;
  void v18[4] = &v19;
  id v14 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83__CoreTelephonyClient_SIMToolkit__selectSIMToolkitListItem_session_response_index___block_invoke_2;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v19;
  [v14 selectSIMToolkitListItemForContext:v10 session:v11 response:v12 index:v13 completion:v17];
  id v15 = (id)v20[5];

  _Block_object_dispose(&v19, 8);

  return v15;
}

void __83__CoreTelephonyClient_SIMToolkit__selectSIMToolkitListItem_session_response_index___block_invoke(uint64_t a1, void *a2)
{
}

void __83__CoreTelephonyClient_SIMToolkit__selectSIMToolkitListItem_session_response_index___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)sendSIMToolkitResponse:(id)a3 session:(id)a4 response:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__9;
  uint64_t v20 = __Block_byref_object_dispose__9;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __75__CoreTelephonyClient_SIMToolkit__sendSIMToolkitResponse_session_response___block_invoke;
  v15[3] = &unk_1E5260BA0;
  void v15[4] = &v16;
  id v11 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__CoreTelephonyClient_SIMToolkit__sendSIMToolkitResponse_session_response___block_invoke_2;
  v14[3] = &unk_1E5260BA0;
  void v14[4] = &v16;
  [v11 sendSIMToolkitResponseForContext:v8 session:v9 response:v10 completion:v14];
  id v12 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v12;
}

void __75__CoreTelephonyClient_SIMToolkit__sendSIMToolkitResponse_session_response___block_invoke(uint64_t a1, void *a2)
{
}

void __75__CoreTelephonyClient_SIMToolkit__sendSIMToolkitResponse_session_response___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)sendSIMToolkitStringResponse:(id)a3 session:(id)a4 response:(id)a5 string:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__9;
  id v23 = __Block_byref_object_dispose__9;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__CoreTelephonyClient_SIMToolkit__sendSIMToolkitStringResponse_session_response_string___block_invoke;
  v18[3] = &unk_1E5260BA0;
  void v18[4] = &v19;
  id v14 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __88__CoreTelephonyClient_SIMToolkit__sendSIMToolkitStringResponse_session_response_string___block_invoke_2;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v19;
  [v14 sendSIMToolkitStringResponseForContext:v10 session:v11 response:v12 string:v13 completion:v17];
  id v15 = (id)v20[5];

  _Block_object_dispose(&v19, 8);

  return v15;
}

void __88__CoreTelephonyClient_SIMToolkit__sendSIMToolkitStringResponse_session_response_string___block_invoke(uint64_t a1, void *a2)
{
}

void __88__CoreTelephonyClient_SIMToolkit__sendSIMToolkitStringResponse_session_response_string___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)sendSIMToolkitBooleanResponse:(id)a3 session:(id)a4 response:(id)a5 yesNo:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__9;
  uint64_t v22 = __Block_byref_object_dispose__9;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __88__CoreTelephonyClient_SIMToolkit__sendSIMToolkitBooleanResponse_session_response_yesNo___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v13 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__CoreTelephonyClient_SIMToolkit__sendSIMToolkitBooleanResponse_session_response_yesNo___block_invoke_2;
  v16[3] = &unk_1E5260BA0;
  void v16[4] = &v18;
  [v13 sendSIMToolkitBooleanResponseForContext:v10 session:v11 response:v12 yesNo:v6 completion:v16];
  id v14 = (id)v19[5];

  _Block_object_dispose(&v18, 8);

  return v14;
}

void __88__CoreTelephonyClient_SIMToolkit__sendSIMToolkitBooleanResponse_session_response_yesNo___block_invoke(uint64_t a1, void *a2)
{
}

void __88__CoreTelephonyClient_SIMToolkit__sendSIMToolkitBooleanResponse_session_response_yesNo___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)sendSIMToolkitUserActivity:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__9;
  id v14 = __Block_byref_object_dispose__9;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__CoreTelephonyClient_SIMToolkit__sendSIMToolkitUserActivity___block_invoke;
  v9[3] = &unk_1E5260BA0;
  void v9[4] = &v10;
  id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__CoreTelephonyClient_SIMToolkit__sendSIMToolkitUserActivity___block_invoke_2;
  v8[3] = &unk_1E5260BA0;
  void v8[4] = &v10;
  [v5 sendSIMToolkitUserActivityForContext:v4 completion:v8];
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v6;
}

void __62__CoreTelephonyClient_SIMToolkit__sendSIMToolkitUserActivity___block_invoke(uint64_t a1, void *a2)
{
}

void __62__CoreTelephonyClient_SIMToolkit__sendSIMToolkitUserActivity___block_invoke_2(uint64_t a1, void *a2)
{
}

void __62__CoreTelephonyClient_SIMToolkit__sendSIMToolkitDisplayReady___block_invoke(uint64_t a1, void *a2)
{
}

- (id)getSIMToolkitUSSDString:(id)a3 ussdString:(id *)a4 needRsp:(BOOL *)a5
{
  id v8 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__9;
  id v28 = __Block_byref_object_dispose__9;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __78__CoreTelephonyClient_SIMToolkit__getSIMToolkitUSSDString_ussdString_needRsp___block_invoke;
  v23[3] = &unk_1E5260BA0;
  void v23[4] = &v24;
  id v9 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v23];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__9;
  uint64_t v21 = __Block_byref_object_dispose__9;
  id v22 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__CoreTelephonyClient_SIMToolkit__getSIMToolkitUSSDString_ussdString_needRsp___block_invoke_2;
  v12[3] = &unk_1E52630C0;
  void v12[4] = &v24;
  void v12[5] = &v17;
  void v12[6] = &v13;
  [v9 getSIMToolkitUSSDStringForContext:v8 completion:v12];
  *a4 = (id) v18[5];
  *a5 = *((unsigned char *)v14 + 24);
  id v10 = (id)v25[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v24, 8);

  return v10;
}

void __78__CoreTelephonyClient_SIMToolkit__getSIMToolkitUSSDString_ussdString_needRsp___block_invoke(uint64_t a1, void *a2)
{
}

void __78__CoreTelephonyClient_SIMToolkit__getSIMToolkitUSSDString_ussdString_needRsp___block_invoke_2(void *a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a4);
  id v11 = a4;
  uint64_t v8 = *(void *)(a1[5] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
  id v10 = v7;

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
}

- (id)sendSIMToolkitUSSDResponse:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  char v16 = __Block_byref_object_copy__9;
  uint64_t v17 = __Block_byref_object_dispose__9;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__CoreTelephonyClient_SIMToolkit__sendSIMToolkitUSSDResponse_response___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  uint64_t v8 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__CoreTelephonyClient_SIMToolkit__sendSIMToolkitUSSDResponse_response___block_invoke_2;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v13;
  [v8 sendSIMToolkitUSSDResponseForContext:v6 response:v7 completion:v11];
  id v9 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v9;
}

void __71__CoreTelephonyClient_SIMToolkit__sendSIMToolkitUSSDResponse_response___block_invoke(uint64_t a1, void *a2)
{
}

void __71__CoreTelephonyClient_SIMToolkit__sendSIMToolkitUSSDResponse_response___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)cancelSIMToolkitUSSDSession:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__9;
  id v14 = __Block_byref_object_dispose__9;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__CoreTelephonyClient_SIMToolkit__cancelSIMToolkitUSSDSession___block_invoke;
  v9[3] = &unk_1E5260BA0;
  void v9[4] = &v10;
  id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__CoreTelephonyClient_SIMToolkit__cancelSIMToolkitUSSDSession___block_invoke_2;
  v8[3] = &unk_1E5260BA0;
  void v8[4] = &v10;
  [v5 cancelSIMToolkitUSSDSessionForContext:v4 completion:v8];
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v6;
}

void __63__CoreTelephonyClient_SIMToolkit__cancelSIMToolkitUSSDSession___block_invoke(uint64_t a1, void *a2)
{
}

void __63__CoreTelephonyClient_SIMToolkit__cancelSIMToolkitUSSDSession___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)getSIMTrayStatus:(id)a3
{
  id v5 = a3;
  id v4 = objc_alloc_init(CTXPCSimTrayStatusRequest);
  [(CoreTelephonyClient *)self asynchronousRequest:v4 completionWithString:v5];
}

- (id)getSIMTrayStatusOrError:(id *)a3
{
  id v5 = objc_alloc_init(CTXPCSimTrayStatusRequest);
  id v6 = [(CoreTelephonyClient *)self synchronousRequestWithStringResult:v5 error:a3];

  return v6;
}

- (id)isEmbeddedSIMOnlyConfig:(id *)a3
{
  id v5 = objc_alloc_init(CTXPCEmbeddedSIMOnlyConfigRequest);
  id v6 = [(CoreTelephonyClient *)self synchronousRequestWithNumberResult:v5 error:a3];

  return v6;
}

- (void)copyMobileEquipmentInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(CTXPCMobileEquipmentInfoRequest);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__CoreTelephonyClient_Subscriber__copyMobileEquipmentInfo___block_invoke;
    v10[3] = &unk_1E5260CB8;
    id v6 = v4;
    id v11 = v6;
    id v7 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__CoreTelephonyClient_Subscriber__copyMobileEquipmentInfo___block_invoke_2;
    v8[3] = &unk_1E5263180;
    id v9 = v6;
    [v7 sendRequest:v5 completionHandler:v8];
  }
}

uint64_t __59__CoreTelephonyClient_Subscriber__copyMobileEquipmentInfo___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__CoreTelephonyClient_Subscriber__copyMobileEquipmentInfo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    uint64_t v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    uint64_t v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 infoList];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (id)getMobileEquipmentInfo:(id *)a3
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__10;
  uint64_t v21 = __Block_byref_object_dispose__10;
  id v22 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__10;
  id v15 = __Block_byref_object_dispose__10;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__CoreTelephonyClient_Subscriber__getMobileEquipmentInfo___block_invoke;
  v10[3] = &unk_1E5260BA0;
  void v10[4] = &v11;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v10];
  id v5 = objc_alloc_init(CTXPCMobileEquipmentInfoRequest);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__CoreTelephonyClient_Subscriber__getMobileEquipmentInfo___block_invoke_2;
  v9[3] = &unk_1E5261A78;
  void v9[4] = &v17;
  void v9[5] = &v11;
  [v4 sendRequest:v5 completionHandler:v9];
  if (a3)
  {
    id v6 = (void *)v12[5];
    if (v6) {
      *a3 = v6;
    }
  }
  id v7 = (id)v18[5];

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __58__CoreTelephonyClient_Subscriber__getMobileEquipmentInfo___block_invoke(uint64_t a1, void *a2)
{
}

void __58__CoreTelephonyClient_Subscriber__getMobileEquipmentInfo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v15 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v15;
    uint64_t v8 = v15;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    uint64_t v8 = v15;
  }

  uint64_t v10 = [v9 infoList];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

- (id)getMobileEquipmentInfoFor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__10;
  id v28 = __Block_byref_object_dispose__10;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__10;
  id v22 = __Block_byref_object_dispose__10;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__CoreTelephonyClient_Subscriber__getMobileEquipmentInfoFor_error___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v8 = objc_alloc_init(CTXPCMobileEquipmentInfoRequest);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__CoreTelephonyClient_Subscriber__getMobileEquipmentInfoFor_error___block_invoke_2;
  v13[3] = &unk_1E52631A8;
  id v15 = &v18;
  id v9 = v6;
  id v14 = v9;
  id v16 = &v24;
  [v7 sendRequest:v8 completionHandler:v13];
  if (a4)
  {
    uint64_t v10 = (void *)v19[5];
    if (v10) {
      *a4 = v10;
    }
  }
  id v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __67__CoreTelephonyClient_Subscriber__getMobileEquipmentInfoFor_error___block_invoke(uint64_t a1, void *a2)
{
}

void __67__CoreTelephonyClient_Subscriber__getMobileEquipmentInfoFor_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v19 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v19;
    uint64_t v8 = v19;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    uint64_t v8 = v19;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  uint64_t v10 = [v9 infoList];
  id v11 = v10;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v10 == 0;
  }
  if (!v12)
  {
    uint64_t v13 = [v10 meInfoList];
    uint64_t v14 = [*(id *)(a1 + 32) slotID];
    for (unint64_t i = 0; i < [v13 count]; ++i)
    {
      id v16 = [v13 objectAtIndex:i];
      if (v14 == [v16 slotId])
      {
        uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v18 = *(void **)(v17 + 40);
        *(void *)(v17 + 40) = v16;

        break;
      }
    }
  }
}

- (id)getTypeAllocationCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCTACRequest alloc] initWithDescriptor:v6];
  uint64_t v8 = [(CoreTelephonyClient *)self synchronousRequestWithStringResult:v7 error:a4];

  return v8;
}

- (void)copyFirmwareUpdateInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(CTXPCFirmwareUpdateInfoRequest);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__CoreTelephonyClient_Subscriber__copyFirmwareUpdateInfo___block_invoke;
    v10[3] = &unk_1E5260CB8;
    id v6 = v4;
    id v11 = v6;
    id v7 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__CoreTelephonyClient_Subscriber__copyFirmwareUpdateInfo___block_invoke_2;
    v8[3] = &unk_1E5263180;
    id v9 = v6;
    [v7 sendRequest:v5 completionHandler:v8];
  }
}

uint64_t __58__CoreTelephonyClient_Subscriber__copyFirmwareUpdateInfo___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__CoreTelephonyClient_Subscriber__copyFirmwareUpdateInfo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    uint64_t v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    uint64_t v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 firmwareInfo];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (void)copySIMIdentity:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCSimIdentityRequest alloc] initWithContext:v8];
  [(CoreTelephonyClient *)self asynchronousRequest:v7 completionWithString:v6];
}

- (id)copySIMIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCSimIdentityRequest alloc] initWithContext:v6];
  id v8 = [(CoreTelephonyClient *)self synchronousRequestWithStringResult:v7 error:a4];

  return v8;
}

- (void)copyMobileSubscriberIdentity:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCMobileSubscriberIdentityRequest alloc] initWithContext:v8];
  [(CoreTelephonyClient *)self asynchronousRequest:v7 completionWithString:v6];
}

- (id)copyMobileSubscriberIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCMobileSubscriberIdentityRequest alloc] initWithContext:v6];
  id v8 = [(CoreTelephonyClient *)self synchronousRequestWithStringResult:v7 error:a4];

  return v8;
}

- (BOOL)context:(id)a3 isProtectedIdentitySupported:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v11 = CTLogClientXPC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      -[CoreTelephonyClient(Subscriber) context:isProtectedIdentitySupported:error:]();
      if (a5) {
        goto LABEL_5;
      }
    }
    else if (a5)
    {
LABEL_5:
      id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
      BOOL v10 = 0;
      *a5 = (id)[v12 initWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      goto LABEL_8;
    }
    BOOL v10 = 0;
    goto LABEL_8;
  }
  BOOL v10 = [(CoreTelephonyClient *)self context:v8 supportedIdentityProtectionFor:v9 error:a5] != 0;
LABEL_8:

  return v10;
}

- (void)context:(id)a3 isProtectedIdentitySupported:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void, void, void))v10;
  if (v9)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __83__CoreTelephonyClient_Subscriber__context_isProtectedIdentitySupported_completion___block_invoke;
    v15[3] = &unk_1E52631D0;
    id v16 = v10;
    [(CoreTelephonyClient *)self context:v8 supportedIdentityProtectionFor:v9 completion:v15];
    id v12 = v16;
  }
  else
  {
    uint64_t v13 = CTLogClientXPC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[CoreTelephonyClient(Subscriber) context:isProtectedIdentitySupported:error:]();
    }
    id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v12 = (void *)[v14 initWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    ((void (**)(void, void, void *))v11)[2](v11, 0, v12);
  }
}

uint64_t __83__CoreTelephonyClient_Subscriber__context_isProtectedIdentitySupported_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0);
}

- (void)context:(id)a3 supportedIdentityProtectionFor:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = [[CTXPCSubscriberSupportsEncryptedIdentityRequest alloc] initWithContext:v8 service:v9];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __85__CoreTelephonyClient_Subscriber__context_supportedIdentityProtectionFor_completion___block_invoke;
    v18[3] = &unk_1E5260CB8;
    id v12 = v10;
    id v19 = v12;
    uint64_t v13 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __85__CoreTelephonyClient_Subscriber__context_supportedIdentityProtectionFor_completion___block_invoke_2;
    v16[3] = &unk_1E5263180;
    id v17 = v12;
    [v13 sendRequest:v11 completionHandler:v16];
  }
  else
  {
    id v14 = CTLogClientXPC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[CoreTelephonyClient(Subscriber) context:isProtectedIdentitySupported:error:]();
    }
    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v11 = (CTXPCSubscriberSupportsEncryptedIdentityRequest *)[v15 initWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(id, void, CTXPCSubscriberSupportsEncryptedIdentityRequest *))v10 + 2))(v10, 0, v11);
  }
}

uint64_t __85__CoreTelephonyClient_Subscriber__context_supportedIdentityProtectionFor_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85__CoreTelephonyClient_Subscriber__context_supportedIdentityProtectionFor_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v11 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v11;
    id v8 = v11;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v11;
  }

  id v10 = [v9 result];
  [v10 integerValue];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)context:(id)a3 supportedIdentityProtectionFor:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  if (!v9)
  {
    id v14 = CTLogClientXPC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      -[CoreTelephonyClient(Subscriber) context:isProtectedIdentitySupported:error:]();
      if (!a5) {
        goto LABEL_9;
      }
    }
    else if (!a5)
    {
LABEL_9:
      int64_t v13 = v26[3];
      goto LABEL_10;
    }
    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    *a5 = (id)[v15 initWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    goto LABEL_9;
  }
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__10;
  id v23 = __Block_byref_object_dispose__10;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__CoreTelephonyClient_Subscriber__context_supportedIdentityProtectionFor_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  void v18[4] = &v19;
  id v10 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  id v11 = [[CTXPCSubscriberSupportsEncryptedIdentityRequest alloc] initWithContext:v8 service:v9];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__CoreTelephonyClient_Subscriber__context_supportedIdentityProtectionFor_error___block_invoke_2;
  v17[3] = &unk_1E5261A78;
  void v17[4] = &v25;
  void v17[5] = &v19;
  [v10 sendRequest:v11 completionHandler:v17];
  if (a5)
  {
    id v12 = (void *)v20[5];
    if (v12) {
      *a5 = v12;
    }
  }
  int64_t v13 = v26[3];

  _Block_object_dispose(&v19, 8);
LABEL_10:
  _Block_object_dispose(&v25, 8);

  return v13;
}

void __80__CoreTelephonyClient_Subscriber__context_supportedIdentityProtectionFor_error___block_invoke(uint64_t a1, void *a2)
{
}

void __80__CoreTelephonyClient_Subscriber__context_supportedIdentityProtectionFor_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  id v10 = [v9 result];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v10 integerValue];

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

- (void)createEncryptedIdentity:(id)a3 identity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(void, void, void))v10;
  if (v9)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __79__CoreTelephonyClient_Subscriber__createEncryptedIdentity_identity_completion___block_invoke;
    v20[3] = &unk_1E5260CB8;
    id v12 = v10;
    id v21 = v12;
    id v13 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v20];
    id v14 = [[CTXPCCreateEncryptedIdentityRequest alloc] initWithContext:v8 identity:v9];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __79__CoreTelephonyClient_Subscriber__createEncryptedIdentity_identity_completion___block_invoke_2;
    v18[3] = &unk_1E5263180;
    id v19 = v12;
    [v13 sendRequest:v14 completionHandler:v18];

    id v15 = v21;
  }
  else
  {
    id v16 = CTLogClientXPC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[CoreTelephonyClient(Subscriber) createEncryptedIdentity:identity:completion:]();
    }
    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v15 = (void *)[v17 initWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    ((void (**)(void, void, void *))v11)[2](v11, 0, v15);
  }
}

uint64_t __79__CoreTelephonyClient_Subscriber__createEncryptedIdentity_identity_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__CoreTelephonyClient_Subscriber__createEncryptedIdentity_identity_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = [v9 identities];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (void)context:(id)a3 getPseudoIdentityFor:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, void *))a5;
  if (v9)
  {
    uint64_t v11 = [[CTXPCSubscriberGetPseudoIdentityRequest alloc] initWithContext:v8 service:v9];
    [(CoreTelephonyClient *)self asynchronousRequest:v11 completionWithString:v10];
  }
  else
  {
    id v12 = CTLogClientXPC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[CoreTelephonyClient(Subscriber) context:isProtectedIdentitySupported:error:]();
    }
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v14 = (void *)[v13 initWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    v10[2](v10, 0, v14);
  }
}

- (id)context:(id)a3 getPseudoIdentityFor:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = [[CTXPCSubscriberGetPseudoIdentityRequest alloc] initWithContext:v8 service:v9];
    uint64_t v11 = [(CoreTelephonyClient *)self synchronousRequestWithStringResult:v10 error:a5];

    goto LABEL_8;
  }
  id v12 = CTLogClientXPC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    -[CoreTelephonyClient(Subscriber) context:isProtectedIdentitySupported:error:]();
    if (a5) {
      goto LABEL_5;
    }
  }
  else if (a5)
  {
LABEL_5:
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v11 = 0;
    *a5 = (id)[v13 initWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    goto LABEL_8;
  }
  uint64_t v11 = 0;
LABEL_8:

  return v11;
}

- (id)context:(id)a3 getEncryptedIdentity:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__10;
  id v29 = __Block_byref_object_dispose__10;
  id v30 = 0;
  if (!v9)
  {
    id v14 = CTLogClientXPC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      -[CoreTelephonyClient(Subscriber) createEncryptedIdentity:identity:completion:]();
      if (!a5) {
        goto LABEL_9;
      }
    }
    else if (!a5)
    {
LABEL_9:
      id v13 = (id)v26[5];
      goto LABEL_10;
    }
    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    *a5 = (id)[v15 initWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    goto LABEL_9;
  }
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__10;
  id v23 = __Block_byref_object_dispose__10;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __70__CoreTelephonyClient_Subscriber__context_getEncryptedIdentity_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  void v18[4] = &v19;
  uint64_t v10 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v11 = [[CTXPCCreateEncryptedIdentityRequest alloc] initWithContext:v8 identity:v9];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__CoreTelephonyClient_Subscriber__context_getEncryptedIdentity_error___block_invoke_2;
  v17[3] = &unk_1E5261A78;
  void v17[4] = &v25;
  void v17[5] = &v19;
  [v10 sendRequest:v11 completionHandler:v17];
  if (a5)
  {
    id v12 = (void *)v20[5];
    if (v12) {
      *a5 = v12;
    }
  }
  id v13 = (id)v26[5];

  _Block_object_dispose(&v19, 8);
LABEL_10:
  _Block_object_dispose(&v25, 8);

  return v13;
}

void __70__CoreTelephonyClient_Subscriber__context_getEncryptedIdentity_error___block_invoke(uint64_t a1, void *a2)
{
}

void __70__CoreTelephonyClient_Subscriber__context_getEncryptedIdentity_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v15 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v15;
    id v8 = v15;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v15;
  }

  uint64_t v10 = [v9 identities];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

- (void)evaluateMobileSubscriberIdentity:(id)a3 identity:(id)a4 completion:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [CTXPCSubscriberEvaluateIdentityDataRequest alloc];
    id v11 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    uint64_t v15 = [(CTXPCSubscriberEvaluateIdentityDataRequest *)v10 initWithContext:v18 identityData:v12];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_13;
    }
    uint64_t v13 = [CTXPCSubscriberEvaluateIdentityStringRequest alloc];
    id v14 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v14;
    }
    else {
      id v12 = 0;
    }

    uint64_t v15 = [(CTXPCSubscriberEvaluateIdentityStringRequest *)v13 initWithContext:v18 identityString:v12];
  }
  id v16 = (void *)v15;

  if (v16)
  {
    [(CoreTelephonyClient *)self asynchronousRequest:v16 completion:v9];
    goto LABEL_14;
  }
LABEL_13:
  id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
  v9[2](v9, v17);

  id v16 = 0;
LABEL_14:
}

- (id)context:(id)a3 evaluateMobileSubscriberIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [CTXPCSubscriberEvaluateIdentityDataRequest alloc];
    id v9 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    uint64_t v13 = [(CTXPCSubscriberEvaluateIdentityDataRequest *)v8 initWithContext:v6 identityData:v10];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_13;
    }
    id v11 = [CTXPCSubscriberEvaluateIdentityStringRequest alloc];
    id v12 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v12;
    }
    else {
      id v10 = 0;
    }

    uint64_t v13 = [(CTXPCSubscriberEvaluateIdentityStringRequest *)v11 initWithContext:v6 identityString:v10];
  }
  id v14 = (void *)v13;

  if (v14)
  {
    id v17 = 0;
    [(CoreTelephonyClient *)self synchronousRequest:v14 error:&v17];
    id v15 = v17;

    goto LABEL_14;
  }
LABEL_13:
  id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
LABEL_14:

  return v15;
}

- (void)copyMobileSubscriberCountryCode:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCMobileSubscriberCountryCodeRequest alloc] initWithContext:v8];
  [(CoreTelephonyClient *)self asynchronousRequest:v7 completionWithString:v6];
}

- (id)copyMobileSubscriberCountryCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCMobileSubscriberCountryCodeRequest alloc] initWithContext:v6];
  id v8 = [(CoreTelephonyClient *)self synchronousRequestWithStringResult:v7 error:a4];

  return v8;
}

- (id)copyMobileSubscriberIsoCountryCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    id v9 = CTLogClientXPC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      -[CoreTelephonyClient(Subscriber) copyMobileSubscriberIsoCountryCode:error:]();
      if (a4) {
        goto LABEL_5;
      }
    }
    else if (a4)
    {
LABEL_5:
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      id v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    id v8 = 0;
    goto LABEL_8;
  }
  id v7 = [[CTXPCConvertCountryCodeToISORequest alloc] initWithMcc:v6];
  id v8 = [(CoreTelephonyClient *)self synchronousRequestWithStringResult:v7 error:a4];

LABEL_8:
  return v8;
}

- (id)copyMobileSubscriberIsoSubregionCode:(id)a3 MNC:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8 || !v9)
  {
    uint64_t v13 = CTLogClientXPC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      -[CoreTelephonyClient(Subscriber) copyMobileSubscriberIsoSubregionCode:MNC:error:]();
      if (a5) {
        goto LABEL_6;
      }
    }
    else if (a5)
    {
LABEL_6:
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      id v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    id v12 = 0;
    goto LABEL_9;
  }
  id v11 = [[CTXPCMobileSubscriberISOSubregionCodeRequest alloc] initWithMcc:v8 mnc:v9];
  id v12 = [(CoreTelephonyClient *)self synchronousRequestWithArrayResult:v11 error:a5];

LABEL_9:
  return v12;
}

- (id)getSimHardwareInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__10;
  id v24 = __Block_byref_object_dispose__10;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__10;
  id v18 = __Block_byref_object_dispose__10;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__CoreTelephonyClient_Subscriber__getSimHardwareInfo_error___block_invoke;
  v13[3] = &unk_1E5260BA0;
  void v13[4] = &v14;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v13];
  id v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCSimHardwareInfoRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__CoreTelephonyClient_Subscriber__getSimHardwareInfo_error___block_invoke_2;
  v12[3] = &unk_1E5261A78;
  void v12[4] = &v20;
  void v12[5] = &v14;
  [v7 sendRequest:v8 completionHandler:v12];
  if (a4)
  {
    id v9 = (void *)v15[5];
    if (v9) {
      *a4 = v9;
    }
  }
  id v10 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __60__CoreTelephonyClient_Subscriber__getSimHardwareInfo_error___block_invoke(uint64_t a1, void *a2)
{
}

void __60__CoreTelephonyClient_Subscriber__getSimHardwareInfo_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v15 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v15;
    id v8 = v15;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v15;
  }

  uint64_t v10 = [v9 hardwareInfo];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

- (int64_t)isEsimFor:(id)a3 error:(id *)a4
{
  id v4 = [(CoreTelephonyClient *)self getSimHardwareInfo:a3 error:a4];
  if ([v4 hardwareType] == 2) {
    int64_t v5 = 2;
  }
  else {
    int64_t v5 = [v4 hardwareType] != 0;
  }

  return v5;
}

- (void)getMobileSubscriberHomeCountryList:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCMobileSubscriberHomeCountryListRequest alloc] initWithContext:v8];
  [(CoreTelephonyClient *)self asynchronousRequest:v7 completionWithArray:v6];
}

- (id)getMobileSubscriberHomeCountryList:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCMobileSubscriberHomeCountryListRequest alloc] initWithContext:v6];
  id v8 = [(CoreTelephonyClient *)self synchronousRequestWithArrayResult:v7 error:a4];

  return v8;
}

- (void)copyLastKnownMobileSubscriberCountryCode:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCLastKnownMobileSubscriberCountryCodeRequest alloc] initWithContext:v8];
  [(CoreTelephonyClient *)self asynchronousRequest:v7 completionWithString:v6];
}

- (id)copyLastKnownMobileSubscriberCountryCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCLastKnownMobileSubscriberCountryCodeRequest alloc] initWithContext:v6];
  id v8 = [(CoreTelephonyClient *)self synchronousRequestWithStringResult:v7 error:a4];

  return v8;
}

- (void)copyMobileSubscriberNetworkCode:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCMobileSubscriberNetworkCodeRequest alloc] initWithContext:v8];
  [(CoreTelephonyClient *)self asynchronousRequest:v7 completionWithString:v6];
}

- (id)copyMobileSubscriberNetworkCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCMobileSubscriberNetworkCodeRequest alloc] initWithContext:v6];
  id v8 = [(CoreTelephonyClient *)self synchronousRequestWithStringResult:v7 error:a4];

  return v8;
}

- (void)copyGid1:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCMobileSubscriberGID1Request alloc] initWithContext:v8];
  [(CoreTelephonyClient *)self asynchronousRequest:v7 completionWithString:v6];
}

- (id)copyGid1:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCMobileSubscriberGID1Request alloc] initWithContext:v6];
  id v8 = [(CoreTelephonyClient *)self synchronousRequestWithStringResult:v7 error:a4];

  return v8;
}

- (void)copyGid2:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCMobileSubscriberGID2Request alloc] initWithContext:v8];
  [(CoreTelephonyClient *)self asynchronousRequest:v7 completionWithString:v6];
}

- (id)copyGid2:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCMobileSubscriberGID2Request alloc] initWithContext:v6];
  id v8 = [(CoreTelephonyClient *)self synchronousRequestWithStringResult:v7 error:a4];

  return v8;
}

- (id)shouldAllowSimLockFor:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTXPCSubscriptionContextRequest *)[CTXPCAllowSimLockRequest alloc] initWithContext:v4];
  id v6 = [(CoreTelephonyClient *)self synchronousRequestWithNumberResult:v5 error:0];

  return v6;
}

- (id)shouldAllowSimLockFor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCAllowSimLockRequest alloc] initWithContext:v6];
  id v8 = [(CoreTelephonyClient *)self synchronousRequestWithNumberResult:v7 error:a4];

  return v8;
}

- (void)fetchSIMLockValue:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCSimLockStateRequest alloc] initWithContext:v8];
  [(CoreTelephonyClient *)self asynchronousRequest:v7 completionWithNumber:v6];
}

- (id)fetchSIMLockValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCSimLockStateRequest alloc] initWithContext:v6];
  id v8 = [(CoreTelephonyClient *)self synchronousRequestWithNumberResult:v7 error:a4];

  return v8;
}

- (void)saveSIMLockValue:(id)a3 enabled:(BOOL)a4 pin:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, CTXPCEnablePINRequest *))a6;
  if (v11)
  {
    uint64_t v13 = [[CTXPCEnablePINRequest alloc] initWithContext:v10 enable:v8 pin:v11];
    [(CoreTelephonyClient *)self asynchronousRequest:v13 completion:v12];
  }
  else
  {
    uint64_t v14 = CTLogClientXPC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[CoreTelephonyClient(Subscriber) saveSIMLockValue:enabled:pin:completion:]();
    }
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    v12[2](v12, v13);
  }
}

- (void)saveSIMLockValue:(id)a3 enabled:(BOOL)a4 pin:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  if (!v11)
  {
    uint64_t v13 = CTLogClientXPC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      -[CoreTelephonyClient(Subscriber) saveSIMLockValue:enabled:pin:completion:]();
      if (!a6) {
        goto LABEL_6;
      }
    }
    else if (!a6)
    {
      goto LABEL_6;
    }
    *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    goto LABEL_6;
  }
  id v12 = [[CTXPCEnablePINRequest alloc] initWithContext:v10 enable:v8 pin:v11];
  [(CoreTelephonyClient *)self synchronousRequest:v12 error:a6];

LABEL_6:
}

- (void)unlockPIN:(id)a3 pin:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (v9)
  {
    id v11 = [[CTXPCUnlockPINRequest alloc] initWithContext:v8 pin:v9];
    [(CoreTelephonyClient *)self asynchronousRequest:v11 completion:v10];
  }
  else
  {
    id v12 = CTLogClientXPC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[CoreTelephonyClient(Subscriber) saveSIMLockValue:enabled:pin:completion:]();
    }
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    v10[2](v10, v13);
  }
}

- (void)unlockPIN:(id)a3 pin:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v11 = CTLogClientXPC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      -[CoreTelephonyClient(Subscriber) saveSIMLockValue:enabled:pin:completion:]();
      if (!a5) {
        goto LABEL_6;
      }
    }
    else if (!a5)
    {
      goto LABEL_6;
    }
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    goto LABEL_6;
  }
  id v10 = [[CTXPCUnlockPINRequest alloc] initWithContext:v8 pin:v9];
  [(CoreTelephonyClient *)self synchronousRequest:v10 error:a5];

LABEL_6:
}

- (void)unlockPUK:(id)a3 puk:(id)a4 newPin:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void *))a6;
  if (v11 && v12)
  {
    uint64_t v14 = [[CTXPCUnblockPUKRequest alloc] initWithContext:v10 puk:v11 pin:v12];
    [(CoreTelephonyClient *)self asynchronousRequest:v14 completion:v13];
  }
  else
  {
    id v15 = CTLogClientXPC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[CoreTelephonyClient(Subscriber) unlockPUK:puk:newPin:completion:]();
    }
    uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    v13[2](v13, v16);
  }
}

- (void)unlockPUK:(id)a3 puk:(id)a4 newPin:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = v12;
  if (!v11 || !v12)
  {
    id v15 = CTLogClientXPC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      -[CoreTelephonyClient(Subscriber) unlockPUK:puk:newPin:completion:]();
      if (!a6) {
        goto LABEL_7;
      }
    }
    else if (!a6)
    {
      goto LABEL_7;
    }
    *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    goto LABEL_7;
  }
  uint64_t v14 = [[CTXPCUnblockPUKRequest alloc] initWithContext:v10 puk:v11 pin:v12];
  [(CoreTelephonyClient *)self synchronousRequest:v14 error:a6];

LABEL_7:
}

- (void)changePIN:(id)a3 oldPin:(id)a4 newPin:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void *))a6;
  if (v11 && v12)
  {
    uint64_t v14 = [[CTXPCChangePINRequest alloc] initWithContext:v10 currentPin:v11 updatedPin:v12];
    [(CoreTelephonyClient *)self asynchronousRequest:v14 completion:v13];
  }
  else
  {
    id v15 = CTLogClientXPC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[CoreTelephonyClient(Subscriber) saveSIMLockValue:enabled:pin:completion:]();
    }
    uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    v13[2](v13, v16);
  }
}

- (void)changePIN:(id)a3 oldPin:(id)a4 newPin:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = v12;
  if (!v11 || !v12)
  {
    id v15 = CTLogClientXPC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      -[CoreTelephonyClient(Subscriber) saveSIMLockValue:enabled:pin:completion:]();
      if (!a6) {
        goto LABEL_7;
      }
    }
    else if (!a6)
    {
      goto LABEL_7;
    }
    *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    goto LABEL_7;
  }
  uint64_t v14 = [[CTXPCChangePINRequest alloc] initWithContext:v10 currentPin:v11 updatedPin:v12];
  [(CoreTelephonyClient *)self synchronousRequest:v14 error:a6];

LABEL_7:
}

- (void)getRemainingPINAttemptCount:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCRemainingPINRetriesRequest alloc] initWithContext:v8];
  [(CoreTelephonyClient *)self asynchronousRequest:v7 completionWithNumber:v6];
}

- (id)getRemainingPINAttemptCount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCRemainingPINRetriesRequest alloc] initWithContext:v6];
  id v8 = [(CoreTelephonyClient *)self synchronousRequestWithNumberResult:v7 error:a4];

  return v8;
}

- (void)getRemainingPUKAttemptCount:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCRemainingPUKRetriesRequest alloc] initWithContext:v8];
  [(CoreTelephonyClient *)self asynchronousRequest:v7 completionWithNumber:v6];
}

- (id)getRemainingPUKAttemptCount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCRemainingPUKRetriesRequest alloc] initWithContext:v6];
  id v8 = [(CoreTelephonyClient *)self synchronousRequestWithNumberResult:v7 error:a4];

  return v8;
}

- (void)promptForSIMUnlock:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCPromptForSIMUnlockRequest alloc] initWithContext:v8];
  [(CoreTelephonyClient *)self asynchronousRequest:v7 completion:v6];
}

- (void)SIMUnlockProcedureDidComplete
{
  BOOL v3 = objc_alloc_init(CTXPCPINOperationCompletedRequest);
  -[CoreTelephonyClient asynchronousRequest:completion:](self, "asynchronousRequest:completion:");
}

- (void)getSimLabel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__CoreTelephonyClient_Subscriber__getSimLabel_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  id v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetSimLabelRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__CoreTelephonyClient_Subscriber__getSimLabel_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __58__CoreTelephonyClient_Subscriber__getSimLabel_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__CoreTelephonyClient_Subscriber__getSimLabel_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 simLabel];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (id)getSimLabel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__10;
  id v24 = __Block_byref_object_dispose__10;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__10;
  id v18 = __Block_byref_object_dispose__10;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__CoreTelephonyClient_Subscriber__getSimLabel_error___block_invoke;
  v13[3] = &unk_1E5260BA0;
  void v13[4] = &v14;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v13];
  id v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetSimLabelRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__CoreTelephonyClient_Subscriber__getSimLabel_error___block_invoke_2;
  v12[3] = &unk_1E5261A78;
  void v12[4] = &v20;
  void v12[5] = &v14;
  [v7 sendRequest:v8 completionHandler:v12];
  if (a4)
  {
    id v9 = (void *)v15[5];
    if (v9) {
      *a4 = v9;
    }
  }
  id v10 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __53__CoreTelephonyClient_Subscriber__getSimLabel_error___block_invoke(uint64_t a1, void *a2)
{
}

void __53__CoreTelephonyClient_Subscriber__getSimLabel_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v15 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v15;
    id v8 = v15;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v15;
  }

  uint64_t v10 = [v9 simLabel];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

- (void)getShortLabel:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCShortLabelRequest alloc] initWithContext:v8];
  [(CoreTelephonyClient *)self asynchronousRequest:v7 completionWithString:v6];
}

- (id)getShortLabel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCShortLabelRequest alloc] initWithContext:v6];
  id v8 = [(CoreTelephonyClient *)self synchronousRequestWithStringResult:v7 error:a4];

  return v8;
}

- (void)getSubscriptionUserFacingName:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCSubscriptionNameRequest alloc] initWithContext:v8];
  [(CoreTelephonyClient *)self asynchronousRequest:v7 completionWithString:v6];
}

- (id)getSubscriptionUserFacingName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCSubscriptionNameRequest alloc] initWithContext:v6];
  id v8 = [(CoreTelephonyClient *)self synchronousRequestWithStringResult:v7 error:a4];

  return v8;
}

- (void)copyLabel:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCSubscriptionNameRequest alloc] initWithContext:v8];
  [(CoreTelephonyClient *)self asynchronousRequest:v7 completionWithString:v6];
}

- (id)copyLabel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCSubscriptionNameRequest alloc] initWithContext:v6];
  id v8 = [(CoreTelephonyClient *)self synchronousRequestWithStringResult:v7 error:a4];

  return v8;
}

- (void)setLabel:(id)a3 label:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *))a5;
  if (v9)
  {
    uint64_t v11 = [[CTXPCSetSimLabelRequest alloc] initWithContext:v8 label:v9];
    [(CoreTelephonyClient *)self asynchronousRequest:v11 completion:v10];
  }
  else
  {
    id v12 = CTLogClientXPC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[CoreTelephonyClient(Subscriber) setLabel:label:completion:]();
    }
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    v10[2](v10, v13);
  }
}

- (void)setLabel:(id)a3 label:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    uint64_t v11 = CTLogClientXPC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      -[CoreTelephonyClient(Subscriber) setLabel:label:completion:]();
      if (!a5) {
        goto LABEL_6;
      }
    }
    else if (!a5)
    {
      goto LABEL_6;
    }
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    goto LABEL_6;
  }
  uint64_t v10 = [[CTXPCSetSimLabelRequest alloc] initWithContext:v8 label:v9];
  [(CoreTelephonyClient *)self synchronousRequest:v10 error:a5];

LABEL_6:
}

- (void)setDefaultVoice:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCSetDefaultVoiceRequest alloc] initWithContext:v8];
  [(CoreTelephonyClient *)self asynchronousRequest:v7 completion:v6];
}

- (void)setDefaultVoice:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v6 = [(CTXPCSubscriptionContextRequest *)[CTXPCSetDefaultVoiceRequest alloc] initWithContext:v7];
  [(CoreTelephonyClient *)self synchronousRequest:v6 error:a4];
}

- (void)setActiveUserDataSelection:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CTXPCSubscriptionContextRequest *)[CTXPCSetDefaultDataRequest alloc] initWithContext:v8];
  [(CoreTelephonyClient *)self asynchronousRequest:v7 completion:v6];
}

- (void)setActiveUserDataSelection:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v6 = [(CTXPCSubscriptionContextRequest *)[CTXPCSetDefaultDataRequest alloc] initWithContext:v7];
  [(CoreTelephonyClient *)self synchronousRequest:v6 error:a4];
}

- (void)generateAuthenticationInfoUsingSim:(id)a3 authParams:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(void, void, void))v10;
  if (v9)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __92__CoreTelephonyClient_Subscriber__generateAuthenticationInfoUsingSim_authParams_completion___block_invoke;
    v19[3] = &unk_1E5260CB8;
    id v12 = v10;
    id v20 = v12;
    uint64_t v13 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v19];
    uint64_t v14 = [[CTXPCSubscriberAuthenticateRequest alloc] initWithContext:v8 authInfo:v9];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __92__CoreTelephonyClient_Subscriber__generateAuthenticationInfoUsingSim_authParams_completion___block_invoke_2;
    v17[3] = &unk_1E5263180;
    id v18 = v12;
    [v13 sendRequest:v14 completionHandler:v17];

    id v15 = v20;
  }
  else
  {
    uint64_t v16 = CTLogClientXPC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[CoreTelephonyClient(Subscriber) generateAuthenticationInfoUsingSim:authParams:completion:]();
    }
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    ((void (**)(void, void, void *))v11)[2](v11, 0, v15);
  }
}

uint64_t __92__CoreTelephonyClient_Subscriber__generateAuthenticationInfoUsingSim_authParams_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92__CoreTelephonyClient_Subscriber__generateAuthenticationInfoUsingSim_authParams_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = [v9 authInfo];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (void)authenticate:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__CoreTelephonyClient_Subscriber__authenticate_request_completion___block_invoke;
  v13[3] = &unk_1E5260CB8;
  id v11 = v10;
  id v14 = v11;
  id v12 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  [v12 authenticate:v8 request:v9 completion:v11];
}

uint64_t __67__CoreTelephonyClient_Subscriber__authenticate_request_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getUserAuthToken:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__10;
  id v24 = __Block_byref_object_dispose__10;
  id v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __58__CoreTelephonyClient_Subscriber__getUserAuthToken_error___block_invoke;
  v19[3] = &unk_1E5260BA0;
  void v19[4] = &v20;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v19];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__10;
  id v17 = __Block_byref_object_dispose__10;
  id v18 = 0;
  id v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCUserAuthTokenRequest alloc] initWithDescriptor:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__CoreTelephonyClient_Subscriber__getUserAuthToken_error___block_invoke_2;
  v12[3] = &unk_1E5261A78;
  void v12[4] = &v13;
  void v12[5] = &v20;
  [v7 sendRequest:v8 completionHandler:v12];
  if (a4)
  {
    id v9 = (void *)v21[5];
    if (v9) {
      *a4 = v9;
    }
  }
  id v10 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __58__CoreTelephonyClient_Subscriber__getUserAuthToken_error___block_invoke(uint64_t a1, void *a2)
{
}

void __58__CoreTelephonyClient_Subscriber__getUserAuthToken_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v15 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v15;
    id v8 = v15;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v15;
  }

  uint64_t v10 = [v9 token];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

- (void)refreshUserAuthToken:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v6 = [(CTXPCSubscriptionContextRequest *)[CTXPCRefreshCarrierTokenRequest alloc] initWithDescriptor:v7];
  [(CoreTelephonyClient *)self synchronousRequest:v6 error:a4];
}

void __74__CoreTelephonyClient_Subscriber__getUserDefaultVoiceSubscriptionContext___block_invoke(uint64_t a1, void *a2)
{
}

- (id)getLastKnownSimDeactivationInfoFor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__10;
  id v24 = __Block_byref_object_dispose__10;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__10;
  id v18 = __Block_byref_object_dispose__10;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__CoreTelephonyClient_Subscriber__getLastKnownSimDeactivationInfoFor_error___block_invoke;
  v13[3] = &unk_1E5260BA0;
  void v13[4] = &v14;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v13];
  id v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetSimDeactivationInfoRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__CoreTelephonyClient_Subscriber__getLastKnownSimDeactivationInfoFor_error___block_invoke_2;
  v12[3] = &unk_1E5261A78;
  void v12[4] = &v20;
  void v12[5] = &v14;
  [v7 sendRequest:v8 completionHandler:v12];
  if (a4)
  {
    id v9 = (void *)v15[5];
    if (v9) {
      *a4 = v9;
    }
  }
  id v10 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __76__CoreTelephonyClient_Subscriber__getLastKnownSimDeactivationInfoFor_error___block_invoke(uint64_t a1, void *a2)
{
}

void __76__CoreTelephonyClient_Subscriber__getLastKnownSimDeactivationInfoFor_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v15 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v15;
    id v8 = v15;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v15;
  }

  uint64_t v10 = [v9 info];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

- (id)copyMobileSubscriberIso3CountryCode:(id)a3 MNC:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v8 || !v9)
  {
    uint64_t v13 = CTLogClientXPC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      -[CoreTelephonyClient(Subscriber) copyMobileSubscriberIsoSubregionCode:MNC:error:]();
      if (a5) {
        goto LABEL_6;
      }
    }
    else if (a5)
    {
LABEL_6:
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      id v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    id v12 = 0;
    goto LABEL_9;
  }
  uint64_t v11 = [[CTXPCConvertMCCMNCToISORequest alloc] initWithMcc:v8 mnc:v9];
  id v12 = [(CoreTelephonyClient *)self synchronousRequestWithArrayResult:v11 error:a5];

LABEL_9:
  return v12;
}

- (id)checkEmbeddedSimHealthWithError:(id *)a3
{
  id v5 = objc_alloc_init(CTXPCEmbeddedSIMHealthRequest);
  id v6 = [(CoreTelephonyClient *)self synchronousRequestWithNumberResult:v5 error:a3];

  return v6;
}

- (BOOL)supportsEmbeddedSIM
{
  BOOL v3 = objc_alloc_init(CTXPCSupportEmbeddedSimRequest);
  id v4 = [(CoreTelephonyClient *)self synchronousRequestWithNumberResult:v3 error:0];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)copyMccOrPlmnsListForIso3CountryCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    id v9 = CTLogClientXPC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      -[CoreTelephonyClient(Subscriber) copyMccOrPlmnsListForIso3CountryCode:error:]();
      if (a4) {
        goto LABEL_5;
      }
    }
    else if (a4)
    {
LABEL_5:
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      id v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    id v8 = 0;
    goto LABEL_8;
  }
  id v7 = [[CTXPCConvertISOToMCCMNCRequest alloc] initWithIso:v6];
  id v8 = [(CoreTelephonyClient *)self synchronousRequestWithArrayResult:v7 error:a4];

LABEL_8:
  return v8;
}

- (id)isAnySimReadyWithError:(id *)a3
{
  char v5 = objc_alloc_init(CTXPCIsAnySimReadyRequest);
  id v6 = [(CoreTelephonyClient *)self synchronousRequestWithNumberResult:v5 error:a3];

  return v6;
}

- (id)isSimMatching:(id)a3 carrierDescriptors:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v8 && v9)
  {
    uint64_t v11 = [[CTXPCIsSimMatchingRequest alloc] initWithDescriptor:v8 carrierDescriptors:v9];
    id v12 = [(CoreTelephonyClient *)self synchronousRequestWithNumberResult:v11 error:a5];

    goto LABEL_8;
  }
  uint64_t v13 = CTLogClientXPC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    -[CoreTelephonyClient(Subscriber) isSimMatching:carrierDescriptors:error:]();
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (a5)
  {
LABEL_6:
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
  }
LABEL_7:
  id v12 = [NSNumber numberWithBool:0];
LABEL_8:

  return v12;
}

- (void)synchronousRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__10;
  id v15 = __Block_byref_object_dispose__10;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__CoreTelephonyClient_Subscriber__synchronousRequest_error___block_invoke;
  v10[3] = &unk_1E5260BA0;
  void v10[4] = &v11;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__CoreTelephonyClient_Subscriber__synchronousRequest_error___block_invoke_2;
  v9[3] = &unk_1E5261A50;
  void v9[4] = &v11;
  [v7 sendRequest:v6 completionHandler:v9];
  if (a4)
  {
    id v8 = (void *)v12[5];
    if (v8) {
      *a4 = v8;
    }
  }

  _Block_object_dispose(&v11, 8);
}

void __60__CoreTelephonyClient_Subscriber__synchronousRequest_error___block_invoke(uint64_t a1, void *a2)
{
}

void __60__CoreTelephonyClient_Subscriber__synchronousRequest_error___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

void __76__CoreTelephonyClient_Subscriber__synchronousRequestWithStringResult_error___block_invoke(uint64_t a1, void *a2)
{
}

- (id)synchronousRequestWithArrayResult:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__10;
  id v23 = __Block_byref_object_dispose__10;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__10;
  id v17 = __Block_byref_object_dispose__10;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__CoreTelephonyClient_Subscriber__synchronousRequestWithArrayResult_error___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__CoreTelephonyClient_Subscriber__synchronousRequestWithArrayResult_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  void v11[4] = &v19;
  void v11[5] = &v13;
  [v7 sendRequest:v6 completionHandler:v11];
  if (a4)
  {
    id v8 = (void *)v14[5];
    if (v8) {
      *a4 = v8;
    }
  }
  id v9 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __75__CoreTelephonyClient_Subscriber__synchronousRequestWithArrayResult_error___block_invoke(uint64_t a1, void *a2)
{
}

void __75__CoreTelephonyClient_Subscriber__synchronousRequestWithArrayResult_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v15 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v15;
    id v8 = v15;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v15;
  }

  uint64_t v10 = [v9 result];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

- (id)synchronousRequestWithNumberResult:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__10;
  id v23 = __Block_byref_object_dispose__10;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__10;
  id v17 = __Block_byref_object_dispose__10;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__CoreTelephonyClient_Subscriber__synchronousRequestWithNumberResult_error___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__CoreTelephonyClient_Subscriber__synchronousRequestWithNumberResult_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  void v11[4] = &v19;
  void v11[5] = &v13;
  [v7 sendRequest:v6 completionHandler:v11];
  if (a4)
  {
    id v8 = (void *)v14[5];
    if (v8) {
      *a4 = v8;
    }
  }
  id v9 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __76__CoreTelephonyClient_Subscriber__synchronousRequestWithNumberResult_error___block_invoke(uint64_t a1, void *a2)
{
}

void __76__CoreTelephonyClient_Subscriber__synchronousRequestWithNumberResult_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v15 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v15;
    id v8 = v15;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v15;
  }

  uint64_t v10 = [v9 result];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

- (void)asynchronousRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__CoreTelephonyClient_Subscriber__asynchronousRequest_completion___block_invoke;
  v13[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v14 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__CoreTelephonyClient_Subscriber__asynchronousRequest_completion___block_invoke_2;
  v11[3] = &unk_1E5263180;
  id v10 = v8;
  id v12 = v10;
  [v9 sendRequest:v6 completionHandler:v11];
}

void __66__CoreTelephonyClient_Subscriber__asynchronousRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void __66__CoreTelephonyClient_Subscriber__asynchronousRequest_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

uint64_t __76__CoreTelephonyClient_Subscriber__asynchronousRequest_completionWithString___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)asynchronousRequest:(id)a3 completionWithNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__CoreTelephonyClient_Subscriber__asynchronousRequest_completionWithNumber___block_invoke;
  v13[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v14 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__CoreTelephonyClient_Subscriber__asynchronousRequest_completionWithNumber___block_invoke_2;
  v11[3] = &unk_1E5263180;
  id v10 = v8;
  id v12 = v10;
  [v9 sendRequest:v6 completionHandler:v11];
}

uint64_t __76__CoreTelephonyClient_Subscriber__asynchronousRequest_completionWithNumber___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__CoreTelephonyClient_Subscriber__asynchronousRequest_completionWithNumber___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = [v9 result];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (void)asynchronousRequest:(id)a3 completionWithArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__CoreTelephonyClient_Subscriber__asynchronousRequest_completionWithArray___block_invoke;
  v13[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v14 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__CoreTelephonyClient_Subscriber__asynchronousRequest_completionWithArray___block_invoke_2;
  v11[3] = &unk_1E5263180;
  id v10 = v8;
  id v12 = v10;
  [v9 sendRequest:v6 completionHandler:v11];
}

uint64_t __75__CoreTelephonyClient_Subscriber__asynchronousRequest_completionWithArray___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75__CoreTelephonyClient_Subscriber__asynchronousRequest_completionWithArray___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = [v9 result];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (void)getSweetgumCapabilities:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__CoreTelephonyClient_CarrierServices__getSweetgumCapabilities_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 getSweetgumCapabilities:v6 completion:v8];
}

uint64_t __75__CoreTelephonyClient_CarrierServices__getSweetgumCapabilities_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getSweetgumUserConsentInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__CoreTelephonyClient_CarrierServices__getSweetgumUserConsentInfo_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 getSweetgumUserConsentInfo:v6 completion:v8];
}

uint64_t __78__CoreTelephonyClient_CarrierServices__getSweetgumUserConsentInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setSweetgumUserConsent:(id)a3 userConsent:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  id v8 = a5;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v8];
  [v9 setSweetgumUserConsent:v10 userConsent:v6 completion:v8];
}

- (void)getSweetgumUsage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__CoreTelephonyClient_CarrierServices__getSweetgumUsage_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 getSweetgumUsage:v6 completion:v8];
}

uint64_t __68__CoreTelephonyClient_CarrierServices__getSweetgumUsage_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)refreshSweetgumUsage:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v6];
  [v7 refreshSweetgumUsage:v8 completion:v6];
}

- (void)getSweetgumPlans:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__CoreTelephonyClient_CarrierServices__getSweetgumPlans_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 getSweetgumPlans:v6 completion:v8];
}

uint64_t __68__CoreTelephonyClient_CarrierServices__getSweetgumPlans_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)refreshSweetgumPlans:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v6];
  [v7 refreshSweetgumPlans:v8 completion:v6];
}

- (void)getSweetgumApps:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__CoreTelephonyClient_CarrierServices__getSweetgumApps_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 getSweetgumApps:v6 completion:v8];
}

uint64_t __67__CoreTelephonyClient_CarrierServices__getSweetgumApps_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)refreshSweetgumApps:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v6];
  [v7 refreshSweetgumApps:v8 completion:v6];
}

- (void)refreshSweetgumAll:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v6];
  [v7 refreshSweetgumAll:v8 completion:v6];
}

- (void)getSweetgumDataPlanMetrics:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__CoreTelephonyClient_CarrierServices__getSweetgumDataPlanMetrics_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 getSweetgumDataPlanMetrics:v6 completion:v8];
}

uint64_t __78__CoreTelephonyClient_CarrierServices__getSweetgumDataPlanMetrics_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)purchaseSweetgumPlan:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v6];
  [v7 purchaseSweetgumPlan:v8 completion:v6];
}

- (void)isPrivateNetworkContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__CoreTelephonyClient_PrivateNetwork__isPrivateNetworkContext_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 isPrivateNetworkContext:v6 completion:v8];
}

uint64_t __74__CoreTelephonyClient_PrivateNetwork__isPrivateNetworkContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)isPrivateNetworkContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__11;
  uint64_t v22 = __Block_byref_object_dispose__11;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__CoreTelephonyClient_PrivateNetwork__isPrivateNetworkContext_error___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__11;
  id v15 = __Block_byref_object_dispose__11;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__CoreTelephonyClient_PrivateNetwork__isPrivateNetworkContext_error___block_invoke_2;
  v10[3] = &unk_1E5262218;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 isPrivateNetworkContext:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __69__CoreTelephonyClient_PrivateNetwork__isPrivateNetworkContext_error___block_invoke(uint64_t a1, void *a2)
{
}

void __69__CoreTelephonyClient_PrivateNetwork__isPrivateNetworkContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)getPrivateNetworkCapabilitiesForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__CoreTelephonyClient_PrivateNetwork__getPrivateNetworkCapabilitiesForContext_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 getPrivateNetworkCapabilitiesForContext:v6 completion:v8];
}

uint64_t __90__CoreTelephonyClient_PrivateNetwork__getPrivateNetworkCapabilitiesForContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getPrivateNetworkCapabilitiesForContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__11;
  uint64_t v22 = __Block_byref_object_dispose__11;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85__CoreTelephonyClient_PrivateNetwork__getPrivateNetworkCapabilitiesForContext_error___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__11;
  id v15 = __Block_byref_object_dispose__11;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__CoreTelephonyClient_PrivateNetwork__getPrivateNetworkCapabilitiesForContext_error___block_invoke_2;
  v10[3] = &unk_1E5263250;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 getPrivateNetworkCapabilitiesForContext:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __85__CoreTelephonyClient_PrivateNetwork__getPrivateNetworkCapabilitiesForContext_error___block_invoke(uint64_t a1, void *a2)
{
}

void __85__CoreTelephonyClient_PrivateNetwork__getPrivateNetworkCapabilitiesForContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)isPrivateNetworkSIM:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__CoreTelephonyClient_PrivateNetwork__isPrivateNetworkSIM_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 isPrivateNetworkSIM:v6 completion:v8];
}

uint64_t __70__CoreTelephonyClient_PrivateNetwork__isPrivateNetworkSIM_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isPrivateNetworkSIM:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__11;
  uint64_t v20 = __Block_byref_object_dispose__11;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __65__CoreTelephonyClient_PrivateNetwork__isPrivateNetworkSIM_error___block_invoke;
  v15[3] = &unk_1E5260BA0;
  void v15[4] = &v16;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v15];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__CoreTelephonyClient_PrivateNetwork__isPrivateNetworkSIM_error___block_invoke_2;
  v10[3] = &unk_1E5260D78;
  void v10[4] = &v16;
  void v10[5] = &v11;
  [v7 isPrivateNetworkSIM:v6 completion:v10];
  if (a4) {
    *a4 = (id) v17[5];
  }
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __65__CoreTelephonyClient_PrivateNetwork__isPrivateNetworkSIM_error___block_invoke(uint64_t a1, void *a2)
{
}

void __65__CoreTelephonyClient_PrivateNetwork__isPrivateNetworkSIM_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)isPrivateNetworkEvaluationNeeded:(id *)a3
{
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__11;
  id v17 = __Block_byref_object_dispose__11;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__CoreTelephonyClient_PrivateNetwork__isPrivateNetworkEvaluationNeeded___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  uint64_t v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__CoreTelephonyClient_PrivateNetwork__isPrivateNetworkEvaluationNeeded___block_invoke_2;
  v7[3] = &unk_1E5260D78;
  void v7[4] = &v13;
  void v7[5] = &v8;
  [v4 isPrivateNetworkEvaluationNeeded:v7];
  if (a3) {
    *a3 = (id) v14[5];
  }
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v13, 8);
  return v5;
}

void __72__CoreTelephonyClient_PrivateNetwork__isPrivateNetworkEvaluationNeeded___block_invoke(uint64_t a1, void *a2)
{
}

void __72__CoreTelephonyClient_PrivateNetwork__isPrivateNetworkEvaluationNeeded___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)isPrivateNetworkPreferredOverWifi:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__CoreTelephonyClient_PrivateNetwork__isPrivateNetworkPreferredOverWifi_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 isPrivateNetworkPreferredOverWifi:v6 completion:v8];
}

uint64_t __84__CoreTelephonyClient_PrivateNetwork__isPrivateNetworkPreferredOverWifi_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)updateGeofenceProfile:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__CoreTelephonyClient_PrivateNetwork__updateGeofenceProfile___block_invoke;
  v9[3] = &unk_1E5260BA0;
  void v9[4] = &v10;
  char v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__CoreTelephonyClient_PrivateNetwork__updateGeofenceProfile___block_invoke_2;
  v8[3] = &unk_1E5263278;
  void v8[4] = &v10;
  [v5 updateGeofenceProfile:v4 completion:v8];
  char v6 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __61__CoreTelephonyClient_PrivateNetwork__updateGeofenceProfile___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  }
  return result;
}

uint64_t __61__CoreTelephonyClient_PrivateNetwork__updateGeofenceProfile___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)removeGeofenceProfile
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__CoreTelephonyClient_PrivateNetwork__removeGeofenceProfile__block_invoke;
  v6[3] = &unk_1E5260BA0;
  void v6[4] = &v7;
  uint64_t v2 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__CoreTelephonyClient_PrivateNetwork__removeGeofenceProfile__block_invoke_2;
  v5[3] = &unk_1E5263278;
  v5[4] = &v7;
  [v2 removeGeofenceProfile:v5];
  char v3 = *((unsigned char *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __60__CoreTelephonyClient_PrivateNetwork__removeGeofenceProfile__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  }
  return result;
}

uint64_t __60__CoreTelephonyClient_PrivateNetwork__removeGeofenceProfile__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)deleteHiddenSims:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__CoreTelephonyClient_PrivateNetwork__deleteHiddenSims___block_invoke;
  v7[3] = &unk_1E5260CB8;
  id v5 = v4;
  id v8 = v5;
  char v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  [v6 deleteHiddenSims:v5];
}

uint64_t __56__CoreTelephonyClient_PrivateNetwork__deleteHiddenSims___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)installPrivateNetworkProfile:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  char v13 = __Block_byref_object_copy__11;
  char v14 = __Block_byref_object_dispose__11;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__CoreTelephonyClient_PrivateNetwork__installPrivateNetworkProfile___block_invoke;
  v9[3] = &unk_1E5260BA0;
  void v9[4] = &v10;
  id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__CoreTelephonyClient_PrivateNetwork__installPrivateNetworkProfile___block_invoke_2;
  v8[3] = &unk_1E5260BA0;
  void v8[4] = &v10;
  [v5 installPrivateNetworkProfile:v4 completion:v8];
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v6;
}

void __68__CoreTelephonyClient_PrivateNetwork__installPrivateNetworkProfile___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __68__CoreTelephonyClient_PrivateNetwork__installPrivateNetworkProfile___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)removePrivateNetworkProfile:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  char v13 = __Block_byref_object_copy__11;
  char v14 = __Block_byref_object_dispose__11;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__CoreTelephonyClient_PrivateNetwork__removePrivateNetworkProfile___block_invoke;
  v9[3] = &unk_1E5260BA0;
  void v9[4] = &v10;
  id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__CoreTelephonyClient_PrivateNetwork__removePrivateNetworkProfile___block_invoke_2;
  v8[3] = &unk_1E5260BA0;
  void v8[4] = &v10;
  [v5 removePrivateNetworkProfile:v4 completion:v8];
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v6;
}

void __67__CoreTelephonyClient_PrivateNetwork__removePrivateNetworkProfile___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __67__CoreTelephonyClient_PrivateNetwork__removePrivateNetworkProfile___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)updatePrivateNetworkProfile:(id)a3 setProfileAside:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__11;
  uint64_t v16 = __Block_byref_object_dispose__11;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__CoreTelephonyClient_PrivateNetwork__updatePrivateNetworkProfile_setProfileAside___block_invoke;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v12;
  uint64_t v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__CoreTelephonyClient_PrivateNetwork__updatePrivateNetworkProfile_setProfileAside___block_invoke_2;
  v10[3] = &unk_1E5260BA0;
  void v10[4] = &v12;
  [v7 updatePrivateNetworkProfile:v6 setProfileAside:v4 completion:v10];
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v8;
}

void __83__CoreTelephonyClient_PrivateNetwork__updatePrivateNetworkProfile_setProfileAside___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __83__CoreTelephonyClient_PrivateNetwork__updatePrivateNetworkProfile_setProfileAside___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)getPrivateNetworkSimInfoForContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__11;
  uint64_t v22 = __Block_byref_object_dispose__11;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__CoreTelephonyClient_PrivateNetwork__getPrivateNetworkSimInfoForContext_error___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  uint64_t v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__11;
  id v15 = __Block_byref_object_dispose__11;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__CoreTelephonyClient_PrivateNetwork__getPrivateNetworkSimInfoForContext_error___block_invoke_2;
  v10[3] = &unk_1E52632A0;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 getPrivateNetworkSimInfoForContext:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __80__CoreTelephonyClient_PrivateNetwork__getPrivateNetworkSimInfoForContext_error___block_invoke(uint64_t a1, void *a2)
{
}

void __80__CoreTelephonyClient_PrivateNetwork__getPrivateNetworkSimInfoForContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)getRemoteDevicesOfType:(unint64_t)a3 error:(id *)a4
{
  return [(CoreTelephonyClient *)self getRemoteDevicesForTransferOrError:a4];
}

- (id)getRemoteDevicesForTransferOrError:(id *)a3
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__12;
  uint64_t v20 = __Block_byref_object_dispose__12;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __70__CoreTelephonyClient_RemotePlan__getRemoteDevicesForTransferOrError___block_invoke;
  v15[3] = &unk_1E5260BA0;
  void v15[4] = &v16;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v15];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__12;
  uint64_t v13 = __Block_byref_object_dispose__12;
  id v14 = 0;
  id v5 = objc_alloc_init(CTXPCGetRemoteDevicesForTransferRequest);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__CoreTelephonyClient_RemotePlan__getRemoteDevicesForTransferOrError___block_invoke_2;
  v8[3] = &unk_1E5261A78;
  void v8[4] = &v16;
  void v8[5] = &v9;
  [v4 sendRequest:v5 completionHandler:v8];

  if (a3) {
    *a3 = (id) v17[5];
  }
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v16, 8);

  return v6;
}

void __70__CoreTelephonyClient_RemotePlan__getRemoteDevicesForTransferOrError___block_invoke(uint64_t a1, void *a2)
{
}

void __70__CoreTelephonyClient_RemotePlan__getRemoteDevicesForTransferOrError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  uint64_t v10 = [v9 devices];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (id)getRemoteDeviceOfType:(unint64_t)a3 withEID:(id)a4 error:(id *)a5
{
  id v5 = [(CoreTelephonyClient *)self getRemoteDeviceForTransferWithEID:a4 error:a5];

  return v5;
}

- (id)getRemoteDeviceForTransferWithEID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    uint64_t v22 = __Block_byref_object_copy__12;
    id v23 = __Block_byref_object_dispose__12;
    id v24 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __75__CoreTelephonyClient_RemotePlan__getRemoteDeviceForTransferWithEID_error___block_invoke;
    v18[3] = &unk_1E5260BA0;
    void v18[4] = &v19;
    id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy__12;
    uint64_t v16 = __Block_byref_object_dispose__12;
    id v17 = 0;
    id v8 = [[CTXPCGetRemoteDeviceForTransferRequest alloc] initWithEID:v6];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__CoreTelephonyClient_RemotePlan__getRemoteDeviceForTransferWithEID_error___block_invoke_2;
    v11[3] = &unk_1E5261A78;
    void v11[4] = &v19;
    void v11[5] = &v12;
    [v7 sendRequest:v8 completionHandler:v11];

    if (a4) {
      *a4 = (id) v20[5];
    }
    id v9 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(&v19, 8);
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    id v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __75__CoreTelephonyClient_RemotePlan__getRemoteDeviceForTransferWithEID_error___block_invoke(uint64_t a1, void *a2)
{
}

void __75__CoreTelephonyClient_RemotePlan__getRemoteDeviceForTransferWithEID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  uint64_t v10 = [v9 device];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (void)transferRemotePlan:(id)a3 fromDevice:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(void, void, void))v10;
  if (v8)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __76__CoreTelephonyClient_RemotePlan__transferRemotePlan_fromDevice_completion___block_invoke;
    v18[3] = &unk_1E5260CB8;
    id v12 = v10;
    id v19 = v12;
    id v13 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v18];
    uint64_t v14 = [[CTXPCTransferRemotePlanFromDeviceRequest alloc] initWithPlanID:v8 fromDevice:v9];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __76__CoreTelephonyClient_RemotePlan__transferRemotePlan_fromDevice_completion___block_invoke_2;
    v16[3] = &unk_1E5263180;
    id v17 = v12;
    [v13 sendRequest:v14 completionHandler:v16];
  }
  else
  {
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    ((void (**)(void, void, void *))v11)[2](v11, 0, v15);
  }
}

uint64_t __76__CoreTelephonyClient_RemotePlan__transferRemotePlan_fromDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__CoreTelephonyClient_RemotePlan__transferRemotePlan_fromDevice_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v11;
    id v9 = v11;
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
    id v9 = v11;
  }

  (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, [v10 result], v6);
}

- (void)transferRemotePlan:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__CoreTelephonyClient_RemotePlan__transferRemotePlan_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  id v10 = [[CTXPCGetWebsheetInfoForTransferRemotePlanRequest alloc] initWithPlan:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__CoreTelephonyClient_RemotePlan__transferRemotePlan_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __65__CoreTelephonyClient_RemotePlan__transferRemotePlan_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__CoreTelephonyClient_RemotePlan__transferRemotePlan_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 urlString];
  id v12 = [v9 postdata];
  (*(void (**)(uint64_t, void *, void *, id))(v10 + 16))(v10, v11, v12, v6);
}

- (void)getRemotePlanManageAccountInfoFor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = &__block_literal_global_4;
  }
  if (v6)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __80__CoreTelephonyClient_RemotePlan__getRemotePlanManageAccountInfoFor_completion___block_invoke_2;
    v15[3] = &unk_1E5260CB8;
    id v9 = v8;
    id v16 = v9;
    uint64_t v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v15];
    id v11 = [[CTXPCGetRemotePlanManageAccountInfoRequest alloc] initWithIccid:v6];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __80__CoreTelephonyClient_RemotePlan__getRemotePlanManageAccountInfoFor_completion___block_invoke_3;
    v13[3] = &unk_1E5263180;
    id v14 = v9;
    [v10 sendRequest:v11 completionHandler:v13];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(void *, void, void, void *))v8 + 2))(v8, 0, 0, v12);
  }
}

uint64_t __80__CoreTelephonyClient_RemotePlan__getRemotePlanManageAccountInfoFor_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__CoreTelephonyClient_RemotePlan__getRemotePlanManageAccountInfoFor_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 url];
  id v12 = [v9 postdata];
  (*(void (**)(uint64_t, void *, void *, id))(v10 + 16))(v10, v11, v12, v6);
}

- (void)remotePlanSignupInfoFor:(id)a3 userConsent:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = &__block_literal_global_9_0;
  }
  if (v8)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __82__CoreTelephonyClient_RemotePlan__remotePlanSignupInfoFor_userConsent_completion___block_invoke_2;
    v17[3] = &unk_1E5260CB8;
    id v11 = v10;
    id v18 = v11;
    id v12 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v17];
    id v13 = [[CTXPCGetRemotePlanSignupInfoRequest alloc] initWithContext:v8 userConsent:a4];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __82__CoreTelephonyClient_RemotePlan__remotePlanSignupInfoFor_userConsent_completion___block_invoke_3;
    v15[3] = &unk_1E5263180;
    id v16 = v11;
    [v12 sendRequest:v13 completionHandler:v15];
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(void *, void, void, void *))v10 + 2))(v10, 0, 0, v14);
  }
}

uint64_t __82__CoreTelephonyClient_RemotePlan__remotePlanSignupInfoFor_userConsent_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__CoreTelephonyClient_RemotePlan__remotePlanSignupInfoFor_userConsent_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 url];
  id v12 = [v9 postdata];
  (*(void (**)(uint64_t, void *, void *, id))(v10 + 16))(v10, v11, v12, v6);
}

- (id)getTransportKeysToUpdate:(id *)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__13;
  id v19 = __Block_byref_object_dispose__13;
  id v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__13;
  id v13 = __Block_byref_object_dispose__13;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__CoreTelephonyClient_Provisioning__getTransportKeysToUpdate___block_invoke;
  v8[3] = &unk_1E52611A0;
  void v8[4] = &v15;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__CoreTelephonyClient_Provisioning__getTransportKeysToUpdate___block_invoke_2;
  v7[3] = &unk_1E5263C78;
  void v7[4] = &v9;
  void v7[5] = &v15;
  [v4 getTransportKeysToUpdate:v7];
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

  return v5;
}

void __62__CoreTelephonyClient_Provisioning__getTransportKeysToUpdate___block_invoke(uint64_t a1, void *a2)
{
}

void __62__CoreTelephonyClient_Provisioning__getTransportKeysToUpdate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)getTransportKeysToUpdateWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__CoreTelephonyClient_Provisioning__getTransportKeysToUpdateWithCompletion___block_invoke;
  v7[3] = &unk_1E5261178;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  [v6 getTransportKeysToUpdate:v5];
}

uint64_t __76__CoreTelephonyClient_Provisioning__getTransportKeysToUpdateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)setTransportKeysUpdated:(BOOL)a3 with:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__13;
  id v16 = __Block_byref_object_dispose__13;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__CoreTelephonyClient_Provisioning__setTransportKeysUpdated_with___block_invoke;
  v11[3] = &unk_1E52611A0;
  void v11[4] = &v12;
  uint64_t v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__CoreTelephonyClient_Provisioning__setTransportKeysUpdated_with___block_invoke_2;
  v10[3] = &unk_1E52611A0;
  void v10[4] = &v12;
  [v7 setTransportKeysUpdated:v4 with:v6 completion:v10];
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v8;
}

void __66__CoreTelephonyClient_Provisioning__setTransportKeysUpdated_with___block_invoke(uint64_t a1, void *a2)
{
}

void __66__CoreTelephonyClient_Provisioning__setTransportKeysUpdated_with___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)forceRollAllTransportKeys
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__13;
  id v11 = __Block_byref_object_dispose__13;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__CoreTelephonyClient_Provisioning__forceRollAllTransportKeys__block_invoke;
  v6[3] = &unk_1E52611A0;
  void v6[4] = &v7;
  uint64_t v2 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__CoreTelephonyClient_Provisioning__forceRollAllTransportKeys__block_invoke_2;
  v5[3] = &unk_1E52611A0;
  v5[4] = &v7;
  [v2 forceRollAllTransportKeys:v5];
  id v3 = (id)v8[5];

  _Block_object_dispose(&v7, 8);

  return v3;
}

void __62__CoreTelephonyClient_Provisioning__forceRollAllTransportKeys__block_invoke(uint64_t a1, void *a2)
{
}

void __62__CoreTelephonyClient_Provisioning__forceRollAllTransportKeys__block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)getSatelliteMsgCfgToUpdate:(id *)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__13;
  id v19 = __Block_byref_object_dispose__13;
  id v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__13;
  id v13 = __Block_byref_object_dispose__13;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__CoreTelephonyClient_Provisioning__getSatelliteMsgCfgToUpdate___block_invoke;
  v8[3] = &unk_1E52611A0;
  void v8[4] = &v15;
  BOOL v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__CoreTelephonyClient_Provisioning__getSatelliteMsgCfgToUpdate___block_invoke_2;
  v7[3] = &unk_1E5263CA0;
  void v7[4] = &v9;
  void v7[5] = &v15;
  [v4 getSatelliteMsgCfgToUpdate:v7];
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

  return v5;
}

void __64__CoreTelephonyClient_Provisioning__getSatelliteMsgCfgToUpdate___block_invoke(uint64_t a1, void *a2)
{
}

void __64__CoreTelephonyClient_Provisioning__getSatelliteMsgCfgToUpdate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)getSatelliteMsgCfgToUpdateWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__CoreTelephonyClient_Provisioning__getSatelliteMsgCfgToUpdateWithCompletion___block_invoke;
  v7[3] = &unk_1E5261178;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  [v6 getSatelliteMsgCfgToUpdate:v5];
}

uint64_t __78__CoreTelephonyClient_Provisioning__getSatelliteMsgCfgToUpdateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)setSatelliteMsgCfgUpdated:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__13;
  id v14 = __Block_byref_object_dispose__13;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__CoreTelephonyClient_Provisioning__setSatelliteMsgCfgUpdated___block_invoke;
  v9[3] = &unk_1E52611A0;
  void v9[4] = &v10;
  id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__CoreTelephonyClient_Provisioning__setSatelliteMsgCfgUpdated___block_invoke_2;
  v8[3] = &unk_1E52611A0;
  void v8[4] = &v10;
  [v5 setSatelliteMsgCfgUpdated:v4 completion:v8];
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v6;
}

void __63__CoreTelephonyClient_Provisioning__setSatelliteMsgCfgUpdated___block_invoke(uint64_t a1, void *a2)
{
}

void __63__CoreTelephonyClient_Provisioning__setSatelliteMsgCfgUpdated___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)reprovisionSatelliteMsg:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__13;
  id v13 = __Block_byref_object_dispose__13;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__CoreTelephonyClient_Provisioning__reprovisionSatelliteMsg___block_invoke;
  v8[3] = &unk_1E52611A0;
  void v8[4] = &v9;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__CoreTelephonyClient_Provisioning__reprovisionSatelliteMsg___block_invoke_2;
  v7[3] = &unk_1E52611A0;
  void v7[4] = &v9;
  [v4 reprovisionSatelliteMsg:v3 completion:v7];
  id v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v5;
}

void __61__CoreTelephonyClient_Provisioning__reprovisionSatelliteMsg___block_invoke(uint64_t a1, void *a2)
{
}

void __61__CoreTelephonyClient_Provisioning__reprovisionSatelliteMsg___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)hasDedicatedBearerSupport
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v2 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:&__block_literal_global_5];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__CoreTelephonyClient_Provisioning__hasDedicatedBearerSupport__block_invoke_2;
  v5[3] = &unk_1E5263CC8;
  v5[4] = &v6;
  [v2 hasDedicatedBearerSupport:v5];
  char v3 = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __62__CoreTelephonyClient_Provisioning__hasDedicatedBearerSupport__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)addDedicatedBearer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__13;
  uint64_t v22 = __Block_byref_object_dispose__13;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__13;
  id v16 = __Block_byref_object_dispose__13;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__CoreTelephonyClient_Provisioning__addDedicatedBearer_error___block_invoke;
  v11[3] = &unk_1E52611A0;
  void v11[4] = &v18;
  uint64_t v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__CoreTelephonyClient_Provisioning__addDedicatedBearer_error___block_invoke_2;
  v10[3] = &unk_1E5263CF0;
  void v10[4] = &v12;
  void v10[5] = &v18;
  [v7 addDedicatedBearer:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __62__CoreTelephonyClient_Provisioning__addDedicatedBearer_error___block_invoke(uint64_t a1, void *a2)
{
}

void __62__CoreTelephonyClient_Provisioning__addDedicatedBearer_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)removeDedicatedBearer:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__13;
  uint64_t v14 = __Block_byref_object_dispose__13;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__CoreTelephonyClient_Provisioning__removeDedicatedBearer___block_invoke;
  v9[3] = &unk_1E52611A0;
  void v9[4] = &v10;
  id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__CoreTelephonyClient_Provisioning__removeDedicatedBearer___block_invoke_2;
  v8[3] = &unk_1E52611A0;
  void v8[4] = &v10;
  [v5 removeDedicatedBearer:v4 completion:v8];
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v6;
}

void __59__CoreTelephonyClient_Provisioning__removeDedicatedBearer___block_invoke(uint64_t a1, void *a2)
{
}

void __59__CoreTelephonyClient_Provisioning__removeDedicatedBearer___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)removeAllDedicatedBearers
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__13;
  id v11 = __Block_byref_object_dispose__13;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__CoreTelephonyClient_Provisioning__removeAllDedicatedBearers__block_invoke;
  v6[3] = &unk_1E52611A0;
  void v6[4] = &v7;
  uint64_t v2 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__CoreTelephonyClient_Provisioning__removeAllDedicatedBearers__block_invoke_2;
  v5[3] = &unk_1E52611A0;
  v5[4] = &v7;
  [v2 removeAllDedicatedBearers:v5];
  id v3 = (id)v8[5];

  _Block_object_dispose(&v7, 8);

  return v3;
}

void __62__CoreTelephonyClient_Provisioning__removeAllDedicatedBearers__block_invoke(uint64_t a1, void *a2)
{
}

void __62__CoreTelephonyClient_Provisioning__removeAllDedicatedBearers__block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)isDedicatedBearerPresent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__13;
  uint64_t v20 = __Block_byref_object_dispose__13;
  id v21 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__CoreTelephonyClient_Provisioning__isDedicatedBearerPresent_error___block_invoke;
  v11[3] = &unk_1E52611A0;
  void v11[4] = &v16;
  uint64_t v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__CoreTelephonyClient_Provisioning__isDedicatedBearerPresent_error___block_invoke_2;
  v10[3] = &unk_1E52619D8;
  void v10[4] = &v12;
  void v10[5] = &v16;
  [v7 isDedicatedBearerPresent:v6 completion:v10];
  if (a4) {
    *a4 = (id) v17[5];
  }
  char v8 = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v8;
}

void __68__CoreTelephonyClient_Provisioning__isDedicatedBearerPresent_error___block_invoke(uint64_t a1, void *a2)
{
}

void __68__CoreTelephonyClient_Provisioning__isDedicatedBearerPresent_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (id)getListOfPresentDedicatedBearers
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__13;
  uint64_t v10 = __Block_byref_object_dispose__13;
  id v11 = 0;
  uint64_t v2 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:&__block_literal_global_7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__CoreTelephonyClient_Provisioning__getListOfPresentDedicatedBearers__block_invoke_2;
  v5[3] = &unk_1E5263D18;
  v5[4] = &v6;
  [v2 getListOfPresentDedicatedBearers:v5];
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__CoreTelephonyClient_Provisioning__getListOfPresentDedicatedBearers__block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)getQoSLinkCharacteristics:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__13;
  id v19 = __Block_byref_object_dispose__13;
  id v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__13;
  id v13 = __Block_byref_object_dispose__13;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__CoreTelephonyClient_Provisioning__getQoSLinkCharacteristics___block_invoke;
  v8[3] = &unk_1E52611A0;
  void v8[4] = &v15;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__CoreTelephonyClient_Provisioning__getQoSLinkCharacteristics___block_invoke_2;
  v7[3] = &unk_1E5263D40;
  void v7[4] = &v9;
  void v7[5] = &v15;
  [v4 getQoSLinkCharacteristics:v7];
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

  return v5;
}

void __63__CoreTelephonyClient_Provisioning__getQoSLinkCharacteristics___block_invoke(uint64_t a1, void *a2)
{
}

void __63__CoreTelephonyClient_Provisioning__getQoSLinkCharacteristics___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestQoSLinkCharacteristics
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__13;
  id v11 = __Block_byref_object_dispose__13;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__CoreTelephonyClient_Provisioning__requestQoSLinkCharacteristics__block_invoke;
  v6[3] = &unk_1E52611A0;
  void v6[4] = &v7;
  uint64_t v2 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__CoreTelephonyClient_Provisioning__requestQoSLinkCharacteristics__block_invoke_2;
  v5[3] = &unk_1E52611A0;
  v5[4] = &v7;
  [v2 requestQoSLinkCharacteristics:v5];
  id v3 = (id)v8[5];

  _Block_object_dispose(&v7, 8);

  return v3;
}

void __66__CoreTelephonyClient_Provisioning__requestQoSLinkCharacteristics__block_invoke(uint64_t a1, void *a2)
{
}

void __66__CoreTelephonyClient_Provisioning__requestQoSLinkCharacteristics__block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)sendTaggedInfo:(id)a3 type:(unint64_t)a4 payload:(id)a5 completion:(id)a6
{
  id v13 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v11];
  [v12 sendTaggedInfo:v13 type:a4 payload:v10 completion:v11];
}

- (void)isPNRSupported:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__CoreTelephonyClient_PNR__isPNRSupported_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  uint64_t v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 isPNRSupported:v6 completion:v8];
}

uint64_t __54__CoreTelephonyClient_PNR__isPNRSupported_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isPNRSupported:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__14;
  id v20 = __Block_byref_object_dispose__14;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __52__CoreTelephonyClient_PNR__isPNRSupported_outError___block_invoke;
  v15[3] = &unk_1E5260BA0;
  void v15[4] = &v16;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v15];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__CoreTelephonyClient_PNR__isPNRSupported_outError___block_invoke_2;
  v10[3] = &unk_1E5260D78;
  void v10[4] = &v16;
  void v10[5] = &v11;
  [v7 isPNRSupported:v6 completion:v10];
  if (a4) {
    *a4 = (id) v17[5];
  }
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __52__CoreTelephonyClient_PNR__isPNRSupported_outError___block_invoke(uint64_t a1, void *a2)
{
}

void __52__CoreTelephonyClient_PNR__isPNRSupported_outError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)issuePNRRequest:(id)a3 pnrReqType:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__CoreTelephonyClient_PNR__issuePNRRequest_pnrReqType_completion___block_invoke;
  v13[3] = &unk_1E5260CB8;
  id v11 = v10;
  id v14 = v11;
  id v12 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  [v12 issuePNRRequest:v8 pnrReqType:v9 completion:v11];
}

uint64_t __66__CoreTelephonyClient_PNR__issuePNRRequest_pnrReqType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPNRContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__CoreTelephonyClient_PNR__getPNRContext_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 getPNRContext:v6 completion:v8];
}

uint64_t __53__CoreTelephonyClient_PNR__getPNRContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getPNRContext:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__14;
  uint64_t v22 = __Block_byref_object_dispose__14;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__CoreTelephonyClient_PNR__getPNRContext_outError___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__14;
  uint64_t v15 = __Block_byref_object_dispose__14;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__CoreTelephonyClient_PNR__getPNRContext_outError___block_invoke_2;
  v10[3] = &unk_1E5264048;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 getPNRContext:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __51__CoreTelephonyClient_PNR__getPNRContext_outError___block_invoke(uint64_t a1, void *a2)
{
}

void __51__CoreTelephonyClient_PNR__getPNRContext_outError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)isPhoneNumberCredentialValid:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__14;
  uint64_t v20 = __Block_byref_object_dispose__14;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __66__CoreTelephonyClient_PNR__isPhoneNumberCredentialValid_outError___block_invoke;
  v15[3] = &unk_1E5260BA0;
  void v15[4] = &v16;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v15];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__CoreTelephonyClient_PNR__isPhoneNumberCredentialValid_outError___block_invoke_2;
  v10[3] = &unk_1E5260D78;
  void v10[4] = &v11;
  void v10[5] = &v16;
  [v7 isPhoneNumberCredentialValid:v6 completion:v10];
  if (a4) {
    *a4 = (id) v17[5];
  }
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __66__CoreTelephonyClient_PNR__isPhoneNumberCredentialValid_outError___block_invoke(uint64_t a1, void *a2)
{
}

void __66__CoreTelephonyClient_PNR__isPhoneNumberCredentialValid_outError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)context:(id)a3 getPhoneNumberSignatureWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__CoreTelephonyClient_PNR__context_getPhoneNumberSignatureWithCompletion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 context:v6 getPhoneNumberSignatureWithCompletion:v8];
}

uint64_t __74__CoreTelephonyClient_PNR__context_getPhoneNumberSignatureWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)context:(id)a3 getPhoneNumberSignature:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__14;
  uint64_t v22 = __Block_byref_object_dispose__14;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__CoreTelephonyClient_PNR__context_getPhoneNumberSignature___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  char v14 = __Block_byref_object_copy__14;
  uint64_t v15 = __Block_byref_object_dispose__14;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__CoreTelephonyClient_PNR__context_getPhoneNumberSignature___block_invoke_2;
  v10[3] = &unk_1E52629C8;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 context:v6 getPhoneNumberSignatureWithCompletion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __60__CoreTelephonyClient_PNR__context_getPhoneNumberSignature___block_invoke(uint64_t a1, void *a2)
{
}

void __60__CoreTelephonyClient_PNR__context_getPhoneNumberSignature___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)context:(id)a3 resetPhoneNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__CoreTelephonyClient_PNR__context_resetPhoneNumber___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 context:v6 resetPhoneNumber:v8];
}

uint64_t __53__CoreTelephonyClient_PNR__context_resetPhoneNumber___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)context:(id)a3 canSetCapability:(id)a4 completion:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__CoreTelephonyClient_Capabilities__context_canSetCapability_completion___block_invoke;
  v5[3] = &unk_1E5264558;
  v5[4] = a5;
  objc_msgSend(-[CoreTelephonyClient proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v5), "context:canSetCapability:completion:", a3, a4, a5);
}

uint64_t __73__CoreTelephonyClient_Capabilities__context_canSetCapability_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)context:(id)a3 canSetCapability:(id)a4 allowed:(BOOL *)a5 with:(id *)a6
{
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3052000000;
  id v21 = __Block_byref_object_copy__15;
  uint64_t v22 = __Block_byref_object_dispose__15;
  uint64_t v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__CoreTelephonyClient_Capabilities__context_canSetCapability_allowed_with___block_invoke;
  v17[3] = &unk_1E52611A0;
  void v17[4] = &v18;
  id v10 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__CoreTelephonyClient_Capabilities__context_canSetCapability_allowed_with___block_invoke_2;
  v16[3] = &unk_1E5264580;
  void v16[5] = a5;
  v16[6] = a6;
  void v16[4] = &v18;
  [v10 context:a3 canSetCapability:a4 completion:v16];
  if (a6) {
    id v11 = *a6;
  }
  id v12 = (void *)v19[5];
  if (v12)
  {
    id v13 = v12;
    char v14 = (void *)v19[5];
  }
  else
  {
    char v14 = 0;
  }
  _Block_object_dispose(&v18, 8);
  return v14;
}

void *__75__CoreTelephonyClient_Capabilities__context_canSetCapability_allowed_with___block_invoke(void *result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
    *(void *)(*(void *)(v2[4] + 8) + 40) = result;
  }
  return result;
}

void *__75__CoreTelephonyClient_Capabilities__context_canSetCapability_allowed_with___block_invoke_2(void *result, char a2, void *a3, void *a4)
{
  id v5 = result;
  id v6 = (unsigned char *)result[5];
  if (v6) {
    unsigned char *v6 = a2;
  }
  if (result[6])
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a3;
    *(void *)v5[6] = result;
  }
  if (a4)
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a4;
    *(void *)(*(void *)(v5[4] + 8) + 40) = result;
  }
  return result;
}

- (void)context:(id)a3 getCapability:(id)a4 completion:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__CoreTelephonyClient_Capabilities__context_getCapability_completion___block_invoke;
  v5[3] = &unk_1E5264558;
  v5[4] = a5;
  objc_msgSend(-[CoreTelephonyClient proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v5), "context:getCapability:completion:", a3, a4, a5);
}

uint64_t __70__CoreTelephonyClient_Capabilities__context_getCapability_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)context:(id)a3 getCapability:(id)a4 status:(BOOL *)a5 with:(id *)a6
{
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3052000000;
  id v21 = __Block_byref_object_copy__15;
  uint64_t v22 = __Block_byref_object_dispose__15;
  uint64_t v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__CoreTelephonyClient_Capabilities__context_getCapability_status_with___block_invoke;
  v17[3] = &unk_1E52611A0;
  void v17[4] = &v18;
  id v10 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__CoreTelephonyClient_Capabilities__context_getCapability_status_with___block_invoke_2;
  v16[3] = &unk_1E5264580;
  void v16[5] = a5;
  v16[6] = a6;
  void v16[4] = &v18;
  [v10 context:a3 getCapability:a4 completion:v16];
  if (a6) {
    id v11 = *a6;
  }
  id v12 = (void *)v19[5];
  if (v12)
  {
    id v13 = v12;
    char v14 = (void *)v19[5];
  }
  else
  {
    char v14 = 0;
  }
  _Block_object_dispose(&v18, 8);
  return v14;
}

void *__71__CoreTelephonyClient_Capabilities__context_getCapability_status_with___block_invoke(void *result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
    *(void *)(*(void *)(v2[4] + 8) + 40) = result;
  }
  return result;
}

void *__71__CoreTelephonyClient_Capabilities__context_getCapability_status_with___block_invoke_2(void *result, char a2, void *a3, void *a4)
{
  id v5 = result;
  id v6 = (unsigned char *)result[5];
  if (v6) {
    unsigned char *v6 = a2;
  }
  if (result[6])
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a3;
    *(void *)v5[6] = result;
  }
  if (a4)
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a4;
    *(void *)(*(void *)(v5[4] + 8) + 40) = result;
  }
  return result;
}

- (void)context:(id)a3 setCapability:(id)a4 enabled:(BOOL)a5 with:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  id v12 = [(CoreTelephonyClient *)self proxyWithErrorHandler:a7];

  [v12 context:a3 setCapability:a4 enabled:v9 info:a6 completion:a7];
}

- (id)context:(id)a3 setCapability:(id)a4 enabled:(BOOL)a5 with:(id)a6
{
  BOOL v7 = a5;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3052000000;
  uint64_t v20 = __Block_byref_object_copy__15;
  id v21 = __Block_byref_object_dispose__15;
  uint64_t v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__CoreTelephonyClient_Capabilities__context_setCapability_enabled_with___block_invoke;
  v16[3] = &unk_1E52611A0;
  void v16[4] = &v17;
  id v10 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __72__CoreTelephonyClient_Capabilities__context_setCapability_enabled_with___block_invoke_2;
  v15[3] = &unk_1E52611A0;
  void v15[4] = &v17;
  [v10 context:a3 setCapability:a4 enabled:v7 info:a6 completion:v15];
  id v11 = (void *)v18[5];
  if (v11)
  {
    id v12 = v11;
    id v13 = (void *)v18[5];
  }
  else
  {
    id v13 = 0;
  }
  _Block_object_dispose(&v17, 8);
  return v13;
}

void *__72__CoreTelephonyClient_Capabilities__context_setCapability_enabled_with___block_invoke(void *result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
    *(void *)(*(void *)(v2[4] + 8) + 40) = result;
  }
  return result;
}

void *__72__CoreTelephonyClient_Capabilities__context_setCapability_enabled_with___block_invoke_2(void *result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
    *(void *)(*(void *)(v2[4] + 8) + 40) = result;
  }
  return result;
}

- (void)context:(id)a3 getSystemCapabilitiesWithCompletion:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__CoreTelephonyClient_Capabilities__context_getSystemCapabilitiesWithCompletion___block_invoke;
  v4[3] = &unk_1E5264558;
  v4[4] = a4;
  objc_msgSend(-[CoreTelephonyClient proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v4), "context:getSystemCapabilities:", a3, a4);
}

uint64_t __81__CoreTelephonyClient_Capabilities__context_getSystemCapabilitiesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)context:(id)a3 getSystemCapabilities:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3052000000;
  uint64_t v17 = __Block_byref_object_copy__15;
  uint64_t v18 = __Block_byref_object_dispose__15;
  uint64_t v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__CoreTelephonyClient_Capabilities__context_getSystemCapabilities___block_invoke;
  v13[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v13[4] = a4;
  id v6 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__CoreTelephonyClient_Capabilities__context_getSystemCapabilities___block_invoke_2;
  v12[3] = &unk_1E52645C8;
  void v12[4] = &v14;
  void v12[5] = a4;
  [v6 context:a3 getSystemCapabilities:v12];
  BOOL v7 = (void *)v15[5];
  if (v7) {
    id v8 = v7;
  }
  if (a4 && *a4) {
    id v9 = *a4;
  }
  id v10 = (void *)v15[5];
  _Block_object_dispose(&v14, 8);
  return v10;
}

void *__67__CoreTelephonyClient_Capabilities__context_getSystemCapabilities___block_invoke(void *result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    if (result[4])
    {
      $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
      *(void *)v2[4] = result;
    }
  }
  return result;
}

void *__67__CoreTelephonyClient_Capabilities__context_getSystemCapabilities___block_invoke_2(void *result, void *a2, void *a3)
{
  id v4 = result;
  if (a2)
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
    *(void *)(*(void *)(v4[4] + 8) + 40) = result;
  }
  if (v4[5])
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a3;
    *(void *)void v4[5] = result;
  }
  return result;
}

- (id)getSupports5G:(id)a3 error:(id *)a4
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3052000000;
  uint64_t v20 = __Block_byref_object_copy__15;
  id v21 = __Block_byref_object_dispose__15;
  uint64_t v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__CoreTelephonyClient_Capabilities__getSupports5G_error___block_invoke;
  v16[3] = &unk_1E52611A0;
  void v16[4] = &v17;
  id v6 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v16];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3052000000;
  id v13 = __Block_byref_object_copy__15;
  uint64_t v14 = __Block_byref_object_dispose__15;
  uint64_t v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__CoreTelephonyClient_Capabilities__getSupports5G_error___block_invoke_2;
  v9[3] = &unk_1E5261A28;
  void v9[4] = &v17;
  void v9[5] = &v10;
  [v6 getSupports5G:a3 completion:v9];
  if (a4) {
    *a4 = (id)v18[5];
  }
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void *__57__CoreTelephonyClient_Capabilities__getSupports5G_error___block_invoke(void *result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
    *(void *)(*(void *)(v2[4] + 8) + 40) = result;
  }
  return result;
}

void *__57__CoreTelephonyClient_Capabilities__getSupports5G_error___block_invoke_2(void *result, void *a2, void *a3)
{
  id v4 = result;
  if (a3)
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a3;
    *(void *)(*(void *)(v4[4] + 8) + 40) = result;
  }
  if (a2)
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
    *(void *)(*(void *)(v4[5] + 8) + 40) = result;
  }
  return result;
}

- (id)context:(id)a3 recheckPhoneServicesAccountStatus:(id)a4
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__15;
  uint64_t v17 = __Block_byref_object_dispose__15;
  uint64_t v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__CoreTelephonyClient_Capabilities__context_recheckPhoneServicesAccountStatus___block_invoke;
  v12[3] = &unk_1E52611A0;
  void v12[4] = &v13;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__CoreTelephonyClient_Capabilities__context_recheckPhoneServicesAccountStatus___block_invoke_2;
  v11[3] = &unk_1E52611A0;
  void v11[4] = &v13;
  [v6 context:a3 recheckPhoneServicesAccountStatus:a4 completion:v11];
  id v7 = (void *)v14[5];
  if (v7)
  {
    id v8 = v7;
    id v9 = (void *)v14[5];
  }
  else
  {
    id v9 = 0;
  }
  _Block_object_dispose(&v13, 8);
  return v9;
}

void *__79__CoreTelephonyClient_Capabilities__context_recheckPhoneServicesAccountStatus___block_invoke(void *result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
    *(void *)(*(void *)(v2[4] + 8) + 40) = result;
  }
  return result;
}

void *__79__CoreTelephonyClient_Capabilities__context_recheckPhoneServicesAccountStatus___block_invoke_2(void *result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
    *(void *)(*(void *)(v2[4] + 8) + 40) = result;
  }
  return result;
}

- (void)getPhoneServicesDeviceListWithCompletion:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__CoreTelephonyClient_Capabilities__getPhoneServicesDeviceListWithCompletion___block_invoke;
  v3[3] = &unk_1E5264558;
  v3[4] = a3;
  objc_msgSend(-[CoreTelephonyClient proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v3), "getPhoneServicesDeviceList:", a3);
}

uint64_t __78__CoreTelephonyClient_Capabilities__getPhoneServicesDeviceListWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getPhoneServicesDeviceList:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3052000000;
  uint64_t v15 = __Block_byref_object_copy__15;
  uint64_t v16 = __Block_byref_object_dispose__15;
  uint64_t v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__CoreTelephonyClient_Capabilities__getPhoneServicesDeviceList___block_invoke;
  v11[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v11[4] = a3;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__CoreTelephonyClient_Capabilities__getPhoneServicesDeviceList___block_invoke_2;
  v10[3] = &unk_1E52645C8;
  void v10[4] = &v12;
  void v10[5] = a3;
  [v4 getPhoneServicesDeviceList:v10];
  id v5 = (void *)v13[5];
  if (v5) {
    id v6 = v5;
  }
  if (a3 && *a3) {
    id v7 = *a3;
  }
  id v8 = (void *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v8;
}

void *__64__CoreTelephonyClient_Capabilities__getPhoneServicesDeviceList___block_invoke(void *result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    if (result[4])
    {
      $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
      *(void *)v2[4] = result;
    }
  }
  return result;
}

void *__64__CoreTelephonyClient_Capabilities__getPhoneServicesDeviceList___block_invoke_2(void *result, void *a2, void *a3)
{
  id v4 = result;
  if (a2)
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
    *(void *)(*(void *)(v4[4] + 8) + 40) = result;
  }
  if (v4[5])
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a3;
    *(void *)void v4[5] = result;
  }
  return result;
}

- (void)getPhoneServicesDeviceInfoWithCompletion:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__CoreTelephonyClient_Capabilities__getPhoneServicesDeviceInfoWithCompletion___block_invoke;
  v3[3] = &unk_1E5264558;
  v3[4] = a3;
  objc_msgSend(-[CoreTelephonyClient proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v3), "getPhoneServicesDeviceInfo:", a3);
}

uint64_t __78__CoreTelephonyClient_Capabilities__getPhoneServicesDeviceInfoWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getPhoneServicesDeviceInfo:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3052000000;
  uint64_t v15 = __Block_byref_object_copy__15;
  uint64_t v16 = __Block_byref_object_dispose__15;
  uint64_t v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__CoreTelephonyClient_Capabilities__getPhoneServicesDeviceInfo___block_invoke;
  v11[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v11[4] = a3;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__CoreTelephonyClient_Capabilities__getPhoneServicesDeviceInfo___block_invoke_2;
  v10[3] = &unk_1E52645C8;
  void v10[4] = &v12;
  void v10[5] = a3;
  [v4 getPhoneServicesDeviceInfo:v10];
  id v5 = (void *)v13[5];
  if (v5) {
    id v6 = v5;
  }
  if (a3 && *a3) {
    id v7 = *a3;
  }
  id v8 = (void *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v8;
}

void *__64__CoreTelephonyClient_Capabilities__getPhoneServicesDeviceInfo___block_invoke(void *result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    if (result[4])
    {
      $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
      *(void *)v2[4] = result;
    }
  }
  return result;
}

void *__64__CoreTelephonyClient_Capabilities__getPhoneServicesDeviceInfo___block_invoke_2(void *result, void *a2, void *a3)
{
  id v4 = result;
  if (a2)
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
    *(void *)(*(void *)(v4[4] + 8) + 40) = result;
  }
  if (v4[5])
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a3;
    *(void *)void v4[5] = result;
  }
  return result;
}

- (void)context:(id)a3 addPhoneServicesDevice:(id)a4 withCompletion:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__CoreTelephonyClient_Capabilities__context_addPhoneServicesDevice_withCompletion___block_invoke;
  v5[3] = &unk_1E5264558;
  v5[4] = a5;
  objc_msgSend(-[CoreTelephonyClient proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v5), "context:addPhoneServicesDevice:withCompletion:", a3, a4, a5);
}

uint64_t __83__CoreTelephonyClient_Capabilities__context_addPhoneServicesDevice_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)context:(id)a3 addPhoneServicesDevice:(id)a4
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__15;
  uint64_t v17 = __Block_byref_object_dispose__15;
  uint64_t v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__CoreTelephonyClient_Capabilities__context_addPhoneServicesDevice___block_invoke;
  v12[3] = &unk_1E52611A0;
  void v12[4] = &v13;
  id v6 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__CoreTelephonyClient_Capabilities__context_addPhoneServicesDevice___block_invoke_2;
  v11[3] = &unk_1E52611A0;
  void v11[4] = &v13;
  [v6 context:a3 addPhoneServicesDevice:a4 withCompletion:v11];
  id v7 = (void *)v14[5];
  if (v7)
  {
    id v8 = v7;
    id v9 = (void *)v14[5];
  }
  else
  {
    id v9 = 0;
  }
  _Block_object_dispose(&v13, 8);
  return v9;
}

void *__68__CoreTelephonyClient_Capabilities__context_addPhoneServicesDevice___block_invoke(void *result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
    *(void *)(*(void *)(v2[4] + 8) + 40) = result;
  }
  return result;
}

void *__68__CoreTelephonyClient_Capabilities__context_addPhoneServicesDevice___block_invoke_2(void *result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
    *(void *)(*(void *)(v2[4] + 8) + 40) = result;
  }
  return result;
}

- (void)context:(id)a3 removePhoneServicesDevice:(id)a4 withCompletion:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__CoreTelephonyClient_Capabilities__context_removePhoneServicesDevice_withCompletion___block_invoke;
  v5[3] = &unk_1E5264558;
  v5[4] = a5;
  objc_msgSend(-[CoreTelephonyClient proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v5), "context:removePhoneServicesDevice:withCompletion:", a3, a4, a5);
}

uint64_t __86__CoreTelephonyClient_Capabilities__context_removePhoneServicesDevice_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)context:(id)a3 removePhoneServicesDevice:(id)a4
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__15;
  uint64_t v17 = __Block_byref_object_dispose__15;
  uint64_t v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__CoreTelephonyClient_Capabilities__context_removePhoneServicesDevice___block_invoke;
  v12[3] = &unk_1E52611A0;
  void v12[4] = &v13;
  id v6 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__CoreTelephonyClient_Capabilities__context_removePhoneServicesDevice___block_invoke_2;
  v11[3] = &unk_1E52611A0;
  void v11[4] = &v13;
  [v6 context:a3 removePhoneServicesDevice:a4 withCompletion:v11];
  id v7 = (void *)v14[5];
  if (v7)
  {
    id v8 = v7;
    id v9 = (void *)v14[5];
  }
  else
  {
    id v9 = 0;
  }
  _Block_object_dispose(&v13, 8);
  return v9;
}

void *__71__CoreTelephonyClient_Capabilities__context_removePhoneServicesDevice___block_invoke(void *result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
    *(void *)(*(void *)(v2[4] + 8) + 40) = result;
  }
  return result;
}

void *__71__CoreTelephonyClient_Capabilities__context_removePhoneServicesDevice___block_invoke_2(void *result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
    *(void *)(*(void *)(v2[4] + 8) + 40) = result;
  }
  return result;
}

- (id)wifiCallingCTFollowUpComplete:(id)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint64_t v14 = __Block_byref_object_copy__15;
  uint64_t v15 = __Block_byref_object_dispose__15;
  uint64_t v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__CoreTelephonyClient_Capabilities__wifiCallingCTFollowUpComplete___block_invoke;
  v10[3] = &unk_1E52611A0;
  void v10[4] = &v11;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__CoreTelephonyClient_Capabilities__wifiCallingCTFollowUpComplete___block_invoke_2;
  v9[3] = &unk_1E52611A0;
  void v9[4] = &v11;
  [v4 wifiCallingCTFollowUpComplete:a3 withCompletion:v9];
  id v5 = (void *)v12[5];
  if (v5)
  {
    id v6 = v5;
    id v7 = (void *)v12[5];
  }
  else
  {
    id v7 = 0;
  }
  _Block_object_dispose(&v11, 8);
  return v7;
}

void *__67__CoreTelephonyClient_Capabilities__wifiCallingCTFollowUpComplete___block_invoke(void *result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
    *(void *)(*(void *)(v2[4] + 8) + 40) = result;
  }
  return result;
}

void *__67__CoreTelephonyClient_Capabilities__wifiCallingCTFollowUpComplete___block_invoke_2(void *result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
    *(void *)(*(void *)(v2[4] + 8) + 40) = result;
  }
  return result;
}

- (id)context:(id)a3 mandatoryDisableVoLTE:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__15;
  uint64_t v17 = __Block_byref_object_dispose__15;
  uint64_t v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__CoreTelephonyClient_Capabilities__context_mandatoryDisableVoLTE___block_invoke;
  v12[3] = &unk_1E52611A0;
  void v12[4] = &v13;
  id v6 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__CoreTelephonyClient_Capabilities__context_mandatoryDisableVoLTE___block_invoke_2;
  v11[3] = &unk_1E52611A0;
  void v11[4] = &v13;
  [v6 context:a3 mandatoryDisableVoLTE:v4 withCompletion:v11];
  id v7 = (void *)v14[5];
  if (v7)
  {
    id v8 = v7;
    id v9 = (void *)v14[5];
  }
  else
  {
    id v9 = 0;
  }
  _Block_object_dispose(&v13, 8);
  return v9;
}

void *__67__CoreTelephonyClient_Capabilities__context_mandatoryDisableVoLTE___block_invoke(void *result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
    *(void *)(*(void *)(v2[4] + 8) + 40) = result;
  }
  return result;
}

void *__67__CoreTelephonyClient_Capabilities__context_mandatoryDisableVoLTE___block_invoke_2(void *result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
    *(void *)(*(void *)(v2[4] + 8) + 40) = result;
  }
  return result;
}

- (BOOL)context:(id)a3 isMandatoryDisabledVoLTE:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__CoreTelephonyClient_Capabilities__context_isMandatoryDisabledVoLTE___block_invoke;
  v11[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v11[4] = a4;
  id v6 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__CoreTelephonyClient_Capabilities__context_isMandatoryDisabledVoLTE___block_invoke_2;
  v10[3] = &unk_1E52645F0;
  void v10[4] = &v12;
  void v10[5] = a4;
  [v6 context:a3 isMandatoryDisabledVoLTE:v10];
  if (a4 && *a4) {
    id v7 = *a4;
  }
  char v8 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v8;
}

void *__70__CoreTelephonyClient_Capabilities__context_isMandatoryDisabledVoLTE___block_invoke(void *result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    if (result[4])
    {
      $0AC6E346AE4835514AAA8AC86D8F4844 result = a2;
      *(void *)v2[4] = result;
    }
  }
  return result;
}

void *__70__CoreTelephonyClient_Capabilities__context_isMandatoryDisabledVoLTE___block_invoke_2(void *result, char a2, void *a3)
{
  uint64_t v3 = result[5];
  *(unsigned char *)(*(void *)(result[4] + 8) + 24) = a2;
  if (v3)
  {
    BOOL v4 = result;
    $0AC6E346AE4835514AAA8AC86D8F4844 result = a3;
    *(void *)void v4[5] = result;
  }
  return result;
}

uint64_t __43__CoreTelephonyClient_getSubscriptionInfo___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __52__CoreTelephonyClient_getSubscriptionInfoWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __44__CoreTelephonyClient_getDualSimCapability___block_invoke(uint64_t a1, void *a2)
{
}

- (void)getDescriptorsForDomain:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__CoreTelephonyClient_getDescriptorsForDomain_completion___block_invoke;
  v9[3] = &unk_1E5260CB8;
  id v7 = v6;
  id v10 = v7;
  char v8 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v9];
  [v8 getDescriptorsForDomain:a3 completion:v7];
}

uint64_t __58__CoreTelephonyClient_getDescriptorsForDomain_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getDescriptorsForDomain:(int64_t)a3 error:(id *)a4
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__16;
  id v21 = __Block_byref_object_dispose__16;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__CoreTelephonyClient_getDescriptorsForDomain_error___block_invoke;
  v16[3] = &unk_1E5260BA0;
  void v16[4] = &v17;
  id v6 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v16];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__16;
  uint64_t v14 = __Block_byref_object_dispose__16;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__CoreTelephonyClient_getDescriptorsForDomain_error___block_invoke_2;
  v9[3] = &unk_1E52647F0;
  void v9[4] = &v17;
  void v9[5] = &v10;
  [v6 getDescriptorsForDomain:a3 completion:v9];
  if (a4) {
    *a4 = (id) v18[5];
  }
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v17, 8);

  return v7;
}

void __53__CoreTelephonyClient_getDescriptorsForDomain_error___block_invoke(uint64_t a1, void *a2)
{
}

void __53__CoreTelephonyClient_getDescriptorsForDomain_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)getReleaseCandidateFlag
{
  uint64_t v2 = [NSNumber numberWithBool:0];

  return v2;
}

- (id)getAllowDevSignedCarrierBundlesFlag
{
  uint64_t v2 = [NSNumber numberWithBool:0];

  return v2;
}

uint64_t __53__CoreTelephonyClient_getActiveContextsWithCallback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __41__CoreTelephonyClient_getActiveContexts___block_invoke(uint64_t a1, void *a2)
{
}

- (void)getEvolvedSubscriptionLabelID:(id)a3 withCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__CoreTelephonyClient_getEvolvedSubscriptionLabelID_withCallback___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 getEvolvedSubscriptionLabelID:v6 withCallback:v8];
}

uint64_t __66__CoreTelephonyClient_getEvolvedSubscriptionLabelID_withCallback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getEvolvedSubscriptionLabelID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__16;
  id v22 = __Block_byref_object_dispose__16;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__CoreTelephonyClient_getEvolvedSubscriptionLabelID_error___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__16;
  id v15 = __Block_byref_object_dispose__16;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__CoreTelephonyClient_getEvolvedSubscriptionLabelID_error___block_invoke_2;
  v10[3] = &unk_1E5261AC0;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 getEvolvedSubscriptionLabelID:v6 withCallback:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __59__CoreTelephonyClient_getEvolvedSubscriptionLabelID_error___block_invoke(uint64_t a1, void *a2)
{
}

void __59__CoreTelephonyClient_getEvolvedSubscriptionLabelID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)ping:(id)a3
{
  id v5 = a3;
  BOOL v4 = -[CoreTelephonyClient proxyWithErrorHandler:](self, "proxyWithErrorHandler:");
  [v4 ping:v5];
}

- (void)dispatchBlockToClientAsync:(id)a3
{
}

- (__CTAssertionType)createCTAssertionForConnectionType:(int)a3 allocator:(__CFAllocator *)a4 proxy:(id)a5
{
  return [(CoreTelephonyClientMux *)self->_mux createCTAssertionForConnectionType:*(void *)&a3 allocator:a4 proxy:a5];
}

- (void)registerBlockForInvalidationNotification:(__CTAssertionType *)a3 callback:(id)a4
{
  id v6 = a4;
  fObj = self->_userQueue.fObj.fObj;
  mux = self->_mux;
  dispatch_object_t object = fObj;
  if (fObj) {
    dispatch_retain(fObj);
  }
  [(CoreTelephonyClientMux *)mux registerBlockForInvalidationNotification:a3 callbackQueue:&object callback:v6];
  if (object) {
    dispatch_release(object);
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (queue)userQueue
{
  fObj = self->_userQueue.fObj.fObj;
  *uint64_t v2 = fObj;
  if (fObj) {
    dispatch_retain(fObj);
  }
  return (queue)fObj;
}

- (void)setUserQueue:(queue)a3
{
  BOOL v4 = *(dispatch_object_s **)a3.fObj.fObj;
  if (*(void *)a3.fObj.fObj) {
    dispatch_retain(*(dispatch_object_t *)a3.fObj.fObj);
  }
  fObj = self->_userQueue.fObj.fObj;
  self->_userQueue.fObj.fObj = v4;
  if (fObj)
  {
    dispatch_release(fObj);
  }
}

- (CoreTelephonyClientMux)mux
{
  return self->_mux;
}

- (void)setMux:(id)a3
{
}

- (id)dispatchBlockToClientAsync:(id *)a1
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {

    MEMORY[0x18531F680](v2, 0x80C40B8603338);
  }
  return a1;
}

- (id)dispatchBlockToClientAsync:(dispatch_queue_s *)
{
  uint64_t v2 = a1;
  (*((void (**)(void))*a1 + 2))();
  return std::unique_ptr<-[CoreTelephonyClient dispatchBlockToClientAsync:]::$_0>::~unique_ptr[abi:nn180100](&v2);
}

- (void)copyRegistrationStatus:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__CoreTelephonyClient_Registration__copyRegistrationStatus_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  uint64_t v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetRegistrationStatusRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__CoreTelephonyClient_Registration__copyRegistrationStatus_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __71__CoreTelephonyClient_Registration__copyRegistrationStatus_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__CoreTelephonyClient_Registration__copyRegistrationStatus_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 status];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

void __66__CoreTelephonyClient_Registration__copyRegistrationStatus_error___block_invoke(uint64_t a1, void *a2)
{
}

- (void)copyRegistrationDisplayStatus:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __78__CoreTelephonyClient_Registration__copyRegistrationDisplayStatus_completion___block_invoke_2;
    v15[3] = &unk_1E5260CB8;
    id v9 = v8;
    id v16 = v9;
    uint64_t v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v15];
    id v11 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetRegistrationDisplayStatusRequest alloc] initWithContext:v7];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __78__CoreTelephonyClient_Registration__copyRegistrationDisplayStatus_completion___block_invoke_3;
    v13[3] = &unk_1E5263180;
    id v14 = v9;
    [v10 sendRequest:v11 completionHandler:v13];
    id v12 = &v16;
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __78__CoreTelephonyClient_Registration__copyRegistrationDisplayStatus_completion___block_invoke;
    v17[3] = &unk_1E5260D00;
    id v18 = v8;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v17];
    id v12 = &v18;
  }
}

void __78__CoreTelephonyClient_Registration__copyRegistrationDisplayStatus_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

uint64_t __78__CoreTelephonyClient_Registration__copyRegistrationDisplayStatus_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__CoreTelephonyClient_Registration__copyRegistrationDisplayStatus_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 status];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (id)copyRegistrationDisplayStatus:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = __Block_byref_object_copy__17;
    id v24 = __Block_byref_object_dispose__17;
    id v25 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73__CoreTelephonyClient_Registration__copyRegistrationDisplayStatus_error___block_invoke;
    v19[3] = &unk_1E5260BA0;
    void v19[4] = &v20;
    id v8 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v19];
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy__17;
    uint64_t v17 = __Block_byref_object_dispose__17;
    id v18 = 0;
    id v9 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetRegistrationDisplayStatusRequest alloc] initWithContext:v7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __73__CoreTelephonyClient_Registration__copyRegistrationDisplayStatus_error___block_invoke_2;
    v12[3] = &unk_1E5261A78;
    void v12[4] = &v20;
    void v12[5] = &v13;
    [v8 sendRequest:v9 completionHandler:v12];
    if (a4) {
      *a4 = (id) v21[5];
    }
    id v10 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v20, 8);
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    id v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __73__CoreTelephonyClient_Registration__copyRegistrationDisplayStatus_error___block_invoke(uint64_t a1, void *a2)
{
}

void __73__CoreTelephonyClient_Registration__copyRegistrationDisplayStatus_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v10 = [v9 status];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (void)copyServingPlmn:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__CoreTelephonyClient_Registration__copyServingPlmn_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  uint64_t v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetServingPlmnRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__CoreTelephonyClient_Registration__copyServingPlmn_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __64__CoreTelephonyClient_Registration__copyServingPlmn_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__CoreTelephonyClient_Registration__copyServingPlmn_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 plmn];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (id)copyServingPlmn:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__17;
  id v23 = __Block_byref_object_dispose__17;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __59__CoreTelephonyClient_Registration__copyServingPlmn_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  void v18[4] = &v19;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__17;
  id v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  id v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetServingPlmnRequest alloc] initWithContext:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__CoreTelephonyClient_Registration__copyServingPlmn_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  void v11[4] = &v19;
  void v11[5] = &v12;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __59__CoreTelephonyClient_Registration__copyServingPlmn_error___block_invoke(uint64_t a1, void *a2)
{
}

void __59__CoreTelephonyClient_Registration__copyServingPlmn_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v10 = [v9 plmn];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

uint64_t __70__CoreTelephonyClient_Registration__copyMobileCountryCode_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__CoreTelephonyClient_Registration__copyMobileCountryCode_error___block_invoke(uint64_t a1, void *a2)
{
}

- (void)copyLastKnownMobileCountryCode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__CoreTelephonyClient_Registration__copyLastKnownMobileCountryCode_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  uint64_t v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetLastKnownMobileCountryCodeRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__CoreTelephonyClient_Registration__copyLastKnownMobileCountryCode_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __79__CoreTelephonyClient_Registration__copyLastKnownMobileCountryCode_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__CoreTelephonyClient_Registration__copyLastKnownMobileCountryCode_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 mcc];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (id)copyLastKnownMobileCountryCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__17;
  id v23 = __Block_byref_object_dispose__17;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__CoreTelephonyClient_Registration__copyLastKnownMobileCountryCode_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  void v18[4] = &v19;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__17;
  id v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  id v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetLastKnownMobileCountryCodeRequest alloc] initWithContext:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__CoreTelephonyClient_Registration__copyLastKnownMobileCountryCode_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  void v11[4] = &v19;
  void v11[5] = &v12;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __74__CoreTelephonyClient_Registration__copyLastKnownMobileCountryCode_error___block_invoke(uint64_t a1, void *a2)
{
}

void __74__CoreTelephonyClient_Registration__copyLastKnownMobileCountryCode_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v10 = [v9 mcc];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

void __70__CoreTelephonyClient_Registration__copyMobileNetworkCode_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

uint64_t __70__CoreTelephonyClient_Registration__copyMobileNetworkCode_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)copyMobileNetworkCode:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = __Block_byref_object_copy__17;
    id v24 = __Block_byref_object_dispose__17;
    id v25 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __65__CoreTelephonyClient_Registration__copyMobileNetworkCode_error___block_invoke;
    v19[3] = &unk_1E5260BA0;
    void v19[4] = &v20;
    id v8 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v19];
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy__17;
    id v17 = __Block_byref_object_dispose__17;
    id v18 = 0;
    id v9 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetMobileNetworkCodeRequest alloc] initWithContext:v7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__CoreTelephonyClient_Registration__copyMobileNetworkCode_error___block_invoke_2;
    v12[3] = &unk_1E5261A78;
    void v12[4] = &v20;
    void v12[5] = &v13;
    [v8 sendRequest:v9 completionHandler:v12];
    if (a4) {
      *a4 = (id) v21[5];
    }
    id v10 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v20, 8);
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    id v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __65__CoreTelephonyClient_Registration__copyMobileNetworkCode_error___block_invoke(uint64_t a1, void *a2)
{
}

void __65__CoreTelephonyClient_Registration__copyMobileNetworkCode_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v10 = [v9 mnc];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (void)copyIsInHomeCountry:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __68__CoreTelephonyClient_Registration__copyIsInHomeCountry_completion___block_invoke_2;
    v15[3] = &unk_1E5260CB8;
    id v9 = v8;
    id v16 = v9;
    uint64_t v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v15];
    uint64_t v11 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetIsInHomeCountryRequest alloc] initWithContext:v7];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__CoreTelephonyClient_Registration__copyIsInHomeCountry_completion___block_invoke_3;
    v13[3] = &unk_1E5263180;
    id v14 = v9;
    [v10 sendRequest:v11 completionHandler:v13];
    uint64_t v12 = &v16;
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__CoreTelephonyClient_Registration__copyIsInHomeCountry_completion___block_invoke;
    v17[3] = &unk_1E5260D00;
    id v18 = v8;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v17];
    uint64_t v12 = &v18;
  }
}

void __68__CoreTelephonyClient_Registration__copyIsInHomeCountry_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

uint64_t __68__CoreTelephonyClient_Registration__copyIsInHomeCountry_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__CoreTelephonyClient_Registration__copyIsInHomeCountry_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v10 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v10;
    id v8 = v10;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v10;
  }

  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v9 isHome], v6);
}

- (id)copyIsInHomeCountry:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = __Block_byref_object_copy__17;
    id v24 = __Block_byref_object_dispose__17;
    id v25 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __63__CoreTelephonyClient_Registration__copyIsInHomeCountry_error___block_invoke;
    v19[3] = &unk_1E5260BA0;
    void v19[4] = &v20;
    id v8 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v19];
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy__17;
    id v17 = __Block_byref_object_dispose__17;
    id v18 = 0;
    id v9 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetIsInHomeCountryRequest alloc] initWithContext:v7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__CoreTelephonyClient_Registration__copyIsInHomeCountry_error___block_invoke_2;
    v12[3] = &unk_1E5261A78;
    void v12[4] = &v20;
    void v12[5] = &v13;
    [v8 sendRequest:v9 completionHandler:v12];
    if (a4) {
      *a4 = (id) v21[5];
    }
    id v10 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v20, 8);
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    id v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __63__CoreTelephonyClient_Registration__copyIsInHomeCountry_error___block_invoke(uint64_t a1, void *a2)
{
}

void __63__CoreTelephonyClient_Registration__copyIsInHomeCountry_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (v9)
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "isHome"));
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (void)getRoamingStatus:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __65__CoreTelephonyClient_Registration__getRoamingStatus_completion___block_invoke_2;
    v15[3] = &unk_1E5260CB8;
    id v9 = v8;
    id v16 = v9;
    uint64_t v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v15];
    uint64_t v11 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetRoamingStatusRequest alloc] initWithContext:v7];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__CoreTelephonyClient_Registration__getRoamingStatus_completion___block_invoke_3;
    v13[3] = &unk_1E5263180;
    id v14 = v9;
    [v10 sendRequest:v11 completionHandler:v13];
    uint64_t v12 = &v16;
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__CoreTelephonyClient_Registration__getRoamingStatus_completion___block_invoke;
    v17[3] = &unk_1E5260D00;
    id v18 = v8;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v17];
    uint64_t v12 = &v18;
  }
}

void __65__CoreTelephonyClient_Registration__getRoamingStatus_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

uint64_t __65__CoreTelephonyClient_Registration__getRoamingStatus_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__CoreTelephonyClient_Registration__getRoamingStatus_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = [v9 status];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (id)getRoamingStatus:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = __Block_byref_object_copy__17;
    id v24 = __Block_byref_object_dispose__17;
    id v25 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __60__CoreTelephonyClient_Registration__getRoamingStatus_error___block_invoke;
    v19[3] = &unk_1E5260BA0;
    void v19[4] = &v20;
    id v8 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v19];
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy__17;
    id v17 = __Block_byref_object_dispose__17;
    id v18 = 0;
    id v9 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetRoamingStatusRequest alloc] initWithContext:v7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__CoreTelephonyClient_Registration__getRoamingStatus_error___block_invoke_2;
    v12[3] = &unk_1E5261A78;
    void v12[4] = &v20;
    void v12[5] = &v13;
    [v8 sendRequest:v9 completionHandler:v12];
    if (a4) {
      *a4 = (id) v21[5];
    }
    id v10 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v20, 8);
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
    id v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __60__CoreTelephonyClient_Registration__getRoamingStatus_error___block_invoke(uint64_t a1, void *a2)
{
}

void __60__CoreTelephonyClient_Registration__getRoamingStatus_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v10 = [v9 status];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (void)copyIsDataAttached:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__CoreTelephonyClient_Registration__copyIsDataAttached_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  uint64_t v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetIsDataAttachedRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__CoreTelephonyClient_Registration__copyIsDataAttached_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __67__CoreTelephonyClient_Registration__copyIsDataAttached_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__CoreTelephonyClient_Registration__copyIsDataAttached_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v10 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v10;
    id v8 = v10;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v10;
  }

  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v9 isDataAttached], v6);
}

- (void)copyOperatorName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__CoreTelephonyClient_Registration__copyOperatorName_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  id v10 = [[CTXPCGetOperatorNameRequest alloc] initWithContext:v6 type:0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__CoreTelephonyClient_Registration__copyOperatorName_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __65__CoreTelephonyClient_Registration__copyOperatorName_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__CoreTelephonyClient_Registration__copyOperatorName_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 operatorName];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

void __59__CoreTelephonyClient_Registration__getOperatorName_error___block_invoke(uint64_t a1, void *a2)
{
}

- (void)copyLocalizedOperatorName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__CoreTelephonyClient_Registration__copyLocalizedOperatorName_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  uint64_t v10 = [[CTXPCGetOperatorNameRequest alloc] initWithContext:v6 type:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__CoreTelephonyClient_Registration__copyLocalizedOperatorName_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __74__CoreTelephonyClient_Registration__copyLocalizedOperatorName_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__CoreTelephonyClient_Registration__copyLocalizedOperatorName_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 operatorName];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (id)getLocalizedOperatorName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__17;
  id v23 = __Block_byref_object_dispose__17;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__CoreTelephonyClient_Registration__getLocalizedOperatorName_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  void v18[4] = &v19;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__17;
  id v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  id v8 = [[CTXPCGetOperatorNameRequest alloc] initWithContext:v6 type:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__CoreTelephonyClient_Registration__getLocalizedOperatorName_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  void v11[4] = &v19;
  void v11[5] = &v12;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __68__CoreTelephonyClient_Registration__getLocalizedOperatorName_error___block_invoke(uint64_t a1, void *a2)
{
}

void __68__CoreTelephonyClient_Registration__getLocalizedOperatorName_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v10 = [v9 operatorName];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (id)getNRStatus:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__17;
  id v23 = __Block_byref_object_dispose__17;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __55__CoreTelephonyClient_Registration__getNRStatus_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  void v18[4] = &v19;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__17;
  id v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  id v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetNRStatusRequest alloc] initWithDescriptor:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__CoreTelephonyClient_Registration__getNRStatus_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  void v11[4] = &v19;
  void v11[5] = &v12;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __55__CoreTelephonyClient_Registration__getNRStatus_error___block_invoke(uint64_t a1, void *a2)
{
}

void __55__CoreTelephonyClient_Registration__getNRStatus_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v10 = [v9 nrStatus];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (id)getSupports5GStandalone:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__17;
  id v23 = __Block_byref_object_dispose__17;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__CoreTelephonyClient_Registration__getSupports5GStandalone_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  void v18[4] = &v19;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__17;
  id v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  id v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetSupports5GStandaloneRequest alloc] initWithDescriptor:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__CoreTelephonyClient_Registration__getSupports5GStandalone_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  void v11[4] = &v19;
  void v11[5] = &v12;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __67__CoreTelephonyClient_Registration__getSupports5GStandalone_error___block_invoke(uint64_t a1, void *a2)
{
}

void __67__CoreTelephonyClient_Registration__getSupports5GStandalone_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (v9)
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "support"));
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (id)setSupports5GStandalone:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__17;
  id v17 = __Block_byref_object_dispose__17;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__CoreTelephonyClient_Registration__setSupports5GStandalone_enabled___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  id v8 = [[CTXPCSetSupports5GStandaloneRequest alloc] initWithDescriptor:v6 enabled:v4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__CoreTelephonyClient_Registration__setSupports5GStandalone_enabled___block_invoke_2;
  v11[3] = &unk_1E5261A50;
  void v11[4] = &v13;
  [v7 sendRequest:v8 completionHandler:v11];
  id v9 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v9;
}

void __69__CoreTelephonyClient_Registration__setSupports5GStandalone_enabled___block_invoke(uint64_t a1, void *a2)
{
}

void __69__CoreTelephonyClient_Registration__setSupports5GStandalone_enabled___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (void)copyRadioAccessTechnology:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__CoreTelephonyClient_Registration__copyRadioAccessTechnology_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  uint64_t v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetRadioAccessTechnologyRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__CoreTelephonyClient_Registration__copyRadioAccessTechnology_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __74__CoreTelephonyClient_Registration__copyRadioAccessTechnology_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__CoreTelephonyClient_Registration__copyRadioAccessTechnology_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 rat];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (id)copyRadioAccessTechnology:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__17;
  id v23 = __Block_byref_object_dispose__17;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69__CoreTelephonyClient_Registration__copyRadioAccessTechnology_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  void v18[4] = &v19;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__17;
  id v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  id v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetRadioAccessTechnologyRequest alloc] initWithContext:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__CoreTelephonyClient_Registration__copyRadioAccessTechnology_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  void v11[4] = &v19;
  void v11[5] = &v12;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __69__CoreTelephonyClient_Registration__copyRadioAccessTechnology_error___block_invoke(uint64_t a1, void *a2)
{
}

void __69__CoreTelephonyClient_Registration__copyRadioAccessTechnology_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v10 = [v9 rat];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (void)copyWirelessTechnology:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__CoreTelephonyClient_Registration__copyWirelessTechnology_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  uint64_t v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetWirelessTechnologyRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__CoreTelephonyClient_Registration__copyWirelessTechnology_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __71__CoreTelephonyClient_Registration__copyWirelessTechnology_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__CoreTelephonyClient_Registration__copyWirelessTechnology_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 technology];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (void)copyAbbreviatedOperatorName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__CoreTelephonyClient_Registration__copyAbbreviatedOperatorName_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  uint64_t v10 = [[CTXPCGetOperatorNameRequest alloc] initWithContext:v6 type:2];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__CoreTelephonyClient_Registration__copyAbbreviatedOperatorName_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __76__CoreTelephonyClient_Registration__copyAbbreviatedOperatorName_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__CoreTelephonyClient_Registration__copyAbbreviatedOperatorName_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 operatorName];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (void)getRatSelection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__CoreTelephonyClient_Registration__getRatSelection_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  uint64_t v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetRatSelectionRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__CoreTelephonyClient_Registration__getRatSelection_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __64__CoreTelephonyClient_Registration__getRatSelection_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__CoreTelephonyClient_Registration__getRatSelection_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v14 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v14;
    id v8 = v14;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v14;
  }

  if (v6)
  {
    uint64_t v10 = 0;
    id v11 = 0;
  }
  else
  {
    id v12 = [v9 selection];
    uint64_t v10 = [v12 selection];

    id v13 = [v9 selection];
    id v11 = [v13 preferred];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getRatSelectionMask:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__17;
  id v23 = __Block_byref_object_dispose__17;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __63__CoreTelephonyClient_Registration__getRatSelectionMask_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  void v18[4] = &v19;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__17;
  id v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  id v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetRatSelectionRequest alloc] initWithDescriptor:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__CoreTelephonyClient_Registration__getRatSelectionMask_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  void v11[4] = &v19;
  void v11[5] = &v12;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __63__CoreTelephonyClient_Registration__getRatSelectionMask_error___block_invoke(uint64_t a1, void *a2)
{
}

void __63__CoreTelephonyClient_Registration__getRatSelectionMask_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v10 = [v9 selection];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (void)setRatSelection:(id)a3 selection:(id)a4 preferred:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = v13;
  if (v11)
  {
    id v15 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
    id v16 = [[CTXPCSetRatSelectionRequest alloc] initWithContext:v10 selection:v11 preferred:v12];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __84__CoreTelephonyClient_Registration__setRatSelection_selection_preferred_completion___block_invoke_2;
    v17[3] = &unk_1E5263180;
    id v18 = v14;
    [v15 sendRequest:v16 completionHandler:v17];
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __84__CoreTelephonyClient_Registration__setRatSelection_selection_preferred_completion___block_invoke;
    v19[3] = &unk_1E5260D00;
    id v20 = v13;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v19];
    id v15 = v20;
  }
}

void __84__CoreTelephonyClient_Registration__setRatSelection_selection_preferred_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

uint64_t __84__CoreTelephonyClient_Registration__setRatSelection_selection_preferred_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)setRatSelectionMask:(id)a3 selection:(unsigned __int8)a4 preferred:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__17;
  uint64_t v19 = __Block_byref_object_dispose__17;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__CoreTelephonyClient_Registration__setRatSelectionMask_selection_preferred___block_invoke;
  v14[3] = &unk_1E5260BA0;
  void v14[4] = &v15;
  id v9 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v14];
  id v10 = [[CTXPCSetRatSelectionMaskRequest alloc] initWithDescriptor:v8 selection:v6 preferred:v5];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__CoreTelephonyClient_Registration__setRatSelectionMask_selection_preferred___block_invoke_2;
  v13[3] = &unk_1E5261A50;
  void v13[4] = &v15;
  [v9 sendRequest:v10 completionHandler:v13];
  id v11 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v11;
}

void __77__CoreTelephonyClient_Registration__setRatSelectionMask_selection_preferred___block_invoke(uint64_t a1, void *a2)
{
}

void __77__CoreTelephonyClient_Registration__setRatSelectionMask_selection_preferred___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (void)copyBandInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__CoreTelephonyClient_Registration__copyBandInfo_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  id v10 = [[CTXPCGetBandInfoRequest alloc] initWithContext:v6 type:0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__CoreTelephonyClient_Registration__copyBandInfo_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __61__CoreTelephonyClient_Registration__copyBandInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__CoreTelephonyClient_Registration__copyBandInfo_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 bandMasks];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (void)setBandInfo:(id)a3 bands:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  id v12 = [[CTXPCSetActiveBandInfoRequest alloc] initWithContext:v8 type:0 bands:v9];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__CoreTelephonyClient_Registration__setBandInfo_bands_completion___block_invoke;
  v14[3] = &unk_1E5263180;
  id v13 = v10;
  id v15 = v13;
  [v11 sendRequest:v12 completionHandler:v14];
}

uint64_t __66__CoreTelephonyClient_Registration__setBandInfo_bands_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getBandInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__17;
  id v23 = __Block_byref_object_dispose__17;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __55__CoreTelephonyClient_Registration__getBandInfo_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  void v18[4] = &v19;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__17;
  id v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  id v8 = [[CTXPCGetBandInfoRequest alloc] initWithContext:v6 type:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__CoreTelephonyClient_Registration__getBandInfo_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  void v11[4] = &v19;
  void v11[5] = &v12;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __55__CoreTelephonyClient_Registration__getBandInfo_error___block_invoke(uint64_t a1, void *a2)
{
}

void __55__CoreTelephonyClient_Registration__getBandInfo_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v10 = [v9 bandInfo];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (void)setActiveBandInfo:(id)a3 bands:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__17;
  id v18 = __Block_byref_object_dispose__17;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__CoreTelephonyClient_Registration__setActiveBandInfo_bands_error___block_invoke;
  v13[3] = &unk_1E5260BA0;
  void v13[4] = &v14;
  uint64_t v10 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v13];
  uint64_t v11 = [[CTXPCSetActiveBandInfoRequest alloc] initWithContext:v8 type:1 bandInfo:v9];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__CoreTelephonyClient_Registration__setActiveBandInfo_bands_error___block_invoke_2;
  v12[3] = &unk_1E5261A50;
  void v12[4] = &v14;
  [v10 sendRequest:v11 completionHandler:v12];
  if (a5) {
    *a5 = (id) v15[5];
  }

  _Block_object_dispose(&v14, 8);
}

void __67__CoreTelephonyClient_Registration__setActiveBandInfo_bands_error___block_invoke(uint64_t a1, void *a2)
{
}

void __67__CoreTelephonyClient_Registration__setActiveBandInfo_bands_error___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (void)getSignalStrengthInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__CoreTelephonyClient_Registration__getSignalStrengthInfo_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  uint64_t v10 = [[CTXPCGetSignalStrengthInfoRequest alloc] initWithContext:v6 forPublic:0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__CoreTelephonyClient_Registration__getSignalStrengthInfo_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __70__CoreTelephonyClient_Registration__getSignalStrengthInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__CoreTelephonyClient_Registration__getSignalStrengthInfo_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 signalInfo];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (id)getSignalStrengthInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__17;
  id v24 = __Block_byref_object_dispose__17;
  id v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__CoreTelephonyClient_Registration__getSignalStrengthInfo_error___block_invoke;
  v19[3] = &unk_1E5260BA0;
  void v19[4] = &v20;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v19];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__17;
  id v17 = __Block_byref_object_dispose__17;
  id v18 = 0;
  id v8 = [[CTXPCGetSignalStrengthInfoRequest alloc] initWithContext:v6 forPublic:0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__CoreTelephonyClient_Registration__getSignalStrengthInfo_error___block_invoke_2;
  v12[3] = &unk_1E5261A78;
  void v12[4] = &v20;
  void v12[5] = &v13;
  [v7 sendRequest:v8 completionHandler:v12];
  if (a4)
  {
    id v9 = (void *)v21[5];
    if (v9) {
      *a4 = v9;
    }
  }
  id v10 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __65__CoreTelephonyClient_Registration__getSignalStrengthInfo_error___block_invoke(uint64_t a1, void *a2)
{
}

void __65__CoreTelephonyClient_Registration__getSignalStrengthInfo_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v10 = [v9 signalInfo];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (void)getVoiceLinkQualityMetric:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__CoreTelephonyClient_Registration__getVoiceLinkQualityMetric_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  uint64_t v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetVoiceLinkQualityMetricRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__CoreTelephonyClient_Registration__getVoiceLinkQualityMetric_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __74__CoreTelephonyClient_Registration__getVoiceLinkQualityMetric_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__CoreTelephonyClient_Registration__getVoiceLinkQualityMetric_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 linkQuality];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (void)getEnhancedVoiceLinkQualityMetric:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__CoreTelephonyClient_Registration__getEnhancedVoiceLinkQualityMetric_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  uint64_t v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetEnhancedVoiceLinkQualityMetricRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__CoreTelephonyClient_Registration__getEnhancedVoiceLinkQualityMetric_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __82__CoreTelephonyClient_Registration__getEnhancedVoiceLinkQualityMetric_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__CoreTelephonyClient_Registration__getEnhancedVoiceLinkQualityMetric_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 linkQuality];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (void)copyRejectCauseCode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__CoreTelephonyClient_Registration__copyRejectCauseCode_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  uint64_t v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetRejectCauseCodeRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__CoreTelephonyClient_Registration__copyRejectCauseCode_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __68__CoreTelephonyClient_Registration__copyRejectCauseCode_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__CoreTelephonyClient_Registration__copyRejectCauseCode_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 causeCode];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (id)getRejectCauseCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__17;
  id v23 = __Block_byref_object_dispose__17;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__CoreTelephonyClient_Registration__getRejectCauseCode_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  void v18[4] = &v19;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__17;
  uint64_t v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  id v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetRejectCauseCodeRequest alloc] initWithContext:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__CoreTelephonyClient_Registration__getRejectCauseCode_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  void v11[4] = &v19;
  void v11[5] = &v12;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __62__CoreTelephonyClient_Registration__getRejectCauseCode_error___block_invoke(uint64_t a1, void *a2)
{
}

void __62__CoreTelephonyClient_Registration__getRejectCauseCode_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v10 = [v9 causeCode];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (void)copyRegistrationAgentStatus:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__CoreTelephonyClient_Registration__copyRegistrationAgentStatus_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  uint64_t v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetIMSRegistrationStatusRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__CoreTelephonyClient_Registration__copyRegistrationAgentStatus_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __76__CoreTelephonyClient_Registration__copyRegistrationAgentStatus_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__CoreTelephonyClient_Registration__copyRegistrationAgentStatus_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v14 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v14;
    id v8 = v14;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v14;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 status];
  uint64_t v12 = [v11 isRegisteredForVoice];
  id v13 = [v9 status];
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v10 + 16))(v10, v12, [v13 isRegisteredForSMS], v6);
}

- (void)getIMSRegistrationStatus:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__CoreTelephonyClient_Registration__getIMSRegistrationStatus_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  uint64_t v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetIMSRegistrationStatusRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__CoreTelephonyClient_Registration__getIMSRegistrationStatus_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __73__CoreTelephonyClient_Registration__getIMSRegistrationStatus_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__CoreTelephonyClient_Registration__getIMSRegistrationStatus_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 status];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (id)getIMSRegistrationStatus:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__17;
  id v23 = __Block_byref_object_dispose__17;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__CoreTelephonyClient_Registration__getIMSRegistrationStatus_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  void v18[4] = &v19;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__17;
  uint64_t v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  id v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetIMSRegistrationStatusRequest alloc] initWithContext:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__CoreTelephonyClient_Registration__getIMSRegistrationStatus_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  void v11[4] = &v19;
  void v11[5] = &v12;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __68__CoreTelephonyClient_Registration__getIMSRegistrationStatus_error___block_invoke(uint64_t a1, void *a2)
{
}

void __68__CoreTelephonyClient_Registration__getIMSRegistrationStatus_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v10 = [v9 status];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (void)copyRegistrationIMSTransportInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__CoreTelephonyClient_Registration__copyRegistrationIMSTransportInfo_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  uint64_t v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetRegistrationIMSTransportInfoRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__CoreTelephonyClient_Registration__copyRegistrationIMSTransportInfo_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __81__CoreTelephonyClient_Registration__copyRegistrationIMSTransportInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__CoreTelephonyClient_Registration__copyRegistrationIMSTransportInfo_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 info];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (void)setMaxDataRate:(id)a3 rate:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v9];
  id v11 = [[CTXPCSetMaxDataRateRequest alloc] initWithContext:v8 rate:a4];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__CoreTelephonyClient_Registration__setMaxDataRate_rate_completion___block_invoke;
  v13[3] = &unk_1E5263180;
  id v12 = v9;
  id v14 = v12;
  [v10 sendRequest:v11 completionHandler:v13];
}

uint64_t __68__CoreTelephonyClient_Registration__setMaxDataRate_rate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)setMaxDataRate:(id)a3 rate:(int64_t)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__17;
  id v17 = __Block_byref_object_dispose__17;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__CoreTelephonyClient_Registration__setMaxDataRate_rate___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  id v8 = [[CTXPCSetMaxDataRateRequest alloc] initWithContext:v6 rate:a4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__CoreTelephonyClient_Registration__setMaxDataRate_rate___block_invoke_2;
  v11[3] = &unk_1E5261A50;
  void v11[4] = &v13;
  [v7 sendRequest:v8 completionHandler:v11];
  id v9 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v9;
}

void __57__CoreTelephonyClient_Registration__setMaxDataRate_rate___block_invoke(uint64_t a1, void *a2)
{
}

void __57__CoreTelephonyClient_Registration__setMaxDataRate_rate___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (void)getMaxDataRate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__CoreTelephonyClient_Registration__getMaxDataRate_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  uint64_t v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetMaxDataRateRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__CoreTelephonyClient_Registration__getMaxDataRate_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __63__CoreTelephonyClient_Registration__getMaxDataRate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__CoreTelephonyClient_Registration__getMaxDataRate_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v10 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v10;
    id v8 = v10;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v10;
  }

  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v9 rate], v6);
}

- (int64_t)getMaxDataRate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__17;
  uint64_t v21 = __Block_byref_object_dispose__17;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__CoreTelephonyClient_Registration__getMaxDataRate_error___block_invoke;
  v16[3] = &unk_1E5260BA0;
  void v16[4] = &v17;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v16];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetMaxDataRateRequest alloc] initWithContext:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__CoreTelephonyClient_Registration__getMaxDataRate_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  void v11[4] = &v17;
  void v11[5] = &v12;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v18[5];
  }
  int64_t v9 = v13[3];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v17, 8);

  return v9;
}

void __58__CoreTelephonyClient_Registration__getMaxDataRate_error___block_invoke(uint64_t a1, void *a2)
{
}

void __58__CoreTelephonyClient_Registration__getMaxDataRate_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v10 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v10;
    id v8 = v10;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v10;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (v9) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v9 rate];
  }
}

- (void)getSupportedDataRates:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__CoreTelephonyClient_Registration__getSupportedDataRates_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  id v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetSupportedDataRatesRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__CoreTelephonyClient_Registration__getSupportedDataRates_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __70__CoreTelephonyClient_Registration__getSupportedDataRates_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__CoreTelephonyClient_Registration__getSupportedDataRates_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 rates];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (id)getSupportedDataRates:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__17;
  id v23 = __Block_byref_object_dispose__17;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__CoreTelephonyClient_Registration__getSupportedDataRates_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  void v18[4] = &v19;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__17;
  uint64_t v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  id v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetSupportedDataRatesRequest alloc] initWithContext:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__CoreTelephonyClient_Registration__getSupportedDataRates_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  void v11[4] = &v19;
  void v11[5] = &v12;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __65__CoreTelephonyClient_Registration__getSupportedDataRates_error___block_invoke(uint64_t a1, void *a2)
{
}

void __65__CoreTelephonyClient_Registration__getSupportedDataRates_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v10 = [v9 rates];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (void)get2GSwitchEnabled:(id)a3
{
  id v4 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__CoreTelephonyClient_Registration__get2GSwitchEnabled___block_invoke;
  v12[3] = &unk_1E5260CB8;
  id v5 = v4;
  id v13 = v5;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v12];
  id v7 = [CTXPCGet2GSwitchEnabledRequest alloc];
  id v8 = [(CTXPCMessage *)v7 initWithNamedArguments:MEMORY[0x1E4F1CC08]];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__CoreTelephonyClient_Registration__get2GSwitchEnabled___block_invoke_2;
  v10[3] = &unk_1E5263180;
  id v9 = v5;
  id v11 = v9;
  [v6 sendRequest:v8 completionHandler:v10];
}

uint64_t __56__CoreTelephonyClient_Registration__get2GSwitchEnabled___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__CoreTelephonyClient_Registration__get2GSwitchEnabled___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v10 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v10;
    id v8 = v10;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v10;
  }

  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v9 enabled], v6);
}

- (BOOL)get2GSwitchEnabledSync:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__17;
  uint64_t v19 = __Block_byref_object_dispose__17;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__CoreTelephonyClient_Registration__get2GSwitchEnabledSync___block_invoke;
  v14[3] = &unk_1E5260BA0;
  void v14[4] = &v15;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v14];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v5 = [CTXPCGet2GSwitchEnabledRequest alloc];
  id v6 = [(CTXPCMessage *)v5 initWithNamedArguments:MEMORY[0x1E4F1CC08]];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__CoreTelephonyClient_Registration__get2GSwitchEnabledSync___block_invoke_2;
  v9[3] = &unk_1E5261A78;
  void v9[4] = &v15;
  void v9[5] = &v10;
  [v4 sendRequest:v6 completionHandler:v9];
  if (a3) {
    *a3 = (id) v16[5];
  }
  char v7 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __60__CoreTelephonyClient_Registration__get2GSwitchEnabledSync___block_invoke(uint64_t a1, void *a2)
{
}

void __60__CoreTelephonyClient_Registration__get2GSwitchEnabledSync___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v10 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v10;
    id v8 = v10;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v10;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v9 enabled];
}

- (void)get2GUserPreference:(id)a3
{
  id v4 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__CoreTelephonyClient_Registration__get2GUserPreference___block_invoke;
  v12[3] = &unk_1E5260CB8;
  id v5 = v4;
  id v13 = v5;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v12];
  id v7 = [CTXPCGet2GUserPreferenceRequest alloc];
  id v8 = [(CTXPCMessage *)v7 initWithNamedArguments:MEMORY[0x1E4F1CC08]];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__CoreTelephonyClient_Registration__get2GUserPreference___block_invoke_2;
  v10[3] = &unk_1E5263180;
  id v9 = v5;
  id v11 = v9;
  [v6 sendRequest:v8 completionHandler:v10];
}

uint64_t __57__CoreTelephonyClient_Registration__get2GUserPreference___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__CoreTelephonyClient_Registration__get2GUserPreference___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v10 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v10;
    id v8 = v10;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v10;
  }

  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v9 enabled], v6);
}

- (BOOL)get2GUserPreferenceSync:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__17;
  uint64_t v19 = __Block_byref_object_dispose__17;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__CoreTelephonyClient_Registration__get2GUserPreferenceSync___block_invoke;
  v14[3] = &unk_1E5260BA0;
  void v14[4] = &v15;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v14];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v5 = [CTXPCGet2GUserPreferenceRequest alloc];
  id v6 = [(CTXPCMessage *)v5 initWithNamedArguments:MEMORY[0x1E4F1CC08]];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__CoreTelephonyClient_Registration__get2GUserPreferenceSync___block_invoke_2;
  v9[3] = &unk_1E5261A78;
  void v9[4] = &v15;
  void v9[5] = &v10;
  [v4 sendRequest:v6 completionHandler:v9];
  if (a3) {
    *a3 = (id) v16[5];
  }
  char v7 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __61__CoreTelephonyClient_Registration__get2GUserPreferenceSync___block_invoke(uint64_t a1, void *a2)
{
}

void __61__CoreTelephonyClient_Registration__get2GUserPreferenceSync___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v10 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v10;
    id v8 = v10;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v10;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v9 enabled];
}

- (void)set2GUserPreference:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__CoreTelephonyClient_Registration__set2GUserPreference_completion___block_invoke;
  v13[3] = &unk_1E5260CB8;
  id v7 = v6;
  id v14 = v7;
  id v8 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  id v9 = [[CTXPCSet2GUserPreferenceRequest alloc] initWithEnable:v4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__CoreTelephonyClient_Registration__set2GUserPreference_completion___block_invoke_2;
  v11[3] = &unk_1E5263180;
  id v10 = v7;
  id v12 = v10;
  [v8 sendRequest:v9 completionHandler:v11];
}

uint64_t __68__CoreTelephonyClient_Registration__set2GUserPreference_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__CoreTelephonyClient_Registration__set2GUserPreference_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchNetworkList:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  id v9 = [(CTXPCSubscriptionContextRequest *)[CTXPCFetchNetworkListRequest alloc] initWithContext:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__CoreTelephonyClient_Registration__fetchNetworkList_completion___block_invoke;
  v11[3] = &unk_1E5263180;
  id v10 = v7;
  id v12 = v10;
  [v8 sendRequest:v9 completionHandler:v11];
}

uint64_t __65__CoreTelephonyClient_Registration__fetchNetworkList_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)copyNetworkList:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__CoreTelephonyClient_Registration__copyNetworkList_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  id v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetNetworkListRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__CoreTelephonyClient_Registration__copyNetworkList_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __64__CoreTelephonyClient_Registration__copyNetworkList_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__CoreTelephonyClient_Registration__copyNetworkList_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 networks];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (void)automaticallySelectNetwork:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  id v9 = [(CTXPCSubscriptionContextRequest *)[CTXPCSelectNetworkRequest alloc] initWithContext:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__CoreTelephonyClient_Registration__automaticallySelectNetwork_completion___block_invoke;
  v11[3] = &unk_1E5263180;
  id v10 = v7;
  id v12 = v10;
  [v8 sendRequest:v9 completionHandler:v11];
}

uint64_t __75__CoreTelephonyClient_Registration__automaticallySelectNetwork_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)selectNetwork:(id)a3 network:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  id v12 = [[CTXPCSelectNetworkRequest alloc] initWithContext:v8 network:v9];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__CoreTelephonyClient_Registration__selectNetwork_network_completion___block_invoke;
  v14[3] = &unk_1E5263180;
  id v13 = v10;
  id v15 = v13;
  [v11 sendRequest:v12 completionHandler:v14];
}

uint64_t __70__CoreTelephonyClient_Registration__selectNetwork_network_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)copyNetworkSelection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__CoreTelephonyClient_Registration__copyNetworkSelection_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  id v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetNetworkSelectionRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__CoreTelephonyClient_Registration__copyNetworkSelection_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __69__CoreTelephonyClient_Registration__copyNetworkSelection_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__CoreTelephonyClient_Registration__copyNetworkSelection_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 network];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (void)isNetworkSelectionMenuAvailable:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__CoreTelephonyClient_Registration__isNetworkSelectionMenuAvailable_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  uint64_t v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetIsNetworkSelectionMenuAvailableRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__CoreTelephonyClient_Registration__isNetworkSelectionMenuAvailable_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __80__CoreTelephonyClient_Registration__isNetworkSelectionMenuAvailable_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__CoreTelephonyClient_Registration__isNetworkSelectionMenuAvailable_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v10 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v10;
    id v8 = v10;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v10;
  }

  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v9 available], v6);
}

- (id)isNetworkSelectionMenuAvailable:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__17;
  id v23 = __Block_byref_object_dispose__17;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__CoreTelephonyClient_Registration__isNetworkSelectionMenuAvailable_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  void v18[4] = &v19;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__17;
  uint64_t v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  id v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetIsNetworkSelectionMenuAvailableRequest alloc] initWithContext:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__CoreTelephonyClient_Registration__isNetworkSelectionMenuAvailable_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  void v11[4] = &v19;
  void v11[5] = &v12;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __75__CoreTelephonyClient_Registration__isNetworkSelectionMenuAvailable_error___block_invoke(uint64_t a1, void *a2)
{
}

void __75__CoreTelephonyClient_Registration__isNetworkSelectionMenuAvailable_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (!v5)
  {
    id v6 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "available"));
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (void)copyNetworkSelectionMode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__CoreTelephonyClient_Registration__copyNetworkSelectionMode_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  uint64_t v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  id v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetNetworkSelectionInfoRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__CoreTelephonyClient_Registration__copyNetworkSelectionMode_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __73__CoreTelephonyClient_Registration__copyNetworkSelectionMode_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__CoreTelephonyClient_Registration__copyNetworkSelectionMode_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 info];
  uint64_t v12 = CTNetworkSelectionModeToNetworkSelectionModeString([v11 selectionMode]);
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v12, v6);
}

- (void)copyNetworkSelectionInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__CoreTelephonyClient_Registration__copyNetworkSelectionInfo_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  uint64_t v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetNetworkSelectionInfoRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__CoreTelephonyClient_Registration__copyNetworkSelectionInfo_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __73__CoreTelephonyClient_Registration__copyNetworkSelectionInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__CoreTelephonyClient_Registration__copyNetworkSelectionInfo_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 info];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (id)copyNetworkSelectionInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__17;
  id v23 = __Block_byref_object_dispose__17;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__CoreTelephonyClient_Registration__copyNetworkSelectionInfo_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  void v18[4] = &v19;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__17;
  uint64_t v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  id v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetNetworkSelectionInfoRequest alloc] initWithContext:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__CoreTelephonyClient_Registration__copyNetworkSelectionInfo_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  void v11[4] = &v19;
  void v11[5] = &v12;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __68__CoreTelephonyClient_Registration__copyNetworkSelectionInfo_error___block_invoke(uint64_t a1, void *a2)
{
}

void __68__CoreTelephonyClient_Registration__copyNetworkSelectionInfo_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v10 = [v9 info];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (void)isNetworkReselectionNeeded:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__CoreTelephonyClient_Registration__isNetworkReselectionNeeded_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  uint64_t v10 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetIsNetworkReselectionNeededRequest alloc] initWithContext:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__CoreTelephonyClient_Registration__isNetworkReselectionNeeded_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __75__CoreTelephonyClient_Registration__isNetworkReselectionNeeded_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75__CoreTelephonyClient_Registration__isNetworkReselectionNeeded_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v10 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v10;
    id v8 = v10;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v10;
  }

  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v9 needsReselection], v6);
}

- (id)getEncryptionStatus:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__17;
  id v23 = __Block_byref_object_dispose__17;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __63__CoreTelephonyClient_Registration__getEncryptionStatus_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  void v18[4] = &v19;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__17;
  uint64_t v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  id v8 = [(CTXPCSubscriptionContextRequest *)[CTXPCGetEncryptionStatusRequest alloc] initWithDescriptor:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__CoreTelephonyClient_Registration__getEncryptionStatus_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  void v11[4] = &v19;
  void v11[5] = &v12;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __63__CoreTelephonyClient_Registration__getEncryptionStatus_error___block_invoke(uint64_t a1, void *a2)
{
}

void __63__CoreTelephonyClient_Registration__getEncryptionStatus_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v10 = [v9 info];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

void __73__CoreTelephonyClient_Registration__getSignalStrengthMeasurements_error___block_invoke(uint64_t a1, void *a2)
{
}

- (void)getSignalStrengthMeasurements:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__CoreTelephonyClient_Registration__getSignalStrengthMeasurements_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  uint64_t v10 = [[CTXPCGetSignalStrengthMeasurementsRequest alloc] initWithDescriptor:v6 synchronous:0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__CoreTelephonyClient_Registration__getSignalStrengthMeasurements_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __78__CoreTelephonyClient_Registration__getSignalStrengthMeasurements_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__CoreTelephonyClient_Registration__getSignalStrengthMeasurements_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 measurements];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (void)triggerKeepaliveWakeupEvent:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__CoreTelephonyClient_Registration__triggerKeepaliveWakeupEvent_completion___block_invoke;
  v13[3] = &unk_1E5260CB8;
  id v7 = v6;
  id v14 = v7;
  id v8 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  id v9 = [[CTXPCTriggerKeepAliveWakeupRequest alloc] initWithNetworkInterfaceType:v4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__CoreTelephonyClient_Registration__triggerKeepaliveWakeupEvent_completion___block_invoke_2;
  v11[3] = &unk_1E5263180;
  id v10 = v7;
  id v12 = v10;
  [v8 sendRequest:v9 completionHandler:v11];
}

uint64_t __76__CoreTelephonyClient_Registration__triggerKeepaliveWakeupEvent_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__CoreTelephonyClient_Registration__triggerKeepaliveWakeupEvent_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getPublicSignalStrength:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__17;
  id v23 = __Block_byref_object_dispose__17;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__CoreTelephonyClient_Registration__getPublicSignalStrength_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  void v18[4] = &v19;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__17;
  uint64_t v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  id v8 = [[CTXPCGetSignalStrengthInfoRequest alloc] initWithDescriptor:v6 forPublic:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__CoreTelephonyClient_Registration__getPublicSignalStrength_error___block_invoke_2;
  v11[3] = &unk_1E5261A78;
  void v11[4] = &v19;
  void v11[5] = &v12;
  [v7 sendRequest:v8 completionHandler:v11];
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __67__CoreTelephonyClient_Registration__getPublicSignalStrength_error___block_invoke(uint64_t a1, void *a2)
{
}

void __67__CoreTelephonyClient_Registration__getPublicSignalStrength_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v13;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v10 = [v9 signalInfo];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

void __57__CoreTelephonyClient_Registration__getCurrentRat_error___block_invoke(uint64_t a1, void *a2)
{
}

- (void)getLocalPolicies:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__CoreTelephonyClient_DataUsagePolicy__getLocalPolicies_completion___block_invoke;
  v13[3] = &unk_1E5261178;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__CoreTelephonyClient_DataUsagePolicy__getLocalPolicies_completion___block_invoke_2;
  v11[3] = &unk_1E52653B0;
  id v12 = v7;
  id v10 = v7;
  [v9 getLocalPolicies:v8 completion:v11];
}

uint64_t __68__CoreTelephonyClient_DataUsagePolicy__getLocalPolicies_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__CoreTelephonyClient_DataUsagePolicy__getLocalPolicies_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 policies];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (id)getLocalPolicies:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__19;
  id v22 = __Block_byref_object_dispose__19;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__CoreTelephonyClient_DataUsagePolicy__getLocalPolicies_error___block_invoke;
  v17[3] = &unk_1E52611A0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__19;
  id v15 = __Block_byref_object_dispose__19;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__CoreTelephonyClient_DataUsagePolicy__getLocalPolicies_error___block_invoke_2;
  v10[3] = &unk_1E52653D8;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 getLocalPolicies:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __63__CoreTelephonyClient_DataUsagePolicy__getLocalPolicies_error___block_invoke(uint64_t a1, void *a2)
{
}

void __63__CoreTelephonyClient_DataUsagePolicy__getLocalPolicies_error___block_invoke_2(uint64_t a1, void *a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v10 = obj;
  id v6 = a2;
  uint64_t v7 = [v6 policies];

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)getRemotePolicies:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__CoreTelephonyClient_DataUsagePolicy__getRemotePolicies_completion___block_invoke;
  v13[3] = &unk_1E5261178;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__CoreTelephonyClient_DataUsagePolicy__getRemotePolicies_completion___block_invoke_2;
  v11[3] = &unk_1E52653B0;
  id v12 = v7;
  id v10 = v7;
  [v9 getRemotePolicies:v8 completion:v11];
}

uint64_t __69__CoreTelephonyClient_DataUsagePolicy__getRemotePolicies_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__CoreTelephonyClient_DataUsagePolicy__getRemotePolicies_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 policies];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)setLocalPolicies:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__CoreTelephonyClient_DataUsagePolicy__setLocalPolicies_completion___block_invoke;
  v11[3] = &unk_1E5261178;
  id v12 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v11];
  id v10 = [[CTDataUsagePoliciesWrapper alloc] initWithPolicies:v8];

  [v9 setLocalPolicies:v10 completion:v7];
}

uint64_t __68__CoreTelephonyClient_DataUsagePolicy__setLocalPolicies_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)setLocalPolicies:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__19;
  id v15 = __Block_byref_object_dispose__19;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__CoreTelephonyClient_DataUsagePolicy__setLocalPolicies___block_invoke;
  v10[3] = &unk_1E52611A0;
  void v10[4] = &v11;
  id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v10];
  id v6 = [[CTDataUsagePoliciesWrapper alloc] initWithPolicies:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__CoreTelephonyClient_DataUsagePolicy__setLocalPolicies___block_invoke_2;
  v9[3] = &unk_1E52611A0;
  void v9[4] = &v11;
  [v5 setLocalPolicies:v6 completion:v9];

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __57__CoreTelephonyClient_DataUsagePolicy__setLocalPolicies___block_invoke(uint64_t a1, void *a2)
{
}

void __57__CoreTelephonyClient_DataUsagePolicy__setLocalPolicies___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)setRemotePolicies:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__CoreTelephonyClient_DataUsagePolicy__setRemotePolicies_completion___block_invoke;
  v11[3] = &unk_1E5261178;
  id v12 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v11];
  id v10 = [[CTDataUsagePoliciesWrapper alloc] initWithPolicies:v8];

  [v9 setRemotePolicies:v10 completion:v7];
}

uint64_t __69__CoreTelephonyClient_DataUsagePolicy__setRemotePolicies_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removePoliciesFromLocalDevice:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__CoreTelephonyClient_DataUsagePolicy__removePoliciesFromLocalDevice_completion___block_invoke;
  v10[3] = &unk_1E5261178;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 removePoliciesFromLocalDevice:v8 completion:v7];
}

uint64_t __81__CoreTelephonyClient_DataUsagePolicy__removePoliciesFromLocalDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performNetworkAccessFlowIfAllowed:(id)a3 ignoreForeground:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102__CoreTelephonyClient_DataUsagePolicy__performNetworkAccessFlowIfAllowed_ignoreForeground_completion___block_invoke;
  v12[3] = &unk_1E5261178;
  id v13 = v8;
  id v9 = v8;
  id v10 = a3;
  id v11 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v12];
  [v11 performNetworkAccessFlowIfAllowed:v10 ignoreForeground:v5 completion:v9];
}

uint64_t __102__CoreTelephonyClient_DataUsagePolicy__performNetworkAccessFlowIfAllowed_ignoreForeground_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setUIConfiguredApns:(id)a3 apns:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__CoreTelephonyClient_DeviceManagement__setUIConfiguredApns_apns_completion___block_invoke;
  v13[3] = &unk_1E5260CB8;
  id v11 = v10;
  id v14 = v11;
  id v12 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  [v12 setUIConfiguredApns:v8 apns:v9 completion:v11];
}

uint64_t __77__CoreTelephonyClient_DeviceManagement__setUIConfiguredApns_apns_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getUIConfiguredApns:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__CoreTelephonyClient_DeviceManagement__getUIConfiguredApns_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 getUIConfiguredApns:v6 completion:v8];
}

uint64_t __72__CoreTelephonyClient_DeviceManagement__getUIConfiguredApns_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getUIConfiguredApns:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__20;
  id v22 = __Block_byref_object_dispose__20;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__CoreTelephonyClient_DeviceManagement__getUIConfiguredApns_error___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__20;
  id v15 = __Block_byref_object_dispose__20;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__CoreTelephonyClient_DeviceManagement__getUIConfiguredApns_error___block_invoke_2;
  v10[3] = &unk_1E52629C8;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 getUIConfiguredApns:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __67__CoreTelephonyClient_DeviceManagement__getUIConfiguredApns_error___block_invoke(uint64_t a1, void *a2)
{
}

void __67__CoreTelephonyClient_DeviceManagement__getUIConfiguredApns_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)resetUIConfiguredApns:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__CoreTelephonyClient_DeviceManagement__resetUIConfiguredApns_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 resetUIConfiguredApns:v6 completion:v8];
}

uint64_t __74__CoreTelephonyClient_DeviceManagement__resetUIConfiguredApns_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getConfiguredApns:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__CoreTelephonyClient_DeviceManagement__getConfiguredApns_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 getConfiguredApns:v6 completion:v8];
}

uint64_t __70__CoreTelephonyClient_DeviceManagement__getConfiguredApns_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getConfiguredApns:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__20;
  id v22 = __Block_byref_object_dispose__20;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__CoreTelephonyClient_DeviceManagement__getConfiguredApns_error___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__20;
  id v15 = __Block_byref_object_dispose__20;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__CoreTelephonyClient_DeviceManagement__getConfiguredApns_error___block_invoke_2;
  v10[3] = &unk_1E5260BF0;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 getConfiguredApns:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __65__CoreTelephonyClient_DeviceManagement__getConfiguredApns_error___block_invoke(uint64_t a1, void *a2)
{
}

void __65__CoreTelephonyClient_DeviceManagement__getConfiguredApns_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (unint64_t)getGSMAUIControlSetting:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__20;
  uint64_t v20 = __Block_byref_object_dispose__20;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __71__CoreTelephonyClient_DeviceManagement__getGSMAUIControlSetting_error___block_invoke;
  v15[3] = &unk_1E5260BA0;
  void v15[4] = &v16;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v15];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__CoreTelephonyClient_DeviceManagement__getGSMAUIControlSetting_error___block_invoke_2;
  v10[3] = &unk_1E5265400;
  void v10[4] = &v16;
  void v10[5] = &v11;
  [v7 getGSMAUIControlSetting:v6 completion:v10];
  if (a4) {
    *a4 = (id) v17[5];
  }
  unint64_t v8 = v12[3];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __71__CoreTelephonyClient_DeviceManagement__getGSMAUIControlSetting_error___block_invoke(uint64_t a1, void *a2)
{
}

void __71__CoreTelephonyClient_DeviceManagement__getGSMAUIControlSetting_error___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (id)loadGSMASettings:(id)a3 state:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__20;
  uint64_t v16 = __Block_byref_object_dispose__20;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__CoreTelephonyClient_DeviceManagement__loadGSMASettings_state___block_invoke;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v12;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__CoreTelephonyClient_DeviceManagement__loadGSMASettings_state___block_invoke_2;
  v10[3] = &unk_1E5260BA0;
  void v10[4] = &v12;
  [v7 loadGSMASettings:v6 state:v4 completion:v10];
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v8;
}

void __64__CoreTelephonyClient_DeviceManagement__loadGSMASettings_state___block_invoke(uint64_t a1, void *a2)
{
}

void __64__CoreTelephonyClient_DeviceManagement__loadGSMASettings_state___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)deletePersonalWallet:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__CoreTelephonyClient_DeviceManagement__deletePersonalWallet_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 deletePersonalWallet:v6 completion:v8];
}

uint64_t __73__CoreTelephonyClient_DeviceManagement__deletePersonalWallet_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)deletePersonalWallet:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__20;
  uint64_t v14 = __Block_byref_object_dispose__20;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__CoreTelephonyClient_DeviceManagement__deletePersonalWallet___block_invoke;
  v9[3] = &unk_1E5260BA0;
  void v9[4] = &v10;
  id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__CoreTelephonyClient_DeviceManagement__deletePersonalWallet___block_invoke_2;
  v8[3] = &unk_1E5260BA0;
  void v8[4] = &v10;
  [v5 deletePersonalWallet:v4 completion:v8];
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v6;
}

void __62__CoreTelephonyClient_DeviceManagement__deletePersonalWallet___block_invoke(uint64_t a1, void *a2)
{
}

void __62__CoreTelephonyClient_DeviceManagement__deletePersonalWallet___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)listPersonalWallets:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__20;
  uint64_t v19 = __Block_byref_object_dispose__20;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__CoreTelephonyClient_DeviceManagement__listPersonalWallets___block_invoke;
  v14[3] = &unk_1E5260BA0;
  void v14[4] = &v15;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v14];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__20;
  uint64_t v12 = __Block_byref_object_dispose__20;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__CoreTelephonyClient_DeviceManagement__listPersonalWallets___block_invoke_2;
  v7[3] = &unk_1E5260BF0;
  void v7[4] = &v15;
  void v7[5] = &v8;
  [v4 listPersonalWallets:v7];
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v15, 8);

  return v5;
}

void __61__CoreTelephonyClient_DeviceManagement__listPersonalWallets___block_invoke(uint64_t a1, void *a2)
{
}

void __61__CoreTelephonyClient_DeviceManagement__listPersonalWallets___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)renamePersonalWallet:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__20;
  uint64_t v17 = __Block_byref_object_dispose__20;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__CoreTelephonyClient_DeviceManagement__renamePersonalWallet_to___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  id v8 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__CoreTelephonyClient_DeviceManagement__renamePersonalWallet_to___block_invoke_2;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v13;
  [v8 renamePersonalWallet:v6 to:v7 completion:v11];
  id v9 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v9;
}

void __65__CoreTelephonyClient_DeviceManagement__renamePersonalWallet_to___block_invoke(uint64_t a1, void *a2)
{
}

void __65__CoreTelephonyClient_DeviceManagement__renamePersonalWallet_to___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)transferPersonalWallet:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__20;
  uint64_t v17 = __Block_byref_object_dispose__20;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__CoreTelephonyClient_DeviceManagement__transferPersonalWallet_to___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  id v8 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__CoreTelephonyClient_DeviceManagement__transferPersonalWallet_to___block_invoke_2;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v13;
  [v8 transferPersonalWallet:v6 to:v7 completion:v11];
  id v9 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v9;
}

void __67__CoreTelephonyClient_DeviceManagement__transferPersonalWallet_to___block_invoke(uint64_t a1, void *a2)
{
}

void __67__CoreTelephonyClient_DeviceManagement__transferPersonalWallet_to___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)getStewieSupport:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__21;
  uint64_t v19 = __Block_byref_object_dispose__21;
  id v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__21;
  uint64_t v13 = __Block_byref_object_dispose__21;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__CoreTelephonyClient_Stewie__getStewieSupport___block_invoke;
  v8[3] = &unk_1E52611A0;
  void v8[4] = &v15;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CoreTelephonyClient_Stewie__getStewieSupport___block_invoke_2;
  v7[3] = &unk_1E5265888;
  void v7[4] = &v9;
  void v7[5] = &v15;
  [v4 getStewieSupport:v7];
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

  return v5;
}

void __48__CoreTelephonyClient_Stewie__getStewieSupport___block_invoke(uint64_t a1, void *a2)
{
}

void __48__CoreTelephonyClient_Stewie__getStewieSupport___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

uint64_t __62__CoreTelephonyClient_Stewie__getStewieSupportWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestStewieWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__CoreTelephonyClient_Stewie__requestStewieWithContext_completion___block_invoke;
  v10[3] = &unk_1E5261178;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 requestStewieWithContext:v8 completion:v7];
}

uint64_t __67__CoreTelephonyClient_Stewie__requestStewieWithContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)exitStewieWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__CoreTelephonyClient_Stewie__exitStewieWithContext_completion___block_invoke;
  v10[3] = &unk_1E5261178;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 exitStewieWithContext:v8 completion:v7];
}

uint64_t __64__CoreTelephonyClient_Stewie__exitStewieWithContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getConnectionAssistantConfig:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__CoreTelephonyClient_Stewie__getConnectionAssistantConfig___block_invoke;
  v7[3] = &unk_1E5261178;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  [v6 getConnectionAssistantConfig:v5];
}

uint64_t __60__CoreTelephonyClient_Stewie__getConnectionAssistantConfig___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getConnectionAssistantConfigWithError:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__21;
  uint64_t v19 = __Block_byref_object_dispose__21;
  id v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__21;
  uint64_t v13 = __Block_byref_object_dispose__21;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__CoreTelephonyClient_Stewie__getConnectionAssistantConfigWithError___block_invoke;
  v8[3] = &unk_1E52611A0;
  void v8[4] = &v15;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__CoreTelephonyClient_Stewie__getConnectionAssistantConfigWithError___block_invoke_2;
  v7[3] = &unk_1E52658B0;
  void v7[4] = &v15;
  void v7[5] = &v9;
  [v4 getConnectionAssistantConfig:v7];
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

  return v5;
}

void __69__CoreTelephonyClient_Stewie__getConnectionAssistantConfigWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __69__CoreTelephonyClient_Stewie__getConnectionAssistantConfigWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (void)getConnectionAssistantState:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__CoreTelephonyClient_Stewie__getConnectionAssistantState___block_invoke;
  v7[3] = &unk_1E5261178;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  [v6 getConnectionAssistantState:v5];
}

uint64_t __59__CoreTelephonyClient_Stewie__getConnectionAssistantState___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getConnectionAssistantStateWithError:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__21;
  uint64_t v19 = __Block_byref_object_dispose__21;
  id v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__21;
  uint64_t v13 = __Block_byref_object_dispose__21;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__CoreTelephonyClient_Stewie__getConnectionAssistantStateWithError___block_invoke;
  v8[3] = &unk_1E52611A0;
  void v8[4] = &v15;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__CoreTelephonyClient_Stewie__getConnectionAssistantStateWithError___block_invoke_2;
  v7[3] = &unk_1E52658D8;
  void v7[4] = &v15;
  void v7[5] = &v9;
  [v4 getConnectionAssistantState:v7];
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

  return v5;
}

void __68__CoreTelephonyClient_Stewie__getConnectionAssistantStateWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __68__CoreTelephonyClient_Stewie__getConnectionAssistantStateWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (void)getConnectionAssistantServicePlot:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__CoreTelephonyClient_Stewie__getConnectionAssistantServicePlot___block_invoke;
  v7[3] = &unk_1E5261178;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  [v6 getConnectionAssistantServicePlot:v5];
}

uint64_t __65__CoreTelephonyClient_Stewie__getConnectionAssistantServicePlot___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getConnectionAssistantServicePlotWithError:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__21;
  uint64_t v19 = __Block_byref_object_dispose__21;
  id v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__21;
  uint64_t v13 = __Block_byref_object_dispose__21;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__CoreTelephonyClient_Stewie__getConnectionAssistantServicePlotWithError___block_invoke;
  v8[3] = &unk_1E52611A0;
  void v8[4] = &v15;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__CoreTelephonyClient_Stewie__getConnectionAssistantServicePlotWithError___block_invoke_2;
  v7[3] = &unk_1E5265900;
  void v7[4] = &v15;
  void v7[5] = &v9;
  [v4 getConnectionAssistantServicePlot:v7];
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

  return v5;
}

void __74__CoreTelephonyClient_Stewie__getConnectionAssistantServicePlotWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __74__CoreTelephonyClient_Stewie__getConnectionAssistantServicePlotWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (void)setStewieBlocked:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__CoreTelephonyClient_Stewie__setStewieBlocked_completion___block_invoke;
  v9[3] = &unk_1E5261178;
  id v10 = v6;
  id v7 = v6;
  id v8 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v9];
  [v8 setStewieBlocked:v4 completion:v7];
}

uint64_t __59__CoreTelephonyClient_Stewie__setStewieBlocked_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)setStewieBlocked:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__21;
  uint64_t v13 = __Block_byref_object_dispose__21;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__CoreTelephonyClient_Stewie__setStewieBlocked___block_invoke;
  v8[3] = &unk_1E52611A0;
  void v8[4] = &v9;
  BOOL v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CoreTelephonyClient_Stewie__setStewieBlocked___block_invoke_2;
  v7[3] = &unk_1E52611A0;
  void v7[4] = &v9;
  [v4 setStewieBlocked:v3 completion:v7];
  id v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v5;
}

void __48__CoreTelephonyClient_Stewie__setStewieBlocked___block_invoke(uint64_t a1, void *a2)
{
}

void __48__CoreTelephonyClient_Stewie__setStewieBlocked___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)reportStewieDeviceOrientation:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__CoreTelephonyClient_Stewie__reportStewieDeviceOrientation_completion___block_invoke;
  v10[3] = &unk_1E5261178;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 reportStewieDeviceOrientation:v8 completion:v7];
}

uint64_t __72__CoreTelephonyClient_Stewie__reportStewieDeviceOrientation_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)reportStewieDeviceOrientation:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__21;
  id v14 = __Block_byref_object_dispose__21;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__CoreTelephonyClient_Stewie__reportStewieDeviceOrientation___block_invoke;
  v9[3] = &unk_1E52611A0;
  void v9[4] = &v10;
  id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__CoreTelephonyClient_Stewie__reportStewieDeviceOrientation___block_invoke_2;
  v8[3] = &unk_1E52611A0;
  void v8[4] = &v10;
  [v5 reportStewieDeviceOrientation:v4 completion:v8];
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v6;
}

void __61__CoreTelephonyClient_Stewie__reportStewieDeviceOrientation___block_invoke(uint64_t a1, void *a2)
{
}

void __61__CoreTelephonyClient_Stewie__reportStewieDeviceOrientation___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)compressWithStewieCodec:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__CoreTelephonyClient_Stewie__compressWithStewieCodec_completion___block_invoke;
  v10[3] = &unk_1E5261178;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 compressWithStewieCodec:v8 completion:v7];
}

uint64_t __66__CoreTelephonyClient_Stewie__compressWithStewieCodec_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)activateStewieEmergencyTryOutWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__CoreTelephonyClient_Stewie__activateStewieEmergencyTryOutWithCompletion___block_invoke;
  v7[3] = &unk_1E5261178;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  [v6 activateStewieEmergencyTryOutWithCompletion:v5];
}

uint64_t __75__CoreTelephonyClient_Stewie__activateStewieEmergencyTryOutWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reportStewieConnectionAssistantEvent:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__CoreTelephonyClient_Stewie__reportStewieConnectionAssistantEvent_completion___block_invoke;
  v10[3] = &unk_1E5261178;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 reportStewieConnectionAssistantEvent:v8 completion:v7];
}

uint64_t __79__CoreTelephonyClient_Stewie__reportStewieConnectionAssistantEvent_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)reportStewieConnectionAssistantEvent:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__21;
  id v14 = __Block_byref_object_dispose__21;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__CoreTelephonyClient_Stewie__reportStewieConnectionAssistantEvent___block_invoke;
  v9[3] = &unk_1E52611A0;
  void v9[4] = &v10;
  id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__CoreTelephonyClient_Stewie__reportStewieConnectionAssistantEvent___block_invoke_2;
  v8[3] = &unk_1E52611A0;
  void v8[4] = &v10;
  [v5 reportStewieConnectionAssistantEvent:v4 completion:v8];
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v6;
}

void __68__CoreTelephonyClient_Stewie__reportStewieConnectionAssistantEvent___block_invoke(uint64_t a1, void *a2)
{
}

void __68__CoreTelephonyClient_Stewie__reportStewieConnectionAssistantEvent___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)testStewieCommand:(id)a3 completion:(id)a4
{
}

- (id)testStewieCommand:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)fetchRoadsideProvidersWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__21;
  id v22 = __Block_byref_object_dispose__21;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__CoreTelephonyClient_Stewie__fetchRoadsideProvidersWithContext_error___block_invoke;
  v17[3] = &unk_1E52611A0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__21;
  id v15 = __Block_byref_object_dispose__21;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__CoreTelephonyClient_Stewie__fetchRoadsideProvidersWithContext_error___block_invoke_2;
  v10[3] = &unk_1E5265928;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 fetchRoadsideProvidersWithContext:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __71__CoreTelephonyClient_Stewie__fetchRoadsideProvidersWithContext_error___block_invoke(uint64_t a1, void *a2)
{
}

void __71__CoreTelephonyClient_Stewie__fetchRoadsideProvidersWithContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (void)fetchRoadsideProvidersWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__CoreTelephonyClient_Stewie__fetchRoadsideProvidersWithContext_completion___block_invoke;
  v10[3] = &unk_1E5261178;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 fetchRoadsideProvidersWithContext:v8 completion:v7];
}

uint64_t __76__CoreTelephonyClient_Stewie__fetchRoadsideProvidersWithContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)selectRoadsideProviderWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__21;
  id v22 = __Block_byref_object_dispose__21;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__CoreTelephonyClient_Stewie__selectRoadsideProviderWithContext_error___block_invoke;
  v17[3] = &unk_1E52611A0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__21;
  id v15 = __Block_byref_object_dispose__21;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__CoreTelephonyClient_Stewie__selectRoadsideProviderWithContext_error___block_invoke_2;
  v10[3] = &unk_1E5265950;
  void v10[4] = &v18;
  void v10[5] = &v11;
  [v7 selectRoadsideProviderWithContext:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __71__CoreTelephonyClient_Stewie__selectRoadsideProviderWithContext_error___block_invoke(uint64_t a1, void *a2)
{
}

void __71__CoreTelephonyClient_Stewie__selectRoadsideProviderWithContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (void)selectRoadsideProviderWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__CoreTelephonyClient_Stewie__selectRoadsideProviderWithContext_completion___block_invoke;
  v10[3] = &unk_1E5261178;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 selectRoadsideProviderWithContext:v8 completion:v7];
}

uint64_t __76__CoreTelephonyClient_Stewie__selectRoadsideProviderWithContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getResumableRoadsideProvider:(id *)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__21;
  uint64_t v19 = __Block_byref_object_dispose__21;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__CoreTelephonyClient_Stewie__getResumableRoadsideProvider___block_invoke;
  v14[3] = &unk_1E52611A0;
  void v14[4] = &v15;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v14];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__21;
  uint64_t v12 = __Block_byref_object_dispose__21;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__CoreTelephonyClient_Stewie__getResumableRoadsideProvider___block_invoke_2;
  v7[3] = &unk_1E5265978;
  void v7[4] = &v15;
  void v7[5] = &v8;
  [v4 getResumableRoadsideProvider:v7];
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v15, 8);

  return v5;
}

void __60__CoreTelephonyClient_Stewie__getResumableRoadsideProvider___block_invoke(uint64_t a1, void *a2)
{
}

void __60__CoreTelephonyClient_Stewie__getResumableRoadsideProvider___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (void)getResumableRoadsideProviderWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__CoreTelephonyClient_Stewie__getResumableRoadsideProviderWithCompletion___block_invoke;
  v7[3] = &unk_1E5261178;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  [v6 getResumableRoadsideProvider:v5];
}

uint64_t __74__CoreTelephonyClient_Stewie__getResumableRoadsideProviderWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isAnyPlanTransferableFromThisDeviceOrError:(id *)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__22;
  uint64_t v18 = __Block_byref_object_dispose__22;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__CoreTelephonyClient_PlanTransfer__isAnyPlanTransferableFromThisDeviceOrError___block_invoke;
  v13[3] = &unk_1E5260BA0;
  void v13[4] = &v14;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v13];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v5 = objc_alloc_init(CTXPCIsAnyPlanTransferableFromThisDeviceRequest);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__CoreTelephonyClient_PlanTransfer__isAnyPlanTransferableFromThisDeviceOrError___block_invoke_2;
  v8[3] = &unk_1E5261A78;
  void v8[4] = &v14;
  void v8[5] = &v9;
  [v4 sendRequest:v5 completionHandler:v8];

  if (a3) {
    *a3 = (id) v15[5];
  }
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v14, 8);
  return v6;
}

void __80__CoreTelephonyClient_PlanTransfer__isAnyPlanTransferableFromThisDeviceOrError___block_invoke(uint64_t a1, void *a2)
{
}

void __80__CoreTelephonyClient_PlanTransfer__isAnyPlanTransferableFromThisDeviceOrError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  char v6 = v5;
  if (v5)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = v5;
    id v9 = *(id *)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }
  else
  {
    id v10 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v10;
    }
    else {
      id v9 = 0;
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v9 result];
  }
}

- (id)bootstrapPlanTransferForEndpoint:(unint64_t)a3
{
  return [(CoreTelephonyClient *)self bootstrapPlanTransferForEndpoint:a3 usingMessageSession:0];
}

- (id)bootstrapPlanTransferForEndpoint:(unint64_t)a3 usingMessageSession:(id)a4
{
  id v6 = a4;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__22;
  uint64_t v16 = __Block_byref_object_dispose__22;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__CoreTelephonyClient_PlanTransfer__bootstrapPlanTransferForEndpoint_usingMessageSession___block_invoke;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v12;
  uint64_t v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__CoreTelephonyClient_PlanTransfer__bootstrapPlanTransferForEndpoint_usingMessageSession___block_invoke_2;
  v10[3] = &unk_1E5260BA0;
  void v10[4] = &v12;
  [v7 bootstrapPlanTransferForEndpoint:a3 usingMessageSession:v6 completion:v10];
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v8;
}

void __90__CoreTelephonyClient_PlanTransfer__bootstrapPlanTransferForEndpoint_usingMessageSession___block_invoke(uint64_t a1, void *a2)
{
}

void __90__CoreTelephonyClient_PlanTransfer__bootstrapPlanTransferForEndpoint_usingMessageSession___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)bootstrapPlanTransferForEndpoint:(unint64_t)a3 usingMessageSession:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __101__CoreTelephonyClient_PlanTransfer__bootstrapPlanTransferForEndpoint_usingMessageSession_completion___block_invoke;
  v12[3] = &unk_1E5260CB8;
  id v10 = v9;
  id v13 = v10;
  id v11 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v12];
  [v11 bootstrapPlanTransferForEndpoint:a3 usingMessageSession:v8 completion:v10];
}

uint64_t __101__CoreTelephonyClient_PlanTransfer__bootstrapPlanTransferForEndpoint_usingMessageSession_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isAnyPlanOfTransferCapability:(unint64_t)a3 availableForThisDeviceWithCompletion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __104__CoreTelephonyClient_PlanTransfer__isAnyPlanOfTransferCapability_availableForThisDeviceWithCompletion___block_invoke;
  v13[3] = &unk_1E5260CB8;
  id v7 = v6;
  id v14 = v7;
  id v8 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  id v9 = [[CTXPCIsAnyPlanOfTransferCapabilityAvailableForThisDeviceRequest alloc] initWithCapability:a3];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __104__CoreTelephonyClient_PlanTransfer__isAnyPlanOfTransferCapability_availableForThisDeviceWithCompletion___block_invoke_2;
  v11[3] = &unk_1E5263180;
  id v10 = v7;
  id v12 = v10;
  [v8 sendRequest:v9 completionHandler:v11];
}

uint64_t __104__CoreTelephonyClient_PlanTransfer__isAnyPlanOfTransferCapability_availableForThisDeviceWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __104__CoreTelephonyClient_PlanTransfer__isAnyPlanOfTransferCapability_availableForThisDeviceWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v11;
    id v9 = v11;
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
    id v9 = v11;
  }

  (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, [v10 result], v6);
}

- (id)endPlanTransferForEndPoint:(unint64_t)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__22;
  id v14 = __Block_byref_object_dispose__22;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__CoreTelephonyClient_PlanTransfer__endPlanTransferForEndPoint___block_invoke;
  v9[3] = &unk_1E5260BA0;
  void v9[4] = &v10;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v9];
  id v5 = [[CTXPCEndPlanTransferRequest alloc] initWithEndpoint:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__CoreTelephonyClient_PlanTransfer__endPlanTransferForEndPoint___block_invoke_2;
  v8[3] = &unk_1E5261A50;
  void v8[4] = &v10;
  [v4 sendRequest:v5 completionHandler:v8];

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __64__CoreTelephonyClient_PlanTransfer__endPlanTransferForEndPoint___block_invoke(uint64_t a1, void *a2)
{
}

void __64__CoreTelephonyClient_PlanTransfer__endPlanTransferForEndPoint___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (void)cancelCellularPlanTransfer:(id)a3 fromDevice:(id)a4 keepCache:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v12) {
    id v13 = v12;
  }
  else {
    id v13 = &__block_literal_global_9;
  }
  if (v10 && v11)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __103__CoreTelephonyClient_PlanTransfer__cancelCellularPlanTransfer_fromDevice_keepCache_completionHandler___block_invoke_2;
    v20[3] = &unk_1E5260CB8;
    id v14 = v13;
    id v21 = v14;
    id v15 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v20];
    if (v15)
    {
      uint64_t v16 = [[CTXPCCancelTransferPlanRequest alloc] initWithPlan:v10 fromDevice:v11 keepCache:v7];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __103__CoreTelephonyClient_PlanTransfer__cancelCellularPlanTransfer_fromDevice_keepCache_completionHandler___block_invoke_3;
      v18[3] = &unk_1E5263180;
      id v19 = v14;
      [v15 sendRequest:v16 completionHandler:v18];
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(void *, void *))v13 + 2))(v13, v17);
  }
}

uint64_t __103__CoreTelephonyClient_PlanTransfer__cancelCellularPlanTransfer_fromDevice_keepCache_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __103__CoreTelephonyClient_PlanTransfer__cancelCellularPlanTransfer_fromDevice_keepCache_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getProximityTransportSession:(unint64_t)a3 remoteDeviceInfo:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__CoreTelephonyClient_PlanTransfer__getProximityTransportSession_remoteDeviceInfo_completion___block_invoke;
  v12[3] = &unk_1E5260CB8;
  id v10 = v9;
  id v13 = v10;
  id v11 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v12];
  [v11 getProximityTransportSession:a3 remoteDeviceInfo:v8 completion:v10];
}

uint64_t __94__CoreTelephonyClient_PlanTransfer__getProximityTransportSession_remoteDeviceInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)activateProximityTransfer:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__CoreTelephonyClient_PlanTransfer__activateProximityTransfer_completion___block_invoke;
  v13[3] = &unk_1E5260CB8;
  id v7 = v6;
  id v14 = v7;
  id v8 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  id v9 = [[CTXPCActivateProximityTransferRequest alloc] initWithEndpoint:a3];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__CoreTelephonyClient_PlanTransfer__activateProximityTransfer_completion___block_invoke_2;
  v11[3] = &unk_1E5263180;
  id v10 = v7;
  id v12 = v10;
  [v8 sendRequest:v9 completionHandler:v11];
}

uint64_t __74__CoreTelephonyClient_PlanTransfer__activateProximityTransfer_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__CoreTelephonyClient_PlanTransfer__activateProximityTransfer_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidateProximityTransfer:(unint64_t)a3 force:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __82__CoreTelephonyClient_PlanTransfer__invalidateProximityTransfer_force_completion___block_invoke;
  v15[3] = &unk_1E5260CB8;
  id v9 = v8;
  id v16 = v9;
  id v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v15];
  id v11 = [[CTXPCInvalidateProximityTransferRequest alloc] initWithEndpoint:a3 force:v5];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__CoreTelephonyClient_PlanTransfer__invalidateProximityTransfer_force_completion___block_invoke_2;
  v13[3] = &unk_1E5263180;
  id v12 = v9;
  id v14 = v12;
  [v10 sendRequest:v11 completionHandler:v13];
}

uint64_t __82__CoreTelephonyClient_PlanTransfer__invalidateProximityTransfer_force_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__CoreTelephonyClient_PlanTransfer__invalidateProximityTransfer_force_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)validateProximityTransfer:(unint64_t)a3 pin:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = &__block_literal_global_13;
  }
  if (v8)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __78__CoreTelephonyClient_PlanTransfer__validateProximityTransfer_pin_completion___block_invoke_2;
    v17[3] = &unk_1E5260CB8;
    id v11 = v10;
    id v18 = v11;
    id v12 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v17];
    id v13 = [[CTXPCValidateProximityTransferRequest alloc] initWithEndpoint:a3 pin:v8];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __78__CoreTelephonyClient_PlanTransfer__validateProximityTransfer_pin_completion___block_invoke_3;
    v15[3] = &unk_1E5263180;
    id v16 = v11;
    [v12 sendRequest:v13 completionHandler:v15];
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(void *, void *))v10 + 2))(v10, v14);
  }
}

uint64_t __78__CoreTelephonyClient_PlanTransfer__validateProximityTransfer_pin_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__CoreTelephonyClient_PlanTransfer__validateProximityTransfer_pin_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetProximityTransportExtension:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__CoreTelephonyClient_PlanTransfer__resetProximityTransportExtension___block_invoke;
  v11[3] = &unk_1E5260CB8;
  id v5 = v4;
  id v12 = v5;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v11];
  id v7 = objc_alloc_init(CTXPCResetProximityTransportExtensionRequest);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__CoreTelephonyClient_PlanTransfer__resetProximityTransportExtension___block_invoke_2;
  v9[3] = &unk_1E5263180;
  id v8 = v5;
  id v10 = v8;
  [v6 sendRequest:v7 completionHandler:v9];
}

uint64_t __70__CoreTelephonyClient_PlanTransfer__resetProximityTransportExtension___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70__CoreTelephonyClient_PlanTransfer__resetProximityTransportExtension___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)prepareCrossPlatformPlanTransfer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = &__block_literal_global_17;
  }
  if (v6)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __81__CoreTelephonyClient_PlanTransfer__prepareCrossPlatformPlanTransfer_completion___block_invoke_2;
    v15[3] = &unk_1E5260CB8;
    id v9 = v8;
    id v16 = v9;
    id v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v15];
    id v11 = [[CTXPCPrepareCrossPlatformPlanTransferRequest alloc] initWithRequest:v6];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __81__CoreTelephonyClient_PlanTransfer__prepareCrossPlatformPlanTransfer_completion___block_invoke_3;
    v13[3] = &unk_1E5263180;
    id v14 = v9;
    [v10 sendRequest:v11 completionHandler:v13];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(void *, void *))v8 + 2))(v8, v12);
  }
}

uint64_t __81__CoreTelephonyClient_PlanTransfer__prepareCrossPlatformPlanTransfer_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81__CoreTelephonyClient_PlanTransfer__prepareCrossPlatformPlanTransfer_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidateCrossPlatformPlanTransfer:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__CoreTelephonyClient_PlanTransfer__invalidateCrossPlatformPlanTransfer___block_invoke;
  v11[3] = &unk_1E5260CB8;
  id v5 = v4;
  id v12 = v5;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v11];
  id v7 = objc_alloc_init(CTXPCInvalidateCrossPlatformPlanTransferRequest);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__CoreTelephonyClient_PlanTransfer__invalidateCrossPlatformPlanTransfer___block_invoke_2;
  v9[3] = &unk_1E5263180;
  id v8 = v5;
  id v10 = v8;
  [v6 sendRequest:v7 completionHandler:v9];
}

uint64_t __73__CoreTelephonyClient_PlanTransfer__invalidateCrossPlatformPlanTransfer___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__CoreTelephonyClient_PlanTransfer__invalidateCrossPlatformPlanTransfer___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getLocalDeviceIdentifierForSIMTransfer:(id *)a3
{
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  id v6 = [v5 bundleIdentifier];

  if (v6)
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy__22;
    id v23 = __Block_byref_object_dispose__22;
    id v24 = 0;
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy__22;
    id v17 = __Block_byref_object_dispose__22;
    id v18 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__CoreTelephonyClient_PlanTransfer__getLocalDeviceIdentifierForSIMTransfer___block_invoke;
    v12[3] = &unk_1E5260BA0;
    void v12[4] = &v19;
    id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
    id v8 = [[CTXPCGetLocalDeviceIdentifierRequest alloc] initWithType:3 clientBundleIdentifier:v6];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__CoreTelephonyClient_PlanTransfer__getLocalDeviceIdentifierForSIMTransfer___block_invoke_2;
    v11[3] = &unk_1E5261A78;
    void v11[4] = &v13;
    void v11[5] = &v19;
    [v7 sendRequest:v8 completionHandler:v11];

    if (a3) {
      *a3 = (id) v20[5];
    }
    id v9 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v19, 8);
  }
  else if (a3)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:14 userInfo:0];
    id v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __76__CoreTelephonyClient_PlanTransfer__getLocalDeviceIdentifierForSIMTransfer___block_invoke(uint64_t a1, void *a2)
{
}

void __76__CoreTelephonyClient_PlanTransfer__getLocalDeviceIdentifierForSIMTransfer___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v15 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v15;
    id v8 = v15;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v15;
  }

  uint64_t v10 = [v9 deviceID];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

- (void)prepareCrossPlatformCellularPlanLabel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__CoreTelephonyClient_PlanTransfer__prepareCrossPlatformCellularPlanLabel_completion___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
  uint64_t v10 = [[CTXPCPrepareCrossPlatformCellularPlanLabelRequest alloc] initWithPlanLabels:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__CoreTelephonyClient_PlanTransfer__prepareCrossPlatformCellularPlanLabel_completion___block_invoke_2;
  v12[3] = &unk_1E5263180;
  id v11 = v8;
  id v13 = v11;
  [v9 sendRequest:v10 completionHandler:v12];
}

uint64_t __86__CoreTelephonyClient_PlanTransfer__prepareCrossPlatformCellularPlanLabel_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86__CoreTelephonyClient_PlanTransfer__prepareCrossPlatformCellularPlanLabel_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v12;
    id v9 = v12;
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
    id v9 = v12;
  }

  id v11 = [v10 info];
  (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v11, v6);
}

- (void)carrierOneTimeCodeSendersWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id location = 0;
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __77__CoreTelephonyClient_PlanTransfer__carrierOneTimeCodeSendersWithCompletion___block_invoke;
    v5[3] = &unk_1E52659A0;
    objc_copyWeak(&v7, &location);
    v5[4] = self;
    id v6 = v4;
    [(CoreTelephonyClient *)self getSubscriptionInfo:v5];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[CoreTelephonyClient(PlanTransfer) carrierOneTimeCodeSendersWithCompletion:]();
  }
}

void __77__CoreTelephonyClient_PlanTransfer__carrierOneTimeCodeSendersWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v20 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __77__CoreTelephonyClient_PlanTransfer__carrierOneTimeCodeSendersWithCompletion___block_invoke_cold_1();
    }
    goto LABEL_6;
  }
  if (v5)
  {
LABEL_6:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
    id v6 = v5;
    goto LABEL_25;
  }
  id v23 = -[CTBundle initWithBundleType:]([CTBundle alloc], "initWithBundleType:", 1, WeakRetained);
  v34[0] = @"PhoneAccountTransfer";
  v34[1] = @"OneTimeCodeSenders";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = [v20 subscriptions];
  id obj = v8;
  id v6 = 0;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v9)
  {
    uint64_t v21 = 0;
    uint64_t v10 = *(void *)v26;
    do
    {
      uint64_t v11 = 0;
      id v12 = v6;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
        id v14 = *(void **)(a1 + 32);
        id v15 = [v13 context];
        id v24 = v12;
        id v16 = (void *)[v14 copyCarrierBundleValue:v15 keyHierarchy:v7 bundleType:v23 error:&v24];
        id v6 = v24;

        if (v6)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            id v17 = CTSubscriptionSlotAsString([v13 slotID]);
            *(_DWORD *)buf = 136315394;
            id v30 = v17;
            __int16 v31 = 2112;
            id v32 = v6;
            _os_log_error_impl(&dword_18444A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "query CB for %s failed with error : %@", buf, 0x16u);
          }
        }
        else if (v16)
        {
          if (v21)
          {
            [v21 addObjectsFromArray:v16];
          }
          else
          {
            uint64_t v21 = [MEMORY[0x1E4F1CA48] arrayWithArray:v16];
          }
        }

        ++v11;
        id v12 = v6;
      }
      while (v9 != v11);
      id v8 = obj;
      uint64_t v18 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
      uint64_t v9 = v18;
    }
    while (v18);
  }
  else
  {
    uint64_t v21 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_25:
}

- (void)setFDataAssertion:(void *)a3
{
  objc_setAssociatedObject(self, sel_fDataAssertion, a3, (void *)0x301);
}

- (void)fDataAssertion
{
  return objc_claimAutoreleasedReturnValue();
}

- (BOOL)requestBootstrapDataService:(id *)a3
{
  uint64_t v34 = 0;
  id v35 = (id *)&v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__23;
  v38 = __Block_byref_object_dispose__23;
  id v39 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __62__CoreTelephonyClient_Bootstrap__requestBootstrapDataService___block_invoke;
  v33[3] = &unk_1E52611A0;
  v33[4] = &v34;
  id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v33];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __62__CoreTelephonyClient_Bootstrap__requestBootstrapDataService___block_invoke_2;
  v32[3] = &unk_1E52611A0;
  v32[4] = &v34;
  [v5 requestBootstrapService:v32];
  if (a3) {
    *a3 = v35[5];
  }
  id v6 = v35[5];
  if (v6)
  {
    id v7 = CTLogClient();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CoreTelephonyClient(Bootstrap) requestBootstrapDataService:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else if ([(CoreTelephonyClient *)self fDataAssertion])
  {
    id v15 = CTLogClient();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CoreTelephonyClient(Bootstrap) requestBootstrapDataService:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  else
  {
    uint64_t v23 = *MEMORY[0x1E4F1CF80];
    id v24 = v35;
    id v25 = v35[5];
    void v30[4] = self;
    id obj = v25;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __62__CoreTelephonyClient_Bootstrap__requestBootstrapDataService___block_invoke_1;
    v30[3] = &unk_1E52659C8;
    long long v26 = [(CoreTelephonyClient *)self createAssertionForConnectionType:19 allocator:v23 error:&obj onReAssertError:v30];
    objc_storeStrong(v24 + 5, obj);
    [(CoreTelephonyClient *)self setFDataAssertion:v26];
    long long v27 = CTLogClient();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v29[0] = 0;
      _os_log_impl(&dword_18444A000, v27, OS_LOG_TYPE_INFO, "requestBootstrapService successful ", (uint8_t *)v29, 2u);
    }
  }

  _Block_object_dispose(&v34, 8);
  return v6 == 0;
}

void __62__CoreTelephonyClient_Bootstrap__requestBootstrapDataService___block_invoke(uint64_t a1, void *a2)
{
}

void __62__CoreTelephonyClient_Bootstrap__requestBootstrapDataService___block_invoke_2(uint64_t a1, void *a2)
{
}

void __62__CoreTelephonyClient_Bootstrap__requestBootstrapDataService___block_invoke_1(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = CTLogClient();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_18444A000, v4, OS_LOG_TYPE_INFO, "requestBootstrapService onReAssertError : %@ ", buf, 0xCu);
  }
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = 0;
  [v5 releaseBootstrapDataService:&v6];
}

- (BOOL)releaseBootstrapDataService:(id *)a3
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__23;
  id v25 = __Block_byref_object_dispose__23;
  id v26 = 0;
  if ([(CoreTelephonyClient *)self fDataAssertion])
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __62__CoreTelephonyClient_Bootstrap__releaseBootstrapDataService___block_invoke;
    v20[3] = &unk_1E52611A0;
    void v20[4] = &v21;
    id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v20];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62__CoreTelephonyClient_Bootstrap__releaseBootstrapDataService___block_invoke_2;
    v19[3] = &unk_1E52611A0;
    void v19[4] = &v21;
    [v5 releaseBootstrapService:v19];
    if (a3) {
      *a3 = (id) v22[5];
    }
    if (v22[5])
    {
      uint64_t v6 = CTLogClient();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[CoreTelephonyClient(Bootstrap) releaseBootstrapDataService:](v6, v7, v8, v9, v10, v11, v12, v13);
      }

      BOOL v14 = 0;
    }
    else
    {
      CFRelease([(CoreTelephonyClient *)self fDataAssertion]);
      [(CoreTelephonyClient *)self setFDataAssertion:0];
      uint64_t v16 = CTLogClient();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl(&dword_18444A000, v16, OS_LOG_TYPE_INFO, "releaseBootstrapService successful", v18, 2u);
      }

      BOOL v14 = 1;
    }
  }
  else
  {
    id v15 = CTLogClient();
    BOOL v14 = 1;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_18444A000, v15, OS_LOG_TYPE_INFO, "releaseBootstrapService not required", v18, 2u);
    }
  }
  _Block_object_dispose(&v21, 8);

  return v14;
}

void __62__CoreTelephonyClient_Bootstrap__releaseBootstrapDataService___block_invoke(uint64_t a1, void *a2)
{
}

void __62__CoreTelephonyClient_Bootstrap__releaseBootstrapDataService___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)getBootstrapState:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__23;
  uint64_t v19 = __Block_byref_object_dispose__23;
  id v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__23;
  uint64_t v13 = __Block_byref_object_dispose__23;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__CoreTelephonyClient_Bootstrap__getBootstrapState___block_invoke;
  v8[3] = &unk_1E52611A0;
  void v8[4] = &v15;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__CoreTelephonyClient_Bootstrap__getBootstrapState___block_invoke_2;
  v7[3] = &unk_1E52659F0;
  void v7[4] = &v15;
  void v7[5] = &v9;
  [v4 getBootstrapState:v7];
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

  return v5;
}

void __52__CoreTelephonyClient_Bootstrap__getBootstrapState___block_invoke(uint64_t a1, void *a2)
{
}

void __52__CoreTelephonyClient_Bootstrap__getBootstrapState___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)setPrefForKey:(id)a3 heirarchy:(id)a4 value:(id)a5 storage:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__24;
  uint64_t v23 = __Block_byref_object_dispose__24;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__CoreTelephonyClient_InternalSettings__setPrefForKey_heirarchy_value_storage___block_invoke;
  v18[3] = &unk_1E5260BA0;
  void v18[4] = &v19;
  id v14 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__CoreTelephonyClient_InternalSettings__setPrefForKey_heirarchy_value_storage___block_invoke_2;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v19;
  [v14 setPrefForKey:v10 heirarchy:v11 value:v12 storage:v13 completion:v17];
  id v15 = (id)v20[5];

  _Block_object_dispose(&v19, 8);

  return v15;
}

void __79__CoreTelephonyClient_InternalSettings__setPrefForKey_heirarchy_value_storage___block_invoke(uint64_t a1, void *a2)
{
}

void __79__CoreTelephonyClient_InternalSettings__setPrefForKey_heirarchy_value_storage___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)setPrefForKey:(id)a3 heirarchy:(id)a4 value:(id)a5 storage:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90__CoreTelephonyClient_InternalSettings__setPrefForKey_heirarchy_value_storage_completion___block_invoke;
  v19[3] = &unk_1E5260CB8;
  id v17 = v16;
  id v20 = v17;
  uint64_t v18 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v19];
  [v18 setPrefForKey:v12 heirarchy:v13 value:v14 storage:v15 completion:v17];
}

uint64_t __90__CoreTelephonyClient_InternalSettings__setPrefForKey_heirarchy_value_storage_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getPrefForKey:(id)a3 heirarchy:(id)a4 storage:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  long long v27 = __Block_byref_object_copy__24;
  long long v28 = __Block_byref_object_dispose__24;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__24;
  uint64_t v22 = __Block_byref_object_dispose__24;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__CoreTelephonyClient_InternalSettings__getPrefForKey_heirarchy_storage_error___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v24;
  id v13 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__CoreTelephonyClient_InternalSettings__getPrefForKey_heirarchy_storage_error___block_invoke_2;
  v16[3] = &unk_1E5260F78;
  void v16[4] = &v18;
  void v16[5] = &v24;
  [v13 getPrefForKey:v10 heirarchy:v11 storage:v12 completion:v16];
  if (a6) {
    *a6 = (id) v25[5];
  }
  id v14 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v14;
}

void __79__CoreTelephonyClient_InternalSettings__getPrefForKey_heirarchy_storage_error___block_invoke(uint64_t a1, void *a2)
{
}

void __79__CoreTelephonyClient_InternalSettings__getPrefForKey_heirarchy_storage_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)getPrefForKey:(id)a3 heirarchy:(id)a4 storage:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__CoreTelephonyClient_InternalSettings__getPrefForKey_heirarchy_storage_completion___block_invoke;
  v16[3] = &unk_1E5260CB8;
  id v14 = v13;
  id v17 = v14;
  id v15 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v16];
  [v15 getPrefForKey:v10 heirarchy:v11 storage:v12 completion:v14];
}

uint64_t __84__CoreTelephonyClient_InternalSettings__getPrefForKey_heirarchy_storage_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)terminateProcess
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__24;
  id v11 = __Block_byref_object_dispose__24;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__CoreTelephonyClient_InternalSettings__terminateProcess__block_invoke;
  v6[3] = &unk_1E5260BA0;
  void v6[4] = &v7;
  id v2 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__CoreTelephonyClient_InternalSettings__terminateProcess__block_invoke_2;
  v5[3] = &unk_1E5260BA0;
  v5[4] = &v7;
  [v2 terminateProcess:v5];
  id v3 = (id)v8[5];

  _Block_object_dispose(&v7, 8);

  return v3;
}

void __57__CoreTelephonyClient_InternalSettings__terminateProcess__block_invoke(uint64_t a1, void *a2)
{
}

void __57__CoreTelephonyClient_InternalSettings__terminateProcess__block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)terminateProcess:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__CoreTelephonyClient_InternalSettings__terminateProcess___block_invoke;
  v7[3] = &unk_1E5260CB8;
  id v5 = v4;
  id v8 = v5;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  [v6 terminateProcess:v5];
}

uint64_t __58__CoreTelephonyClient_InternalSettings__terminateProcess___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getRadioPersonality:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__24;
  uint64_t v22 = __Block_byref_object_dispose__24;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__24;
  id v16 = __Block_byref_object_dispose__24;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__CoreTelephonyClient_InternalSettings__getRadioPersonality_error___block_invoke;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v18;
  uint64_t v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__CoreTelephonyClient_InternalSettings__getRadioPersonality_error___block_invoke_2;
  v10[3] = &unk_1E5260F78;
  void v10[4] = &v12;
  void v10[5] = &v18;
  [v7 getRadioPersonality:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __67__CoreTelephonyClient_InternalSettings__getRadioPersonality_error___block_invoke(uint64_t a1, void *a2)
{
}

void __67__CoreTelephonyClient_InternalSettings__getRadioPersonality_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)getRadioPersonality:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__CoreTelephonyClient_InternalSettings__getRadioPersonality_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  uint64_t v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 getRadioPersonality:v6 completion:v8];
}

uint64_t __72__CoreTelephonyClient_InternalSettings__getRadioPersonality_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)isVinylTapeSupportedWithError:(id *)a3
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__25;
  uint64_t v14 = __Block_byref_object_dispose__25;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__CoreTelephonyClient_Vinyl__isVinylTapeSupportedWithError___block_invoke;
  v9[3] = &unk_1E52611A0;
  void v9[4] = &v10;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v9];
  id v5 = (void *)v11[5];
  if (v5) {
    goto LABEL_3;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__CoreTelephonyClient_Vinyl__isVinylTapeSupportedWithError___block_invoke_2;
  v8[3] = &unk_1E52619D8;
  void v8[4] = &v10;
  void v8[5] = &v16;
  [v4 isVinylTapeSupportedWithCompletion:v8];
  id v5 = (void *)v11[5];
  if (v5)
  {
LABEL_3:
    id v6 = 0;
    if (a3) {
      *a3 = v5;
    }
  }
  else
  {
    id v6 = [NSNumber numberWithBool:*((unsigned __int8 *)v17 + 24)];
  }

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);

  return v6;
}

void __60__CoreTelephonyClient_Vinyl__isVinylTapeSupportedWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __60__CoreTelephonyClient_Vinyl__isVinylTapeSupportedWithError___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (void)isVinylTestModeEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__CoreTelephonyClient_Vinyl__isVinylTestModeEnabledWithCompletion___block_invoke;
  v7[3] = &unk_1E5261178;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  [v6 isVinylTestModeEnabledWithCompletion:v5];
}

uint64_t __67__CoreTelephonyClient_Vinyl__isVinylTestModeEnabledWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setVinylTestMode:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__CoreTelephonyClient_Vinyl__setVinylTestMode_completion___block_invoke;
  v9[3] = &unk_1E5261178;
  id v10 = v6;
  id v7 = v6;
  id v8 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v9];
  [v8 setVinylTestMode:v4 completion:v7];
}

uint64_t __58__CoreTelephonyClient_Vinyl__setVinylTestMode_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setVirtualSimMode:(BOOL)a3 withDualSim:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__CoreTelephonyClient_Vinyl__setVirtualSimMode_withDualSim_completion___block_invoke;
  v11[3] = &unk_1E5261178;
  id v12 = v8;
  id v9 = v8;
  id v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v11];
  [v10 setVirtualSimMode:v6 withDualSim:v5 completion:v9];
}

uint64_t __71__CoreTelephonyClient_Vinyl__setVirtualSimMode_withDualSim_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setVirtualSimMode:(BOOL)a3 completion:(id)a4
{
}

- (void)getEuiccData:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__CoreTelephonyClient_Vinyl__getEuiccData___block_invoke;
  v7[3] = &unk_1E5261178;
  id v8 = v4;
  id v5 = v4;
  BOOL v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  [v6 getEuiccData:v5];
}

uint64_t __43__CoreTelephonyClient_Vinyl__getEuiccData___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCallWaitingValue:(id)a3 callClass:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v10 = a3;
  id v8 = a5;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v8];
  [v9 fetchCallWaitingValue:v10 callClass:v6 completion:v8];
}

- (id)fetchCallWaitingValue:(id)a3 callClass:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__26;
  uint64_t v16 = __Block_byref_object_dispose__26;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__CoreTelephonyClient_SuppServices__fetchCallWaitingValue_callClass___block_invoke;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v12;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__CoreTelephonyClient_SuppServices__fetchCallWaitingValue_callClass___block_invoke_2;
  v10[3] = &unk_1E5260BA0;
  void v10[4] = &v12;
  [v7 fetchCallWaitingValue:v6 callClass:v4 completion:v10];
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v8;
}

void __69__CoreTelephonyClient_SuppServices__fetchCallWaitingValue_callClass___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __69__CoreTelephonyClient_SuppServices__fetchCallWaitingValue_callClass___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)fetchCallForwardingValue:(id)a3 reason:(int)a4 callClass:(int)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v12 = a3;
  id v10 = a6;
  id v11 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v11 fetchCallForwardingValue:v12 reason:v8 callClass:v7 completion:v10];
}

- (id)fetchCallForwardingValue:(id)a3 reason:(int)a4 callClass:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__26;
  uint64_t v18 = __Block_byref_object_dispose__26;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__CoreTelephonyClient_SuppServices__fetchCallForwardingValue_reason_callClass___block_invoke;
  v13[3] = &unk_1E5260BA0;
  void v13[4] = &v14;
  id v9 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__CoreTelephonyClient_SuppServices__fetchCallForwardingValue_reason_callClass___block_invoke_2;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v14;
  [v9 fetchCallForwardingValue:v8 reason:v6 callClass:v5 completion:v12];
  id v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v10;
}

void __79__CoreTelephonyClient_SuppServices__fetchCallForwardingValue_reason_callClass___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __79__CoreTelephonyClient_SuppServices__fetchCallForwardingValue_reason_callClass___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)fetchCallBarringValue:(id)a3 facility:(int)a4 callClass:(int)a5 password:(id)a6 completion:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  id v15 = a3;
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  [v14 fetchCallBarringValue:v15 facility:v10 callClass:v9 password:v12 completion:v13];
}

- (id)fetchCallBarringValue:(id)a3 facility:(int)a4 callClass:(int)a5 password:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a6;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__26;
  uint64_t v21 = __Block_byref_object_dispose__26;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__CoreTelephonyClient_SuppServices__fetchCallBarringValue_facility_callClass_password___block_invoke;
  v16[3] = &unk_1E5260BA0;
  void v16[4] = &v17;
  id v12 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __87__CoreTelephonyClient_SuppServices__fetchCallBarringValue_facility_callClass_password___block_invoke_2;
  v15[3] = &unk_1E5260BA0;
  void v15[4] = &v17;
  [v12 fetchCallBarringValue:v10 facility:v8 callClass:v7 password:v11 completion:v15];
  id v13 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v13;
}

void __87__CoreTelephonyClient_SuppServices__fetchCallBarringValue_facility_callClass_password___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __87__CoreTelephonyClient_SuppServices__fetchCallBarringValue_facility_callClass_password___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)fetchConnectedLinePresentationValue:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v6];
  [v7 fetchConnectedLinePresentationValue:v8 completion:v6];
}

- (id)fetchConnectedLinePresentationValue:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__26;
  uint64_t v14 = __Block_byref_object_dispose__26;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__CoreTelephonyClient_SuppServices__fetchConnectedLinePresentationValue___block_invoke;
  v9[3] = &unk_1E5260BA0;
  void v9[4] = &v10;
  id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__CoreTelephonyClient_SuppServices__fetchConnectedLinePresentationValue___block_invoke_2;
  v8[3] = &unk_1E5260BA0;
  void v8[4] = &v10;
  [v5 fetchConnectedLinePresentationValue:v4 completion:v8];
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v6;
}

void __73__CoreTelephonyClient_SuppServices__fetchConnectedLinePresentationValue___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __73__CoreTelephonyClient_SuppServices__fetchConnectedLinePresentationValue___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)fetchCallingLinePresentationValue:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v6];
  [v7 fetchCallingLinePresentationValue:v8 completion:v6];
}

- (id)fetchCallingLinePresentationValue:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__26;
  uint64_t v14 = __Block_byref_object_dispose__26;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__CoreTelephonyClient_SuppServices__fetchCallingLinePresentationValue___block_invoke;
  v9[3] = &unk_1E5260BA0;
  void v9[4] = &v10;
  id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__CoreTelephonyClient_SuppServices__fetchCallingLinePresentationValue___block_invoke_2;
  v8[3] = &unk_1E5260BA0;
  void v8[4] = &v10;
  [v5 fetchCallingLinePresentationValue:v4 completion:v8];
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v6;
}

void __71__CoreTelephonyClient_SuppServices__fetchCallingLinePresentationValue___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __71__CoreTelephonyClient_SuppServices__fetchCallingLinePresentationValue___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)fetchConnectedLineIdRestrictionValue:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v6];
  [v7 fetchConnectedLineIdRestrictionValue:v8 completion:v6];
}

- (id)fetchConnectedLineIdRestrictionValue:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__26;
  uint64_t v14 = __Block_byref_object_dispose__26;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__CoreTelephonyClient_SuppServices__fetchConnectedLineIdRestrictionValue___block_invoke;
  v9[3] = &unk_1E5260BA0;
  void v9[4] = &v10;
  id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__CoreTelephonyClient_SuppServices__fetchConnectedLineIdRestrictionValue___block_invoke_2;
  v8[3] = &unk_1E5260BA0;
  void v8[4] = &v10;
  [v5 fetchConnectedLineIdRestrictionValue:v4 completion:v8];
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v6;
}

void __74__CoreTelephonyClient_SuppServices__fetchConnectedLineIdRestrictionValue___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __74__CoreTelephonyClient_SuppServices__fetchConnectedLineIdRestrictionValue___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)fetchCallingLineIdRestrictionValue:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v6];
  [v7 fetchCallingLineIdRestrictionValue:v8 completion:v6];
}

- (id)fetchCallingLineIdRestrictionValue:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__26;
  uint64_t v14 = __Block_byref_object_dispose__26;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__CoreTelephonyClient_SuppServices__fetchCallingLineIdRestrictionValue___block_invoke;
  v9[3] = &unk_1E5260BA0;
  void v9[4] = &v10;
  id v5 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__CoreTelephonyClient_SuppServices__fetchCallingLineIdRestrictionValue___block_invoke_2;
  v8[3] = &unk_1E5260BA0;
  void v8[4] = &v10;
  [v5 fetchCallingLineIdRestrictionValue:v4 completion:v8];
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v6;
}

void __72__CoreTelephonyClient_SuppServices__fetchCallingLineIdRestrictionValue___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __72__CoreTelephonyClient_SuppServices__fetchCallingLineIdRestrictionValue___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)saveCallWaitingValue:(id)a3 callClass:(int)a4 enabled:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  id v12 = a3;
  id v10 = a6;
  id v11 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v11 saveCallWaitingValue:v12 callClass:v8 enabled:v7 completion:v10];
}

- (id)saveCallWaitingValue:(id)a3 callClass:(int)a4 enabled:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__26;
  uint64_t v18 = __Block_byref_object_dispose__26;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__CoreTelephonyClient_SuppServices__saveCallWaitingValue_callClass_enabled___block_invoke;
  v13[3] = &unk_1E5260BA0;
  void v13[4] = &v14;
  uint64_t v9 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__CoreTelephonyClient_SuppServices__saveCallWaitingValue_callClass_enabled___block_invoke_2;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v14;
  [v9 saveCallWaitingValue:v8 callClass:v6 enabled:v5 completion:v12];
  id v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v10;
}

void __76__CoreTelephonyClient_SuppServices__saveCallWaitingValue_callClass_enabled___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __76__CoreTelephonyClient_SuppServices__saveCallWaitingValue_callClass_enabled___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)saveCallForwardingValue:(id)a3 value:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v9];
  [v10 saveCallForwardingValue:v11 value:v8 completion:v9];
}

- (id)saveCallForwardingValue:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__26;
  uint64_t v17 = __Block_byref_object_dispose__26;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__CoreTelephonyClient_SuppServices__saveCallForwardingValue_value___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  id v8 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__CoreTelephonyClient_SuppServices__saveCallForwardingValue_value___block_invoke_2;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v13;
  [v8 saveCallForwardingValue:v6 value:v7 completion:v11];
  id v9 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v9;
}

void __67__CoreTelephonyClient_SuppServices__saveCallForwardingValue_value___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __67__CoreTelephonyClient_SuppServices__saveCallForwardingValue_value___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)isUnconditionalCallForwardingActive:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__CoreTelephonyClient_SuppServices__isUnconditionalCallForwardingActive_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 isUnconditionalCallForwardingActive:v6 completion:v8];
}

uint64_t __84__CoreTelephonyClient_SuppServices__isUnconditionalCallForwardingActive_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveCallBarringValue:(id)a3 facility:(int)a4 callClass:(int)a5 enabled:(BOOL)a6 password:(id)a7 completion:(id)a8
{
  BOOL v10 = a6;
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = *(void *)&a4;
  id v17 = a3;
  id v14 = a7;
  id v15 = a8;
  uint64_t v16 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v15];
  [v16 saveCallBarringValue:v17 facility:v12 callClass:v11 enabled:v10 password:v14 completion:v15];
}

- (id)saveCallBarringValue:(id)a3 facility:(int)a4 callClass:(int)a5 enabled:(BOOL)a6 password:(id)a7
{
  BOOL v8 = a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a7;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__26;
  id v23 = __Block_byref_object_dispose__26;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __94__CoreTelephonyClient_SuppServices__saveCallBarringValue_facility_callClass_enabled_password___block_invoke;
  v18[3] = &unk_1E5260BA0;
  void v18[4] = &v19;
  id v14 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __94__CoreTelephonyClient_SuppServices__saveCallBarringValue_facility_callClass_enabled_password___block_invoke_2;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v19;
  [v14 saveCallBarringValue:v12 facility:v10 callClass:v9 enabled:v8 password:v13 completion:v17];
  id v15 = (id)v20[5];

  _Block_object_dispose(&v19, 8);

  return v15;
}

void __94__CoreTelephonyClient_SuppServices__saveCallBarringValue_facility_callClass_enabled_password___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __94__CoreTelephonyClient_SuppServices__saveCallBarringValue_facility_callClass_enabled_password___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)saveCallingLineIdRestrictionValue:(id)a3 restrictionValue:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v10 = a3;
  id v8 = a5;
  uint64_t v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v8];
  [v9 saveCallingLineIdRestrictionValue:v10 restrictionValue:v6 completion:v8];
}

- (id)saveCallingLineIdRestrictionValue:(id)a3 restrictionValue:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__26;
  uint64_t v16 = __Block_byref_object_dispose__26;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__CoreTelephonyClient_SuppServices__saveCallingLineIdRestrictionValue_restrictionValue___block_invoke;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v12;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__CoreTelephonyClient_SuppServices__saveCallingLineIdRestrictionValue_restrictionValue___block_invoke_2;
  v10[3] = &unk_1E5260BA0;
  void v10[4] = &v12;
  [v7 saveCallingLineIdRestrictionValue:v6 restrictionValue:v4 completion:v10];
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v8;
}

void __88__CoreTelephonyClient_SuppServices__saveCallingLineIdRestrictionValue_restrictionValue___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __88__CoreTelephonyClient_SuppServices__saveCallingLineIdRestrictionValue_restrictionValue___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

uint64_t __62__CoreTelephonyClient_Voicemail__getVoicemailInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)setVisualVoicemailState:(id)a3 subscribed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__27;
  uint64_t v16 = __Block_byref_object_dispose__27;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__CoreTelephonyClient_Voicemail__setVisualVoicemailState_subscribed___block_invoke;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v12;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__CoreTelephonyClient_Voicemail__setVisualVoicemailState_subscribed___block_invoke_2;
  v10[3] = &unk_1E5260BA0;
  void v10[4] = &v12;
  [v7 setVisualVoicemailState:v6 subscribed:v4 completion:v10];
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v8;
}

void __69__CoreTelephonyClient_Voicemail__setVisualVoicemailState_subscribed___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __69__CoreTelephonyClient_Voicemail__setVisualVoicemailState_subscribed___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (id)getVoicemailCallInDetails:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__27;
  id v22 = __Block_byref_object_dispose__27;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__CoreTelephonyClient_Voicemail__getVoicemailCallInDetails_outError___block_invoke;
  v17[3] = &unk_1E5260BA0;
  void v17[4] = &v18;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__27;
  id v15 = __Block_byref_object_dispose__27;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__CoreTelephonyClient_Voicemail__getVoicemailCallInDetails_outError___block_invoke_2;
  v10[3] = &unk_1E52629C8;
  void v10[4] = &v11;
  void v10[5] = &v18;
  [v7 getVoicemailCallInDetails:v6 completion:v10];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __69__CoreTelephonyClient_Voicemail__getVoicemailCallInDetails_outError___block_invoke(uint64_t a1, void *a2)
{
}

void __69__CoreTelephonyClient_Voicemail__getVoicemailCallInDetails_outError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- ($96EE1C12479E9B303E9C2794B92A11A2)reliableNetworkFallback:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__28;
  id v23 = __Block_byref_object_dispose__28;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__CoreTelephonyClient_CellularUsagePolicy__reliableNetworkFallback_error___block_invoke;
  v18[3] = &unk_1E5260BA0;
  void v18[4] = &v19;
  uint64_t v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3812000000;
  uint64_t v14 = __Block_byref_object_copy__1;
  id v15 = __Block_byref_object_dispose__2;
  id v16 = &unk_184626B9F;
  __int16 v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__CoreTelephonyClient_CellularUsagePolicy__reliableNetworkFallback_error___block_invoke_3;
  v10[3] = &unk_1E5266508;
  void v10[4] = &v19;
  void v10[5] = &v11;
  [v7 reliableNetworkFallback:v6 completion:v10];
  if (a4) {
    *a4 = (id) v20[5];
  }
  $96EE1C12479E9B303E9C2794B92A11A2 v8 = ($96EE1C12479E9B303E9C2794B92A11A2)*((_WORD *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v19, 8);
  return v8;
}

void __74__CoreTelephonyClient_CellularUsagePolicy__reliableNetworkFallback_error___block_invoke(uint64_t a1, void *a2)
{
}

void __74__CoreTelephonyClient_CellularUsagePolicy__reliableNetworkFallback_error___block_invoke_3(uint64_t a1, char a2, char a3, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v8 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 49) = a3;
}

- (id)setReliableNetworkFallback:(id)a3 enable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__28;
  id v16 = __Block_byref_object_dispose__28;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__CoreTelephonyClient_CellularUsagePolicy__setReliableNetworkFallback_enable___block_invoke;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v12;
  uint64_t v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__CoreTelephonyClient_CellularUsagePolicy__setReliableNetworkFallback_enable___block_invoke_2;
  v10[3] = &unk_1E5260BA0;
  void v10[4] = &v12;
  [v7 setReliableNetworkFallback:v6 enable:v4 completion:v10];
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v8;
}

void __78__CoreTelephonyClient_CellularUsagePolicy__setReliableNetworkFallback_enable___block_invoke(uint64_t a1, void *a2)
{
}

void __78__CoreTelephonyClient_CellularUsagePolicy__setReliableNetworkFallback_enable___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)lowDataMode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__28;
  uint64_t v20 = __Block_byref_object_dispose__28;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __62__CoreTelephonyClient_CellularUsagePolicy__lowDataMode_error___block_invoke;
  v15[3] = &unk_1E5260BA0;
  void v15[4] = &v16;
  uint64_t v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v15];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__CoreTelephonyClient_CellularUsagePolicy__lowDataMode_error___block_invoke_2;
  v10[3] = &unk_1E5260D78;
  void v10[4] = &v16;
  void v10[5] = &v11;
  [v7 lowDataMode:v6 completion:v10];
  if (a4) {
    *a4 = (id) v17[5];
  }
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __62__CoreTelephonyClient_CellularUsagePolicy__lowDataMode_error___block_invoke(uint64_t a1, void *a2)
{
}

void __62__CoreTelephonyClient_CellularUsagePolicy__lowDataMode_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (id)setSaveDataMode:(id)a3 enable:(BOOL)a4
{
  BOOL v4 = [(CoreTelephonyClient *)self setLowDataMode:a3 enable:a4];

  return v4;
}

- (id)setLowDataMode:(id)a3 enable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__28;
  uint64_t v16 = __Block_byref_object_dispose__28;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__CoreTelephonyClient_CellularUsagePolicy__setLowDataMode_enable___block_invoke;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v12;
  uint64_t v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__CoreTelephonyClient_CellularUsagePolicy__setLowDataMode_enable___block_invoke_2;
  v10[3] = &unk_1E5260BA0;
  void v10[4] = &v12;
  [v7 setLowDataMode:v6 enable:v4 completion:v10];
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v8;
}

void __66__CoreTelephonyClient_CellularUsagePolicy__setLowDataMode_enable___block_invoke(uint64_t a1, void *a2)
{
}

void __66__CoreTelephonyClient_CellularUsagePolicy__setLowDataMode_enable___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)isSmartDataModeSupported:(id *)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__28;
  id v17 = __Block_byref_object_dispose__28;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__CoreTelephonyClient_CellularUsagePolicy__isSmartDataModeSupported___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  BOOL v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__CoreTelephonyClient_CellularUsagePolicy__isSmartDataModeSupported___block_invoke_2;
  v7[3] = &unk_1E5263278;
  void v7[4] = &v8;
  [v4 isSmartDataModeSupportedWithCompletion:v7];
  if (a3) {
    *a3 = (id) v14[5];
  }
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v13, 8);
  return v5;
}

void __69__CoreTelephonyClient_CellularUsagePolicy__isSmartDataModeSupported___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __69__CoreTelephonyClient_CellularUsagePolicy__isSmartDataModeSupported___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)smartDataMode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__28;
  uint64_t v20 = __Block_byref_object_dispose__28;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __64__CoreTelephonyClient_CellularUsagePolicy__smartDataMode_error___block_invoke;
  v15[3] = &unk_1E5260BA0;
  void v15[4] = &v16;
  uint64_t v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v15];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__CoreTelephonyClient_CellularUsagePolicy__smartDataMode_error___block_invoke_2;
  v10[3] = &unk_1E5260D78;
  void v10[4] = &v16;
  void v10[5] = &v11;
  [v7 smartDataMode:v6 completion:v10];
  if (a4) {
    *a4 = (id) v17[5];
  }
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __64__CoreTelephonyClient_CellularUsagePolicy__smartDataMode_error___block_invoke(uint64_t a1, void *a2)
{
}

void __64__CoreTelephonyClient_CellularUsagePolicy__smartDataMode_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (id)setSmartDataMode:(id)a3 enable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__28;
  uint64_t v16 = __Block_byref_object_dispose__28;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__CoreTelephonyClient_CellularUsagePolicy__setSmartDataMode_enable___block_invoke;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v12;
  uint64_t v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__CoreTelephonyClient_CellularUsagePolicy__setSmartDataMode_enable___block_invoke_2;
  v10[3] = &unk_1E5260BA0;
  void v10[4] = &v12;
  [v7 setSmartDataMode:v6 enable:v4 completion:v10];
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v8;
}

void __68__CoreTelephonyClient_CellularUsagePolicy__setSmartDataMode_enable___block_invoke(uint64_t a1, void *a2)
{
}

void __68__CoreTelephonyClient_CellularUsagePolicy__setSmartDataMode_enable___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)isHighDataModeSupported:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__28;
  uint64_t v20 = __Block_byref_object_dispose__28;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __74__CoreTelephonyClient_CellularUsagePolicy__isHighDataModeSupported_error___block_invoke;
  v15[3] = &unk_1E5260BA0;
  void v15[4] = &v16;
  uint64_t v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v15];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__CoreTelephonyClient_CellularUsagePolicy__isHighDataModeSupported_error___block_invoke_2;
  v10[3] = &unk_1E5263278;
  void v10[4] = &v11;
  [v7 isHighDataModeSupported:v6 completion:v10];
  if (a4) {
    *a4 = (id) v17[5];
  }
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __74__CoreTelephonyClient_CellularUsagePolicy__isHighDataModeSupported_error___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __74__CoreTelephonyClient_CellularUsagePolicy__isHighDataModeSupported_error___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)interfaceCostExpensive:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__28;
  uint64_t v20 = __Block_byref_object_dispose__28;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __73__CoreTelephonyClient_CellularUsagePolicy__interfaceCostExpensive_error___block_invoke;
  v15[3] = &unk_1E5260BA0;
  void v15[4] = &v16;
  uint64_t v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v15];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__CoreTelephonyClient_CellularUsagePolicy__interfaceCostExpensive_error___block_invoke_2;
  v10[3] = &unk_1E5260D78;
  void v10[4] = &v16;
  void v10[5] = &v11;
  [v7 interfaceCostExpensive:v6 completion:v10];
  if (a4) {
    *a4 = (id) v17[5];
  }
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __73__CoreTelephonyClient_CellularUsagePolicy__interfaceCostExpensive_error___block_invoke(uint64_t a1, void *a2)
{
}

void __73__CoreTelephonyClient_CellularUsagePolicy__interfaceCostExpensive_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (id)setInterfaceCost:(id)a3 expensive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__28;
  uint64_t v16 = __Block_byref_object_dispose__28;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__CoreTelephonyClient_CellularUsagePolicy__setInterfaceCost_expensive___block_invoke;
  v11[3] = &unk_1E5260BA0;
  void v11[4] = &v12;
  uint64_t v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__CoreTelephonyClient_CellularUsagePolicy__setInterfaceCost_expensive___block_invoke_2;
  v10[3] = &unk_1E5260BA0;
  void v10[4] = &v12;
  [v7 setInterfaceCost:v6 expensive:v4 completion:v10];
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v8;
}

void __71__CoreTelephonyClient_CellularUsagePolicy__setInterfaceCost_expensive___block_invoke(uint64_t a1, void *a2)
{
}

void __71__CoreTelephonyClient_CellularUsagePolicy__setInterfaceCost_expensive___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)overriddenInterfaceCostInexpensive:(id *)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__28;
  id v17 = __Block_byref_object_dispose__28;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__CoreTelephonyClient_CellularUsagePolicy__overriddenInterfaceCostInexpensive___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  BOOL v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__CoreTelephonyClient_CellularUsagePolicy__overriddenInterfaceCostInexpensive___block_invoke_2;
  v7[3] = &unk_1E5260D78;
  void v7[4] = &v13;
  void v7[5] = &v8;
  [v4 overriddenInterfaceCostInexpensiveWithCompletion:v7];
  if (a3) {
    *a3 = (id) v14[5];
  }
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v13, 8);
  return v5;
}

void __79__CoreTelephonyClient_CellularUsagePolicy__overriddenInterfaceCostInexpensive___block_invoke(uint64_t a1, void *a2)
{
}

void __79__CoreTelephonyClient_CellularUsagePolicy__overriddenInterfaceCostInexpensive___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (id)setOverriddenInterfaceCostInexpensive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__28;
  uint64_t v13 = __Block_byref_object_dispose__28;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__CoreTelephonyClient_CellularUsagePolicy__setOverriddenInterfaceCostInexpensive___block_invoke;
  v8[3] = &unk_1E5260BA0;
  void v8[4] = &v9;
  BOOL v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__CoreTelephonyClient_CellularUsagePolicy__setOverriddenInterfaceCostInexpensive___block_invoke_2;
  v7[3] = &unk_1E5260BA0;
  void v7[4] = &v9;
  [v4 setOverriddenInterfaceCostInexpensive:v3 completion:v7];
  id v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v5;
}

void __82__CoreTelephonyClient_CellularUsagePolicy__setOverriddenInterfaceCostInexpensive___block_invoke(uint64_t a1, void *a2)
{
}

void __82__CoreTelephonyClient_CellularUsagePolicy__setOverriddenInterfaceCostInexpensive___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)setPrivacyProxyState:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__28;
  id v18 = __Block_byref_object_dispose__28;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__CoreTelephonyClient_CellularUsagePolicy__setPrivacyProxyState_enabled___block_invoke;
  v13[3] = &unk_1E5260BA0;
  void v13[4] = &v14;
  uint64_t v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v13];
  uint64_t v8 = v7;
  uint64_t v9 = (void *)v15[5];
  if (!v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __73__CoreTelephonyClient_CellularUsagePolicy__setPrivacyProxyState_enabled___block_invoke_2;
    v12[3] = &unk_1E5260BA0;
    void v12[4] = &v14;
    [v7 setPrivacyProxy:v6 enabled:v4 completion:v12];
    uint64_t v9 = (void *)v15[5];
  }
  id v10 = v9;

  _Block_object_dispose(&v14, 8);

  return v10;
}

void __73__CoreTelephonyClient_CellularUsagePolicy__setPrivacyProxyState_enabled___block_invoke(uint64_t a1, void *a2)
{
}

void __73__CoreTelephonyClient_CellularUsagePolicy__setPrivacyProxyState_enabled___block_invoke_2(uint64_t a1, void *a2)
{
}

- ($96EE1C12479E9B303E9C2794B92A11A2)getPrivacyProxyState:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__28;
  id v25 = __Block_byref_object_dispose__28;
  id v26 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __71__CoreTelephonyClient_CellularUsagePolicy__getPrivacyProxyState_error___block_invoke;
  v20[3] = &unk_1E5260BA0;
  void v20[4] = &v21;
  uint64_t v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v20];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3812000000;
  uint64_t v16 = __Block_byref_object_copy__1;
  id v17 = __Block_byref_object_dispose__2;
  id v18 = &unk_184626B9F;
  __int16 v19 = 0;
  uint64_t v8 = (void *)v22[5];
  if (!v8)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__CoreTelephonyClient_CellularUsagePolicy__getPrivacyProxyState_error___block_invoke_2;
    v12[3] = &unk_1E5266508;
    void v12[4] = &v21;
    void v12[5] = &v13;
    [v7 privacyProxy:v6 completion:v12];
    if (!a4)
    {
LABEL_7:
      uint64_t v9 = v14;
      goto LABEL_8;
    }
    uint64_t v8 = (void *)v22[5];
LABEL_6:
    *a4 = v8;
    goto LABEL_7;
  }
  if (a4) {
    goto LABEL_6;
  }
  uint64_t v9 = &v13;
LABEL_8:
  $96EE1C12479E9B303E9C2794B92A11A2 v10 = ($96EE1C12479E9B303E9C2794B92A11A2)*((_WORD *)v9 + 24);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

void __71__CoreTelephonyClient_CellularUsagePolicy__getPrivacyProxyState_error___block_invoke(uint64_t a1, void *a2)
{
}

void __71__CoreTelephonyClient_CellularUsagePolicy__getPrivacyProxyState_error___block_invoke_2(uint64_t a1, char a2, char a3, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v8 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 49) = a3;
}

- (void)selectPhonebook:(id)a3 forPhonebookName:(int)a4 withPassword:(id)a5 completion:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __91__CoreTelephonyClient_Phonebook__selectPhonebook_forPhonebookName_withPassword_completion___block_invoke;
  v15[3] = &unk_1E5260CB8;
  id v13 = v12;
  id v16 = v13;
  uint64_t v14 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v15];
  [v14 selectPhonebook:v10 forPhonebookName:v8 withPassword:v11 completion:v13];
}

uint64_t __91__CoreTelephonyClient_Phonebook__selectPhonebook_forPhonebookName_withPassword_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)savePhonebookEntry:(id)a3 atIndex:(int)a4 withContactName:(id)a5 contactNumber:(id)a6 completion:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __102__CoreTelephonyClient_Phonebook__savePhonebookEntry_atIndex_withContactName_contactNumber_completion___block_invoke;
  v18[3] = &unk_1E5260CB8;
  id v16 = v15;
  id v19 = v16;
  id v17 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v18];
  [v17 savePhonebookEntry:v12 atIndex:v10 withContactName:v13 contactNumber:v14 completion:v16];
}

uint64_t __102__CoreTelephonyClient_Phonebook__savePhonebookEntry_atIndex_withContactName_contactNumber_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPhonebook:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__CoreTelephonyClient_Phonebook__fetchPhonebook_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  uint64_t v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 fetchPhonebook:v6 completion:v8];
}

uint64_t __60__CoreTelephonyClient_Phonebook__fetchPhonebook_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPhonebookEntryWithCompletion:(id)a3 atIndex:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__CoreTelephonyClient_Phonebook__getPhonebookEntryWithCompletion_atIndex_completion___block_invoke;
  v12[3] = &unk_1E5260CB8;
  id v10 = v9;
  id v13 = v10;
  id v11 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v12];
  [v11 getPhonebookEntryWithCompletion:v8 atIndex:v6 completion:v10];
}

uint64_t __85__CoreTelephonyClient_Phonebook__getPhonebookEntryWithCompletion_atIndex_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getPhonebookEntry:(id)a3 atIndex:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__29;
  id v24 = __Block_byref_object_dispose__29;
  id v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__CoreTelephonyClient_Phonebook__getPhonebookEntry_atIndex_error___block_invoke;
  v19[3] = &unk_1E5260BA0;
  void v19[4] = &v20;
  id v9 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v19];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__29;
  id v17 = __Block_byref_object_dispose__29;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__CoreTelephonyClient_Phonebook__getPhonebookEntry_atIndex_error___block_invoke_2;
  v12[3] = &unk_1E5266CA0;
  void v12[4] = &v20;
  void v12[5] = &v13;
  [v9 getPhonebookEntryWithCompletion:v8 atIndex:v6 completion:v12];
  if (a5) {
    *a5 = (id) v21[5];
  }
  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v20, 8);

  return v10;
}

void __66__CoreTelephonyClient_Phonebook__getPhonebookEntry_atIndex_error___block_invoke(uint64_t a1, void *a2)
{
}

void __66__CoreTelephonyClient_Phonebook__getPhonebookEntry_atIndex_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)getPhonebookEntryCountWithCompletion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__CoreTelephonyClient_Phonebook__getPhonebookEntryCountWithCompletion_completion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v11 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 getPhonebookEntryCountWithCompletion:v6 completion:v8];
}

uint64_t __82__CoreTelephonyClient_Phonebook__getPhonebookEntryCountWithCompletion_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)getPhonebookEntryCount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__29;
  uint64_t v20 = __Block_byref_object_dispose__29;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __63__CoreTelephonyClient_Phonebook__getPhonebookEntryCount_error___block_invoke;
  v15[3] = &unk_1E5260BA0;
  void v15[4] = &v16;
  id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v15];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__CoreTelephonyClient_Phonebook__getPhonebookEntryCount_error___block_invoke_2;
  v10[3] = &unk_1E5266CC8;
  void v10[4] = &v16;
  void v10[5] = &v11;
  [v7 getPhonebookEntryCountWithCompletion:v6 completion:v10];
  if (a4) {
    *a4 = (id) v17[5];
  }
  int v8 = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __63__CoreTelephonyClient_Phonebook__getPhonebookEntryCount_error___block_invoke(uint64_t a1, void *a2)
{
}

void __63__CoreTelephonyClient_Phonebook__getPhonebookEntryCount_error___block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)getPhoneNumberWithCompletion:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(CoreTelephonyClient *)self supportsRequestWithSelector:a2])
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    int v14 = __74__CoreTelephonyClient_Phonebook__getPhoneNumberWithCompletion_completion___block_invoke_2;
    uint64_t v15 = &unk_1E5260CB8;
    id v9 = v8;
    id v16 = v9;
    id v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:&v12];
    objc_msgSend(v10, "getPhoneNumberWithCompletion:completion:", v7, v9, v12, v13, v14, v15);
    uint64_t v11 = &v16;
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __74__CoreTelephonyClient_Phonebook__getPhoneNumberWithCompletion_completion___block_invoke;
    v17[3] = &unk_1E5260D00;
    id v18 = v8;
    [(CoreTelephonyClient *)self dispatchBlockToClientAsync:v17];
    uint64_t v11 = &v18;
  }
}

void __74__CoreTelephonyClient_Phonebook__getPhoneNumberWithCompletion_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:19 userInfo:0];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

uint64_t __74__CoreTelephonyClient_Phonebook__getPhoneNumberWithCompletion_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__CoreTelephonyClient_Phonebook__getPhoneNumber_error___block_invoke(uint64_t a1, void *a2)
{
}

- (void)copyPriVersion:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__CoreTelephonyClient_Postponement__copyPriVersion_completion___block_invoke;
  v10[3] = &unk_1E5261178;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  [v9 copyPriVersion:v8 completion:v7];
}

uint64_t __63__CoreTelephonyClient_Postponement__copyPriVersion_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getActivationPolicyState:(id *)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__30;
  id v19 = __Block_byref_object_dispose__30;
  id v20 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__30;
  uint64_t v13 = __Block_byref_object_dispose__30;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__CoreTelephonyClient_Postponement__getActivationPolicyState___block_invoke;
  v8[3] = &unk_1E52611A0;
  void v8[4] = &v15;
  BOOL v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__CoreTelephonyClient_Postponement__getActivationPolicyState___block_invoke_2;
  v7[3] = &unk_1E52676F8;
  void v7[4] = &v15;
  void v7[5] = &v9;
  [v4 getActivationPolicyState:v7];
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

  return v5;
}

void __62__CoreTelephonyClient_Postponement__getActivationPolicyState___block_invoke(uint64_t a1, void *a2)
{
}

void __62__CoreTelephonyClient_Postponement__getActivationPolicyState___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)isFactoryDebugEnabled:(id *)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__30;
  id v19 = __Block_byref_object_dispose__30;
  id v20 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__30;
  uint64_t v13 = __Block_byref_object_dispose__30;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__CoreTelephonyClient_Postponement__isFactoryDebugEnabled___block_invoke;
  v8[3] = &unk_1E52611A0;
  void v8[4] = &v15;
  BOOL v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__CoreTelephonyClient_Postponement__isFactoryDebugEnabled___block_invoke_2;
  v7[3] = &unk_1E5261A28;
  void v7[4] = &v15;
  void v7[5] = &v9;
  [v4 isFactoryDebugEnabled:v7];
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

  return v5;
}

void __59__CoreTelephonyClient_Postponement__isFactoryDebugEnabled___block_invoke(uint64_t a1, void *a2)
{
}

void __59__CoreTelephonyClient_Postponement__isFactoryDebugEnabled___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)fetchBasebandTicket:(BOOL)a3 withError:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__30;
  id v21 = __Block_byref_object_dispose__30;
  id v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__30;
  uint64_t v15 = __Block_byref_object_dispose__30;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__CoreTelephonyClient_Postponement__fetchBasebandTicket_withError___block_invoke;
  v10[3] = &unk_1E52611A0;
  void v10[4] = &v17;
  uint64_t v6 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__CoreTelephonyClient_Postponement__fetchBasebandTicket_withError___block_invoke_2;
  v9[3] = &unk_1E5261A28;
  void v9[4] = &v17;
  void v9[5] = &v11;
  [v6 fetchBasebandTicket:v5 withCompletion:v9];
  if (a4) {
    *a4 = (id) v18[5];
  }
  id v7 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __67__CoreTelephonyClient_Postponement__fetchBasebandTicket_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __67__CoreTelephonyClient_Postponement__fetchBasebandTicket_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)supportsHydraWithError:(id *)a3
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__31;
  uint64_t v15 = __Block_byref_object_dispose__31;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__CoreTelephonyClient_CellularPlanManager__supportsHydraWithError___block_invoke;
  v10[3] = &unk_1E5260BA0;
  void v10[4] = &v11;
  BOOL v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v10];
  id v5 = objc_alloc_init(CTXPCSupportsHydraRequest);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__CoreTelephonyClient_CellularPlanManager__supportsHydraWithError___block_invoke_2;
  v9[3] = &unk_1E5261A78;
  void v9[4] = &v11;
  void v9[5] = &v17;
  [v4 sendRequest:v5 completionHandler:v9];

  uint64_t v6 = (void *)v12[5];
  if (v6)
  {
    id v7 = 0;
    if (a3) {
      *a3 = v6;
    }
  }
  else
  {
    id v7 = [NSNumber numberWithBool:*((unsigned __int8 *)v18 + 24)];
  }

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __67__CoreTelephonyClient_CellularPlanManager__supportsHydraWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __67__CoreTelephonyClient_CellularPlanManager__supportsHydraWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = v5;
    id v9 = *(id *)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }
  else
  {
    id v10 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v10;
    }
    else {
      id v9 = 0;
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v9 result];
  }
}

- (id)usingBootstrapDataService:(id *)a3
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__31;
  uint64_t v15 = __Block_byref_object_dispose__31;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__CoreTelephonyClient_CellularPlanManager__usingBootstrapDataService___block_invoke;
  v10[3] = &unk_1E5260BA0;
  void v10[4] = &v11;
  BOOL v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v10];
  id v5 = objc_alloc_init(CTXPCUsingBootstrapDataServiceRequest);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__CoreTelephonyClient_CellularPlanManager__usingBootstrapDataService___block_invoke_2;
  v9[3] = &unk_1E5261A78;
  void v9[4] = &v11;
  void v9[5] = &v17;
  [v4 sendRequest:v5 completionHandler:v9];

  uint64_t v6 = (void *)v12[5];
  if (v6)
  {
    uint64_t v7 = 0;
    if (a3) {
      *a3 = v6;
    }
  }
  else
  {
    uint64_t v7 = [NSNumber numberWithBool:*((unsigned __int8 *)v18 + 24)];
  }

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __70__CoreTelephonyClient_CellularPlanManager__usingBootstrapDataService___block_invoke(uint64_t a1, void *a2)
{
}

void __70__CoreTelephonyClient_CellularPlanManager__usingBootstrapDataService___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = v5;
    id v9 = *(id *)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }
  else
  {
    id v10 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v10;
    }
    else {
      id v9 = 0;
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v9 result];
  }
}

- (void)addPlanWith:(id)a3 request:(id)a4 appName:(id)a5 completionHandler:(id)a6
{
}

- (void)addPlanWith:(id)a3 appName:(id)a4 appType:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = &__block_literal_global_14;
  }
  if (v10 && v11)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __90__CoreTelephonyClient_CellularPlanManager__addPlanWith_appName_appType_completionHandler___block_invoke_2;
    v20[3] = &unk_1E5260CB8;
    id v14 = v13;
    id v21 = v14;
    uint64_t v15 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v20];
    id v16 = [[CTXPCAddPlanWithProvisioningRequest alloc] initWithRequest:v10 appName:v11 appType:a5];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __90__CoreTelephonyClient_CellularPlanManager__addPlanWith_appName_appType_completionHandler___block_invoke_3;
    v18[3] = &unk_1E5263180;
    id v19 = v14;
    [v15 sendRequest:v16 completionHandler:v18];
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(void *, void, void *))v13 + 2))(v13, 0, v17);
  }
}

uint64_t __90__CoreTelephonyClient_CellularPlanManager__addPlanWith_appName_appType_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__CoreTelephonyClient_CellularPlanManager__addPlanWith_appName_appType_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v10 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v10;
    id v8 = v10;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v10;
  }

  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v9 result], v6);
}

- (void)addPlanWith:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = &__block_literal_global_15_0;
  }
  if (v6)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __74__CoreTelephonyClient_CellularPlanManager__addPlanWith_completionHandler___block_invoke_2;
    v15[3] = &unk_1E5260CB8;
    id v9 = v8;
    id v16 = v9;
    id v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v15];
    id v11 = [[CTXPCAddPlanWithOnDeviceActivationRequest alloc] initWithRequest:v6];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__CoreTelephonyClient_CellularPlanManager__addPlanWith_completionHandler___block_invoke_3;
    v13[3] = &unk_1E5263180;
    id v14 = v9;
    [v10 sendRequest:v11 completionHandler:v13];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(void *, void, void *))v8 + 2))(v8, 0, v12);
  }
}

uint64_t __74__CoreTelephonyClient_CellularPlanManager__addPlanWith_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__CoreTelephonyClient_CellularPlanManager__addPlanWith_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v10 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v10;
    id v8 = v10;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v10;
  }

  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v9 result], v6);
}

- (void)addQRCodePlanWith:(id)a3 appType:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = &__block_literal_global_18;
  }
  if (v8)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __88__CoreTelephonyClient_CellularPlanManager__addQRCodePlanWith_appType_completionHandler___block_invoke_2;
    v26[3] = &unk_1E5260CB8;
    id v11 = v10;
    id v27 = v11;
    id v12 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v26];
    uint64_t v13 = [MEMORY[0x1E4F28B50] mainBundle];
    id v14 = [v13 localizedInfoDictionary];
    uint64_t v15 = [v14 objectForKey:@"CFBundleName"];
    id v16 = v15;
    if (v15)
    {
      uint64_t v17 = v15;
    }
    else
    {
      uint64_t v23 = v12;
      id v19 = [MEMORY[0x1E4F28B50] mainBundle];
      char v20 = [v19 infoDictionary];
      uint64_t v17 = [v20 objectForKey:@"CFBundleName"];

      id v12 = v23;
    }

    if (v17) {
      id v21 = v17;
    }
    else {
      id v21 = &stru_1ECFD6720;
    }
    id v22 = [[CTXPCAddQRCodePlanRequest alloc] initWithRequest:v8 appName:v21 appType:a4];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __88__CoreTelephonyClient_CellularPlanManager__addQRCodePlanWith_appType_completionHandler___block_invoke_3;
    v24[3] = &unk_1E5263180;
    id v25 = v11;
    [v12 sendRequest:v22 completionHandler:v24];
  }
  else
  {
    id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(void *, void, void *))v10 + 2))(v10, 0, v18);
  }
}

uint64_t __88__CoreTelephonyClient_CellularPlanManager__addQRCodePlanWith_appType_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__CoreTelephonyClient_CellularPlanManager__addQRCodePlanWith_appType_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v10 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v10;
    id v8 = v10;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v10;
  }

  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v9 result], v6);
}

- (BOOL)supportsPlanProvisioning:(id)a3 carrierDescriptors:(id)a4 smdpUrl:(id)a5 iccidPrefix:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:&__block_literal_global_28_0];
  if (v12)
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    uint64_t v13 = [[CTXPCSupportsPlanProvisioningRequest alloc] initWithCarrierDescriptors:v9 smdpUrl:v10 iccidPrefix:v11];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __108__CoreTelephonyClient_CellularPlanManager__supportsPlanProvisioning_carrierDescriptors_smdpUrl_iccidPrefix___block_invoke_2;
    v16[3] = &unk_1E5261A50;
    void v16[4] = &v17;
    [v12 sendRequest:v13 completionHandler:v16];
    BOOL v14 = *((unsigned char *)v18 + 24) != 0;

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

void __108__CoreTelephonyClient_CellularPlanManager__supportsPlanProvisioning_carrierDescriptors_smdpUrl_iccidPrefix___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (!v5)
  {
    id v6 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 result];
  }
}

- (void)getCameraScanInfoForCardData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__CoreTelephonyClient_CellularPlanManager__getCameraScanInfoForCardData_completionHandler___block_invoke;
  v13[3] = &unk_1E5260CB8;
  id v8 = v7;
  id v14 = v8;
  id v9 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  if (v9)
  {
    id v10 = [[CTXPCGetCameraScanInfoForCardDataRequest alloc] initWithCardData:v6];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __91__CoreTelephonyClient_CellularPlanManager__getCameraScanInfoForCardData_completionHandler___block_invoke_2;
    v11[3] = &unk_1E5263180;
    id v12 = v8;
    [v9 sendRequest:v10 completionHandler:v11];
  }
}

uint64_t __91__CoreTelephonyClient_CellularPlanManager__getCameraScanInfoForCardData_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__CoreTelephonyClient_CellularPlanManager__getCameraScanInfoForCardData_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 action];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (void)getActionForCardData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v26 = 0;
    id v27 = 0;
    id v25 = 0;
    BOOL v8 = [(CoreTelephonyClient *)self _decodeCardData:v6 smdp:&v27 matchingID:&v26 OID:&v25];
    id v9 = v27;
    id v10 = v26;
    id v11 = v25;
    if (v8)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __83__CoreTelephonyClient_CellularPlanManager__getActionForCardData_completionHandler___block_invoke;
      v23[3] = &unk_1E5260CB8;
      id v12 = v7;
      id v24 = v12;
      uint64_t v13 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v23];
      if (v13)
      {
        id v14 = objc_alloc_init(CTXPCCanRunActivationCodeProvisioningRequest);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __83__CoreTelephonyClient_CellularPlanManager__getActionForCardData_completionHandler___block_invoke_2;
        v18[3] = &unk_1E5267728;
        id v22 = v12;
        id v19 = v9;
        id v20 = v10;
        id v21 = v11;
        [v13 sendRequest:v14 completionHandler:v18];
      }
      uint64_t v15 = v24;
    }
    else
    {
      id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v15 = (void *)[v17 initWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v15);
    }
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v9 = (id)[v16 initWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v9);
  }
}

uint64_t __83__CoreTelephonyClient_CellularPlanManager__getActionForCardData_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__CoreTelephonyClient_CellularPlanManager__getActionForCardData_completionHandler___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    id v6 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    BOOL v8 = objc_alloc_init(CTCellularPlanQRCodeAction);
    [(CTCellularPlanQRCodeAction *)v8 setSmdpAddress:a1[4]];
    [(CTCellularPlanQRCodeAction *)v8 setMatchingId:a1[5]];
    [(CTCellularPlanQRCodeAction *)v8 setOID:a1[6]];
    id v9 = [v7 title];
    [(CTCellularPlanQRCodeAction *)v8 setTitle:v9];

    id v10 = [v7 message];
    [(CTCellularPlanQRCodeAction *)v8 setMessage:v10];

    (*(void (**)(void))(a1[7] + 16))();
  }
}

- (BOOL)_decodeCardData:(id)a3 smdp:(id *)a4 matchingID:(id *)a5 OID:(id *)a6
{
  id v9 = a3;
  id v10 = [v9 componentsSeparatedByString:@"$"];
  if ((unint64_t)[v10 count] >= 3)
  {
    id v11 = [v10 objectAtIndexedSubscript:0];
    char v12 = [v11 isEqualToString:@"LPA:1"];

    if (v12)
    {
      uint64_t v13 = [v10 objectAtIndexedSubscript:1];
      if (![v13 length])
      {
        BOOL v21 = 0;
LABEL_29:

        goto LABEL_30;
      }
      *a4 = v13;
      id v14 = [v10 objectAtIndexedSubscript:2];
      if (![v14 length]) {
        goto LABEL_22;
      }
      id v26 = 0;
      uint64_t v27 = 0;
      uint64_t v28 = 0;
      id v25 = v14;
      std::string::basic_string[abi:nn180100]<0>(&v26, (char *)[v14 UTF8String]);
      int v15 = SHIBYTE(v28);
      id v16 = v26;
      if (v28 >= 0) {
        id v17 = &v26;
      }
      else {
        id v17 = (void **)v26;
      }
      if (v28 >= 0) {
        uint64_t v18 = HIBYTE(v28);
      }
      else {
        uint64_t v18 = v27;
      }
      if (v18)
      {
        uint64_t v19 = 0;
        while (memchr("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-", *((char *)v17 + v19), 0x3FuLL))
        {
          if (v18 == ++v19)
          {
            BOOL v20 = 1;
            goto LABEL_20;
          }
        }
        BOOL v20 = v19 == -1;
      }
      else
      {
        BOOL v20 = 1;
      }
LABEL_20:
      id v14 = v25;
      if (v15 < 0)
      {
        operator delete(v16);
        if (v20)
        {
LABEL_22:
          *a5 = v14;
          if ((unint64_t)[v10 count] >= 4)
          {
            id v22 = [v10 objectAtIndexedSubscript:3];
            uint64_t v23 = [v22 length];

            if (v23)
            {
              *a6 = [v10 objectAtIndexedSubscript:3];
            }
          }
          BOOL v21 = 1;
          goto LABEL_28;
        }
      }
      else if (v20)
      {
        goto LABEL_22;
      }
      BOOL v21 = 0;
LABEL_28:

      goto LABEL_29;
    }
  }
  BOOL v21 = 0;
LABEL_30:

  return v21;
}

- (void)getTransferPlansWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__CoreTelephonyClient_CellularPlanManager__getTransferPlansWithCompletion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  if (v6)
  {
    id v7 = objc_alloc_init(CTXPCGetTransferPlansRequest);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __75__CoreTelephonyClient_CellularPlanManager__getTransferPlansWithCompletion___block_invoke_2;
    v8[3] = &unk_1E5263180;
    id v9 = v5;
    [v6 sendRequest:v7 completionHandler:v8];
  }
}

uint64_t __75__CoreTelephonyClient_CellularPlanManager__getTransferPlansWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75__CoreTelephonyClient_CellularPlanManager__getTransferPlansWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    BOOL v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    BOOL v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 devices];
  (*(void (**)(uint64_t, void *, void, id))(v10 + 16))(v10, v11, 0, v6);
}

- (void)hiddenTransferPlans:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__CoreTelephonyClient_CellularPlanManager__hiddenTransferPlans___block_invoke;
  v11[3] = &unk_1E5260CB8;
  id v5 = v4;
  id v12 = v5;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v11];
  id v7 = objc_alloc_init(CTXPCGetHiddenTransferPlansRequest);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__CoreTelephonyClient_CellularPlanManager__hiddenTransferPlans___block_invoke_2;
  v9[3] = &unk_1E5263180;
  id v8 = v5;
  id v10 = v8;
  [v6 sendRequest:v7 completionHandler:v9];
}

uint64_t __64__CoreTelephonyClient_CellularPlanManager__hiddenTransferPlans___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__CoreTelephonyClient_CellularPlanManager__hiddenTransferPlans___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v12;
    id v9 = v12;
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
    id v9 = v12;
  }

  id v11 = [v10 planList];
  (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v11, v6);
}

- (void)hideTransferPlan:(id)a3 fromDevice:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(CTRemotePlan);
  [(CTRemotePlan *)v10 setPlanID:v11];
  [(CoreTelephonyClient *)self hideTransferCellularPlan:v10 fromDevice:v8 completion:v9];
}

- (void)hideTransferCellularPlan:(id)a3 fromDevice:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = &__block_literal_global_45;
  }
  if (v8 && v9)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __91__CoreTelephonyClient_CellularPlanManager__hideTransferCellularPlan_fromDevice_completion___block_invoke_2;
    v18[3] = &unk_1E5260CB8;
    id v12 = v11;
    id v19 = v12;
    uint64_t v13 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v18];
    id v14 = [[CTXPCHideTransferPlanRequest alloc] initWithPlan:v8 fromDevice:v9];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __91__CoreTelephonyClient_CellularPlanManager__hideTransferCellularPlan_fromDevice_completion___block_invoke_3;
    v16[3] = &unk_1E5263180;
    id v17 = v12;
    [v13 sendRequest:v14 completionHandler:v16];
  }
  else
  {
    int v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(void *, void, void *))v11 + 2))(v11, 0, v15);
  }
}

uint64_t __91__CoreTelephonyClient_CellularPlanManager__hideTransferCellularPlan_fromDevice_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__CoreTelephonyClient_CellularPlanManager__hideTransferCellularPlan_fromDevice_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v11;
    id v9 = v11;
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
    id v9 = v11;
  }

  (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, [v10 result], v6);
}

- (void)unhideTransferPlan:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = &__block_literal_global_48_0;
  }
  if (v6)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __74__CoreTelephonyClient_CellularPlanManager__unhideTransferPlan_completion___block_invoke_2;
    v15[3] = &unk_1E5260CB8;
    id v9 = v8;
    id v16 = v9;
    id v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v15];
    id v11 = [[CTXPCUnhideTransferPlanRequest alloc] initWithPlan:v6];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__CoreTelephonyClient_CellularPlanManager__unhideTransferPlan_completion___block_invoke_3;
    v13[3] = &unk_1E5263180;
    id v14 = v9;
    [v10 sendRequest:v11 completionHandler:v13];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(void *, void, void *))v8 + 2))(v8, 0, v12);
  }
}

uint64_t __74__CoreTelephonyClient_CellularPlanManager__unhideTransferPlan_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__CoreTelephonyClient_CellularPlanManager__unhideTransferPlan_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v11;
    id v9 = v11;
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
    id v9 = v11;
  }

  (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, [v10 result], v6);
}

- (void)transferPlan:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v11 && v8)
  {
    id v10 = objc_alloc_init(CTRemotePlan);
    [(CTRemotePlan *)v10 setPlanID:v11];
    [(CoreTelephonyClient *)self transferCellularPlan:v10 fromDevice:v8 completionHandler:v9];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(id, void, void, void, CTRemotePlan *))v9 + 2))(v9, 0, 0, 0, v10);
  }
}

- (void)transferCellularPlan:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = &__block_literal_global_52_0;
  }
  if (v8 && v9)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __94__CoreTelephonyClient_CellularPlanManager__transferCellularPlan_fromDevice_completionHandler___block_invoke_2;
    v18[3] = &unk_1E5260CB8;
    id v12 = v11;
    id v19 = v12;
    uint64_t v13 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v18];
    if (v13)
    {
      id v14 = [[CTXPCTransferPlanRequest alloc] initWithPlan:v8 fromDevice:v9];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __94__CoreTelephonyClient_CellularPlanManager__transferCellularPlan_fromDevice_completionHandler___block_invoke_3;
      v16[3] = &unk_1E5263180;
      id v17 = v12;
      [v13 sendRequest:v14 completionHandler:v16];
    }
  }
  else
  {
    int v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(void *, void, void, void, void *))v11 + 2))(v11, 0, 0, 0, v15);
  }
}

uint64_t __94__CoreTelephonyClient_CellularPlanManager__transferCellularPlan_fromDevice_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __94__CoreTelephonyClient_CellularPlanManager__transferCellularPlan_fromDevice_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transferPlans:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v19 = a4;
  id v9 = a5;
  uint64_t v18 = v8;
  id v10 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = [v8 planIdentifiers];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v21;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * v14);
        id v16 = objc_alloc_init(CTRemotePlan);
        -[CTRemotePlan setPlanID:](v16, "setPlanID:", v15, v18);
        [v10 addObject:v16];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  id v17 = [[CTPlanList alloc] initWithPlans:v10];
  [(CoreTelephonyClient *)self transferCellularPlans:v17 fromDevice:v19 completionHandler:v9];
}

- (void)transferCellularPlans:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = &__block_literal_global_57;
  }
  if (v8 && v9)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __95__CoreTelephonyClient_CellularPlanManager__transferCellularPlans_fromDevice_completionHandler___block_invoke_2;
    v18[3] = &unk_1E5260CB8;
    id v12 = v11;
    id v19 = v12;
    uint64_t v13 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v18];
    if (v13)
    {
      uint64_t v14 = [[CTXPCTransferPlansRequest alloc] initWithPlans:v8 fromDevice:v9];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __95__CoreTelephonyClient_CellularPlanManager__transferCellularPlans_fromDevice_completionHandler___block_invoke_3;
      v16[3] = &unk_1E5263180;
      id v17 = v12;
      [v13 sendRequest:v14 completionHandler:v16];
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(void *, void, void, void, void *))v11 + 2))(v11, 0, 0, 0, v15);
  }
}

uint64_t __95__CoreTelephonyClient_CellularPlanManager__transferCellularPlans_fromDevice_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __95__CoreTelephonyClient_CellularPlanManager__transferCellularPlans_fromDevice_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelCellularPlanTransfer:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = &__block_literal_global_60_0;
  }
  if (v8 && v9)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __100__CoreTelephonyClient_CellularPlanManager__cancelCellularPlanTransfer_fromDevice_completionHandler___block_invoke_2;
    v18[3] = &unk_1E5260CB8;
    id v12 = v11;
    id v19 = v12;
    uint64_t v13 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v18];
    if (v13)
    {
      uint64_t v14 = [[CTXPCCancelTransferPlanRequest alloc] initWithPlan:v8 fromDevice:v9 keepCache:0];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __100__CoreTelephonyClient_CellularPlanManager__cancelCellularPlanTransfer_fromDevice_completionHandler___block_invoke_3;
      v16[3] = &unk_1E5263180;
      id v17 = v12;
      [v13 sendRequest:v14 completionHandler:v16];
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(void *, void *))v11 + 2))(v11, v15);
  }
}

uint64_t __100__CoreTelephonyClient_CellularPlanManager__cancelCellularPlanTransfer_fromDevice_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __100__CoreTelephonyClient_CellularPlanManager__cancelCellularPlanTransfer_fromDevice_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)updateSecureIntentData:(id)a3
{
  id v5 = 0;
  [(CoreTelephonyClient *)self updateSecureIntentData:a3 error:&v5];
  id v3 = v5;

  return v3;
}

- (BOOL)updateSecureIntentData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__31;
  id v17 = __Block_byref_object_dispose__31;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__CoreTelephonyClient_CellularPlanManager__updateSecureIntentData_error___block_invoke;
  v12[3] = &unk_1E5260BA0;
  void v12[4] = &v13;
  uint64_t v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
  id v8 = [[CTXPCUpdateSecureIntentDataRequest alloc] initWithData:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__CoreTelephonyClient_CellularPlanManager__updateSecureIntentData_error___block_invoke_2;
  v11[3] = &unk_1E5261A50;
  void v11[4] = &v13;
  [v7 sendRequest:v8 completionHandler:v11];

  if (a4) {
    *a4 = (id) v14[5];
  }
  BOOL v9 = v14[5] == 0;

  _Block_object_dispose(&v13, 8);
  return v9;
}

void __73__CoreTelephonyClient_CellularPlanManager__updateSecureIntentData_error___block_invoke(uint64_t a1, void *a2)
{
}

void __73__CoreTelephonyClient_CellularPlanManager__updateSecureIntentData_error___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (void)renewOneTimePassword:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = &__block_literal_global_64;
  }
  if (v6)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __76__CoreTelephonyClient_CellularPlanManager__renewOneTimePassword_completion___block_invoke_2;
    v15[3] = &unk_1E5260CB8;
    id v9 = v8;
    id v16 = v9;
    id v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v15];
    if (v10)
    {
      id v11 = [[CTXPCRenewOneTimePasswordRequest alloc] initWithSourceIccid:v6];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __76__CoreTelephonyClient_CellularPlanManager__renewOneTimePassword_completion___block_invoke_3;
      v13[3] = &unk_1E5263180;
      id v14 = v9;
      [v10 sendRequest:v11 completionHandler:v13];
    }
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(void *, void *))v8 + 2))(v8, v12);
  }
}

uint64_t __76__CoreTelephonyClient_CellularPlanManager__renewOneTimePassword_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__CoreTelephonyClient_CellularPlanManager__renewOneTimePassword_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleTermsAndConditionsCompleted:(id)a3 consented:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = &__block_literal_global_67;
  }
  if (v8)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __99__CoreTelephonyClient_CellularPlanManager__handleTermsAndConditionsCompleted_consented_completion___block_invoke_2;
    v17[3] = &unk_1E5260CB8;
    id v11 = v10;
    id v18 = v11;
    id v12 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v17];
    if (v12)
    {
      uint64_t v13 = [[CTXPCHandleTermsAndConditionsCompletedRequest alloc] initWithSourceIccid:v8 consented:v6];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      id v15[2] = __99__CoreTelephonyClient_CellularPlanManager__handleTermsAndConditionsCompleted_consented_completion___block_invoke_3;
      v15[3] = &unk_1E5263180;
      id v16 = v11;
      [v12 sendRequest:v13 completionHandler:v15];
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(void *, void *))v10 + 2))(v10, v14);
  }
}

uint64_t __99__CoreTelephonyClient_CellularPlanManager__handleTermsAndConditionsCompleted_consented_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __99__CoreTelephonyClient_CellularPlanManager__handleTermsAndConditionsCompleted_consented_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleUserEnteredOtp:(id)a3 otp:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = &__block_literal_global_70;
  }
  if (v8 && v9)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __80__CoreTelephonyClient_CellularPlanManager__handleUserEnteredOtp_otp_completion___block_invoke_2;
    v18[3] = &unk_1E5260CB8;
    id v12 = v11;
    id v19 = v12;
    uint64_t v13 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v18];
    if (v13)
    {
      id v14 = [[CTXPCHandleUserEnteredOtpRequest alloc] initWithSourceIccid:v8 otp:v9];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __80__CoreTelephonyClient_CellularPlanManager__handleUserEnteredOtp_otp_completion___block_invoke_3;
      v16[3] = &unk_1E5263180;
      id v17 = v12;
      [v13 sendRequest:v14 completionHandler:v16];
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(void *, void *))v11 + 2))(v11, v15);
  }
}

uint64_t __80__CoreTelephonyClient_CellularPlanManager__handleUserEnteredOtp_otp_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__CoreTelephonyClient_CellularPlanManager__handleUserEnteredOtp_otp_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)convertPhysicalToeSIMWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__CoreTelephonyClient_CellularPlanManager__convertPhysicalToeSIMWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v5 = v4;
  id v11 = v5;
  BOOL v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  if (v6)
  {
    id v7 = objc_alloc_init(CTXPCConvertPhysicalToeSIMRequest);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __87__CoreTelephonyClient_CellularPlanManager__convertPhysicalToeSIMWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E5263180;
    id v9 = v5;
    [v6 sendRequest:v7 completionHandler:v8];
  }
}

uint64_t __87__CoreTelephonyClient_CellularPlanManager__convertPhysicalToeSIMWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __87__CoreTelephonyClient_CellularPlanManager__convertPhysicalToeSIMWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPlanTransferCredentials:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = &__block_literal_global_75;
  }
  if (v6)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __82__CoreTelephonyClient_CellularPlanManager__getPlanTransferCredentials_completion___block_invoke_2;
    v15[3] = &unk_1E5260CB8;
    id v9 = v8;
    id v16 = v9;
    id v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v15];
    if (v10)
    {
      id v11 = [[CTXPCGetPlanTransferCredentialsRequest alloc] initWithIccid:v6];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __82__CoreTelephonyClient_CellularPlanManager__getPlanTransferCredentials_completion___block_invoke_3;
      v13[3] = &unk_1E5263180;
      id v14 = v9;
      [v10 sendRequest:v11 completionHandler:v13];
    }
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(void *, void, void *))v8 + 2))(v8, 0, v12);
  }
}

uint64_t __82__CoreTelephonyClient_CellularPlanManager__getPlanTransferCredentials_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__CoreTelephonyClient_CellularPlanManager__getPlanTransferCredentials_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 info];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (void)getTransferType:(id)a3 remoteEid:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = &__block_literal_global_79;
  }
  if (v8 && v9)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __81__CoreTelephonyClient_CellularPlanManager__getTransferType_remoteEid_completion___block_invoke_2;
    v17[3] = &unk_1E5260CB8;
    id v12 = v11;
    id v18 = v12;
    uint64_t v13 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v17];
    if (v13)
    {
      id v14 = [[CTXPCGetTransferTypeRequest alloc] initWithPlan:v8 remoteEid:v9];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      id v15[2] = __81__CoreTelephonyClient_CellularPlanManager__getTransferType_remoteEid_completion___block_invoke_3;
      v15[3] = &unk_1E5263180;
      id v16 = v12;
      [v13 sendRequest:v14 completionHandler:v15];
    }
  }
  else
  {
    (*((void (**)(void *, void))v11 + 2))(v11, 0);
  }
}

uint64_t __81__CoreTelephonyClient_CellularPlanManager__getTransferType_remoteEid_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__CoreTelephonyClient_CellularPlanManager__getTransferType_remoteEid_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v8 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v7 capability]);
  }
}

- (void)deleteTransferPlansForImei:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = &__block_literal_global_83;
  }
  if (v6)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __82__CoreTelephonyClient_CellularPlanManager__deleteTransferPlansForImei_completion___block_invoke_2;
    v14[3] = &unk_1E5260CB8;
    id v9 = v8;
    id v15 = v9;
    id v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
    if (v10)
    {
      id v11 = [[CTXPCDeleteTransferPlansRequest alloc] initWithImei:v6];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __82__CoreTelephonyClient_CellularPlanManager__deleteTransferPlansForImei_completion___block_invoke_3;
      v12[3] = &unk_1E5263180;
      id v13 = v9;
      [v10 sendRequest:v11 completionHandler:v12];
    }
  }
  else
  {
    (*((void (**)(void *, void))v8 + 2))(v8, 0);
  }
}

uint64_t __82__CoreTelephonyClient_CellularPlanManager__deleteTransferPlansForImei_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__CoreTelephonyClient_CellularPlanManager__deleteTransferPlansForImei_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v8 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v7 result]);
  }
}

- (void)deleteZone:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = &__block_literal_global_86;
  }
  if (v6)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66__CoreTelephonyClient_CellularPlanManager__deleteZone_completion___block_invoke_2;
    v14[3] = &unk_1E5260CB8;
    id v9 = v8;
    id v15 = v9;
    id v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
    if (v10)
    {
      id v11 = [[CTXPCDeleteZoneRequest alloc] initWithZone:v6];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __66__CoreTelephonyClient_CellularPlanManager__deleteZone_completion___block_invoke_3;
      v12[3] = &unk_1E5263180;
      id v13 = v9;
      [v10 sendRequest:v11 completionHandler:v12];
    }
  }
  else
  {
    (*((void (**)(void *, void))v8 + 2))(v8, 0);
  }
}

uint64_t __66__CoreTelephonyClient_CellularPlanManager__deleteZone_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__CoreTelephonyClient_CellularPlanManager__deleteZone_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v8 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v7 result]);
  }
}

- (void)plansPendingInstallWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__CoreTelephonyClient_CellularPlanManager__plansPendingInstallWithCompletion___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v10];
  if (v6)
  {
    id v7 = objc_alloc_init(CTXPCGetPendingInstallPlansRequest);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__CoreTelephonyClient_CellularPlanManager__plansPendingInstallWithCompletion___block_invoke_2;
    v8[3] = &unk_1E5263180;
    id v9 = v5;
    [v6 sendRequest:v7 completionHandler:v8];
  }
}

uint64_t __78__CoreTelephonyClient_CellularPlanManager__plansPendingInstallWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__CoreTelephonyClient_CellularPlanManager__plansPendingInstallWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 list];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (void)installPendingPlan:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = &__block_literal_global_90;
  }
  if (v6)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __74__CoreTelephonyClient_CellularPlanManager__installPendingPlan_completion___block_invoke_2;
    v15[3] = &unk_1E5260CB8;
    id v9 = v8;
    id v16 = v9;
    uint64_t v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v15];
    id v11 = [[CTXPCInstallPendingPlanRequest alloc] initWithPlan:v6];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__CoreTelephonyClient_CellularPlanManager__installPendingPlan_completion___block_invoke_3;
    v13[3] = &unk_1E5263180;
    id v14 = v9;
    [v10 sendRequest:v11 completionHandler:v13];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(void *, void *))v8 + 2))(v8, v12);
  }
}

uint64_t __74__CoreTelephonyClient_CellularPlanManager__installPendingPlan_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__CoreTelephonyClient_CellularPlanManager__installPendingPlan_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)installPendingPlanList:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = &__block_literal_global_93;
  }
  if (v6)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __78__CoreTelephonyClient_CellularPlanManager__installPendingPlanList_completion___block_invoke_2;
    v15[3] = &unk_1E5260CB8;
    id v9 = v8;
    id v16 = v9;
    uint64_t v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v15];
    id v11 = [[CTXPCInstallPendingPlansRequest alloc] initWithPlanList:v6];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __78__CoreTelephonyClient_CellularPlanManager__installPendingPlanList_completion___block_invoke_3;
    v13[3] = &unk_1E5263180;
    id v14 = v9;
    [v10 sendRequest:v11 completionHandler:v13];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(void *, void *))v8 + 2))(v8, v12);
  }
}

uint64_t __78__CoreTelephonyClient_CellularPlanManager__installPendingPlanList_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__CoreTelephonyClient_CellularPlanManager__installPendingPlanList_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getRemoteDevices:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__CoreTelephonyClient_CellularPlanManager__getRemoteDevices___block_invoke;
  v11[3] = &unk_1E5260CB8;
  id v5 = v4;
  id v12 = v5;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v11];
  id v7 = objc_alloc_init(CTXPCGetRemoteDevicesRequest);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__CoreTelephonyClient_CellularPlanManager__getRemoteDevices___block_invoke_2;
  v9[3] = &unk_1E5263180;
  id v8 = v5;
  id v10 = v8;
  [v6 sendRequest:v7 completionHandler:v9];
}

uint64_t __61__CoreTelephonyClient_CellularPlanManager__getRemoteDevices___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__CoreTelephonyClient_CellularPlanManager__getRemoteDevices___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 remoteDeviceList];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

- (void)getDeviceInfo:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__CoreTelephonyClient_CellularPlanManager__getDeviceInfo___block_invoke;
  v11[3] = &unk_1E5260CB8;
  id v5 = v4;
  id v12 = v5;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v11];
  id v7 = objc_alloc_init(CTXPCGetDeviceInfoRequest);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__CoreTelephonyClient_CellularPlanManager__getDeviceInfo___block_invoke_2;
  v9[3] = &unk_1E5263180;
  id v8 = v5;
  id v10 = v8;
  [v6 sendRequest:v7 completionHandler:v9];
}

uint64_t __58__CoreTelephonyClient_CellularPlanManager__getDeviceInfo___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__CoreTelephonyClient_CellularPlanManager__getDeviceInfo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v12;
    id v9 = v12;
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
    id v9 = v12;
  }

  id v11 = [v10 deviceInfo];
  (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v11, v6);
}

- (void)submitSimSetupUsage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = &__block_literal_global_98;
  }
  if (v6)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __75__CoreTelephonyClient_CellularPlanManager__submitSimSetupUsage_completion___block_invoke_2;
    v15[3] = &unk_1E5260CB8;
    id v9 = v8;
    id v16 = v9;
    id v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v15];
    id v11 = [[CTXPCSubmitSIMSetupUsageRequest alloc] initWithUsage:v6];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __75__CoreTelephonyClient_CellularPlanManager__submitSimSetupUsage_completion___block_invoke_3;
    v13[3] = &unk_1E5263180;
    id v14 = v9;
    [v10 sendRequest:v11 completionHandler:v13];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(void *, void *))v8 + 2))(v8, v12);
  }
}

uint64_t __75__CoreTelephonyClient_CellularPlanManager__submitSimSetupUsage_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__CoreTelephonyClient_CellularPlanManager__submitSimSetupUsage_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getCarrierSetupWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = &__block_literal_global_102;
  if (v4) {
    id v5 = v4;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__CoreTelephonyClient_CellularPlanManager__getCarrierSetupWithCompletion___block_invoke_2;
  v12[3] = &unk_1E5260CB8;
  id v6 = v5;
  id v13 = v6;
  id v7 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v12];
  id v8 = objc_alloc_init(CTXPCGetCarrierSetupItemsRequest);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__CoreTelephonyClient_CellularPlanManager__getCarrierSetupWithCompletion___block_invoke_3;
  v10[3] = &unk_1E5263180;
  id v9 = v6;
  id v11 = v9;
  [v7 sendRequest:v8 completionHandler:v10];
}

uint64_t __74__CoreTelephonyClient_CellularPlanManager__getCarrierSetupWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__CoreTelephonyClient_CellularPlanManager__getCarrierSetupWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v12;
    id v9 = v12;
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
    id v9 = v12;
  }

  id v11 = [v10 planList];
  (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v11, v6);
}

- (void)websheetInfoForPlan:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void, void, void))v7;
  if (v7)
  {
    if (v6)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      id v15[2] = __75__CoreTelephonyClient_CellularPlanManager__websheetInfoForPlan_completion___block_invoke;
      v15[3] = &unk_1E5260CB8;
      id v9 = v7;
      id v16 = v9;
      id v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v15];
      id v11 = [[CTXPCWebsheetInfoForPlanRequest alloc] initWithPlan:v6];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __75__CoreTelephonyClient_CellularPlanManager__websheetInfoForPlan_completion___block_invoke_2;
      v13[3] = &unk_1E5263180;
      id v14 = v9;
      [v10 sendRequest:v11 completionHandler:v13];
    }
    else
    {
      id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      ((void (**)(void, void, void, void, void *))v8)[2](v8, 0, 0, 0, v12);
    }
  }
}

uint64_t __75__CoreTelephonyClient_CellularPlanManager__websheetInfoForPlan_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75__CoreTelephonyClient_CellularPlanManager__websheetInfoForPlan_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v14 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v14;
    id v8 = v14;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v14;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = [v9 urlString];
  id v12 = [v9 postdata];
  id v13 = [v9 type];
  (*(void (**)(uint64_t, void *, void *, void *, id))(v10 + 16))(v10, v11, v12, v13, v6);
}

- (void)websheetInfoForPlan:(id)a3 inBuddy:(BOOL)a4 completion:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__CoreTelephonyClient_CellularPlanManager__websheetInfoForPlan_inBuddy_completion___block_invoke;
  v9[3] = &unk_1E5262E40;
  id v10 = v7;
  id v8 = v7;
  [(CoreTelephonyClient *)self websheetInfoForPlan:a3 completion:v9];
}

uint64_t __83__CoreTelephonyClient_CellularPlanManager__websheetInfoForPlan_inBuddy_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)websheetInfoForIccid:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [[CTAvailablePlan alloc] initWithIccid:v8];
  [(CoreTelephonyClient *)self websheetInfoForPlan:v7 completion:v6];
}

- (id)userDidExitWebsheetFlowForPlan:(id)a3
{
  id v5 = 0;
  [(CoreTelephonyClient *)self userDidExitWebsheetFlowForPlan:a3 error:&v5];
  id v3 = v5;

  return v3;
}

- (BOOL)userDidExitWebsheetFlowForPlan:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy__31;
    id v17 = __Block_byref_object_dispose__31;
    id v18 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __81__CoreTelephonyClient_CellularPlanManager__userDidExitWebsheetFlowForPlan_error___block_invoke;
    v12[3] = &unk_1E5260BA0;
    void v12[4] = &v13;
    id v7 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v12];
    id v8 = [[CTXPCUserDidExitWebsheetFlowForPlanRequest alloc] initWithPlan:v6];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__CoreTelephonyClient_CellularPlanManager__userDidExitWebsheetFlowForPlan_error___block_invoke_2;
    v11[3] = &unk_1E5261A50;
    void v11[4] = &v13;
    [v7 sendRequest:v8 completionHandler:v11];

    BOOL v9 = a4 == 0;
    if (a4) {
      *a4 = (id) v14[5];
    }

    _Block_object_dispose(&v13, 8);
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

void __81__CoreTelephonyClient_CellularPlanManager__userDidExitWebsheetFlowForPlan_error___block_invoke(uint64_t a1, void *a2)
{
}

void __81__CoreTelephonyClient_CellularPlanManager__userDidExitWebsheetFlowForPlan_error___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (void)encryptDataWithCarrierIdentifiers:(id)a3 mnc:(id)a4 gid1:(id)a5 gid2:(id)a6 data:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  long long v20 = (void (**)(void, void, void))v19;
  if (v19)
  {
    if (v14 && v15 && v18)
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __108__CoreTelephonyClient_CellularPlanManager__encryptDataWithCarrierIdentifiers_mnc_gid1_gid2_data_completion___block_invoke;
      v27[3] = &unk_1E5260CB8;
      id v21 = v19;
      id v28 = v21;
      long long v22 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v27];
      long long v23 = [[CTXPCEncryptDataRequest alloc] initWithMcc:v14 mnc:v15 gid1:v16 gid2:v17 plainText:v18];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __108__CoreTelephonyClient_CellularPlanManager__encryptDataWithCarrierIdentifiers_mnc_gid1_gid2_data_completion___block_invoke_2;
      v25[3] = &unk_1E5263180;
      id v26 = v21;
      [v22 sendRequest:v23 completionHandler:v25];
    }
    else
    {
      id v24 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      ((void (**)(void, void, void *))v20)[2](v20, 0, v24);
    }
  }
}

uint64_t __108__CoreTelephonyClient_CellularPlanManager__encryptDataWithCarrierIdentifiers_mnc_gid1_gid2_data_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __108__CoreTelephonyClient_CellularPlanManager__encryptDataWithCarrierIdentifiers_mnc_gid1_gid2_data_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v12;
    BOOL v9 = v12;
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
    BOOL v9 = v12;
  }

  id v11 = [v10 cipherText];
  (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v11, v6);
}

- (id)needToLaunchSetUpeSIM:(id *)a3
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__31;
  id v15 = __Block_byref_object_dispose__31;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__CoreTelephonyClient_CellularPlanManager__needToLaunchSetUpeSIM___block_invoke;
  v10[3] = &unk_1E5260BA0;
  void v10[4] = &v11;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v10];
  id v5 = (void *)v12[5];
  if (v5)
  {
    id v6 = 0;
    if (a3) {
      *a3 = v5;
    }
  }
  else
  {
    uint64_t v7 = objc_alloc_init(CTXPCNeedToLaunchSetUpeSIMRequest);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__CoreTelephonyClient_CellularPlanManager__needToLaunchSetUpeSIM___block_invoke_2;
    v9[3] = &unk_1E5261A50;
    void v9[4] = &v17;
    [v4 sendRequest:v7 completionHandler:v9];

    id v6 = [NSNumber numberWithBool:*((unsigned __int8 *)v18 + 24)];
  }

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v6;
}

void __66__CoreTelephonyClient_CellularPlanManager__needToLaunchSetUpeSIM___block_invoke(uint64_t a1, void *a2)
{
}

void __66__CoreTelephonyClient_CellularPlanManager__needToLaunchSetUpeSIM___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    id v6 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 result];
  }
}

- (void)registerSetUpeSIMLaunchedEvent:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__CoreTelephonyClient_CellularPlanManager__registerSetUpeSIMLaunchedEvent___block_invoke;
    v11[3] = &unk_1E5260CB8;
    id v6 = v4;
    id v12 = v6;
    id v7 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v11];
    id v8 = objc_alloc_init(CTXPCRegisterSetUpeSIMLaunchedEventRequest);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__CoreTelephonyClient_CellularPlanManager__registerSetUpeSIMLaunchedEvent___block_invoke_2;
    v9[3] = &unk_1E5263180;
    id v10 = v6;
    [v7 sendRequest:v8 completionHandler:v9];
  }
}

uint64_t __75__CoreTelephonyClient_CellularPlanManager__registerSetUpeSIMLaunchedEvent___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__CoreTelephonyClient_CellularPlanManager__registerSetUpeSIMLaunchedEvent___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setUpeSIMLaunched:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__CoreTelephonyClient_CellularPlanManager__setUpeSIMLaunched___block_invoke;
    v11[3] = &unk_1E5260CB8;
    id v6 = v4;
    id v12 = v6;
    id v7 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v11];
    id v8 = objc_alloc_init(CTPXCSetUpeSIMLaunchedRequest);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__CoreTelephonyClient_CellularPlanManager__setUpeSIMLaunched___block_invoke_2;
    v9[3] = &unk_1E5263180;
    id v10 = v6;
    [v7 sendRequest:v8 completionHandler:v9];
  }
}

uint64_t __62__CoreTelephonyClient_CellularPlanManager__setUpeSIMLaunched___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__CoreTelephonyClient_CellularPlanManager__setUpeSIMLaunched___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)submitPlanSetupDetails:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = &__block_literal_global_113;
  }
  if (v6)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __78__CoreTelephonyClient_CellularPlanManager__submitPlanSetupDetails_completion___block_invoke_2;
    v15[3] = &unk_1E5260CB8;
    id v9 = v8;
    id v16 = v9;
    id v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v15];
    uint64_t v11 = [[CTXPCSubmitPlanSetupDetailsRequest alloc] initWithDetails:v6];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __78__CoreTelephonyClient_CellularPlanManager__submitPlanSetupDetails_completion___block_invoke_3;
    v13[3] = &unk_1E5263180;
    id v14 = v9;
    [v10 sendRequest:v11 completionHandler:v13];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(void *, void *))v8 + 2))(v8, v12);
  }
}

uint64_t __78__CoreTelephonyClient_CellularPlanManager__submitPlanSetupDetails_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__CoreTelephonyClient_CellularPlanManager__submitPlanSetupDetails_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)plansPendingCrossPlatformTransferWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = &__block_literal_global_116;
  if (v4) {
    id v5 = v4;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __92__CoreTelephonyClient_CellularPlanManager__plansPendingCrossPlatformTransferWithCompletion___block_invoke_2;
  v12[3] = &unk_1E5260CB8;
  id v6 = v5;
  id v13 = v6;
  id v7 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v12];
  id v8 = objc_alloc_init(CTXPCGetPlansPendingCrossPlatformTransferRequest);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__CoreTelephonyClient_CellularPlanManager__plansPendingCrossPlatformTransferWithCompletion___block_invoke_3;
  v10[3] = &unk_1E5263180;
  id v9 = v6;
  id v11 = v9;
  [v7 sendRequest:v8 completionHandler:v10];
}

uint64_t __92__CoreTelephonyClient_CellularPlanManager__plansPendingCrossPlatformTransferWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92__CoreTelephonyClient_CellularPlanManager__plansPendingCrossPlatformTransferWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v12;
    id v9 = v12;
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
    id v9 = v12;
  }

  id v11 = [v10 planList];
  (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v11, v6);
}

- (id)shouldShoweSIMTravelTip:(id *)a3
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__31;
  id v15 = __Block_byref_object_dispose__31;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__CoreTelephonyClient_CellularPlanManager__shouldShoweSIMTravelTip___block_invoke;
  v10[3] = &unk_1E5260BA0;
  void v10[4] = &v11;
  id v4 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v10];
  id v5 = (void *)v12[5];
  if (v5)
  {
    id v6 = 0;
    if (a3) {
      *a3 = v5;
    }
  }
  else
  {
    uint64_t v7 = objc_alloc_init(CTXPCShouldShoweSIMTravelTipRequest);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__CoreTelephonyClient_CellularPlanManager__shouldShoweSIMTravelTip___block_invoke_2;
    v9[3] = &unk_1E5261A50;
    void v9[4] = &v17;
    [v4 sendRequest:v7 completionHandler:v9];

    id v6 = [NSNumber numberWithBool:*((unsigned __int8 *)v18 + 24)];
  }

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v6;
}

void __68__CoreTelephonyClient_CellularPlanManager__shouldShoweSIMTravelTip___block_invoke(uint64_t a1, void *a2)
{
}

void __68__CoreTelephonyClient_CellularPlanManager__shouldShoweSIMTravelTip___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    id v6 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 result];
  }
}

- (BOOL)sendTravelBuddyCAEvent:(id)a3 carrierName:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8 && v9)
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    char v20 = __Block_byref_object_copy__31;
    id v21 = __Block_byref_object_dispose__31;
    id v22 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __85__CoreTelephonyClient_CellularPlanManager__sendTravelBuddyCAEvent_carrierName_error___block_invoke;
    v16[3] = &unk_1E5260BA0;
    void v16[4] = &v17;
    uint64_t v11 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v16];
    id v12 = [[CTXPCSendTravelBuddyCAEventRequest alloc] initWithAction:v8 carrierName:v10];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __85__CoreTelephonyClient_CellularPlanManager__sendTravelBuddyCAEvent_carrierName_error___block_invoke_2;
    v15[3] = &unk_1E5261A50;
    void v15[4] = &v17;
    [v11 sendRequest:v12 completionHandler:v15];

    if (a5) {
      *a5 = (id) v18[5];
    }
    BOOL v13 = v18[5] == 0;

    _Block_object_dispose(&v17, 8);
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    BOOL v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

void __85__CoreTelephonyClient_CellularPlanManager__sendTravelBuddyCAEvent_carrierName_error___block_invoke(uint64_t a1, void *a2)
{
}

void __85__CoreTelephonyClient_CellularPlanManager__sendTravelBuddyCAEvent_carrierName_error___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (void)retrieveAppListURLWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__CoreTelephonyClient_CellularPlanManager__retrieveAppListURLWithCompletion___block_invoke;
  v7[3] = &unk_1E5267810;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CoreTelephonyClient *)self getSubscriptionInfo:v7];

  if (v5) {
    dispatch_release(v5);
  }
}

void __77__CoreTelephonyClient_CellularPlanManager__retrieveAppListURLWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v19 = v5;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v5)
  {
    id v7 = [[CTBundle alloc] initWithBundleType:6];
    v27[0] = @"AppStoreCollectionCountryID";
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = [v5 subscriptions];
    id v6 = 0;
    uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v23;
      while (2)
      {
        uint64_t v11 = 0;
        id v12 = v6;
        do
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(obj);
          }
          BOOL v13 = *(void **)(a1 + 32);
          id v14 = [*(id *)(*((void *)&v22 + 1) + 8 * v11) context];
          id v21 = v12;
          id v15 = (void *)[v13 copyCarrierBundleValue:v14 keyHierarchy:v8 bundleType:v7 error:&v21];
          id v6 = v21;

          if (!v6 && v15)
          {
            (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

            id v6 = 0;
            goto LABEL_15;
          }

          ++v11;
          id v12 = v6;
        }
        while (v9 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_15:
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 40);
    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v18 = (void *)[v17 initWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*(void (**)(uint64_t, void *, void))(v16 + 16))(v16, v18, 0);

    id v6 = 0;
  }
}

- (id)retrieveDeviceIdentifier:(unint64_t)a3 error:(id *)a4
{
  id v7 = [MEMORY[0x1E4F28B50] mainBundle];
  id v8 = [v7 bundleIdentifier];

  if (v8)
  {
    uint64_t v9 = [(CoreTelephonyClient *)self retrieveDeviceIdentifier:a3 clientBundleIdentifier:v8 error:a4];
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:14 userInfo:0];
    uint64_t v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)retrieveDeviceIdentifier:(unint64_t)a3 clientBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy__31;
  id v26 = __Block_byref_object_dispose__31;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__31;
  char v20 = __Block_byref_object_dispose__31;
  id v21 = 0;
  if (!v8 || a3 == 3)
  {
    if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      id v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __98__CoreTelephonyClient_CellularPlanManager__retrieveDeviceIdentifier_clientBundleIdentifier_error___block_invoke;
    v15[3] = &unk_1E5260BA0;
    void v15[4] = &v16;
    uint64_t v9 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v15];
    uint64_t v10 = [[CTXPCGetLocalDeviceIdentifierRequest alloc] initWithType:a3 clientBundleIdentifier:v8];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __98__CoreTelephonyClient_CellularPlanManager__retrieveDeviceIdentifier_clientBundleIdentifier_error___block_invoke_2;
    v14[3] = &unk_1E5267838;
    void v14[4] = &v16;
    void v14[5] = &v22;
    void v14[6] = a3;
    [v9 sendRequest:v10 completionHandler:v14];

    uint64_t v11 = (void *)v17[5];
    if (v11)
    {
      id v12 = 0;
      if (a5) {
        *a5 = v11;
      }
    }
    else
    {
      id v12 = (id)v23[5];
    }
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);

  return v12;
}

void __98__CoreTelephonyClient_CellularPlanManager__retrieveDeviceIdentifier_clientBundleIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __98__CoreTelephonyClient_CellularPlanManager__retrieveDeviceIdentifier_clientBundleIdentifier_error___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a3);
  id v15 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v15;
    id v8 = v15;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v15;
  }

  uint64_t v10 = a1[6];
  if (v10 == 2)
  {
    uint64_t v11 = [v9 deviceID];
    uint64_t v12 = [v11 IMEI];
  }
  else
  {
    if (v10 != 1) {
      goto LABEL_9;
    }
    uint64_t v11 = [v9 deviceID];
    uint64_t v12 = [v11 EID];
  }
  uint64_t v13 = *(void *)(a1[5] + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

LABEL_9:
}

- (BOOL)isAutofilleSIMIdAllowedForDomain:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28B50] mainBundle];
    id v8 = [v7 bundleIdentifier];

    if (v8)
    {
      uint64_t v20 = 0;
      id v21 = &v20;
      uint64_t v22 = 0x3032000000;
      long long v23 = __Block_byref_object_copy__31;
      uint64_t v24 = __Block_byref_object_dispose__31;
      id v25 = 0;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __83__CoreTelephonyClient_CellularPlanManager__isAutofilleSIMIdAllowedForDomain_error___block_invoke;
      v19[3] = &unk_1E5260BA0;
      void v19[4] = &v20;
      id v9 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v19];
      uint64_t v15 = 0;
      uint64_t v16 = &v15;
      uint64_t v17 = 0x2020000000;
      char v18 = 0;
      uint64_t v10 = [[CTXPCIsAutofillAllowedForDomainRequest alloc] initWithDomain:v6 bundleIdentifier:v8];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __83__CoreTelephonyClient_CellularPlanManager__isAutofilleSIMIdAllowedForDomain_error___block_invoke_2;
      v14[3] = &unk_1E5261A78;
      void v14[4] = &v15;
      void v14[5] = &v20;
      [v9 sendRequest:v10 completionHandler:v14];

      uint64_t v11 = (void *)v21[5];
      if (v11)
      {
        BOOL v12 = 0;
        if (a4) {
          *a4 = v11;
        }
      }
      else
      {
        BOOL v12 = *((unsigned char *)v16 + 24) != 0;
      }
      _Block_object_dispose(&v15, 8);

      _Block_object_dispose(&v20, 8);
    }
    else if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:14 userInfo:0];
      BOOL v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    BOOL v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

void __83__CoreTelephonyClient_CellularPlanManager__isAutofilleSIMIdAllowedForDomain_error___block_invoke(uint64_t a1, void *a2)
{
}

void __83__CoreTelephonyClient_CellularPlanManager__isAutofilleSIMIdAllowedForDomain_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v9 result];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
}

- (BOOL)isAutofilleSIMIdAllowedForDomain:(id)a3 clientBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v11 = [v10 bundleIdentifier];
  char v12 = [v11 hasPrefix:@"com.apple"];

  if ((v12 & 1) == 0)
  {
    if (a5)
    {
      char v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:1 userInfo:0];
LABEL_11:
      BOOL v17 = 0;
      *a5 = v18;
      goto LABEL_15;
    }
LABEL_12:
    BOOL v17 = 0;
    goto LABEL_15;
  }
  uint64_t v13 = [v9 length];
  if (!v8 || !v13)
  {
    if (a5)
    {
      char v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__31;
  id v30 = __Block_byref_object_dispose__31;
  id v31 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __106__CoreTelephonyClient_CellularPlanManager__isAutofilleSIMIdAllowedForDomain_clientBundleIdentifier_error___block_invoke;
  v25[3] = &unk_1E5260BA0;
  void v25[4] = &v26;
  id v14 = [(CoreTelephonyClient *)self synchronousProxyWithErrorHandler:v25];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = [[CTXPCIsAutofillAllowedForDomainWithinClientRequest alloc] initWithDomain:v8 clientBundleIdentifier:v9];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __106__CoreTelephonyClient_CellularPlanManager__isAutofilleSIMIdAllowedForDomain_clientBundleIdentifier_error___block_invoke_2;
  v20[3] = &unk_1E5261A78;
  void v20[4] = &v21;
  void v20[5] = &v26;
  [v14 sendRequest:v15 completionHandler:v20];

  if (a5 && (uint64_t v16 = (void *)v27[5]) != 0)
  {
    BOOL v17 = 0;
    *a5 = v16;
  }
  else
  {
    BOOL v17 = *((unsigned char *)v22 + 24) != 0;
  }
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v26, 8);
LABEL_15:

  return v17;
}

void __106__CoreTelephonyClient_CellularPlanManager__isAutofilleSIMIdAllowedForDomain_clientBundleIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __106__CoreTelephonyClient_CellularPlanManager__isAutofilleSIMIdAllowedForDomain_clientBundleIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    id v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
    id v8 = v12;
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v9 result];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
}

- (void)startPendingPlanInstallationForPlan:(id)a3 carrierName:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(void, void, void))v10;
  if (v10)
  {
    if (v8 && v9)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __110__CoreTelephonyClient_CellularPlanManager__startPendingPlanInstallationForPlan_carrierName_completionHandler___block_invoke;
      v18[3] = &unk_1E5260CB8;
      id v12 = v10;
      id v19 = v12;
      uint64_t v13 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v18];
      id v14 = [[CTXPCStartPendingPlanInstallFlowRequest alloc] initWithPlan:v8 carrierName:v9];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __110__CoreTelephonyClient_CellularPlanManager__startPendingPlanInstallationForPlan_carrierName_completionHandler___block_invoke_2;
      v16[3] = &unk_1E5263180;
      id v17 = v12;
      [v13 sendRequest:v14 completionHandler:v16];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      ((void (**)(void, void, void *))v11)[2](v11, 0, v15);
    }
  }
}

uint64_t __110__CoreTelephonyClient_CellularPlanManager__startPendingPlanInstallationForPlan_carrierName_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __110__CoreTelephonyClient_CellularPlanManager__startPendingPlanInstallationForPlan_carrierName_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v11;
    id v9 = v11;
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
    id v9 = v11;
  }

  (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, [v10 result], v6);
}

- (void)checkProfileEligibility:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __88__CoreTelephonyClient_CellularPlanManager__checkProfileEligibility_metadata_completion___block_invoke;
    v17[3] = &unk_1E5260CB8;
    id v12 = v10;
    id v18 = v12;
    uint64_t v13 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v17];
    id v14 = [[CTXPCCheckProfileEligibilityRequest alloc] initWithSmdpURL:v8 metadata:v9];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __88__CoreTelephonyClient_CellularPlanManager__checkProfileEligibility_metadata_completion___block_invoke_2;
    v15[3] = &unk_1E5263180;
    id v16 = v12;
    [v13 sendRequest:v14 completionHandler:v15];
  }
}

uint64_t __88__CoreTelephonyClient_CellularPlanManager__checkProfileEligibility_metadata_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__CoreTelephonyClient_CellularPlanManager__checkProfileEligibility_metadata_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v11;
    id v9 = v11;
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
    id v9 = v11;
  }

  (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, [v10 result], v6);
}

- (void)checkPreFlightEligibility:(id)a3 mccs:(id)a4 mncs:(id)a5 gid1s:(id)a6 gid2s:(id)a7 smdpUrl:(id)a8 iccidPrefix:(id)a9 completion:(id)a10
{
  id v27 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  uint64_t v23 = v22;
  if (v22)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __123__CoreTelephonyClient_CellularPlanManager__checkPreFlightEligibility_mccs_mncs_gid1s_gid2s_smdpUrl_iccidPrefix_completion___block_invoke;
    v30[3] = &unk_1E5260CB8;
    id v24 = v22;
    id v31 = v24;
    id v25 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v30];
    uint64_t v26 = [[CTXPCCheckPreFlightEligibilityRequest alloc] initWithIccid:v27 mccs:v16 mncs:v17 gid1s:v18 gid2s:v19 smdpUrl:v20 iccidPrefix:v21];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __123__CoreTelephonyClient_CellularPlanManager__checkPreFlightEligibility_mccs_mncs_gid1s_gid2s_smdpUrl_iccidPrefix_completion___block_invoke_2;
    v28[3] = &unk_1E5263180;
    id v29 = v24;
    [v25 sendRequest:v26 completionHandler:v28];
  }
}

uint64_t __123__CoreTelephonyClient_CellularPlanManager__checkPreFlightEligibility_mccs_mncs_gid1s_gid2s_smdpUrl_iccidPrefix_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __123__CoreTelephonyClient_CellularPlanManager__checkPreFlightEligibility_mccs_mncs_gid1s_gid2s_smdpUrl_iccidPrefix_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v11;
    id v9 = v11;
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
    id v9 = v11;
  }

  (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, [v10 result], v6);
}

- (void)overridePlanSelection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__CoreTelephonyClient_CellularPlanManager__overridePlanSelection_completion___block_invoke;
    v14[3] = &unk_1E5260CB8;
    id v9 = v7;
    id v15 = v9;
    id v10 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v14];
    id v11 = [[CTXPCOverridePlanSelectionRequest alloc] initWithIccid:v6];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__CoreTelephonyClient_CellularPlanManager__overridePlanSelection_completion___block_invoke_2;
    v12[3] = &unk_1E5263180;
    id v13 = v9;
    [v10 sendRequest:v11 completionHandler:v12];
  }
}

uint64_t __77__CoreTelephonyClient_CellularPlanManager__overridePlanSelection_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__CoreTelephonyClient_CellularPlanManager__overridePlanSelection_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v8;
    id v6 = v8;
    id v7 = v5;
  }
  else
  {
    id v7 = 0;
    id v6 = v8;
  }

  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, [v7 result]);
}

- (void)setEosStatus:(id)a3 assertionState:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__CoreTelephonyClient_Eos__setEosStatus_assertionState_completion___block_invoke;
  v13[3] = &unk_1E5261178;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v13];
  [v12 setEosStatus:v11 assertionState:v10 completion:v9];
}

uint64_t __67__CoreTelephonyClient_Eos__setEosStatus_assertionState_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getEosStatus:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__CoreTelephonyClient_Eos__getEosStatus___block_invoke;
  v7[3] = &unk_1E5261178;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  [v6 getEosStatus:v5];
}

uint64_t __41__CoreTelephonyClient_Eos__getEosStatus___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getEOSFirmwareUpdateInfo:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__CoreTelephonyClient_Eos__getEOSFirmwareUpdateInfo___block_invoke;
  v7[3] = &unk_1E5261178;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(CoreTelephonyClient *)self proxyWithErrorHandler:v7];
  [v6 getEOSFirmwareUpdateInfo:v5];
}

uint64_t __53__CoreTelephonyClient_Eos__getEOSFirmwareUpdateInfo___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__CoreTelephonyClient_initWithQueue_multiplexer___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18444A000, a2, OS_LOG_TYPE_ERROR, "Could not convert state to serialized data: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __49__CoreTelephonyClient_initWithQueue_multiplexer___block_invoke_cold_2(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_18444A000, log, OS_LOG_TYPE_DEBUG, "Created %zu bytes of NS serialized", buf, 0xCu);
}

void __49__CoreTelephonyClient_initWithQueue_multiplexer___block_invoke_cold_3(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_18444A000, a2, OS_LOG_TYPE_DEBUG, "Skipping state handler for %d", (uint8_t *)v3, 8u);
}

void __77__CoreTelephonyClient_PlanTransfer__carrierOneTimeCodeSendersWithCompletion___block_invoke_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_18444A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "invalid ct client", v0, 2u);
}

@end