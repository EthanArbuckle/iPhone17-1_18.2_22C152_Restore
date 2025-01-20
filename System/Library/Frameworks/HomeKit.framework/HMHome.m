@interface HMHome
+ (BOOL)accessorySupportsMediaAccessControl:(id)a3;
+ (BOOL)isValidMediaPassword:(id)a3 error:(id *)a4;
+ (BOOL)supportsSecureCoding;
+ (id)errorByDeviceWithOverallError:(id)a3;
+ (id)generateMediaPasswordWithError:(id *)a3;
+ (id)logCategory;
+ (id)passSerialNumberWithHomeUUID:(id)a3 userUUID:(id)a4;
- (BOOL)_addActionSetFromResponse:(id)a3 completion:(id)a4;
- (BOOL)_addEventTriggerFromResponse:(id)a3 withEventTrigger:(id)a4 completion:(id)a5;
- (BOOL)_addTimerTriggerFromResponse:(id)a3 withTimerTrigger:(id)a4 completion:(id)a5;
- (BOOL)_addTrigger:(id)a3 triggerUUID:(id)a4 completion:(id)a5;
- (BOOL)_areAllUserInviteInformationValid:(id)a3;
- (BOOL)_handleActionSetRemovedFromResponse:(id)a3 responsePayload:(id)a4;
- (BOOL)_mergeAccessories:(id)a3;
- (BOOL)_mergeAccessoryProtectionGroups:(id)a3;
- (BOOL)_mergeActionSets:(id)a3;
- (BOOL)_mergeIsFeatureHomeTheaterQFAEnabled:(BOOL)a3;
- (BOOL)_mergeOutgoingInvitations:(id)a3;
- (BOOL)_mergeResidentDevices:(id)a3;
- (BOOL)_mergeRooms:(id)a3;
- (BOOL)_mergeServiceGroups:(id)a3;
- (BOOL)_mergeTriggerOwnedActionSets:(id)a3;
- (BOOL)_mergeTriggers:(id)a3;
- (BOOL)_mergeUsers:(id)a3;
- (BOOL)_mergeZones:(id)a3;
- (BOOL)_removeTriggerFromResponse:(id)a3 completion:(id)a4;
- (BOOL)_setSupportedFeature:(int64_t)a3 enabled:(BOOL)a4;
- (BOOL)adoptTriggerOwnedActionSet:(id)a3;
- (BOOL)areAutomationBuildersSupported;
- (BOOL)areBulletinNotificationsSupported;
- (BOOL)areNotificationsEnabled;
- (BOOL)didOnboardAudioAnalysis;
- (BOOL)didOnboardEventLog;
- (BOOL)didOnboardLocationServices;
- (BOOL)dismissedWalletKeyUWBUnlockOnboarding;
- (BOOL)hasAnyUserAcknowledgedCameraRecordingOnboarding;
- (BOOL)hasOnboardedForAccessCode;
- (BOOL)hasOnboardedForWalletKey;
- (BOOL)isAdminUser;
- (BOOL)isAutomaticSoftwareUpdateEnabled;
- (BOOL)isAutomaticThirdPartyAccessorySoftwareUpdateEnabled;
- (BOOL)isEventLogEnabled;
- (BOOL)isFeatureHomeTheaterQFAEnabled;
- (BOOL)isLocationServicesEnabled;
- (BOOL)isMediaPeerToPeerEnabled;
- (BOOL)isMultiUserEnabled;
- (BOOL)isOwnerUser;
- (BOOL)isPrimary;
- (BOOL)isUpdatedToROAR;
- (BOOL)mergeFromNewObject:(id)a3;
- (BOOL)multiUserEnabled;
- (BOOL)notificationEnableRequested;
- (BOOL)notificationEnableRequestedForAppleMediaAccessories;
- (BOOL)soundCheckEnabled;
- (BOOL)supportsAddingNetworkRouter;
- (BOOL)supportsResidentActionSetStateEvaluation;
- (BOOL)supportsResidentSelection;
- (BOOL)validateBuilder:(id)a3 error:(id *)a4;
- (CLLocation)homeLocation;
- (HMAccessCodeManager)accessCodeManager;
- (HMAccessorySoftwareUpdateControllerV2)softwareUpdateController;
- (HMActionSet)builtinActionSetOfType:(NSString *)actionSetType;
- (HMApplicationData)applicationData;
- (HMFMessageDestination)messageDestination;
- (HMFVersion)supportedSiriEndPointVersion;
- (HMHome)init;
- (HMHome)initWithCoder:(id)a3;
- (HMHome)initWithName:(id)a3 uuid:(id)a4;
- (HMHome)initWithName:(id)a3 uuid:(id)a4 mediaSystems:(id)a5;
- (HMHomeAccessControl)homeAccessControlForUser:(HMUser *)user;
- (HMHomeDelegatePrivate)_privateDelegate;
- (HMHomeHubState)homeHubState;
- (HMHomeManager)homeManager;
- (HMHomePersonManager)personManager;
- (HMHomePersonManagerSettings)personManagerSettings;
- (HMMediaSystemStageManager)mediaSystemStageManager;
- (HMMutableArray)currentAccessories;
- (HMMutableArray)currentAccessoryProtectionGroups;
- (HMMutableArray)currentActionSets;
- (HMMutableArray)currentOutgoingInvitations;
- (HMMutableArray)currentResidentDevices;
- (HMMutableArray)currentRooms;
- (HMMutableArray)currentServiceGroups;
- (HMMutableArray)currentTriggerOwnedActionSets;
- (HMMutableArray)currentTriggers;
- (HMMutableArray)currentUsers;
- (HMMutableArray)currentZones;
- (HMPersonSettingsManager)personSettingsManager;
- (HMResidentDevice)userSelectedPreferredResident;
- (HMRoom)roomForEntireHome;
- (HMUser)currentUser;
- (NSArray)accessories;
- (NSArray)accessoryProtectionGroups;
- (NSArray)actionSets;
- (NSArray)autoSelectedPreferredResidents;
- (NSArray)managedTriggers;
- (NSArray)rooms;
- (NSArray)serviceGroups;
- (NSArray)servicesWithTypes:(NSArray *)serviceTypes;
- (NSArray)triggerOwnedActionSets;
- (NSArray)triggers;
- (NSArray)users;
- (NSArray)zones;
- (NSDate)notificationsUpdatedTime;
- (NSMutableDictionary)hmModernMessagingOptionsByMessageName;
- (NSMutableDictionary)hmModernMessagingRequestHandlersByMessageName;
- (NSNumber)matterFabricID;
- (NSNumber)numberOfCameras;
- (NSOperationQueue)shareWithHomeOwnerOperationQueue;
- (NSSet)supportedFeatures;
- (NSString)assistantIdentifier;
- (NSString)description;
- (NSString)matterControllerID;
- (NSString)mediaPassword;
- (NSString)name;
- (NSString)threadNetworkID;
- (NSString)walletKeyPassSerialNumber;
- (NSTimeZone)timeZone;
- (NSUUID)personManagerZoneUUID;
- (NSUUID)threadNetworkCredentialsUUID;
- (NSUUID)uniqueIdentifier;
- (NSUUID)uuid;
- (_HMContext)context;
- (id)__defaultProgressHandlerForAddAccessory;
- (id)__responseHandlerForRequests:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5 activity:(id)a6;
- (id)_addObjectOfClass:(void *)a3 fromResponse:(void *)a4 toArray:;
- (id)_createFailedAccessoriesListFromError:(id)a3;
- (id)_encodeEvents:(void *)a3 error:;
- (id)_encodeTriggerBuilder:(void *)a3 error:;
- (id)_findCharacteristic:(id)a3 forService:(id)a4 accessoryUUID:(id)a5;
- (id)_findService:(id)a3 accessoryUUID:(id)a4;
- (id)_findUserWithID:(id)a3;
- (id)_getContainerForAppData:(id)a3;
- (id)_getUserWithUUID:(id)a3;
- (id)accessoryInfoFetch;
- (id)accessoryUUIDForIdentifier:(id)a3;
- (id)accessoryWithIdsIdentifier:(id)a3;
- (id)accessoryWithUUID:(id)a3;
- (id)accessoryWithUniqueIdentifier:(id)a3;
- (id)actionSetWithName:(id)a3;
- (id)actionSetWithUUID:(id)a3;
- (id)administrator;
- (id)communalUsers;
- (id)controlTargets;
- (id)createAccessCodeManager;
- (id)createActionSetWithName:(id)a3 type:(id)a4 uuid:(id)a5;
- (id)createAndAddActionSetWithName:(id)a3 type:(id)a4 uuid:(id)a5;
- (id)createHomeAudioAnalysisEventSubscriber;
- (id)createSiriEndpointProfilesMessenger;
- (id)delegate;
- (id)encodeActionSetBuilder:(id)a3 error:(id *)a4;
- (id)encodeEventTriggerBuilder:(id)a3 error:(id *)a4;
- (id)lightProfileWithProfileUUID:(id)a3;
- (id)location;
- (id)logIdentifier;
- (id)matterStartupParametersXPCConnectBlock;
- (id)mediaDestinationsWithHomeTheaterSupportedOptions;
- (id)mediaDestinationsWithSupportedOptions:(unint64_t)a3;
- (id)mediaProfileWithProfileUUID:(id)a3;
- (id)mediaProfileWithUUID:(id)a3;
- (id)mediaSystemWithUUID:(id)a3;
- (id)mediaSystemWithUniqueIdentifier:(id)a3;
- (id)mediaSystems;
- (id)newActionSetBuilder;
- (id)newActionSetBuilderWithName:(id)a3;
- (id)newEventTriggerBuilder;
- (id)newEventTriggerBuilderWithName:(id)a3 events:(id)a4 endEvents:(id)a5 recurrences:(id)a6 predicate:(id)a7;
- (id)newEventTriggerBuilderWithName:(id)a3 events:(id)a4 predicate:(id)a5;
- (id)newTimerTriggerBuilder;
- (id)newTimerTriggerBuilderWithName:(id)a3 fireDate:(id)a4 timeZone:(id)a5 recurrence:(id)a6;
- (id)newTimerTriggerBuilderWithName:(id)a3 significantEvent:(id)a4 significantEventOffset:(id)a5 recurrences:(id)a6;
- (id)outgoingInvitations;
- (id)owner;
- (id)personManagerWithUUID:(id)a3;
- (id)photosPersonManagerForUser:(id)a3;
- (id)photosPersonManagerWithUUID:(id)a3;
- (id)profileWithUniqueIdentifier:(id)a3;
- (id)removeMediaSystemRequestResponseHandlerWithMediaSystem:(id)a3 context:(id)a4 messageIdentifier:(id)a5 completionHandler:(id)a6;
- (id)residentDevices;
- (id)restrictedGuests;
- (id)roomWithName:(id)a3;
- (id)roomWithUUID:(id)a3;
- (id)serviceGroupWithName:(id)a3;
- (id)serviceGroupWithUUID:(id)a3;
- (id)targetControllers;
- (id)triggerOwnedActionSetWithUUID:(id)a3;
- (id)triggerWithName:(id)a3;
- (id)triggerWithUUID:(id)a3;
- (id)userActionPredictionController;
- (id)userFromPayload:(id)a3;
- (id)userWithUUID:(id)a3;
- (id)zoneWithName:(id)a3;
- (id)zoneWithUUID:(id)a3;
- (int64_t)homeLocationStatus;
- (int64_t)locationAuthorization;
- (int64_t)minimumMediaUserPrivilege;
- (int64_t)protectionMode;
- (unint64_t)audioAnalysisClassifierOptions;
- (unint64_t)eventLogDuration;
- (unint64_t)networkRouterSupport;
- (unint64_t)networkRouterSupportDisableReason;
- (unint64_t)siriPhraseOptions;
- (void)__configureWithContext:(id)a3 homeManager:(id)a4;
- (void)__handleExecuteRequest:(id)a3 activity:(id)a4 batchRequest:(id)a5;
- (void)__updateHomeAccessControlFromResponsePayload:(id)a3 forUser:(id)a4;
- (void)__updateLocation:(id)a3 locationStatus:(int64_t)a4;
- (void)_acceptInvitation:(id)a3 completionHandler:(id)a4;
- (void)_addAccessory:(id)a3 accessoryDescription:(id)a4 password:(id)a5 setupCodeDeferred:(BOOL)a6 progress:(id)a7 completionHandler:(id)a8;
- (void)_addActionSetWithName:(id)a3 completionHandler:(id)a4;
- (void)_addRoomWithName:(id)a3 completionHandler:(id)a4;
- (void)_addServiceGroupWithName:(id)a3 completionHandler:(id)a4;
- (void)_addTrigger:(id)a3 completionHandler:(id)a4;
- (void)_addZoneWithName:(id)a3 completionHandler:(id)a4;
- (void)_assignAccessory:(id)a3 toRoom:(id)a4 completionHandler:(id)a5;
- (void)_callDelegateDidOnboardEventLog;
- (void)_callDelegateDidUpdateEventLogEnabled;
- (void)_callProgressHandler:(id)a3 updatingAccessoryDescription:(id)a4 fromMessage:(id)a5;
- (void)_cancelInvitation:(id)a3 completionHandler:(id)a4;
- (void)_cancelPairingForAccessoryWithDescription:(id)a3 completionHandler:(id)a4;
- (void)_cancelPairingForAccessoryWithUUID:(id)a3 completionHandler:(id)a4;
- (void)_clearRequestHandlerForMessageName:(id)a3;
- (void)_configureOutgoingInvitation:(id)a3;
- (void)_continuePairingForAccessoryWithUUID:(id)a3 setupCode:(id)a4 onboardingSetupPayloadString:(id)a5 completionHandler:(id)a6;
- (void)_didAddAccessoryNetworkProtectionGroup:(id)a3;
- (void)_didRemoveAccessoryNetworkProtectionGroup:(id)a3;
- (void)_didUpdateAccessoryNetworkProtectionGroup:(id)a3;
- (void)_didUpdateNetworkRouterSupport;
- (void)_enableNotification:(BOOL)a3 forCharacteristics:(id)a4 completionHandler:(id)a5;
- (void)_enableNotifications:(BOOL)a3 includeAppleMediaAccessoryNotifications:(BOOL)a4 completionHandler:(id)a5;
- (void)_executeActionSet:(id)a3 activity:(id)a4 reportContext:(id)a5 completionHandler:(id)a6;
- (void)_handleAccessoryAddedNotification:(id)a3;
- (void)_handleAccessoryConnectivityChangedNotification:(id)a3;
- (void)_handleAccessoryErrorNotification:(id)a3;
- (void)_handleAccessoryInfoUpdatedNotification:(id)a3;
- (void)_handleAccessoryNetworkProtectionGroupAddedNotification:(id)a3;
- (void)_handleAccessoryNetworkProtectionGroupRemovedNotification:(id)a3;
- (void)_handleAccessoryRemovedResponse:(id)a3;
- (void)_handleAccessoryReprovisionStateUpdate:(id)a3;
- (void)_handleAccessoryReprovisionedNotification:(id)a3;
- (void)_handleAccessorySetupCodeFailureMessage:(id)a3;
- (void)_handleAddAccessoryProgressNotification:(id)a3;
- (void)_handleDidAddWalletKeyMessage:(id)a3;
- (void)_handleDidRemoveWalletKeyMessage:(id)a3;
- (void)_handleHMMMRequestReceivedMessage:(id)a3;
- (void)_handleHomeHubStateUpdatedNotification:(id)a3;
- (void)_handleHomeLocationStatusUpdateNotification:(id)a3;
- (void)_handleHomeLocationUpdate:(id)a3;
- (void)_handleHomeLocationUpdateNotification:(id)a3;
- (void)_handleHomeNetworkRouterSupportUpdated:(id)a3;
- (void)_handleLocationAuthorizationUpdatedNotification:(id)a3;
- (void)_handleMultiUserEnabledChangeNotification:(id)a3;
- (void)_handleMultipleCharacteristicValuesUpdated:(id)a3;
- (void)_handleNotificationsEnabled:(id)a3;
- (void)_handleRuntimeStateUpdate:(id)a3 reason:(id)a4;
- (void)_handleUserAddedNotification:(id)a3;
- (void)_handleUserInvitationsUpdatedNotification:(id)a3;
- (void)_invokeDelegateForAppData:(id)a3;
- (void)_manageUsersWithCompletionHandler:(id)a3;
- (void)_notifyDelegateOfAccesoryInvitationsUpdateForUser:(id)a3;
- (void)_notifyDelegateOfAccessControlUpdateForUser:(id)a3;
- (void)_notifyDelegateOfAppDataUpdate;
- (void)_notifyDelegateOfAppDataUpdateForActionSet:(id)a3;
- (void)_notifyDelegateOfAppDataUpdateForRoom:(id)a3;
- (void)_notifyDelegateOfAppDataUpdateForServiceGroup:(id)a3;
- (void)_notifyDelegateOfBulletinNotificationsSupportedUpdate;
- (void)_notifyDelegateOfHomeHubStateUpdate;
- (void)_notifyDelegateOfTriggerAdded:(id)a3;
- (void)_notifyDelegateOfTriggerRemoved:(id)a3;
- (void)_notifyDelegateOfTriggerUpdated:(id)a3;
- (void)_notifyDelegateOfUpdatedHomeLocationStatus;
- (void)_notifySetupFailedIfInHomeUIService:(id)a3;
- (void)_notifyUpdatedSupportedFeatures;
- (void)_performBatchRequest:(id)a3 activity:(id)a4;
- (void)_recomputeAssistantIdentifier;
- (void)_registerNotificationHandlers;
- (void)_removeAccessory:(id)a3 completionHandler:(id)a4;
- (void)_removeActionSet:(id)a3 completionHandler:(id)a4;
- (void)_removeActionSetsForAccessory:(id)a3;
- (void)_removeEventsForAccessory:(id)a3;
- (void)_removeIncompatibleTrigger:(id)a3;
- (void)_removeResidentDevicesForAccessory:(id)a3;
- (void)_removeRoom:(id)a3 completionHandler:(id)a4;
- (void)_removeServiceGroup:(id)a3 completionHandler:(id)a4;
- (void)_removeServices:(id)a3;
- (void)_removeTrigger:(id)a3 completionHandler:(id)a4;
- (void)_removeUser:(id)a3 completionHandler:(id)a4;
- (void)_removeZone:(id)a3 completionHandler:(id)a4;
- (void)_reprovisionAccessory:(id)a3 completionHandler:(id)a4;
- (void)_retrieveLocation;
- (void)_retrieveResultsWithReportingContext:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5 activity:(id)a6;
- (void)_setRequestHandler:(id)a3 forMessageName:(id)a4 withOptions:(id)a5;
- (void)_startPairingWithAccessoryDescription:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (void)_unconfigure;
- (void)_updateDidOnboardEventLog:(void *)a3 completion:;
- (void)_updateInvitation:(id)a3 invitationState:(int64_t)a4 completionHandler:(id)a5;
- (void)_updateName:(id)a3 completionHandler:(id)a4;
- (void)_userDidConfirmExecution:(BOOL)a3 ofTriggerWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)addAccessory:(HMAccessory *)accessory completionHandler:(void *)completion;
- (void)addAccessory:(id)a3 password:(id)a4 completionHandler:(id)a5;
- (void)addAccessory:(id)a3 password:(id)a4 progress:(id)a5 completionHandler:(id)a6;
- (void)addAccessoryWithAccessorySetupPayload:(id)a3 progress:(id)a4 completionHandler:(id)a5;
- (void)addActionSetFromBuilder:(id)a3 completionHandler:(id)a4;
- (void)addActionSetWithName:(NSString *)actionSetName completionHandler:(void *)completion;
- (void)addAndSetUpNewAccessoriesWithSuggestedRoomName:(id)a3 completionHandler:(id)a4;
- (void)addAndSetupAccessoriesWithCompletionHandler:(void *)completion;
- (void)addAndSetupAccessoriesWithPayload:(HMAccessorySetupPayload *)payload completionHandler:(void *)completion;
- (void)addEventTriggerFromBuilder:(id)a3 completionHandler:(id)a4;
- (void)addRoomWithName:(NSString *)roomName completionHandler:(void *)completion;
- (void)addServiceGroupWithName:(NSString *)serviceGroupName completionHandler:(void *)completion;
- (void)addTimerTriggerFromBuilder:(id)a3 completionHandler:(id)a4;
- (void)addTrigger:(HMTrigger *)trigger completionHandler:(void *)completion;
- (void)addUser:(id)a3 withCompletionHandler:(id)a4;
- (void)addUserWithCompletionHandler:(void *)completion;
- (void)addUserWithoutConfirmation:(id)a3 privilege:(int64_t)a4 completionHandler:(id)a5;
- (void)addWalletKeyToPairedWatchesWithOptions:(int64_t)a3 completion:(id)a4;
- (void)addWalletKeyWithOptions:(int64_t)a3 completion:(id)a4;
- (void)addWalletKeyWithOptions:(int64_t)a3 completionHandler:(id)a4;
- (void)addZoneWithName:(NSString *)zoneName completionHandler:(void *)completion;
- (void)assignAccessory:(HMAccessory *)accessory toRoom:(HMRoom *)room completionHandler:(void *)completion;
- (void)cancelPairingForAccessoryWithDescription:(id)a3 completionHandler:(id)a4;
- (void)cancelPairingForAccessoryWithUUID:(id)a3 completionHandler:(id)a4;
- (void)clearEventLogWithCompletionHandler:(id)a3;
- (void)configurePersonManager;
- (void)confirmResidentWithCompletion:(id)a3;
- (void)continuePairingForAccessoryWithUUID:(id)a3 setupCode:(id)a4 completionHandler:(id)a5;
- (void)continuePairingForAccessoryWithUUID:(id)a3 setupCode:(id)a4 onboardingSetupPayloadString:(id)a5 completionHandler:(id)a6;
- (void)dealloc;
- (void)enableExpressForWalletKeyWithAuthData:(id)a3 completion:(id)a4;
- (void)enableMultiUserWithCompletionHandler:(id)a3;
- (void)enableNotification:(BOOL)a3 forCharacteristics:(id)a4 completionHandler:(id)a5;
- (void)enableNotifications:(BOOL)a3 completionHandler:(id)a4;
- (void)enableNotifications:(BOOL)a3 includeAppleMediaAccessoryNotifications:(BOOL)a4 completionHandler:(id)a5;
- (void)enableRemoteAccess:(BOOL)a3 completionHandler:(id)a4;
- (void)enableUWBUnlockWithAuthData:(id)a3 completion:(id)a4;
- (void)establishShareWithHomeOwner:(id)a3 container:(id)a4 allowWriteAccess:(BOOL)a5 completionHandler:(id)a6;
- (void)establishShareWithHomeOwner:(id)a3 container:(id)a4 completionHandler:(id)a5;
- (void)executeActionSet:(HMActionSet *)actionSet completionHandler:(void *)completion;
- (void)executeActions:(id)a3 completionHandler:(id)a4;
- (void)fetchAvailableWalletKeyEncodedPKPass:(id)a3;
- (void)fetchExistingWalletKeyUUIDWithCompletion:(id)a3;
- (void)fetchHasWalletKeyWithCompletion:(id)a3;
- (void)fetchIsExpressEnabledForWalletKeyWithCompletion:(id)a3;
- (void)fetchIsWalletKeySupportedOnAnyPairedWatchWithCompletion:(id)a3;
- (void)fetchIsWalletKeySupportedWithCompletion:(id)a3;
- (void)fetchLastModifiedServiceOfType:(id)a3 completionHandler:(id)a4;
- (void)fetchMissingWalletKeysForAccessory:(id)a3 completion:(id)a4;
- (void)fetchMissingWalletKeysForUser:(id)a3 completion:(id)a4;
- (void)fetchPresenceForUsers:(id)a3 completion:(id)a4;
- (void)fetchSettingsForLightProfiles:(id)a3 withCompletion:(id)a4;
- (void)fetchTriggerNameForTriggerIdentifier:(id)a3 completionHandler:(id)a4;
- (void)fetchWalleKeyExpressEnablementConflictingPassDescription:(id)a3;
- (void)fetchWalletKeyColorWithCompletion:(id)a3;
- (void)fetchWalletKeyCustomURLWithCompletion:(id)a3;
- (void)fetchWalletKeyDeviceStateForPairedWatchesWithCompletion:(id)a3;
- (void)fetchWalletKeyDeviceStateWithCompletion:(id)a3;
- (void)fetchWalletKeyEncodedPKPass:(id)a3;
- (void)fetchWalletKeyEncodedPKPassWithIgnoredErrorCodes:(id)a3 completion:(id)a4;
- (void)fetchWiFiInfosWithTimeout:(double)a3 completion:(id)a4;
- (void)handleRuntimeStateUpdate:(id)a3 reason:(id)a4;
- (void)inviteUsers:(id)a3 completionHandler:(id)a4;
- (void)inviteUsersWithInviteInformation:(id)a3 completionHandler:(id)a4;
- (void)joinThreadNetwork:(id)a3 withCompletion:(id)a4;
- (void)joinThreadNetworkWithCompletion:(id)a3;
- (void)manageUsersWithCompletionHandler:(void *)completion;
- (void)matterControllerXPCConnectBlock;
- (void)mergeFromNewObjectNoMergeCount:(id)a3;
- (void)notifyDelegateOfAccesoryInvitationsUpdateForUser:(id)a3;
- (void)notifyDelegateOfAccessControlUpdateForUser:(id)a3;
- (void)notifyDelegateOfAppDataUpdateForActionSet:(id)a3;
- (void)notifyDelegateOfAppDataUpdateForRoom:(id)a3;
- (void)notifyDelegateOfAppDataUpdateForServiceGroup:(id)a3;
- (void)notifyDelegatesOfExecutionForActionSet:(id)a3 atDate:(id)a4;
- (void)performBatchCharacteristicRequest:(id)a3;
- (void)performBatchRequest:(id)a3;
- (void)performMediaGroupReadinessCheckForAccessory:(id)a3 timeout:(double)a4 setupSessionIdentifier:(id)a5 completion:(id)a6;
- (void)postConfigure;
- (void)queryRemoteAccessWithCompletionHandler:(id)a3;
- (void)reEnableNotifications;
- (void)reRegisterHMMMHandlers;
- (void)recomputeAssistantIdentifier;
- (void)recomputeAssistantIdentifiersWithCompletion:(id)a3;
- (void)registerModernMessagingRequestHandlerWithMessageName:(id)a3 options:(id)a4 requestHandler:(id)a5 completionHandler:(id)a6;
- (void)removeAccessory:(HMAccessory *)accessory completionHandler:(void *)completion;
- (void)removeActionSet:(HMActionSet *)actionSet completionHandler:(void *)completion;
- (void)removeMediaSystem:(id)a3 completionHandler:(id)a4;
- (void)removeRoom:(HMRoom *)room completionHandler:(void *)completion;
- (void)removeServiceGroup:(HMServiceGroup *)group completionHandler:(void *)completion;
- (void)removeServices:(id)a3;
- (void)removeTrigger:(HMTrigger *)trigger completionHandler:(void *)completion;
- (void)removeUser:(HMUser *)user completionHandler:(void *)completion;
- (void)removeZone:(HMZone *)zone completionHandler:(void *)completion;
- (void)reprovisionAccessory:(id)a3 completionHandler:(id)a4;
- (void)resetAndRemoveAllCHIPPairingsFromAccessory:(id)a3 completion:(id)a4;
- (void)resetDidOnboardEventLogWithCompletionHandler:(id)a3;
- (void)resolveThreadNetworkCredentialsWithCompletion:(id)a3;
- (void)restoreMissingWalletKeys:(id)a3 completion:(id)a4;
- (void)retrieveHomeKitLocationForFeedbackWithCompletionHandler:(id)a3;
- (void)retrieveResultsWithReportingContext:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (void)selectPreferredResident:(id)a3 completion:(id)a4;
- (void)selectPreferredResident:(id)a3 requireAutoUpdate:(BOOL)a4 completion:(id)a5;
- (void)sendModernMessagingRequestWithMessageName:(id)a3 destination:(id)a4 requestPayload:(id)a5 options:(id)a6 responseHandler:(id)a7 completionHandler:(id)a8;
- (void)setAccessCodeManager:(id)a3;
- (void)setAccessoryInfoFetch:(id)a3;
- (void)setAccessoryNetworkProtectionChangeSupportMinHomeKitVersion:(id)a3 completionHandler:(id)a4;
- (void)setAdminUser:(BOOL)a3;
- (void)setApplicationData:(id)a3;
- (void)setAssistantIdentifier:(id)a3;
- (void)setAudioAnalysisClassifierOptions:(unint64_t)a3;
- (void)setAutoSelectedPreferredResidents:(id)a3;
- (void)setAutomaticSoftwareUpdateEnabled:(BOOL)a3;
- (void)setAutomaticThirdPartyAccessorySoftwareUpdateEnabled:(BOOL)a3;
- (void)setBulletinNotificationsSupported:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setCurrentAccessoryProtectionGroups:(id)a3;
- (void)setCurrentOutgoingInvitations:(id)a3;
- (void)setCurrentResidentDevices:(id)a3;
- (void)setCurrentServiceGroups:(id)a3;
- (void)setCurrentTriggerOwnedActionSets:(id)a3;
- (void)setCurrentUser:(id)a3;
- (void)setCurrentUsers:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setDidOnboardAudioAnalysis:(BOOL)a3;
- (void)setDidOnboardEventLog:(BOOL)a3;
- (void)setDidOnboardLocationServices:(BOOL)a3;
- (void)setDismissedWalletKeyUWBUnlockOnboarding:(BOOL)a3;
- (void)setDismissedWalletKeyUWBUnlockOnboardingWithCompletion:(id)a3;
- (void)setEventLogDuration:(unint64_t)a3;
- (void)setEventLogEnabled:(BOOL)a3;
- (void)setExpressSettingsAuthData:(id)a3 enableUWB:(BOOL)a4 enableNFCExpress:(BOOL)a5 completion:(id)a6;
- (void)setHasAnyUserAcknowledgedCameraRecordingOnboarding:(BOOL)a3;
- (void)setHasAnyUserAcknowledgedCameraRecordingOnboardingWithCompletionHandler:(id)a3;
- (void)setHasOnboardedForAccessCode:(BOOL)a3;
- (void)setHasOnboardedForAccessCodeWithCompletion:(id)a3;
- (void)setHasOnboardedForWalletKey:(BOOL)a3;
- (void)setHasOnboardedForWalletKeyWithCompletion:(id)a3;
- (void)setHmModernMessagingOptionsByMessageName:(id)a3;
- (void)setHmModernMessagingRequestHandlersByMessageName:(id)a3;
- (void)setHomeLocation:(id)a3;
- (void)setHomeLocationStatus:(int64_t)a3;
- (void)setHomeManager:(id)a3;
- (void)setIsFeatureHomeTheaterQFAEnabled:(BOOL)a3;
- (void)setIsUpdatedToROAR:(BOOL)a3;
- (void)setLocationAuthorization:(int64_t)a3;
- (void)setLocationServicesEnabled:(BOOL)a3;
- (void)setManagedTriggers:(id)a3;
- (void)setMediaPassword:(id)a3;
- (void)setMediaPeerToPeerEnabled:(BOOL)a3;
- (void)setMinimumMediaUserPrivilege:(int64_t)a3;
- (void)setMultiUserEnabled:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNetworkRouterSupport:(unint64_t)a3;
- (void)setNetworkRouterSupportDisableReason:(unint64_t)a3;
- (void)setNetworkRouterSupportMinimumHomeKitVersion:(id)a3 completionHandler:(id)a4;
- (void)setNotificationEnableRequested:(BOOL)a3;
- (void)setNotificationEnableRequestedForAppleMediaAccessories:(BOOL)a3;
- (void)setNotificationsEnabled:(BOOL)a3;
- (void)setNotificationsUpdatedTime:(id)a3;
- (void)setNumberOfCameras:(id)a3;
- (void)setOwnerUser:(BOOL)a3;
- (void)setPersonManager:(id)a3;
- (void)setPersonManagerSettings:(id)a3;
- (void)setPersonManagerZoneUUID:(id)a3;
- (void)setPreferredPrimary:(id)a3 oneTime:(BOOL)a4 triggerElection:(BOOL)a5 completionHandler:(id)a6;
- (void)setPrimary:(BOOL)a3;
- (void)setProtectionMode:(int64_t)a3;
- (void)setShareWithHomeOwnerOperationQueue:(id)a3;
- (void)setSiriPhraseOptions:(unint64_t)a3;
- (void)setSoftwareUpdateController:(id)a3;
- (void)setSoundCheckEnabled:(BOOL)a3;
- (void)setSupportedFeatures:(id)a3;
- (void)setSupportedSiriEndPointVersion:(id)a3;
- (void)setSupportsResidentActionSetStateEvaluation:(BOOL)a3;
- (void)setSupportsResidentSelection:(BOOL)a3;
- (void)setThreadNetworkID:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setUserSelectedPreferredResident:(id)a3;
- (void)shareWithHomeOwner:(id)a3 container:(id)a4 completionHandler:(id)a5;
- (void)stageAddedMediaSystem:(id)a3;
- (void)stageRemovedMediaSystemUUID:(id)a3;
- (void)startDiscoveringSymptomsForNearbyDevices;
- (void)startHomeDataSyncWithCompletionHandler:(id)a3;
- (void)startPairingWithAccessory:(id)a3 accessorySetupDescription:(id)a4 progress:(id)a5 completionHandler:(id)a6;
- (void)startPairingWithAccessoryDescription:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)startSearchForAccessoriesNeedingReprovisioning;
- (void)stopDiscoveringSymptomsForNearbyDevices;
- (void)switchBackToREV2FromResidentSelectionWithCompletion:(id)a3;
- (void)unblockAccessory:(HMAccessory *)accessory completionHandler:(void *)completion;
- (void)unconfigure;
- (void)unjoinThreadNetworkWithCompletion:(id)a3;
- (void)unregisterModernMessagingRequestHandlerWithMessageName:(id)a3 completionHandler:(id)a4;
- (void)updateAccessForUser:(id)a3 administrator:(BOOL)a4 completionHandler:(id)a5;
- (void)updateAccessForUser:(id)a3 announceAccess:(BOOL)a4 completionHandler:(id)a5;
- (void)updateAccessForUser:(id)a3 audioAnalysisUserDropinAccessLevel:(unint64_t)a4 completionHandler:(id)a5;
- (void)updateAccessForUser:(id)a3 camerasAccessLevel:(unint64_t)a4 completionHandler:(id)a5;
- (void)updateAccessForUser:(id)a3 remoteAccess:(BOOL)a4 completionHandler:(id)a5;
- (void)updateAccessoryNetworkProtectionGroup:(id)a3 protectionMode:(int64_t)a4 completion:(id)a5;
- (void)updateApplicationData:(id)a3 completionHandler:(id)a4;
- (void)updateApplicationData:(id)a3 forActionSet:(id)a4 completionHandler:(id)a5;
- (void)updateApplicationData:(id)a3 forAppDataContainer:(id)a4 appDataContainerUUIDKeyName:(id)a5 completionHandler:(id)a6;
- (void)updateApplicationData:(id)a3 forRoom:(id)a4 completionHandler:(id)a5;
- (void)updateApplicationData:(id)a3 forServiceGroup:(id)a4 completionHandler:(id)a5;
- (void)updateAudioAnalysisClassifierOptions:(unint64_t)a3 completion:(id)a4;
- (void)updateAutomaticSoftwareUpdateEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)updateDidOnboardAudioAnalysis:(BOOL)a3 completion:(id)a4;
- (void)updateDidOnboardEventLogWithCompletionHandler:(id)a3;
- (void)updateDidOnboardLocationServices:(BOOL)a3 completion:(id)a4;
- (void)updateEventLogDuration:(unint64_t)a3 completionHandler:(id)a4;
- (void)updateEventLogEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)updateForUser:(id)a3 presenceAuthorizationStatus:(unint64_t)a4 completionHandler:(id)a5;
- (void)updateLocationServicesEnabled:(BOOL)a3 completion:(id)a4;
- (void)updateMediaPassword:(id)a3 completionHandler:(id)a4;
- (void)updateMediaPeerToPeerEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)updateMinimumMediaUserPrivilege:(int64_t)a3 completionHandler:(id)a4;
- (void)updateName:(NSString *)name completionHandler:(void *)completion;
- (void)updateNetworkProtection:(int64_t)a3 completionHandler:(id)a4;
- (void)updatePersonManagerSettings:(id)a3 completion:(id)a4;
- (void)updateResidentSelectionVersion:(id)a3 completion:(id)a4;
- (void)updateSiriPhraseOptions:(unint64_t)a3 completion:(id)a4;
- (void)updateSoundCheckEnabled:(BOOL)a3 completion:(id)a4;
- (void)userDidConfirmExecution:(BOOL)a3 ofTrigger:(id)a4 completionHandler:(id)a5;
- (void)userDidConfirmExecution:(BOOL)a3 ofTriggerWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)userDidRespondToConsentRequestForSetupAccessoryDescription:(id)a3 withResponse:(int64_t)a4;
@end

@implementation HMHome

- (HMHomeAccessControl)homeAccessControlForUser:(HMUser *)user
{
  return [(HMUser *)user homeAccessControl];
}

- (void)_handleMultipleCharacteristicValuesUpdated:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMHome *)self context];
  v6 = [v5 pendingRequests];

  unsigned __int8 v66 = 0;
  unsigned int v7 = [v4 BOOLForKey:@"kMultiPartResponseKey" keyPresent:&v66];
  v8 = (void *)MEMORY[0x19F3A64A0]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    v12 = [v4 shortDescription];
    v13 = [v4 messagePayload];
    *(_DWORD *)buf = 138543874;
    v70 = v11;
    __int16 v71 = 2112;
    v72 = v12;
    __int16 v73 = 2112;
    v74 = v13;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling multiple characteristic values updated message %@ with payload: %@", buf, 0x20u);
  }
  v53 = v9;

  v51 = v6;
  unsigned int v48 = v7;
  if (v7)
  {
    v14 = [v4 identifier];
    uint64_t v15 = [v6 retrieveCompletionBlockForIdentifier:v14];

    uint64_t v16 = 0;
  }
  else
  {
    int v17 = v66;
    v18 = [v4 identifier];
    uint64_t v19 = [v6 removeCompletionBlockForIdentifier:v18];

    BOOL v20 = v17 == 0;
    if (v17) {
      uint64_t v15 = v19;
    }
    else {
      uint64_t v15 = 0;
    }
    if (v20) {
      uint64_t v16 = v19;
    }
    else {
      uint64_t v16 = 0;
    }
  }
  v49 = (void *)v16;
  v50 = (void (**)(void, void, void, void))v15;
  BOOL v54 = (v16 | v15) == 0;
  v21 = [v4 dictionaryForKey:@"kModifiedCharacteristicsForAccessoryKey"];
  v55 = [MEMORY[0x1E4F1CA48] array];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v22 = v21;
  id v52 = v4;
  v23 = v9;
  uint64_t v56 = [v22 countByEnumeratingWithState:&v62 objects:v68 count:16];
  if (v56)
  {
    uint64_t v24 = *(void *)v63;
    unint64_t v25 = 0x1E4F29000uLL;
    do
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v63 != v24) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        v28 = objc_msgSend(v22, "hmf_dictionaryForKey:", v27);
        v29 = (void *)[objc_alloc(*(Class *)(v25 + 296)) initWithUUIDString:v27];
        v30 = [(HMHome *)v23 accessoryWithUUID:v29];

        if (v30)
        {
          v31 = [v30 _handleMultipleCharacteristicsUpdated:v28 message:v4 informDelegate:v54];
          [v55 addObjectsFromArray:v31];
        }
        else
        {
          uint64_t v32 = v24;
          id v33 = v22;
          v34 = (void *)MEMORY[0x19F3A64A0]();
          v35 = v23;
          v36 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v37 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v70 = v37;
            __int16 v71 = 2112;
            v72 = v27;
            _os_log_impl(&dword_19D1A8000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find accessory for characteristic updated accessory UUID: %@", buf, 0x16u);

            id v4 = v52;
          }

          v23 = v53;
          id v22 = v33;
          uint64_t v24 = v32;
          unint64_t v25 = 0x1E4F29000;
        }
      }
      uint64_t v56 = [v22 countByEnumeratingWithState:&v62 objects:v68 count:16];
    }
    while (v56);
  }

  if (!v54)
  {
    id v57 = v22;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v38 = v55;
    v39 = (void *)[v38 countByEnumeratingWithState:&v58 objects:v67 count:16];
    if (v39)
    {
      unint64_t v40 = 0;
      uint64_t v41 = *(void *)v59;
      do
      {
        for (j = 0; j != v39; j = (char *)j + 1)
        {
          if (*(void *)v59 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = [*(id *)(*((void *)&v58 + 1) + 8 * (void)j) error];

          if (v43) {
            ++v40;
          }
        }
        v39 = (void *)[v38 countByEnumeratingWithState:&v58 objects:v67 count:16];
      }
      while (v39);

      uint64_t v44 = v48;
      if (v40)
      {
        if (v40 >= [v38 count]) {
          uint64_t v45 = 74;
        }
        else {
          uint64_t v45 = 73;
        }
        v39 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:v45 userInfo:0];
        if (v49) {
          goto LABEL_43;
        }
LABEL_39:
        if (v50) {
          ((void (**)(void, void *, uint64_t, id))v50)[2](v50, v39, v44, v38);
        }
        goto LABEL_44;
      }
      v39 = 0;
      if (!v49) {
        goto LABEL_39;
      }
    }
    else
    {

      uint64_t v44 = v48;
      if (!v49) {
        goto LABEL_39;
      }
    }
LABEL_43:
    v46 = [(HMHome *)v23 context];
    v47 = [v46 delegateCaller];
    [v47 callCompletion:v49 error:v39 array:v38];

LABEL_44:
    id v4 = v52;
    id v22 = v57;
  }
}

- (id)accessoryWithUUID:(id)a3
{
  id v4 = a3;
  v5 = [(HMHome *)self currentAccessories];
  v6 = [v5 firstItemWithUUID:v4];

  return v6;
}

- (NSArray)accessories
{
  v2 = [(HMHome *)self currentAccessories];
  v3 = [v2 array];

  return (NSArray *)v3;
}

- (HMMutableArray)currentAccessories
{
  return self->_currentAccessories;
}

- (void)_performBatchRequest:(id)a3 activity:(id)a4
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v104 = [(HMHome *)self context];
  if (v104)
  {
    SEL v100 = a2;
    v103 = self;
    v9 = [MEMORY[0x1E4F1CA60] dictionary];
    v10 = [v7 requests];
    uint64_t v11 = [v10 count];

    v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v11];
    v106 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    v13 = [v7 clientContext];
    v14 = [v13 metricIdentifier];
    v101 = v8;
    [v8 setClientMetricIdentifier:v14];

    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    id obj = [v7 requests];
    v107 = v9;
    uint64_t v109 = [obj countByEnumeratingWithState:&v118 objects:v124 count:16];
    uint64_t v15 = 0;
    if (!v109) {
      goto LABEL_56;
    }
    uint64_t v110 = *(void *)v119;
    v105 = v12;
    v102 = v7;
LABEL_4:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v119 != v110) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(id *)(*((void *)&v118 + 1) + 8 * v16);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v18 = v17;
      }
      else {
        v18 = 0;
      }
      uint64_t v19 = v18;

      if (v19)
      {
        v93 = (void *)MEMORY[0x19F3A64A0]();
        v94 = v103;
        v95 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
        {
          v96 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v126 = v96;
          __int16 v127 = 2112;
          v128 = v19;
          _os_log_impl(&dword_19D1A8000, v95, OS_LOG_TYPE_ERROR, "%{public}@Attribute requests not yet supported %@", buf, 0x16u);
        }
        id v7 = v102;
        v97 = [v102 completionHandler];
        v98 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
        ((void (**)(void, void *))v97)[2](v97, v98);

        goto LABEL_69;
      }
      id v20 = v17;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v21 = v20;
      }
      else {
        v21 = 0;
      }
      uint64_t v19 = v21;

      if (v19)
      {
        id v7 = v102;
        [(HMHome *)v103 __handleExecuteRequest:v19 activity:v101 batchRequest:v102];
        goto LABEL_70;
      }
      id v22 = v20;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v23 = v22;
      }
      else {
        v23 = 0;
      }
      id v24 = v23;

      id v25 = v24;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v26 = v25;
      }
      else {
        v26 = 0;
      }
      id v27 = v26;

      id v28 = v25;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v29 = v28;
      }
      else {
        v29 = 0;
      }
      id v114 = v29;

      v30 = [v28 characteristic];
      v31 = [v30 service];
      uint64_t v32 = [v31 accessoryUUID];
      id v33 = v32;
      v113 = v27;
      if (!v32)
      {
        v34 = [[HMCharacteristicResponse alloc] initWithRequest:v28 value:0 error:v106];
        [v12 addObject:v34];
        int v41 = 5;
        goto LABEL_52;
      }
      v34 = [v32 UUIDString];
      v112 = objc_msgSend(v9, "hmf_mutableDictionaryForKey:", v34);
      if (v112)
      {
        if (v27) {
          goto LABEL_27;
        }
      }
      else
      {
        v112 = [MEMORY[0x1E4F1CA60] dictionary];
        objc_msgSend(v9, "setObject:forKey:");
        if (v27)
        {
LABEL_27:
          if (v15)
          {
            v111 = v15;
            if (([(__CFString *)v15 isEqual:@"kMultipleCharacteristicReadRequestKey"] & 1) == 0)
            {
              v35 = (void *)MEMORY[0x19F3A64A0]();
              v36 = v103;
              v37 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                id v38 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v126 = v38;
                __int16 v127 = 2112;
                v128 = (const char *)v111;
                v39 = v37;
                unint64_t v40 = "%{public}@Batch request does not support combining read requests with other request types - %@";
                goto LABEL_38;
              }
LABEL_39:

              v42 = [v102 completionHandler];
              v43 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
              ((void (**)(void, void *))v42)[2](v42, v43);
              int v41 = 1;
              goto LABEL_50;
            }
          }
          else
          {
            uint64_t v44 = @"kMultipleCharacteristicReadRequestKey";
            v111 = @"kMultipleCharacteristicReadRequestKey";
          }
          uint64_t v45 = [v31 instanceID];
          v46 = [v45 stringValue];
          objc_msgSend(v112, "hmf_mutableArrayForKey:", v46);
          v42 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

          if (!v42)
          {
            v42 = [MEMORY[0x1E4F1CA48] array];
            v47 = [v31 instanceID];
            unsigned int v48 = [v47 stringValue];
            [v112 setObject:v42 forKey:v48];
          }
          v43 = [v30 instanceID];
          [v42 addObject:v43];
          goto LABEL_49;
        }
      }
      if (v114)
      {
        if (v15)
        {
          v111 = v15;
          if (([(__CFString *)v15 isEqual:@"kMultipleCharacteristicWriteRequestKey"] & 1) == 0)
          {
            v35 = (void *)MEMORY[0x19F3A64A0]();
            v36 = v103;
            v37 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              id v38 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v126 = v38;
              __int16 v127 = 2112;
              v128 = (const char *)v111;
              v39 = v37;
              unint64_t v40 = "%{public}@Batch request does not support combining write requests with other request types - %@";
LABEL_38:
              _os_log_impl(&dword_19D1A8000, v39, OS_LOG_TYPE_ERROR, v40, buf, 0x16u);

              v9 = v107;
            }
            goto LABEL_39;
          }
        }
        else
        {
          v49 = @"kMultipleCharacteristicWriteRequestKey";
          v111 = @"kMultipleCharacteristicWriteRequestKey";
        }
        v50 = [v31 instanceID];
        v51 = [v50 stringValue];
        objc_msgSend(v112, "hmf_mutableDictionaryForKey:", v51);
        v42 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

        if (!v42)
        {
          v42 = [MEMORY[0x1E4F1CA60] dictionary];
          id v52 = [v31 instanceID];
          v53 = [v52 stringValue];
          [v112 setObject:v42 forKey:v53];
        }
        v43 = [v114 value];
        BOOL v54 = [v30 instanceID];
        v55 = [v54 stringValue];
        [v42 setObject:v43 forKey:v55];

LABEL_49:
        int v41 = 0;
        v9 = v107;
LABEL_50:

        v12 = v105;
        uint64_t v15 = v111;
        goto LABEL_51;
      }
      int v41 = 0;
LABEL_51:

LABEL_52:
      if (v41 != 5 && v41)
      {
        id v7 = v102;
        goto LABEL_71;
      }
      if (v109 == ++v16)
      {
        id v7 = v102;
        uint64_t v109 = [obj countByEnumeratingWithState:&v118 objects:v124 count:16];
        if (v109) {
          goto LABEL_4;
        }
LABEL_56:

        if ([v12 count])
        {
          uint64_t v56 = [v104 delegateCaller];
          id v57 = [v7 progressHandler];
          [v56 callCompletion:v57 array:v12];
        }
        if ([v9 count])
        {
          id v58 = objc_alloc(MEMORY[0x1E4F653F0]);
          long long v59 = NSString;
          long long v60 = MEMORY[0x19F3A5D00](v103, v100);
          [v59 stringWithFormat:@"%@, %s:%ld", v60, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/HMHome.m", 7849];
          v62 = long long v61 = v7;
          long long v63 = (void *)[v58 initWithName:v62];

          long long v64 = [v61 requests];
          [v64 count];

          long long v65 = [v61 requests];
          unsigned __int8 v66 = [v61 progressHandler];
          v67 = [v61 completionHandler];
          v68 = [(HMHome *)v103 __responseHandlerForRequests:v65 progressHandler:v66 completionHandler:v67 activity:v63];

          v123[0] = v107;
          v122[0] = @"kAccessoriesListKey";
          v122[1] = @"kHomeUUID";
          v69 = [(HMHome *)v103 uuid];
          v70 = [v69 UUIDString];
          v122[2] = @"kMultiPartResponseKey";
          v123[1] = v70;
          v123[2] = MEMORY[0x1E4F1CC38];
          __int16 v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v123 forKeys:v122 count:3];
          uint64_t v19 = (char *)[v71 mutableCopy];

          v72 = [v61 reportContext];
          __int16 v73 = _dictionaryRepresentationForReportContext(v72);
          [v19 addEntriesFromDictionary:v73];

          id v74 = objc_alloc(MEMORY[0x1E4F654B0]);
          id v75 = objc_alloc(MEMORY[0x1E4F65488]);
          v76 = [(HMHome *)v103 uuid];
          v77 = (void *)[v75 initWithTarget:v76];
          v78 = (void *)[v74 initWithName:v15 destination:v77 payload:v19];

          [v78 setActivity:v63];
          v79 = [v104 pendingRequests];
          v80 = [v78 identifier];
          id obj = v68;
          v81 = _Block_copy(v68);
          v82 = v15;
          v83 = v81;
          [v79 addCompletionBlock:v81 forIdentifier:v80];

          v115[0] = MEMORY[0x1E4F143A8];
          v115[1] = 3221225472;
          v115[2] = __53__HMHome_HMAccessory___performBatchRequest_activity___block_invoke;
          v115[3] = &unk_1E59455E8;
          id v116 = v79;
          id v117 = v80;
          id v84 = v80;
          id v85 = v79;
          [v78 setResponseHandler:v115];
          v86 = [v104 messageDispatcher];
          [v86 sendMessage:v78];

          uint64_t v15 = v82;
          [v63 end];

          id v7 = v61;
          v9 = v107;

          v101 = v63;
        }
        else
        {
          uint64_t v99 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
          uint64_t v19 = [v104 delegateCaller];
          v97 = [v7 completionHandler];
          id obj = (id)v99;
          [v19 callCompletion:v97 error:v99];
LABEL_69:
        }
LABEL_70:

LABEL_71:
        id v8 = v101;
LABEL_72:

        goto LABEL_73;
      }
    }
  }
  v87 = (void *)MEMORY[0x19F3A64A0]();
  v88 = self;
  v89 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v91 = id v90 = v7;
    *(_DWORD *)buf = 138543618;
    v126 = v91;
    __int16 v127 = 2080;
    v128 = "-[HMHome(HMAccessory) _performBatchRequest:activity:]";
    _os_log_impl(&dword_19D1A8000, v89, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    id v7 = v90;
  }

  v92 = [v7 completionHandler];

  if (v92)
  {
    v9 = [v7 completionHandler];
    v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, void *))v9)[2](v9, v12);
    goto LABEL_72;
  }
LABEL_73:
}

void __95__HMHome_HMAccessory____responseHandlerForRequests_progressHandler_completionHandler_activity___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v40 = a2;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v45 = a1;
  [*(id *)(a1 + 32) begin];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v7 = v6;
  uint64_t v43 = [v7 countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v43)
  {
    uint64_t v41 = *(void *)v52;
    v42 = v7;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v52 != v41) {
          objc_enumerationMutation(v7);
        }
        uint64_t v46 = v8;
        uint64_t v44 = *(void **)(*((void *)&v51 + 1) + 8 * v8);
        v9 = [v44 request];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v10 = v9;
        }
        else {
          v10 = 0;
        }
        id v11 = v10;

        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v12 = *(id *)(v45 + 40);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v47 objects:v59 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v48;
LABEL_11:
          uint64_t v16 = 0;
          while (1)
          {
            if (*(void *)v48 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(id *)(*((void *)&v47 + 1) + 8 * v16);
            objc_opt_class();
            id v18 = (objc_opt_isKindOfClass() & 1) != 0 ? v17 : 0;
            id v19 = v18;

            id v20 = [v19 characteristic];
            v21 = [v11 characteristic];
            char v22 = [v20 isEqual:v21];

            if (v22) {
              break;
            }

            if (v14 == ++v16)
            {
              uint64_t v14 = [v12 countByEnumeratingWithState:&v47 objects:v59 count:16];
              if (v14) {
                goto LABEL_11;
              }
              goto LABEL_20;
            }
          }

          if (!v19) {
            goto LABEL_23;
          }
          [v44 setRequest:v19];
          v23 = [v19 characteristic];
          id v24 = [v23 service];
          id v25 = *(id *)(v45 + 32);
          v26 = [v24 accessory];
          [v26 uuid];

          [v23 instanceID];
          id v27 = [v44 error];
          [v27 domain];

          id v28 = [v44 error];

          [v28 code];
        }
        else
        {
LABEL_20:

LABEL_23:
          id v17 = [v11 characteristic];
          v23 = [v17 service];
          v29 = (void *)MEMORY[0x19F3A64A0]();
          v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v31 = HMFGetLogIdentifier();
            uint64_t v32 = [v17 uniqueIdentifier];
            *(_DWORD *)buf = 138543618;
            uint64_t v56 = v31;
            __int16 v57 = 2112;
            id v58 = v32;
            _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_INFO, "%{public}@Unable to match the response characteristic %@ with request", buf, 0x16u);
          }
          id v33 = [v23 accessory];
          [v33 uuid];

          id v24 = [v17 instanceID];
        }
        id v7 = v42;

        uint64_t v8 = v46 + 1;
      }
      while (v46 + 1 != v43);
      uint64_t v43 = [v42 countByEnumeratingWithState:&v51 objects:v60 count:16];
    }
    while (v43);
  }

  if ([v7 count])
  {
    [*(id *)(v45 + 32) markWithReason:@"Calling progress handler"];
    v34 = [WeakRetained context];
    v35 = [v34 delegateCaller];
    [v35 callCompletion:*(void *)(v45 + 48) array:v7];
  }
  if ((a3 & 1) == 0)
  {
    [*(id *)(v45 + 32) markWithReason:@"Calling completion handler"];
    [v7 count];
    [v40 domain];

    [v40 code];
    v36 = [WeakRetained context];
    v37 = [v36 delegateCaller];
    [v37 callCompletion:*(void *)(v45 + 56) error:v40];
  }
  [*(id *)(v45 + 32) end];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HMHome *)self uniqueIdentifier];
  id v6 = [(HMHome *)self uuid];
  id v7 = [(HMHome *)self name];
  [(HMHome *)self isPrimary];
  uint64_t v8 = HMFBooleanToString();
  v9 = [v3 stringWithFormat:@"<%@ identifier = %@, uuid = %@, name = %@, primary = %@>", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_name;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (id)logIdentifier
{
  v2 = [(HMHome *)self uniqueIdentifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (NSUUID)uniqueIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", self->_uuid);
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  id v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (BOOL)isPrimary
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_primary;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)performBatchCharacteristicRequest:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v7 = NSString;
  uint64_t v8 = MEMORY[0x19F3A5D00](self, a2);
  v9 = [v7 stringWithFormat:@"%@, %s:%ld", v8, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/HMHome.m", 7613];
  v10 = (void *)[v6 initWithName:v9];

  uint64_t v11 = [v5 completionHandler];
  if (!v11
    || (id v12 = (void *)v11,
        [v5 progressHandler],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        !v13))
  {
    id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v23);
  }
  uint64_t v14 = [(HMHome *)self context];
  if (v14)
  {
    [v10 begin];
    uint64_t v15 = [v5 batchRequest];
    [(HMHome *)self _performBatchRequest:v15 activity:v10];

    [v10 end];
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v25 = v19;
      __int16 v26 = 2080;
      id v27 = "-[HMHome(HMAccessory) performBatchCharacteristicRequest:]";
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v20 = [v5 completionHandler];

    if (v20)
    {
      v21 = [v5 completionHandler];
      char v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
      ((void (**)(void, void *))v21)[2](v21, v22);
    }
  }
}

- (id)__responseHandlerForRequests:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5 activity:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __95__HMHome_HMAccessory____responseHandlerForRequests_progressHandler_completionHandler_activity___block_invoke;
  v20[3] = &unk_1E5941688;
  objc_copyWeak(&v25, &location);
  id v21 = v13;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v13;
  id v18 = _Block_copy(v20);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v18;
}

- (void)handleRuntimeStateUpdate:(id)a3 reason:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMHome *)self context];
  v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__HMHome_handleRuntimeStateUpdate_reason___block_invoke;
    block[3] = &unk_1E5945650;
    block[4] = self;
    id v16 = v6;
    id v17 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    id v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v19 = v14;
      __int16 v20 = 2080;
      id v21 = "-[HMHome handleRuntimeStateUpdate:reason:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

- (HMApplicationData)applicationData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_applicationData;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)startDiscoveringSymptomsForNearbyDevices
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(HMHome *)self context];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F65480] messageWithName:@"kStartDiscoveringSymptomsForNearbyDevicesRequestKey" messagePayload:0];
    id v5 = [v3 messageDispatcher];
    id v6 = [(HMHome *)self uuid];
    [v5 sendMessage:v4 target:v6];
  }
  else
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      id v12 = v10;
      __int16 v13 = 2080;
      id v14 = "-[HMHome(HMAccessory) startDiscoveringSymptomsForNearbyDevices]";
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", (uint8_t *)&v11, 0x16u);
    }
  }
}

id __62__HMHome_Light__fetchSettingsForLightProfiles_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 lightProfile];
  v3 = [v2 profileUniqueIdentifier];

  return v3;
}

void __62__HMHome_Light__fetchSettingsForLightProfiles_withCompletion___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = objc_msgSend(v6, "hmf_dataForKey:", @"HMHomeMessageKeySettingsByLightProfileUUIDs");
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v49[0] = objc_opt_class();
    v49[1] = objc_opt_class();
    v49[2] = objc_opt_class();
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
    uint64_t v11 = [v9 setWithArray:v10];

    id v47 = 0;
    v42 = (void *)v11;
    id v12 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v11 fromData:v8 error:&v47];
    id v13 = v47;
    id v14 = (void *)MEMORY[0x19F3A64A0]();
    id v15 = *(id *)(a1 + 32);
    id v16 = HMFGetOSLogHandle();
    id v17 = v16;
    if (v12)
    {
      uint64_t v41 = v7;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v51 = v18;
        __int16 v52 = 2112;
        id v53 = v12;
        _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched settings: %@", buf, 0x16u);
      }
      id v19 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      uint64_t v40 = a1;
      id v20 = *(id *)(a1 + 40);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        id v37 = v13;
        id v38 = v8;
        id v39 = v5;
        uint64_t v23 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v44 != v23) {
              objc_enumerationMutation(v20);
            }
            id v25 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            __int16 v26 = objc_msgSend(v25, "lightProfile", v37, v38, v39);
            id v27 = [v26 profileUniqueIdentifier];
            uint64_t v28 = [v12 objectForKeyedSubscript:v27];

            [v19 setObject:v28 forKey:v25];
            v29 = [v28 settings];

            if (v29)
            {
              v30 = [v28 settings];
              [v25 updateSettings:v30 withReason:@"home fetch of light profile settings"];
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v43 objects:v48 count:16];
        }
        while (v22);
        id v5 = v39;
        a1 = v40;
        id v7 = v41;
        id v13 = v37;
        uint64_t v8 = v38;
      }
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v51 = v35;
        __int16 v52 = 2112;
        id v53 = v13;
        _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode light profile settings: %@", buf, 0x16u);
      }
      id v19 = 0;
      id v20 = v5;
      id v5 = v13;
    }
  }
  else
  {
    v31 = (void *)MEMORY[0x19F3A64A0]();
    id v32 = *(id *)(a1 + 32);
    id v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v51 = v34;
      __int16 v52 = 2112;
      id v53 = v5;
      _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch the settings: %@", buf, 0x16u);
    }
    id v19 = 0;
  }
  v36 = [*(id *)(a1 + 48) delegateCaller];
  [v36 callCompletion:*(void *)(a1 + 56) obj:v19 error:v5];
}

- (void)__configureWithContext:(id)a3 homeManager:(id)a4
{
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
  v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    [(HMHome *)v9 isLocationServicesEnabled];
    id v12 = HMFBooleanToString();
    *(_DWORD *)buf = 138544130;
    v155 = v11;
    __int16 v156 = 2112;
    v157 = v9;
    __int16 v158 = 2112;
    id v159 = v6;
    __int16 v160 = 2112;
    v161 = v12;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring home: %@ with context: %@ location services enabled:%@", buf, 0x2Au);
  }
  [(HMHome *)v9 setContext:v6];
  id v13 = [v6 queue];
  id v14 = [(HMHome *)v9 shareWithHomeOwnerOperationQueue];
  [v14 setUnderlyingQueue:v13];

  [(HMHome *)v9 setHomeManager:v7];
  id v15 = [v7 configuration];
  id v16 = [v15 locationAuthorization];

  id v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v17 addObserver:v9 selector:sel__handleLocationAuthorizationUpdatedNotification_ name:*MEMORY[0x1E4F64EF0] object:v16];

  [v16 registerObserver:v9];
  if (([v16 isAuthorized] & 1) == 0) {
    [(HMHome *)v9 setLocationAuthorization:2];
  }

  id v18 = [(HMHome(HMRoom) *)v9 roomForEntireHome];
  id v19 = [(HMHome *)v9 context];
  objc_msgSend(v18, "__configureWithContext:home:", v19, v9);

  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  id v20 = [(HMHome *)v9 accessories];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v139 objects:v153 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v140;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v140 != v23) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend(*(id *)(*((void *)&v139 + 1) + 8 * v24++), "__configureWithContext:home:", v6, v9);
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v139 objects:v153 count:16];
    }
    while (v22);
  }

  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id v25 = [(HMHome *)v9 rooms];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v135 objects:v152 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v136;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v136 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v135 + 1) + 8 * v29);
        v31 = [(HMHome *)v9 context];
        objc_msgSend(v30, "__configureWithContext:home:", v31, v9);

        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v135 objects:v152 count:16];
    }
    while (v27);
  }

  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id v32 = [(HMHome *)v9 zones];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v131 objects:v151 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v132;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v132 != v35) {
          objc_enumerationMutation(v32);
        }
        id v37 = *(void **)(*((void *)&v131 + 1) + 8 * v36);
        id v38 = [(HMHome *)v9 context];
        objc_msgSend(v37, "__configureWithContext:home:", v38, v9);

        ++v36;
      }
      while (v34 != v36);
      uint64_t v34 = [v32 countByEnumeratingWithState:&v131 objects:v151 count:16];
    }
    while (v34);
  }

  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id v39 = [(HMHome *)v9 serviceGroups];
  uint64_t v40 = [v39 countByEnumeratingWithState:&v127 objects:v150 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v128;
    do
    {
      uint64_t v43 = 0;
      do
      {
        if (*(void *)v128 != v42) {
          objc_enumerationMutation(v39);
        }
        long long v44 = *(void **)(*((void *)&v127 + 1) + 8 * v43);
        long long v45 = [(HMHome *)v9 context];
        objc_msgSend(v44, "__configureWithContext:home:", v45, v9);

        ++v43;
      }
      while (v41 != v43);
      uint64_t v41 = [v39 countByEnumeratingWithState:&v127 objects:v150 count:16];
    }
    while (v41);
  }

  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v46 = [(HMHome *)v9 actionSets];
  uint64_t v47 = [v46 countByEnumeratingWithState:&v123 objects:v149 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v124;
    do
    {
      uint64_t v50 = 0;
      do
      {
        if (*(void *)v124 != v49) {
          objc_enumerationMutation(v46);
        }
        long long v51 = *(void **)(*((void *)&v123 + 1) + 8 * v50);
        __int16 v52 = [(HMHome *)v9 context];
        objc_msgSend(v51, "__configureWithContext:home:", v52, v9);

        ++v50;
      }
      while (v48 != v50);
      uint64_t v48 = [v46 countByEnumeratingWithState:&v123 objects:v149 count:16];
    }
    while (v48);
  }

  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id v53 = [(HMHome *)v9 triggerOwnedActionSets];
  uint64_t v54 = [v53 countByEnumeratingWithState:&v119 objects:v148 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v120;
    do
    {
      uint64_t v57 = 0;
      do
      {
        if (*(void *)v120 != v56) {
          objc_enumerationMutation(v53);
        }
        id v58 = *(void **)(*((void *)&v119 + 1) + 8 * v57);
        long long v59 = [(HMHome *)v9 context];
        objc_msgSend(v58, "__configureWithContext:home:", v59, v9);

        ++v57;
      }
      while (v55 != v57);
      uint64_t v55 = [v53 countByEnumeratingWithState:&v119 objects:v148 count:16];
    }
    while (v55);
  }

  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v60 = [(HMHome *)v9 currentUsers];
  uint64_t v61 = [v60 array];

  uint64_t v62 = [v61 countByEnumeratingWithState:&v115 objects:v147 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v116;
    do
    {
      uint64_t v65 = 0;
      do
      {
        if (*(void *)v116 != v64) {
          objc_enumerationMutation(v61);
        }
        unsigned __int8 v66 = *(void **)(*((void *)&v115 + 1) + 8 * v65);
        v67 = [(HMHome *)v9 context];
        objc_msgSend(v66, "__configureWithContext:home:", v67, v9);

        ++v65;
      }
      while (v63 != v65);
      uint64_t v63 = [v61 countByEnumeratingWithState:&v115 objects:v147 count:16];
    }
    while (v63);
  }

  currentUser = v9->_currentUser;
  v69 = [(HMHome *)v9 context];
  [(HMUser *)currentUser __configureWithContext:v69 home:v9];

  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  v70 = [(HMHome *)v9 triggers];
  uint64_t v71 = [v70 countByEnumeratingWithState:&v111 objects:v146 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v112;
    do
    {
      uint64_t v74 = 0;
      do
      {
        if (*(void *)v112 != v73) {
          objc_enumerationMutation(v70);
        }
        id v75 = *(void **)(*((void *)&v111 + 1) + 8 * v74);
        v76 = [(HMHome *)v9 context];
        objc_msgSend(v75, "__configureWithContext:home:", v76, v9);

        ++v74;
      }
      while (v72 != v74);
      uint64_t v72 = [v70 countByEnumeratingWithState:&v111 objects:v146 count:16];
    }
    while (v72);
  }

  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  v77 = [(HMHome *)v9 currentResidentDevices];
  v78 = [v77 array];

  uint64_t v79 = [v78 countByEnumeratingWithState:&v107 objects:v145 count:16];
  if (v79)
  {
    uint64_t v80 = v79;
    uint64_t v81 = *(void *)v108;
    do
    {
      uint64_t v82 = 0;
      do
      {
        if (*(void *)v108 != v81) {
          objc_enumerationMutation(v78);
        }
        v83 = *(void **)(*((void *)&v107 + 1) + 8 * v82);
        id v84 = [(HMHome *)v9 context];
        objc_msgSend(v83, "__configureWithContext:home:", v84, v9);

        ++v82;
      }
      while (v80 != v82);
      uint64_t v80 = [v78 countByEnumeratingWithState:&v107 objects:v145 count:16];
    }
    while (v80);
  }

  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v85 = [(HMHome *)v9 outgoingInvitations];
  uint64_t v86 = [v85 countByEnumeratingWithState:&v103 objects:v144 count:16];
  if (v86)
  {
    uint64_t v87 = v86;
    uint64_t v88 = *(void *)v104;
    do
    {
      uint64_t v89 = 0;
      do
      {
        if (*(void *)v104 != v88) {
          objc_enumerationMutation(v85);
        }
        id v90 = *(void **)(*((void *)&v103 + 1) + 8 * v89);
        v91 = [(HMHome *)v9 context];
        objc_msgSend(v90, "__configureWithContext:home:", v91, v9);

        ++v89;
      }
      while (v87 != v89);
      uint64_t v87 = [v85 countByEnumeratingWithState:&v103 objects:v144 count:16];
    }
    while (v87);
  }

  v92 = [(HMHome *)v9 mediaSystemStageManager];
  v93 = [(HMHome *)v9 context];
  [v92 configureWithHome:v9 context:v93];

  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  v94 = [(HMHome *)v9 accessoryProtectionGroups];
  uint64_t v95 = [v94 countByEnumeratingWithState:&v99 objects:v143 count:16];
  if (v95)
  {
    uint64_t v96 = v95;
    uint64_t v97 = *(void *)v100;
    do
    {
      uint64_t v98 = 0;
      do
      {
        if (*(void *)v100 != v97) {
          objc_enumerationMutation(v94);
        }
        [*(id *)(*((void *)&v99 + 1) + 8 * v98++) _configureWithHome:v9];
      }
      while (v96 != v98);
      uint64_t v96 = [v94 countByEnumeratingWithState:&v99 objects:v143 count:16];
    }
    while (v96);
  }

  [(HMHome *)v9 _registerNotificationHandlers];
  [(HMHome *)v9 configurePersonManager];
}

- (id)residentDevices
{
  v2 = [(HMHome *)self currentResidentDevices];
  v3 = [v2 array];

  return v3;
}

- (HMMutableArray)currentResidentDevices
{
  return self->_currentResidentDevices;
}

- (NSArray)serviceGroups
{
  v2 = [(HMHome *)self currentServiceGroups];
  v3 = [v2 array];

  return (NSArray *)v3;
}

- (HMMutableArray)currentServiceGroups
{
  return self->_currentServiceGroups;
}

- (NSArray)zones
{
  v2 = [(HMHome *)self currentZones];
  v3 = [v2 array];

  return (NSArray *)v3;
}

- (HMMutableArray)currentZones
{
  return self->_currentZones;
}

- (NSArray)rooms
{
  v2 = [(HMHome *)self currentRooms];
  v3 = [v2 array];

  return (NSArray *)v3;
}

- (HMMutableArray)currentRooms
{
  return self->_currentRooms;
}

- (NSArray)actionSets
{
  v2 = [(HMHome *)self currentActionSets];
  v3 = [v2 array];

  return (NSArray *)v3;
}

- (HMMutableArray)currentActionSets
{
  return self->_currentActionSets;
}

- (NSArray)triggers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(HMHome *)self currentTriggers];
  id v5 = [v4 array];

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
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 compatibleWithApp]) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = (void *)[v3 copy];

  return (NSArray *)v11;
}

- (HMMutableArray)currentTriggers
{
  return self->_currentTriggers;
}

- (void)setLocationAuthorization:(int64_t)a3
{
  self->_locationAuthorization = a3;
}

- (HMHomePersonManager)personManager
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_personManager;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSArray)accessoryProtectionGroups
{
  v2 = [(HMHome *)self currentAccessoryProtectionGroups];
  v3 = [v2 array];

  return (NSArray *)v3;
}

- (NSArray)triggerOwnedActionSets
{
  v2 = [(HMHome *)self currentTriggerOwnedActionSets];
  v3 = [v2 array];

  return (NSArray *)v3;
}

- (NSOperationQueue)shareWithHomeOwnerOperationQueue
{
  return self->_shareWithHomeOwnerOperationQueue;
}

- (void)setHomeManager:(id)a3
{
}

- (void)setContext:(id)a3
{
}

- (void)postConfigure
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  uint64_t v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v19 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Post-configuring home", buf, 0xCu);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [(HMHome *)v4 accessories];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v11++) postConfigure];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  id v12 = [(HMHome *)v4 mediaSystemStageManager];
  [v12 postConfigure];
}

- (HMHomePersonManagerSettings)personManagerSettings
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_personManagerSettings;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)outgoingInvitations
{
  v2 = [(HMHome *)self currentOutgoingInvitations];
  v3 = [v2 array];

  return v3;
}

- (BOOL)isLocationServicesEnabled
{
  return self->_locationServicesEnabled;
}

- (HMMutableArray)currentTriggerOwnedActionSets
{
  return self->_currentTriggerOwnedActionSets;
}

- (HMMutableArray)currentOutgoingInvitations
{
  return self->_currentOutgoingInvitations;
}

- (HMMutableArray)currentAccessoryProtectionGroups
{
  return self->_currentAccessoryProtectionGroups;
}

- (void)_registerNotificationHandlers
{
  v3 = [(HMHome *)self context];
  uint64_t v4 = [v3 messageDispatcher];
  [v4 registerForMessage:@"kHomeLocationUpdatedNotificationKey" receiver:self selector:sel__handleHomeLocationUpdateNotification_];

  id v5 = [(HMHome *)self context];
  uint64_t v6 = [v5 messageDispatcher];
  [v6 registerForMessage:@"HM.accessoryAdded" receiver:self selector:sel__handleAccessoryAddedNotification_];

  uint64_t v7 = [(HMHome *)self context];
  uint64_t v8 = [v7 messageDispatcher];
  [v8 registerForMessage:@"kAddAccessoryProgressNotificationKey" receiver:self selector:sel__handleAddAccessoryProgressNotification_];

  uint64_t v9 = [(HMHome *)self context];
  uint64_t v10 = [v9 messageDispatcher];
  [v10 registerForMessage:@"kUserAddedNotificationKey" receiver:self selector:sel__handleUserAddedNotification_];

  uint64_t v11 = [(HMHome *)self context];
  id v12 = [v11 messageDispatcher];
  [v12 registerForMessage:@"kUserInvitationsUpdatedNotificationKey" receiver:self selector:sel__handleUserInvitationsUpdatedNotification_];

  long long v13 = [(HMHome *)self context];
  long long v14 = [v13 messageDispatcher];
  [v14 registerForMessage:@"HM.ae" receiver:self selector:sel__handleAccessoryErrorNotification_];

  long long v15 = [(HMHome *)self context];
  long long v16 = [v15 messageDispatcher];
  [v16 registerForMessage:@"kMultipleCharacteristicValuesUpdatedNotificationKey" receiver:self selector:sel__handleMultipleCharacteristicValuesUpdated_];

  id v17 = [(HMHome *)self context];
  uint64_t v18 = [v17 messageDispatcher];
  [v18 registerForMessage:@"HMHomeAccessorySetupCodeFailureMessage" receiver:self selector:sel__handleAccessorySetupCodeFailureMessage_];

  id v19 = [(HMHome *)self context];
  uint64_t v20 = [v19 messageDispatcher];
  [v20 registerForMessage:@"HM.enabledNotifications" receiver:self selector:sel__handleNotificationsEnabled_];

  uint64_t v21 = [(HMHome *)self context];
  uint64_t v22 = [v21 messageDispatcher];
  [v22 registerForMessage:@"kAccessoryInfoUpdatedNotificationKey" receiver:self selector:sel__handleAccessoryInfoUpdatedNotification_];

  uint64_t v23 = [(HMHome *)self context];
  uint64_t v24 = [v23 messageDispatcher];
  [v24 registerForMessage:@"kAccessoryReprovisionedNotificationKey" receiver:self selector:sel__handleAccessoryReprovisionedNotification_];

  id v25 = [(HMHome *)self context];
  uint64_t v26 = [v25 messageDispatcher];
  [v26 registerForMessage:@"kAccessoryReprovisionStateUpdateNotificationKey" receiver:self selector:sel__handleAccessoryReprovisionStateUpdate_];

  uint64_t v27 = [(HMHome *)self context];
  uint64_t v28 = [v27 messageDispatcher];
  [v28 registerForMessage:@"HM.homeHubStateUpdated" receiver:self selector:sel__handleHomeHubStateUpdatedNotification_];

  uint64_t v29 = [(HMHome *)self context];
  v30 = [v29 messageDispatcher];
  [v30 registerForMessage:@"HM.nsdrUpdated" receiver:self selector:sel__handleHomeNetworkRouterSupportUpdated_];

  v31 = [(HMHome *)self context];
  id v32 = [v31 messageDispatcher];
  [v32 registerForMessage:@"HMAccessoryNetworkProtectionGroupAddedNotification" receiver:self selector:sel__handleAccessoryNetworkProtectionGroupAddedNotification_];

  uint64_t v33 = [(HMHome *)self context];
  uint64_t v34 = [v33 messageDispatcher];
  [v34 registerForMessage:@"HMAccessoryNetworkProtectionGroupRemovedNotification" receiver:self selector:sel__handleAccessoryNetworkProtectionGroupRemovedNotification_];

  uint64_t v35 = [(HMHome *)self context];
  uint64_t v36 = [v35 messageDispatcher];
  [v36 registerForMessage:@"HMHomeLocationStatusUpdateNotificationKey" receiver:self selector:sel__handleHomeLocationStatusUpdateNotification_];

  id v37 = [(HMHome *)self context];
  id v38 = [v37 messageDispatcher];
  [v38 registerForMessage:@"HMHomeMultiUserEnabledChangeNotificationKey" receiver:self selector:sel__handleMultiUserEnabledChangeNotification_];

  id v39 = [(HMHome *)self context];
  uint64_t v40 = [v39 messageDispatcher];
  [v40 registerForMessage:@"HM.accessoryConnectivityChanged" receiver:self selector:sel__handleAccessoryConnectivityChangedNotification_];

  uint64_t v41 = [(HMHome *)self context];
  uint64_t v42 = [v41 messageDispatcher];
  [v42 registerForMessage:@"HMHomeDidAddWalletKeyMessage" receiver:self selector:sel__handleDidAddWalletKeyMessage_];

  uint64_t v43 = [(HMHome *)self context];
  long long v44 = [v43 messageDispatcher];
  [v44 registerForMessage:@"HMHomeDidRemoveWalletKeyMessage" receiver:self selector:sel__handleDidRemoveWalletKeyMessage_];

  id v46 = [(HMHome *)self context];
  long long v45 = [v46 messageDispatcher];
  [v45 registerForMessage:@"HMMM.request.received" receiver:self selector:sel__handleHMMMRequestReceivedMessage_];
}

- (_HMContext)context
{
  return self->_context;
}

- (id)mediaSystems
{
  v2 = [(HMHome *)self mediaSystemStageManager];
  v3 = [v2 mediaSystems];

  return v3;
}

- (HMMediaSystemStageManager)mediaSystemStageManager
{
  return (HMMediaSystemStageManager *)objc_getProperty(self, a2, 368, 1);
}

- (void)_handleNotificationsEnabled:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self context];
  uint64_t v6 = [v5 pendingRequests];

  uint64_t v7 = [v4 identifier];
  uint64_t v8 = [v6 removeCompletionBlockForIdentifier:v7];

  char v25 = 0;
  uint64_t v9 = [v4 BOOLForKey:@"kCharacteristicNotificationEnableKey" keyPresent:&v25];
  if (v25)
  {
    uint64_t v10 = [v4 dateForKey:@"kCharacteristicNotificationEnableTime"];
    [(HMHome *)self setNotificationsEnabled:v9];
    [(HMHome *)self setNotificationsUpdatedTime:v10];
  }
  char v24 = 0;
  unsigned int v11 = [v4 BOOLForKey:@"HMHomeEnableHomeAppleMediaNotificationsKey" keyPresent:&v24];
  if (v8)
  {
    unsigned int v12 = v11;
    [(HMHome *)self setNotificationEnableRequested:v9];
    if (v24) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    [(HMHome *)self setNotificationEnableRequestedForAppleMediaAccessories:v13];
    id v14 = [(HMHome *)self context];
    long long v15 = [v14 delegateCaller];
    [v15 callCompletion:v8 error:0];
    goto LABEL_8;
  }
  if (!v25) {
    goto LABEL_10;
  }
  long long v16 = [(HMHome *)self delegate];
  if ([v16 conformsToProtocol:&unk_1EEF70488]) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }
  id v14 = v17;

  if (objc_opt_respondsToSelector())
  {
    uint64_t v18 = [(HMHome *)self context];
    id v19 = [v18 delegateCaller];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __38__HMHome__handleNotificationsEnabled___block_invoke;
    v20[3] = &unk_1E5944D60;
    id v14 = v14;
    id v21 = v14;
    uint64_t v22 = self;
    char v23 = v9;
    [v19 invokeBlock:v20];

    long long v15 = v21;
LABEL_8:
  }
LABEL_10:
}

- (void)setNotificationsUpdatedTime:(id)a3
{
  id v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  notificationsUpdatedTime = self->_notificationsUpdatedTime;
  self->_notificationsUpdatedTime = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_notificationsEnabled = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setNotificationEnableRequestedForAppleMediaAccessories:(BOOL)a3
{
  self->_notificationEnableRequestedForAppleMediaAccessories = a3;
}

- (void)setNotificationEnableRequested:(BOOL)a3
{
  self->_notificationEnableRequested = a3;
}

- (id)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);

  return WeakRetained;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t364 != -1) {
    dispatch_once(&logCategory__hmf_once_t364, &__block_literal_global_1106);
  }
  v2 = (void *)logCategory__hmf_once_v365;

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)owner
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = [(HMHome *)self currentUser];
  id v4 = [v3 homeAccessControl];
  int v5 = [v4 isOwner];

  if (v5)
  {
    id v6 = [(HMHome *)self currentUser];
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v7 = [(HMHome *)self currentUsers];
    uint64_t v8 = [v7 array];

    id v6 = (id)[v8 countByEnumeratingWithState:&v26 objects:v40 count:16];
    if (v6)
    {
      uint64_t v9 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v8);
          }
          unsigned int v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          unsigned int v12 = [v11 homeAccessControl];
          int v13 = [v12 isOwner];

          if (v13)
          {
            id v6 = v11;
            goto LABEL_13;
          }
        }
        id v6 = (id)[v8 countByEnumeratingWithState:&v26 objects:v40 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  id v14 = (void *)MEMORY[0x19F3A64A0]();
  long long v15 = self;
  long long v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    id v17 = HMFGetLogIdentifier();
    uint64_t v18 = [v6 userID];
    [v6 name];
    id v19 = v25 = v6;
    uint64_t v20 = [(HMHome *)v15 currentUser];
    id v21 = [v20 userID];
    uint64_t v22 = [(HMHome *)v15 currentUsers];
    char v23 = [v22 array];
    *(_DWORD *)buf = 138544386;
    v31 = v17;
    __int16 v32 = 2112;
    uint64_t v33 = v18;
    __int16 v34 = 2112;
    uint64_t v35 = v19;
    __int16 v36 = 2112;
    id v37 = v21;
    __int16 v38 = 2112;
    id v39 = v23;
    _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_DEBUG, "%{public}@owner : %@, name: %@, currentUser: %@, all users: [%@]", buf, 0x34u);

    id v6 = v25;
  }

  return v6;
}

- (HMUser)currentUser
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_currentUser;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HMHome)initWithCoder:(id)a3
{
  v252[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", @"homeName");
  id v6 = objc_msgSend(v4, "hm_decodeAndCacheUUIDFromStringForKey:", @"homeUUID");
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  unint64_t v8 = 0x1E4F1C000uLL;
  v252[0] = objc_opt_class();
  v252[1] = objc_opt_class();
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v252 count:2];
  uint64_t v10 = [v7 setWithArray:v9];
  uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:kMediaSystemsCodingKey];
  unsigned int v12 = (void *)v11;
  int v13 = (void *)MEMORY[0x1E4F1CBF0];
  if (v11) {
    int v13 = (void *)v11;
  }
  id v14 = v13;

  if (v6)
  {
    long long v15 = [(HMHome *)self initWithName:v5 uuid:v6 mediaSystems:v14];
    if (!v15)
    {
LABEL_90:
      __int16 v32 = v15;
      uint64_t v35 = v32;
      goto LABEL_91;
    }
    id v208 = v14;
    v210 = v5;
    long long v16 = (void *)MEMORY[0x1E4F1CAD0];
    v251[0] = objc_opt_class();
    v251[1] = objc_opt_class();
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v251 count:2];
    uint64_t v18 = [v16 setWithArray:v17];
    id v19 = [v4 decodeObjectOfClasses:v18 forKey:@"accessories"];

    uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
    id v21 = v15;
    uint64_t v22 = HMFGetOSLogHandle();
    v207 = v15;
    v216 = v21;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      char v23 = HMFGetLogIdentifier();
      char v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
      *(_DWORD *)buf = 138543874;
      v246 = v23;
      __int16 v247 = 2112;
      unint64_t v248 = (unint64_t)v24;
      __int16 v249 = 2112;
      v250 = v19;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_DEBUG, "%{public}@decoded accessories: %@, %@", buf, 0x20u);

      id v21 = v216;
    }

    id v25 = (void *)MEMORY[0x1E4F1CAD0];
    v244[0] = objc_opt_class();
    v244[1] = objc_opt_class();
    long long v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v244 count:2];
    long long v27 = [v25 setWithArray:v26];
    long long v28 = [v4 decodeObjectOfClasses:v27 forKey:@"accessories.airplay"];

    v21->_homeLocationStatus = [v4 decodeIntegerForKey:@"HMHomeLocationStatusValueCodingKey"];
    v205 = v28;
    if ([v28 count])
    {
      uint64_t v29 = [v19 arrayByAddingObjectsFromArray:v28];

      v30 = (void *)v29;
    }
    else
    {
      v30 = v19;
    }
    v206 = v30;
    -[HMMutableArray setArray:](v21->_currentAccessories, "setArray:");
    __int16 v36 = (void *)MEMORY[0x1E4F1CAD0];
    v243[0] = objc_opt_class();
    v243[1] = objc_opt_class();
    id v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v243 count:2];
    __int16 v38 = [v36 setWithArray:v37];
    uint64_t v39 = [v4 decodeObjectOfClasses:v38 forKey:@"rooms"];

    v204 = (void *)v39;
    [(HMMutableArray *)v21->_currentRooms setArray:v39];
    uint64_t v40 = (void *)MEMORY[0x1E4F1CAD0];
    v242[0] = objc_opt_class();
    v242[1] = objc_opt_class();
    v242[2] = objc_opt_class();
    uint64_t v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v242 count:3];
    uint64_t v42 = [v40 setWithArray:v41];
    uint64_t v43 = [v4 decodeObjectOfClasses:v42 forKey:@"zones"];

    v203 = (void *)v43;
    [(HMMutableArray *)v21->_currentZones setArray:v43];
    long long v44 = (void *)MEMORY[0x1E4F1CAD0];
    v241[0] = objc_opt_class();
    v241[1] = objc_opt_class();
    long long v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v241 count:2];
    id v46 = [v44 setWithArray:v45];
    uint64_t v47 = [v4 decodeObjectOfClasses:v46 forKey:@"serviceGroups"];

    v202 = (void *)v47;
    [(HMMutableArray *)v21->_currentServiceGroups setArray:v47];
    uint64_t v48 = (void *)MEMORY[0x1E4F1CAD0];
    v240[0] = objc_opt_class();
    v240[1] = objc_opt_class();
    uint64_t v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v240 count:2];
    uint64_t v50 = [v48 setWithArray:v49];

    long long v51 = [v4 decodeObjectOfClasses:v50 forKey:@"actionSets"];
    [(HMMutableArray *)v21->_currentActionSets setArray:v51];
    v21->_homeHubState = [v4 decodeIntegerForKey:@"HM.homeHubState"];
    __int16 v52 = [v4 decodeObjectOfClasses:v50 forKey:@"builtinActionSets"];

    [(HMMutableArray *)v21->_currentActionSets addObjectsFromArray:v52];
    v201 = (void *)v50;
    uint64_t v53 = [v4 decodeObjectOfClasses:v50 forKey:@"HM.triggerOwnedActionSets"];

    v200 = (void *)v53;
    [(HMMutableArray *)v21->_currentTriggerOwnedActionSets setArray:v53];
    uint64_t v54 = (void *)MEMORY[0x1E4F1CAD0];
    v239[0] = objc_opt_class();
    v239[1] = objc_opt_class();
    v239[2] = objc_opt_class();
    uint64_t v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v239 count:3];
    uint64_t v56 = [v54 setWithArray:v55];
    uint64_t v57 = [v4 decodeObjectOfClasses:v56 forKey:@"triggers"];

    long long v229 = 0u;
    long long v230 = 0u;
    long long v227 = 0u;
    long long v228 = 0u;
    id v58 = v57;
    uint64_t v59 = [v58 countByEnumeratingWithState:&v227 objects:v238 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v228;
      do
      {
        for (uint64_t i = 0; i != v60; ++i)
        {
          if (*(void *)v228 != v61) {
            objc_enumerationMutation(v58);
          }
          uint64_t v63 = *(void **)(*((void *)&v227 + 1) + 8 * i);
          if ([v63 compatibleWithApp]) {
            [(HMMutableArray *)v21->_currentTriggers addObject:v63];
          }
        }
        uint64_t v60 = [v58 countByEnumeratingWithState:&v227 objects:v238 count:16];
      }
      while (v60);
    }

    v209 = v6;
    v199 = v58;
    if ([v4 containsValueForKey:@"HM.userAccessAllowed"]) {
      uint64_t v64 = [v4 decodeBoolForKey:@"HM.userAccessAllowed"];
    }
    else {
      uint64_t v64 = 1;
    }
    v216->_BOOL ownerUser = [v4 decodeBoolForKey:@"HM.isOwnerUser"];
    v216->_adminUser = [v4 decodeBoolForKey:@"isAdminUser"];
    v216->_supportsResidentActionSetStateEvaluation = [v4 decodeBoolForKey:@"HMHomeSupportsResidentActionSetStateEvaluationCodingKey"];
    uint64_t v65 = (void *)MEMORY[0x1E4F1CA48];
    unsigned __int8 v66 = (void *)MEMORY[0x1E4F1CAD0];
    v237[0] = objc_opt_class();
    v237[1] = objc_opt_class();
    v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v237 count:2];
    v68 = [v66 setWithArray:v67];
    v69 = [v4 decodeObjectOfClasses:v68 forKey:@"users"];
    v70 = [v65 arrayWithArray:v69];

    long long v225 = 0u;
    long long v226 = 0u;
    long long v223 = 0u;
    long long v224 = 0u;
    id v71 = v70;
    uint64_t v72 = [v71 countByEnumeratingWithState:&v223 objects:v236 count:16];
    id obj = v71;
    if (v72)
    {
      uint64_t v73 = v72;
      uint64_t v74 = *(void *)v224;
      while (2)
      {
        for (uint64_t j = 0; j != v73; ++j)
        {
          if (*(void *)v224 != v74) {
            objc_enumerationMutation(obj);
          }
          v76 = *(void **)(*((void *)&v223 + 1) + 8 * j);
          if ([v76 isCurrentUser])
          {
            objc_storeStrong((id *)&v216->_currentUser, v76);
            id v71 = obj;
            goto LABEL_35;
          }
        }
        id v71 = obj;
        uint64_t v73 = [obj countByEnumeratingWithState:&v223 objects:v236 count:16];
        if (v73) {
          continue;
        }
        break;
      }
    }
LABEL_35:

    v77 = v216;
    if (v216->_currentUser)
    {
      objc_msgSend(v71, "removeObject:");
      v78 = v216;
    }
    else
    {
      BOOL ownerUser = v216->_ownerUser;
      LOBYTE(v80) = v216->_ownerUser;
      uint64_t v81 = 1;
      if (v216->_ownerUser) {
        uint64_t v82 = 2;
      }
      else {
        uint64_t v82 = 1;
      }
      v214 = +[HMUserCameraAccess accessWithValue:v82];
      if ([v4 containsValueForKey:@"HMHomeAccessControlOverrideCodingKey"])
      {
        unint64_t v83 = [v4 decodeIntegerForKey:@"HMHomeAccessControlOverrideCodingKey"];
        id v84 = (void *)MEMORY[0x19F3A64A0]();
        id v85 = v216;
        uint64_t v86 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
        {
          uint64_t v87 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v246 = v87;
          __int16 v247 = 2048;
          unint64_t v248 = v83;
          _os_log_impl(&dword_19D1A8000, v86, OS_LOG_TYPE_INFO, "%{public}@Overriding Home Access Control for current user to 0x%08lx", buf, 0x16u);
        }
        v77 = v216;
        v216->_BOOL ownerUser = (v83 & 4) != 0;
        v216->_adminUser = (v83 & 2) != 0;
        uint64_t v81 = (v83 >> 3) & 1;
        uint64_t v80 = (v83 >> 4) & 1;
        uint64_t v64 = v83 & 1;
      }
      LOBYTE(v197) = 0;
      LOBYTE(v196) = v80;
      uint64_t v88 = [[HMHomeAccessControl alloc] initWithUser:0 allowAccess:v64 owner:ownerUser administratorPrivilege:v77->_adminUser remoteAccess:v81 presenceAuthStatus:0 presenceComputeStatus:0 announceAccess:v196 camerasAccess:v214 audioAnalysisUserDropInAccessLevel:0 restrictedGuest:v197 restrictedGuestAccessSettings:0];
      if ((v64 & 1) == 0)
      {
        if ([v4 containsValueForKey:@"HMHomeAccessNotAllowedReasonCodeCodingKey"]) {
          uint64_t v89 = [v4 decodeIntegerForKey:@"HMHomeAccessNotAllowedReasonCodeCodingKey"];
        }
        else {
          uint64_t v89 = 1;
        }
        id v90 = (void *)MEMORY[0x19F3A64A0]();
        v91 = v216;
        v92 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
        {
          v93 = HMFGetLogIdentifier();
          v94 = [NSNumber numberWithUnsignedInteger:v89];
          *(_DWORD *)buf = 138543618;
          v246 = v93;
          __int16 v247 = 2112;
          unint64_t v248 = (unint64_t)v94;
          _os_log_impl(&dword_19D1A8000, v92, OS_LOG_TYPE_INFO, "%{public}@Access to the home is not allowed due to : %@", buf, 0x16u);
        }
        [(HMHomeAccessControl *)v88 setAccessNotAllowedReasonCode:v89];
        unint64_t v8 = 0x1E4F1C000;
      }
      uint64_t v95 = [HMUser alloc];
      uint64_t v96 = +[HMLocalization sharedManager];
      uint64_t v97 = [v96 getLocalizedString:@"CURRENT_USER"];
      uint64_t v98 = (void *)MEMORY[0x1E4F29128];
      long long v99 = [(HMHome *)v216 uniqueIdentifier];
      long long v100 = objc_msgSend(v98, "hm_deriveUUIDFromBaseUUID:", v99);
      uint64_t v101 = [(HMUser *)v95 initWithUserID:0 name:v97 uuid:v100 home:v216 homeAccessControl:v88];
      currentUser = v216->_currentUser;
      v216->_currentUser = (HMUser *)v101;

      long long v103 = (void *)MEMORY[0x19F3A64A0]();
      long long v104 = v216;
      long long v105 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
      {
        long long v106 = HMFGetLogIdentifier();
        long long v107 = v216->_currentUser;
        long long v108 = [(HMUser *)v107 uuid];
        *(_DWORD *)buf = 138543874;
        v246 = v106;
        __int16 v247 = 2112;
        unint64_t v248 = (unint64_t)v107;
        __int16 v249 = 2112;
        v250 = v108;
        _os_log_impl(&dword_19D1A8000, v105, OS_LOG_TYPE_INFO, "%{public}@Created a random user in framework: %@ / %@", buf, 0x20u);

        unint64_t v8 = 0x1E4F1C000uLL;
      }

      [(HMUser *)v216->_currentUser setCurrentUser:1];

      v78 = v216;
      id v71 = obj;
    }
    [(HMMutableArray *)v78->_currentUsers setArray:v71];
    long long v109 = (void *)MEMORY[0x1E4F1CAD0];
    v235[0] = objc_opt_class();
    v235[1] = objc_opt_class();
    long long v110 = [*(id *)(v8 + 2424) arrayWithObjects:v235 count:2];
    long long v111 = [v109 setWithArray:v110];
    uint64_t v112 = [v4 decodeObjectOfClasses:v111 forKey:@"residentDevices"];

    v212 = (void *)v112;
    [(HMMutableArray *)v78->_currentResidentDevices setArray:v112];
    uint64_t v113 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"roomForEntireHome"];
    roomForEntireHome = v78->_roomForEntireHome;
    v78->_roomForEntireHome = (HMRoom *)v113;

    uint64_t v115 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeLocation"];
    homeLocation = v78->_homeLocation;
    v78->_homeLocation = (CLLocation *)v115;

    currentOutgoingInvitations = v78->_currentOutgoingInvitations;
    long long v118 = (void *)MEMORY[0x1E4F1CAD0];
    v234[0] = objc_opt_class();
    v234[1] = objc_opt_class();
    long long v119 = [*(id *)(v8 + 2424) arrayWithObjects:v234 count:2];
    long long v120 = [v118 setWithArray:v119];
    v211 = v4;
    [v4 decodeObjectOfClasses:v120 forKey:@"HM.invitations"];
    v122 = long long v121 = v78;
    [(HMMutableArray *)currentOutgoingInvitations setArray:v122];

    v215 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[HMMutableArray count](v121->_currentOutgoingInvitations, "count"));
    long long v219 = 0u;
    long long v220 = 0u;
    long long v221 = 0u;
    long long v222 = 0u;
    long long v123 = [(HMMutableArray *)v121->_currentOutgoingInvitations array];
    uint64_t v124 = [v123 countByEnumeratingWithState:&v219 objects:v233 count:16];
    if (v124)
    {
      uint64_t v125 = v124;
      uint64_t v126 = *(void *)v220;
      do
      {
        for (uint64_t k = 0; k != v125; ++k)
        {
          if (*(void *)v220 != v126) {
            objc_enumerationMutation(v123);
          }
          long long v128 = *(void **)(*((void *)&v219 + 1) + 8 * k);
          long long v129 = [v128 invitee];
          if (v129)
          {
            long long v130 = [(HMMutableArray *)v216->_currentUsers array];
            long long v131 = [v129 userID];
            long long v132 = objc_msgSend(v130, "hmf_firstObjectWithValue:forKeyPath:", v131, @"userID");

            if (v132)
            {
              [v132 setPendingAccessoryInvitationsWithOutgoingInvitation:v128];
              [v215 addObject:v128];
            }
          }
        }
        uint64_t v125 = [v123 countByEnumeratingWithState:&v219 objects:v233 count:16];
      }
      while (v125);
    }

    [(HMMutableArray *)v216->_currentOutgoingInvitations removeObjectsInArray:v215];
    id v4 = v211;
    uint64_t v133 = [v211 decodeObjectOfClass:objc_opt_class() forKey:@"HM.matterFabricID"];
    matterFabricID = v216->_matterFabricID;
    v216->_matterFabricID = (NSNumber *)v133;

    long long v135 = [[HMApplicationData alloc] initWithDictionaryFromCoder:v211 key:@"HM.appData"];
    applicationData = v216->_applicationData;
    v216->_applicationData = v135;

    v216->_notificationsEnabled = [v211 decodeBoolForKey:@"kCharacteristicNotificationEnableKey"];
    long long v137 = [v211 decodeObjectOfClass:objc_opt_class() forKey:@"kCharacteristicNotificationEnableTime"];
    long long v138 = v137;
    if (v137)
    {
      long long v139 = v137;
    }
    else
    {
      long long v139 = [MEMORY[0x1E4F1C9C8] distantFuture];
    }
    notificationsUpdatedTime = v216->_notificationsUpdatedTime;
    v216->_notificationsUpdatedTime = v139;

    v216->_automaticSoftwareUpdateEnabled = [v211 decodeBoolForKey:@"HM.automaticSoftwareUpdateEnabled"];
    v216->_automaticThirdPartyAccessorySoftwareUpdateEnabled = [v211 decodeBoolForKey:@"HM.automaticThirdPartyAccessorySoftwareUpdateEnabled"];
    v216->_minimumMediaUserPrivilege = [v211 decodeIntegerForKey:@"HM.mediaMinimumUserPrivilege"];
    v216->_mediaPeerToPeerEnabled = [v211 decodeBoolForKey:@"HM.mediaPeerToPeerEnabled"];
    uint64_t v141 = [v211 decodeObjectOfClass:objc_opt_class() forKey:@"HM.mediaPassword"];
    mediaPassword = v216->_mediaPassword;
    v216->_mediaPassword = (NSString *)v141;

    v216->_protectionMode = [v211 decodeIntegerForKey:@"HMHM.networkProtectionMode"];
    unint64_t v143 = [v211 decodeIntegerForKey:@"HMHM.networkRouterSupportDisableReason"];
    uint64_t v144 = ((uint64_t)(v143 << 60) >> 63) & 3;
    if ((v143 & 7) != 0) {
      uint64_t v144 = 7;
    }
    v216->_networkRouterSupport = v144 | (v143 >> 3) & 2;
    v216->_networkRouterSupportDisableReason = v143;
    v216->_multiUserEnabled = [v211 decodeBoolForKey:@"HMHomeMultiUserEnabledValueCodingKey"];
    v145 = [v211 decodeObjectOfClass:objc_opt_class() forKey:@"HMHomeAudioAnalysisClassifierOptionsCodingKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v146 = v145;
    }
    else {
      v146 = 0;
    }
    id v147 = v146;

    uint64_t v148 = [v147 unsignedIntegerValue];
    v216->_audioAnalysisClassifierOptions = v148;
    v216->_didOnboardAudioAnalysis = [v211 decodeBoolForKey:@"HMHomeAudioAnalysisHomeOnboardingCodingKey"];
    v149 = [v211 decodeObjectOfClass:objc_opt_class() forKey:@"HMHomeSiriPhraseOptionsCodingKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v150 = v149;
    }
    else {
      v150 = 0;
    }
    id v151 = v150;

    uint64_t v152 = [v151 unsignedIntegerValue];
    v216->_siriPhraseOptions = v152;
    v216->_soundCheckEnabled = [v211 decodeBoolForKey:@"HMHomeSoundCheckCodingKey"];
    v216->_locationServicesEnabled = [v211 decodeBoolForKey:@"HMHomeLocationServicesEnabledCodingKey"];
    v216->_didOnboardLocationServices = [v211 decodeBoolForKey:@"HMHomeDidOnboardLocationServicesCodingKey"];
    v216->_hasAnyUserAcknowledgedCameraRecordingOnboarding = [v211 decodeBoolForKey:@"HMHomeHasAnyUserAcknowledgedCameraRecordingOnboardingValueCodingKey"];
    v216->_hasOnboardedForAccessCode = [v211 decodeBoolForKey:@"HMHomeHasOnboardedForAccessCodeCodingKey"];
    v216->_hasOnboardedForWalletKey = [v211 decodeBoolForKey:@"HMHomeHasOnboardedForWalletKeyCodingKey"];
    v216->_dismissedWalletKeyUWBUnlockOnboarding = [v211 decodeBoolForKey:@"HMHomeDismissedWalletKeyUWBUnlockOnboardingCodingKey"];
    v153 = [MEMORY[0x1E4F1CA80] set];
    if ([v211 decodeBoolForKey:@"HMHM.addNetworkRouterEnabled"]) {
      [v153 addObject:&unk_1EEF07F38];
    }
    uint64_t v154 = [v153 copy];
    supportedFeatures = v216->_supportedFeatures;
    v216->_supportedFeatures = (NSSet *)v154;

    __int16 v156 = (void *)MEMORY[0x1E4F1CAD0];
    v232[0] = objc_opt_class();
    v232[1] = objc_opt_class();
    v157 = [MEMORY[0x1E4F1C978] arrayWithObjects:v232 count:2];
    __int16 v158 = [v156 setWithArray:v157];
    id v159 = [v211 decodeObjectOfClasses:v158 forKey:@"HMHomeAccessoryNetworkProtectionGroupsCodingKey"];

    currentAccessoryProtectionGroups = v216->_currentAccessoryProtectionGroups;
    v161 = [v159 allObjects];
    [(HMMutableArray *)currentAccessoryProtectionGroups setArray:v161];

    v216->_isFeatureHomeTheaterQFAEnabled = [v211 decodeBoolForKey:@"HMHomeTheaterQFAEnabledCodingKey"];
    uint64_t v162 = [v211 decodeObjectOfClass:objc_opt_class() forKey:@"HMHomeSiriEndpointSupportedCodingKey"];
    supportedSiriEndPointVersion = v216->_supportedSiriEndPointVersion;
    v216->_supportedSiriEndPointVersion = (HMFVersion *)v162;

    v164 = v216;
    uint64_t v165 = [v211 decodeObjectOfClass:objc_opt_class() forKey:@"HMHM.threadNetworkID"];
    threadNetworkID = v216->_threadNetworkID;
    v216->_threadNetworkID = (NSString *)v165;

    v167 = [v211 decodeObjectOfClass:objc_opt_class() forKey:@"HMHomePersonManagerSettingsCodingKey"];
    v168 = v167;
    if (v167) {
      v169 = v167;
    }
    else {
      v169 = objc_alloc_init(HMHomePersonManagerSettings);
    }
    personManagerSettings = v216->_personManagerSettings;
    v216->_personManagerSettings = v169;

    uint64_t v171 = [v211 decodeObjectOfClass:objc_opt_class() forKey:@"HMHM.personManagerZoneUUID"];
    personManagerZoneUUID = v216->_personManagerZoneUUID;
    v216->_personManagerZoneUUID = (NSUUID *)v171;

    v216->_bulletinNotificationsSupported = [v211 decodeBoolForKey:@"HMHomeBulletinNotificationsSupportedCodingKey"];
    v216->_didOnboardEventLog = [v211 decodeBoolForKey:@"HM.EL.onboarded"];
    v216->_eventLogEnabled = [v211 decodeBoolForKey:@"HM.EL.enabled"];
    v216->_eventLogDuration = [v211 decodeIntegerForKey:@"HM.EL.duration"];
    uint64_t v173 = [v211 decodeObjectOfClass:objc_opt_class() forKey:@"HMHomeTimeZoneCodingKey"];
    timeZone = v216->_timeZone;
    v216->_timeZone = (NSTimeZone *)v173;

    uint64_t v175 = [v211 decodeObjectOfClass:objc_opt_class() forKey:@"HMHomeNumberOfCamerasCodingKey"];
    numberOfCameras = v216->_numberOfCameras;
    v216->_numberOfCameras = (NSNumber *)v175;

    v177 = [(HMUser *)v216->_currentUser homeAccessControl];
    if ([v177 isRestrictedGuest])
    {
      v198 = v138;
      v178 = [MEMORY[0x1E4F28B50] mainBundle];
      v179 = [v178 bundleIdentifier];
      if ([v179 isEqualToString:@"com.apple.rapportd"])
      {

        v164 = v216;
      }
      else
      {
        v180 = [MEMORY[0x1E4F28B50] mainBundle];
        v181 = [v180 bundleIdentifier];

        v164 = v216;
        long long v138 = v198;
        if (v181)
        {
LABEL_89:
          v164->_supportsResidentSelection = [v211 decodeBoolForKey:@"HMHomeResidentSelectionSupported"];
          uint64_t v188 = [v211 decodeObjectOfClass:objc_opt_class() forKey:@"HMHomeUserSelectedPreferredResident"];
          userSelectedPreferredResident = v164->_userSelectedPreferredResident;
          v164->_userSelectedPreferredResident = (HMResidentDevice *)v188;

          v190 = (void *)MEMORY[0x1E4F1CAD0];
          v231[0] = objc_opt_class();
          v231[1] = objc_opt_class();
          v191 = [MEMORY[0x1E4F1C978] arrayWithObjects:v231 count:2];
          v192 = [v190 setWithArray:v191];
          uint64_t v193 = [v211 decodeObjectOfClasses:v192 forKey:@"HMHomeAutoSelectedPreferredResidents"];
          autoSelectedPreferredResidents = v164->_autoSelectedPreferredResidents;
          v164->_autoSelectedPreferredResidents = (NSArray *)v193;

          id v6 = v209;
          int v5 = v210;
          long long v15 = v207;
          id v14 = v208;
          goto LABEL_90;
        }
      }
      v182 = (void *)MEMORY[0x19F3A64A0]();
      v183 = v164;
      v184 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v184, OS_LOG_TYPE_INFO))
      {
        v185 = HMFGetLogIdentifier();
        v186 = [MEMORY[0x1E4F28B50] mainBundle];
        v187 = [v186 bundleIdentifier];
        *(_DWORD *)buf = 138543618;
        v246 = v185;
        __int16 v247 = 2112;
        unint64_t v248 = (unint64_t)v187;
        _os_log_impl(&dword_19D1A8000, v184, OS_LOG_TYPE_INFO, "%{public}@Creating dummy accessories for Rapport: %@", buf, 0x16u);
      }
      v217[0] = MEMORY[0x1E4F143A8];
      v217[1] = 3221225472;
      v217[2] = __24__HMHome_initWithCoder___block_invoke;
      v217[3] = &unk_1E59414A0;
      v218 = v183;
      objc_msgSend(v212, "na_each:", v217);
      v177 = v218;
      v164 = v216;
      long long v138 = v198;
    }

    goto LABEL_89;
  }
  v31 = (void *)MEMORY[0x19F3A64A0]();
  __int16 v32 = self;
  uint64_t v33 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    __int16 v34 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v246 = v34;
    _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode home due to no uuid", buf, 0xCu);
  }
  uint64_t v35 = 0;
LABEL_91:

  return v35;
}

- (HMHome)initWithName:(id)a3 uuid:(id)a4 mediaSystems:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    uint64_t v11 = v10;
    v58.receiver = self;
    v58.super_class = (Class)HMHome;
    unsigned int v12 = [(HMHome *)&v58 init];
    if (v12)
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v8);
      name = v12->_name;
      v12->_name = (NSString *)v13;

      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v9);
      uuid = v12->_uuid;
      v12->_uuid = (NSUUID *)v15;

      uint64_t v17 = +[HMMutableArray array];
      currentAccessories = v12->_currentAccessories;
      v12->_currentAccessories = (HMMutableArray *)v17;

      uint64_t v19 = +[HMMutableArray array];
      currentRooms = v12->_currentRooms;
      v12->_currentRooms = (HMMutableArray *)v19;

      uint64_t v21 = +[HMMutableArray array];
      currentZones = v12->_currentZones;
      v12->_currentZones = (HMMutableArray *)v21;

      uint64_t v23 = +[HMMutableArray array];
      currentServiceGroups = v12->_currentServiceGroups;
      v12->_currentServiceGroups = (HMMutableArray *)v23;

      uint64_t v25 = +[HMMutableArray array];
      currentActionSets = v12->_currentActionSets;
      v12->_currentActionSets = (HMMutableArray *)v25;

      uint64_t v27 = +[HMMutableArray array];
      currentTriggerOwnedActionSets = v12->_currentTriggerOwnedActionSets;
      v12->_currentTriggerOwnedActionSets = (HMMutableArray *)v27;

      uint64_t v29 = +[HMMutableArray array];
      currentTriggers = v12->_currentTriggers;
      v12->_currentTriggers = (HMMutableArray *)v29;

      uint64_t v31 = +[HMMutableArray array];
      currentUsers = v12->_currentUsers;
      v12->_currentUsers = (HMMutableArray *)v31;

      uint64_t v33 = +[HMMutableArray array];
      currentResidentDevices = v12->_currentResidentDevices;
      v12->_currentResidentDevices = (HMMutableArray *)v33;

      uint64_t v35 = +[HMMutableArray array];
      currentOutgoingInvitations = v12->_currentOutgoingInvitations;
      v12->_currentOutgoingInvitations = (HMMutableArray *)v35;

      id v37 = [[HMMediaSystemStageManager alloc] initWithIdentifier:v12->_uuid mediaSystems:v11];
      mediaSystemStageManager = v12->_mediaSystemStageManager;
      v12->_mediaSystemStageManager = v37;

      [(HMMediaSystemStageManager *)v12->_mediaSystemStageManager setDataSource:v12];
      v12->_locationAuthorization = 1;
      uint64_t v39 = objc_alloc_init(HMApplicationData);
      applicationData = v12->_applicationData;
      v12->_applicationData = v39;

      uint64_t v41 = [MEMORY[0x1E4F1C9C8] distantFuture];
      notificationsUpdatedTime = v12->_notificationsUpdatedTime;
      v12->_notificationsUpdatedTime = (NSDate *)v41;

      v12->_homeLocationStatus = 0;
      uint64_t v43 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
      shareWithHomeOwnerOperationQueue = v12->_shareWithHomeOwnerOperationQueue;
      v12->_shareWithHomeOwnerOperationQueue = v43;

      [(NSOperationQueue *)v12->_shareWithHomeOwnerOperationQueue setMaxConcurrentOperationCount:1];
      v12->_networkRouterSupport = 0;
      v12->_networkRouterSupportDisableReason = 0;
      uint64_t v45 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1EEF07F38];
      supportedFeatures = v12->_supportedFeatures;
      v12->_supportedFeatures = (NSSet *)v45;

      uint64_t v47 = +[HMMutableArray array];
      currentAccessoryProtectionGroups = v12->_currentAccessoryProtectionGroups;
      v12->_currentAccessoryProtectionGroups = (HMMutableArray *)v47;

      managedTriggers = v12->_managedTriggers;
      v12->_managedTriggers = (NSArray *)MEMORY[0x1E4F1CBF0];

      uint64_t v50 = [MEMORY[0x1E4F1CA60] dictionary];
      hmModernMessagingRequestHandlersByMessageName = v12->_hmModernMessagingRequestHandlersByMessageName;
      v12->_hmModernMessagingRequestHandlersByMessageName = (NSMutableDictionary *)v50;

      uint64_t v52 = [MEMORY[0x1E4F1CA60] dictionary];
      hmModernMessagingOptionsByMessageName = v12->_hmModernMessagingOptionsByMessageName;
      v12->_hmModernMessagingOptionsByMessageName = (NSMutableDictionary *)v52;
    }
    return v12;
  }
  else
  {
    uint64_t v55 = (HMMediaSystemStageManager *)_HMFPreconditionFailure();
    [(HMMediaSystemStageManager *)v55 setDataSource:v57];
  }
  return result;
}

- (NSArray)users
{
  v2 = [(HMHome *)self currentUsers];
  v3 = [v2 array];

  return (NSArray *)v3;
}

- (HMMutableArray)currentUsers
{
  return self->_currentUsers;
}

- (BOOL)didOnboardAudioAnalysis
{
  return self->_didOnboardAudioAnalysis;
}

void __31__HMHome_reEnableNotifications__block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v17 = a1;
  id obj = [*(id *)(a1 + 32) accessories];
  uint64_t v20 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v31;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v3;
        id v4 = *(void **)(*((void *)&v30 + 1) + 8 * v3);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        int v5 = [v4 services];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v35 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v27 != v8) {
                objc_enumerationMutation(v5);
              }
              id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              long long v22 = 0u;
              long long v23 = 0u;
              long long v24 = 0u;
              long long v25 = 0u;
              uint64_t v11 = [v10 characteristics];
              uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v34 count:16];
              if (v12)
              {
                uint64_t v13 = v12;
                uint64_t v14 = *(void *)v23;
                do
                {
                  for (uint64_t j = 0; j != v13; ++j)
                  {
                    if (*(void *)v23 != v14) {
                      objc_enumerationMutation(v11);
                    }
                    long long v16 = *(void **)(*((void *)&v22 + 1) + 8 * j);
                    if ([v16 notificationEnabledByThisClient]) {
                      [v2 addObject:v16];
                    }
                  }
                  uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v34 count:16];
                }
                while (v13);
              }
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v35 count:16];
          }
          while (v7);
        }

        uint64_t v3 = v21 + 1;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v20);
  }

  [*(id *)(v17 + 32) _enableNotification:1 forCharacteristics:v2 completionHandler:0];
  if ([*(id *)(v17 + 32) notificationEnableRequested]) {
    objc_msgSend(*(id *)(v17 + 32), "_enableNotifications:includeAppleMediaAccessoryNotifications:completionHandler:", 1, objc_msgSend(*(id *)(v17 + 32), "notificationEnableRequestedForAppleMediaAccessories"), 0);
  }
}

- (BOOL)notificationEnableRequested
{
  return self->_notificationEnableRequested;
}

- (void)_enableNotification:(BOOL)a3 forCharacteristics:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(HMHome *)self context];
  uint64_t v11 = (void *)v10;
  if (v10)
  {
    SEL v56 = (void *)v10;
    id v57 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v62 objects:v70 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      BOOL v52 = v6;
      id v54 = v8;
      uint64_t v55 = self;
      uint64_t v53 = v9;
      char v15 = 0;
      uint64_t v16 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v63 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          uint64_t v19 = [v18 service];
          uint64_t v20 = [v19 accessory];
          uint64_t v21 = [v20 uuid];
          long long v22 = [v21 UUIDString];

          if (v22)
          {
            long long v23 = [v57 objectForKeyedSubscript:v22];
            if (!v23)
            {
              long long v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
              [v57 setObject:v23 forKeyedSubscript:v22];
            }
            long long v24 = [v18 instanceID];
            [v23 addObject:v24];

            char v15 = 1;
          }
          else
          {
            long long v25 = (void *)MEMORY[0x19F3A64A0]();
            long long v26 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              long long v27 = HMFGetLogIdentifier();
              long long v28 = [v18 instanceID];
              *(_DWORD *)buf = 138543618;
              uint64_t v72 = v27;
              __int16 v73 = 2112;
              uint64_t v74 = v28;
              _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_INFO, "%{public}@Skipping enabling notification for characteristic %@", buf, 0x16u);
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v62 objects:v70 count:16];
      }
      while (v14);

      id v9 = v53;
      id v8 = v54;
      self = v55;
      if (v15)
      {
        uint64_t v11 = v56;
        if (v52)
        {
          v68 = @"kNotificationEnablePayloadKey";
          v69 = v57;
          long long v29 = (void *)MEMORY[0x1E4F1C9E8];
          long long v30 = &v69;
          long long v31 = &v68;
        }
        else
        {
          unsigned __int8 v66 = @"kNotificationDisablePayloadKey";
          v67 = v57;
          long long v29 = (void *)MEMORY[0x1E4F1C9E8];
          long long v30 = &v67;
          long long v31 = &v66;
        }
        uint64_t v39 = [v29 dictionaryWithObjects:v30 forKeys:v31 count:1];
        id v42 = objc_alloc(MEMORY[0x1E4F654B0]);
        id v43 = objc_alloc(MEMORY[0x1E4F65488]);
        long long v44 = [(HMHome *)v55 uuid];
        uint64_t v45 = (void *)[v43 initWithTarget:v44];
        uint64_t v40 = (void *)[v42 initWithName:@"kCharacteristicEnableNotificationRequestKey" destination:v45 payload:v39];

        id v46 = [v56 pendingRequests];
        uint64_t v47 = [v40 identifier];
        uint64_t v48 = _Block_copy(v53);
        [v46 addCompletionBlock:v48 forIdentifier:v47];

        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __67__HMHome__enableNotification_forCharacteristics_completionHandler___block_invoke;
        v58[3] = &unk_1E59450E8;
        id v59 = v46;
        id v60 = v47;
        id v49 = v56;
        id v61 = v49;
        id v50 = v47;
        id v41 = v46;
        [v40 setResponseHandler:v58];
        long long v51 = [v49 messageDispatcher];
        [v51 sendMessage:v40];

LABEL_28:
        goto LABEL_29;
      }
    }
    else
    {
    }
    __int16 v36 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v37 = HMFGetOSLogHandle();
    uint64_t v11 = v56;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      __int16 v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v72 = v38;
      _os_log_impl(&dword_19D1A8000, v37, OS_LOG_TYPE_INFO, "%{public}@No valid characteristics to enable notifications", buf, 0xCu);
    }
    uint64_t v39 = [(HMHome *)self context];
    uint64_t v40 = [v39 delegateCaller];
    id v41 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v40 callCompletion:v9 error:v41];
    goto LABEL_28;
  }
  long long v32 = (void *)MEMORY[0x19F3A64A0]();
  long long v33 = self;
  __int16 v34 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    uint64_t v35 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v72 = v35;
    __int16 v73 = 2080;
    uint64_t v74 = "-[HMHome _enableNotification:forCharacteristics:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v34, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
  }
LABEL_29:
}

uint64_t __42__HMHome_handleRuntimeStateUpdate_reason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleRuntimeStateUpdate:*(void *)(a1 + 40) reason:*(void *)(a1 + 48)];
}

- (BOOL)supportsResidentSelection
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsResidentSelection;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (HMAccessorySoftwareUpdateControllerV2)softwareUpdateController
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  softwareUpdateController = self->_softwareUpdateController;
  if (!softwareUpdateController)
  {
    int v5 = [(HMHome *)self homeManager];
    BOOL v6 = [v5 softwareUpdateDocumentationManager];
    uint64_t v7 = [v5 eventRouter];
    id v8 = (void *)v7;
    if (v6 && v7)
    {
      id v9 = [HMAccessorySoftwareUpdateControllerV2 alloc];
      uint64_t v10 = [(HMHome *)self context];
      uint64_t v11 = [(HMAccessorySoftwareUpdateControllerV2 *)v9 initWithContext:v10 home:self subscriptionProvider:v8 documentationManager:v6];
      id v12 = self->_softwareUpdateController;
      self->_softwareUpdateController = v11;
    }
    softwareUpdateController = self->_softwareUpdateController;
  }
  uint64_t v13 = softwareUpdateController;
  os_unfair_lock_unlock(p_lock);

  return v13;
}

- (void)_handleLocationAuthorizationUpdatedNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }
  id v7 = v6;

  id v8 = [(HMHome *)self homeManager];
  id v9 = [v8 configuration];
  id v10 = [v9 locationAuthorization];

  if (v7 == v10)
  {
    uint64_t v11 = [(HMHome *)self context];
    if (v11)
    {
      char v12 = [v7 isAuthorized];
      uint64_t v13 = [v11 queue];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __58__HMHome__handleLocationAuthorizationUpdatedNotification___block_invoke;
      v18[3] = &unk_1E59413F8;
      char v19 = v12;
      v18[4] = self;
      dispatch_async(v13, v18);
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x19F3A64A0]();
      char v15 = self;
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v21 = v17;
        __int16 v22 = 2080;
        long long v23 = "-[HMHome _handleLocationAuthorizationUpdatedNotification:]";
        _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
      }
    }
  }
}

- (void)_handleRuntimeStateUpdate:(id)a3 reason:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "hmf_dictionaryForKey:", @"kAccessoriesListKey");
  __int16 v22 = v7;
  uint64_t v20 = [@"Home-" stringByAppendingString:v7];
  uint64_t v21 = v8;
  __handleAccessoryRuntimeStateUpdate(self, v8, v20);
  long long v23 = v6;
  id v9 = objc_msgSend(v6, "hmf_dictionaryForKey:", @"residentDevicesList");
  id v10 = [(HMHome *)self residentDevices];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v11 = [v9 allKeys];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * v15);
        uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDString:", v16, v20, v21);
        uint64_t v18 = objc_msgSend(v10, "hmf_firstObjectWithUUID:", v17);
        char v19 = objc_msgSend(v9, "hmf_dictionaryForKey:", v16);
        [v18 handleRuntimeStateUpdate:v19];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }
}

- (id)userActionPredictionController
{
  uint64_t v3 = [(HMHome *)self homeManager];
  id v4 = [v3 predictionProvider];

  if (v4)
  {
    int v5 = [HMUserActionPredictionController alloc];
    id v6 = [(HMHome *)self uniqueIdentifier];
    id v7 = [(HMUserActionPredictionController *)v5 initWithHomeIdentifier:v6 predictionProvider:v4];

    id v8 = [(HMHome *)self context];
    [(HMUserActionPredictionController *)v7 configureWithContext:v8];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (HMHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);

  return (HMHomeManager *)WeakRetained;
}

+ (id)passSerialNumberWithHomeUUID:(id)a3 userUUID:(id)a4
{
  int v5 = (void *)MEMORY[0x1E4F29128];
  id v6 = a3;
  id v7 = [a4 UUIDString];
  id v8 = [v7 dataUsingEncoding:4];
  id v9 = objc_msgSend(v5, "hmf_UUIDWithNamespace:data:", v6, v8);

  id v10 = (void *)MEMORY[0x1E4F29128];
  uint64_t v11 = [@"F8ADC5C9-15AC-424D-AD82-6D43424B7461" dataUsingEncoding:4];
  uint64_t v12 = objc_msgSend(v10, "hmf_UUIDWithNamespace:data:", v9, v11);

  uint64_t v13 = [v12 UUIDString];

  return v13;
}

- (BOOL)hasOnboardedForWalletKey
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasOnboardedForWalletKey;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)reEnableNotifications
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMHome *)self context];
  id v4 = v3;
  if (v3)
  {
    int v5 = [v3 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__HMHome_reEnableNotifications__block_invoke;
    block[3] = &unk_1E59452E8;
    block[4] = self;
    dispatch_async(v5, block);
  }
  else
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2080;
      uint64_t v14 = "-[HMHome reEnableNotifications]";
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

- (BOOL)isMultiUserEnabled
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_multiUserEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setPrimary:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_primary = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasOnboardedForAccessCode
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasOnboardedForAccessCode;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)dismissedWalletKeyUWBUnlockOnboarding
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_dismissedWalletKeyUWBUnlockOnboarding;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)matterControllerID
{
  v2 = [(HMHome *)self uuid];
  uint64_t v3 = [v2 UUIDString];

  return (NSString *)v3;
}

uint64_t __88__HMHome_enableNotifications_includeAppleMediaAccessoryNotifications_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enableNotifications:*(unsigned __int8 *)(a1 + 48) includeAppleMediaAccessoryNotifications:*(unsigned __int8 *)(a1 + 49) completionHandler:*(void *)(a1 + 40)];
}

void __53__HMHome_HMAccessory___performBatchRequest_activity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v6 = v3;
    uint64_t v4 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
    int v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t, id, void, void))(v4 + 16))(v4, v6, 0, 0);
    }

    id v3 = v6;
  }
}

void __58__HMHome_Wallet__fetchWalletKeyDeviceStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v22[0] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  id v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMHomeWalletKeyManagerMessageKeyDeviceState", v7);

  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = HMFGetOSLogHandle();
  uint64_t v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = HMFGetLogIdentifier();
      int v18 = 138543618;
      char v19 = v13;
      __int16 v20 = 2112;
      uint64_t v21 = v8;
      uint64_t v14 = "%{public}@Successfully fetched wallet key device state: %@";
      uint64_t v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v15, v16, v14, (uint8_t *)&v18, 0x16u);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = HMFGetLogIdentifier();
    int v18 = 138543618;
    char v19 = v13;
    __int16 v20 = 2112;
    uint64_t v21 = 0;
    uint64_t v14 = "%{public}@Failed to fetch wallet key device state: %@";
    uint64_t v15 = v12;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  uint64_t v17 = [*(id *)(a1 + 40) delegateCaller];
  [v17 callCompletion:*(void *)(a1 + 48) obj:v8 error:v5];
}

void __89__HMHome__enableNotifications_includeAppleMediaAccessoryNotifications_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = a2;
    id v7 = [v3 removeCompletionBlockForIdentifier:v4];
    id v6 = [*(id *)(a1 + 48) delegateCaller];
    [v6 callCompletion:v7 error:v5 obj:0];
  }
}

void __27__HMHome__retrieveLocation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Retrieving location failed with error %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _handleHomeLocationUpdate:v6];
  }
}

- (void)__updateLocation:(id)a3 locationStatus:(int64_t)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  id v7 = [(HMHome *)self context];
  id v8 = [v7 queue];

  if (v8)
  {
    id v9 = [(HMHome *)self context];
    id v10 = [v9 queue];
    dispatch_assert_queue_V2(v10);

    if ([(HMHome *)self locationAuthorization] == 2)
    {
      int v11 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v12 = self;
      __int16 v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v41 = v14;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Treating updated location as nil because location authorization is not allowed", buf, 0xCu);
      }

      id v6 = 0;
    }
    uint64_t v15 = [(HMHome *)self homeLocation];
    char v16 = HMFEqualObjects();

    if ((v16 & 1) == 0)
    {
      uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
      int v18 = self;
      char v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = HMFGetLogIdentifier();
        uint64_t v21 = [(HMHome *)v18 homeLocation];
        *(_DWORD *)buf = 138543874;
        id v41 = v20;
        __int16 v42 = 2112;
        id v43 = v21;
        __int16 v44 = 2112;
        uint64_t v45 = v6;
        _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating home location from %@ to %@", buf, 0x20u);
      }
      [(HMHome *)v18 setHomeLocation:v6];
      __int16 v22 = [(HMHome *)v18 _privateDelegate];
      if (objc_opt_respondsToSelector())
      {
        long long v23 = [(HMHome *)v18 context];
        long long v24 = [v23 delegateCaller];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __42__HMHome___updateLocation_locationStatus___block_invoke;
        v36[3] = &unk_1E5945650;
        id v37 = v22;
        __int16 v38 = v18;
        uint64_t v39 = v6;
        [v24 invokeBlock:v36];
      }
    }
    if ([(HMHome *)self homeLocationStatus] != a4)
    {
      long long v25 = (void *)MEMORY[0x19F3A64A0]();
      long long v26 = self;
      long long v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        long long v28 = HMFGetLogIdentifier();
        unint64_t v29 = [(HMHome *)v26 homeLocationStatus];
        if (v29 > 3) {
          long long v30 = @"HMHomeLocationAway";
        }
        else {
          long long v30 = off_1E5941908[v29];
        }
        if ((unint64_t)a4 > 3) {
          uint64_t v35 = @"HMHomeLocationAway";
        }
        else {
          uint64_t v35 = off_1E5941908[a4];
        }
        *(_DWORD *)buf = 138543874;
        id v41 = v28;
        __int16 v42 = 2112;
        id v43 = v30;
        __int16 v44 = 2112;
        uint64_t v45 = v35;
        _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_INFO, "%{public}@Updating home location status from %@ to %@", buf, 0x20u);
      }
      [(HMHome *)v26 setHomeLocationStatus:a4];
      [(HMHome *)v26 _notifyDelegateOfUpdatedHomeLocationStatus];
    }
  }
  else
  {
    long long v31 = (void *)MEMORY[0x19F3A64A0]();
    long long v32 = self;
    long long v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      __int16 v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v41 = v34;
      _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_ERROR, "%{public}@Cannot update location as HMContext is invalid.", buf, 0xCu);
    }
  }
}

void __58__HMHome__handleLocationAuthorizationUpdatedNotification___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  if ([*(id *)(a1 + 32) locationAuthorization] != v3)
  {
    [*(id *)(a1 + 32) setLocationAuthorization:v3];
    uint64_t v4 = *(void **)(a1 + 32);
    if (v2)
    {
      id v5 = [*(id *)(a1 + 32) homeLocation];

      if (!v5)
      {
        id v7 = *(void **)(a1 + 32);
        [v7 _retrieveLocation];
      }
    }
    else
    {
      uint64_t v6 = [*(id *)(a1 + 32) homeLocationStatus];
      objc_msgSend(v4, "__updateLocation:locationStatus:", 0, v6);
    }
  }
}

- (id)location
{
  int v2 = [(HMHome *)self homeLocation];
  uint64_t v3 = (void *)[v2 copy];

  return v3;
}

- (CLLocation)homeLocation
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_homeLocation;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (int64_t)locationAuthorization
{
  return self->_locationAuthorization;
}

- (void)_handleHomeLocationUpdate:(id)a3
{
  objc_msgSend(a3, "hm_locationFromDataForKey:", @"kHomeLocationKey");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(HMHome *)self __updateLocation:v4 locationStatus:[(HMHome *)self homeLocationStatus]];
}

- (int64_t)homeLocationStatus
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t homeLocationStatus = self->_homeLocationStatus;
  os_unfair_lock_unlock(p_lock);
  return homeLocationStatus;
}

- (void)setDelegate:(id)delegate
{
  p_locuint64_t k = &self->_lock;
  id v5 = delegate;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isAutomaticSoftwareUpdateEnabled
{
  int v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_automaticSoftwareUpdateEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

uint64_t __21__HMHome_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v365;
  logCategory__hmf_once_v365 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)reRegisterHMMMHandlers
{
  uint64_t v3 = [(HMHome *)self uuid];
  id v4 = [v3 UUIDString];
  id v5 = +[HMMMLogOrigin originWithLogIdentifier:v4];

  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  os_unfair_lock_lock_with_options();
  id v7 = [(HMHome *)self hmModernMessagingOptionsByMessageName];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__HMHome_HMModernMessagingInternal__reRegisterHMMMHandlers__block_invoke;
  v10[3] = &unk_1E5941888;
  v10[4] = v5;
  v10[5] = self;
  id v8 = v6;
  id v11 = v8;
  objc_msgSend(v7, "na_each:", v10);

  os_unfair_lock_unlock(&self->_lock);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__HMHome_HMModernMessagingInternal__reRegisterHMMMHandlers__block_invoke_2122;
  v9[3] = &unk_1E59418B0;
  v9[4] = self;
  objc_msgSend(v8, "na_each:", v9);
}

- (NSMutableDictionary)hmModernMessagingOptionsByMessageName
{
  return self->_hmModernMessagingOptionsByMessageName;
}

- (HMResidentDevice)userSelectedPreferredResident
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_userSelectedPreferredResident;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)fetchSettingsForLightProfiles:(id)a3 withCompletion:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v26 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(Light) fetchSettingsForLightProfiles:withCompletion:]", @"completion"];
    long long v27 = (void *)MEMORY[0x19F3A64A0]();
    long long v28 = self;
    unint64_t v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      long long v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v30;
      __int16 v41 = 2112;
      __int16 v42 = (const char *)v26;
      _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v31 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v26 userInfo:0];
    objc_exception_throw(v31);
  }
  id v8 = (void (**)(void, void, void))v7;
  id v9 = [(HMHome *)self context];
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F65488]);
    id v11 = [(HMHome *)self uuid];
    uint64_t v12 = (void *)[v10 initWithTarget:v11];

    long long v32 = v6;
    __int16 v13 = objc_msgSend(v6, "na_map:", &__block_literal_global_18029);
    id v37 = @"HMHomeMessageKeyLightProfileUUIDs";
    __int16 v38 = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    uint64_t v15 = [MEMORY[0x1E4F654B0] messageWithName:@"HMHomeFetchLightProfilesSettingsMessage" destination:v12 payload:v14];
    char v16 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v17 = self;
    int v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      char v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = v19;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@Fetching settings...", buf, 0xCu);
    }
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __62__HMHome_Light__fetchSettingsForLightProfiles_withCompletion___block_invoke_10;
    v33[3] = &unk_1E59441B0;
    v33[4] = v17;
    id v6 = v32;
    id v34 = v32;
    id v20 = v9;
    id v35 = v20;
    __int16 v36 = v8;
    [v15 setResponseHandler:v33];
    uint64_t v21 = [v20 messageDispatcher];
    [v21 sendMessage:v15];
  }
  else
  {
    __int16 v22 = (void *)MEMORY[0x19F3A64A0]();
    long long v23 = self;
    long long v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      long long v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v25;
      __int16 v41 = 2080;
      __int16 v42 = "-[HMHome(Light) fetchSettingsForLightProfiles:withCompletion:]";
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v12);
  }
}

- (void)fetchWalletKeyDeviceStateWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v24 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching wallet key device state", buf, 0xCu);
  }
  id v9 = [(HMHome *)v6 context];
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F65488]);
    id v11 = [(HMHome *)v6 uuid];
    uint64_t v12 = (void *)[v10 initWithTarget:v11];

    __int16 v13 = [MEMORY[0x1E4F654B0] messageWithName:@"HMHomeWalletKeyManagerFetchDeviceStateMessage" destination:v12 payload:0];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __58__HMHome_Wallet__fetchWalletKeyDeviceStateWithCompletion___block_invoke;
    v20[3] = &unk_1E5945510;
    void v20[4] = v6;
    id v14 = v9;
    id v21 = v14;
    id v22 = v4;
    [v13 setResponseHandler:v20];
    uint64_t v15 = [v14 messageDispatcher];
    [v15 sendMessage:v13];

LABEL_9:
    goto LABEL_10;
  }
  char v16 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v17 = v6;
  int v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    char v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v24 = v19;
    __int16 v25 = 2080;
    uint64_t v26 = "-[HMHome(Wallet) fetchWalletKeyDeviceStateWithCompletion:]";
    _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v12);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_enableNotifications:(BOOL)a3 includeAppleMediaAccessoryNotifications:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = [(HMHome *)self context];
  if (v9)
  {
    v33[0] = @"kCharacteristicNotificationEnableKey";
    id v10 = [NSNumber numberWithBool:v6];
    v33[1] = @"HMHomeEnableHomeAppleMediaNotificationsKey";
    v34[0] = v10;
    id v11 = [NSNumber numberWithInt:v6 & v5];
    v34[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];

    id v13 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v14 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v15 = [(HMHome *)self uuid];
    char v16 = (void *)[v14 initWithTarget:v15];
    uint64_t v17 = (void *)[v13 initWithName:@"HM.notificationEnable" destination:v16 payload:v12];

    int v18 = [v9 pendingRequests];
    char v19 = [v17 identifier];
    id v20 = _Block_copy(v8);
    [v18 addCompletionBlock:v20 forIdentifier:v19];

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __89__HMHome__enableNotifications_includeAppleMediaAccessoryNotifications_completionHandler___block_invoke;
    v29[3] = &unk_1E59450E8;
    id v30 = v18;
    id v31 = v19;
    id v21 = v9;
    id v32 = v21;
    id v22 = v19;
    id v23 = v18;
    [v17 setResponseHandler:v29];
    long long v24 = [v21 messageDispatcher];
    [v24 sendMessage:v17];
  }
  else
  {
    __int16 v25 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v26 = self;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      long long v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v36 = v28;
      __int16 v37 = 2080;
      __int16 v38 = "-[HMHome _enableNotifications:includeAppleMediaAccessoryNotifications:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

- (void)_retrieveLocation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMHome *)self context];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v5 = objc_alloc(MEMORY[0x1E4F65488]);
    BOOL v6 = [(HMHome *)self uuid];
    id v7 = (void *)[v5 initWithTarget:v6];
    id v8 = (void *)[v4 initWithName:@"kRetrieveHomeLocationRequestKey" destination:v7 payload:0];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __27__HMHome__retrieveLocation__block_invoke;
    v14[3] = &unk_1E5943FA0;
    v14[4] = self;
    [v8 setResponseHandler:v14];
    id v9 = [v3 messageDispatcher];
    [v9 sendMessage:v8];
  }
  else
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      char v16 = v13;
      __int16 v17 = 2080;
      int v18 = "-[HMHome _retrieveLocation]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

- (void)enableNotifications:(BOOL)a3 includeAppleMediaAccessoryNotifications:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = [(HMHome *)self context];
  if (!v8)
  {
    uint64_t v17 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome enableNotifications:includeAppleMediaAccessoryNotifications:completionHandler:]", @"completion"];
    int v18 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v28 = v21;
      __int16 v29 = 2112;
      id v30 = (const char *)v17;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0];
    objc_exception_throw(v22);
  }
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__HMHome_enableNotifications_includeAppleMediaAccessoryNotifications_completionHandler___block_invoke;
    block[3] = &unk_1E5941448;
    block[4] = self;
    BOOL v25 = a3;
    BOOL v26 = a4;
    id v24 = v8;
    dispatch_async(v11, block);
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v28 = v15;
      __int16 v29 = 2080;
      id v30 = "-[HMHome enableNotifications:includeAppleMediaAccessoryNotifications:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    char v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v8 + 2))(v8, v16);
  }
}

- (void)setHasOnboardedForAccessCodeWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMHome *)self context];
  BOOL v6 = (void *)MEMORY[0x19F3A64A0]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v24 = v10;
      __int16 v25 = 2112;
      BOOL v26 = (const char *)v7;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Client requested to onboard home for access code: %@", buf, 0x16u);
    }
    id v11 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v12 = [(HMHome *)v7 uuid];
    id v13 = (void *)[v11 initWithTarget:v12];

    id v14 = [MEMORY[0x1E4F654B0] messageWithName:@"HMHomeSetHasOnboardedForAccessCodeMessage" destination:v13 payload:0];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __65__HMHome_AccessCode__setHasOnboardedForAccessCodeWithCompletion___block_invoke;
    id v20 = &unk_1E5944EF0;
    id v21 = v7;
    id v22 = v4;
    [v14 setResponseHandler:&v17];
    uint64_t v15 = objc_msgSend(v5, "messageDispatcher", v17, v18, v19, v20, v21);
    [v15 sendMessage:v14];

    goto LABEL_9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    char v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v24 = v16;
    __int16 v25 = 2080;
    BOOL v26 = "-[HMHome(AccessCode) setHasOnboardedForAccessCodeWithCompletion:]";
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v4)
  {
    id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v13);
LABEL_9:
  }
}

void __65__HMHome_AccessCode__setHasOnboardedForAccessCodeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 32);
      int v22 = 138543874;
      id v23 = v10;
      __int16 v24 = 2112;
      uint64_t v25 = v11;
      __int16 v26 = 2112;
      id v27 = v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to onboard home for access code %@:%@", (uint8_t *)&v22, 0x20u);
    }
    uint64_t v12 = [*(id *)(a1 + 32) context];
    id v13 = [v12 delegateCaller];
    id v14 = v13;
    uint64_t v15 = *(void *)(a1 + 40);
    id v16 = v5;
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]([*(id *)(a1 + 32) setHasOnboardedForAccessCode:1]);
    id v18 = *(id *)(a1 + 32);
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      uint64_t v21 = *(void *)(a1 + 32);
      int v22 = 138543618;
      id v23 = v20;
      __int16 v24 = 2112;
      uint64_t v25 = v21;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@Successfully onboarded home for access code: %@", (uint8_t *)&v22, 0x16u);
    }
    uint64_t v12 = [*(id *)(a1 + 32) context];
    id v13 = [v12 delegateCaller];
    id v14 = v13;
    uint64_t v15 = *(void *)(a1 + 40);
    id v16 = 0;
  }
  [v13 callCompletion:v15 error:v16];
}

- (id)createAccessCodeManager
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMHome *)self accessCodeManager];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      int v16 = 138543362;
      uint64_t v17 = v7;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Client requested to create access code manager, but one already exists for home.", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    id v8 = [[HMAccessCodeManager alloc] initWithHome:self];
    [(HMHome *)self setAccessCodeManager:v8];

    id v9 = [(HMHome *)self accessCodeManager];
    [v9 configure];

    id v4 = (void *)MEMORY[0x19F3A64A0]();
    id v10 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = [(HMHome *)v10 accessCodeManager];
      id v13 = [(HMHome *)v10 uuid];
      int v16 = 138543874;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Created new Access Code Manager %@ for home UUID %@", (uint8_t *)&v16, 0x20u);
    }
  }

  id v14 = [(HMHome *)self accessCodeManager];

  return v14;
}

- (void)restoreMissingWalletKeys:(id)a3 completion:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v43 = v11;
    __int16 v44 = 2112;
    id v45 = v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Restoring missing wallet keys: %@", buf, 0x16u);
  }
  uint64_t v12 = [(HMHome *)v9 context];
  if (v12)
  {
    id v13 = objc_msgSend(v6, "na_map:", &__block_literal_global_8165);
    id v14 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v15 = [(HMHome *)v9 uuid];
    id v16 = (id)[v14 initWithTarget:v15];

    uint64_t v17 = (void *)MEMORY[0x1E4F654B0];
    uint64_t v40 = @"HMHomeWalletKeyManagerMessageKeyMissingWalletKeys";
    __int16 v18 = encodeRootObject(v13);
    __int16 v41 = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    id v20 = [v17 messageWithName:@"HMHomeWalletKeyManagerRestoreMissingWalletKeysMessage" destination:v16 payload:v19];

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __54__HMHome_Wallet__restoreMissingWalletKeys_completion___block_invoke_3;
    v31[3] = &unk_1E5942B08;
    id v21 = v12;
    id v32 = v21;
    long long v33 = v9;
    id v35 = v6;
    id v36 = v7;
    id v34 = v13;
    id v22 = v6;
    id v23 = v7;
    id v24 = v13;
    [v20 setResponseHandler:v31];
    uint64_t v25 = [v21 messageDispatcher];
    [v25 sendMessage:v20];
  }
  else
  {
    __int16 v26 = (void *)MEMORY[0x19F3A64A0]();
    id v27 = v9;
    uint64_t v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      __int16 v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v29;
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to restore missing wallet keys, context not specified", buf, 0xCu);
    }
    id v30 = [0 delegateCaller];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __54__HMHome_Wallet__restoreMissingWalletKeys_completion___block_invoke;
    v37[3] = &unk_1E59454E8;
    id v38 = v6;
    id v39 = v7;
    id v20 = v6;
    id v16 = v7;
    [v30 invokeBlock:v37];

    id v24 = v39;
  }
}

void __54__HMHome_Wallet__restoreMissingWalletKeys_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
  (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);
}

void __54__HMHome_Wallet__restoreMissingWalletKeys_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  id v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMHomeWalletKeyManagerMessageKeyMissingWalletKeys", v7);

  if (v8)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54__HMHome_Wallet__restoreMissingWalletKeys_completion___block_invoke_63;
    v17[3] = &unk_1E593EB78;
    v17[4] = *(void *)(a1 + 40);
    id v9 = objc_msgSend(v8, "na_map:", v17);
    id v10 = [*(id *)(a1 + 32) delegateCaller];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__HMHome_Wallet__restoreMissingWalletKeys_completion___block_invoke_2_64;
    v14[3] = &unk_1E5945138;
    v14[4] = *(void *)(a1 + 40);
    id v15 = v9;
    id v16 = *(id *)(a1 + 64);
    id v11 = v9;
    [v10 invokeBlock:v14];
  }
  else
  {
    uint64_t v12 = [*(id *)(a1 + 32) delegateCaller];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __54__HMHome_Wallet__restoreMissingWalletKeys_completion___block_invoke_4;
    v18[3] = &unk_1E5944900;
    id v13 = *(void **)(a1 + 48);
    v18[4] = *(void *)(a1 + 40);
    id v19 = v13;
    id v20 = v5;
    id v22 = *(id *)(a1 + 64);
    id v21 = *(id *)(a1 + 56);
    [v12 invokeBlock:v18];

    id v11 = v19;
  }
}

uint64_t __54__HMHome_Wallet__restoreMissingWalletKeys_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v9 = 138543874;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to restore missing wallet keys: %@ with error: %@", (uint8_t *)&v9, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

HMMissingWalletKey *__54__HMHome_Wallet__restoreMissingWalletKeys_completion___block_invoke_63(uint64_t a1, uint64_t a2)
{
  return +[HMMissingWalletKey missingWalletKeyWithValue:a2 home:*(void *)(a1 + 32)];
}

uint64_t __54__HMHome_Wallet__restoreMissingWalletKeys_completion___block_invoke_2_64(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    int v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@After restored missing wallet keys, the remaining missing wallet keys are: %@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

id __54__HMHome_Wallet__restoreMissingWalletKeys_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[HMMissingWalletKeyValue valueForMissingWalletKey:a2];
}

- (void)fetchMissingWalletKeysForUser:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)MEMORY[0x19F3A64A0]();
  int v9 = self;
  __int16 v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v39 = v11;
    __int16 v40 = 2112;
    id v41 = v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching missing wallet keys for user: %@", buf, 0x16u);
  }
  uint64_t v12 = [(HMHome *)v9 context];
  if (v12)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v14 = [(HMHome *)v9 uuid];
    id v15 = (id)[v13 initWithTarget:v14];

    id v16 = (void *)MEMORY[0x1E4F654B0];
    id v36 = @"HMHomeWalletKeyManagerMessageKeyUserUUIDString";
    uint64_t v17 = [v6 uuid];
    __int16 v18 = [v17 UUIDString];
    __int16 v37 = v18;
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    id v20 = [v16 messageWithName:@"HMHomeWalletKeyManagerFetchMissingWalletKeysMessage" destination:v15 payload:v19];

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __59__HMHome_Wallet__fetchMissingWalletKeysForUser_completion___block_invoke_2;
    v29[3] = &unk_1E59441B0;
    id v21 = v12;
    id v30 = v21;
    uint64_t v31 = v9;
    id v32 = v6;
    id v33 = v7;
    id v22 = v7;
    [v20 setResponseHandler:v29];
    id v23 = [v21 messageDispatcher];
    [v23 sendMessage:v20];
  }
  else
  {
    id v24 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v25 = v9;
    __int16 v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v39 = v27;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch missing wallet keys for user, context not specified, returning empty list", buf, 0xCu);
    }
    uint64_t v28 = [0 delegateCaller];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    void v34[2] = __59__HMHome_Wallet__fetchMissingWalletKeysForUser_completion___block_invoke;
    v34[3] = &unk_1E59454C0;
    id v35 = v7;
    id v15 = v7;
    [v28 invokeBlock:v34];

    id v20 = v35;
  }
}

void __59__HMHome_Wallet__fetchMissingWalletKeysForUser_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1CAD0] set];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __59__HMHome_Wallet__fetchMissingWalletKeysForUser_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  int v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMHomeWalletKeyManagerMessageKeyMissingWalletKeys", v7);

  if (!v8)
  {
    int v9 = [*(id *)(a1 + 32) delegateCaller];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59__HMHome_Wallet__fetchMissingWalletKeysForUser_completion___block_invoke_3;
    v21[3] = &unk_1E5944360;
    __int16 v10 = *(void **)(a1 + 48);
    v21[4] = *(void *)(a1 + 40);
    id v22 = v10;
    id v23 = v5;
    id v24 = *(id *)(a1 + 56);
    [v9 invokeBlock:v21];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __59__HMHome_Wallet__fetchMissingWalletKeysForUser_completion___block_invoke_60;
  v20[3] = &unk_1E593EB78;
  void v20[4] = *(void *)(a1 + 40);
  uint64_t v11 = objc_msgSend(v8, "na_map:", v20);
  uint64_t v12 = [*(id *)(a1 + 32) delegateCaller];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__HMHome_Wallet__fetchMissingWalletKeysForUser_completion___block_invoke_2_61;
  v16[3] = &unk_1E5944360;
  v16[4] = *(void *)(a1 + 40);
  id v17 = v8;
  id v13 = *(id *)(a1 + 56);
  id v18 = v11;
  id v19 = v13;
  id v14 = v11;
  id v15 = v8;
  [v12 invokeBlock:v16];
}

void __59__HMHome_Wallet__fetchMissingWalletKeysForUser_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) uuid];
    uint64_t v7 = *(void *)(a1 + 48);
    int v10 = 138543874;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch missing wallet keys for user: %@ with error: %@", (uint8_t *)&v10, 0x20u);
  }
  uint64_t v8 = *(void *)(a1 + 56);
  int v9 = [MEMORY[0x1E4F1CAD0] set];
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
}

HMMissingWalletKey *__59__HMHome_Wallet__fetchMissingWalletKeysForUser_completion___block_invoke_60(uint64_t a1, uint64_t a2)
{
  return +[HMMissingWalletKey missingWalletKeyWithValue:a2 home:*(void *)(a1 + 32)];
}

uint64_t __59__HMHome_Wallet__fetchMissingWalletKeysForUser_completion___block_invoke_2_61(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    int v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched missing wallet keys: %@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchMissingWalletKeysForAccessory:(id)a3 completion:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)MEMORY[0x19F3A64A0]();
  int v9 = self;
  __int16 v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v45 = v11;
    __int16 v46 = 2112;
    id v47 = v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching missing wallet keys for accessory: %@", buf, 0x16u);
  }
  uint64_t v12 = [(HMHome *)v9 context];
  if (v12)
  {
    if [v6 supportsCHIP] && (objc_msgSend(v6, "supportsWalletKey"))
    {
      id v13 = objc_alloc(MEMORY[0x1E4F65488]);
      __int16 v14 = [(HMHome *)v9 uuid];
      uint64_t v15 = (void *)[v13 initWithTarget:v14];

      uint64_t v16 = (void *)MEMORY[0x1E4F654B0];
      uint64_t v42 = @"HMHomeWalletKeyManagerMessageKeyAccessoryUUIDString";
      id v17 = [v6 uuid];
      id v18 = [v17 UUIDString];
      uint64_t v43 = v18;
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      id v20 = [v16 messageWithName:@"HMHomeWalletKeyManagerFetchMissingWalletKeysMessage" destination:v15 payload:v19];

      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __64__HMHome_Wallet__fetchMissingWalletKeysForAccessory_completion___block_invoke_54;
      v35[3] = &unk_1E59441B0;
      id v21 = v12;
      id v36 = v21;
      __int16 v37 = v9;
      id v38 = v6;
      id v39 = v7;
      [v20 setResponseHandler:v35];
      id v22 = [v21 messageDispatcher];
      [v22 sendMessage:v20];
    }
    else
    {
      id v23 = (void *)MEMORY[0x19F3A64A0]();
      id v24 = v9;
      uint64_t v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        __int16 v26 = HMFGetLogIdentifier();
        id v27 = [v6 uuid];
        [v6 supportsCHIP];
        uint64_t v28 = HMFBooleanToString();
        [v6 supportsWalletKey];
        __int16 v29 = HMFBooleanToString();
        *(_DWORD *)buf = 138544130;
        id v45 = v26;
        __int16 v46 = 2112;
        id v47 = v27;
        __int16 v48 = 2112;
        id v49 = v28;
        __int16 v50 = 2112;
        long long v51 = v29;
        _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_INFO, "%{public}@Not fetching missing wallet keys for accessory accessory: %@, supportsCHIP: %@, supportsWalletKey: %@", buf, 0x2Au);
      }
      uint64_t v15 = [MEMORY[0x1E4F1CAD0] set];
      (*((void (**)(id, void *))v7 + 2))(v7, v15);
    }
  }
  else
  {
    id v30 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v31 = v9;
    id v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      id v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v45 = v33;
      _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch missing wallet keys for accessory, context not specified, returning empty list", buf, 0xCu);
    }
    id v34 = [0 delegateCaller];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __64__HMHome_Wallet__fetchMissingWalletKeysForAccessory_completion___block_invoke;
    v40[3] = &unk_1E59454C0;
    id v41 = v7;
    [v34 invokeBlock:v40];

    uint64_t v15 = v41;
  }
}

void __64__HMHome_Wallet__fetchMissingWalletKeysForAccessory_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1CAD0] set];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __64__HMHome_Wallet__fetchMissingWalletKeysForAccessory_completion___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  int v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMHomeWalletKeyManagerMessageKeyMissingWalletKeys", v7);

  if (!v8)
  {
    int v9 = [*(id *)(a1 + 32) delegateCaller];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __64__HMHome_Wallet__fetchMissingWalletKeysForAccessory_completion___block_invoke_2;
    v21[3] = &unk_1E5944360;
    __int16 v10 = *(void **)(a1 + 48);
    v21[4] = *(void *)(a1 + 40);
    id v22 = v10;
    id v23 = v5;
    id v24 = *(id *)(a1 + 56);
    [v9 invokeBlock:v21];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64__HMHome_Wallet__fetchMissingWalletKeysForAccessory_completion___block_invoke_56;
  v20[3] = &unk_1E593EB78;
  void v20[4] = *(void *)(a1 + 40);
  uint64_t v11 = objc_msgSend(v8, "na_map:", v20);
  uint64_t v12 = [*(id *)(a1 + 32) delegateCaller];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__HMHome_Wallet__fetchMissingWalletKeysForAccessory_completion___block_invoke_2_59;
  v16[3] = &unk_1E5944360;
  v16[4] = *(void *)(a1 + 40);
  id v17 = v8;
  id v13 = *(id *)(a1 + 56);
  id v18 = v11;
  id v19 = v13;
  id v14 = v11;
  id v15 = v8;
  [v12 invokeBlock:v16];
}

void __64__HMHome_Wallet__fetchMissingWalletKeysForAccessory_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) uuid];
    uint64_t v7 = *(void *)(a1 + 48);
    int v10 = 138543874;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch missing wallet keys for accessory: %@ with error: %@", (uint8_t *)&v10, 0x20u);
  }
  uint64_t v8 = *(void *)(a1 + 56);
  int v9 = [MEMORY[0x1E4F1CAD0] set];
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
}

HMMissingWalletKey *__64__HMHome_Wallet__fetchMissingWalletKeysForAccessory_completion___block_invoke_56(uint64_t a1, uint64_t a2)
{
  return +[HMMissingWalletKey missingWalletKeyWithValue:a2 home:*(void *)(a1 + 32)];
}

uint64_t __64__HMHome_Wallet__fetchMissingWalletKeysForAccessory_completion___block_invoke_2_59(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    int v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched missing wallet keys: %@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchWalletKeyDeviceStateForPairedWatchesWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v24 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching wallet key device state for paired watches", buf, 0xCu);
  }
  int v9 = [(HMHome *)v6 context];
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v11 = [(HMHome *)v6 uuid];
    uint64_t v12 = (void *)[v10 initWithTarget:v11];

    id v13 = [MEMORY[0x1E4F654B0] messageWithName:@"HMHomeWalletKeyManagerFetchDeviceStateForPairedWatchesMessage" destination:v12 payload:0];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __74__HMHome_Wallet__fetchWalletKeyDeviceStateForPairedWatchesWithCompletion___block_invoke;
    v20[3] = &unk_1E5945510;
    void v20[4] = v6;
    id v14 = v9;
    id v21 = v14;
    id v22 = v4;
    [v13 setResponseHandler:v20];
    uint64_t v15 = [v14 messageDispatcher];
    [v15 sendMessage:v13];

LABEL_9:
    goto LABEL_10;
  }
  uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
  id v17 = v6;
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    id v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v24 = v19;
    __int16 v25 = 2080;
    __int16 v26 = "-[HMHome(Wallet) fetchWalletKeyDeviceStateForPairedWatchesWithCompletion:]";
    _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v12);
    goto LABEL_9;
  }
LABEL_10:
}

void __74__HMHome_Wallet__fetchWalletKeyDeviceStateForPairedWatchesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  void v22[2] = objc_opt_class();
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  int v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMHomeWalletKeyManagerMessageKeyDeviceStateForPairedWatches", v7);

  int v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = HMFGetOSLogHandle();
  uint64_t v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v18 = 138543618;
      id v19 = v13;
      __int16 v20 = 2112;
      id v21 = v8;
      id v14 = "%{public}@Successfully fetched wallet key device state: %@";
      uint64_t v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v15, v16, v14, (uint8_t *)&v18, 0x16u);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v13 = HMFGetLogIdentifier();
    int v18 = 138543618;
    id v19 = v13;
    __int16 v20 = 2112;
    id v21 = 0;
    id v14 = "%{public}@Failed to fetch wallet key device state: %@";
    uint64_t v15 = v12;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  id v17 = [*(id *)(a1 + 40) delegateCaller];
  [v17 callCompletion:*(void *)(a1 + 48) obj:v8 error:v5];
}

- (void)fetchIsWalletKeySupportedOnAnyPairedWatchWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v20 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching is wallet key supported for paired watches...", buf, 0xCu);
  }
  int v9 = [(HMHome *)v6 context];
  id v10 = v9;
  if (v9)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __74__HMHome_Wallet__fetchIsWalletKeySupportedOnAnyPairedWatchWithCompletion___block_invoke;
    v16[3] = &unk_1E593EB50;
    id v17 = v9;
    id v18 = v4;
    [(HMHome *)v6 fetchWalletKeyDeviceStateForPairedWatchesWithCompletion:v16];

    uint64_t v11 = v17;
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
  id v13 = v6;
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v20 = v15;
    __int16 v21 = 2080;
    id v22 = "-[HMHome(Wallet) fetchIsWalletKeySupportedOnAnyPairedWatchWithCompletion:]";
    _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v4)
  {
    uint64_t v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v11);
    goto LABEL_9;
  }
LABEL_10:
}

void __74__HMHome_Wallet__fetchIsWalletKeySupportedOnAnyPairedWatchWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = objc_msgSend(v7, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        char v12 = [v11 canAddWalletKey];

        if (v12)
        {
          uint64_t v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v13 = [*(id *)(a1 + 32) delegateCaller];
  [v13 callCompletion:*(void *)(a1 + 40) value:v8 error:v6];
}

- (void)fetchIsWalletKeySupportedWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v20 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching is wallet key supported...", buf, 0xCu);
  }
  uint64_t v9 = [(HMHome *)v6 context];
  id v10 = v9;
  if (v9)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__HMHome_Wallet__fetchIsWalletKeySupportedWithCompletion___block_invoke;
    v16[3] = &unk_1E593EB28;
    id v17 = v9;
    id v18 = v4;
    [(HMHome *)v6 fetchWalletKeyDeviceStateWithCompletion:v16];

    uint64_t v11 = v17;
LABEL_9:

    goto LABEL_10;
  }
  char v12 = (void *)MEMORY[0x19F3A64A0]();
  id v13 = v6;
  long long v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    long long v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v20 = v15;
    __int16 v21 = 2080;
    id v22 = "-[HMHome(Wallet) fetchIsWalletKeySupportedWithCompletion:]";
    _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v4)
  {
    uint64_t v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v11);
    goto LABEL_9;
  }
LABEL_10:
}

void __58__HMHome_Wallet__fetchIsWalletKeySupportedWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v10 = [v5 delegateCaller];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = [v7 canAddWalletKey];

  [v10 callCompletion:v8 value:v9 error:v6];
}

- (void)fetchExistingWalletKeyUUIDWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v20 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching wallet key uuid...", buf, 0xCu);
  }
  uint64_t v9 = [(HMHome *)v6 context];
  id v10 = v9;
  if (v9)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59__HMHome_Wallet__fetchExistingWalletKeyUUIDWithCompletion___block_invoke;
    v16[3] = &unk_1E593EB28;
    id v17 = v9;
    id v18 = v4;
    [(HMHome *)v6 fetchWalletKeyDeviceStateWithCompletion:v16];

    uint64_t v11 = v17;
LABEL_9:

    goto LABEL_10;
  }
  char v12 = (void *)MEMORY[0x19F3A64A0]();
  id v13 = v6;
  long long v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    long long v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v20 = v15;
    __int16 v21 = 2080;
    id v22 = "-[HMHome(Wallet) fetchExistingWalletKeyUUIDWithCompletion:]";
    _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v4)
  {
    uint64_t v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v11);
    goto LABEL_9;
  }
LABEL_10:
}

void __59__HMHome_Wallet__fetchExistingWalletKeyUUIDWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v11 = [v5 delegateCaller];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = [v7 walletKey];

  id v10 = [v9 UUID];
  [v11 callCompletion:v8 obj:v10 error:v6];
}

- (void)fetchWalletKeyColorWithCompletion:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v20 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(Wallet) fetchWalletKeyColorWithCompletion:]", @"completion"];
    __int16 v21 = (void *)MEMORY[0x19F3A64A0]();
    id v22 = self;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v29 = v24;
      __int16 v30 = 2112;
      uint64_t v31 = (__CFString *)v20;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0];
    objc_exception_throw(v25);
  }
  id v5 = (void (**)(void, void))v4;
  id v6 = (void *)MEMORY[0x19F3A64A0]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v29 = v9;
    _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Fetching wallet key color...", buf, 0xCu);
  }
  id v10 = [(HMHome *)v7 context];
  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F65488]);
    char v12 = [(HMHome *)v7 uuid];
    id v13 = (void *)[v11 initWithTarget:v12];

    long long v14 = [MEMORY[0x1E4F654B0] messageWithName:@"HMHomeFetchWalletKeyColorMessage" destination:v13 payload:0];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __52__HMHome_Wallet__fetchWalletKeyColorWithCompletion___block_invoke;
    v26[3] = &unk_1E5944EF0;
    v26[4] = v7;
    uint64_t v27 = v5;
    [v14 setResponseHandler:v26];
    long long v15 = [v10 messageDispatcher];
    [v15 sendMessage:v14];
  }
  else
  {
    long long v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = v7;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v29 = v19;
      __int16 v30 = 2112;
      uint64_t v31 = @"SatinNickel";
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch wallet key color, context not specified, returning default color %@", buf, 0x16u);
    }
    v5[2](v5, 14341582);
  }
}

void __52__HMHome_Wallet__fetchWalletKeyColorWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_msgSend(v6, "hmf_numberForKey:", @"HMHomeFetchWalletKeyColorMessageKeyColor");
  uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      char v12 = HMFGetLogIdentifier();
      int v14 = 138543618;
      long long v15 = v12;
      __int16 v16 = 2112;
      id v17 = @"SatinNickel";
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched wallet key color: %@", (uint8_t *)&v14, 0x16u);
    }
    [v7 intValue];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = 138543874;
      long long v15 = v13;
      __int16 v16 = 2112;
      id v17 = @"SatinNickel";
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch wallet key color, returning default color %@:%@", (uint8_t *)&v14, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchWalleKeyExpressEnablementConflictingPassDescription:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching description of the conflicting pass...", buf, 0xCu);
  }
  id v9 = [(HMHome *)v6 context];
  id v10 = v9;
  if (v9)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __75__HMHome_Wallet__fetchWalleKeyExpressEnablementConflictingPassDescription___block_invoke;
    v16[3] = &unk_1E593EB28;
    id v17 = v9;
    id v18 = v4;
    [(HMHome *)v6 fetchWalletKeyDeviceStateWithCompletion:v16];

    id v11 = v17;
LABEL_9:

    goto LABEL_10;
  }
  char v12 = (void *)MEMORY[0x19F3A64A0]();
  id v13 = v6;
  int v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    long long v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v15;
    __int16 v21 = 2080;
    id v22 = "-[HMHome(Wallet) fetchWalleKeyExpressEnablementConflictingPassDescription:]";
    _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v4)
  {
    id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v11);
    goto LABEL_9;
  }
LABEL_10:
}

void __75__HMHome_Wallet__fetchWalleKeyExpressEnablementConflictingPassDescription___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v10 = [v5 delegateCaller];
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [v7 expressEnablementConflictingPassDescription];

  [v10 callCompletion:v8 obj:v9 error:v6];
}

- (void)fetchIsExpressEnabledForWalletKeyWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching express enabled for wallet key", buf, 0xCu);
  }
  id v9 = [(HMHome *)v6 context];
  id v10 = v9;
  if (v9)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __66__HMHome_Wallet__fetchIsExpressEnabledForWalletKeyWithCompletion___block_invoke;
    v16[3] = &unk_1E593EB28;
    id v17 = v9;
    id v18 = v4;
    [(HMHome *)v6 fetchWalletKeyDeviceStateWithCompletion:v16];

    id v11 = v17;
LABEL_9:

    goto LABEL_10;
  }
  char v12 = (void *)MEMORY[0x19F3A64A0]();
  id v13 = v6;
  int v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    long long v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v15;
    __int16 v21 = 2080;
    id v22 = "-[HMHome(Wallet) fetchIsExpressEnabledForWalletKeyWithCompletion:]";
    _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v4)
  {
    id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v11);
    goto LABEL_9;
  }
LABEL_10:
}

void __66__HMHome_Wallet__fetchIsExpressEnabledForWalletKeyWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v10 = [v5 delegateCaller];
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [v7 walletKey];

  objc_msgSend(v10, "callCompletion:value:error:", v8, objc_msgSend(v9, "isExpressEnabled"), v6);
}

- (void)fetchWalletKeyEncodedPKPassWithIgnoredErrorCodes:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v25 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(Wallet) fetchWalletKeyEncodedPKPassWithIgnoredErrorCodes:completion:]", @"completion"];
    __int16 v26 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v27 = self;
    uint64_t v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      __int16 v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v37 = v29;
      __int16 v38 = 2112;
      uint64_t v39 = v25;
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v30 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v25 userInfo:0];
    objc_exception_throw(v30);
  }
  uint64_t v8 = (void (**)(void, void, void))v7;
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    char v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v37 = v12;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Fetching encoded PKPass for available wallet key...", buf, 0xCu);
  }
  id v13 = [(HMHome *)v10 context];
  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F65488]);
    long long v15 = [(HMHome *)v10 uuid];
    __int16 v16 = (void *)[v14 initWithTarget:v15];

    id v34 = @"HMHomeWalletKeyManagerMessageKeyIgnoredErrorCodes";
    id v35 = v6;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    id v18 = [MEMORY[0x1E4F654B0] messageWithName:@"HMHomeFetchAvailableWalletKeyEncodedPKPassMessage" destination:v16 payload:v17];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __78__HMHome_Wallet__fetchWalletKeyEncodedPKPassWithIgnoredErrorCodes_completion___block_invoke;
    v31[3] = &unk_1E5945510;
    void v31[4] = v10;
    id v19 = v13;
    id v32 = v19;
    id v33 = v8;
    [v18 setResponseHandler:v31];
    uint64_t v20 = [v19 messageDispatcher];
    [v20 sendMessage:v18];
  }
  else
  {
    __int16 v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
    __int16 v21 = (void *)MEMORY[0x19F3A64A0]();
    id v22 = v10;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v37 = v24;
      __int16 v38 = 2112;
      uint64_t v39 = (uint64_t)v16;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch encoded PK Pass: %@", buf, 0x16u);
    }
    ((void (**)(void, void, void *))v8)[2](v8, 0, v16);
  }
}

void __78__HMHome_Wallet__fetchWalletKeyEncodedPKPassWithIgnoredErrorCodes_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_msgSend(v6, "hmf_fileHandleForKey:", @"HMHomeFetchAvailableWalletKeyEncodedPKPassMessageKeyFileHandle");
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = [v7 availableData];
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = *(id *)(a1 + 32);
    char v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v16 = 138543362;
      id v17 = v13;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched encoded PK Pass", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = *(id *)(a1 + 32);
    char v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v16 = 138543618;
      id v17 = v14;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch encoded PK pass: %@", (uint8_t *)&v16, 0x16u);
    }
    id v9 = 0;
  }

  long long v15 = [*(id *)(a1 + 40) delegateCaller];
  [v15 callCompletion:*(void *)(a1 + 48) obj:v9 error:v5];
}

- (void)fetchAvailableWalletKeyEncodedPKPass:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = [v4 set];
  [(HMHome *)self fetchWalletKeyEncodedPKPassWithIgnoredErrorCodes:v6 completion:v5];
}

- (void)fetchWalletKeyEncodedPKPass:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = [v4 setWithArray:&unk_1EEF08CC0];
  [(HMHome *)self fetchWalletKeyEncodedPKPassWithIgnoredErrorCodes:v6 completion:v5];
}

- (void)fetchWalletKeyCustomURLWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching wallet key custom URL...", buf, 0xCu);
  }
  id v9 = [(HMHome *)v6 context];
  id v10 = v9;
  if (v9)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __56__HMHome_Wallet__fetchWalletKeyCustomURLWithCompletion___block_invoke;
    v16[3] = &unk_1E593EB28;
    id v17 = v9;
    id v18 = v4;
    [(HMHome *)v6 fetchWalletKeyDeviceStateWithCompletion:v16];

    id v11 = v17;
LABEL_9:

    goto LABEL_10;
  }
  char v12 = (void *)MEMORY[0x19F3A64A0]();
  id v13 = v6;
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    long long v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v15;
    __int16 v21 = 2080;
    id v22 = "-[HMHome(Wallet) fetchWalletKeyCustomURLWithCompletion:]";
    _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v4)
  {
    id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v11);
    goto LABEL_9;
  }
LABEL_10:
}

void __56__HMHome_Wallet__fetchWalletKeyCustomURLWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v11 = [v5 delegateCaller];
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [v7 walletKey];

  id v10 = [v9 customURL];
  [v11 callCompletion:v8 obj:v10 error:v6];
}

- (void)setExpressSettingsAuthData:(id)a3 enableUWB:(BOOL)a4 enableNFCExpress:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  char v12 = [(HMHome *)self context];
  id v13 = (void *)MEMORY[0x19F3A64A0]();
  id v14 = self;
  long long v15 = HMFGetOSLogHandle();
  int v16 = v15;
  if (v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v31 = v11;
      v18 = id v17 = v10;
      HMFBooleanToString();
      id v19 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      __int16 v38 = v18;
      __int16 v39 = 2112;
      uint64_t v40 = v19;
      __int16 v41 = 2112;
      uint64_t v42 = v20;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Setting express settings. enableUWB: %@, enableNFCExpress: %@", buf, 0x20u);

      id v10 = v17;
      id v11 = v31;
    }

    v36[0] = v10;
    v35[0] = @"HMHomeMessageKeyAuthData";
    v35[1] = @"HMHomeMessageKeyEnableUWB";
    __int16 v21 = [NSNumber numberWithBool:v8];
    v36[1] = v21;
    v35[2] = @"HMHomeMessageKeyEnableNFCExpress";
    id v22 = [NSNumber numberWithBool:v7];
    v36[2] = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];

    id v24 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v25 = [(HMHome *)v14 uuid];
    __int16 v26 = (void *)[v24 initWithTarget:v25];

    uint64_t v27 = [MEMORY[0x1E4F654B0] messageWithName:@"HMHomeSetHomeKeyExpressSettingsMessage" destination:v26 payload:v23];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __83__HMHome_Wallet__setExpressSettingsAuthData_enableUWB_enableNFCExpress_completion___block_invoke;
    v32[3] = &unk_1E5945510;
    v32[4] = v14;
    id v28 = v12;
    id v33 = v28;
    id v34 = v11;
    [v27 setResponseHandler:v32];
    __int16 v29 = [v28 messageDispatcher];
    [v29 sendMessage:v27];
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v38 = v30;
      __int16 v39 = 2080;
      uint64_t v40 = "-[HMHome(Wallet) setExpressSettingsAuthData:enableUWB:enableNFCExpress:completion:]";
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __83__HMHome_Wallet__setExpressSettingsAuthData_enableUWB_enableNFCExpress_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v17 = 138543362;
      id v18 = v11;
      char v12 = "%{public}@Successfully set express settings for wallet key";
      id v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_INFO;
      uint32_t v15 = 12;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v13, v14, v12, (uint8_t *)&v17, v15);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v11 = HMFGetLogIdentifier();
    int v17 = 138543618;
    id v18 = v11;
    __int16 v19 = 2112;
    id v20 = v5;
    char v12 = "%{public}@Failed to set express settings for wallet key %@";
    id v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    uint32_t v15 = 22;
    goto LABEL_6;
  }

  int v16 = [*(id *)(a1 + 40) delegateCaller];
  [v16 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)enableUWBUnlockWithAuthData:(id)a3 completion:(id)a4
{
}

- (void)enableExpressForWalletKeyWithAuthData:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMHome *)self context];
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  char v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v28 = v13;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Enabling express for wallet key", buf, 0xCu);
    }
    uint64_t v25 = @"HMHomeMessageKeyAuthData";
    id v26 = v6;
    os_log_type_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v15 = objc_alloc(MEMORY[0x1E4F65488]);
    int v16 = [(HMHome *)v10 uuid];
    int v17 = (void *)[v15 initWithTarget:v16];

    id v18 = [MEMORY[0x1E4F654B0] messageWithName:@"HMHomeEnableExpressForWalletKeyMessage" destination:v17 payload:v14];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __67__HMHome_Wallet__enableExpressForWalletKeyWithAuthData_completion___block_invoke;
    v22[3] = &unk_1E5945510;
    void v22[4] = v10;
    id v19 = v8;
    id v23 = v19;
    id v24 = v7;
    [v18 setResponseHandler:v22];
    id v20 = [v19 messageDispatcher];
    [v20 sendMessage:v18];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v28 = v21;
      __int16 v29 = 2080;
      id v30 = "-[HMHome(Wallet) enableExpressForWalletKeyWithAuthData:completion:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __67__HMHome_Wallet__enableExpressForWalletKeyWithAuthData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v17 = 138543362;
      id v18 = v11;
      char v12 = "%{public}@Successfully enabled express for wallet key";
      id v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_INFO;
      uint32_t v15 = 12;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v13, v14, v12, (uint8_t *)&v17, v15);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v11 = HMFGetLogIdentifier();
    int v17 = 138543618;
    id v18 = v11;
    __int16 v19 = 2112;
    id v20 = v5;
    char v12 = "%{public}@Failed to enable express for wallet key %@";
    id v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    uint32_t v15 = 22;
    goto LABEL_6;
  }

  int v16 = [*(id *)(a1 + 40) delegateCaller];
  [v16 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)addWalletKeyToPairedWatchesWithOptions:(int64_t)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HMHome *)self context];
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      char v12 = HMFGetLogIdentifier();
      HMHomeAddWalletKeyOptionsDescription(a3);
      id v13 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      __int16 v29 = v12;
      __int16 v30 = 2112;
      uint64_t v31 = v13;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Adding wallet key to paired watches with options: %@", buf, 0x16u);
    }
    id v14 = objc_alloc(MEMORY[0x1E4F65488]);
    uint32_t v15 = [(HMHome *)v9 uuid];
    int v16 = (void *)[v14 initWithTarget:v15];

    id v26 = @"HMHomeAddWalletKeyMessageKeyOptions";
    int v17 = [NSNumber numberWithInteger:a3];
    uint64_t v27 = v17;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];

    __int16 v19 = [MEMORY[0x1E4F654B0] messageWithName:@"HMHomeAddWalletKeyToPairedWatchesMessage" destination:v16 payload:v18];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __68__HMHome_Wallet__addWalletKeyToPairedWatchesWithOptions_completion___block_invoke;
    void v23[3] = &unk_1E5945510;
    v23[4] = v9;
    id v20 = v7;
    id v24 = v20;
    id v25 = v6;
    [v19 setResponseHandler:v23];
    uint64_t v21 = [v20 messageDispatcher];
    [v21 sendMessage:v19];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v29 = v22;
      __int16 v30 = 2080;
      uint64_t v31 = "-[HMHome(Wallet) addWalletKeyToPairedWatchesWithOptions:completion:]";
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __68__HMHome_Wallet__addWalletKeyToPairedWatchesWithOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v14 = 138543362;
      uint32_t v15 = v11;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully added wallet key to paired watches", (uint8_t *)&v14, 0xCu);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v11 = HMFGetLogIdentifier();
    char v12 = +[HMHome errorByDeviceWithOverallError:v5];
    int v14 = 138543874;
    uint32_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 2112;
    __int16 v19 = v12;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to add wallet key to paired watches overall error %@, error by device: %@", (uint8_t *)&v14, 0x20u);

    goto LABEL_6;
  }

  id v13 = [*(id *)(a1 + 40) delegateCaller];
  [v13 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)fetchHasWalletKeyWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching has wallet key...", buf, 0xCu);
  }
  id v9 = [(HMHome *)v6 context];
  id v10 = v9;
  if (v9)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__HMHome_Wallet__fetchHasWalletKeyWithCompletion___block_invoke;
    v16[3] = &unk_1E593EB00;
    id v17 = v9;
    id v18 = v4;
    [(HMHome *)v6 fetchExistingWalletKeyUUIDWithCompletion:v16];

    id v11 = v17;
LABEL_9:

    goto LABEL_10;
  }
  char v12 = (void *)MEMORY[0x19F3A64A0]();
  id v13 = v6;
  int v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint32_t v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v15;
    __int16 v21 = 2080;
    id v22 = "-[HMHome(Wallet) fetchHasWalletKeyWithCompletion:]";
    _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v4)
  {
    id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v11);
    goto LABEL_9;
  }
LABEL_10:
}

void __50__HMHome_Wallet__fetchHasWalletKeyWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 delegateCaller];
  [v7 callCompletion:*(void *)(a1 + 40) value:a2 != 0 error:v6];
}

- (void)addWalletKeyWithOptions:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HMHome *)self context];
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      char v12 = HMFGetLogIdentifier();
      HMHomeAddWalletKeyOptionsDescription(a3);
      id v13 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      __int16 v29 = v12;
      __int16 v30 = 2112;
      uint64_t v31 = v13;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Adding wallet key with options: %@", buf, 0x16u);
    }
    id v14 = objc_alloc(MEMORY[0x1E4F65488]);
    uint32_t v15 = [(HMHome *)v9 uuid];
    __int16 v16 = (void *)[v14 initWithTarget:v15];

    id v26 = @"HMHomeAddWalletKeyMessageKeyOptions";
    id v17 = [NSNumber numberWithInteger:a3];
    uint64_t v27 = v17;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];

    __int16 v19 = [MEMORY[0x1E4F654B0] messageWithName:@"HMHomeAddWalletKeyMessage" destination:v16 payload:v18];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __60__HMHome_Wallet__addWalletKeyWithOptions_completionHandler___block_invoke;
    void v23[3] = &unk_1E5945510;
    v23[4] = v9;
    id v20 = v7;
    id v24 = v20;
    id v25 = v6;
    [v19 setResponseHandler:v23];
    __int16 v21 = [v20 messageDispatcher];
    [v21 sendMessage:v19];

    goto LABEL_9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v29 = v22;
    __int16 v30 = 2080;
    uint64_t v31 = "-[HMHome(Wallet) addWalletKeyWithOptions:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v6)
  {
    __int16 v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v16);
LABEL_9:
  }
}

void __60__HMHome_Wallet__addWalletKeyWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_msgSend(v6, "hmf_UUIDForKey:", @"HMHomeWalletKeyManagerMessageKeyWalletKeyUUID");
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      char v12 = HMFGetLogIdentifier();
      int v17 = 138543618;
      id v18 = v12;
      __int16 v19 = 2112;
      id v20 = v7;
      id v13 = "%{public}@Successfully added wallet key: %@";
      id v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v14, v15, v13, (uint8_t *)&v17, 0x16u);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    char v12 = HMFGetLogIdentifier();
    int v17 = 138543618;
    id v18 = v12;
    __int16 v19 = 2112;
    id v20 = v5;
    id v13 = "%{public}@Failed to add wallet key: %@";
    id v14 = v11;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  __int16 v16 = [*(id *)(a1 + 40) delegateCaller];
  [v16 callCompletion:*(void *)(a1 + 48) obj:v7 error:v5];
}

- (void)addWalletKeyWithOptions:(int64_t)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HMHome *)self context];
  id v8 = v7;
  if (v7)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__HMHome_Wallet__addWalletKeyWithOptions_completion___block_invoke;
    v14[3] = &unk_1E593EB00;
    id v15 = v7;
    id v16 = v6;
    [(HMHome *)self addWalletKeyWithOptions:a3 completionHandler:v14];

    id v9 = v15;
LABEL_7:

    goto LABEL_8;
  }
  id v10 = (void *)MEMORY[0x19F3A64A0]();
  id v11 = self;
  char v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v18 = v13;
    __int16 v19 = 2080;
    id v20 = "-[HMHome(Wallet) addWalletKeyWithOptions:completion:]";
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v6)
  {
    id v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v9);
    goto LABEL_7;
  }
LABEL_8:
}

void __53__HMHome_Wallet__addWalletKeyWithOptions_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [v4 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 40) error:v5];
}

- (void)setHasOnboardedForWalletKeyWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMHome *)self context];
  id v6 = (void *)MEMORY[0x19F3A64A0]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = (const char *)v7;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Client requested to onboard home for wallet key: %@", buf, 0x16u);
    }
    id v11 = objc_alloc(MEMORY[0x1E4F65488]);
    char v12 = [(HMHome *)v7 uuid];
    id v13 = (void *)[v11 initWithTarget:v12];

    id v14 = [MEMORY[0x1E4F654B0] messageWithName:@"HMHomeSetHasOnboardedForWalletKeyMessage" destination:v13 payload:0];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    __int16 v19 = __60__HMHome_Wallet__setHasOnboardedForWalletKeyWithCompletion___block_invoke;
    id v20 = &unk_1E5944EF0;
    uint64_t v21 = v7;
    id v22 = v4;
    [v14 setResponseHandler:&v17];
    id v15 = objc_msgSend(v5, "messageDispatcher", v17, v18, v19, v20, v21);
    [v15 sendMessage:v14];

    goto LABEL_9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v24 = v16;
    __int16 v25 = 2080;
    id v26 = "-[HMHome(Wallet) setHasOnboardedForWalletKeyWithCompletion:]";
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v4)
  {
    id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v13);
LABEL_9:
  }
}

void __60__HMHome_Wallet__setHasOnboardedForWalletKeyWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 32);
      int v22 = 138543874;
      uint64_t v23 = v10;
      __int16 v24 = 2112;
      uint64_t v25 = v11;
      __int16 v26 = 2112;
      id v27 = v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to onboard home for wallet key %@:%@", (uint8_t *)&v22, 0x20u);
    }
    char v12 = [*(id *)(a1 + 32) context];
    id v13 = [v12 delegateCaller];
    id v14 = v13;
    uint64_t v15 = *(void *)(a1 + 40);
    id v16 = v5;
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]([*(id *)(a1 + 32) setHasOnboardedForWalletKey:1]);
    id v18 = *(id *)(a1 + 32);
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      uint64_t v21 = *(void *)(a1 + 32);
      int v22 = 138543618;
      uint64_t v23 = v20;
      __int16 v24 = 2112;
      uint64_t v25 = v21;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@Successfully onboarded home for wallet key: %@", (uint8_t *)&v22, 0x16u);
    }
    char v12 = [*(id *)(a1 + 32) context];
    id v13 = [v12 delegateCaller];
    id v14 = v13;
    uint64_t v15 = *(void *)(a1 + 40);
    id v16 = 0;
  }
  [v13 callCompletion:v15 error:v16];
}

- (NSString)walletKeyPassSerialNumber
{
  id v3 = [(HMHome *)self uuid];
  id v4 = [(HMHome *)self currentUser];
  id v5 = [v4 uuid];
  id v6 = +[HMHome passSerialNumberWithHomeUUID:v3 userUUID:v5];

  return (NSString *)v6;
}

+ (id)errorByDeviceWithOverallError:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 userInfo];
  id v5 = objc_msgSend(v4, "hmf_dataForKey:", @"HMHomeWalletKeyErrorUserInfoKeyErrorByDevice");

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
    id v8 = [v6 setWithArray:v7];

    id v20 = 0;
    id v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v8 fromData:v5 error:&v20];
    id v10 = (__CFString *)v20;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v16 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v23 = v18;
        __int16 v24 = 2112;
        uint64_t v25 = v5;
        __int16 v26 = 2112;
        id v27 = v10;
        _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode error by device %@:%@", buf, 0x20u);
      }
    }
  }
  else
  {
    char v12 = (void *)MEMORY[0x19F3A64A0]();
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      uint64_t v15 = [v3 userInfo];
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      uint64_t v25 = v15;
      __int16 v26 = 2112;
      id v27 = @"HMHomeWalletKeyErrorUserInfoKeyErrorByDevice";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Missing error by device key in error userInfo %@:%@", buf, 0x20u);
    }
    id v9 = 0;
  }

  return v9;
}

- (void)unjoinThreadNetworkWithCompletion:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMHome *)self context];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v7 = objc_alloc(MEMORY[0x1E4F65488]);
    id v8 = [(HMHome *)self uuid];
    id v9 = (void *)[v7 initWithTarget:v8];
    id v10 = (void *)[v6 initWithName:@"HMH.unjoftn" destination:v9 payload:0];

    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __73__HMHome_ThreadResidentCommissioning__unjoinThreadNetworkWithCompletion___block_invoke;
    __int16 v24 = &unk_1E5944EF0;
    id v11 = v5;
    id v25 = v11;
    id v26 = v4;
    char v12 = (void *)MEMORY[0x19F3A64A0]([v10 setResponseHandler:&v21]);
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v15;
      __int16 v29 = 2112;
      __int16 v30 = (const char *)v10;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Request to unjoin thread network using message %@", buf, 0x16u);
    }
    id v16 = objc_msgSend(v11, "messageDispatcher", v21, v22, v23, v24);
    [v16 sendMessage:v10];
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v20;
      __int16 v29 = 2080;
      __int16 v30 = "-[HMHome(ThreadResidentCommissioning) unjoinThreadNetworkWithCompletion:]";
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __73__HMHome_ThreadResidentCommissioning__unjoinThreadNetworkWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegateCaller];
  [v5 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (void)joinThreadNetwork:(id)a3 withCompletion:(id)a4
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  id v7 = a4;
  id v8 = [(HMHome *)self context];
  if (v8)
  {
    __int16 v37 = @"HMHM.threadNetworkID";
    v38[0] = v6;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    id v10 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v11 = objc_alloc(MEMORY[0x1E4F65488]);
    char v12 = [(HMHome *)self uuid];
    id v13 = (void *)[v11 initWithTarget:v12];
    id v14 = (void *)[v10 initWithName:@"HMH.joftn" destination:v13 payload:v9];

    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    id v27 = __72__HMHome_ThreadResidentCommissioning__joinThreadNetwork_withCompletion___block_invoke;
    uint64_t v28 = &unk_1E5944EF0;
    id v15 = v8;
    id v29 = v15;
    id v30 = v7;
    id v16 = (void *)MEMORY[0x19F3A64A0]([v14 setResponseHandler:&v25]);
    uint64_t v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v32 = v19;
      __int16 v33 = 2112;
      id v34 = v6;
      __int16 v35 = 2112;
      id v36 = v14;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Request to join thread network with UUID %@ using message %@", buf, 0x20u);
    }
    id v20 = objc_msgSend(v15, "messageDispatcher", v25, v26, v27, v28);
    [v20 sendMessage:v14];
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v22 = self;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v24;
      __int16 v33 = 2080;
      id v34 = "-[HMHome(ThreadResidentCommissioning) joinThreadNetwork:withCompletion:]";
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __72__HMHome_ThreadResidentCommissioning__joinThreadNetwork_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegateCaller];
  [v5 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (void)joinThreadNetworkWithCompletion:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMHome *)self context];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v7 = objc_alloc(MEMORY[0x1E4F65488]);
    id v8 = [(HMHome *)self uuid];
    id v9 = (void *)[v7 initWithTarget:v8];
    id v10 = (void *)[v6 initWithName:@"HMH.joftn" destination:v9 payload:0];

    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __71__HMHome_ThreadResidentCommissioning__joinThreadNetworkWithCompletion___block_invoke;
    __int16 v24 = &unk_1E5944EF0;
    id v11 = v5;
    id v25 = v11;
    id v26 = v4;
    char v12 = (void *)MEMORY[0x19F3A64A0]([v10 setResponseHandler:&v21]);
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v15;
      __int16 v29 = 2112;
      id v30 = (const char *)v10;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Request to join thread network using message %@", buf, 0x16u);
    }
    id v16 = objc_msgSend(v11, "messageDispatcher", v21, v22, v23, v24);
    [v16 sendMessage:v10];
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v20;
      __int16 v29 = 2080;
      id v30 = "-[HMHome(ThreadResidentCommissioning) joinThreadNetworkWithCompletion:]";
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __71__HMHome_ThreadResidentCommissioning__joinThreadNetworkWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegateCaller];
  [v5 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessCodeManager, 0);
  objc_storeStrong((id *)&self->_supportedSiriEndPointVersion, 0);
  objc_storeStrong((id *)&self->_hmModernMessagingOptionsByMessageName, 0);
  objc_storeStrong((id *)&self->_hmModernMessagingRequestHandlersByMessageName, 0);
  objc_storeStrong((id *)&self->_matterFabricID, 0);
  objc_storeStrong((id *)&self->_currentAccessories, 0);
  objc_storeStrong((id *)&self->_currentRooms, 0);
  objc_storeStrong((id *)&self->_currentTriggers, 0);
  objc_storeStrong((id *)&self->_currentActionSets, 0);
  objc_storeStrong((id *)&self->_roomForEntireHome, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_currentUsers, 0);
  objc_storeStrong((id *)&self->_mediaSystemStageManager, 0);
  objc_storeStrong((id *)&self->_currentAccessoryProtectionGroups, 0);
  objc_storeStrong((id *)&self->_shareWithHomeOwnerOperationQueue, 0);
  objc_storeStrong((id *)&self->_currentOutgoingInvitations, 0);
  objc_storeStrong((id *)&self->_currentResidentDevices, 0);
  objc_storeStrong((id *)&self->_currentTriggerOwnedActionSets, 0);
  objc_storeStrong((id *)&self->_currentServiceGroups, 0);
  objc_storeStrong((id *)&self->_currentZones, 0);
  objc_storeStrong(&self->_accessoryInfoFetch, 0);
  objc_storeStrong((id *)&self->_autoSelectedPreferredResidents, 0);
  objc_storeStrong((id *)&self->_userSelectedPreferredResident, 0);
  objc_storeStrong((id *)&self->_numberOfCameras, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_softwareUpdateController, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_managedTriggers, 0);
  objc_storeStrong((id *)&self->_threadNetworkID, 0);
  objc_storeStrong((id *)&self->_personSettingsManager, 0);
  objc_storeStrong((id *)&self->_personManagerZoneUUID, 0);
  objc_storeStrong((id *)&self->_personManagerSettings, 0);
  objc_storeStrong((id *)&self->_personManager, 0);
  objc_storeStrong((id *)&self->_supportedFeatures, 0);
  objc_storeStrong((id *)&self->_notificationsUpdatedTime, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_currentUser, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_homeLocation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_mediaPassword, 0);
}

- (void)setIsFeatureHomeTheaterQFAEnabled:(BOOL)a3
{
  self->_isFeatureHomeTheaterQFAEnabled = a3;
}

- (BOOL)isFeatureHomeTheaterQFAEnabled
{
  return self->_isFeatureHomeTheaterQFAEnabled;
}

- (void)setAccessCodeManager:(id)a3
{
}

- (HMAccessCodeManager)accessCodeManager
{
  return self->_accessCodeManager;
}

- (void)setSupportedSiriEndPointVersion:(id)a3
{
}

- (HMFVersion)supportedSiriEndPointVersion
{
  return (HMFVersion *)objc_getProperty(self, a2, 472, 1);
}

- (void)setHmModernMessagingOptionsByMessageName:(id)a3
{
}

- (void)setHmModernMessagingRequestHandlersByMessageName:(id)a3
{
}

- (NSMutableDictionary)hmModernMessagingRequestHandlersByMessageName
{
  return self->_hmModernMessagingRequestHandlersByMessageName;
}

- (NSNumber)matterFabricID
{
  return self->_matterFabricID;
}

- (HMRoom)roomForEntireHome
{
  return self->_roomForEntireHome;
}

- (void)setCurrentUsers:(id)a3
{
}

- (void)setDidOnboardLocationServices:(BOOL)a3
{
  self->_didOnboardLocationServices = a3;
}

- (BOOL)didOnboardLocationServices
{
  return self->_didOnboardLocationServices;
}

- (void)setLocationServicesEnabled:(BOOL)a3
{
  self->_locationServicesEnabled = a3;
}

- (void)setCurrentAccessoryProtectionGroups:(id)a3
{
}

- (void)setShareWithHomeOwnerOperationQueue:(id)a3
{
}

- (BOOL)notificationEnableRequestedForAppleMediaAccessories
{
  return self->_notificationEnableRequestedForAppleMediaAccessories;
}

- (void)setAdminUser:(BOOL)a3
{
  self->_adminUser = a3;
}

- (BOOL)isAdminUser
{
  return self->_adminUser;
}

- (void)setOwnerUser:(BOOL)a3
{
  self->_BOOL ownerUser = a3;
}

- (BOOL)isOwnerUser
{
  return self->_ownerUser;
}

- (void)setCurrentOutgoingInvitations:(id)a3
{
}

- (void)setCurrentResidentDevices:(id)a3
{
}

- (void)setCurrentTriggerOwnedActionSets:(id)a3
{
}

- (void)setCurrentServiceGroups:(id)a3
{
}

- (HMHomeHubState)homeHubState
{
  return self->_homeHubState;
}

- (void)setEventLogDuration:(unint64_t)a3
{
  self->_eventLogDuration = a3;
}

- (unint64_t)eventLogDuration
{
  return self->_eventLogDuration;
}

- (void)setNumberOfCameras:(id)a3
{
}

- (NSNumber)numberOfCameras
{
  return self->_numberOfCameras;
}

- (void)setSupportsResidentActionSetStateEvaluation:(BOOL)a3
{
  self->_supportsResidentActionSetStateEvaluation = a3;
}

- (BOOL)supportsResidentActionSetStateEvaluation
{
  return self->_supportsResidentActionSetStateEvaluation;
}

- (void)setIsUpdatedToROAR:(BOOL)a3
{
  self->_isUpdatedToROAR = a3;
}

- (void)setAssistantIdentifier:(id)a3
{
}

- (void)setManagedTriggers:(id)a3
{
}

- (NSArray)managedTriggers
{
  return self->_managedTriggers;
}

- (void)setThreadNetworkID:(id)a3
{
}

- (NSString)threadNetworkID
{
  return self->_threadNetworkID;
}

- (void)setPersonManagerZoneUUID:(id)a3
{
}

- (NSUUID)personManagerZoneUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 200, 1);
}

- (void)setSiriPhraseOptions:(unint64_t)a3
{
  self->_siriPhraseOptions = a3;
}

- (unint64_t)siriPhraseOptions
{
  return self->_siriPhraseOptions;
}

- (void)setDidOnboardAudioAnalysis:(BOOL)a3
{
  self->_didOnboardAudioAnalysis = a3;
}

- (void)setAudioAnalysisClassifierOptions:(unint64_t)a3
{
  self->_audioAnalysisClassifierOptions = a3;
}

- (unint64_t)audioAnalysisClassifierOptions
{
  return self->_audioAnalysisClassifierOptions;
}

- (void)setSoundCheckEnabled:(BOOL)a3
{
  self->_soundCheckEnabled = a3;
}

- (BOOL)soundCheckEnabled
{
  return self->_soundCheckEnabled;
}

- (BOOL)multiUserEnabled
{
  return self->_multiUserEnabled;
}

- (void)switchBackToREV2FromResidentSelectionWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v18 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Received command to switch the home back to REV2", buf, 0xCu);
  }
  id v9 = (void *)MEMORY[0x1E4F65480];
  id v10 = [(HMHome *)v6 messageDestination];
  id v11 = [v9 messageWithName:@"HM.switch.to.rev2" destination:v10 payload:0];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__HMHome_switchBackToREV2FromResidentSelectionWithCompletion___block_invoke;
  v15[3] = &unk_1E5943468;
  id v16 = v4;
  id v12 = v4;
  [v11 setResponseHandler:v15];
  id v13 = [(HMHome *)v6 context];
  id v14 = [v13 messageDispatcher];
  [v14 sendMessage:v11];
}

uint64_t __62__HMHome_switchBackToREV2FromResidentSelectionWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setAutoSelectedPreferredResidents:(id)a3
{
  id v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  autoSelectedPreferredResidents = self->_autoSelectedPreferredResidents;
  self->_autoSelectedPreferredResidents = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setUserSelectedPreferredResident:(id)a3
{
  id v4 = (HMResidentDevice *)a3;
  os_unfair_lock_lock_with_options();
  userSelectedPreferredResident = self->_userSelectedPreferredResident;
  self->_userSelectedPreferredResident = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setSupportsResidentSelection:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsResidentSelection = a3;

  os_unfair_lock_unlock(p_lock);
}

- (NSArray)autoSelectedPreferredResidents
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_autoSelectedPreferredResidents;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setPreferredPrimary:(id)a3 oneTime:(BOOL)a4 triggerElection:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = (void *)MEMORY[0x1E4F1CA60];
  id v12 = a3;
  id v13 = [v11 dictionary];
  [v13 setObject:v12 forKeyedSubscript:@"preferred.primary.name"];

  id v14 = [NSNumber numberWithBool:v7];
  [v13 setObject:v14 forKeyedSubscript:@"preferred.primary.one.time"];

  id v15 = [NSNumber numberWithBool:v6];
  [v13 setObject:v15 forKeyedSubscript:@"preferred.primary.trigger.election"];

  id v16 = objc_alloc(MEMORY[0x1E4F65488]);
  uint64_t v17 = [(HMHome *)self messageTargetUUID];
  id v18 = (void *)[v16 initWithTarget:v17];

  uint64_t v19 = [MEMORY[0x1E4F654B0] messageWithName:@"HM.set.preferred.primary" destination:v18 payload:v13];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __72__HMHome_setPreferredPrimary_oneTime_triggerElection_completionHandler___block_invoke;
  void v23[3] = &unk_1E5943468;
  id v24 = v10;
  id v20 = v10;
  [v19 setResponseHandler:v23];
  uint64_t v21 = [(HMHome *)self context];
  uint64_t v22 = [v21 messageDispatcher];
  [v22 sendMessage:v19];
}

uint64_t __72__HMHome_setPreferredPrimary_oneTime_triggerElection_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)accessoryUUIDForIdentifier:(id)a3
{
  id v3 = [(HMHome *)self accessoryWithUniqueIdentifier:a3];
  id v4 = [v3 uuid];

  return v4;
}

- (void)fetchLastModifiedServiceOfType:(id)a3 completionHandler:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (char *)a3;
  BOOL v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v24 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome fetchLastModifiedServiceOfType:completionHandler:]", @"completion"];
    id v25 = (void *)MEMORY[0x19F3A64A0]();
    id v26 = self;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v36 = v28;
      __int16 v37 = 2112;
      __int16 v38 = (const char *)v24;
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v29 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v24 userInfo:0];
    objc_exception_throw(v29);
  }
  id v9 = (void *)v8;
  BOOL v10 = v8 == 0;
  id v11 = (void *)MEMORY[0x19F3A64A0]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  id v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v36 = v21;
      __int16 v37 = 2080;
      __int16 v38 = "-[HMHome fetchLastModifiedServiceOfType:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v7[2](v7, 0, v19);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v36 = v15;
      __int16 v37 = 2112;
      __int16 v38 = v6;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Fetching last modified service of type for serviceType: %@", buf, 0x16u);
    }
    if ([v6 isEqualToString:@"00000041-0000-1000-8000-0026BB765291"])
    {
      id v16 = (void *)MEMORY[0x1E4F654B0];
      uint64_t v17 = [(HMHome *)v12 messageDestination];
      __int16 v33 = @"kServiceType";
      id v34 = v6;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      uint64_t v19 = [v16 messageWithName:@"HMHomeFetchLastModifiedServiceOfTypeMessage" destination:v17 payload:v18];

      objc_initWeak((id *)buf, v12);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __59__HMHome_fetchLastModifiedServiceOfType_completionHandler___block_invoke;
      v30[3] = &unk_1E5944188;
      objc_copyWeak(&v32, (id *)buf);
      uint64_t v31 = v7;
      [v19 setResponseHandler:v30];
      id v20 = [v9 messageDispatcher];
      [v20 sendMessage:v19 completionHandler:0];

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      uint64_t v19 = [(HMHome *)v12 context];
      uint64_t v22 = [v19 delegateCaller];
      uint64_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:5 userInfo:0];
      [v22 callCompletion:v7 service:0 error:v23];
    }
  }
}

void __59__HMHome_fetchLastModifiedServiceOfType_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!v6)
    {
      uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
      id v18 = WeakRetained;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v43 = v20;
        __int16 v44 = 2112;
        id v45 = v5;
        _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch last modified service with error: %@", buf, 0x16u);
      }
      id v11 = 0;
      goto LABEL_22;
    }
    uint64_t v8 = objc_msgSend(v6, "hmf_UUIDForKey:", @"kAccessoryUUID");
    uint64_t v9 = objc_msgSend(v6, "hmf_numberForKey:", @"kServiceInstanceID");
    BOOL v10 = (void *)v9;
    id v11 = 0;
    if (!v8 || !v9)
    {
LABEL_19:
      id v30 = (void *)MEMORY[0x19F3A64A0]();
      id v31 = WeakRetained;
      id v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        __int16 v33 = v40 = v10;
        [v11 name];
        id v41 = v6;
        uint64_t v34 = a1;
        id v35 = v5;
        __int16 v37 = v36 = v8;
        *(_DWORD *)buf = 138543874;
        uint64_t v43 = v33;
        __int16 v44 = 2112;
        id v45 = v37;
        __int16 v46 = 2112;
        id v47 = v11;
        _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_INFO, "%{public}@Fetched last modified service: %@ %@", buf, 0x20u);

        uint64_t v8 = v36;
        id v5 = v35;
        a1 = v34;
        id v6 = v41;

        BOOL v10 = v40;
      }

LABEL_22:
      __int16 v38 = [WeakRetained context];
      uint64_t v39 = [v38 delegateCaller];
      [v39 callCompletion:*(void *)(a1 + 32) service:v11 error:v5];

      goto LABEL_23;
    }
    id v12 = [WeakRetained accessoryWithUUID:v8];
    id v13 = v12;
    if (v12)
    {
      uint64_t v14 = [v12 _findService:v10];
      if (v14)
      {
        id v11 = (void *)v14;
LABEL_18:

        goto LABEL_19;
      }
      uint64_t v21 = (void *)MEMORY[0x19F3A64A0]();
      id v28 = WeakRetained;
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v43 = v24;
        __int16 v44 = 2112;
        id v45 = v10;
        __int16 v46 = 2112;
        id v47 = v13;
        id v25 = "%{public}@Failed to get service with instance ID: %@ for accessory: %@";
        id v26 = v23;
        uint32_t v27 = 32;
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v21 = (void *)MEMORY[0x19F3A64A0]();
      id v22 = WeakRetained;
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v43 = v24;
        __int16 v44 = 2112;
        id v45 = v8;
        id v25 = "%{public}@Failed to get accessory with uuid: %@";
        id v26 = v23;
        uint32_t v27 = 22;
LABEL_16:
        _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
      }
    }

    uint64_t v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:2 userInfo:0];

    id v11 = 0;
    id v5 = (id)v29;
    goto LABEL_18;
  }
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
  (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);

LABEL_23:
}

- (void)setSoftwareUpdateController:(id)a3
{
  id v4 = (HMAccessorySoftwareUpdateControllerV2 *)a3;
  os_unfair_lock_lock_with_options();
  softwareUpdateController = self->_softwareUpdateController;
  self->_softwareUpdateController = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)mediaDestinationsWithHomeTheaterSupportedOptions
{
  id v3 = [(HMHome *)self accessories];
  id v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_1101);

  id v5 = [(HMHome *)self mediaSystems];
  id v6 = objc_msgSend(v5, "na_filter:", &__block_literal_global_1103);

  BOOL v7 = [v4 arrayByAddingObjectsFromArray:v6];

  return v7;
}

uint64_t __58__HMHome_mediaDestinationsWithHomeTheaterSupportedOptions__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 audioDestination];
  uint64_t v3 = [v2 containsHomeTheaterSupportedOptions];

  return v3;
}

uint64_t __58__HMHome_mediaDestinationsWithHomeTheaterSupportedOptions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 audioDestination];
  uint64_t v3 = [v2 containsHomeTheaterSupportedOptions];

  return v3;
}

- (id)mediaDestinationsWithSupportedOptions:(unint64_t)a3
{
  id v5 = [(HMHome *)self accessories];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__HMHome_mediaDestinationsWithSupportedOptions___block_invoke;
  v12[3] = &__block_descriptor_40_e21_B16__0__HMAccessory_8l;
  v12[4] = a3;
  id v6 = objc_msgSend(v5, "na_filter:", v12);

  BOOL v7 = [(HMHome *)self mediaSystems];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__HMHome_mediaDestinationsWithSupportedOptions___block_invoke_2;
  v11[3] = &__block_descriptor_40_e23_B16__0__HMMediaSystem_8l;
  v11[4] = a3;
  uint64_t v8 = objc_msgSend(v7, "na_filter:", v11);

  uint64_t v9 = [v6 arrayByAddingObjectsFromArray:v8];

  return v9;
}

uint64_t __48__HMHome_mediaDestinationsWithSupportedOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 audioDestination];
  uint64_t v4 = [v3 containsSupportedOptions:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __48__HMHome_mediaDestinationsWithSupportedOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 audioDestination];
  uint64_t v4 = [v3 containsSupportedOptions:*(void *)(a1 + 32)];

  return v4;
}

- (HMPersonSettingsManager)personSettingsManager
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  personSettingsManager = self->_personSettingsManager;
  if (!personSettingsManager)
  {
    id v5 = [[HMPersonSettingsManager alloc] initWithHome:self];
    id v6 = self->_personSettingsManager;
    self->_personSettingsManager = v5;

    personSettingsManager = self->_personSettingsManager;
  }
  BOOL v7 = personSettingsManager;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)setPersonManagerSettings:(id)a3
{
  uint64_t v4 = (HMHomePersonManagerSettings *)a3;
  os_unfair_lock_lock_with_options();
  personManagerSettings = self->_personManagerSettings;
  self->_personManagerSettings = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setPersonManager:(id)a3
{
  uint64_t v4 = (HMHomePersonManager *)a3;
  os_unfair_lock_lock_with_options();
  personManager = self->_personManager;
  self->_personManager = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)updateApplicationData:(id)a3 forAppDataContainer:(id)a4 appDataContainerUUIDKeyName:(id)a5 completionHandler:(id)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v38 = a5;
  id v37 = a6;
  id v12 = [(HMHome *)self context];
  if (v12)
  {
    if (!v11) {
      _HMFPreconditionFailure();
    }
    id v13 = [MEMORY[0x1E4F1CA60] dictionary];
    if (v10)
    {
      uint64_t v14 = [v10 dictionaryRepresentation];
      [v13 setObject:v14 forKeyedSubscript:@"kAppDataInformationKey"];
    }
    if (v38)
    {
      uint64_t v15 = [v11 applicationDataIdentifier];
      id v16 = [v15 UUIDString];
      [v13 setObject:v16 forKey:v38];
    }
    id v17 = objc_alloc(MEMORY[0x1E4F65488]);
    id v18 = [(HMHome *)self messageTargetUUID];
    uint64_t v19 = [v17 initWithTarget:v18];

    id v20 = (void *)MEMORY[0x1E4F654B0];
    uint64_t v21 = (void *)[v13 copy];
    id v36 = (void *)v19;
    id v22 = [v20 messageWithName:@"kSetAppDataRequestKey" destination:v19 payload:v21];

    objc_initWeak((id *)location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__HMHome_updateApplicationData_forAppDataContainer_appDataContainerUUIDKeyName_completionHandler___block_invoke;
    aBlock[3] = &unk_1E5944AB8;
    objc_copyWeak(&v47, (id *)location);
    id v44 = v11;
    id v45 = v10;
    id v46 = v37;
    uint64_t v23 = _Block_copy(aBlock);
    uint64_t v24 = [(HMHome *)self context];
    id v25 = [v24 pendingRequests];

    id v26 = [v22 identifier];
    uint32_t v27 = _Block_copy(v23);
    [v25 addCompletionBlock:v27 forIdentifier:v26];

    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __98__HMHome_updateApplicationData_forAppDataContainer_appDataContainerUUIDKeyName_completionHandler___block_invoke_2;
    v39[3] = &unk_1E5945510;
    id v28 = v25;
    id v40 = v28;
    id v29 = v26;
    id v41 = v29;
    id v30 = v23;
    id v42 = v30;
    [v22 setResponseHandler:v39];
    id v31 = [v12 messageDispatcher];
    [v31 sendMessage:v22 completionHandler:0];

    objc_destroyWeak(&v47);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v32 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v33 = self;
    uint64_t v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      id v35 = HMFGetLogIdentifier();
      *(_DWORD *)id location = 138543618;
      *(void *)&location[4] = v35;
      __int16 v49 = 2080;
      __int16 v50 = "-[HMHome updateApplicationData:forAppDataContainer:appDataContainerUUIDKeyName:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v34, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);
    }
  }
}

void __98__HMHome_updateApplicationData_forAppDataContainer_appDataContainerUUIDKeyName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v8 = WeakRetained;
  if (!v4)
  {
    [*(id *)(a1 + 32) setApplicationData:*(void *)(a1 + 40)];
    id WeakRetained = v8;
  }
  id v6 = [WeakRetained context];
  BOOL v7 = [v6 delegateCaller];
  [v7 callCompletion:*(void *)(a1 + 48) error:v4];
}

void __98__HMHome_updateApplicationData_forAppDataContainer_appDataContainerUUIDKeyName_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)updateApplicationData:(id)a3 forActionSet:(id)a4 completionHandler:(id)a5
{
}

- (void)updateApplicationData:(id)a3 forServiceGroup:(id)a4 completionHandler:(id)a5
{
}

- (void)updateApplicationData:(id)a3 forRoom:(id)a4 completionHandler:(id)a5
{
}

- (void)updateApplicationData:(id)a3 completionHandler:(id)a4
{
}

- (HMFMessageDestination)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  id v4 = [(HMHome *)self messageTargetUUID];
  id v5 = (void *)[v3 initWithTarget:v4];

  return (HMFMessageDestination *)v5;
}

void __24__HMHome_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 IDSIdentifier];
  id v5 = [v3 IDSDestination];
  id v6 = [v3 deviceIRKData];
  BOOL v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v4 && v6)
  {
    if (v10)
    {
      id v11 = HMFGetLogIdentifier();
      int v22 = 138544130;
      uint64_t v23 = v11;
      __int16 v24 = 2112;
      id v25 = v3;
      __int16 v26 = 2112;
      uint32_t v27 = v4;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Creating dummy accessory for resident: %@, with IDSIdentifier: %@, deviceIRKData: %@", (uint8_t *)&v22, 0x2Au);
    }
    id v12 = [[HMAccessory alloc] initWithUUID:v4];
    [(HMAccessory *)v12 setDeviceIRKData:v6];
    id v13 = [HMDevice alloc];
    uint64_t v14 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v15 = [(HMDevice *)v13 initWithUUID:v14 name:@"Dummy Device" isCurrentDevice:0];
    [(HMAccessory *)v12 setDevice:v15];

    id v16 = objc_alloc(MEMORY[0x1E4F65460]);
    id v17 = (void *)[v16 initWithType:*MEMORY[0x1E4F64EE8] size:*MEMORY[0x1E4F64EE0] data:v6];
    id v18 = [(HMAccessory *)v12 device];
    [v18 setRapportIRK:v17];

    uint64_t v19 = [(HMAccessory *)v12 device];
    [v19 setIdsIdentifier:v4];

    id v20 = [(HMAccessory *)v12 device];
    [v20 setIdsDestination:v5];

    [*(id *)(*(void *)(a1 + 32) + 440) addObject:v12];
  }
  else
  {
    if (v10)
    {
      uint64_t v21 = HMFGetLogIdentifier();
      int v22 = 138544130;
      uint64_t v23 = v21;
      __int16 v24 = 2112;
      id v25 = v3;
      __int16 v26 = 2112;
      uint32_t v27 = v4;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Not creating dummy accessory for resident with missing data. Resident: %@, IDSIdentifier: %@, deviceIRKData: %@", (uint8_t *)&v22, 0x2Au);
    }
  }
}

- (void)_notifyDelegateOfBulletinNotificationsSupportedUpdate
{
  id v3 = [(HMHome *)self delegate];
  if ([v3 conformsToProtocol:&unk_1EEF70488]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (objc_opt_respondsToSelector())
  {
    id v6 = [(HMHome *)self context];
    BOOL v7 = [v6 delegateCaller];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__HMHome__notifyDelegateOfBulletinNotificationsSupportedUpdate__block_invoke;
    v8[3] = &unk_1E5945628;
    id v9 = v5;
    BOOL v10 = self;
    [v7 invokeBlock:v8];
  }
}

uint64_t __63__HMHome__notifyDelegateOfBulletinNotificationsSupportedUpdate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 areBulletinNotificationsSupported];

  return [v1 home:v2 didUpdateAreBulletinNotificationsSupported:v3];
}

- (void)_notifyDelegateOfUpdatedHomeLocationStatus
{
  uint64_t v3 = [(HMHome *)self delegate];
  if ([v3 conformsToProtocol:&unk_1EEF70488]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (objc_opt_respondsToSelector())
  {
    id v6 = [(HMHome *)self context];
    BOOL v7 = [v6 delegateCaller];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__HMHome__notifyDelegateOfUpdatedHomeLocationStatus__block_invoke;
    v8[3] = &unk_1E5945628;
    id v9 = v5;
    BOOL v10 = self;
    [v7 invokeBlock:v8];
  }
}

uint64_t __52__HMHome__notifyDelegateOfUpdatedHomeLocationStatus__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeDidUpdateHomeLocationStatus:*(void *)(a1 + 40)];
}

- (void)_removeIncompatibleTrigger:(id)a3
{
  id v5 = a3;
  [v5 _unconfigure];
  id v4 = [(HMHome *)self currentTriggers];
  [v4 removeObject:v5];

  [(HMHome *)self _notifyDelegateOfTriggerRemoved:v5];
}

- (void)_notifyDelegateOfHomeHubStateUpdate
{
  uint64_t v3 = [(HMHome *)self delegate];
  if ([v3 conformsToProtocol:&unk_1EEF69860]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (objc_opt_respondsToSelector())
  {
    id v6 = [(HMHome *)self context];
    BOOL v7 = [v6 delegateCaller];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__HMHome__notifyDelegateOfHomeHubStateUpdate__block_invoke;
    v8[3] = &unk_1E5945628;
    id v9 = v5;
    BOOL v10 = self;
    [v7 invokeBlock:v8];
  }
}

uint64_t __45__HMHome__notifyDelegateOfHomeHubStateUpdate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 homeHubState];

  return [v1 home:v2 didUpdateHomeHubState:v3];
}

- (void)_notifyDelegateOfTriggerUpdated:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 compatibleWithApp])
  {
    id v5 = [(HMHome *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id v6 = [(HMHome *)self context];
      BOOL v7 = [v6 delegateCaller];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __42__HMHome__notifyDelegateOfTriggerUpdated___block_invoke;
      v13[3] = &unk_1E5945650;
      id v14 = v5;
      uint64_t v15 = self;
      id v16 = v4;
      [v7 invokeBlock:v13];
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    BOOL v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [v4 name];
      *(_DWORD *)buf = 138543618;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Updated trigger %@ is no longer compatible", buf, 0x16u);
    }
    [(HMHome *)v9 _removeIncompatibleTrigger:v4];
  }
}

uint64_t __42__HMHome__notifyDelegateOfTriggerUpdated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateTrigger:*(void *)(a1 + 48)];
}

- (void)_notifyDelegateOfTriggerRemoved:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(HMHome *)self context];
    BOOL v7 = [v6 delegateCaller];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__HMHome__notifyDelegateOfTriggerRemoved___block_invoke;
    v8[3] = &unk_1E5945650;
    void v8[4] = self;
    id v9 = v4;
    id v10 = v5;
    [v7 invokeBlock:v8];
  }
}

uint64_t __42__HMHome__notifyDelegateOfTriggerRemoved___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didRemoveTrigger with trigger: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) home:*(void *)(a1 + 32) didRemoveTrigger:*(void *)(a1 + 40)];
}

- (void)_notifyDelegateOfTriggerAdded:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [(HMHome *)self context];
    BOOL v7 = [v6 delegateCaller];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__HMHome__notifyDelegateOfTriggerAdded___block_invoke;
    v8[3] = &unk_1E5945650;
    void v8[4] = self;
    id v9 = v4;
    id v10 = v5;
    [v7 invokeBlock:v8];
  }
}

uint64_t __40__HMHome__notifyDelegateOfTriggerAdded___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didAddTrigger with trigger: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) home:*(void *)(a1 + 32) didAddTrigger:*(void *)(a1 + 40)];
}

- (void)_notifyDelegateOfAccesoryInvitationsUpdateForUser:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HMHome *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      BOOL v7 = [(HMHome *)self delegate];
      if ([v7 conformsToProtocol:&unk_1EEF70488]) {
        int v8 = v7;
      }
      else {
        int v8 = 0;
      }
      id v9 = v8;

      __int16 v10 = [(HMHome *)self context];
      uint64_t v11 = [v10 delegateCaller];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __60__HMHome__notifyDelegateOfAccesoryInvitationsUpdateForUser___block_invoke;
      v13[3] = &unk_1E5945650;
      id v14 = v9;
      uint64_t v15 = self;
      id v16 = v4;
      id v12 = v9;
      [v11 invokeBlock:v13];
    }
  }
}

uint64_t __60__HMHome__notifyDelegateOfAccesoryInvitationsUpdateForUser___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateAccesoryInvitationsForUser:*(void *)(a1 + 48)];
}

- (void)notifyDelegateOfAccesoryInvitationsUpdateForUser:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMHome *)self context];
  char v6 = v5;
  if (v5)
  {
    BOOL v7 = [v5 queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__HMHome_notifyDelegateOfAccesoryInvitationsUpdateForUser___block_invoke;
    v12[3] = &unk_1E5945628;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v7, v12);
  }
  else
  {
    int v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      id v17 = "-[HMHome notifyDelegateOfAccesoryInvitationsUpdateForUser:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __59__HMHome_notifyDelegateOfAccesoryInvitationsUpdateForUser___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfAccesoryInvitationsUpdateForUser:*(void *)(a1 + 40)];
}

- (void)_notifyDelegateOfAccessControlUpdateForUser:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self delegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v6 = v5;
    if ([v6 conformsToProtocol:&unk_1EEF70488]) {
      BOOL v7 = v6;
    }
    else {
      BOOL v7 = 0;
    }
    id v8 = v7;

    id v9 = [(HMHome *)self context];
    __int16 v10 = [v9 delegateCaller];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54__HMHome__notifyDelegateOfAccessControlUpdateForUser___block_invoke;
    v17[3] = &unk_1E5945650;
    v17[4] = self;
    id v18 = v4;
    id v19 = v8;
    id v11 = v8;
    [v10 invokeBlock:v17];
  }
  if [v4 isCurrentUser] && (objc_opt_respondsToSelector())
  {
    id v12 = [(HMHome *)self context];
    id v13 = [v12 delegateCaller];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__HMHome__notifyDelegateOfAccessControlUpdateForUser___block_invoke_1059;
    v14[3] = &unk_1E5945628;
    id v15 = v5;
    __int16 v16 = self;
    [v13 invokeBlock:v14];
  }
}

uint64_t __54__HMHome__notifyDelegateOfAccessControlUpdateForUser___block_invoke(id *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = a1[4];
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [a1[5] homeAccessControl];
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client for didUpdateAccessControlForUser : %@", (uint8_t *)&v8, 0x16u);
  }
  return [a1[6] home:a1[4] didUpdateAccessControlForUser:a1[5]];
}

uint64_t __54__HMHome__notifyDelegateOfAccessControlUpdateForUser___block_invoke_1059(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeDidUpdateAccessControlForCurrentUser:*(void *)(a1 + 40)];
}

- (void)notifyDelegateOfAccessControlUpdateForUser:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMHome *)self context];
  id v6 = v5;
  if (v5)
  {
    BOOL v7 = [v5 queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__HMHome_notifyDelegateOfAccessControlUpdateForUser___block_invoke;
    v12[3] = &unk_1E5945628;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v7, v12);
  }
  else
  {
    int v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v15 = v11;
      __int16 v16 = 2080;
      id v17 = "-[HMHome notifyDelegateOfAccessControlUpdateForUser:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __53__HMHome_notifyDelegateOfAccessControlUpdateForUser___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfAccessControlUpdateForUser:*(void *)(a1 + 40)];
}

- (void)_invokeDelegateForAppData:(id)a3
{
  id v8 = a3;
  id v4 = [v8 uuidForKey:@"kRoomUUID"];
  if (v4)
  {
    id v5 = [(HMHome *)self roomWithUUID:v4];
    [(HMHome *)self _notifyDelegateOfAppDataUpdateForRoom:v5];
  }
  else
  {
    id v5 = [v8 uuidForKey:@"kServiceGroupUUID"];
    if (v5)
    {
      id v6 = [(HMHome *)self serviceGroupWithUUID:v5];
      [(HMHome *)self _notifyDelegateOfAppDataUpdateForServiceGroup:v6];
    }
    else
    {
      id v6 = [v8 uuidForKey:@"kActionSetUUID"];
      if (v6)
      {
        BOOL v7 = [(HMHome *)self actionSetWithUUID:v6];
        [(HMHome *)self _notifyDelegateOfAppDataUpdateForActionSet:v7];
      }
      else
      {
        [(HMHome *)self _notifyDelegateOfAppDataUpdate];
      }
    }
  }
}

- (void)_notifyDelegateOfAppDataUpdate
{
  id v3 = [(HMHome *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(HMHome *)self context];
    id v6 = [v5 delegateCaller];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__HMHome__notifyDelegateOfAppDataUpdate__block_invoke;
    v7[3] = &unk_1E59452E8;
    v7[4] = self;
    [v6 invokeBlock:v7];
  }
}

void __40__HMHome__notifyDelegateOfAppDataUpdate__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _privateDelegate];
  [v2 homeDidUpdateApplicationData:*(void *)(a1 + 32)];
}

- (void)_notifyDelegateOfAppDataUpdateForActionSet:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HMHome *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      BOOL v7 = [(HMHome *)self _privateDelegate];
      id v8 = [(HMHome *)self context];
      id v9 = [v8 delegateCaller];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __53__HMHome__notifyDelegateOfAppDataUpdateForActionSet___block_invoke;
      v11[3] = &unk_1E5945650;
      id v12 = v7;
      id v13 = self;
      id v14 = v4;
      id v10 = v7;
      [v9 invokeBlock:v11];
    }
  }
}

uint64_t __53__HMHome__notifyDelegateOfAppDataUpdateForActionSet___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateApplicationDataForActionSet:*(void *)(a1 + 48)];
}

- (void)notifyDelegateOfAppDataUpdateForActionSet:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMHome *)self context];
  char v6 = v5;
  if (v5)
  {
    BOOL v7 = [v5 queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__HMHome_notifyDelegateOfAppDataUpdateForActionSet___block_invoke;
    v12[3] = &unk_1E5945628;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v7, v12);
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v15 = v11;
      __int16 v16 = 2080;
      id v17 = "-[HMHome notifyDelegateOfAppDataUpdateForActionSet:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __52__HMHome_notifyDelegateOfAppDataUpdateForActionSet___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfAppDataUpdateForActionSet:*(void *)(a1 + 40)];
}

- (void)_notifyDelegateOfAppDataUpdateForServiceGroup:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HMHome *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      BOOL v7 = [(HMHome *)self _privateDelegate];
      id v8 = [(HMHome *)self context];
      id v9 = [v8 delegateCaller];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __56__HMHome__notifyDelegateOfAppDataUpdateForServiceGroup___block_invoke;
      v11[3] = &unk_1E5945650;
      id v12 = v7;
      id v13 = self;
      id v14 = v4;
      id v10 = v7;
      [v9 invokeBlock:v11];
    }
  }
}

uint64_t __56__HMHome__notifyDelegateOfAppDataUpdateForServiceGroup___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateApplicationDataForServiceGroup:*(void *)(a1 + 48)];
}

- (void)notifyDelegateOfAppDataUpdateForServiceGroup:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMHome *)self context];
  char v6 = v5;
  if (v5)
  {
    BOOL v7 = [v5 queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__HMHome_notifyDelegateOfAppDataUpdateForServiceGroup___block_invoke;
    v12[3] = &unk_1E5945628;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v7, v12);
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v15 = v11;
      __int16 v16 = 2080;
      id v17 = "-[HMHome notifyDelegateOfAppDataUpdateForServiceGroup:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __55__HMHome_notifyDelegateOfAppDataUpdateForServiceGroup___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfAppDataUpdateForServiceGroup:*(void *)(a1 + 40)];
}

- (void)_notifyDelegateOfAppDataUpdateForRoom:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HMHome *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      BOOL v7 = [(HMHome *)self _privateDelegate];
      id v8 = [(HMHome *)self context];
      id v9 = [v8 delegateCaller];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __48__HMHome__notifyDelegateOfAppDataUpdateForRoom___block_invoke;
      v11[3] = &unk_1E5945650;
      id v12 = v7;
      id v13 = self;
      id v14 = v4;
      id v10 = v7;
      [v9 invokeBlock:v11];
    }
  }
}

uint64_t __48__HMHome__notifyDelegateOfAppDataUpdateForRoom___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateApplicationDataForRoom:*(void *)(a1 + 48)];
}

- (void)notifyDelegateOfAppDataUpdateForRoom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMHome *)self context];
  char v6 = v5;
  if (v5)
  {
    BOOL v7 = [v5 queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__HMHome_notifyDelegateOfAppDataUpdateForRoom___block_invoke;
    v12[3] = &unk_1E5945628;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v7, v12);
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v15 = v11;
      __int16 v16 = 2080;
      id v17 = "-[HMHome notifyDelegateOfAppDataUpdateForRoom:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __47__HMHome_notifyDelegateOfAppDataUpdateForRoom___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfAppDataUpdateForRoom:*(void *)(a1 + 40)];
}

- (id)_getContainerForAppData:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uuidForKey:@"kRoomUUID"];
  if (v5)
  {
    char v6 = [(HMHome *)self roomWithUUID:v5];
  }
  else
  {
    BOOL v7 = [v4 uuidForKey:@"kServiceGroupUUID"];
    if (v7)
    {
      char v6 = [(HMHome *)self serviceGroupWithUUID:v7];
    }
    else
    {
      id v8 = [v4 uuidForKey:@"kActionSetUUID"];
      if (v8)
      {
        id v9 = [(HMHome *)self actionSetWithUUID:v8];
      }
      else
      {
        id v9 = self;
      }
      char v6 = v9;
    }
  }

  return v6;
}

- (void)_handleHomeHubStateUpdatedNotification:(id)a3
{
  id v4 = [a3 numberForKey:@"homeHubState"];
  if (v4)
  {
    id v7 = v4;
    unint64_t v5 = [v4 integerValue];
    BOOL v6 = [(HMHome *)self homeHubState] == v5;
    id v4 = v7;
    if (!v6)
    {
      self->_homeHubState = v5;
      [(HMHome *)self _notifyDelegateOfHomeHubStateUpdate];
      id v4 = v7;
    }
  }
}

- (void)_handleHomeLocationStatusUpdateNotification:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = (void *)MEMORY[0x19F3A64A0]();
  BOOL v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [(HMHome *)v6 name];
    int v18 = 138543618;
    id v19 = v8;
    __int16 v20 = 2112;
    uint64_t v21 = v9;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Start handling home location status update notification in home %@", (uint8_t *)&v18, 0x16u);
  }
  id v10 = [(HMHome *)v6 context];
  id v11 = [v10 pendingRequests];

  id v12 = [v4 identifier];
  id v13 = [v11 removeCompletionBlockForIdentifier:v12];

  id v14 = [v4 numberForKey:@"HMHomeLocationStatusValueKey"];
  id v15 = v14;
  if (v14)
  {
    -[HMHome setHomeLocationStatus:](v6, "setHomeLocationStatus:", [v14 integerValue]);
    if (v13)
    {
      __int16 v16 = [(HMHome *)v6 context];
      id v17 = [v16 delegateCaller];
      [v17 callCompletion:v13 error:0];
    }
    else
    {
      [(HMHome *)v6 _notifyDelegateOfUpdatedHomeLocationStatus];
    }
  }
}

- (void)_handleAccessorySetupCodeFailureMessage:(id)a3
{
  id v4 = [a3 stringForKey:@"kAccessorySetupCodeReasonKey"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__HMHome__handleAccessorySetupCodeFailureMessage___block_invoke;
  v6[3] = &unk_1E5941470;
  id v7 = v4;
  id v5 = v4;
  [(HMHome *)self _notifySetupFailedIfInHomeUIService:v6];
}

id __50__HMHome__handleAccessorySetupCodeFailureMessage___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:@"HMSetupCodeProviderReasonBadPassword"])
  {
    id v2 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2002];
  }
  else
  {
    if ([*(id *)(a1 + 32) isEqualToString:@"HMSetupCodeProviderReasontTimeoutRetry"])uint64_t v3 = 8; {
    else
    }
      uint64_t v3 = 48;
    id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:v3];
  }

  return v2;
}

- (void)_handleAccessoryInfoUpdatedNotification:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint32_t v27 = [v4 messagePayload];
  if (v27)
  {
    id v24 = v4;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = [v27 allKeys];
    uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v29;
      unint64_t v8 = 0x1E4F29000uLL;
      uint64_t v25 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          id v11 = (void *)[objc_alloc(*(Class *)(v8 + 296)) initWithUUIDString:v10];
          id v12 = [(HMHome *)self accessoryWithUUID:v11];

          uint64_t v13 = objc_msgSend(v27, "hmf_dictionaryForKey:", v10);
          id v14 = (void *)v13;
          if (v12) {
            BOOL v15 = v13 == 0;
          }
          else {
            BOOL v15 = 1;
          }
          if (v15)
          {
            unint64_t v16 = v8;
            id v17 = (void *)MEMORY[0x19F3A64A0]();
            int v18 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v20 = id v19 = self;
              *(_DWORD *)buf = 138543874;
              __int16 v33 = v20;
              __int16 v34 = 2112;
              uint64_t v35 = v10;
              __int16 v36 = 2112;
              id v37 = v14;
              _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@Couldn't find the accessory for UUID %@ or dict (%@) is nil.", buf, 0x20u);

              self = v19;
              uint64_t v7 = v25;
            }

            unint64_t v8 = v16;
          }
          else
          {
            [v12 updateAccessoryInfo:v13];
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v6);
    }

    id v4 = v24;
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v33 = v23;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_INFO, "%{public}@Received invalid accessory information payload.", buf, 0xCu);
    }
  }
}

uint64_t __38__HMHome__handleNotificationsEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didEnableNotifications:*(unsigned __int8 *)(a1 + 48)];
}

- (void)updateResidentSelectionVersion:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v20 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome updateResidentSelectionVersion:completion:]", @"completion"];
    uint64_t v21 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v22 = self;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v32 = v24;
      __int16 v33 = 2112;
      __int16 v34 = (const char *)v20;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0];
    objc_exception_throw(v25);
  }
  id v9 = (void *)v8;
  if (v8)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F65480];
    id v11 = [(HMHome *)self messageDestination];
    long long v29 = @"HM.v";
    id v30 = v6;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    uint64_t v13 = [v10 messageWithName:@"HM.SetResidentSelectionVersion" qualityOfService:25 destination:v11 payload:v12];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __52__HMHome_updateResidentSelectionVersion_completion___block_invoke;
    v26[3] = &unk_1E5944EF0;
    id v28 = v7;
    id v14 = v9;
    id v27 = v14;
    [v13 setResponseHandler:v26];
    BOOL v15 = [v14 messageDispatcher];
    [v15 sendMessage:v13 completionHandler:0];
  }
  else
  {
    unint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = self;
    int v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v32 = v19;
      __int16 v33 = 2080;
      __int16 v34 = "-[HMHome updateResidentSelectionVersion:completion:]";
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v13);
  }
}

void __52__HMHome_updateResidentSelectionVersion_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 32) delegateCaller];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __52__HMHome_updateResidentSelectionVersion_completion___block_invoke_2;
    v5[3] = &unk_1E59454E8;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    [v4 invokeBlock:v5];
  }
}

uint64_t __52__HMHome_updateResidentSelectionVersion_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)confirmResidentWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMHome *)self context];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__HMHome_confirmResidentWithCompletion___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    id v14 = v4;
    id v13 = v6;
    dispatch_async(v7, block);
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      unint64_t v16 = v11;
      __int16 v17 = 2080;
      int v18 = "-[HMHome confirmResidentWithCompletion:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __40__HMHome_confirmResidentWithCompletion___block_invoke(id *a1)
{
  id v2 = (void *)MEMORY[0x1E4F654B0];
  id v3 = [a1[4] messageDestination];
  id v4 = [v2 messageWithName:@"HMRM.confirm" qualityOfService:25 destination:v3 payload:0];

  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __40__HMHome_confirmResidentWithCompletion___block_invoke_2;
  id v9 = &unk_1E5944EF0;
  id v11 = a1[6];
  id v10 = a1[5];
  [v4 setResponseHandler:&v6];
  uint64_t v5 = objc_msgSend(a1[5], "messageDispatcher", v6, v7, v8, v9);
  [v5 sendMessage:v4 completionHandler:0];
}

void __40__HMHome_confirmResidentWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 32) delegateCaller];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __40__HMHome_confirmResidentWithCompletion___block_invoke_3;
    v5[3] = &unk_1E59454E8;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    [v4 invokeBlock:v5];
  }
}

uint64_t __40__HMHome_confirmResidentWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __67__HMHome__enableNotification_forCharacteristics_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = a2;
    id v7 = [v3 removeCompletionBlockForIdentifier:v4];
    id v6 = [*(id *)(a1 + 48) delegateCaller];
    [v6 callCompletion:v7 error:v5];
  }
}

- (void)enableNotification:(BOOL)a3 forCharacteristics:(id)a4 completionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  uint64_t v10 = [(HMHome *)self context];
  if (!v9)
  {
    uint64_t v20 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome enableNotification:forCharacteristics:completionHandler:]", @"completion"];
    uint64_t v21 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v22 = self;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v31 = v24;
      __int16 v32 = 2112;
      __int16 v33 = (const char *)v20;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0];
    objc_exception_throw(v25);
  }
  id v11 = (void *)v10;
  if (!v10)
  {
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = self;
    BOOL v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      unint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v31 = v16;
      __int16 v32 = 2080;
      __int16 v33 = "-[HMHome enableNotification:forCharacteristics:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    __int16 v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v9[2](v9, v17);
    goto LABEL_9;
  }
  if (![v8 count])
  {
    __int16 v17 = [(HMHome *)self context];
    int v18 = [v17 delegateCaller];
    uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:20 userInfo:0];
    [v18 callCompletion:v9 error:v19];

LABEL_9:
    goto LABEL_10;
  }
  id v12 = [v11 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HMHome_enableNotification_forCharacteristics_completionHandler___block_invoke;
  block[3] = &unk_1E5941750;
  block[4] = self;
  BOOL v29 = a3;
  id v27 = v8;
  id v28 = v9;
  dispatch_async(v12, block);

LABEL_10:
}

uint64_t __66__HMHome_enableNotification_forCharacteristics_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enableNotification:*(unsigned __int8 *)(a1 + 56) forCharacteristics:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)enableNotifications:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HMHome *)self context];
  if (!v6)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome enableNotifications:completionHandler:]", @"completion"];
    unint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v17 = self;
    int v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v25 = v19;
      __int16 v26 = 2112;
      id v27 = (const char *)v15;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0];
    objc_exception_throw(v20);
  }
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__HMHome_enableNotifications_completionHandler___block_invoke;
    block[3] = &unk_1E5941420;
    block[4] = self;
    BOOL v23 = a3;
    id v22 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v25 = v13;
      __int16 v26 = 2080;
      id v27 = "-[HMHome enableNotifications:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v14);
  }
}

uint64_t __48__HMHome_enableNotifications_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enableNotifications:*(unsigned __int8 *)(a1 + 48) includeAppleMediaAccessoryNotifications:1 completionHandler:*(void *)(a1 + 40)];
}

- (void)_updateInvitation:(id)a3 invitationState:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(HMHome *)self context];
  if (v10)
  {
    v32[0] = @"kInvitationIdentifierKey";
    id v11 = [v8 identifier];
    id v12 = [v11 UUIDString];
    v32[1] = @"kInvitationStateKey";
    v33[0] = v12;
    id v13 = [NSNumber numberWithInteger:a4];
    v33[1] = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];

    id v15 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v16 = objc_alloc(MEMORY[0x1E4F65488]);
    __int16 v17 = [(HMHome *)self uuid];
    int v18 = (void *)[v16 initWithTarget:v17];
    uint64_t v19 = (void *)[v15 initWithName:@"kUpdateInvitationStateRequestKey" destination:v18 payload:v14];

    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    uint64_t v28 = __62__HMHome__updateInvitation_invitationState_completionHandler___block_invoke;
    BOOL v29 = &unk_1E5944EF0;
    id v20 = v10;
    id v30 = v20;
    id v31 = v9;
    [v19 setResponseHandler:&v26];
    uint64_t v21 = objc_msgSend(v20, "messageDispatcher", v26, v27, v28, v29);
    [v21 sendMessage:v19];
  }
  else
  {
    id v22 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v25;
      __int16 v36 = 2080;
      id v37 = "-[HMHome _updateInvitation:invitationState:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __62__HMHome__updateInvitation_invitationState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegateCaller];
  [v5 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (void)_acceptInvitation:(id)a3 completionHandler:(id)a4
{
}

- (void)_cancelInvitation:(id)a3 completionHandler:(id)a4
{
}

uint64_t __42__HMHome___updateLocation_locationStatus___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateLocation:*(void *)(a1 + 48)];
}

- (void)updateAccessForUser:(id)a3 audioAnalysisUserDropinAccessLevel:(unint64_t)a4 completionHandler:(id)a5
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(HMHome *)self context];
  if (!v9)
  {
    uint64_t v29 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome updateAccessForUser:audioAnalysisUserDropinAccessLevel:completionHandler:]", @"completion"];
    id v30 = (void *)MEMORY[0x19F3A64A0]();
    id v31 = self;
    __int16 v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      __int16 v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v40 = v33;
      __int16 v41 = 2112;
      id v42 = (const char *)v29;
      _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v34 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v29 userInfo:0];
    objc_exception_throw(v34);
  }
  id v11 = (void *)v10;
  if (v10)
  {
    if (v8)
    {
      v46[0] = v8;
      v45[0] = @"kUserIDKey";
      v45[1] = @"HMHomeAudioAnalysisDropInAccessLevelInformationKey";
      id v12 = [NSNumber numberWithUnsignedInteger:a4];
      v46[1] = v12;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];

      id v14 = (void *)MEMORY[0x19F3A64A0]();
      id v15 = self;
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        __int16 v17 = HMFGetLogIdentifier();
        int v18 = [NSNumber numberWithUnsignedInteger:a4];
        *(_DWORD *)buf = 138543874;
        id v40 = v17;
        __int16 v41 = 2112;
        id v42 = v18;
        __int16 v43 = 2112;
        id v44 = v8;
        _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating audio analysis drop in access: %@ for userID: %@", buf, 0x20u);
      }
      uint64_t v19 = [(HMHome *)v15 uuid];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __83__HMHome_updateAccessForUser_audioAnalysisUserDropinAccessLevel_completionHandler___block_invoke;
      void v35[3] = &unk_1E59441B0;
      void v35[4] = v15;
      id v36 = v11;
      id v38 = v9;
      id v37 = v8;
      -[_HMContext sendMessage:target:payload:responseHandler:](v36, @"HMHomeAudioAnalysisDropInUpdateAccessLevelRequestKey", v19, v13, v35);
    }
    else
    {
      id v24 = (void *)MEMORY[0x19F3A64A0]();
      id v25 = self;
      uint64_t v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v40 = v27;
        _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@nil user UUID for audio analysis drop in access update request", buf, 0xCu);
      }
      id v13 = [v11 delegateCaller];
      uint64_t v28 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:3 userInfo:0];
      [v13 callCompletion:v9 error:v28];
    }
  }
  else
  {
    id v20 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      BOOL v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v40 = v23;
      __int16 v41 = 2080;
      id v42 = "-[HMHome updateAccessForUser:audioAnalysisUserDropinAccessLevel:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v9 + 2))(v9, v13);
  }
}

void __83__HMHome_updateAccessForUser_audioAnalysisUserDropinAccessLevel_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v15 = 138543618;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to update audio analysis drop in access with error: %@", (uint8_t *)&v15, 0x16u);
    }
    id v11 = [*(id *)(a1 + 40) delegateCaller];
    id v12 = v11;
    uint64_t v13 = *(void *)(a1 + 56);
    id v14 = v5;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "__updateHomeAccessControlFromResponsePayload:forUser:", v6, *(void *)(a1 + 48));
    id v11 = [*(id *)(a1 + 40) delegateCaller];
    id v12 = v11;
    uint64_t v13 = *(void *)(a1 + 56);
    id v14 = 0;
  }
  [v11 callCompletion:v13 error:v14];
}

- (void)updateAccessForUser:(id)a3 announceAccess:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  uint64_t v10 = [(HMHome *)self context];
  if (!v9)
  {
    uint64_t v21 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome updateAccessForUser:announceAccess:completionHandler:]", @"completion"];
    id v22 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v25;
      __int16 v36 = 2112;
      id v37 = (const char *)v21;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v26 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v21 userInfo:0];
    objc_exception_throw(v26);
  }
  id v11 = v10;
  if (!v10)
  {
    int v15 = (void *)MEMORY[0x19F3A64A0]();
    id v16 = self;
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v18;
      __int16 v36 = 2080;
      id v37 = "-[HMHome updateAccessForUser:announceAccess:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v9[2](v9, v19);
    goto LABEL_9;
  }
  if (!v8)
  {
    uint64_t v19 = [v10 delegateCaller];
    id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:3 userInfo:0];
    [v19 callCompletion:v9 error:v20];

LABEL_9:
    goto LABEL_10;
  }
  v32[0] = @"kUserIDKey";
  v32[1] = @"HMHomeUserAnnounceAccessInformationKey";
  v33[0] = v8;
  id v12 = [NSNumber numberWithBool:v6];
  v33[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];

  id v14 = [(HMHome *)self uuid];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __63__HMHome_updateAccessForUser_announceAccess_completionHandler___block_invoke;
  v27[3] = &unk_1E59441B0;
  id v28 = v11;
  id v31 = v9;
  uint64_t v29 = self;
  id v30 = v8;
  -[_HMContext sendMessage:target:payload:responseHandler:](v28, @"HMHomeUpdateUserAnnounceAccessRequestKey", v14, v13, v27);

LABEL_10:
}

void __63__HMHome_updateAccessForUser_announceAccess_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  if (v9)
  {
    id v5 = [*(id *)(a1 + 32) delegateCaller];
    BOOL v6 = v5;
    uint64_t v7 = *(void *)(a1 + 56);
    id v8 = v9;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "__updateHomeAccessControlFromResponsePayload:forUser:", a3, *(void *)(a1 + 48));
    id v5 = [*(id *)(a1 + 32) delegateCaller];
    BOOL v6 = v5;
    uint64_t v7 = *(void *)(a1 + 56);
    id v8 = 0;
  }
  [v5 callCompletion:v7 error:v8];
}

- (void)updateAccessForUser:(id)a3 camerasAccessLevel:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(HMHome *)self context];
  if (!v9)
  {
    uint64_t v24 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome updateAccessForUser:camerasAccessLevel:completionHandler:]", @"completion"];
    id v25 = (void *)MEMORY[0x19F3A64A0]();
    id v26 = self;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = v28;
      __int16 v39 = 2112;
      id v40 = (const char *)v24;
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v29 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v24 userInfo:0];
    objc_exception_throw(v29);
  }
  id v11 = (void *)v10;
  if (v10)
  {
    if (v8)
    {
      v35[0] = @"kUserIDKey";
      v35[1] = @"kUserCamerasAccessLevelInformationKey";
      v36[0] = v8;
      id v12 = [NSNumber numberWithUnsignedInteger:a4];
      v36[1] = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];

      id v14 = [(HMHome *)self uuid];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __67__HMHome_updateAccessForUser_camerasAccessLevel_completionHandler___block_invoke;
      v30[3] = &unk_1E59441B0;
      id v31 = v11;
      id v34 = v9;
      __int16 v32 = self;
      id v33 = v8;
      -[_HMContext sendMessage:target:payload:responseHandler:](v31, @"kUpdateUserCamerasAccessLevelRequestKey", v14, v13, v30);
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x19F3A64A0]();
      id v20 = self;
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v38 = v22;
        _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@User id not present", buf, 0xCu);
      }
      uint64_t v13 = [v11 delegateCaller];
      BOOL v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:3 userInfo:0];
      [v13 callCompletion:v9 error:v23];
    }
  }
  else
  {
    int v15 = (void *)MEMORY[0x19F3A64A0]();
    id v16 = self;
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = v18;
      __int16 v39 = 2080;
      id v40 = "-[HMHome updateAccessForUser:camerasAccessLevel:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v9 + 2))(v9, v13);
  }
}

void __67__HMHome_updateAccessForUser_camerasAccessLevel_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  if (v9)
  {
    id v5 = [*(id *)(a1 + 32) delegateCaller];
    BOOL v6 = v5;
    uint64_t v7 = *(void *)(a1 + 56);
    id v8 = v9;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "__updateHomeAccessControlFromResponsePayload:forUser:", a3, *(void *)(a1 + 48));
    id v5 = [*(id *)(a1 + 32) delegateCaller];
    BOOL v6 = v5;
    uint64_t v7 = *(void *)(a1 + 56);
    id v8 = 0;
  }
  [v5 callCompletion:v7 error:v8];
}

- (void)updateForUser:(id)a3 presenceAuthorizationStatus:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  uint64_t v10 = [(HMHome *)self context];
  if (!v9)
  {
    uint64_t v22 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome updateForUser:presenceAuthorizationStatus:completionHandler:]", @"completion"];
    BOOL v23 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v24 = self;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v36 = v26;
      __int16 v37 = 2112;
      uint64_t v38 = (const char *)v22;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];
    objc_exception_throw(v27);
  }
  id v11 = (void *)v10;
  if (!v10)
  {
    int v15 = (void *)MEMORY[0x19F3A64A0]();
    id v16 = self;
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v36 = v18;
      __int16 v37 = 2080;
      uint64_t v38 = "-[HMHome updateForUser:presenceAuthorizationStatus:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v9[2](v9, v19);
    goto LABEL_9;
  }
  if (!v8)
  {
    uint64_t v19 = [(HMHome *)self context];
    id v20 = [v19 delegateCaller];
    uint64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:3 userInfo:0];
    [v20 callCompletion:v9 error:v21];

LABEL_9:
    goto LABEL_10;
  }
  v33[0] = @"kUserIDKey";
  v33[1] = @"kUserPresenceAuthorizationStatusKey";
  v34[0] = v8;
  id v12 = [NSNumber numberWithUnsignedInteger:a4];
  v34[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];

  id v14 = [(HMHome *)self uuid];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __70__HMHome_updateForUser_presenceAuthorizationStatus_completionHandler___block_invoke;
  v28[3] = &unk_1E59441B0;
  id v29 = v11;
  __int16 v32 = v9;
  id v30 = self;
  id v31 = v8;
  -[_HMContext sendMessage:target:payload:responseHandler:](v29, @"kUpdateUserPresenceStatusConsentRequestKey", v14, v13, v28);

LABEL_10:
}

void __70__HMHome_updateForUser_presenceAuthorizationStatus_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (v12)
  {
    BOOL v6 = [*(id *)(a1 + 32) delegateCaller];
    [v6 callCompletion:*(void *)(a1 + 56) error:v12];
  }
  else
  {
    BOOL v6 = [*(id *)(a1 + 40) _findUserWithID:*(void *)(a1 + 48)];
    uint64_t v7 = [v5 objectForKeyedSubscript:@"kUserPresenceAuthorizationStatusKey"];
    uint64_t v8 = +[HMUserPresenceAuthorization authWithNumber:v7];
    id v9 = (void *)v8;
    if (v6 && v8)
    {
      uint64_t v10 = [v6 homeAccessControl];
      [v10 setPresenceAuthStatus:v9];
    }
    id v11 = [*(id *)(a1 + 32) delegateCaller];
    [v11 callCompletion:*(void *)(a1 + 56) error:0];
  }
}

- (void)updateAccessForUser:(id)a3 remoteAccess:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  uint64_t v10 = [(HMHome *)self context];
  if (!v9)
  {
    uint64_t v22 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome updateAccessForUser:remoteAccess:completionHandler:]", @"completion"];
    BOOL v23 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v24 = self;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v36 = v26;
      __int16 v37 = 2112;
      uint64_t v38 = (const char *)v22;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];
    objc_exception_throw(v27);
  }
  id v11 = (void *)v10;
  id v12 = [(HMHome *)self context];

  if (!v12)
  {
    id v16 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v36 = v19;
      __int16 v37 = 2080;
      uint64_t v38 = "-[HMHome updateAccessForUser:remoteAccess:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v9[2](v9, v20);
    goto LABEL_9;
  }
  if (!v8)
  {
    id v20 = [v11 delegateCaller];
    uint64_t v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v20 callCompletion:v9 error:v21];

LABEL_9:
    goto LABEL_10;
  }
  v33[0] = @"kUserIDKey";
  v33[1] = @"kUserRemoteAccessInformationKey";
  v34[0] = v8;
  uint64_t v13 = [NSNumber numberWithBool:v6];
  v34[1] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];

  int v15 = [(HMHome *)self uuid];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __61__HMHome_updateAccessForUser_remoteAccess_completionHandler___block_invoke;
  v28[3] = &unk_1E59441B0;
  id v29 = v11;
  __int16 v32 = v9;
  id v30 = self;
  id v31 = v8;
  -[_HMContext sendMessage:target:payload:responseHandler:](v29, @"kUpdateUserAccessRequestKey", v15, v14, v28);

LABEL_10:
}

void __61__HMHome_updateAccessForUser_remoteAccess_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  if (v9)
  {
    id v5 = [*(id *)(a1 + 32) delegateCaller];
    BOOL v6 = v5;
    uint64_t v7 = *(void *)(a1 + 56);
    id v8 = v9;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "__updateHomeAccessControlFromResponsePayload:forUser:", a3, *(void *)(a1 + 48));
    id v5 = [*(id *)(a1 + 32) delegateCaller];
    BOOL v6 = v5;
    uint64_t v7 = *(void *)(a1 + 56);
    id v8 = 0;
  }
  [v5 callCompletion:v7 error:v8];
}

- (void)updateAccessForUser:(id)a3 administrator:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  uint64_t v10 = [(HMHome *)self context];
  if (!v9)
  {
    uint64_t v22 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome updateAccessForUser:administrator:completionHandler:]", @"completion"];
    BOOL v23 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v24 = self;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v36 = v26;
      __int16 v37 = 2112;
      uint64_t v38 = (const char *)v22;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];
    objc_exception_throw(v27);
  }
  id v11 = (void *)v10;
  id v12 = [(HMHome *)self context];

  if (!v12)
  {
    id v16 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v36 = v19;
      __int16 v37 = 2080;
      uint64_t v38 = "-[HMHome updateAccessForUser:administrator:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v9[2](v9, v20);
    goto LABEL_9;
  }
  if (!v8)
  {
    id v20 = [v11 delegateCaller];
    uint64_t v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v20 callCompletion:v9 error:v21];

LABEL_9:
    goto LABEL_10;
  }
  v33[0] = @"kUserIDKey";
  v33[1] = @"kUserAdministratorInformationKey";
  v34[0] = v8;
  uint64_t v13 = [NSNumber numberWithBool:v6];
  v34[1] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];

  int v15 = [(HMHome *)self uuid];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __62__HMHome_updateAccessForUser_administrator_completionHandler___block_invoke;
  v28[3] = &unk_1E59441B0;
  id v29 = v11;
  __int16 v32 = v9;
  id v30 = self;
  id v31 = v8;
  -[_HMContext sendMessage:target:payload:responseHandler:](v29, @"kUpdateUserAccessRequestKey", v15, v14, v28);

LABEL_10:
}

void __62__HMHome_updateAccessForUser_administrator_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  if (v9)
  {
    id v5 = [*(id *)(a1 + 32) delegateCaller];
    BOOL v6 = v5;
    uint64_t v7 = *(void *)(a1 + 56);
    id v8 = v9;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "__updateHomeAccessControlFromResponsePayload:forUser:", a3, *(void *)(a1 + 48));
    id v5 = [*(id *)(a1 + 32) delegateCaller];
    BOOL v6 = v5;
    uint64_t v7 = *(void *)(a1 + 56);
    id v8 = 0;
  }
  [v5 callCompletion:v7 error:v8];
}

- (void)__updateHomeAccessControlFromResponsePayload:(id)a3 forUser:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMHome *)self _findUserWithID:v7];
  id v9 = (void *)v8;
  if (v6 && v8)
  {
    uint64_t v10 = objc_msgSend(v6, "hmf_numberForKey:", @"kUserAdministratorInformationKey");
    if (v10)
    {
      id v11 = [v9 homeAccessControl];
      objc_msgSend(v11, "setAdministrator:", objc_msgSend(v10, "BOOLValue"));
    }
    id v12 = objc_msgSend(v6, "hmf_numberForKey:", @"kUserRemoteAccessInformationKey");

    if (v12)
    {
      uint64_t v13 = [v9 homeAccessControl];
      objc_msgSend(v13, "setRemoteAccessAllowed:", objc_msgSend(v12, "BOOLValue"));
    }
    id v14 = objc_msgSend(v6, "hmf_numberForKey:", @"kUserCamerasAccessLevelInformationKey");

    if (v14)
    {
      int v15 = [v9 homeAccessControl];
      id v16 = +[HMUserCameraAccess accessWithNumber:v14];
      [v15 setCamerasAccess:v16];
    }
    __int16 v17 = objc_msgSend(v6, "hmf_numberForKey:", @"HMHomeUserAnnounceAccessInformationKey");

    if (v17)
    {
      id v18 = [v9 homeAccessControl];
      objc_msgSend(v18, "setAnnounceAccessAllowed:", objc_msgSend(v17, "BOOLValue"));
    }
    uint64_t v19 = objc_msgSend(v6, "hmf_numberForKey:", @"HMHomeAudioAnalysisDropInAccessLevelInformationKey");

    if (v19)
    {
      id v20 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v21 = self;
      uint64_t v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        BOOL v23 = HMFGetLogIdentifier();
        uint64_t v24 = [v9 uuid];
        int v26 = 138543874;
        id v27 = v23;
        __int16 v28 = 2112;
        id v29 = v19;
        __int16 v30 = 2112;
        id v31 = v24;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_INFO, "%{public}@Updated audio analysis drop in access: %@ for userID: %@", (uint8_t *)&v26, 0x20u);
      }
      id v25 = [v9 homeAccessControl];
      objc_msgSend(v25, "setAudioAnalysisUserDropInAccessLevel:", objc_msgSend(v19, "unsignedIntegerValue"));
    }
  }
}

- (void)_handleAccessoryErrorNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uuidForKey:@"kAccessoryUUID"];
  id v6 = [(HMHome *)self currentAccessories];
  id v7 = [v6 firstItemWithUUID:v5];

  if (v7)
  {
    uint64_t v8 = [v4 errorForKey:@"error"];
    if (v8)
    {
      id v9 = [(HMHome *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v10 = [(HMHome *)self context];
        id v11 = [v10 delegateCaller];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __44__HMHome__handleAccessoryErrorNotification___block_invoke;
        v12[3] = &unk_1E5944F20;
        id v13 = v9;
        id v14 = self;
        id v15 = v8;
        id v16 = v7;
        [v11 invokeBlock:v12];
      }
    }
  }
}

uint64_t __44__HMHome__handleAccessoryErrorNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didEncounterError:*(void *)(a1 + 48) forAccessory:*(void *)(a1 + 56)];
}

- (id)_findUserWithID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMHome *)self currentUsers];
  id v6 = [v5 firstItemWithValue:v4 forKey:@"userID"];

  if (!v6)
  {
    id v7 = [(HMHome *)self currentUser];
    uint64_t v8 = [v7 userID];
    int v9 = [v8 isEqualToString:v4];

    if (v9)
    {
      id v6 = [(HMHome *)self currentUser];
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x19F3A64A0]();
      id v11 = self;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = HMFGetLogIdentifier();
        int v15 = 138543618;
        id v16 = v13;
        __int16 v17 = 2112;
        id v18 = v4;
        _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot find the user with ID %@", (uint8_t *)&v15, 0x16u);
      }
      id v6 = 0;
    }
  }

  return v6;
}

- (void)_handleUserAddedNotification:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMHome *)self context];
  id v6 = [v5 pendingRequests];

  id v7 = [v4 identifier];
  uint64_t v8 = [v6 removeCompletionBlockForIdentifier:v7];

  int v9 = [v4 uuidForKey:@"kUserUUIDKey"];
  uint64_t v10 = [v4 stringForKey:@"kUserIDKey"];
  id v11 = [v4 stringForKey:@"kUserDisplayNameKey"];
  if (v11 && v9)
  {
    int v26 = v10;
    id v12 = [(HMHome *)self currentUsers];
    uint64_t v13 = [v12 firstItemWithUUID:v9];

    id v14 = (HMUser *)v13;
    if (v13)
    {
      if (v8)
      {
LABEL_5:
        id v15 = [(HMHome *)self context];
        id v16 = [v15 delegateCaller];
        [v16 callCompletion:v8 user:v14 error:0];

LABEL_12:
        uint64_t v10 = v26;
        goto LABEL_13;
      }
    }
    else
    {
      id v14 = [[HMUser alloc] initWithUserID:v26 name:v11 uuid:v9 home:self];
      __int16 v17 = [(HMHome *)self context];
      [(HMUser *)v14 __configureWithContext:v17 home:self];

      context = (void *)MEMORY[0x19F3A64A0]();
      id v18 = self;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v31 = v24;
        _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@Adding user via notification", buf, 0xCu);
      }
      id v20 = [(HMHome *)v18 currentUsers];
      [v20 addObject:v14];

      if (v8) {
        goto LABEL_5;
      }
    }
    id v15 = [(HMHome *)self delegate];
    char v21 = objc_opt_respondsToSelector();
    if (!v13 && (v21 & 1) != 0)
    {
      uint64_t v22 = [(HMHome *)self context];
      BOOL v23 = [v22 delegateCaller];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __39__HMHome__handleUserAddedNotification___block_invoke;
      v27[3] = &unk_1E5945650;
      void v27[4] = self;
      __int16 v28 = v14;
      id v15 = v15;
      id v29 = v15;
      [v23 invokeBlock:v27];
    }
    goto LABEL_12;
  }
LABEL_13:
}

uint64_t __39__HMHome__handleUserAddedNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    int v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didAddUser on notification : %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) home:*(void *)(a1 + 32) didAddUser:*(void *)(a1 + 40)];
}

- (void)_handleUserInvitationsUpdatedNotification:(id)a3
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMHome *)self context];
  uint64_t v6 = [v5 pendingRequests];

  id v7 = [v4 identifier];
  uint64_t v74 = v6;
  uint64_t v76 = [v6 removeCompletionBlockForIdentifier:v7];

  v77 = v4;
  __int16 v73 = [v4 dataForKey:@"kInvitationsDataKey"];
  uint64_t v86 = self;
  int v8 = +[HMOutgoingHomeInvitation homeInvitationsFromEncodedData:home:](HMOutgoingHomeInvitation, "homeInvitationsFromEncodedData:home:");
  int v9 = (void *)[v8 mutableCopy];

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  uint64_t v79 = v9;
  __int16 v10 = (void *)[v9 copy];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v104 objects:v116 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v105;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v105 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v104 + 1) + 8 * i);
        uint64_t v16 = [v15 invitationState];
        __int16 v17 = [(HMHome *)v86 currentOutgoingInvitations];
        id v18 = [v15 identifier];
        uint64_t v19 = [v17 firstItemWithValue:v18 forKey:@"identifier"];

        if (v19)
        {
          if ((v16 & 0xFFFFFFFFFFFFFFFDLL) == 1)
          {
            id v20 = [(HMHome *)v86 currentOutgoingInvitations];
            [v20 removeObject:v19];
          }
          [v19 _updateInvitationState:v16];
          [v9 removeObject:v15];
          [v9 addObject:v19];
        }
        else if (v16 == 2)
        {
          char v21 = [(HMHome *)v86 context];
          objc_msgSend(v15, "__configureWithContext:home:", v21, v86);

          uint64_t v22 = [(HMHome *)v86 currentOutgoingInvitations];
          [v22 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v104 objects:v116 count:16];
    }
    while (v12);
  }

  uint64_t v23 = [v77 dataForKey:@"kAccessoryInvitationsDataKey"];
  uint64_t v24 = (void *)MEMORY[0x1E4F28DC0];
  id v25 = (void *)MEMORY[0x1E4F1CAD0];
  v115[0] = objc_opt_class();
  v115[1] = objc_opt_class();
  v115[2] = objc_opt_class();
  v115[3] = objc_opt_class();
  int v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:4];
  id v27 = [v25 setWithArray:v26];
  id v103 = 0;
  uint64_t v72 = (void *)v23;
  __int16 v28 = [v24 unarchivedObjectOfClasses:v27 fromData:v23 error:&v103];
  id v75 = v103;

  if (!v28)
  {
    id v29 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v30 = v86;
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v112 = v32;
      __int16 v113 = 2112;
      id v114 = v75;
      _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory invitations data from encoded accessory invitation data: %@", buf, 0x16u);
    }
  }
  id v33 = v28;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v34 = v33;
  }
  else {
    id v34 = 0;
  }
  id v35 = v34;
  id v71 = v33;

  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id obj = v35;
  uint64_t v81 = [obj countByEnumeratingWithState:&v99 objects:v110 count:16];
  if (v81)
  {
    uint64_t v80 = *(void *)v100;
    do
    {
      for (uint64_t j = 0; j != v81; ++j)
      {
        if (*(void *)v100 != v80) {
          objc_enumerationMutation(obj);
        }
        __int16 v37 = *(void **)(*((void *)&v99 + 1) + 8 * j);
        uint64_t v38 = objc_msgSend(v37, "hmf_UUIDForKey:", @"kInvitationIdentifierKey", v71);
        uint64_t v39 = [(HMHome *)v86 outgoingInvitations];
        id v40 = objc_msgSend(v39, "hmf_firstObjectWithValue:forKeyPath:", v38, @"identifier");

        if (v40)
        {
          uint64_t v82 = v40;
          unint64_t v83 = v38;
          uint64_t v84 = j;
          uint64_t v41 = objc_msgSend(v37, "hmf_arrayForKey:", @"kAccessoryInvitationsKey");
          id v42 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v41, "count"));
          long long v95 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          id v43 = v41;
          uint64_t v44 = [v43 countByEnumeratingWithState:&v95 objects:v109 count:16];
          if (v44)
          {
            uint64_t v45 = v44;
            uint64_t v46 = *(void *)v96;
            do
            {
              for (uint64_t k = 0; k != v45; ++k)
              {
                if (*(void *)v96 != v46) {
                  objc_enumerationMutation(v43);
                }
                uint64_t v48 = *(void **)(*((void *)&v95 + 1) + 8 * k);
                __int16 v49 = objc_msgSend(v48, "hmf_UUIDForKey:", @"HM.accessoryInvitationIdentifier");
                __int16 v50 = objc_msgSend(v48, "hmf_numberForKey:", @"HM.accessoryInvitationState");
                uint64_t v51 = objc_msgSend(v48, "hmf_UUIDForKey:", @"HM.accessoryInvitationAccessoryUUID");
                uint64_t v52 = [(HMHome *)v86 accessories];
                uint64_t v53 = objc_msgSend(v52, "hmf_firstObjectWithUUID:", v51);

                if (v53)
                {
                  id v54 = -[HMAccessoryInvitation initWithAccessory:identifier:state:]([HMAccessoryInvitation alloc], "initWithAccessory:identifier:state:", v53, v49, [v50 integerValue]);
                  if (v54) {
                    [v42 addObject:v54];
                  }
                }
              }
              uint64_t v45 = [v43 countByEnumeratingWithState:&v95 objects:v109 count:16];
            }
            while (v45);
          }

          id v40 = v82;
          [v82 _mergeWithNewAccessoryInvitations:v42];

          uint64_t v38 = v83;
          uint64_t j = v84;
        }
      }
      uint64_t v81 = [obj countByEnumeratingWithState:&v99 objects:v110 count:16];
    }
    while (v81);
  }

  uint64_t v55 = (void *)v76;
  if (v76)
  {
    if (v79)
    {
      SEL v56 = 0;
    }
    else
    {
      SEL v56 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:52 userInfo:0];
    }
    id v67 = [(HMHome *)v86 context];
    v70 = [v67 delegateCaller];
    [v70 callCompletion:v76 invitations:v79 error:v56];
    goto LABEL_60;
  }
  id v85 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v79, "count"));
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v57 = v79;
  uint64_t v58 = [v57 countByEnumeratingWithState:&v91 objects:v108 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v92;
    do
    {
      for (uint64_t m = 0; m != v59; ++m)
      {
        if (*(void *)v92 != v60) {
          objc_enumerationMutation(v57);
        }
        long long v62 = *(void **)(*((void *)&v91 + 1) + 8 * m);
        long long v63 = objc_msgSend(v62, "invitee", v71);
        long long v64 = [(HMHome *)v86 users];
        long long v65 = [v63 userID];
        unsigned __int8 v66 = objc_msgSend(v64, "hmf_firstObjectWithValue:forKeyPath:", v65, @"userID");

        if (v66) {
          [v66 mergePendingAccessoryInvitationsWithOutgoingInvitation:v62];
        }
        else {
          [v85 addObject:v62];
        }
      }
      uint64_t v59 = [v57 countByEnumeratingWithState:&v91 objects:v108 count:16];
    }
    while (v59);
  }

  SEL v56 = v85;
  if (![v85 count])
  {
    uint64_t v55 = 0;
    goto LABEL_62;
  }
  id v67 = [(HMHome *)v86 _privateDelegate];
  uint64_t v55 = 0;
  if ([v57 count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v68 = [(HMHome *)v86 context];
    v69 = [v68 delegateCaller];
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __52__HMHome__handleUserInvitationsUpdatedNotification___block_invoke;
    v87[3] = &unk_1E5945650;
    id v67 = v67;
    id v88 = v67;
    uint64_t v89 = v86;
    id v90 = v57;
    [v69 invokeBlock:v87];

    v70 = v88;
LABEL_60:
  }
LABEL_62:
}

uint64_t __52__HMHome__handleUserInvitationsUpdatedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateStateForOutgoingInvitations:*(void *)(a1 + 48)];
}

- (void)_notifyUpdatedSupportedFeatures
{
  id v3 = [(HMHome *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(HMHome *)self context];
    id v5 = [v4 delegateCaller];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__HMHome__notifyUpdatedSupportedFeatures__block_invoke;
    v6[3] = &unk_1E5945628;
    id v7 = v3;
    int v8 = self;
    [v5 invokeBlock:v6];
  }
}

uint64_t __41__HMHome__notifyUpdatedSupportedFeatures__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeDidUpdateSupportedFeatures:*(void *)(a1 + 40)];
}

- (void)_handleAccessoryReprovisionedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uuidForKey:@"kAccessoryUUID"];
  uint64_t v6 = [(HMHome *)self currentAccessories];
  id v7 = [v6 firstItemWithUUID:v5];

  if (v7)
  {
    [v7 setAccessoryReprovisionState:0];
    int v8 = [v4 errorForKey:@"kPairedAccessoryErrorDataKey"];
    int v9 = [(HMHome *)self context];
    __int16 v10 = [v9 pendingRequests];

    uint64_t v11 = [v4 identifier];
    uint64_t v12 = [v10 removeCompletionBlockForIdentifier:v11];

    if (v12)
    {
      uint64_t v13 = [(HMHome *)self context];
      id v14 = [v13 delegateCaller];
      [v14 callCompletion:v12 error:v8];
    }
    id v15 = [(HMHome *)self delegate];
    if ([v15 conformsToProtocol:&unk_1EEF70488]) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
    id v17 = v16;

    if (objc_opt_respondsToSelector())
    {
      id v18 = [(HMHome *)self context];
      uint64_t v19 = [v18 delegateCaller];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __52__HMHome__handleAccessoryReprovisionedNotification___block_invoke;
      v20[3] = &unk_1E5945650;
      id v21 = v17;
      uint64_t v22 = self;
      id v23 = v7;
      [v19 invokeBlock:v20];
    }
  }
}

uint64_t __52__HMHome__handleAccessoryReprovisionedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateReprovisionStateForAccessory:*(void *)(a1 + 48)];
}

- (void)_reprovisionAccessory:(id)a3 completionHandler:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMHome *)self context];
  if (v8)
  {
    if (v6)
    {
      uint64_t v38 = @"kAccessoryUUID";
      int v9 = [v6 uuid];
      __int16 v10 = [v9 UUIDString];
      uint64_t v39 = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];

      id v12 = objc_alloc(MEMORY[0x1E4F654B0]);
      id v13 = objc_alloc(MEMORY[0x1E4F65488]);
      id v14 = [(HMHome *)self uuid];
      id v15 = (void *)[v13 initWithTarget:v14];
      uint64_t v16 = (void *)[v12 initWithName:@"kReprovisionAccessoryRequestKey" destination:v15 payload:v11];

      id v17 = [(HMHome *)self context];
      id v18 = [v17 pendingRequests];

      uint64_t v19 = [v16 identifier];
      id v20 = _Block_copy(v7);
      [v18 addCompletionBlock:v20 forIdentifier:v19];

      uint64_t v30 = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      uint64_t v32 = __50__HMHome__reprovisionAccessory_completionHandler___block_invoke;
      id v33 = &unk_1E59441B0;
      id v34 = v18;
      id v35 = v19;
      __int16 v36 = self;
      id v37 = v7;
      id v21 = v19;
      id v22 = v18;
      [v16 setResponseHandler:&v30];
      id v23 = objc_msgSend(v8, "messageDispatcher", v30, v31, v32, v33);
      [v23 sendMessage:v16];
    }
    else
    {
      uint64_t v11 = [(HMHome *)self context];
      __int16 v28 = [v11 delegateCaller];
      id v29 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v28 callCompletion:v7 error:v29];
    }
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x19F3A64A0]();
    id v25 = self;
    int v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v27;
      __int16 v42 = 2080;
      id v43 = "-[HMHome _reprovisionAccessory:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __50__HMHome__reprovisionAccessory_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v7 = v3;
    id v4 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
    if (v4)
    {
      id v5 = [*(id *)(a1 + 48) context];
      id v6 = [v5 delegateCaller];
      [v6 callCompletion:*(void *)(a1 + 56) error:v7];
    }
    id v3 = v7;
  }
}

- (void)reprovisionAccessory:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome reprovisionAccessory:completionHandler:]", @"completion"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v26 = v20;
      __int16 v27 = 2112;
      __int16 v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  int v9 = v8;
  if (v8)
  {
    __int16 v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__HMHome_reprovisionAccessory_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v26 = v14;
      __int16 v27 = 2080;
      __int16 v28 = "-[HMHome reprovisionAccessory:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __49__HMHome_reprovisionAccessory_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reprovisionAccessory:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_handleAccessoryReprovisionStateUpdate:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 uuidForKey:@"kAccessoryUUID"];
  id v6 = [(HMHome *)self currentAccessories];
  id v7 = [v6 firstItemWithUUID:v5];

  if (v7)
  {
    int v8 = [v4 numberForKey:@"kAccessoryReprovisonStateKey"];
    int v9 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = HMFGetLogIdentifier();
      uint64_t v13 = [v8 integerValue];
      id v14 = [v7 name];
      *(_DWORD *)buf = 138543874;
      id v25 = v12;
      __int16 v26 = 2048;
      uint64_t v27 = v13;
      __int16 v28 = 2112;
      uint64_t v29 = v14;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Updating the reprovision state to: %lu for accessory: %@", buf, 0x20u);
    }
    objc_msgSend(v7, "setAccessoryReprovisionState:", objc_msgSend(v8, "integerValue"));
    id v15 = [(HMHome *)v10 delegate];
    if ([v15 conformsToProtocol:&unk_1EEF70488]) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
    id v17 = v16;

    if (objc_opt_respondsToSelector())
    {
      id v18 = [(HMHome *)v10 context];
      uint64_t v19 = [v18 delegateCaller];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __49__HMHome__handleAccessoryReprovisionStateUpdate___block_invoke;
      v20[3] = &unk_1E5945650;
      id v21 = v17;
      id v22 = v10;
      id v23 = v7;
      [v19 invokeBlock:v20];
    }
  }
}

uint64_t __49__HMHome__handleAccessoryReprovisionStateUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateReprovisionStateForAccessory:*(void *)(a1 + 48)];
}

- (void)startSearchForAccessoriesNeedingReprovisioning
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMHome *)self context];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F65480];
    id v5 = objc_alloc(MEMORY[0x1E4F65488]);
    id v6 = [(HMHome *)self uuid];
    id v7 = (void *)[v5 initWithTarget:v6];
    id v15 = @"kStartSearch";
    uint64_t v16 = MEMORY[0x1E4F1CC38];
    int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    int v9 = [v4 messageWithName:@"kSearchForAccessoriesNeedingReprovisioningRequestKey" destination:v7 payload:v8];

    __int16 v10 = [v3 messageDispatcher];
    [v10 sendMessage:v9];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v18 = v14;
      __int16 v19 = 2080;
      id v20 = "-[HMHome startSearchForAccessoriesNeedingReprovisioning]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

- (id)_findCharacteristic:(id)a3 forService:(id)a4 accessoryUUID:(id)a5
{
  id v5 = 0;
  if (a3 && a4 && a5)
  {
    id v9 = a3;
    __int16 v10 = [(HMHome *)self _findService:a4 accessoryUUID:a5];
    id v5 = [v10 _findCharacteristic:v9];
  }

  return v5;
}

- (id)_findService:(id)a3 accessoryUUID:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  id v9 = 0;
  if (v6 && v7)
  {
    __int16 v10 = [(HMHome *)self accessoryWithUUID:v7];
    uint64_t v11 = v10;
    if (v10)
    {
      id v9 = [v10 _findService:v6];
    }
    else
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v12 = [(HMHome *)self accessories];
      uint64_t v27 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v27)
      {
        uint64_t v13 = *(void *)v35;
        uint64_t v29 = v12;
        uint64_t v26 = *(void *)v35;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v35 != v13) {
              objc_enumerationMutation(v12);
            }
            uint64_t v28 = v14;
            id v15 = *(void **)(*((void *)&v34 + 1) + 8 * v14);
            long long v30 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            uint64_t v16 = [v15 services];
            uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v31;
              do
              {
                for (uint64_t i = 0; i != v18; ++i)
                {
                  if (*(void *)v31 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v21 = *(void **)(*((void *)&v30 + 1) + 8 * i);
                  id v22 = [v21 instanceID];
                  if ([v6 isEqualToNumber:v22])
                  {
                    id v23 = [v21 accessoryUUID];
                    char v24 = [v8 isEqual:v23];

                    if (v24)
                    {
                      id v9 = v21;

                      uint64_t v11 = 0;
                      goto LABEL_24;
                    }
                  }
                  else
                  {
                  }
                }
                uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
              }
              while (v18);
            }

            uint64_t v14 = v28 + 1;
            id v12 = v29;
            uint64_t v11 = 0;
            uint64_t v13 = v26;
          }
          while (v28 + 1 != v27);
          uint64_t v27 = [v29 countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v27);
      }

      id v9 = 0;
    }
LABEL_24:
  }

  return v9;
}

- (void)_removeServices:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(HMHome *)self serviceGroups];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) _removeServices:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)removeServices:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMHome *)self context];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __25__HMHome_removeServices___block_invoke;
    v12[3] = &unk_1E5945628;
    void v12[4] = self;
    id v13 = v4;
    dispatch_async(v7, v12);
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v9 = self;
    long long v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      long long v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      uint64_t v17 = "-[HMHome removeServices:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __25__HMHome_removeServices___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeServices:*(void *)(a1 + 40)];
}

- (void)_removeResidentDevicesForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [v4 device];

  if (v5)
  {
    uint64_t v6 = [(HMHome *)self autoSelectedPreferredResidents];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__HMHome__removeResidentDevicesForAccessory___block_invoke;
    v11[3] = &unk_1E59413D0;
    id v12 = v4;
    uint64_t v7 = [v6 indexesOfObjectsPassingTest:v11];

    if ([v7 count])
    {
      uint64_t v8 = [(HMHome *)self autoSelectedPreferredResidents];
      uint64_t v9 = (void *)[v8 mutableCopy];

      [v9 removeObjectsAtIndexes:v7];
      long long v10 = (void *)[v9 copy];
      [(HMHome *)self setAutoSelectedPreferredResidents:v10];
    }
  }
}

uint64_t __45__HMHome__removeResidentDevicesForAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 device];
  id v5 = [*(id *)(a1 + 32) device];
  uint64_t v6 = [v4 isEqual:v5];

  if (v6) {
    [v3 _unconfigure];
  }

  return v6;
}

- (void)_removeEventsForAccessory:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(HMHome *)self currentTriggers];
  uint64_t v6 = [v5 array];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v14 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v12 = v11;
        }
        else {
          id v12 = 0;
        }
        id v13 = v12;

        if (v13) {
          [v13 _removeEventsForAccessory:v4];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)_removeActionSetsForAccessory:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(HMHome *)self currentActionSets];
  uint64_t v6 = [v5 array];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) _removeActionsForAccessory:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_handleAccessoryRemovedResponse:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  objc_msgSend(v21, "hmf_arrayForKey:", @"kAccessoriesListKey");
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    uint64_t v7 = @"kAccessoryUUID";
    id v22 = self;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "hmf_UUIDForKey:", v7);
        uint64_t v10 = [(HMHome *)self currentAccessories];
        long long v11 = [v10 firstItemWithUUID:v9];

        if (v11)
        {
          long long v12 = (void *)MEMORY[0x19F3A64A0]();
          long long v13 = self;
          long long v14 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            uint64_t v15 = v5;
            uint64_t v16 = v6;
            v18 = long long v17 = v7;
            *(_DWORD *)buf = 138543618;
            uint64_t v29 = v18;
            __int16 v30 = 2112;
            long long v31 = v11;
            _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Removed accessory: %@", buf, 0x16u);

            uint64_t v7 = v17;
            uint64_t v6 = v16;
            uint64_t v5 = v15;
            self = v22;
          }

          uint64_t v19 = [v11 services];
          [(HMHome *)v13 _removeServices:v19];

          [(HMHome *)v13 _removeActionSetsForAccessory:v11];
          [(HMHome *)v13 _removeEventsForAccessory:v11];
          [(HMHome *)v13 _removeResidentDevicesForAccessory:v11];
          id v20 = [(HMHome *)v13 currentAccessories];
          [v20 removeObject:v11];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v5);
  }
}

- (void)_handleAddAccessoryProgressNotification:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMHome *)self context];
  uint64_t v6 = [v5 pendingRequests];

  uint64_t v7 = [v4 identifier];
  uint64_t v8 = [v6 retrieveAccessoryDescriptionForIdentifier:v7];

  if (v8)
  {
    uint64_t v9 = [v4 identifier];
    uint64_t v10 = [v6 retrieveProgressBlockForIdentifier:v9];

LABEL_4:
    if (v10)
    {
      long long v17 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v18 = self;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        id v20 = HMFGetLogIdentifier();
        int v31 = 138543618;
        long long v32 = v20;
        __int16 v33 = 2112;
        uint64_t v34 = v8;
        _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Invoking progress handler block for add accessory progress notification with accessoryDescription %@", (uint8_t *)&v31, 0x16u);
      }
      [(HMHome *)v18 _callProgressHandler:v10 updatingAccessoryDescription:v8 fromMessage:v4];
    }
    else
    {
      uint64_t v10 = [v4 numberForKey:@"kAccessorySetupProgressKey"];
      unint64_t v21 = [v10 unsignedIntegerValue];
      id v22 = (void *)MEMORY[0x19F3A64A0]();
      id v23 = self;
      long long v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        long long v25 = HMFGetLogIdentifier();
        long long v26 = HMSetupAccessoryProgressAsString(v21);
        int v31 = 138543618;
        long long v32 = v25;
        __int16 v33 = 2112;
        uint64_t v34 = (uint64_t)v26;
        _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_INFO, "%{public}@No progress handler block for add accessory progress notification with progress '%@'", (uint8_t *)&v31, 0x16u);
      }
    }

    uint64_t v10 = (void *)v8;
    goto LABEL_12;
  }
  long long v11 = [v4 messagePayload];
  long long v12 = objc_msgSend(v11, "hmf_UUIDForKey:", @"kAccessoryUUID");

  long long v13 = [(HMHome *)self context];
  long long v14 = [v13 pendingRequests];
  uint64_t v8 = [v14 retrieveAccessoryDescriptionForIdentifier:v12];

  uint64_t v15 = [(HMHome *)self context];
  uint64_t v16 = [v15 pendingRequests];
  uint64_t v10 = [v16 retrieveProgressBlockForIdentifier:v12];

  if (v8) {
    goto LABEL_4;
  }
  long long v27 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v28 = self;
  uint64_t v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    __int16 v30 = HMFGetLogIdentifier();
    int v31 = 138543362;
    long long v32 = v30;
    _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_INFO, "%{public}@No accessory description for add accessory progress notification", (uint8_t *)&v31, 0xCu);
  }
LABEL_12:
}

- (void)_callProgressHandler:(id)a3 updatingAccessoryDescription:(id)a4 fromMessage:(id)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v9 stringForKey:@"kAccessoryName"];
  if (v10) {
    [v8 setAccessoryName:v10];
  }
  long long v11 = [v9 messagePayload];
  long long v12 = objc_msgSend(v11, "hmf_UUIDForKey:", @"kAccessoryUUID");

  long long v13 = [v8 accessoryUUID];

  if (!v13 && v12) {
    [v8 setAccessoryUUID:v12];
  }
  uint64_t v14 = [v9 stringForKey:@"kAccessoryInfoManufacturerKey"];
  if (v14) {
    [v8 setManufacturerName:v14];
  }
  uint64_t v15 = [v9 dataForKey:@"kAccessoryCategory"];
  SEL v56 = (void *)v14;
  id v57 = v15;
  if (v15)
  {
    id v63 = 0;
    uint64_t v16 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v15 error:&v63];
    id v17 = v63;
    if (v16)
    {
      [v8 setCategory:v16];
    }
    else
    {
      uint64_t v18 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v51 = self;
      uint64_t v19 = self;
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        unint64_t v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v65 = v21;
        __int16 v66 = 2112;
        id v67 = v17;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory category from category data: %@", buf, 0x16u);

        uint64_t v15 = v57;
      }

      self = v51;
    }
  }
  id v22 = [v9 messagePayload];
  id v23 = objc_msgSend(v22, "hmf_numberForKey:", @"kAccessoryCertificationStatusKey");

  if (v23) {
    objc_msgSend(v8, "setCertificationStatus:", objc_msgSend(v23, "unsignedIntegerValue"));
  }
  uint64_t v55 = v23;
  long long v24 = [v9 stringForKey:@"kAccessoryVendorInfoStoreIDKey"];
  uint64_t v25 = [v9 stringForKey:@"kAccessoryVendorInfoBundleIDKey"];
  long long v26 = (void *)v25;
  if (v24 && v25)
  {
    [v8 setStoreID:v24];
    [v8 setBundleID:v26];
  }
  id v54 = v26;
  long long v27 = [v9 uuidForKey:@"HMHomeReplacedAccessoryUUIDMessageKey"];
  if (v27)
  {
    uint64_t v28 = [(HMHome *)self accessoryWithUUID:v27];
    uint64_t v29 = (void *)v28;
    if (v28) {
      uint64_t v28 = [v8 setAccessoryBeingReplaced:v28];
    }
    __int16 v30 = (void *)MEMORY[0x19F3A64A0](v28);
    uint64_t v52 = self;
    int v31 = self;
    long long v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      __int16 v33 = v46 = v10;
      [v29 name];
      v34 = __int16 v49 = v24;
      [v27 UUIDString];
      v35 = id v47 = v12;
      *(_DWORD *)buf = 138543874;
      long long v65 = v33;
      __int16 v66 = 2112;
      id v67 = v34;
      __int16 v68 = 2112;
      id v69 = v35;
      _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_INFO, "%{public}@Progress handler to request user consent for replacing accessory %@/%@", buf, 0x20u);

      long long v24 = v49;
      long long v12 = v47;

      uint64_t v10 = v46;
    }

    uint64_t v15 = v57;
    self = v52;
  }
  long long v36 = [v9 numberForKey:@"kAccessorySetupProgressKey"];
  long long v37 = v36;
  if (v58 && v36)
  {
    __int16 v50 = v24;
    unint64_t v53 = [v36 unsignedIntegerValue];
    uint64_t v38 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v39 = self;
    uint64_t v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      uint64_t v41 = HMFGetLogIdentifier();
      HMSetupAccessoryProgressAsString(v53);
      uint64_t v48 = v12;
      id v43 = v42 = v10;
      *(_DWORD *)buf = 138543874;
      long long v65 = v41;
      __int16 v66 = 2112;
      id v67 = v43;
      __int16 v68 = 2112;
      id v69 = v8;
      _os_log_impl(&dword_19D1A8000, v40, OS_LOG_TYPE_INFO, "%{public}@Calling Progress handler with progress '%@' with description: %@", buf, 0x20u);

      uint64_t v10 = v42;
      long long v12 = v48;
    }
    uint64_t v44 = [(HMHome *)v39 context];
    uint64_t v45 = [v44 delegateCaller];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __72__HMHome__callProgressHandler_updatingAccessoryDescription_fromMessage___block_invoke;
    v59[3] = &unk_1E5944C10;
    id v61 = v58;
    id v60 = v8;
    unint64_t v62 = v53;
    [v45 invokeBlock:v59];

    uint64_t v15 = v57;
    long long v24 = v50;
  }
}

uint64_t __72__HMHome__callProgressHandler_updatingAccessoryDescription_fromMessage___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

- (void)_handleAccessoryAddedNotification:(id)a3
{
  uint64_t v173 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 shortDescription];
    *(_DWORD *)buf = 138543618;
    v163 = v8;
    __int16 v164 = 2112;
    uint64_t v165 = (uint64_t)v9;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling accessory added message: %@", buf, 0x16u);
  }
  uint64_t v10 = [(HMHome *)v6 context];
  long long v11 = [v10 pendingRequests];

  long long v12 = [v4 identifier];
  long long v13 = [v11 removeCompletionBlockForIdentifier:v12];

  uint64_t v14 = [v4 identifier];
  uint64_t v140 = [v11 removeAccessoryForIdentifier:v14];

  uint64_t v15 = [v4 identifier];
  uint64_t v130 = [v11 removeAccessoryDescriptionForIdentifier:v15];

  uint64_t v16 = [v4 identifier];
  long long v127 = v11;
  id v17 = (id)[v11 removeProgressBlockForIdentifier:v16];

  uint64_t v18 = [v4 arrayForKey:@"kAccessoriesListKey"];
  if (!v18)
  {
    long long v93 = 0;
    long long v94 = (void *)MEMORY[0x19F3A64A0]();
    long long v95 = v6;
    long long v96 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      long long v97 = HMFGetLogIdentifier();
      long long v98 = [v4 shortDescription];
      *(_DWORD *)buf = 138543618;
      v163 = v97;
      __int16 v164 = 2112;
      uint64_t v165 = (uint64_t)v98;
      _os_log_impl(&dword_19D1A8000, v96, OS_LOG_TYPE_ERROR, "%{public}@Received accessory added message with no accessories list: %@", buf, 0x16u);
    }
    long long v99 = v127;
    goto LABEL_90;
  }
  uint64_t v133 = v13;
  id v126 = v4;
  long long v132 = [MEMORY[0x1E4F1CA48] array];
  long long v158 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  uint64_t v125 = v18;
  id obj = v18;
  uint64_t v19 = [obj countByEnumeratingWithState:&v158 objects:v172 count:16];
  v145 = v6;
  if (!v19) {
    goto LABEL_53;
  }
  uint64_t v20 = v19;
  if (v140 | v130) {
    BOOL v21 = v13 == 0;
  }
  else {
    BOOL v21 = 1;
  }
  uint64_t v138 = *(void *)v159;
  uint64_t v135 = *MEMORY[0x1E4F284E8];
  int v22 = !v21;
  int v131 = v22;
  do
  {
    uint64_t v23 = 0;
    uint64_t v134 = v20;
    do
    {
      if (*(void *)v159 != v138) {
        objc_enumerationMutation(obj);
      }
      long long v24 = *(void **)(*((void *)&v158 + 1) + 8 * v23);
      uint64_t v25 = objc_msgSend(v24, "hmf_UUIDForKey:", @"kAccessoryUUID", v125);
      uint64_t v26 = objc_msgSend(v24, "hmf_dataForKey:", @"kAccessoryDataKey");
      long long v27 = (void *)v26;
      if (v25) {
        BOOL v28 = v26 == 0;
      }
      else {
        BOOL v28 = 1;
      }
      if (!v28)
      {
        unint64_t v143 = [(HMHome *)v6 accessoryWithUUID:v25];
        id v33 = objc_alloc(MEMORY[0x1E4F28DC0]);
        id v157 = 0;
        uint64_t v34 = (void *)[v33 initForReadingFromData:v27 error:&v157];
        id v35 = v157;
        [v34 _allowDecodingCyclesInSecureMode];
        uint64_t v36 = objc_opt_class();
        id v156 = v35;
        long long v37 = [v34 decodeTopLevelObjectOfClass:v36 forKey:v135 error:&v156];
        id v141 = v156;

        if (v37)
        {
          id v38 = v37;
          uint64_t v39 = [(id)v140 uuid];
          uint64_t v40 = [v38 uuid];
          int v41 = [v39 isEqual:v40];

          if (v41)
          {
            __int16 v42 = (void *)MEMORY[0x19F3A64A0]();
            id v43 = v145;
            uint64_t v44 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              uint64_t v45 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v163 = v45;
              __int16 v164 = 2112;
              uint64_t v165 = v140;
              _os_log_impl(&dword_19D1A8000, v44, OS_LOG_TYPE_INFO, "%{public}@Adding queued accessory: %@", buf, 0x16u);
            }
            uint64_t v46 = [(HMHome *)v43 context];
            objc_msgSend((id)v140, "__configureWithContext:home:", v46, v43);

            id v47 = [(HMHome *)v43 currentAccessories];
            [v47 addObject:v140];

            [(id)v140 mergeFromNewObject:v38];
            uint64_t v48 = v38;
            id v38 = (id)v140;
            goto LABEL_28;
          }
          if (v143)
          {
            SEL v56 = (void *)MEMORY[0x19F3A64A0]();
            id v57 = v145;
            id v58 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              uint64_t v59 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v163 = v59;
              __int16 v164 = 2112;
              uint64_t v165 = (uint64_t)v38;
              __int16 v166 = 2112;
              id v167 = v143;
              _os_log_impl(&dword_19D1A8000, v58, OS_LOG_TYPE_INFO, "%{public}@Skipping adding unarchived accessory %@ because the home already has an existing matching accessory: %@", buf, 0x20u);

              uint64_t v20 = v134;
            }

            [v143 mergeFromNewObject:v38];
            uint64_t v48 = v38;
            id v38 = v143;
            goto LABEL_38;
          }
          id v60 = [v38 room];
          id v61 = [v60 uuid];
          uint64_t v48 = [(HMHome *)v145 roomWithUUID:v61];

          if (v48)
          {
            unint64_t v62 = (void *)MEMORY[0x19F3A64A0]([v38 setRoom:v48]);
            id v63 = v145;
            long long v64 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              long long v65 = v128 = v62;
              *(_DWORD *)buf = 138543618;
              v163 = v65;
              __int16 v164 = 2112;
              uint64_t v165 = (uint64_t)v38;
              _os_log_impl(&dword_19D1A8000, v64, OS_LOG_TYPE_INFO, "%{public}@Adding unarchived accessory: %@", buf, 0x16u);

              unint64_t v62 = v128;
            }

            __int16 v66 = [(HMHome *)v63 context];
            objc_msgSend(v38, "__configureWithContext:home:", v66, v63);

            id v67 = [(HMHome *)v63 currentAccessories];
            [v67 addObject:v38];

LABEL_28:
            uint64_t v20 = v134;
LABEL_38:

            [v38 postConfigure];
            [v132 addObject:v38];
LABEL_39:
            uint64_t v6 = v145;
          }
          else
          {
            __int16 v68 = (void *)MEMORY[0x19F3A64A0]();
            id v69 = v145;
            uint64_t v70 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              id v71 = v129 = v68;
              uint64_t v72 = [0 uuid];
              *(_DWORD *)buf = 138543618;
              v163 = v71;
              __int16 v164 = 2112;
              uint64_t v165 = (uint64_t)v72;
              _os_log_impl(&dword_19D1A8000, v70, OS_LOG_TYPE_ERROR, "%{public}@Could not find room with UUID %@ for added accessory", buf, 0x16u);

              __int16 v68 = v129;
            }

            uint64_t v6 = v145;
            uint64_t v20 = v134;
          }
        }
        else
        {
          __int16 v49 = (void *)MEMORY[0x19F3A64A0]();
          __int16 v50 = v6;
          uint64_t v51 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            uint64_t v52 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v163 = v52;
            __int16 v164 = 2112;
            uint64_t v165 = (uint64_t)v141;
            _os_log_impl(&dword_19D1A8000, v51, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory from accessory data: %@", buf, 0x16u);

            uint64_t v20 = v134;
          }

          if (v131)
          {
            id v38 = [MEMORY[0x1E4F28C58] hmErrorWithCode:79];
            unint64_t v53 = [(HMHome *)v50 context];
            id v54 = [v53 delegateCaller];
            uint64_t v55 = v54;
            if (v130)
            {
              [v54 callCompletion:v133 array:0 additionalAccessoryInfo:0 error:v38];
            }
            else
            {
              [v54 callCompletion:v133 error:v38];

              [(HMHome *)v50 removeAccessory:v140 completionHandler:&__block_literal_global_1024];
            }
            goto LABEL_39;
          }
        }

        goto LABEL_42;
      }
      uint64_t v29 = (void *)MEMORY[0x19F3A64A0]();
      __int16 v30 = v6;
      int v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        long long v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v163 = v32;
        __int16 v164 = 2112;
        uint64_t v165 = (uint64_t)v25;
        __int16 v166 = 2112;
        id v167 = v27;
        _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@Received added accessory info with invalid accessoryUUID: %@, accessoryData: %@", buf, 0x20u);
      }
LABEL_42:

      ++v23;
    }
    while (v20 != v23);
    uint64_t v73 = [obj countByEnumeratingWithState:&v158 objects:v172 count:16];
    uint64_t v20 = v73;
  }
  while (v73);
LABEL_53:

  id v144 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v152 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  id v74 = v132;
  uint64_t v75 = [v74 countByEnumeratingWithState:&v152 objects:v171 count:16];
  id v142 = v74;
  if (v75)
  {
    uint64_t v76 = v75;
    uint64_t v77 = *(void *)v153;
    do
    {
      for (uint64_t i = 0; i != v76; ++i)
      {
        if (*(void *)v153 != v77) {
          objc_enumerationMutation(v142);
        }
        uint64_t v79 = *(void **)(*((void *)&v152 + 1) + 8 * i);
        uint64_t v80 = objc_msgSend(v79, "uuid", v125);
        uint64_t v81 = [v80 UUIDString];
        [v144 addObject:v81];

        uint64_t v82 = (void *)MEMORY[0x19F3A64A0]();
        unint64_t v83 = v6;
        uint64_t v84 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          id v85 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v163 = v85;
          __int16 v164 = 2112;
          uint64_t v165 = (uint64_t)v79;
          _os_log_impl(&dword_19D1A8000, v84, OS_LOG_TYPE_DEFAULT, "%{public}@Added accessory: %@", buf, 0x16u);
        }
        uint64_t v6 = v145;
      }
      id v74 = v142;
      uint64_t v76 = [v142 countByEnumeratingWithState:&v152 objects:v171 count:16];
    }
    while (v76);
  }

  long long v13 = v133;
  if (!v140 && v133)
  {
    uint64_t v86 = [HMAccessorySetupCompletedInfo alloc];
    uint64_t v87 = [(HMHome *)v6 uuid];
    id v88 = [v87 UUIDString];
    uint64_t v89 = v144;
    id v90 = [(HMAccessorySetupCompletedInfo *)v86 initWithHomeUUID:v88 addedAccessoryUUIDs:v144];

    long long v91 = [(HMHome *)v6 context];
    long long v92 = [v91 delegateCaller];
    [v92 callCompletion:v133 array:v74 additionalAccessoryInfo:v90 error:0];

    goto LABEL_88;
  }
  long long v150 = 0u;
  long long v151 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  long long v100 = (HMAccessorySetupCompletedInfo *)v74;
  uint64_t v101 = [(HMAccessorySetupCompletedInfo *)v100 countByEnumeratingWithState:&v148 objects:v170 count:16];
  long long v99 = v127;
  if (v101)
  {
    uint64_t v102 = v101;
    uint64_t v139 = *(void *)v149;
    long long v136 = v100;
    do
    {
      for (uint64_t j = 0; j != v102; ++j)
      {
        if (*(void *)v149 != v139) {
          objc_enumerationMutation(v100);
        }
        long long v104 = *(void **)(*((void *)&v148 + 1) + 8 * j);
        long long v105 = objc_msgSend((id)v140, "uuid", v125);
        long long v106 = [v104 uuid];
        int v107 = [v105 isEqual:v106];

        if (v107) {
          BOOL v108 = v13 == 0;
        }
        else {
          BOOL v108 = 1;
        }
        if (v108)
        {
          id v123 = [(HMHome *)v6 delegate];
          long long v109 = (void *)MEMORY[0x19F3A64A0]();
          long long v110 = v6;
          long long v111 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
          {
            uint64_t v112 = HMFGetLogIdentifier();
            __int16 v113 = [v104 debugDescription];
            id v114 = [(HMHome *)v110 debugDescription];
            *(_DWORD *)buf = 138544130;
            v163 = v112;
            __int16 v164 = 2112;
            uint64_t v165 = (uint64_t)v113;
            __int16 v166 = 2112;
            id v167 = v123;
            __int16 v168 = 2112;
            v169 = v114;
            _os_log_impl(&dword_19D1A8000, v111, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did add accessory: %@ delegate: %@, home: %@", buf, 0x2Au);

            long long v100 = v136;
            uint64_t v6 = v145;
          }
          if (objc_opt_respondsToSelector())
          {
            uint64_t v115 = (void *)MEMORY[0x19F3A64A0]();
            long long v116 = v110;
            uint64_t v117 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
            {
              long long v118 = HMFGetLogIdentifier();
              long long v119 = [v104 debugDescription];
              long long v120 = [(HMHome *)v116 debugDescription];
              *(_DWORD *)buf = 138543874;
              v163 = v118;
              __int16 v164 = 2112;
              uint64_t v165 = (uint64_t)v119;
              __int16 v166 = 2112;
              id v167 = v120;
              _os_log_impl(&dword_19D1A8000, v117, OS_LOG_TYPE_INFO, "%{public}@Client has registered for didAddAccessory delegate callback : %@, home: %@", buf, 0x20u);

              uint64_t v6 = v145;
            }

            long long v121 = [(HMHome *)v116 context];
            long long v122 = [v121 delegateCaller];
            v146[0] = MEMORY[0x1E4F143A8];
            v146[1] = 3221225472;
            v146[2] = __44__HMHome__handleAccessoryAddedNotification___block_invoke_1026;
            v146[3] = &unk_1E5945650;
            v146[4] = v116;
            v146[5] = v104;
            id v123 = v123;
            id v147 = v123;
            [v122 invokeBlock:v146];

            long long v13 = v133;
            long long v100 = v136;
          }
          else
          {
            long long v13 = v133;
          }
        }
        else
        {
          id v123 = [(HMHome *)v6 context];
          uint64_t v124 = [v123 delegateCaller];
          [v124 callCompletion:v13 error:0];
        }
      }
      uint64_t v102 = [(HMAccessorySetupCompletedInfo *)v100 countByEnumeratingWithState:&v148 objects:v170 count:16];
    }
    while (v102);
    id v90 = v100;
    id v74 = v142;
    uint64_t v89 = v144;
LABEL_88:
    long long v99 = v127;
  }
  else
  {
    id v90 = v100;
    id v74 = v142;
    uint64_t v89 = v144;
  }

  long long v93 = v125;
  id v4 = v126;
LABEL_90:
}

uint64_t __44__HMHome__handleAccessoryAddedNotification___block_invoke_1026(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v9 = 138544130;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v7;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Going to dispatch didAddAccessory on client queue: %@, home: %@, %p", (uint8_t *)&v9, 0x2Au);
  }
  return [*(id *)(a1 + 48) home:*(void *)(a1 + 32) didAddAccessory:*(void *)(a1 + 40)];
}

void __44__HMHome__handleAccessoryAddedNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 code] != 2)
  {
    id v3 = (void *)MEMORY[0x19F3A64A0]();
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v2;
      _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Cleanup adding accessory completed with error: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (BOOL)_removeTriggerFromResponse:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = objc_msgSend(a3, "hmf_UUIDForKey:", @"kTriggerUUID");
  if (v7)
  {
    __int16 v8 = [(HMHome *)self triggerWithUUID:v7];
    BOOL v9 = v8 == 0;
    if (v8)
    {
      uint64_t v10 = [(HMHome *)self currentTriggers];
      [v10 removeObject:v8];

      [v8 _unconfigure];
      if (v6)
      {
        __int16 v11 = [(HMHome *)self context];
        uint64_t v12 = [v11 delegateCaller];
        [v12 callCompletion:v6 error:0];
      }
      else
      {
        [(HMHome *)self _notifyDelegateOfTriggerRemoved:v8];
      }
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)_addTrigger:(id)a3 triggerUUID:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v12 = self;
  __int16 v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v27 = 138543618;
    BOOL v28 = v14;
    __int16 v29 = 2112;
    id v30 = v8;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Adding a new trigger: %@", (uint8_t *)&v27, 0x16u);
  }
  [v8 setUuid:v9];
  __int16 v15 = [(HMHome *)v12 context];
  objc_msgSend(v8, "__configureWithContext:home:", v15, v12);

  uint64_t v16 = [(HMHome *)v12 currentTriggers];
  [v16 addObject:v8];

  uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
  if (v10)
  {
    uint64_t v18 = v12;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      BOOL v21 = _Block_copy(v10);
      int v27 = 138543618;
      BOOL v28 = v20;
      __int16 v29 = 2112;
      id v30 = v21;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@_addTrigger : Calling completion : %@", (uint8_t *)&v27, 0x16u);
    }
    int v22 = [(HMHome *)v18 context];
    uint64_t v23 = [v22 delegateCaller];
    [v23 callCompletion:v10 error:0];
  }
  else
  {
    long long v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      int v27 = 138543362;
      BOOL v28 = v25;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@_addTrigger : Calling delegate", (uint8_t *)&v27, 0xCu);
    }
    [(HMHome *)v12 _notifyDelegateOfTriggerAdded:v8];
  }

  return 0;
}

- (BOOL)_addTimerTriggerFromResponse:(id)a3 withTimerTrigger:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_msgSend(v7, "hmf_stringForKey:", @"kTriggerName");
  __int16 v11 = objc_msgSend(v7, "hmf_UUIDForKey:", @"kTriggerUUID");
  uint64_t v12 = objc_msgSend(v7, "hmf_dateForKey:", @"kTimerTriggerInitialFireDateKey");
  __int16 v29 = objc_msgSend(v7, "hmf_timeZoneForKey:", @"kTimerTriggerTimeZoneDataKey");
  BOOL v28 = [v7 dateComponentsForKey:@"kTimerTriggerRecurrenceDataKey"];
  int v27 = [v7 arrayOfDateComponentsFromDataForKey:@"kTimerTriggerRecurrencesKey"];
  uint64_t v26 = [v7 dateComponentsForKey:@"kTimerTriggerSignificantEventOffsetKey"];
  uint64_t v13 = objc_msgSend(v7, "hmf_stringForKey:", @"kTimerTriggerSignificantEventKey");
  uint64_t v14 = (HMTimerTrigger *)v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v15 = v14;
  }
  else {
    __int16 v15 = 0;
  }
  uint64_t v16 = v15;

  BOOL v17 = 1;
  if (v11 && v10 && v12 | v13)
  {
    id v23 = v9;
    uint64_t v18 = v14;
    if (v16)
    {
LABEL_15:
      BOOL v21 = objc_msgSend(v7, "hmf_stringForKey:", @"HMT.triggerConfiguredNameKey", v23);
      [(HMTrigger *)v18 setConfiguredName:v21];
      BOOL v17 = [(HMHome *)self _addTrigger:v18 triggerUUID:v11 completion:v24];

      uint64_t v16 = v18;
      id v9 = v24;
      goto LABEL_16;
    }
    if (v12)
    {
      uint64_t v19 = [HMTimerTrigger alloc];
      if (v28) {
        uint64_t v20 = [(HMTimerTrigger *)v19 initWithName:v10 fireDate:v12 timeZone:v29 recurrence:v28 recurrenceCalendar:0];
      }
      else {
        uint64_t v20 = [(HMTimerTrigger *)v19 initWithName:v10 fireDate:v12 timeZone:v29 recurrences:v27];
      }
    }
    else
    {
      if (!v13) {
        goto LABEL_17;
      }
      uint64_t v20 = [[HMTimerTrigger alloc] initWithName:v10 significantEvent:v13 significantEventOffset:v26 recurrences:0];
    }
    uint64_t v18 = v20;
    if (v20) {
      goto LABEL_15;
    }
LABEL_17:
    uint64_t v16 = 0;
    id v9 = v23;
  }
LABEL_16:

  return v17;
}

- (BOOL)_addEventTriggerFromResponse:(id)a3 withEventTrigger:(id)a4 completion:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = objc_msgSend(v8, "hmf_stringForKey:", @"kTriggerName");
  objc_msgSend(v8, "hmf_UUIDForKey:", @"kTriggerUUID");
  uint64_t v12 = (char *)objc_claimAutoreleasedReturnValue();
  id v13 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = v14;

  uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
  BOOL v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    uint64_t v18 = self;
    uint64_t v19 = v12;
    uint64_t v20 = v11;
    int v22 = v21 = v10;
    *(_DWORD *)buf = 138543618;
    id v58 = v22;
    __int16 v59 = 2112;
    id v60 = (const char *)v8;
    _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Received a new trigger added with message %@", buf, 0x16u);

    id v10 = v21;
    __int16 v11 = v20;
    uint64_t v12 = v19;
    self = v18;
  }

  if (!v12 || !v11)
  {
    uint64_t v36 = (void *)MEMORY[0x19F3A64A0]();
    long long v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      id v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v58 = v38;
      __int16 v59 = 2112;
      id v60 = v12;
      __int16 v61 = 2112;
      id v62 = v11;
      _os_log_impl(&dword_19D1A8000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Received a new trigger without uuid %@ or name %@", buf, 0x20u);
    }
    goto LABEL_18;
  }
  if (v15)
  {
    __int16 v50 = v10;
    id v23 = objc_msgSend(v8, "hmf_stringForKey:", @"HMT.triggerConfiguredNameKey");
    [v15 setUuid:v12];
    [v15 setConfiguredName:v23];
    long long v24 = [(HMHome *)self context];
    objc_msgSend(v15, "__configureWithContext:home:", v24, self);

    uint64_t v25 = [(HMHome *)self currentTriggers];
    [v25 addObject:v15];

    uint64_t v26 = dispatch_group_create();
    int v27 = [v15 events];
    uint64_t v28 = [v27 count];

    if (v28)
    {
      dispatch_group_enter(v26);
      __int16 v29 = [v15 events];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __67__HMHome__addEventTriggerFromResponse_withEventTrigger_completion___block_invoke;
      v55[3] = &unk_1E5945188;
      SEL v56 = v26;
      [v15 updateEvents:v29 completionHandler:v55];
    }
    id v30 = [v15 endEvents];
    uint64_t v31 = [v30 count];

    if (v31)
    {
      dispatch_group_enter(v26);
      long long v32 = [v15 endEvents];
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __67__HMHome__addEventTriggerFromResponse_withEventTrigger_completion___block_invoke_2;
      v53[3] = &unk_1E5945188;
      id v54 = v26;
      [v15 updateEndEvents:v32 completionHandler:v53];
    }
    id v33 = [(HMHome *)self context];
    if (v33)
    {
      uint64_t v34 = v33;
      id v35 = [v33 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__HMHome__addEventTriggerFromResponse_withEventTrigger_completion___block_invoke_1019;
      block[3] = &unk_1E59454E8;
      block[4] = self;
      id v10 = v50;
      id v52 = v50;
      dispatch_group_notify(v26, v35, block);
    }
    else
    {
      uint64_t v46 = (void *)MEMORY[0x19F3A64A0]();
      id v47 = HMFGetOSLogHandle();
      id v10 = v50;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        uint64_t v48 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v58 = v48;
        __int16 v59 = 2080;
        id v60 = "-[HMHome _addEventTriggerFromResponse:withEventTrigger:completion:]";
        _os_log_impl(&dword_19D1A8000, v47, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
      }
    }

    BOOL v39 = 0;
    id v15 = v13;
    goto LABEL_27;
  }
  id v15 = +[HMEventTrigger createWithDictionary:v8 home:self];
  [v15 setUuid:v12];
  uint64_t v40 = [(HMHome *)self context];
  objc_msgSend(v15, "__configureWithContext:home:", v40, self);

  if (![v15 compatibleWithApp])
  {
LABEL_18:
    BOOL v39 = 1;
    goto LABEL_27;
  }
  int v41 = (void *)MEMORY[0x19F3A64A0]();
  __int16 v42 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    uint64_t v44 = v43 = v10;
    *(_DWORD *)buf = 138543874;
    id v58 = v44;
    __int16 v59 = 2112;
    id v60 = (const char *)v15;
    __int16 v61 = 2112;
    id v62 = v8;
    _os_log_impl(&dword_19D1A8000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@Created new event trigger %@ from response Payload %@", buf, 0x20u);

    id v10 = v43;
  }

  uint64_t v45 = [(HMHome *)self currentTriggers];
  [v45 addObject:v15];

  [(HMHome *)self _notifyDelegateOfTriggerAdded:v15];
  BOOL v39 = 0;
LABEL_27:

  return v39;
}

void __67__HMHome__addEventTriggerFromResponse_withEventTrigger_completion___block_invoke(uint64_t a1)
{
}

void __67__HMHome__addEventTriggerFromResponse_withEventTrigger_completion___block_invoke_2(uint64_t a1)
{
}

void __67__HMHome__addEventTriggerFromResponse_withEventTrigger_completion___block_invoke_1019(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) context];
  id v2 = [v3 delegateCaller];
  [v2 callCompletion:*(void *)(a1 + 40) error:0];
}

- (void)notifyDelegatesOfExecutionForActionSet:(id)a3 atDate:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMHome *)self context];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__HMHome_notifyDelegatesOfExecutionForActionSet_atDate___block_invoke;
    v15[3] = &unk_1E5945628;
    void v15[4] = self;
    id v16 = v6;
    dispatch_async(v10, v15);
  }
  else
  {
    __int16 v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v14;
      __int16 v19 = 2080;
      uint64_t v20 = "-[HMHome notifyDelegatesOfExecutionForActionSet:atDate:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __56__HMHome_notifyDelegatesOfExecutionForActionSet_atDate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _privateDelegate];
  if (*(void *)(a1 + 40) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v3 = [*(id *)(a1 + 32) context];
    id v4 = [v3 delegateCaller];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__HMHome_notifyDelegatesOfExecutionForActionSet_atDate___block_invoke_2;
    v8[3] = &unk_1E5945650;
    id v5 = v2;
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    id v9 = v5;
    uint64_t v10 = v6;
    id v11 = v7;
    [v4 invokeBlock:v8];
  }
}

uint64_t __56__HMHome_notifyDelegatesOfExecutionForActionSet_atDate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateLastExecutionDateForActionSet:*(void *)(a1 + 48)];
}

- (BOOL)_handleActionSetRemovedFromResponse:(id)a3 responsePayload:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _Block_copy(v6);
  id v9 = objc_msgSend(v7, "hmf_UUIDForKey:", @"kActionSetUUID");
  if (v9)
  {
    uint64_t v10 = [(HMHome *)self actionSetWithUUID:v9];
    if (v10)
    {
      id v11 = [(HMHome *)self currentActionSets];
      [v11 removeObject:v10];

      [v10 _unconfigure];
      if (v8)
      {
        uint64_t v12 = [(HMHome *)self context];
        id v13 = [v12 delegateCaller];
        [v13 callCompletion:v8 error:0];

        char v14 = 0;
      }
      else
      {
        __int16 v19 = [(HMHome *)self delegate];
        char v20 = objc_opt_respondsToSelector();
        if (v20)
        {
          uint64_t v21 = [(HMHome *)self context];
          int v22 = [v21 delegateCaller];
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __62__HMHome__handleActionSetRemovedFromResponse_responsePayload___block_invoke;
          v24[3] = &unk_1E5945650;
          id v25 = v19;
          uint64_t v26 = self;
          id v27 = v10;
          [v22 invokeBlock:v24];
        }
        char v14 = v20 ^ 1;
      }
    }
    else
    {
      char v14 = 1;
    }
  }
  else
  {
    id v15 = (void *)MEMORY[0x19F3A64A0]();
    id v16 = self;
    BOOL v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v29 = v18;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Response for API removeActionSet does not contain UUID.", buf, 0xCu);
    }
    char v14 = 1;
  }

  return v14 & 1;
}

uint64_t __62__HMHome__handleActionSetRemovedFromResponse_responsePayload___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didRemoveActionSet:*(void *)(a1 + 48)];
}

- (BOOL)_addActionSetFromResponse:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "hmf_UUIDForKey:", @"kActionSetUUID");
  id v9 = objc_msgSend(v6, "hmf_stringForKey:", @"kActionSetName");
  uint64_t v10 = objc_msgSend(v6, "hmf_stringForKey:", @"kActionSetType");
  id v11 = (void *)v10;
  if (v8 && v9 && v10)
  {
    uint64_t v12 = [(HMHome *)self createActionSetWithName:v9 type:v10 uuid:v8];
    id v13 = [(HMHome *)self currentActionSets];
    [v13 addObject:v12];

    if (v7)
    {
      char v14 = [(HMHome *)self context];
      id v15 = [v14 delegateCaller];
      [v15 callCompletion:v7 actionSet:v12 error:0];

      char v16 = 0;
    }
    else
    {
      uint64_t v21 = [(HMHome *)self delegate];
      char v22 = objc_opt_respondsToSelector();
      if (v22)
      {
        id v25 = [(HMHome *)self context];
        id v23 = [v25 delegateCaller];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __47__HMHome__addActionSetFromResponse_completion___block_invoke;
        v26[3] = &unk_1E5945650;
        id v27 = v21;
        uint64_t v28 = self;
        id v29 = v12;
        [v23 invokeBlock:v26];
      }
      char v16 = v22 ^ 1;
    }
  }
  else
  {
    BOOL v17 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v18 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      char v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      uint64_t v31 = v20;
      __int16 v32 = 2112;
      id v33 = v8;
      __int16 v34 = 2112;
      id v35 = v9;
      __int16 v36 = 2112;
      long long v37 = v11;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Received a new actionSet without uuid %@ or name %@ or type %@", buf, 0x2Au);
    }
    char v16 = 1;
  }

  return v16 & 1;
}

uint64_t __47__HMHome__addActionSetFromResponse_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didAddActionSet:*(void *)(a1 + 48)];
}

- (void)_handleHomeLocationUpdateNotification:(id)a3
{
  id v4 = [a3 messagePayload];
  [(HMHome *)self _handleHomeLocationUpdate:v4];
}

- (id)lightProfileWithProfileUUID:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = [(HMHome *)self accessories];
  uint64_t v20 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v6 = *(void *)v26;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v5);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "lightProfiles", v19);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v9);
              }
              char v14 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              id v15 = [v14 profileUniqueIdentifier];
              char v16 = [v15 isEqual:v4];

              if (v16)
              {
                id v17 = v14;

                goto LABEL_19;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v19;
      }
      id v17 = 0;
      uint64_t v20 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }
  else
  {
    id v17 = 0;
  }
LABEL_19:

  return v17;
}

- (id)profileWithUniqueIdentifier:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = [(HMHome *)self accessories];
  uint64_t v21 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v21)
  {
    uint64_t v6 = *(void *)v27;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v5);
        }
        id v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v9 = objc_msgSend(v8, "accessoryProfiles", v20);
        uint64_t v10 = [v9 array];

        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              char v16 = [v15 uniqueIdentifier];
              char v17 = [v16 isEqual:v4];

              if (v17)
              {
                id v18 = v15;

                goto LABEL_19;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v20;
      }
      id v18 = 0;
      uint64_t v21 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v21);
  }
  else
  {
    id v18 = 0;
  }
LABEL_19:

  return v18;
}

- (id)mediaProfileWithProfileUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(HMHome *)self accessories];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) mediaProfile];
      uint64_t v11 = [v10 profileUniqueIdentifier];
      char v12 = [v11 isEqual:v4];

      if (v12) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)mediaProfileWithUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(HMHome *)self accessories];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) mediaProfile];
      uint64_t v11 = [v10 uniqueIdentifier];
      char v12 = [v11 isEqual:v4];

      if (v12) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)_notifySetupFailedIfInHomeUIService:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  id v5 = [(HMHome *)self _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = v4[2](v4);
    uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v6;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Notifying HomeUIService of failed accessory setup with error: %@", buf, 0x16u);
    }
    uint64_t v11 = [(HMHome *)v8 context];
    char v12 = [v11 delegateCaller];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__HMHome__notifySetupFailedIfInHomeUIService___block_invoke;
    v14[3] = &unk_1E5945650;
    id v15 = v5;
    long long v16 = v8;
    id v17 = v6;
    id v13 = v6;
    [v12 invokeBlock:v14];
  }
}

uint64_t __46__HMHome__notifySetupFailedIfInHomeUIService___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didFailAccessorySetupWithError:*(void *)(a1 + 48)];
}

- (id)mediaSystemWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self mediaSystemStageManager];
  uint64_t v6 = [v5 mediaSystemWithUUID:v4];

  return v6;
}

- (id)mediaSystemWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self mediaSystemStageManager];
  uint64_t v6 = [v5 mediaSystemWithUniqueIdentifier:v4];

  return v6;
}

- (id)accessoryWithUniqueIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(HMHome *)self accessories];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 uniqueIdentifier];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)userWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self users];
  id v6 = objc_msgSend(v5, "hmf_firstObjectWithUUID:", v4);

  if (!v6)
  {
    uint64_t v7 = [(HMHome *)self currentUser];
    uint64_t v8 = [v7 uuid];
    int v9 = [v8 isEqual:v4];

    if (v9)
    {
      id v6 = [(HMHome *)self currentUser];
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

- (id)triggerWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self currentTriggers];
  id v6 = [v5 firstItemWithName:v4];

  return v6;
}

- (id)triggerWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self currentTriggers];
  id v6 = [v5 firstItemWithUUID:v4];

  return v6;
}

- (id)actionSetWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self currentActionSets];
  id v6 = [v5 firstItemWithName:v4];

  return v6;
}

- (id)triggerOwnedActionSetWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self currentTriggerOwnedActionSets];
  id v6 = [v5 firstItemWithUUID:v4];

  return v6;
}

- (id)actionSetWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self currentActionSets];
  id v6 = [v5 firstItemWithUUID:v4];

  return v6;
}

- (id)serviceGroupWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self currentServiceGroups];
  id v6 = [v5 firstItemWithName:v4];

  return v6;
}

- (id)serviceGroupWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self currentServiceGroups];
  id v6 = [v5 firstItemWithUUID:v4];

  return v6;
}

- (id)zoneWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self currentZones];
  id v6 = [v5 firstItemWithName:v4];

  return v6;
}

- (id)zoneWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self currentZones];
  id v6 = [v5 firstItemWithUUID:v4];

  return v6;
}

- (id)roomWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self currentRooms];
  id v6 = [v5 firstItemWithName:v4];

  return v6;
}

- (id)roomWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome(HMRoom) *)self roomForEntireHome];
  id v6 = [v5 uuid];
  int v7 = [v6 isEqual:v4];

  if (v7)
  {
    uint64_t v8 = [(HMHome(HMRoom) *)self roomForEntireHome];
  }
  else
  {
    int v9 = [(HMHome *)self currentRooms];
    uint64_t v8 = [v9 firstItemWithUUID:v4];
  }

  return v8;
}

- (HMHomeDelegatePrivate)_privateDelegate
{
  id v2 = [(HMHome *)self delegate];
  if ([v2 conformsToProtocol:&unk_1EEF70488]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (HMHomeDelegatePrivate *)v3;
}

- (void)_handleAccessoryConnectivityChangedNotification:(id)a3
{
  id v4 = a3;
  id v10 = [v4 dictionaryForKey:@"kAccessoriesListKey"];
  id v5 = NSString;
  id v6 = [v4 name];
  int v7 = [v4 identifier];

  uint64_t v8 = [v7 UUIDString];
  int v9 = [v5 stringWithFormat:@"Home-%@%@", v6, v8];

  __handleAccessoryRuntimeStateUpdate(self, v10, v9);
}

- (BOOL)isUpdatedToROAR
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_isUpdatedToROAR;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setDismissedWalletKeyUWBUnlockOnboarding:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_dismissedWalletKeyUWBUnlockOnboarding = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)_handleHMMMRequestReceivedMessage:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMHome *)self uuid];
  id v6 = [v5 UUIDString];
  uint64_t v31 = +[HMMMLogOrigin originWithLogIdentifier:v6];

  int v7 = [v4 messagePayload];
  uint64_t v8 = objc_msgSend(v7, "hmf_stringForKey:", @"HMMM.payload.key.message.name");
  long long v27 = objc_msgSend(v7, "hmf_dataForKey:", @"HMMM.payload.key.payload");
  uint64_t v30 = objc_msgSend(v7, "hmf_stringForKey:", @"HMMM.payload.key.destination.identifier");
  long long v29 = objc_msgSend(v7, "hmf_stringForKey:", @"HMMM.payload.key.destination.uri");
  long long v28 = [(HMHome *)self userFromPayload:v7];
  uint64_t v9 = objc_msgSend(v7, "hmf_BOOLForKey:", @"HMMM.payload.key.oneway");
  if (!v8)
  {
    id v17 = (void *)MEMORY[0x19F3A64A0](v9);
    id v18 = v31;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v36 = v20;
      __int16 v37 = 2112;
      uint64_t v38 = v7;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error during _handleHMMMRequestReceivedMessage: No message name in HMMT payload: %@", buf, 0x16u);
    }
    goto LABEL_7;
  }
  int v10 = v9;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  char v12 = [(HMHome *)self hmModernMessagingRequestHandlersByMessageName];
  long long v13 = [v12 objectForKeyedSubscript:v8];

  os_unfair_lock_unlock(p_lock);
  if (!v13)
  {
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = v31;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v36 = v21;
      __int16 v37 = 2112;
      uint64_t v38 = v8;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error during _handleHMMMRequestReceivedMessage: Did not find request handler for message name: %@", buf, 0x16u);
    }
LABEL_7:

    long long v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [v4 respondWithError:v13];
    goto LABEL_17;
  }
  long long v14 = [HMMMClientRequestHandlerOptions alloc];
  long long v15 = [[HMMMMessageDestination alloc] initWithIDSIdentifier:v30 idsTokenURI:v29];
  long long v26 = [(HMMMClientRequestHandlerOptions *)v14 initWithPeerDestination:v15 messageName:v8 user:v28];

  if (v10)
  {
    long long v16 = 0;
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__HMHome__handleHMMMRequestReceivedMessage___block_invoke;
    aBlock[3] = &unk_1E5941380;
    void aBlock[4] = v31;
    id v33 = v8;
    id v34 = v4;
    long long v16 = _Block_copy(aBlock);
  }
  uint64_t v22 = (void *)MEMORY[0x19F3A64A0]();
  id v23 = v31;
  long long v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    long long v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v36 = v25;
    __int16 v37 = 2112;
    uint64_t v38 = v8;
    _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_INFO, "%{public}@Delivering HMMM request to request handler with message name: %@", buf, 0x16u);
  }
  ((void (**)(void, void *, HMMMClientRequestHandlerOptions *, void *))v13)[2](v13, v27, v26, v16);
  if (v10) {
    [v4 respondWithSuccess];
  }

LABEL_17:
}

void __44__HMHome__handleHMMMRequestReceivedMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 40);
    int v13 = 138543618;
    long long v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Response received from HMMM request handler with message name: %@", (uint8_t *)&v13, 0x16u);
  }
  if (v5)
  {
    char v12 = [MEMORY[0x1E4F1CA60] dictionary];
    [v12 setObject:v5 forKeyedSubscript:@"HMMM.payload.key.payload"];
  }
  else
  {
    char v12 = 0;
  }
  [*(id *)(a1 + 48) respondWithPayload:v12 error:v6];
}

- (void)_handleDidRemoveWalletKeyMessage:(id)a3
{
  id v4 = [(HMHome *)self _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(HMHome *)self context];
    id v6 = [v5 delegateCaller];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__HMHome__handleDidRemoveWalletKeyMessage___block_invoke;
    v7[3] = &unk_1E5945628;
    id v8 = v4;
    uint64_t v9 = self;
    [v6 invokeBlock:v7];
  }
}

uint64_t __43__HMHome__handleDidRemoveWalletKeyMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeDidRemoveWalletKey:*(void *)(a1 + 40)];
}

- (void)_handleDidAddWalletKeyMessage:(id)a3
{
  id v4 = [(HMHome *)self _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(HMHome *)self context];
    id v6 = [v5 delegateCaller];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__HMHome__handleDidAddWalletKeyMessage___block_invoke;
    v7[3] = &unk_1E5945628;
    id v8 = v4;
    uint64_t v9 = self;
    [v6 invokeBlock:v7];
  }
}

uint64_t __40__HMHome__handleDidAddWalletKeyMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeDidAddWalletKey:*(void *)(a1 + 40)];
}

- (void)setHasOnboardedForWalletKey:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_hasOnboardedForWalletKey = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setHasOnboardedForAccessCode:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_hasOnboardedForAccessCode = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)clearEventLogWithCompletionHandler:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(HMHome *)self context];
  if (!v4)
  {
    uint64_t v22 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome clearEventLogWithCompletionHandler:]", @"completion"];
    id v23 = (void *)MEMORY[0x19F3A64A0]();
    long long v24 = self;
    long long v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      long long v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v26;
      __int16 v33 = 2112;
      id v34 = (const char *)v22;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];
    objc_exception_throw(v27);
  }
  id v6 = (void *)v5;
  if (!v5)
  {
    char v12 = (void *)MEMORY[0x19F3A64A0]();
    int v13 = self;
    long long v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v15;
      __int16 v33 = 2080;
      id v34 = "-[HMHome clearEventLogWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v4[2](v4, v16);
    goto LABEL_11;
  }
  int v7 = [(HMHome *)self homeManager];
  char v8 = [v7 isDaemonRunningWithROARFramework];

  if ((v8 & 1) == 0)
  {
    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v20;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Activity history is only supported in HH2 mode", buf, 0xCu);
    }
    uint64_t v16 = [v6 delegateCaller];
    uint64_t v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v16 callCompletion:v4 error:v21];

LABEL_11:
    goto LABEL_12;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__HMHome_clearEventLogWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E5945510;
  void aBlock[4] = self;
  id v9 = v6;
  id v29 = v9;
  uint64_t v30 = v4;
  int v10 = _Block_copy(aBlock);
  uint64_t v11 = [(HMHome *)self uuid];
  -[_HMContext sendMessage:target:payload:responseHandler:](v9, @"HM.EL.clear", v11, 0, v10);

LABEL_12:
}

void __45__HMHome_clearEventLogWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      int v13 = v10;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Request to update activity history onboarded failed: %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  uint64_t v11 = [*(id *)(a1 + 40) delegateCaller];
  [v11 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)updateEventLogDuration:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(HMHome *)self context];
  if (!v6)
  {
    uint64_t v25 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome updateEventLogDuration:completionHandler:]", @"completion"];
    long long v26 = (void *)MEMORY[0x19F3A64A0]();
    id v27 = self;
    long long v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = v29;
      __int16 v39 = 2112;
      uint64_t v40 = (const char *)v25;
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v30 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v25 userInfo:0];
    objc_exception_throw(v30);
  }
  id v8 = (void *)v7;
  if (v7)
  {
    id v9 = [(HMHome *)self homeManager];
    char v10 = [v9 isDaemonRunningWithROARFramework];

    if (v10)
    {
      uint64_t v35 = @"HM.EL.duration";
      uint64_t v11 = [NSNumber numberWithUnsignedInteger:a3];
      __int16 v36 = v11;
      int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __51__HMHome_updateEventLogDuration_completionHandler___block_invoke;
      aBlock[3] = &unk_1E5941330;
      void aBlock[4] = self;
      id v13 = v8;
      id v32 = v13;
      id v33 = v6;
      unint64_t v34 = a3;
      __int16 v14 = _Block_copy(aBlock);
      id v15 = [(HMHome *)self uuid];
      -[_HMContext sendMessage:target:payload:responseHandler:](v13, @"HM.EL.setDuration", v15, v12, v14);
    }
    else
    {
      __int16 v20 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v21 = self;
      uint64_t v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v38 = v23;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Activity history is only supported in HH2 mode", buf, 0xCu);
      }
      int v12 = [v8 delegateCaller];
      long long v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      [v12 callCompletion:v6 error:v24];
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = v19;
      __int16 v39 = 2080;
      uint64_t v40 = "-[HMHome updateEventLogDuration:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    int v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v12);
  }
}

void __51__HMHome_updateEventLogDuration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  char v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v18 = 138543618;
      uint64_t v19 = v11;
      __int16 v20 = 2114;
      id v21 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Request to update activity history duration failed: %{public}@", (uint8_t *)&v18, 0x16u);
    }
    int v12 = [*(id *)(a1 + 40) delegateCaller];
    id v13 = v12;
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = v5;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      uint64_t v17 = *(void **)(a1 + 56);
      int v18 = 138543618;
      uint64_t v19 = v16;
      __int16 v20 = 2048;
      id v21 = v17;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@After updating duration, setting duration to %lu", (uint8_t *)&v18, 0x16u);
    }
    [*(id *)(a1 + 32) setEventLogDuration:*(void *)(a1 + 56)];
    int v12 = [*(id *)(a1 + 40) delegateCaller];
    id v13 = v12;
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = 0;
  }
  [v12 callCompletion:v14 error:v15];
}

- (void)_callDelegateDidOnboardEventLog
{
  id v3 = [(HMHome *)self _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(HMHome *)self context];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__HMHome__callDelegateDidOnboardEventLog__block_invoke;
      block[3] = &unk_1E5945650;
      id v8 = v5;
      id v9 = v3;
      char v10 = self;
      dispatch_async(v6, block);
    }
  }
}

void __41__HMHome__callDelegateDidOnboardEventLog__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__HMHome__callDelegateDidOnboardEventLog__block_invoke_2;
  v5[3] = &unk_1E5945628;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 invokeBlock:v5];
}

uint64_t __41__HMHome__callDelegateDidOnboardEventLog__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeDidUpdateOnboardedEventLog:*(void *)(a1 + 40)];
}

- (void)_callDelegateDidUpdateEventLogEnabled
{
  id v3 = [(HMHome *)self _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [(HMHome *)self context];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__HMHome__callDelegateDidUpdateEventLogEnabled__block_invoke;
      block[3] = &unk_1E5945650;
      id v8 = v5;
      id v9 = v3;
      char v10 = self;
      dispatch_async(v6, block);
    }
  }
}

void __47__HMHome__callDelegateDidUpdateEventLogEnabled__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__HMHome__callDelegateDidUpdateEventLogEnabled__block_invoke_2;
  v5[3] = &unk_1E5945628;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 invokeBlock:v5];
}

uint64_t __47__HMHome__callDelegateDidUpdateEventLogEnabled__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 isEventLogEnabled];

  return [v1 home:v2 didUpdateEventLogEnabled:v3];
}

- (void)resetDidOnboardEventLogWithCompletionHandler:(id)a3
{
}

- (void)_updateDidOnboardEventLog:(void *)a3 completion:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = [a1 context];
    if (!v5)
    {
      uint64_t v24 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome _updateDidOnboardEventLog:completion:]", @"completion"];
      uint64_t v25 = (void *)MEMORY[0x19F3A64A0]();
      id v26 = a1;
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        long long v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v37 = v28;
        __int16 v38 = 2112;
        __int16 v39 = (const char *)v24;
        _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
      }
      id v29 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v24 userInfo:0];
      objc_exception_throw(v29);
    }
    uint64_t v7 = (void *)v6;
    if (v6)
    {
      id v8 = [a1 homeManager];
      char v9 = [v8 isDaemonRunningWithROARFramework];

      if (v9)
      {
        unint64_t v34 = @"HM.EL.onboarded";
        char v10 = [NSNumber numberWithBool:a2];
        uint64_t v35 = v10;
        uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];

        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __47__HMHome__updateDidOnboardEventLog_completion___block_invoke;
        aBlock[3] = &unk_1E5943980;
        void aBlock[4] = a1;
        id v12 = v7;
        id v31 = v12;
        id v32 = v5;
        char v33 = a2;
        id v13 = _Block_copy(aBlock);
        uint64_t v14 = [a1 uuid];
        -[_HMContext sendMessage:target:payload:responseHandler:](v12, @"HM.EL.setOnboarded", v14, v11, v13);
      }
      else
      {
        uint64_t v19 = (void *)MEMORY[0x19F3A64A0]();
        id v20 = a1;
        id v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          __int16 v37 = v22;
          _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Activity history is only supported in HH2 mode", buf, 0xCu);
        }
        uint64_t v11 = [v7 delegateCaller];
        id v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
        [v11 callCompletion:v5 error:v23];
      }
    }
    else
    {
      id v15 = (void *)MEMORY[0x19F3A64A0]();
      id v16 = a1;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v37 = v18;
        __int16 v38 = 2080;
        __int16 v39 = "-[HMHome _updateDidOnboardEventLog:completion:]";
        _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
      }
      uint64_t v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
      (*((void (**)(id, void *))v5 + 2))(v5, v11);
    }
  }
}

void __47__HMHome__updateDidOnboardEventLog_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  char v9 = HMFGetOSLogHandle();
  char v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v23 = 138543618;
      uint64_t v24 = v11;
      __int16 v25 = 2114;
      id v26 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Request to update activity history onboarded failed: %{public}@", (uint8_t *)&v23, 0x16u);
    }
    id v12 = [*(id *)(a1 + 40) delegateCaller];
    [v12 callCompletion:*(void *)(a1 + 48) error:v5];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = HMFBooleanToString();
      int v23 = 138543618;
      uint64_t v24 = v13;
      __int16 v25 = 2114;
      id v26 = v14;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@After updating didOnboardEventLog, updating didOnboardEventLog to %{public}@", (uint8_t *)&v23, 0x16u);
    }
    [*(id *)(a1 + 32) setDidOnboardEventLog:*(unsigned __int8 *)(a1 + 56)];
    id v15 = objc_msgSend(v6, "hmf_numberForKey:", @"HM.EL.enabled");
    id v12 = v15;
    if (v15)
    {
      uint64_t v16 = [v15 BOOLValue];
      if (v16 != [*(id *)(a1 + 32) isEventLogEnabled])
      {
        uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
        id v18 = *(id *)(a1 + 32);
        uint64_t v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          id v20 = HMFGetLogIdentifier();
          id v21 = HMFBooleanToString();
          int v23 = 138543618;
          uint64_t v24 = v20;
          __int16 v25 = 2114;
          id v26 = v21;
          _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@After updating didOnboardEventLog, updating isEventLogEnabled to %{public}@", (uint8_t *)&v23, 0x16u);
        }
        [*(id *)(a1 + 32) setEventLogEnabled:v16];
        [*(id *)(a1 + 32) _callDelegateDidUpdateEventLogEnabled];
      }
    }
    uint64_t v22 = [*(id *)(a1 + 40) delegateCaller];
    [v22 callCompletion:*(void *)(a1 + 48) error:0];
  }
}

- (void)updateDidOnboardEventLogWithCompletionHandler:(id)a3
{
}

- (void)setDidOnboardEventLog:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_didOnboardEventLog = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)didOnboardEventLog
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_didOnboardEventLog;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)updateEventLogEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(HMHome *)self context];
  if (!v6)
  {
    uint64_t v25 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome updateEventLogEnabled:completionHandler:]", @"completion"];
    id v26 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v27 = self;
    long long v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v38 = v29;
      __int16 v39 = 2112;
      uint64_t v40 = (const char *)v25;
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v30 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v25 userInfo:0];
    objc_exception_throw(v30);
  }
  id v8 = (void *)v7;
  if (v7)
  {
    char v9 = [(HMHome *)self homeManager];
    char v10 = [v9 isDaemonRunningWithROARFramework];

    if (v10)
    {
      uint64_t v35 = @"HM.EL.enabled";
      uint64_t v11 = [NSNumber numberWithBool:v4];
      __int16 v36 = v11;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __50__HMHome_updateEventLogEnabled_completionHandler___block_invoke;
      aBlock[3] = &unk_1E5943980;
      void aBlock[4] = self;
      id v13 = v8;
      id v32 = v13;
      id v33 = v6;
      BOOL v34 = v4;
      uint64_t v14 = _Block_copy(aBlock);
      id v15 = [(HMHome *)self uuid];
      -[_HMContext sendMessage:target:payload:responseHandler:](v13, @"HM.EL.setEnabled", v15, v12, v14);
    }
    else
    {
      id v20 = (void *)MEMORY[0x19F3A64A0]();
      id v21 = self;
      uint64_t v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v38 = v23;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Activity history is only supported in HH2 mode", buf, 0xCu);
      }
      id v12 = [v8 delegateCaller];
      uint64_t v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      [v12 callCompletion:v6 error:v24];
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v38 = v19;
      __int16 v39 = 2080;
      uint64_t v40 = "-[HMHome updateEventLogEnabled:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v12);
  }
}

void __50__HMHome_updateEventLogEnabled_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = *(id *)(a1 + 32);
    char v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      char v10 = HMFGetLogIdentifier();
      int v24 = 138543618;
      uint64_t v25 = v10;
      __int16 v26 = 2114;
      id v27 = v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Request to update activity history failed: %{public}@", (uint8_t *)&v24, 0x16u);
    }
    uint64_t v11 = [*(id *)(a1 + 40) delegateCaller];
    id v12 = v11;
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = v5;
  }
  else
  {
    if (*(unsigned char *)(a1 + 56) && ([*(id *)(a1 + 32) didOnboardEventLog] & 1) == 0)
    {
      id v15 = (void *)MEMORY[0x19F3A64A0]();
      id v16 = *(id *)(a1 + 32);
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v18 = HMFGetLogIdentifier();
        int v24 = 138543362;
        uint64_t v25 = v18;
        _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@After updating isEventlogEnabled, updating idOnboardEventLog to YES", (uint8_t *)&v24, 0xCu);
      }
      [*(id *)(a1 + 32) setDidOnboardEventLog:1];
      [*(id *)(a1 + 32) _callDelegateDidOnboardEventLog];
    }
    uint64_t v19 = (void *)MEMORY[0x19F3A64A0]();
    id v20 = *(id *)(a1 + 32);
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      int v23 = HMFBooleanToString();
      int v24 = 138543618;
      uint64_t v25 = v22;
      __int16 v26 = 2114;
      id v27 = v23;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_INFO, "%{public}@After updating isEventlogEnabled, updating isEventLogEnabled to %{public}@", (uint8_t *)&v24, 0x16u);
    }
    [*(id *)(a1 + 32) setEventLogEnabled:*(unsigned __int8 *)(a1 + 56)];
    uint64_t v11 = [*(id *)(a1 + 40) delegateCaller];
    id v12 = v11;
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = 0;
  }
  [v11 callCompletion:v13 error:v14];
}

- (void)setEventLogEnabled:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_eventLogEnabled = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isEventLogEnabled
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_eventLogEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setTimeZone:(id)a3
{
  BOOL v4 = (NSTimeZone *)a3;
  os_unfair_lock_lock_with_options();
  timeZone = self->_timeZone;
  self->_timeZone = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSTimeZone)timeZone
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = self->_timeZone;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)updateDidOnboardLocationServices:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = self;
  char v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    char v10 = HMFGetLogIdentifier();
    HMFBooleanToString();
    uint64_t v11 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    BOOL v34 = v10;
    __int16 v35 = 2112;
    __int16 v36 = v11;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Sending update did onboard location services request with value: %@", buf, 0x16u);
  }
  uint64_t v12 = [(HMHome *)v8 context];
  if (!v6)
  {
    uint64_t v22 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome updateDidOnboardLocationServices:completion:]", @"completion"];
    int v23 = (void *)MEMORY[0x19F3A64A0]();
    int v24 = v8;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      BOOL v34 = v26;
      __int16 v35 = 2112;
      __int16 v36 = (const char *)v22;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];
    objc_exception_throw(v27);
  }
  uint64_t v13 = (void *)v12;
  if (v12)
  {
    id v14 = [(HMHome *)v8 uuid];
    id v31 = @"HMHomeDidOnboardLocationServicesCodingKey";
    id v15 = [NSNumber numberWithBool:v4];
    id v32 = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __54__HMHome_updateDidOnboardLocationServices_completion___block_invoke;
    v28[3] = &unk_1E5945510;
    void v28[4] = v8;
    id v29 = v13;
    id v30 = v6;
    -[_HMContext sendMessage:target:payload:responseHandler:](v29, @"HMHomeUpdateDidOnboardLocationServicesRequestKey", v14, v16, v28);
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = v8;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      BOOL v34 = v20;
      __int16 v35 = 2080;
      __int16 v36 = "-[HMHome updateDidOnboardLocationServices:completion:]";
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v21);
  }
}

void __54__HMHome_updateDidOnboardLocationServices_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  char v9 = HMFGetOSLogHandle();
  char v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v17 = 138543618;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Update did onboard location services request responded with error: %@", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v12 = [*(id *)(a1 + 40) delegateCaller];
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = v5;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      int v17 = 138543362;
      id v18 = v16;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Update did onboard location services request responded", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v12 = [*(id *)(a1 + 40) delegateCaller];
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = 0;
  }
  [v12 callCompletion:v14 error:v15];
}

- (void)updateLocationServicesEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = self;
  char v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    char v10 = HMFGetLogIdentifier();
    HMFBooleanToString();
    uint64_t v11 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    BOOL v34 = v10;
    __int16 v35 = 2112;
    __int16 v36 = v11;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Sending update location services enabled request with value: %@", buf, 0x16u);
  }
  uint64_t v12 = [(HMHome *)v8 context];
  if (!v6)
  {
    uint64_t v22 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome updateLocationServicesEnabled:completion:]", @"completion"];
    int v23 = (void *)MEMORY[0x19F3A64A0]();
    int v24 = v8;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      BOOL v34 = v26;
      __int16 v35 = 2112;
      __int16 v36 = (const char *)v22;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];
    objc_exception_throw(v27);
  }
  uint64_t v13 = (void *)v12;
  if (v12)
  {
    uint64_t v14 = [(HMHome *)v8 uuid];
    id v31 = @"HMHomeLocationServicesEnabledCodingKey";
    id v15 = [NSNumber numberWithBool:v4];
    id v32 = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __51__HMHome_updateLocationServicesEnabled_completion___block_invoke;
    v28[3] = &unk_1E5945510;
    void v28[4] = v8;
    id v29 = v13;
    id v30 = v6;
    -[_HMContext sendMessage:target:payload:responseHandler:](v29, @"HMHomeUpdateLocationServicesEnabledRequestKey", v14, v16, v28);
  }
  else
  {
    int v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = v8;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      BOOL v34 = v20;
      __int16 v35 = 2080;
      __int16 v36 = "-[HMHome updateLocationServicesEnabled:completion:]";
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v21);
  }
}

void __51__HMHome_updateLocationServicesEnabled_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  char v9 = HMFGetOSLogHandle();
  char v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v17 = 138543618;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Update location services enabled request responded with error: %@", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v12 = [*(id *)(a1 + 40) delegateCaller];
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = v5;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      int v17 = 138543362;
      id v18 = v16;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Update location services enabled request responded", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v12 = [*(id *)(a1 + 40) delegateCaller];
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = 0;
  }
  [v12 callCompletion:v14 error:v15];
}

- (void)updateSiriPhraseOptions:(unint64_t)a3 completion:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = self;
  char v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    char v10 = HMFGetLogIdentifier();
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:a3];
    *(_DWORD *)buf = 138543618;
    uint64_t v40 = v10;
    __int16 v41 = 2112;
    __int16 v42 = v11;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Sending Siri phrase options update request: %@", buf, 0x16u);
  }
  uint64_t v12 = [(HMHome *)v8 context];
  if (!v6)
  {
    uint64_t v27 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome updateSiriPhraseOptions:completion:]", @"completion"];
    uint64_t v28 = (void *)MEMORY[0x19F3A64A0]();
    id v29 = v8;
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v31;
      __int16 v41 = 2112;
      __int16 v42 = (const char *)v27;
      _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v32 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v27 userInfo:0];
    objc_exception_throw(v32);
  }
  uint64_t v13 = (void *)v12;
  if (v12)
  {
    if ([(HMHome *)v8 siriPhraseOptions] != a3)
    {
      int v24 = [(HMHome *)v8 uuid];
      uint64_t v37 = @"HMHomeSiriPhraseOptionsCodingKey";
      uint64_t v25 = [NSNumber numberWithUnsignedInteger:a3];
      __int16 v38 = v25;
      __int16 v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      void v33[2] = __45__HMHome_updateSiriPhraseOptions_completion___block_invoke;
      v33[3] = &unk_1E5941330;
      v33[4] = v8;
      id v34 = v13;
      id v35 = v6;
      unint64_t v36 = a3;
      -[_HMContext sendMessage:target:payload:responseHandler:](v34, @"HMHomeSiriPhraseOptionsRequestKey", v24, v26, v33);

      goto LABEL_14;
    }
    uint64_t v14 = (void *)MEMORY[0x19F3A64A0]();
    id v15 = v8;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = HMFGetLogIdentifier();
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMHome siriPhraseOptions](v15, "siriPhraseOptions"));
      id v18 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v17;
      __int16 v41 = 2112;
      __int16 v42 = v18;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Siri phrase options already equal to %@, skipping", buf, 0x16u);
    }
    __int16 v19 = [v13 delegateCaller];
    [v19 callCompletion:v6 error:0];
  }
  else
  {
    id v20 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v21 = v8;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v23;
      __int16 v41 = 2080;
      __int16 v42 = "-[HMHome updateSiriPhraseOptions:completion:]";
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    __int16 v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v19);
  }

LABEL_14:
}

void __45__HMHome_updateSiriPhraseOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  char v9 = HMFGetOSLogHandle();
  char v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v17 = 138543618;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Siri phrase options update request responded with error: %@", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v12 = [*(id *)(a1 + 40) delegateCaller];
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = v5;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      int v17 = 138543362;
      id v18 = v16;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Siri phrase options update request responded", (uint8_t *)&v17, 0xCu);
    }
    [*(id *)(a1 + 32) setSiriPhraseOptions:*(void *)(a1 + 56)];
    uint64_t v12 = [*(id *)(a1 + 40) delegateCaller];
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = 0;
  }
  [v12 callCompletion:v14 error:v15];
}

- (id)createHomeAudioAnalysisEventSubscriber
{
  uint64_t v3 = [HMAudioAnalysisLastKnownEventSubscriber alloc];
  BOOL v4 = [(HMHome *)self context];
  id v5 = [(HMHome *)self homeManager];
  id v6 = [v5 eventRouter];
  uint64_t v7 = [(HMHome *)self context];
  id v8 = [v7 queue];
  char v9 = [(HMAudioAnalysisLastKnownEventSubscriber *)v3 initWithContext:v4 subscriptionProvider:v6 dataSource:self workQueue:v8];

  return v9;
}

- (void)updateDidOnboardAudioAnalysis:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *))a4;
  uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = self;
  char v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    char v10 = HMFGetLogIdentifier();
    HMFBooleanToString();
    uint64_t v11 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    __int16 v41 = v10;
    __int16 v42 = 2112;
    uint64_t v43 = v11;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Sending update did onboard home audio analysis request with value: %@", buf, 0x16u);
  }
  uint64_t v12 = [(HMHome *)v8 context];
  if (!v6)
  {
    uint64_t v28 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome updateDidOnboardAudioAnalysis:completion:]", @"completion"];
    id v29 = (void *)MEMORY[0x19F3A64A0]();
    id v30 = v8;
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      id v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v41 = v32;
      __int16 v42 = 2112;
      uint64_t v43 = (const char *)v28;
      _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v33 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v28 userInfo:0];
    objc_exception_throw(v33);
  }
  uint64_t v13 = (void *)v12;
  if (!v12)
  {
    id v18 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v19 = v8;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v41 = v21;
      __int16 v42 = 2080;
      uint64_t v43 = "-[HMHome updateDidOnboardAudioAnalysis:completion:]";
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v6[2](v6, v22);
    goto LABEL_13;
  }
  if ([(HMHome *)v8 didOnboardAudioAnalysis] == v4)
  {
    int v23 = (void *)MEMORY[0x19F3A64A0]();
    int v24 = v8;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      __int16 v26 = HMFGetLogIdentifier();
      [(HMHome *)v24 didOnboardAudioAnalysis];
      HMFBooleanToString();
      uint64_t v27 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      __int16 v41 = v26;
      __int16 v42 = 2112;
      uint64_t v43 = v27;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_INFO, "%{public}@value already equal to %@, skipping", buf, 0x16u);
    }
    uint64_t v22 = [v13 delegateCaller];
    [v22 callCompletion:v6 error:0];
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v14 = [(HMHome *)v8 uuid];
  __int16 v38 = @"HMHomeAudioAnalysisHomeOnboardingCodingKey";
  id v15 = [NSNumber numberWithBool:v4];
  __int16 v39 = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  void v34[2] = __51__HMHome_updateDidOnboardAudioAnalysis_completion___block_invoke;
  v34[3] = &unk_1E5943980;
  void v34[4] = v8;
  id v35 = v13;
  int v17 = v6;
  unint64_t v36 = v17;
  BOOL v37 = v4;
  -[_HMContext sendMessage:target:payload:responseHandler:](v35, @"HMHomeAudioAnalysisHomeOnboardingRequestKey", v14, v16, v34);

  v17[2](v17, 0);
LABEL_14:
}

void __51__HMHome_updateDidOnboardAudioAnalysis_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = *(id *)(a1 + 32);
    char v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      char v10 = HMFGetLogIdentifier();
      int v15 = 138543618;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@AudioAnalysis home onboarding key request responded with error: %@", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v11 = [*(id *)(a1 + 40) delegateCaller];
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = v5;
  }
  else
  {
    [*(id *)(a1 + 32) setDidOnboardAudioAnalysis:*(unsigned __int8 *)(a1 + 56)];
    uint64_t v11 = [*(id *)(a1 + 40) delegateCaller];
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = 0;
  }
  [v11 callCompletion:v13 error:v14];
}

- (void)updateAudioAnalysisClassifierOptions:(unint64_t)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = self;
  char v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    char v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v39 = v10;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Sending audio analysis classifier options update request", buf, 0xCu);
  }
  uint64_t v11 = [(HMHome *)v8 context];
  if (!v6)
  {
    uint64_t v26 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome updateAudioAnalysisClassifierOptions:completion:]", @"completion"];
    uint64_t v27 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v28 = v8;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v39 = v30;
      __int16 v40 = 2112;
      __int16 v41 = (const char *)v26;
      _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v31 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v26 userInfo:0];
    objc_exception_throw(v31);
  }
  uint64_t v12 = (void *)v11;
  if (v11)
  {
    if ([(HMHome *)v8 audioAnalysisClassifierOptions] != a3)
    {
      int v23 = [(HMHome *)v8 uuid];
      unint64_t v36 = @"HMHomeAudioAnalysisClassifierOptionsCodingKey";
      int v24 = [NSNumber numberWithUnsignedInteger:a3];
      BOOL v37 = v24;
      uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      void v32[2] = __58__HMHome_updateAudioAnalysisClassifierOptions_completion___block_invoke;
      v32[3] = &unk_1E5941330;
      v32[4] = v8;
      id v33 = v12;
      id v34 = v6;
      unint64_t v35 = a3;
      -[_HMContext sendMessage:target:payload:responseHandler:](v33, @"HMHomeAudioAnalysisClassifierOptionsRequestKey", v23, v25, v32);

      goto LABEL_14;
    }
    uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = v8;
    int v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMHome audioAnalysisClassifierOptions](v14, "audioAnalysisClassifierOptions"));
      __int16 v17 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      __int16 v39 = v16;
      __int16 v40 = 2112;
      __int16 v41 = v17;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@options already equal to %@, skipping", buf, 0x16u);
    }
    id v18 = [v12 delegateCaller];
    [v18 callCompletion:v6 error:0];
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x19F3A64A0]();
    id v20 = v8;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v39 = v22;
      __int16 v40 = 2080;
      __int16 v41 = "-[HMHome updateAudioAnalysisClassifierOptions:completion:]";
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v18);
  }

LABEL_14:
}

void __58__HMHome_updateAudioAnalysisClassifierOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = *(id *)(a1 + 32);
    char v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      char v10 = HMFGetLogIdentifier();
      int v15 = 138543618;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@AudioAnalysis classifier option update request responded with error: %@", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v11 = [*(id *)(a1 + 40) delegateCaller];
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = v5;
  }
  else
  {
    [*(id *)(a1 + 32) setAudioAnalysisClassifierOptions:*(void *)(a1 + 56)];
    uint64_t v11 = [*(id *)(a1 + 40) delegateCaller];
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = 0;
  }
  [v11 callCompletion:v13 error:v14];
}

- (void)updateSoundCheckEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *))a4;
  uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = self;
  char v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    char v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v39 = v10;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Sending setSoundCheck request", buf, 0xCu);
  }
  uint64_t v11 = [(HMHome *)v8 context];
  if (!v6)
  {
    uint64_t v26 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome updateSoundCheckEnabled:completion:]", @"completion"];
    uint64_t v27 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v28 = v8;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v39 = v30;
      __int16 v40 = 2112;
      __int16 v41 = (const char *)v26;
      _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v31 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v26 userInfo:0];
    objc_exception_throw(v31);
  }
  uint64_t v12 = (void *)v11;
  if (!v11)
  {
    id v16 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v17 = v8;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v39 = v19;
      __int16 v40 = 2080;
      __int16 v41 = "-[HMHome updateSoundCheckEnabled:completion:]";
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v6[2](v6, v20);
    goto LABEL_13;
  }
  if ([(HMHome *)v8 soundCheckEnabled] == v4)
  {
    uint64_t v21 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v22 = v8;
    int v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v24 = HMFGetLogIdentifier();
      HMFBooleanToString();
      uint64_t v25 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      __int16 v39 = v24;
      __int16 v40 = 2112;
      __int16 v41 = v25;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_INFO, "%{public}@soundCheck is already set to:%@, skipping request", buf, 0x16u);
    }
    id v20 = [v12 delegateCaller];
    [v20 callCompletion:v6 error:0];
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v13 = [(HMHome *)v8 uuid];
  unint64_t v36 = @"HMHomeSoundCheckCodingKey";
  id v14 = [NSNumber numberWithBool:v4];
  BOOL v37 = v14;
  int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  void v32[2] = __45__HMHome_updateSoundCheckEnabled_completion___block_invoke;
  v32[3] = &unk_1E5943980;
  v32[4] = v8;
  id v33 = v12;
  id v34 = v6;
  BOOL v35 = v4;
  -[_HMContext sendMessage:target:payload:responseHandler:](v33, @"HMHomeSetSoundCheckRequestKey", v13, v15, v32);

LABEL_14:
}

void __45__HMHome_updateSoundCheckEnabled_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = *(id *)(a1 + 32);
    char v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      char v10 = HMFGetLogIdentifier();
      int v20 = 138543618;
      uint64_t v21 = v10;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@SoundCheck request responded with error: %@", (uint8_t *)&v20, 0x16u);
    }
    uint64_t v11 = [*(id *)(a1 + 40) delegateCaller];
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = v5;
  }
  else
  {
    int v15 = (void *)MEMORY[0x19F3A64A0]([*(id *)(a1 + 32) setSoundCheckEnabled:*(unsigned __int8 *)(a1 + 56)]);
    id v16 = *(id *)(a1 + 32);
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      [*(id *)(a1 + 32) soundCheckEnabled];
      uint64_t v19 = HMFBooleanToString();
      int v20 = 138543618;
      uint64_t v21 = v18;
      __int16 v22 = 2112;
      id v23 = v19;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@Updated sound check value to %@", (uint8_t *)&v20, 0x16u);
    }
    uint64_t v11 = [*(id *)(a1 + 40) delegateCaller];
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = 0;
  }
  [v11 callCompletion:v13 error:v14];
}

- (void)setDismissedWalletKeyUWBUnlockOnboardingWithCompletion:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMHome *)self context];
  if (!v4)
  {
    uint64_t v20 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome setDismissedWalletKeyUWBUnlockOnboardingWithCompletion:]", @"completion"];
    uint64_t v21 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v22 = self;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v24;
      __int16 v32 = 2112;
      id v33 = (const char *)v20;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0];
    objc_exception_throw(v25);
  }
  id v6 = (void *)v5;
  if (v5)
  {
    BOOL v7 = [(HMHome *)self dismissedWalletKeyUWBUnlockOnboarding];
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    char v9 = self;
    char v10 = HMFGetOSLogHandle();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v11)
      {
        uint64_t v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v31 = v12;
        _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@dismissedWalletKeyUWBUnlockOnboarding is already set, skipping send message notification", buf, 0xCu);
      }
      uint64_t v13 = [v6 delegateCaller];
      [v13 callCompletion:v4 error:0];
    }
    else
    {
      if (v11)
      {
        id v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v31 = v18;
        _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending dismissed Wallet Key UWB Unlock Onboarding request", buf, 0xCu);
      }
      uint64_t v19 = [(HMHome *)v9 uuid];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __65__HMHome_setDismissedWalletKeyUWBUnlockOnboardingWithCompletion___block_invoke;
      v26[3] = &unk_1E5945510;
      id v27 = v6;
      uint64_t v28 = v9;
      id v29 = v4;
      -[_HMContext sendMessage:target:payload:responseHandler:](v27, @"HMHomeSetDismissedWalletKeyUWBUnlockOnboardingRequestKey", v19, 0, v26);

      uint64_t v13 = v27;
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x19F3A64A0]();
    int v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v17;
      __int16 v32 = 2080;
      id v33 = "-[HMHome setDismissedWalletKeyUWBUnlockOnboardingWithCompletion:]";
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v13);
  }
}

void __65__HMHome_setDismissedWalletKeyUWBUnlockOnboardingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v3 = [*(id *)(a1 + 32) delegateCaller];
    id v4 = v3;
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = v7;
  }
  else
  {
    [*(id *)(a1 + 40) setDismissedWalletKeyUWBUnlockOnboarding:1];
    uint64_t v3 = [*(id *)(a1 + 32) delegateCaller];
    id v4 = v3;
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = 0;
  }
  [v3 callCompletion:v5 error:v6];
}

- (void)setHasAnyUserAcknowledgedCameraRecordingOnboardingWithCompletionHandler:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMHome *)self context];
  if (!v4)
  {
    uint64_t v20 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome setHasAnyUserAcknowledgedCameraRecordingOnboardingWithCompletionHandler:]", @"completion"];
    uint64_t v21 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v22 = self;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v24;
      __int16 v32 = 2112;
      id v33 = (const char *)v20;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0];
    objc_exception_throw(v25);
  }
  id v6 = (void *)v5;
  if (v5)
  {
    BOOL v7 = [(HMHome *)self hasAnyUserAcknowledgedCameraRecordingOnboarding];
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    char v9 = self;
    char v10 = HMFGetOSLogHandle();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v11)
      {
        uint64_t v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v31 = v12;
        _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@setHasAnyUserAcknowledgedCameraRecordingOnboardingHandler is already set, skipping send message notification", buf, 0xCu);
      }
      uint64_t v13 = [v6 delegateCaller];
      [v13 callCompletion:v4 error:0];
    }
    else
    {
      if (v11)
      {
        id v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v31 = v18;
        _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending set any user has acknowledged camera recording onboarding request", buf, 0xCu);
      }
      uint64_t v19 = [(HMHome *)v9 uuid];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __82__HMHome_setHasAnyUserAcknowledgedCameraRecordingOnboardingWithCompletionHandler___block_invoke;
      v26[3] = &unk_1E5945510;
      id v27 = v6;
      uint64_t v28 = v9;
      id v29 = v4;
      -[_HMContext sendMessage:target:payload:responseHandler:](v27, @"HMHomeSetHasAnyUserAcknowledgedCameraRecordingOnboardingRequestKey", v19, 0, v26);

      uint64_t v13 = v27;
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x19F3A64A0]();
    int v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v17;
      __int16 v32 = 2080;
      id v33 = "-[HMHome setHasAnyUserAcknowledgedCameraRecordingOnboardingWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v13);
  }
}

void __82__HMHome_setHasAnyUserAcknowledgedCameraRecordingOnboardingWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v3 = [*(id *)(a1 + 32) delegateCaller];
    id v4 = v3;
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = v7;
  }
  else
  {
    [*(id *)(a1 + 40) setHasAnyUserAcknowledgedCameraRecordingOnboarding:1];
    uint64_t v3 = [*(id *)(a1 + 32) delegateCaller];
    id v4 = v3;
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = 0;
  }
  [v3 callCompletion:v5 error:v6];
}

- (void)setHasAnyUserAcknowledgedCameraRecordingOnboarding:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_hasAnyUserAcknowledgedCameraRecordingOnboarding = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasAnyUserAcknowledgedCameraRecordingOnboarding
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasAnyUserAcknowledgedCameraRecordingOnboarding;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_handleMultiUserEnabledChangeNotification:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v22 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Received multi-user enabled change notification", buf, 0xCu);
  }
  char v9 = [(HMHome *)v6 context];
  char v10 = [v9 pendingRequests];

  BOOL v11 = [v4 identifier];
  uint64_t v12 = [v10 removeCompletionBlockForIdentifier:v11];

  [(HMHome *)v6 setMultiUserEnabled:1];
  if (v12)
  {
    uint64_t v13 = [(HMHome *)v6 context];
    id v14 = [v13 delegateCaller];
    [v14 callCompletion:v12 error:0];
  }
  int v15 = [(HMHome *)v6 _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v16 = [(HMHome *)v6 context];
    __int16 v17 = [v16 delegateCaller];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __52__HMHome__handleMultiUserEnabledChangeNotification___block_invoke;
    v18[3] = &unk_1E5945628;
    id v19 = v15;
    uint64_t v20 = v6;
    [v17 invokeBlock:v18];
  }
}

uint64_t __52__HMHome__handleMultiUserEnabledChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeDidEnableMultiUser:*(void *)(a1 + 40)];
}

- (void)enableMultiUserWithCompletionHandler:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending enable multi-user request", buf, 0xCu);
  }
  uint64_t v9 = [(HMHome *)v6 context];
  if (!v4)
  {
    uint64_t v23 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome enableMultiUserWithCompletionHandler:]", @"completion"];
    uint64_t v24 = (void *)MEMORY[0x19F3A64A0]();
    id v25 = v6;
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v27;
      __int16 v35 = 2112;
      unint64_t v36 = (const char *)v23;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v28 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v23 userInfo:0];
    objc_exception_throw(v28);
  }
  char v10 = (void *)v9;
  if (v9)
  {
    if ([(HMHome *)v6 multiUserEnabled])
    {
      BOOL v11 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v12 = v6;
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v34 = v14;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@multiUserEnabled is already set, skipping request", buf, 0xCu);
      }
      int v15 = [v10 delegateCaller];
      [v15 callCompletion:v4 error:0];
    }
    else
    {
      int v15 = [MEMORY[0x1E4F65480] messageWithName:@"HMHomeEnableMultiUserRequestKey" messagePayload:MEMORY[0x1E4F1CC08]];
      objc_initWeak((id *)buf, v6);
      uint64_t v20 = [v10 messageDispatcher];
      uint64_t v21 = [(HMHome *)v6 uuid];
      __int16 v22 = [v10 queue];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __47__HMHome_enableMultiUserWithCompletionHandler___block_invoke;
      v29[3] = &unk_1E59441D8;
      objc_copyWeak(&v32, (id *)buf);
      id v30 = v10;
      id v31 = v4;
      [v20 sendMessage:v15 target:v21 responseQueue:v22 responseHandler:v29];

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v17 = v6;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v19;
      __int16 v35 = 2080;
      unint64_t v36 = "-[HMHome enableMultiUserWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    int v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v15);
  }
}

void __47__HMHome_enableMultiUserWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  char v10 = HMFGetOSLogHandle();
  BOOL v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v18 = 138543618;
      id v19 = v12;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Enable multi-user request responded with error: %@", (uint8_t *)&v18, 0x16u);
    }
    uint64_t v13 = [*(id *)(a1 + 32) delegateCaller];
    id v14 = v13;
    uint64_t v15 = *(void *)(a1 + 40);
    id v16 = v5;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = HMFGetLogIdentifier();
      int v18 = 138543362;
      id v19 = v17;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Enable multi-user request responded", (uint8_t *)&v18, 0xCu);
    }
    uint64_t v13 = [*(id *)(a1 + 32) delegateCaller];
    id v14 = v13;
    uint64_t v15 = *(void *)(a1 + 40);
    id v16 = 0;
  }
  [v13 callCompletion:v15 error:v16];
}

- (void)setMultiUserEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_multiUserEnabled = v3;
  os_unfair_lock_unlock(p_lock);
  if (v3)
  {
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v6 = [(HMHome *)self uuid];
    [v7 postNotificationName:@"HMHomeMultiUserEnabledChangeNotificationKey" object:v6];
  }
}

- (void)startHomeDataSyncWithCompletionHandler:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMHome *)self context];
  if (!v4)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome startHomeDataSyncWithCompletionHandler:]", @"completion"];
    __int16 v17 = (void *)MEMORY[0x19F3A64A0]();
    int v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      id v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v6 = (void *)v5;
  id v7 = [(HMHome *)self context];

  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  char v10 = HMFGetOSLogHandle();
  BOOL v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v12;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Sending start home data sync request", buf, 0xCu);
    }
    uint64_t v13 = [(HMHome *)v9 uuid];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __49__HMHome_startHomeDataSyncWithCompletionHandler___block_invoke;
    v22[3] = &unk_1E5945510;
    void v22[4] = v9;
    id v23 = v6;
    id v24 = v4;
    -[_HMContext sendMessage:target:payload:responseHandler:](v23, @"HM.syncHomeDataMessage", v13, MEMORY[0x1E4F1CC08], v22);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v14;
      __int16 v27 = 2080;
      id v28 = "-[HMHome startHomeDataSyncWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v15);
  }
}

void __49__HMHome_startHomeDataSyncWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  char v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = HMFGetLogIdentifier();
      int v17 = 138543618;
      int v18 = v11;
      __int16 v19 = 2112;
      id v20 = v5;
      uint64_t v12 = "%{public}@Start home data sync request completed with error %@";
      uint64_t v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v13, v14, v12, (uint8_t *)&v17, v15);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    BOOL v11 = HMFGetLogIdentifier();
    int v17 = 138543362;
    int v18 = v11;
    uint64_t v12 = "%{public}@Start home data sync request completed successfully";
    uint64_t v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 12;
    goto LABEL_6;
  }

  uint64_t v16 = [*(id *)(a1 + 40) delegateCaller];
  [v16 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)_updateName:(id)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMHome *)self context];
  id v9 = v8;
  if (v8)
  {
    if (v6)
    {
      unint64_t v10 = [v6 length];
      if (HMMaxLengthForNaming__hmf_once_t7 != -1) {
        dispatch_once(&HMMaxLengthForNaming__hmf_once_t7, &__block_literal_global_55_24575);
      }
      if (v10 <= HMMaxLengthForNaming__hmf_once_v8)
      {
        uint64_t v22 = [(HMHome *)self name];
        int v23 = [v22 isEqualToString:v6];

        if (!v23)
        {
          id v24 = [(HMHome *)self uuid];
          id v30 = @"kHomeName";
          id v31 = v6;
          id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __40__HMHome__updateName_completionHandler___block_invoke;
          v26[3] = &unk_1E5945510;
          id v27 = v9;
          id v28 = self;
          id v29 = v7;
          -[_HMContext sendMessage:target:payload:responseHandler:](v27, @"kRenameHomeRequestKey", v24, v25, v26);

          goto LABEL_16;
        }
        uint32_t v15 = [v9 delegateCaller];
        [v15 callCompletion:v7 error:0];
        goto LABEL_15;
      }
      BOOL v11 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v12 = self;
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        os_log_type_t v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v33 = v14;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", buf, 0xCu);
      }
      uint32_t v15 = [v9 delegateCaller];
      uint64_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:46];
    }
    else
    {
      uint32_t v15 = [v8 delegateCaller];
      uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:20 userInfo:0];
    }
    uint64_t v21 = (void *)v16;
    [v15 callCompletion:v7 error:v16];

LABEL_15:
    goto LABEL_16;
  }
  int v17 = (void *)MEMORY[0x19F3A64A0]();
  int v18 = self;
  __int16 v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    id v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v33 = v20;
    __int16 v34 = 2080;
    __int16 v35 = "-[HMHome _updateName:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v7)
  {
    uint32_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
    goto LABEL_15;
  }
LABEL_16:
}

void __40__HMHome__updateName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  if (v10)
  {
    id v5 = [*(id *)(a1 + 32) delegateCaller];
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = v10;
  }
  else
  {
    id v9 = objc_msgSend(a3, "hmf_stringForKey:", @"kHomeName");
    [*(id *)(a1 + 40) setName:v9];

    id v5 = [*(id *)(a1 + 32) delegateCaller];
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = 0;
  }
  [v5 callCompletion:v7 error:v8];
}

- (void)updateName:(NSString *)name completionHandler:(void *)completion
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = name;
  uint64_t v7 = completion;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v17 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome updateName:completionHandler:]", @"completion"];
    int v18 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v27 = v21;
      __int16 v28 = 2112;
      id v29 = (const char *)v17;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0];
    objc_exception_throw(v22);
  }
  id v9 = (void *)v8;
  id v10 = [(HMHome *)self context];

  if (v10)
  {
    BOOL v11 = [v9 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__HMHome_updateName_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    void block[4] = self;
    id v24 = v6;
    id v25 = v7;
    dispatch_async(v11, block);
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v13 = self;
    os_log_type_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint32_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v27 = v15;
      __int16 v28 = 2080;
      id v29 = "-[HMHome updateName:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v16);
  }
}

uint64_t __39__HMHome_updateName_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateName:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (id)_getUserWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self currentUsers];
  id v6 = [v5 firstItemWithUUID:v4];

  if (!v6)
  {
    uint64_t v7 = [(HMHome *)self currentUser];
    uint64_t v8 = [v7 uuid];
    int v9 = [v4 isEqual:v8];

    if (v9)
    {
      id v6 = [(HMHome *)self currentUser];
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

- (void)fetchPresenceForUsers:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v18);
  }
  uint64_t v8 = (void (**)(void, void, void))v7;
  int v9 = [(HMHome *)self context];
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
    os_log_type_t v14 = self;
    uint32_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v25 = v16;
      uint64_t v17 = "%{public}@presence map fetch error: no context";
LABEL_9:
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);
    }
LABEL_10:

    id v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v10);
    goto LABEL_11;
  }
  if (![v6 count])
  {
    uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
    os_log_type_t v14 = self;
    uint32_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v25 = v16;
      uint64_t v17 = "%{public}@presence map fetch error: no user count";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  id v10 = objc_msgSend(v6, "na_map:", &__block_literal_global_29202);
  BOOL v11 = [(HMHome *)self uuid];
  id v22 = @"HMHomeUserUUIDsMessageKey";
  int v23 = v10;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __43__HMHome_fetchPresenceForUsers_completion___block_invoke_2;
  v19[3] = &unk_1E5945510;
  v19[4] = self;
  uint64_t v21 = v8;
  id v20 = v6;
  -[_HMContext sendMessage:target:payload:responseHandler:](v9, @"HMFetchPresenceMapMessage", v11, v12, v19);

LABEL_11:
}

void __43__HMHome_fetchPresenceForUsers_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = [a1[4] context];
    id v7 = [v6 delegateCaller];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __43__HMHome_fetchPresenceForUsers_completion___block_invoke_3;
    void v23[3] = &unk_1E5945138;
    void v23[4] = a1[4];
    id v24 = v5;
    id v25 = a1[6];
    [v7 invokeBlock:v23];
  }
  else
  {
    uint64_t v8 = objc_msgSend(a3, "hmf_dictionaryForKey:", @"HMUserPresenceMapKey");
    int v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __43__HMHome_fetchPresenceForUsers_completion___block_invoke_949;
    void v21[3] = &unk_1E5941308;
    v21[4] = a1[4];
    id v10 = v9;
    id v22 = v10;
    [v8 enumerateKeysAndObjectsUsingBlock:v21];
    BOOL v11 = [a1[4] context];
    uint64_t v12 = [v11 delegateCaller];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __43__HMHome_fetchPresenceForUsers_completion___block_invoke_951;
    v16[3] = &unk_1E5944360;
    id v17 = v8;
    id v18 = a1[5];
    id v13 = a1[6];
    id v19 = v10;
    id v20 = v13;
    id v14 = v10;
    id v15 = v8;
    [v12 invokeBlock:v16];
  }
}

uint64_t __43__HMHome_fetchPresenceForUsers_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    int v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while fetching the presence for users: %@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __43__HMHome_fetchPresenceForUsers_completion___block_invoke_949(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  int v9 = [*(id *)(a1 + 32) _getUserWithUUID:v7];
  if (v9)
  {
    [*(id *)(a1 + 40) setObject:v8 forKey:v9];
  }
  else
  {
    __int16 v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = 138543618;
      id v15 = v13;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to find HMUser with UUID: %@", (uint8_t *)&v14, 0x16u);
    }
    *a4 = 1;
  }
}

void __43__HMHome_fetchPresenceForUsers_completion___block_invoke_951(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) count];
  uint64_t v3 = [*(id *)(a1 + 40) count];
  uint64_t v4 = *(void *)(a1 + 56);
  if (v2 == v3)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, void))(v4 + 16);
    uint64_t v7 = *(void *)(a1 + 56);
    v6(v7, v5, 0);
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v8);
  }
}

uint64_t __43__HMHome_fetchPresenceForUsers_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (BOOL)_mergeAccessoryProtectionGroups:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [HMObjectMergeCollection alloc];
  uint64_t v6 = [(HMHome *)self currentAccessoryProtectionGroups];
  uint64_t v7 = [v6 array];
  id v8 = [(HMObjectMergeCollection *)v5 initWithCurrentObjects:v7 newObjects:v4];

  int v9 = [(HMObjectMergeCollection *)v8 removedObjects];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __42__HMHome__mergeAccessoryProtectionGroups___block_invoke;
  void v21[3] = &unk_1E59412C0;
  v21[4] = self;
  [v9 enumerateObjectsUsingBlock:v21];

  __int16 v10 = [(HMObjectMergeCollection *)v8 addedObjects];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __42__HMHome__mergeAccessoryProtectionGroups___block_invoke_935;
  v20[3] = &unk_1E59412C0;
  void v20[4] = self;
  [v10 enumerateObjectsUsingBlock:v20];

  [(HMObjectMergeCollection *)v8 mergeCommonObjects];
  id v11 = [(HMObjectMergeCollection *)v8 finalObjects];
  uint64_t v12 = [(HMHome *)self currentAccessoryProtectionGroups];
  [v12 setArray:v11];

  id v13 = [(HMObjectMergeCollection *)v8 removedObjects];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __42__HMHome__mergeAccessoryProtectionGroups___block_invoke_936;
  v19[3] = &unk_1E59412C0;
  v19[4] = self;
  [v13 enumerateObjectsUsingBlock:v19];

  int v14 = [(HMObjectMergeCollection *)v8 addedObjects];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __42__HMHome__mergeAccessoryProtectionGroups___block_invoke_2;
  v18[3] = &unk_1E59412C0;
  void v18[4] = self;
  [v14 enumerateObjectsUsingBlock:v18];

  id v15 = [(HMObjectMergeCollection *)v8 updatedObjects];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __42__HMHome__mergeAccessoryProtectionGroups___block_invoke_2_939;
  v17[3] = &unk_1E59412C0;
  v17[4] = self;
  [v15 enumerateObjectsUsingBlock:v17];

  LOBYTE(self) = [(HMObjectMergeCollection *)v8 isModified];
  return (char)self;
}

void __42__HMHome__mergeAccessoryProtectionGroups___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    int v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed network protection group via merge: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __42__HMHome__mergeAccessoryProtectionGroups___block_invoke_935(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    int v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added network protection group via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  [v3 _configureWithHome:*(void *)(a1 + 32)];
}

void __42__HMHome__mergeAccessoryProtectionGroups___block_invoke_936(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    int v14 = v7;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Calling didRemoveAccessoryNetworkProtectionGroup with network protection group: %@", buf, 0x16u);
  }
  int v8 = [*(id *)(a1 + 32) context];
  int v9 = [v8 queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__HMHome__mergeAccessoryProtectionGroups___block_invoke_937;
  v11[3] = &unk_1E5945628;
  void v11[4] = *(void *)(a1 + 32);
  id v12 = v3;
  id v10 = v3;
  dispatch_async(v9, v11);
}

void __42__HMHome__mergeAccessoryProtectionGroups___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    int v14 = v7;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Calling didAddAccessoryNetworkProtectionGroup with network protection group: %@", buf, 0x16u);
  }
  int v8 = [*(id *)(a1 + 32) context];
  int v9 = [v8 queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__HMHome__mergeAccessoryProtectionGroups___block_invoke_938;
  v11[3] = &unk_1E5945628;
  void v11[4] = *(void *)(a1 + 32);
  id v12 = v3;
  id v10 = v3;
  dispatch_async(v9, v11);
}

void __42__HMHome__mergeAccessoryProtectionGroups___block_invoke_2_939(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    int v14 = v7;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateAccessoryNetworkProtectionGroup with network protection group: %@", buf, 0x16u);
  }
  int v8 = [*(id *)(a1 + 32) context];
  int v9 = [v8 queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__HMHome__mergeAccessoryProtectionGroups___block_invoke_940;
  v11[3] = &unk_1E5945628;
  void v11[4] = *(void *)(a1 + 32);
  id v12 = v3;
  id v10 = v3;
  dispatch_async(v9, v11);
}

uint64_t __42__HMHome__mergeAccessoryProtectionGroups___block_invoke_940(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didUpdateAccessoryNetworkProtectionGroup:*(void *)(a1 + 40)];
}

uint64_t __42__HMHome__mergeAccessoryProtectionGroups___block_invoke_938(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didAddAccessoryNetworkProtectionGroup:*(void *)(a1 + 40)];
}

uint64_t __42__HMHome__mergeAccessoryProtectionGroups___block_invoke_937(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didRemoveAccessoryNetworkProtectionGroup:*(void *)(a1 + 40)];
}

- (BOOL)_mergeOutgoingInvitations:(id)a3
{
  id v4 = a3;
  id v5 = [HMObjectMergeCollection alloc];
  uint64_t v6 = [(HMHome *)self currentOutgoingInvitations];
  uint64_t v7 = [v6 array];
  int v8 = [(HMObjectMergeCollection *)v5 initWithCurrentObjects:v7 newObjects:v4];

  int v9 = [(HMObjectMergeCollection *)v8 removedObjects];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __36__HMHome__mergeOutgoingInvitations___block_invoke;
  v26[3] = &unk_1E5941298;
  void v26[4] = self;
  [v9 enumerateObjectsUsingBlock:v26];

  id v10 = [(HMObjectMergeCollection *)v8 addedObjects];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __36__HMHome__mergeOutgoingInvitations___block_invoke_931;
  void v25[3] = &unk_1E5941298;
  v25[4] = self;
  [v10 enumerateObjectsUsingBlock:v25];

  [(HMObjectMergeCollection *)v8 mergeCommonObjects];
  id v11 = [(HMObjectMergeCollection *)v8 finalObjects];
  id v12 = [(HMHome *)self currentOutgoingInvitations];
  [v12 setArray:v11];

  id v13 = [MEMORY[0x1E4F1CA48] array];
  int v14 = [(HMObjectMergeCollection *)v8 addedObjects];
  [v13 addObjectsFromArray:v14];

  __int16 v15 = [(HMObjectMergeCollection *)v8 removedObjects];
  [v13 addObjectsFromArray:v15];

  id v16 = [(HMObjectMergeCollection *)v8 updatedObjects];
  [v13 addObjectsFromArray:v16];

  uint64_t v17 = [(HMHome *)self _privateDelegate];
  if ([v13 count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v18 = [(HMHome *)self context];
    id v19 = [v18 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__HMHome__mergeOutgoingInvitations___block_invoke_933;
    block[3] = &unk_1E5945650;
    void block[4] = self;
    id v23 = v17;
    id v24 = v13;
    dispatch_async(v19, block);
  }
  BOOL v20 = [(HMObjectMergeCollection *)v8 isModified];

  return v20;
}

void __36__HMHome__mergeOutgoingInvitations___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    int v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed outgoing invitation via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  [v3 _unconfigure];
  [v3 _updateInvitationState:1];
}

void __36__HMHome__mergeOutgoingInvitations___block_invoke_931(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v25 = v7;
    __int16 v26 = 2112;
    id v27 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added outgoing invitation via merge: %@", buf, 0x16u);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v18 = v3;
  int v8 = [v3 accessoryInvitations];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int v14 = [v13 accessory];
        __int16 v15 = [*(id *)(a1 + 32) accessories];
        id v16 = [v14 uniqueIdentifier];
        uint64_t v17 = objc_msgSend(v15, "hmf_firstObjectWithUniqueIdentifier:", v16);

        [v13 setAccessory:v17];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  [*(id *)(a1 + 32) _configureOutgoingInvitation:v18];
}

void __36__HMHome__mergeOutgoingInvitations___block_invoke_933(id *a1)
{
  uint64_t v2 = [a1[4] context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__HMHome__mergeOutgoingInvitations___block_invoke_2;
  v6[3] = &unk_1E5945650;
  id v4 = a1[5];
  id v5 = a1[4];
  id v7 = v4;
  id v8 = v5;
  id v9 = a1[6];
  [v3 invokeBlock:v6];
}

uint64_t __36__HMHome__mergeOutgoingInvitations___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateStateForOutgoingInvitations:*(void *)(a1 + 48)];
}

- (void)_configureOutgoingInvitation:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self context];
  objc_msgSend(v4, "__configureWithContext:home:", v5, self);
}

- (BOOL)_mergeResidentDevices:(id)a3
{
  id v4 = a3;
  id v5 = [HMObjectMergeCollection alloc];
  uint64_t v6 = [(HMHome *)self currentResidentDevices];
  id v7 = [v6 array];
  id v8 = [(HMObjectMergeCollection *)v5 initWithCurrentObjects:v7 newObjects:v4];

  id v9 = [(HMObjectMergeCollection *)v8 removedObjects];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __32__HMHome__mergeResidentDevices___block_invoke;
  v19[3] = &unk_1E5941270;
  v19[4] = self;
  [v9 enumerateObjectsUsingBlock:v19];

  uint64_t v10 = [(HMObjectMergeCollection *)v8 addedObjects];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __32__HMHome__mergeResidentDevices___block_invoke_923;
  v18[3] = &unk_1E5941270;
  void v18[4] = self;
  [v10 enumerateObjectsUsingBlock:v18];

  [(HMObjectMergeCollection *)v8 mergeCommonObjects];
  uint64_t v11 = [(HMObjectMergeCollection *)v8 finalObjects];
  uint64_t v12 = [(HMHome *)self currentResidentDevices];
  [v12 setArray:v11];

  id v13 = [(HMObjectMergeCollection *)v8 removedObjects];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __32__HMHome__mergeResidentDevices___block_invoke_924;
  v17[3] = &unk_1E5941270;
  v17[4] = self;
  [v13 enumerateObjectsUsingBlock:v17];

  int v14 = [(HMObjectMergeCollection *)v8 addedObjects];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __32__HMHome__mergeResidentDevices___block_invoke_926;
  v16[3] = &unk_1E5941270;
  void v16[4] = self;
  [v14 enumerateObjectsUsingBlock:v16];

  LOBYTE(self) = [(HMObjectMergeCollection *)v8 isModified];
  return (char)self;
}

void __32__HMHome__mergeResidentDevices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed resident device via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  [v3 _unconfigure];
}

void __32__HMHome__mergeResidentDevices___block_invoke_923(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    __int16 v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added resident device via merge: %@", (uint8_t *)&v9, 0x16u);
  }
  int v8 = [*(id *)(a1 + 32) context];
  objc_msgSend(v3, "__configureWithContext:home:", v8, *(void *)(a1 + 32));
}

void __32__HMHome__mergeResidentDevices___block_invoke_924(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  if ([v4 conformsToProtocol:&unk_1EEF70488]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (objc_opt_respondsToSelector())
  {
    id v7 = [*(id *)(a1 + 32) context];
    int v8 = [v7 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__HMHome__mergeResidentDevices___block_invoke_2;
    block[3] = &unk_1E5945650;
    void block[4] = *(void *)(a1 + 32);
    id v10 = v3;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

void __32__HMHome__mergeResidentDevices___block_invoke_926(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) context];
  objc_msgSend(v3, "__configureWithContext:home:", v4, *(void *)(a1 + 32));

  id v5 = [*(id *)(a1 + 32) delegate];
  if ([v5 conformsToProtocol:&unk_1EEF70488]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (objc_opt_respondsToSelector())
  {
    int v8 = [*(id *)(a1 + 32) context];
    int v9 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__HMHome__mergeResidentDevices___block_invoke_2_928;
    block[3] = &unk_1E5945650;
    void block[4] = *(void *)(a1 + 32);
    id v11 = v3;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

void __32__HMHome__mergeResidentDevices___block_invoke_2_928(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__HMHome__mergeResidentDevices___block_invoke_3_929;
  v5[3] = &unk_1E5945650;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

uint64_t __32__HMHome__mergeResidentDevices___block_invoke_3_929(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    int v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didAddResidentDevice with resident device: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) home:*(void *)(a1 + 32) didAddResidentDevice:*(void *)(a1 + 40)];
}

void __32__HMHome__mergeResidentDevices___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__HMHome__mergeResidentDevices___block_invoke_3;
  v5[3] = &unk_1E5945650;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

uint64_t __32__HMHome__mergeResidentDevices___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    int v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didRemoveResidentDevice with resident device: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) home:*(void *)(a1 + 32) didRemoveResidentDevice:*(void *)(a1 + 40)];
}

- (BOOL)_mergeUsers:(id)a3
{
  id v4 = a3;
  id v5 = [HMObjectMergeCollection alloc];
  uint64_t v6 = [(HMHome *)self currentUsers];
  id v7 = [v6 array];
  int v8 = [(HMObjectMergeCollection *)v5 initWithCurrentObjects:v7 newObjects:v4];

  int v9 = [(HMObjectMergeCollection *)v8 removedObjects];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __22__HMHome__mergeUsers___block_invoke;
  v19[3] = &unk_1E5943AA8;
  v19[4] = self;
  [v9 enumerateObjectsUsingBlock:v19];

  __int16 v10 = [(HMObjectMergeCollection *)v8 addedObjects];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __22__HMHome__mergeUsers___block_invoke_915;
  v18[3] = &unk_1E5943AA8;
  void v18[4] = self;
  [v10 enumerateObjectsUsingBlock:v18];

  [(HMObjectMergeCollection *)v8 mergeCommonObjects];
  uint64_t v11 = [(HMObjectMergeCollection *)v8 finalObjects];
  uint64_t v12 = [(HMHome *)self currentUsers];
  [v12 setArray:v11];

  uint64_t v13 = [(HMObjectMergeCollection *)v8 removedObjects];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __22__HMHome__mergeUsers___block_invoke_916;
  v17[3] = &unk_1E5943AA8;
  v17[4] = self;
  [v13 enumerateObjectsUsingBlock:v17];

  int v14 = [(HMObjectMergeCollection *)v8 addedObjects];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __22__HMHome__mergeUsers___block_invoke_918;
  v16[3] = &unk_1E5943AA8;
  void v16[4] = self;
  [v14 enumerateObjectsUsingBlock:v16];

  LOBYTE(self) = [(HMObjectMergeCollection *)v8 isModified];
  return (char)self;
}

void __22__HMHome__mergeUsers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    int v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed user via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  [v3 _unconfigure];
}

void __22__HMHome__mergeUsers___block_invoke_915(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    __int16 v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added user via merge: %@", (uint8_t *)&v9, 0x16u);
  }
  int v8 = [*(id *)(a1 + 32) context];
  objc_msgSend(v3, "__configureWithContext:home:", v8, *(void *)(a1 + 32));
}

void __22__HMHome__mergeUsers___block_invoke_916(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [*(id *)(a1 + 32) context];
    uint64_t v6 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __22__HMHome__mergeUsers___block_invoke_2;
    block[3] = &unk_1E5945650;
    void block[4] = *(void *)(a1 + 32);
    id v8 = v3;
    id v9 = v4;
    dispatch_async(v6, block);
  }
}

void __22__HMHome__mergeUsers___block_invoke_918(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [*(id *)(a1 + 32) context];
    uint64_t v6 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __22__HMHome__mergeUsers___block_invoke_2_920;
    block[3] = &unk_1E5945650;
    void block[4] = *(void *)(a1 + 32);
    id v8 = v3;
    id v9 = v4;
    dispatch_async(v6, block);
  }
}

void __22__HMHome__mergeUsers___block_invoke_2_920(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __22__HMHome__mergeUsers___block_invoke_3_921;
  v5[3] = &unk_1E5945650;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

uint64_t __22__HMHome__mergeUsers___block_invoke_3_921(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didAddUser with user: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) home:*(void *)(a1 + 32) didAddUser:*(void *)(a1 + 40)];
}

void __22__HMHome__mergeUsers___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __22__HMHome__mergeUsers___block_invoke_3;
  v5[3] = &unk_1E5945650;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

uint64_t __22__HMHome__mergeUsers___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didRemoveUser with user: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) home:*(void *)(a1 + 32) didRemoveUser:*(void *)(a1 + 40)];
}

- (BOOL)_mergeTriggers:(id)a3
{
  id v4 = a3;
  id v5 = [HMObjectMergeCollection alloc];
  uint64_t v6 = [(HMHome *)self currentTriggers];
  id v7 = [v6 array];
  int v8 = [(HMObjectMergeCollection *)v5 initWithCurrentObjects:v7 newObjects:v4];

  id v9 = [(HMObjectMergeCollection *)v8 removedObjects];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __25__HMHome__mergeTriggers___block_invoke;
  v19[3] = &unk_1E5941248;
  v19[4] = self;
  [v9 enumerateObjectsUsingBlock:v19];

  __int16 v10 = [(HMObjectMergeCollection *)v8 addedObjects];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __25__HMHome__mergeTriggers___block_invoke_911;
  v18[3] = &unk_1E5941248;
  void v18[4] = self;
  [v10 enumerateObjectsUsingBlock:v18];

  [(HMObjectMergeCollection *)v8 mergeCommonObjects];
  uint64_t v11 = [(HMObjectMergeCollection *)v8 finalObjects];
  uint64_t v12 = [(HMHome *)self currentTriggers];
  [v12 setArray:v11];

  uint64_t v13 = [(HMObjectMergeCollection *)v8 removedObjects];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __25__HMHome__mergeTriggers___block_invoke_913;
  v17[3] = &unk_1E5941248;
  v17[4] = self;
  [v13 enumerateObjectsUsingBlock:v17];

  int v14 = [(HMObjectMergeCollection *)v8 addedObjects];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __25__HMHome__mergeTriggers___block_invoke_3;
  v16[3] = &unk_1E5941248;
  void v16[4] = self;
  [v14 enumerateObjectsUsingBlock:v16];

  LOBYTE(self) = [(HMObjectMergeCollection *)v8 isModified];
  return (char)self;
}

void __25__HMHome__mergeTriggers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed trigger via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  [v3 _unconfigure];
}

void __25__HMHome__mergeTriggers___block_invoke_911(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  uint64_t v34 = a1;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v43 = v7;
    __int16 v44 = 2112;
    id v45 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added trigger via merge: %@", buf, 0x16u);

    a1 = v34;
  }

  int v8 = [*(id *)(a1 + 32) context];
  objc_msgSend(v3, "__configureWithContext:home:", v8, *(void *)(a1 + 32));

  id v9 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v10 = v9;
  }
  else {
    __int16 v10 = 0;
  }
  id v11 = v10;

  id v32 = v11;
  [v11 _updateCharacteristicReference];
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  __int16 v35 = v9;
  uint64_t v13 = [v9 actionSets];
  uint64_t v37 = [v13 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v37)
  {
    uint64_t v14 = *(void *)v39;
    id v33 = v13;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v13);
        }
        id v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v17 = [v16 actionSetType];
        int v18 = [v17 isEqualToString:@"HMActionSetTypeTriggerOwned"];

        long long v19 = *(void **)(a1 + 32);
        long long v20 = [v16 uuid];
        if (v18) {
          [v19 triggerOwnedActionSetWithUUID:v20];
        }
        else {
        long long v21 = [v19 actionSetWithUUID:v20];
        }

        if (v21)
        {
          [v12 addObject:v21];
        }
        else
        {
          long long v22 = (void *)MEMORY[0x19F3A64A0]();
          id v23 = *(id *)(a1 + 32);
          id v24 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            id v25 = HMFGetLogIdentifier();
            __int16 v26 = [v16 uuid];
            id v27 = [v16 actionSetType];
            [v35 uuid];
            uint64_t v36 = v22;
            uint64_t v28 = v14;
            v30 = id v29 = v12;
            *(_DWORD *)buf = 138544130;
            uint64_t v43 = v25;
            __int16 v44 = 2112;
            id v45 = v26;
            __int16 v46 = 2112;
            id v47 = v27;
            __int16 v48 = 2112;
            __int16 v49 = v30;
            _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@Could not find action set %@/%@ for added trigger: %@", buf, 0x2Au);

            uint64_t v12 = v29;
            uint64_t v14 = v28;
            long long v22 = v36;

            a1 = v34;
            uint64_t v13 = v33;
          }
        }
      }
      uint64_t v37 = [v13 countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v37);
  }

  id v31 = [v35 currentActionSets];
  [v31 setArray:v12];
}

void __25__HMHome__mergeTriggers___block_invoke_913(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) context];
  id v5 = [v4 queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__HMHome__mergeTriggers___block_invoke_2;
  v7[3] = &unk_1E5945628;
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __25__HMHome__mergeTriggers___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) context];
  id v5 = [v4 queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__HMHome__mergeTriggers___block_invoke_4;
  v7[3] = &unk_1E5945628;
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __25__HMHome__mergeTriggers___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfTriggerAdded:*(void *)(a1 + 40)];
}

uint64_t __25__HMHome__mergeTriggers___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfTriggerRemoved:*(void *)(a1 + 40)];
}

- (BOOL)_mergeTriggerOwnedActionSets:(id)a3
{
  id v4 = a3;
  id v5 = [HMObjectMergeCollection alloc];
  id v6 = [(HMHome *)self currentTriggerOwnedActionSets];
  id v7 = [v6 array];
  id v8 = [(HMObjectMergeCollection *)v5 initWithCurrentObjects:v7 newObjects:v4];

  id v9 = [(HMObjectMergeCollection *)v8 removedObjects];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __39__HMHome__mergeTriggerOwnedActionSets___block_invoke;
  v15[3] = &unk_1E5941220;
  void v15[4] = self;
  [v9 enumerateObjectsUsingBlock:v15];

  __int16 v10 = [(HMObjectMergeCollection *)v8 addedObjects];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __39__HMHome__mergeTriggerOwnedActionSets___block_invoke_909;
  v14[3] = &unk_1E5941220;
  void v14[4] = self;
  [v10 enumerateObjectsUsingBlock:v14];

  [(HMObjectMergeCollection *)v8 mergeCommonObjects];
  id v11 = [(HMObjectMergeCollection *)v8 finalObjects];
  uint64_t v12 = [(HMHome *)self currentTriggerOwnedActionSets];
  [v12 setArray:v11];

  LOBYTE(v12) = [(HMObjectMergeCollection *)v8 isModified];
  return (char)v12;
}

void __39__HMHome__mergeTriggerOwnedActionSets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed trigger-owned action set via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  [v3 _unconfigure];
}

void __39__HMHome__mergeTriggerOwnedActionSets___block_invoke_909(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    __int16 v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added trigger-owned action set via merge: %@", (uint8_t *)&v9, 0x16u);
  }
  int v8 = [*(id *)(a1 + 32) context];
  objc_msgSend(v3, "__configureWithContext:home:", v8, *(void *)(a1 + 32));
}

- (BOOL)_mergeActionSets:(id)a3
{
  id v4 = a3;
  id v5 = [HMObjectMergeCollection alloc];
  id v6 = [(HMHome *)self currentActionSets];
  id v7 = [v6 array];
  int v8 = [(HMObjectMergeCollection *)v5 initWithCurrentObjects:v7 newObjects:v4];

  int v9 = [(HMObjectMergeCollection *)v8 removedObjects];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __27__HMHome__mergeActionSets___block_invoke;
  v19[3] = &unk_1E5941220;
  v19[4] = self;
  [v9 enumerateObjectsUsingBlock:v19];

  __int16 v10 = [(HMObjectMergeCollection *)v8 addedObjects];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __27__HMHome__mergeActionSets___block_invoke_902;
  v18[3] = &unk_1E5941220;
  void v18[4] = self;
  [v10 enumerateObjectsUsingBlock:v18];

  [(HMObjectMergeCollection *)v8 mergeCommonObjects];
  __int16 v11 = [(HMObjectMergeCollection *)v8 finalObjects];
  id v12 = [(HMHome *)self currentActionSets];
  [v12 setArray:v11];

  uint64_t v13 = [(HMObjectMergeCollection *)v8 removedObjects];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __27__HMHome__mergeActionSets___block_invoke_903;
  v17[3] = &unk_1E5941220;
  v17[4] = self;
  [v13 enumerateObjectsUsingBlock:v17];

  uint64_t v14 = [(HMObjectMergeCollection *)v8 addedObjects];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __27__HMHome__mergeActionSets___block_invoke_905;
  v16[3] = &unk_1E5941220;
  void v16[4] = self;
  [v14 enumerateObjectsUsingBlock:v16];

  LOBYTE(self) = [(HMObjectMergeCollection *)v8 isModified];
  return (char)self;
}

void __27__HMHome__mergeActionSets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    int v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed action set via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  [v3 _unconfigure];
}

void __27__HMHome__mergeActionSets___block_invoke_902(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    __int16 v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added action set via merge: %@", (uint8_t *)&v9, 0x16u);
  }
  int v8 = [*(id *)(a1 + 32) context];
  objc_msgSend(v3, "__configureWithContext:home:", v8, *(void *)(a1 + 32));
}

void __27__HMHome__mergeActionSets___block_invoke_903(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [*(id *)(a1 + 32) context];
    id v6 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__HMHome__mergeActionSets___block_invoke_2;
    block[3] = &unk_1E5945650;
    void block[4] = *(void *)(a1 + 32);
    id v8 = v3;
    id v9 = v4;
    dispatch_async(v6, block);
  }
}

void __27__HMHome__mergeActionSets___block_invoke_905(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [*(id *)(a1 + 32) context];
    id v6 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__HMHome__mergeActionSets___block_invoke_2_907;
    block[3] = &unk_1E5945650;
    void block[4] = *(void *)(a1 + 32);
    id v8 = v3;
    id v9 = v4;
    dispatch_async(v6, block);
  }
}

void __27__HMHome__mergeActionSets___block_invoke_2_907(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__HMHome__mergeActionSets___block_invoke_3_908;
  v5[3] = &unk_1E5945650;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

uint64_t __27__HMHome__mergeActionSets___block_invoke_3_908(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didAddActionSet with action set: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) home:*(void *)(a1 + 32) didAddActionSet:*(void *)(a1 + 40)];
}

void __27__HMHome__mergeActionSets___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__HMHome__mergeActionSets___block_invoke_3;
  v5[3] = &unk_1E5945650;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

uint64_t __27__HMHome__mergeActionSets___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didRemoveActionSet with action set: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) home:*(void *)(a1 + 32) didRemoveActionSet:*(void *)(a1 + 40)];
}

- (BOOL)_mergeServiceGroups:(id)a3
{
  id v4 = a3;
  id v5 = [HMObjectMergeCollection alloc];
  uint64_t v6 = [(HMHome *)self currentServiceGroups];
  id v7 = [v6 array];
  int v8 = [(HMObjectMergeCollection *)v5 initWithCurrentObjects:v7 newObjects:v4];

  id v9 = [(HMObjectMergeCollection *)v8 removedObjects];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __30__HMHome__mergeServiceGroups___block_invoke;
  v19[3] = &unk_1E59411F8;
  v19[4] = self;
  [v9 enumerateObjectsUsingBlock:v19];

  __int16 v10 = [(HMObjectMergeCollection *)v8 addedObjects];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __30__HMHome__mergeServiceGroups___block_invoke_894;
  v18[3] = &unk_1E59411F8;
  void v18[4] = self;
  [v10 enumerateObjectsUsingBlock:v18];

  [(HMObjectMergeCollection *)v8 mergeCommonObjects];
  uint64_t v11 = [(HMObjectMergeCollection *)v8 finalObjects];
  uint64_t v12 = [(HMHome *)self currentServiceGroups];
  [v12 setArray:v11];

  uint64_t v13 = [(HMObjectMergeCollection *)v8 removedObjects];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __30__HMHome__mergeServiceGroups___block_invoke_895;
  v17[3] = &unk_1E59411F8;
  v17[4] = self;
  [v13 enumerateObjectsUsingBlock:v17];

  uint64_t v14 = [(HMObjectMergeCollection *)v8 addedObjects];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __30__HMHome__mergeServiceGroups___block_invoke_897;
  v16[3] = &unk_1E59411F8;
  void v16[4] = self;
  [v14 enumerateObjectsUsingBlock:v16];

  LOBYTE(self) = [(HMObjectMergeCollection *)v8 isModified];
  return (char)self;
}

void __30__HMHome__mergeServiceGroups___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed service group via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  [v3 _unconfigure];
}

void __30__HMHome__mergeServiceGroups___block_invoke_894(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v31 = a1;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v40 = v7;
    __int16 v41 = 2112;
    id v42 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added service group via merge: %@", buf, 0x16u);
  }
  uint64_t v8 = v31;
  id v9 = [*(id *)(v31 + 32) context];
  objc_msgSend(v3, "__configureWithContext:home:", v9, *(void *)(v31 + 32));

  __int16 v10 = [MEMORY[0x1E4F1CA48] array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v32 = v3;
  id v11 = [v3 services];
  uint64_t v34 = [v11 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v36;
    *(void *)&long long v12 = 138543874;
    long long v29 = v12;
    uint64_t v30 = v11;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(v11);
        }
        uint64_t v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        __int16 v15 = *(void **)(v8 + 32);
        id v16 = objc_msgSend(v14, "accessory", v29);
        uint64_t v17 = [v16 uuid];
        int v18 = [v15 accessoryWithUUID:v17];

        long long v19 = [v14 instanceID];
        long long v20 = [v18 _findService:v19];

        if (v20)
        {
          [v10 addObject:v20];
        }
        else
        {
          long long v21 = (void *)MEMORY[0x19F3A64A0]();
          id v22 = *(id *)(v8 + 32);
          id v23 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v25 = id v24 = v10;
            __int16 v26 = [v14 uuid];
            id v27 = [v32 uuid];
            *(_DWORD *)buf = v29;
            long long v40 = v25;
            __int16 v41 = 2112;
            id v42 = v26;
            __int16 v43 = 2112;
            __int16 v44 = v27;
            _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Could not find service %@ for added service group: %@", buf, 0x20u);

            uint64_t v8 = v31;
            __int16 v10 = v24;
            id v11 = v30;
          }
        }
      }
      uint64_t v34 = [v11 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v34);
  }

  uint64_t v28 = [v32 currentServices];
  [v28 setArray:v10];
}

void __30__HMHome__mergeServiceGroups___block_invoke_895(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [*(id *)(a1 + 32) context];
    uint64_t v6 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__HMHome__mergeServiceGroups___block_invoke_2;
    block[3] = &unk_1E5945650;
    void block[4] = *(void *)(a1 + 32);
    id v8 = v3;
    id v9 = v4;
    dispatch_async(v6, block);
  }
}

void __30__HMHome__mergeServiceGroups___block_invoke_897(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [*(id *)(a1 + 32) context];
    uint64_t v6 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__HMHome__mergeServiceGroups___block_invoke_2_899;
    block[3] = &unk_1E5945650;
    void block[4] = *(void *)(a1 + 32);
    id v8 = v3;
    id v9 = v4;
    dispatch_async(v6, block);
  }
}

void __30__HMHome__mergeServiceGroups___block_invoke_2_899(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__HMHome__mergeServiceGroups___block_invoke_3_900;
  v5[3] = &unk_1E5945650;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

uint64_t __30__HMHome__mergeServiceGroups___block_invoke_3_900(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didAddServiceGroup with service group: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) home:*(void *)(a1 + 32) didAddServiceGroup:*(void *)(a1 + 40)];
}

void __30__HMHome__mergeServiceGroups___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__HMHome__mergeServiceGroups___block_invoke_3;
  v5[3] = &unk_1E5945650;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

uint64_t __30__HMHome__mergeServiceGroups___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didRemoveServiceGroup with service group: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) home:*(void *)(a1 + 32) didRemoveServiceGroup:*(void *)(a1 + 40)];
}

- (BOOL)_mergeAccessories:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = HMFGetLogIdentifier();
    id v9 = NSNumber;
    __int16 v10 = [(HMHome *)v6 currentAccessories];
    uint64_t v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    *(_DWORD *)buf = 138543874;
    uint64_t v30 = v8;
    __int16 v31 = 2112;
    id v32 = v11;
    __int16 v33 = 2112;
    uint64_t v34 = v12;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEBUG, "%{public}@New Accessories Before Merge: %@ -> %@", buf, 0x20u);
  }
  uint64_t v13 = [HMObjectMergeCollection alloc];
  uint64_t v14 = [(HMHome *)v6 currentAccessories];
  __int16 v15 = [v14 array];
  id v16 = [(HMObjectMergeCollection *)v13 initWithCurrentObjects:v15 newObjects:v4];

  uint64_t v17 = [(HMObjectMergeCollection *)v16 removedObjects];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __28__HMHome__mergeAccessories___block_invoke;
  v28[3] = &unk_1E59438E8;
  void v28[4] = v6;
  [v17 enumerateObjectsUsingBlock:v28];

  int v18 = [(HMObjectMergeCollection *)v16 addedObjects];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __28__HMHome__mergeAccessories___block_invoke_885;
  v27[3] = &unk_1E59438E8;
  void v27[4] = v6;
  [v18 enumerateObjectsUsingBlock:v27];

  [(HMObjectMergeCollection *)v16 mergeCommonObjects];
  long long v19 = [(HMObjectMergeCollection *)v16 finalObjects];
  long long v20 = [(HMHome *)v6 currentAccessories];
  [v20 setArray:v19];

  long long v21 = [(HMObjectMergeCollection *)v16 removedObjects];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __28__HMHome__mergeAccessories___block_invoke_886;
  v26[3] = &unk_1E59438E8;
  void v26[4] = v6;
  [v21 enumerateObjectsUsingBlock:v26];

  id v22 = [(HMObjectMergeCollection *)v16 addedObjects];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __28__HMHome__mergeAccessories___block_invoke_889;
  void v25[3] = &unk_1E59438E8;
  v25[4] = v6;
  [v22 enumerateObjectsUsingBlock:v25];

  BOOL v23 = [(HMObjectMergeCollection *)v16 isModified];
  return v23;
}

void __28__HMHome__mergeAccessories___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed accessory via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  [v3 _unconfigure];
}

void __28__HMHome__mergeAccessories___block_invoke_885(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v13 = 138543618;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added accessory via merge: %@", (uint8_t *)&v13, 0x16u);
  }
  int v8 = [*(id *)(a1 + 32) context];
  objc_msgSend(v3, "__configureWithContext:home:", v8, *(void *)(a1 + 32));

  id v9 = *(void **)(a1 + 32);
  __int16 v10 = [v3 room];
  id v11 = [v10 uuid];
  uint64_t v12 = [v9 roomWithUUID:v11];
  [v3 setRoom:v12];
}

void __28__HMHome__mergeAccessories___block_invoke_886(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = *(id *)(a1 + 32);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    long long v19 = v8;
    __int16 v20 = 2112;
    id v21 = v3;
    __int16 v22 = 2112;
    BOOL v23 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Notifying client of didRemoveAccessory via merge: %@ delegate: %@", buf, 0x20u);
  }
  if (objc_opt_respondsToSelector())
  {
    id v9 = (void *)MEMORY[0x19F3A64A0]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v19 = v12;
      __int16 v20 = 2112;
      id v21 = v3;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Client has registered for didRemoveAccessory delegate callback via merge: %@", buf, 0x16u);
    }
    int v13 = [*(id *)(a1 + 32) context];
    uint64_t v14 = [v13 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__HMHome__mergeAccessories___block_invoke_888;
    block[3] = &unk_1E5945650;
    void block[4] = *(void *)(a1 + 32);
    id v16 = v3;
    id v17 = v4;
    dispatch_async(v14, block);
  }
}

void __28__HMHome__mergeAccessories___block_invoke_889(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 postConfigure];
  id v4 = [*(id *)(a1 + 32) delegate];
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = *(id *)(a1 + 32);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138544130;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v3;
    __int16 v24 = 2112;
    id v25 = v4;
    __int16 v26 = 2048;
    uint64_t v27 = v9;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Notifying client of didAddAccessory via merge: %@ delegate: %@, %p", buf, 0x2Au);
  }
  if (objc_opt_respondsToSelector())
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = HMFGetLogIdentifier();
      uint64_t v14 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      id v21 = v13;
      __int16 v22 = 2112;
      id v23 = v3;
      __int16 v24 = 2048;
      id v25 = v14;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Client has registered for didAddAccessory delegate callback via merge: %@, %p", buf, 0x20u);
    }
    __int16 v15 = [*(id *)(a1 + 32) context];
    id v16 = [v15 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__HMHome__mergeAccessories___block_invoke_891;
    block[3] = &unk_1E5945650;
    void block[4] = *(void *)(a1 + 32);
    id v18 = v3;
    id v19 = v4;
    dispatch_async(v16, block);
  }
}

void __28__HMHome__mergeAccessories___block_invoke_891(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__HMHome__mergeAccessories___block_invoke_2_892;
  v5[3] = &unk_1E5945650;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

uint64_t __28__HMHome__mergeAccessories___block_invoke_2_892(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v9 = 138543874;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    uint64_t v14 = v7;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Dispatching didAddAccessory on client queue via merge: %@, %p", (uint8_t *)&v9, 0x20u);
  }
  return [*(id *)(a1 + 48) home:*(void *)(a1 + 32) didAddAccessory:*(void *)(a1 + 40)];
}

void __28__HMHome__mergeAccessories___block_invoke_888(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__HMHome__mergeAccessories___block_invoke_2;
  v5[3] = &unk_1E5945650;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

uint64_t __28__HMHome__mergeAccessories___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    int v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Dispatching didRemoveAccessory on client queue via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) home:*(void *)(a1 + 32) didRemoveAccessory:*(void *)(a1 + 40)];
}

- (BOOL)_mergeZones:(id)a3
{
  id v4 = a3;
  id v5 = [HMObjectMergeCollection alloc];
  uint64_t v6 = [(HMHome *)self currentZones];
  id v7 = [v6 array];
  int v8 = [(HMObjectMergeCollection *)v5 initWithCurrentObjects:v7 newObjects:v4];

  int v9 = [(HMObjectMergeCollection *)v8 removedObjects];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __22__HMHome__mergeZones___block_invoke;
  v19[3] = &unk_1E59411D0;
  v19[4] = self;
  [v9 enumerateObjectsUsingBlock:v19];

  __int16 v10 = [(HMObjectMergeCollection *)v8 addedObjects];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __22__HMHome__mergeZones___block_invoke_877;
  v18[3] = &unk_1E59411D0;
  void v18[4] = self;
  [v10 enumerateObjectsUsingBlock:v18];

  [(HMObjectMergeCollection *)v8 mergeCommonObjects];
  uint64_t v11 = [(HMObjectMergeCollection *)v8 finalObjects];
  uint64_t v12 = [(HMHome *)self currentZones];
  [v12 setArray:v11];

  __int16 v13 = [(HMObjectMergeCollection *)v8 removedObjects];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __22__HMHome__mergeZones___block_invoke_878;
  v17[3] = &unk_1E59411D0;
  v17[4] = self;
  [v13 enumerateObjectsUsingBlock:v17];

  uint64_t v14 = [(HMObjectMergeCollection *)v8 addedObjects];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __22__HMHome__mergeZones___block_invoke_880;
  v16[3] = &unk_1E59411D0;
  void v16[4] = self;
  [v14 enumerateObjectsUsingBlock:v16];

  LOBYTE(self) = [(HMObjectMergeCollection *)v8 isModified];
  return (char)self;
}

void __22__HMHome__mergeZones___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    int v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed zone via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  [v3 _unconfigure];
}

void __22__HMHome__mergeZones___block_invoke_877(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v30 = a1;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v38 = v7;
    __int16 v39 = 2112;
    id v40 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added zone via merge: %@", buf, 0x16u);
  }
  uint64_t v8 = a1;
  int v9 = [*(id *)(a1 + 32) context];
  objc_msgSend(v3, "__configureWithContext:home:", v9, *(void *)(a1 + 32));

  [MEMORY[0x1E4F1CA48] array];
  id v32 = v31 = v3;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  __int16 v10 = [v3 rooms];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v34;
    *(void *)&long long v12 = 138543874;
    long long v28 = v12;
    long long v29 = v10;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v17 = *(void **)(v8 + 32);
        id v18 = objc_msgSend(v16, "uuid", v28);
        id v19 = [v17 roomWithUUID:v18];

        if (v19)
        {
          [v32 addObject:v19];
        }
        else
        {
          uint64_t v20 = v14;
          id v21 = (void *)MEMORY[0x19F3A64A0]();
          id v22 = *(id *)(v8 + 32);
          id v23 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            __int16 v24 = HMFGetLogIdentifier();
            id v25 = [v16 uuid];
            __int16 v26 = [v31 uuid];
            *(_DWORD *)buf = v28;
            long long v38 = v24;
            __int16 v39 = 2112;
            id v40 = v25;
            __int16 v41 = 2112;
            id v42 = v26;
            _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to find room %@ for added zone: %@", buf, 0x20u);

            uint64_t v8 = v30;
            __int16 v10 = v29;
          }

          uint64_t v14 = v20;
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v13);
  }

  uint64_t v27 = [v31 currentRooms];
  [v27 setArray:v32];
}

void __22__HMHome__mergeZones___block_invoke_878(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [*(id *)(a1 + 32) context];
    uint64_t v6 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __22__HMHome__mergeZones___block_invoke_2;
    block[3] = &unk_1E5945650;
    void block[4] = *(void *)(a1 + 32);
    id v8 = v3;
    id v9 = v4;
    dispatch_async(v6, block);
  }
}

void __22__HMHome__mergeZones___block_invoke_880(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [*(id *)(a1 + 32) context];
    uint64_t v6 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __22__HMHome__mergeZones___block_invoke_2_882;
    block[3] = &unk_1E5945650;
    void block[4] = *(void *)(a1 + 32);
    id v8 = v3;
    id v9 = v4;
    dispatch_async(v6, block);
  }
}

void __22__HMHome__mergeZones___block_invoke_2_882(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __22__HMHome__mergeZones___block_invoke_3_883;
  v5[3] = &unk_1E5945650;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

uint64_t __22__HMHome__mergeZones___block_invoke_3_883(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didAddZone with zone: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) home:*(void *)(a1 + 32) didAddZone:*(void *)(a1 + 40)];
}

void __22__HMHome__mergeZones___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __22__HMHome__mergeZones___block_invoke_3;
  v5[3] = &unk_1E5945650;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

uint64_t __22__HMHome__mergeZones___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didRemoveZone with zone: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) home:*(void *)(a1 + 32) didRemoveZone:*(void *)(a1 + 40)];
}

- (BOOL)_mergeIsFeatureHomeTheaterQFAEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(HMHome *)self isFeatureHomeTheaterQFAEnabled] ^ a3;
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      [(HMHome *)v7 isFeatureHomeTheaterQFAEnabled];
      __int16 v10 = HMFBooleanToString();
      uint64_t v11 = HMFBooleanToString();
      int v13 = 138543874;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating is feature home theater QFA enabled from %@ to %@ via merge", (uint8_t *)&v13, 0x20u);
    }
    [(HMHome *)v7 setIsFeatureHomeTheaterQFAEnabled:v3];
  }
  return v5;
}

- (BOOL)_mergeRooms:(id)a3
{
  id v4 = a3;
  BOOL v5 = [HMObjectMergeCollection alloc];
  uint64_t v6 = [(HMHome *)self currentRooms];
  id v7 = [v6 array];
  int v8 = [(HMObjectMergeCollection *)v5 initWithCurrentObjects:v7 newObjects:v4];

  id v9 = [(HMObjectMergeCollection *)v8 removedObjects];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __22__HMHome__mergeRooms___block_invoke;
  v19[3] = &unk_1E5943288;
  v19[4] = self;
  [v9 enumerateObjectsUsingBlock:v19];

  __int16 v10 = [(HMObjectMergeCollection *)v8 addedObjects];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __22__HMHome__mergeRooms___block_invoke_869;
  v18[3] = &unk_1E5943288;
  void v18[4] = self;
  [v10 enumerateObjectsUsingBlock:v18];

  [(HMObjectMergeCollection *)v8 mergeCommonObjects];
  uint64_t v11 = [(HMObjectMergeCollection *)v8 finalObjects];
  uint64_t v12 = [(HMHome *)self currentRooms];
  [v12 setArray:v11];

  int v13 = [(HMObjectMergeCollection *)v8 removedObjects];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __22__HMHome__mergeRooms___block_invoke_870;
  v17[3] = &unk_1E5943288;
  v17[4] = self;
  [v13 enumerateObjectsUsingBlock:v17];

  uint64_t v14 = [(HMObjectMergeCollection *)v8 addedObjects];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __22__HMHome__mergeRooms___block_invoke_872;
  v16[3] = &unk_1E5943288;
  void v16[4] = self;
  [v14 enumerateObjectsUsingBlock:v16];

  LOBYTE(self) = [(HMObjectMergeCollection *)v8 isModified];
  return (char)self;
}

void __22__HMHome__mergeRooms___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed room via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  [v3 _unconfigure];
}

void __22__HMHome__mergeRooms___block_invoke_869(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    __int16 v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added room via merge: %@", (uint8_t *)&v9, 0x16u);
  }
  int v8 = [*(id *)(a1 + 32) context];
  objc_msgSend(v3, "__configureWithContext:home:", v8, *(void *)(a1 + 32));
}

void __22__HMHome__mergeRooms___block_invoke_870(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [*(id *)(a1 + 32) context];
    uint64_t v6 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __22__HMHome__mergeRooms___block_invoke_2;
    block[3] = &unk_1E5945650;
    void block[4] = *(void *)(a1 + 32);
    id v8 = v3;
    id v9 = v4;
    dispatch_async(v6, block);
  }
}

void __22__HMHome__mergeRooms___block_invoke_872(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [*(id *)(a1 + 32) context];
    uint64_t v6 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __22__HMHome__mergeRooms___block_invoke_2_874;
    block[3] = &unk_1E5945650;
    void block[4] = *(void *)(a1 + 32);
    id v8 = v3;
    id v9 = v4;
    dispatch_async(v6, block);
  }
}

void __22__HMHome__mergeRooms___block_invoke_2_874(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __22__HMHome__mergeRooms___block_invoke_3_875;
  v5[3] = &unk_1E5945650;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

uint64_t __22__HMHome__mergeRooms___block_invoke_3_875(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didAddRoom with room: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) home:*(void *)(a1 + 32) didAddRoom:*(void *)(a1 + 40)];
}

void __22__HMHome__mergeRooms___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __22__HMHome__mergeRooms___block_invoke_3;
  v5[3] = &unk_1E5945650;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

uint64_t __22__HMHome__mergeRooms___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didRemoveRoom with room: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) home:*(void *)(a1 + 32) didRemoveRoom:*(void *)(a1 + 40)];
}

- (BOOL)mergeFromNewObject:(id)a3
{
  uint64_t v468 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (!v6)
  {
    char v29 = 0;
    goto LABEL_236;
  }
  id v390 = v4;
  id v7 = [v6 rooms];
  BOOL v391 = [(HMHome *)self _mergeRooms:v7];

  int v8 = [v6 zones];
  BOOL v388 = [(HMHome *)self _mergeZones:v8];

  id v9 = [v6 accessories];
  BOOL v387 = [(HMHome *)self _mergeAccessories:v9];

  __int16 v10 = [v6 serviceGroups];
  BOOL v386 = [(HMHome *)self _mergeServiceGroups:v10];

  uint64_t v11 = [v6 actionSets];
  BOOL v385 = [(HMHome *)self _mergeActionSets:v11];

  uint64_t v12 = [v6 triggerOwnedActionSets];
  BOOL v384 = [(HMHome *)self _mergeTriggerOwnedActionSets:v12];

  uint64_t v13 = [v6 triggers];
  BOOL v383 = [(HMHome *)self _mergeTriggers:v13];

  uint64_t v14 = [v6 users];
  BOOL v382 = [(HMHome *)self _mergeUsers:v14];

  __int16 v15 = [v6 residentDevices];
  BOOL v16 = [(HMHome *)self _mergeResidentDevices:v15];

  __int16 v17 = [v6 outgoingInvitations];
  BOOL v18 = [(HMHome *)self _mergeOutgoingInvitations:v17];

  BOOL v19 = -[HMHome _mergeIsFeatureHomeTheaterQFAEnabled:](self, "_mergeIsFeatureHomeTheaterQFAEnabled:", [v6 isFeatureHomeTheaterQFAEnabled]);
  uint64_t v20 = [(HMHome *)self mediaSystemStageManager];
  id v21 = [v6 mediaSystems];
  id v22 = [(HMHome *)self context];
  char v23 = [v20 mergeMediaSystems:v21 withHome:self context:v22];

  __int16 v24 = [v6 accessoryProtectionGroups];
  BOOL v25 = [(HMHome *)self _mergeAccessoryProtectionGroups:v24];

  __int16 v26 = [(HMHome *)self name];
  uint64_t v27 = [v6 name];
  LOBYTE(v13) = [v26 isEqualToString:v27];

  if (v13)
  {
    char v28 = (v391 || v388 || v387 || v386 || v385 || v384 || v383 || v382 || v16 || v18 || v19) | v23 | v25;
  }
  else
  {
    uint64_t v30 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v31 = self;
    HMFGetOSLogHandle();
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      long long v34 = [(HMHome *)v31 name];
      long long v35 = [v6 name];
      *(_DWORD *)buf = 138543874;
      id v460 = v33;
      __int16 v461 = 2112;
      *(void *)v462 = v34;
      *(_WORD *)&v462[8] = 2112;
      uint64_t v463 = (uint64_t)v35;
      _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_INFO, "%{public}@Name updated from %@ to %@", buf, 0x20u);
    }
    long long v36 = [v6 name];
    [(HMHome *)v31 setName:v36];

    long long v37 = [(HMHome *)v31 delegate];
    if (objc_opt_respondsToSelector())
    {
      long long v38 = [(HMHome *)v31 context];
      __int16 v39 = [v38 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __29__HMHome_mergeFromNewObject___block_invoke;
      block[3] = &unk_1E5945628;
      void block[4] = v31;
      id v458 = v37;
      dispatch_async(v39, block);
    }
    char v28 = 1;
  }
  int v40 = [(HMHome *)self soundCheckEnabled];
  if (v40 != [v6 soundCheckEnabled])
  {
    __int16 v41 = (void *)MEMORY[0x19F3A64A0](-[HMHome setSoundCheckEnabled:](self, "setSoundCheckEnabled:", [v6 soundCheckEnabled]));
    id v42 = self;
    HMFGetOSLogHandle();
    __int16 v43 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v44 = (id)objc_claimAutoreleasedReturnValue();
      [(HMHome *)v42 soundCheckEnabled];
      HMFBooleanToString();
      id v45 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v460 = v44;
      __int16 v461 = 2112;
      *(void *)v462 = v45;
      _os_log_impl(&dword_19D1A8000, v43, OS_LOG_TYPE_INFO, "%{public}@sound check value updated to %@", buf, 0x16u);
    }
    uint64_t v46 = [(HMHome *)v42 _privateDelegate];
    if (objc_opt_respondsToSelector())
    {
      id v47 = [(HMHome *)v42 context];
      __int16 v48 = [v47 queue];
      v455[0] = MEMORY[0x1E4F143A8];
      v455[1] = 3221225472;
      v455[2] = __29__HMHome_mergeFromNewObject___block_invoke_628;
      v455[3] = &unk_1E5945628;
      v455[4] = v42;
      id v456 = v46;
      dispatch_async(v48, v455);
    }
  }
  int v49 = [(HMHome *)self supportsResidentActionSetStateEvaluation];
  if (v49 != [v6 supportsResidentActionSetStateEvaluation])
  {
    __int16 v50 = (void *)MEMORY[0x19F3A64A0](-[HMHome setSupportsResidentActionSetStateEvaluation:](self, "setSupportsResidentActionSetStateEvaluation:", [v6 supportsResidentActionSetStateEvaluation]));
    uint64_t v51 = self;
    HMFGetOSLogHandle();
    id v52 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v53 = (id)objc_claimAutoreleasedReturnValue();
      [(HMHome *)v51 supportsResidentActionSetStateEvaluation];
      HMFBooleanToString();
      id v54 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v460 = v53;
      __int16 v461 = 2112;
      *(void *)v462 = v54;
      _os_log_impl(&dword_19D1A8000, v52, OS_LOG_TYPE_INFO, "%{public}@supportsResidentActionSetStateEvaluation value updated to %@", buf, 0x16u);
    }
    uint64_t v55 = [(HMHome *)v51 _privateDelegate];
    if (objc_opt_respondsToSelector())
    {
      SEL v56 = [(HMHome *)v51 context];
      id v57 = [v56 queue];
      v453[0] = MEMORY[0x1E4F143A8];
      v453[1] = 3221225472;
      v453[2] = __29__HMHome_mergeFromNewObject___block_invoke_632;
      v453[3] = &unk_1E5945628;
      v453[4] = v51;
      id v454 = v55;
      dispatch_async(v57, v453);
    }
  }
  unint64_t v58 = [(HMHome *)self audioAnalysisClassifierOptions];
  if (v58 != [v6 audioAnalysisClassifierOptions])
  {
    __int16 v59 = (void *)MEMORY[0x19F3A64A0](-[HMHome setAudioAnalysisClassifierOptions:](self, "setAudioAnalysisClassifierOptions:", [v6 audioAnalysisClassifierOptions]));
    id v60 = self;
    HMFGetOSLogHandle();
    __int16 v61 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v62 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v63 = [(HMHome *)v60 audioAnalysisClassifierOptions];
      *(_DWORD *)buf = 138543618;
      id v460 = v62;
      __int16 v461 = 2048;
      *(void *)v462 = v63;
      _os_log_impl(&dword_19D1A8000, v61, OS_LOG_TYPE_INFO, "%{public}@Audio analysis classifier options updated to %lu", buf, 0x16u);
    }
    long long v64 = [(HMHome *)v60 _privateDelegate];
    if (objc_opt_respondsToSelector())
    {
      long long v65 = [(HMHome *)v60 context];
      __int16 v66 = [v65 queue];
      v451[0] = MEMORY[0x1E4F143A8];
      v451[1] = 3221225472;
      v451[2] = __29__HMHome_mergeFromNewObject___block_invoke_636;
      v451[3] = &unk_1E5945628;
      v451[4] = v60;
      id v452 = v64;
      dispatch_async(v66, v451);
    }
  }
  int v67 = [(HMHome *)self didOnboardAudioAnalysis];
  if (v67 != [v6 didOnboardAudioAnalysis])
  {
    __int16 v68 = (void *)MEMORY[0x19F3A64A0](-[HMHome setDidOnboardAudioAnalysis:](self, "setDidOnboardAudioAnalysis:", [v6 didOnboardAudioAnalysis]));
    id v69 = self;
    HMFGetOSLogHandle();
    uint64_t v70 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v71 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v72 = [(HMHome *)v69 didOnboardAudioAnalysis];
      *(_DWORD *)buf = 138543618;
      id v460 = v71;
      __int16 v461 = 2048;
      *(void *)v462 = v72;
      _os_log_impl(&dword_19D1A8000, v70, OS_LOG_TYPE_INFO, "%{public}@Did onboard audio analysis updated to %lu", buf, 0x16u);
    }
    uint64_t v73 = [(HMHome *)v69 _privateDelegate];
    if (objc_opt_respondsToSelector())
    {
      id v74 = [(HMHome *)v69 context];
      uint64_t v75 = [v74 queue];
      v449[0] = MEMORY[0x1E4F143A8];
      v449[1] = 3221225472;
      v449[2] = __29__HMHome_mergeFromNewObject___block_invoke_640;
      v449[3] = &unk_1E5945628;
      v449[4] = v69;
      id v450 = v73;
      dispatch_async(v75, v449);
    }
  }
  unint64_t v76 = [(HMHome *)self siriPhraseOptions];
  if (v76 != [v6 siriPhraseOptions])
  {
    uint64_t v77 = (void *)MEMORY[0x19F3A64A0](-[HMHome setSiriPhraseOptions:](self, "setSiriPhraseOptions:", [v6 siriPhraseOptions]));
    v78 = self;
    HMFGetOSLogHandle();
    uint64_t v79 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v80 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v81 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMHome siriPhraseOptions](v78, "siriPhraseOptions"));
      *(_DWORD *)buf = 138543618;
      id v460 = v80;
      __int16 v461 = 2112;
      *(void *)v462 = v81;
      _os_log_impl(&dword_19D1A8000, v79, OS_LOG_TYPE_INFO, "%{public}@Siri phrase options updated to %@", buf, 0x16u);
    }
    uint64_t v82 = [(HMHome *)v78 context];
    unint64_t v83 = [v82 queue];
    v448[0] = MEMORY[0x1E4F143A8];
    v448[1] = 3221225472;
    v448[2] = __29__HMHome_mergeFromNewObject___block_invoke_642;
    v448[3] = &unk_1E59452E8;
    v448[4] = v78;
    dispatch_async(v83, v448);
  }
  int v84 = [(HMHome *)self isLocationServicesEnabled];
  if (v84 != [v6 isLocationServicesEnabled])
  {
    id v85 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v86 = self;
    HMFGetOSLogHandle();
    uint64_t v87 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v88 = (id)objc_claimAutoreleasedReturnValue();
      [v6 isLocationServicesEnabled];
      HMFBooleanToString();
      id v89 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v460 = v88;
      __int16 v461 = 2112;
      *(void *)v462 = v89;
      _os_log_impl(&dword_19D1A8000, v87, OS_LOG_TYPE_INFO, "%{public}@Updating location services: %@", buf, 0x16u);
    }
    -[HMHome setLocationServicesEnabled:](v86, "setLocationServicesEnabled:", [v6 isLocationServicesEnabled]);
    id v90 = [(HMHome *)v86 context];
    long long v91 = [v90 queue];
    v447[0] = MEMORY[0x1E4F143A8];
    v447[1] = 3221225472;
    v447[2] = __29__HMHome_mergeFromNewObject___block_invoke_646;
    v447[3] = &unk_1E59452E8;
    v447[4] = v86;
    dispatch_async(v91, v447);
  }
  int v92 = [(HMHome *)self didOnboardLocationServices];
  if (v92 != [v6 didOnboardLocationServices])
  {
    long long v93 = (void *)MEMORY[0x19F3A64A0]();
    long long v94 = self;
    HMFGetOSLogHandle();
    long long v95 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v96 = (id)objc_claimAutoreleasedReturnValue();
      [v6 didOnboardLocationServices];
      HMFBooleanToString();
      id v97 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v460 = v96;
      __int16 v461 = 2112;
      *(void *)v462 = v97;
      _os_log_impl(&dword_19D1A8000, v95, OS_LOG_TYPE_INFO, "%{public}@Updating did onboard location services: %@", buf, 0x16u);
    }
    -[HMHome setDidOnboardLocationServices:](v94, "setDidOnboardLocationServices:", [v6 didOnboardLocationServices]);
    long long v98 = [(HMHome *)v94 context];
    long long v99 = [v98 queue];
    v446[0] = MEMORY[0x1E4F143A8];
    v446[1] = 3221225472;
    v446[2] = __29__HMHome_mergeFromNewObject___block_invoke_650;
    v446[3] = &unk_1E59452E8;
    v446[4] = v94;
    dispatch_async(v99, v446);
  }
  int v100 = [(HMHome *)self multiUserEnabled];
  if (v100 != [v6 multiUserEnabled])
  {
    char v101 = [v6 multiUserEnabled];
    uint64_t v102 = (void *)MEMORY[0x19F3A64A0]();
    id v103 = self;
    HMFGetOSLogHandle();
    long long v104 = (id)objc_claimAutoreleasedReturnValue();
    long long v105 = v104;
    if (v101)
    {
      if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v106 = (id)objc_claimAutoreleasedReturnValue();
        int v107 = [v6 multiUserEnabled];
        BOOL v108 = @"NO";
        *(_DWORD *)buf = 138543874;
        id v460 = v106;
        __int16 v461 = 2112;
        if (v107) {
          BOOL v108 = @"YES";
        }
        *(void *)v462 = v108;
        *(_WORD *)&v462[8] = 2112;
        uint64_t v463 = (uint64_t)v103;
        _os_log_impl(&dword_19D1A8000, v105, OS_LOG_TYPE_INFO, "%{public}@multiUserEnabled value %@ is merging into home: %@", buf, 0x20u);
      }
      -[HMHome setMultiUserEnabled:](v103, "setMultiUserEnabled:", [v6 multiUserEnabled]);
      long long v109 = [(HMHome *)v103 _privateDelegate];
      if (objc_opt_respondsToSelector())
      {
        long long v110 = [(HMHome *)v103 context];
        long long v111 = [v110 queue];
        v444[0] = MEMORY[0x1E4F143A8];
        v444[1] = 3221225472;
        v444[2] = __29__HMHome_mergeFromNewObject___block_invoke_662;
        v444[3] = &unk_1E5945628;
        v444[4] = v103;
        id v445 = v109;
        dispatch_async(v111, v444);
      }
      char v28 = 1;
    }
    else
    {
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v112 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        id v460 = v112;
        __int16 v461 = 2112;
        *(void *)v462 = v103;
        _os_log_impl(&dword_19D1A8000, v105, OS_LOG_TYPE_ERROR, "%{public}@multiUserEnabled value (NO) will not be merged into home: %@", buf, 0x16u);
      }
    }
  }
  int v113 = [(HMHome *)self hasAnyUserAcknowledgedCameraRecordingOnboarding];
  if (v113 != [v6 hasAnyUserAcknowledgedCameraRecordingOnboarding])
  {
    char v114 = [v6 hasAnyUserAcknowledgedCameraRecordingOnboarding];
    uint64_t v115 = (void *)MEMORY[0x19F3A64A0]();
    long long v116 = self;
    HMFGetOSLogHandle();
    uint64_t v117 = (id)objc_claimAutoreleasedReturnValue();
    long long v118 = v117;
    if (v114)
    {
      if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v119 = (id)objc_claimAutoreleasedReturnValue();
        int v120 = [v6 hasAnyUserAcknowledgedCameraRecordingOnboarding];
        long long v121 = @"NO";
        *(_DWORD *)buf = 138543874;
        id v460 = v119;
        __int16 v461 = 2112;
        if (v120) {
          long long v121 = @"YES";
        }
        *(void *)v462 = v121;
        *(_WORD *)&v462[8] = 2112;
        uint64_t v463 = (uint64_t)v116;
        _os_log_impl(&dword_19D1A8000, v118, OS_LOG_TYPE_INFO, "%{public}@hasAnyUserAcknowledgedCameraRecordingOnboarding value %@ is merging into home: %@", buf, 0x20u);
      }
      -[HMHome setHasAnyUserAcknowledgedCameraRecordingOnboarding:](v116, "setHasAnyUserAcknowledgedCameraRecordingOnboarding:", [v6 hasAnyUserAcknowledgedCameraRecordingOnboarding]);
      long long v122 = [(HMHome *)v116 _privateDelegate];
      if (objc_opt_respondsToSelector())
      {
        id v123 = [(HMHome *)v116 context];
        uint64_t v124 = [v123 queue];
        v442[0] = MEMORY[0x1E4F143A8];
        v442[1] = 3221225472;
        v442[2] = __29__HMHome_mergeFromNewObject___block_invoke_666;
        v442[3] = &unk_1E5945628;
        v442[4] = v116;
        id v443 = v122;
        dispatch_async(v124, v442);
      }
      char v28 = 1;
    }
    else
    {
      if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v125 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        id v460 = v125;
        __int16 v461 = 2112;
        *(void *)v462 = v116;
        _os_log_impl(&dword_19D1A8000, v118, OS_LOG_TYPE_ERROR, "%{public}@hasAnyUserAcknowledgedCameraRecordingOnboarding value (NO) will not be merged into home: %@", buf, 0x16u);
      }
    }
  }
  if ([v6 hasOnboardedForAccessCode]
    && ![(HMHome *)self hasOnboardedForAccessCode])
  {
    id v126 = (void *)MEMORY[0x19F3A64A0]();
    long long v127 = self;
    HMFGetOSLogHandle();
    long long v128 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v129 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v460 = v129;
      _os_log_impl(&dword_19D1A8000, v128, OS_LOG_TYPE_INFO, "%{public}@Updating has onboarded home for access code", buf, 0xCu);
    }
    [(HMHome *)v127 setHasOnboardedForAccessCode:1];
    uint64_t v130 = [(HMHome *)v127 _privateDelegate];
    if (objc_opt_respondsToSelector())
    {
      int v131 = (void *)MEMORY[0x19F3A64A0]();
      long long v132 = v127;
      HMFGetOSLogHandle();
      uint64_t v133 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v134 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        id v460 = v134;
        __int16 v461 = 2112;
        *(void *)v462 = v130;
        _os_log_impl(&dword_19D1A8000, v133, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of updated has onboarded home for access code: %@", buf, 0x16u);
      }
      uint64_t v135 = [(HMHome *)v132 context];
      long long v136 = [v135 queue];
      v440[0] = MEMORY[0x1E4F143A8];
      v440[1] = 3221225472;
      v440[2] = __29__HMHome_mergeFromNewObject___block_invoke_670;
      v440[3] = &unk_1E5945628;
      v440[4] = v132;
      id v441 = v130;
      dispatch_async(v136, v440);
    }
    char v28 = 1;
  }
  uint64_t v137 = [v6 hasOnboardedForWalletKey];
  if (v137 != [(HMHome *)self hasOnboardedForWalletKey])
  {
    uint64_t v138 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v139 = self;
    HMFGetOSLogHandle();
    uint64_t v140 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v141 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v460 = v141;
      _os_log_impl(&dword_19D1A8000, v140, OS_LOG_TYPE_INFO, "%{public}@Updating has onboarded home for wallet key", buf, 0xCu);
    }
    [(HMHome *)v139 setHasOnboardedForWalletKey:v137];
    id v142 = [(HMHome *)v139 _privateDelegate];
    if (objc_opt_respondsToSelector())
    {
      unint64_t v143 = (void *)MEMORY[0x19F3A64A0]();
      id v144 = v139;
      HMFGetOSLogHandle();
      v145 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v146 = (id)objc_claimAutoreleasedReturnValue();
        [(HMHome *)v144 hasOnboardedForWalletKey];
        HMFBooleanToString();
        id v147 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        id v460 = v146;
        __int16 v461 = 2112;
        *(void *)v462 = v142;
        *(_WORD *)&v462[8] = 2112;
        uint64_t v463 = (uint64_t)v147;
        _os_log_impl(&dword_19D1A8000, v145, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate %@ of updated has onboarded for wallet key: %@", buf, 0x20u);
      }
      long long v148 = [(HMHome *)v144 context];
      long long v149 = [v148 queue];
      v438[0] = MEMORY[0x1E4F143A8];
      v438[1] = 3221225472;
      v438[2] = __29__HMHome_mergeFromNewObject___block_invoke_674;
      v438[3] = &unk_1E5945628;
      v438[4] = v144;
      id v439 = v142;
      dispatch_async(v149, v438);
    }
    char v28 = 1;
  }
  int v150 = [v6 dismissedWalletKeyUWBUnlockOnboarding];
  if (v150 != [(HMHome *)self dismissedWalletKeyUWBUnlockOnboarding])
  {
    long long v151 = (void *)MEMORY[0x19F3A64A0]();
    long long v152 = self;
    HMFGetOSLogHandle();
    long long v153 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v153, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v154 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v460 = v154;
      _os_log_impl(&dword_19D1A8000, v153, OS_LOG_TYPE_INFO, "%{public}@Updating dismissedWalletKeyUWBUnlockOnboarding", buf, 0xCu);
    }
    -[HMHome setDismissedWalletKeyUWBUnlockOnboarding:](v152, "setDismissedWalletKeyUWBUnlockOnboarding:", [v6 dismissedWalletKeyUWBUnlockOnboarding]);
    long long v155 = [(HMHome *)v152 _privateDelegate];
    if (objc_opt_respondsToSelector())
    {
      id v156 = (void *)MEMORY[0x19F3A64A0]();
      id v157 = v152;
      HMFGetOSLogHandle();
      long long v158 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v158, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v159 = (id)objc_claimAutoreleasedReturnValue();
        [(HMHome *)v157 dismissedWalletKeyUWBUnlockOnboarding];
        HMFBooleanToString();
        id v160 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        id v460 = v159;
        __int16 v461 = 2112;
        *(void *)v462 = v155;
        *(_WORD *)&v462[8] = 2112;
        uint64_t v463 = (uint64_t)v160;
        _os_log_impl(&dword_19D1A8000, v158, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate %@ of updated dismissed wallet key UWB unlock onboarding: %@", buf, 0x20u);
      }
      long long v161 = [(HMHome *)v157 context];
      uint64_t v162 = [v161 queue];
      v436[0] = MEMORY[0x1E4F143A8];
      v436[1] = 3221225472;
      v436[2] = __29__HMHome_mergeFromNewObject___block_invoke_678;
      v436[3] = &unk_1E5945628;
      v436[4] = v157;
      id v437 = v155;
      dispatch_async(v162, v436);
    }
    char v28 = 1;
  }
  v163 = [(HMHome(HMRoom) *)self roomForEntireHome];
  __int16 v164 = [v163 name];
  uint64_t v165 = [v6 roomForEntireHome];
  __int16 v166 = [v165 name];
  char v167 = [v164 isEqual:v166];

  if ((v167 & 1) == 0)
  {
    __int16 v168 = [(HMHome(HMRoom) *)self roomForEntireHome];
    v169 = [v6 roomForEntireHome];
    v170 = [v169 name];
    [v168 _updateName:v170 completionHandler:0];
  }
  uint64_t v171 = [(HMHome *)self applicationData];
  v172 = [v6 applicationData];
  char v173 = HMFEqualObjects();

  if ((v173 & 1) == 0)
  {
    v174 = [v6 applicationData];
    [(HMHome *)self setApplicationData:v174];

    uint64_t v175 = [(HMHome *)self context];
    v176 = [v175 queue];
    v435[0] = MEMORY[0x1E4F143A8];
    v435[1] = 3221225472;
    v435[2] = __29__HMHome_mergeFromNewObject___block_invoke_3;
    v435[3] = &unk_1E59452E8;
    v435[4] = self;
    dispatch_async(v176, v435);

    char v28 = 1;
  }
  v177 = [(HMHome(HMRoom) *)self roomForEntireHome];
  v178 = [v6 roomForEntireHome];
  char v179 = [v177 mergeFromNewObject:v178];

  HMHomeHubState v180 = [(HMHome *)self homeHubState];
  if (v180 == [v6 homeHubState])
  {
    char v29 = v179 | v28;
  }
  else
  {
    self->_homeHubState = [v6 homeHubState];
    v181 = [(HMHome *)self context];
    v182 = [v181 queue];
    v434[0] = MEMORY[0x1E4F143A8];
    v434[1] = 3221225472;
    v434[2] = __29__HMHome_mergeFromNewObject___block_invoke_4;
    v434[3] = &unk_1E59452E8;
    v434[4] = self;
    dispatch_async(v182, v434);

    char v29 = 1;
  }
  -[HMHome setAdminUser:](self, "setAdminUser:", [v6 isAdminUser]);
  -[HMHome setOwnerUser:](self, "setOwnerUser:", [v6 isOwnerUser]);
  -[HMHome setNotificationsEnabled:](self, "setNotificationsEnabled:", [v6 areNotificationsEnabled]);
  v183 = [v6 notificationsUpdatedTime];
  [(HMHome *)self setNotificationsUpdatedTime:v183];

  v184 = [(HMHome *)self currentUser];
  v185 = [v6 currentUser];
  [v184 mergeFromNewObject:v185];

  v186 = [(HMHome *)self _privateDelegate];
  uint64_t v187 = [v6 isAutomaticSoftwareUpdateEnabled];
  if (v187 != [(HMHome *)self isAutomaticSoftwareUpdateEnabled])
  {
    [(HMHome *)self setAutomaticSoftwareUpdateEnabled:v187];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v188 = [(HMHome *)self context];
      v189 = [v188 queue];
      v431[0] = MEMORY[0x1E4F143A8];
      v431[1] = 3221225472;
      v431[2] = __29__HMHome_mergeFromNewObject___block_invoke_5;
      v431[3] = &unk_1E5944D60;
      v431[4] = self;
      id v432 = v186;
      char v433 = v187;
      dispatch_async(v189, v431);
    }
    char v29 = 1;
  }
  uint64_t v190 = [v6 isAutomaticThirdPartyAccessorySoftwareUpdateEnabled];
  if (v190 != [(HMHome *)self isAutomaticThirdPartyAccessorySoftwareUpdateEnabled])
  {
    [(HMHome *)self setAutomaticThirdPartyAccessorySoftwareUpdateEnabled:v190];
    v191 = [(HMHome *)self delegate];
    if ([v191 conformsToProtocol:&unk_1EEF70488]) {
      v192 = v191;
    }
    else {
      v192 = 0;
    }
    id v193 = v192;

    if (objc_opt_respondsToSelector())
    {
      v194 = [(HMHome *)self context];
      v195 = [v194 queue];
      v428[0] = MEMORY[0x1E4F143A8];
      v428[1] = 3221225472;
      v428[2] = __29__HMHome_mergeFromNewObject___block_invoke_7;
      v428[3] = &unk_1E5944D60;
      v428[4] = self;
      id v429 = v193;
      char v430 = v190;
      dispatch_async(v195, v428);
    }
    char v29 = 1;
  }
  unint64_t v196 = [v6 minimumMediaUserPrivilege];
  v392 = v186;
  if ([(HMHome *)self minimumMediaUserPrivilege] != v196)
  {
    uint64_t v197 = (void *)MEMORY[0x19F3A64A0]();
    v198 = self;
    HMFGetOSLogHandle();
    v199 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v199, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      id v200 = (id)objc_claimAutoreleasedReturnValue();
      v201 = v200;
      if (v196 > 3) {
        v202 = @"Unknown";
      }
      else {
        v202 = off_1E59418E8[v196];
      }
      *(_DWORD *)buf = 138543618;
      id v460 = v200;
      __int16 v461 = 2112;
      *(void *)v462 = v202;
      _os_log_impl(&dword_19D1A8000, v199, OS_LOG_TYPE_DEFAULT, "%{public}@Updating minimum media user privilege: %@", buf, 0x16u);
    }
    [(HMHome *)v198 setMinimumMediaUserPrivilege:v196];
    v203 = [(HMHome *)v198 delegate];
    if ([v203 conformsToProtocol:&unk_1EEF70488]) {
      v204 = v203;
    }
    else {
      v204 = 0;
    }
    id v205 = v204;

    if (objc_opt_respondsToSelector())
    {
      v206 = (void *)MEMORY[0x19F3A64A0]();
      v207 = v198;
      HMFGetOSLogHandle();
      id v208 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v208, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v209 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        id v460 = v209;
        _os_log_impl(&dword_19D1A8000, v208, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of updated minimum media user privilege", buf, 0xCu);

        v186 = v392;
      }

      v210 = [(HMHome *)v207 context];
      v211 = [v210 queue];
      v425[0] = MEMORY[0x1E4F143A8];
      v425[1] = 3221225472;
      v425[2] = __29__HMHome_mergeFromNewObject___block_invoke_826;
      v425[3] = &unk_1E5945160;
      v425[4] = v207;
      id v426 = v205;
      unint64_t v427 = v196;
      dispatch_async(v211, v425);
    }
    char v29 = 1;
  }
  uint64_t v212 = [v6 isMediaPeerToPeerEnabled];
  if (v212 != [(HMHome *)self isMediaPeerToPeerEnabled])
  {
    v213 = (void *)MEMORY[0x19F3A64A0]();
    v214 = self;
    HMFGetOSLogHandle();
    v215 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      id v216 = (id)objc_claimAutoreleasedReturnValue();
      v217 = v216;
      v218 = @"disabled";
      if (v212) {
        v218 = @"enabled";
      }
      *(_DWORD *)buf = 138543618;
      id v460 = v216;
      __int16 v461 = 2112;
      *(void *)v462 = v218;
      _os_log_impl(&dword_19D1A8000, v215, OS_LOG_TYPE_DEFAULT, "%{public}@Updating media peer-to-peer to '%@'", buf, 0x16u);
    }
    [(HMHome *)v214 setMediaPeerToPeerEnabled:v212];
    long long v219 = [(HMHome *)v214 delegate];
    if ([v219 conformsToProtocol:&unk_1EEF70488]) {
      long long v220 = v219;
    }
    else {
      long long v220 = 0;
    }
    id v221 = v220;

    if (objc_opt_respondsToSelector())
    {
      long long v222 = (void *)MEMORY[0x19F3A64A0]();
      long long v223 = v214;
      HMFGetOSLogHandle();
      long long v224 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v224, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v225 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        id v460 = v225;
        _os_log_impl(&dword_19D1A8000, v224, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of updated media peer-to-peer enabled", buf, 0xCu);

        v186 = v392;
      }

      long long v226 = [(HMHome *)v223 context];
      long long v227 = [v226 queue];
      v422[0] = MEMORY[0x1E4F143A8];
      v422[1] = 3221225472;
      v422[2] = __29__HMHome_mergeFromNewObject___block_invoke_835;
      v422[3] = &unk_1E5944D60;
      v422[4] = v223;
      id v423 = v221;
      char v424 = v212;
      dispatch_async(v227, v422);
    }
    char v29 = 1;
  }
  long long v228 = [v6 mediaPassword];
  long long v229 = [(HMHome *)self mediaPassword];
  char v230 = HMFEqualObjects();

  if ((v230 & 1) == 0)
  {
    v231 = (void *)MEMORY[0x19F3A64A0]();
    v232 = self;
    HMFGetOSLogHandle();
    v233 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v233, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      id v234 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v460 = v234;
      __int16 v461 = 2112;
      *(void *)v462 = v228;
      _os_log_impl(&dword_19D1A8000, v233, OS_LOG_TYPE_DEFAULT, "%{public}@Updating media password to: %@", buf, 0x16u);
    }
    [(HMHome *)v232 setMediaPassword:v228];
    v235 = [(HMHome *)v232 delegate];
    if ([v235 conformsToProtocol:&unk_1EEF70488]) {
      v236 = v235;
    }
    else {
      v236 = 0;
    }
    id v237 = v236;

    if (objc_opt_respondsToSelector())
    {
      v238 = (void *)MEMORY[0x19F3A64A0]();
      v239 = v232;
      HMFGetOSLogHandle();
      v240 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v240, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v241 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        id v460 = v241;
        _os_log_impl(&dword_19D1A8000, v240, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of updated media password", buf, 0xCu);

        v186 = v392;
      }

      v242 = [(HMHome *)v239 context];
      v243 = [v242 queue];
      v419[0] = MEMORY[0x1E4F143A8];
      v419[1] = 3221225472;
      v419[2] = __29__HMHome_mergeFromNewObject___block_invoke_838;
      v419[3] = &unk_1E5945650;
      v419[4] = v239;
      id v420 = v237;
      id v421 = v228;
      dispatch_async(v243, v419);
    }
    char v29 = 1;
  }

  uint64_t v244 = [v6 protectionMode];
  if (v244 != [(HMHome *)self protectionMode])
  {
    -[HMHome setProtectionMode:](self, "setProtectionMode:", [v6 protectionMode]);
    if (objc_opt_respondsToSelector())
    {
      v245 = [(HMHome *)self context];
      v246 = [v245 queue];
      v417[0] = MEMORY[0x1E4F143A8];
      v417[1] = 3221225472;
      v417[2] = __29__HMHome_mergeFromNewObject___block_invoke_3_841;
      v417[3] = &unk_1E5945628;
      v417[4] = self;
      id v418 = v186;
      dispatch_async(v246, v417);
    }
    char v29 = 1;
  }
  uint64_t v247 = [v6 networkRouterSupportDisableReason];
  if (v247 != [(HMHome *)self networkRouterSupportDisableReason])
  {
    -[HMHome setNetworkRouterSupportDisableReason:](self, "setNetworkRouterSupportDisableReason:", [v6 networkRouterSupportDisableReason]);
    unint64_t v248 = [(HMHome *)self networkRouterSupportDisableReason];
    uint64_t v249 = ((uint64_t)(v248 << 60) >> 63) & 3;
    if ((v248 & 7) != 0) {
      uint64_t v249 = 7;
    }
    uint64_t v250 = v249 | (v248 >> 3) & 2;
    if ([(HMHome *)self networkRouterSupport] != v250)
    {
      [(HMHome *)self setNetworkRouterSupport:v250];
      v251 = [(HMHome *)self context];
      v252 = [v251 queue];
      v416[0] = MEMORY[0x1E4F143A8];
      v416[1] = 3221225472;
      v416[2] = __29__HMHome_mergeFromNewObject___block_invoke_5_843;
      v416[3] = &unk_1E59452E8;
      v416[4] = self;
      dispatch_async(v252, v416);
    }
    char v29 = 1;
  }
  v253 = [v6 supportedFeatures];
  v254 = [(HMHome *)self supportedFeatures];
  char v255 = [v253 isEqualToSet:v254];

  if ((v255 & 1) == 0)
  {
    [(HMHome *)self setSupportedFeatures:v253];
    v256 = [(HMHome *)self context];
    v257 = [v256 queue];
    v415[0] = MEMORY[0x1E4F143A8];
    v415[1] = 3221225472;
    v415[2] = __29__HMHome_mergeFromNewObject___block_invoke_6_844;
    v415[3] = &unk_1E59452E8;
    v415[4] = self;
    dispatch_async(v257, v415);

    char v29 = 1;
  }
  v389 = v253;
  v258 = [(HMHome *)self personManagerSettings];
  v259 = [v6 personManagerSettings];
  if (![v258 isEqual:v259])
  {

    goto LABEL_170;
  }
  v260 = [(HMHome *)self personManagerZoneUUID];
  v261 = [v6 personManagerZoneUUID];
  char v262 = HMFEqualObjects();

  if ((v262 & 1) == 0)
  {
LABEL_170:
    v263 = (void *)MEMORY[0x19F3A64A0]();
    v264 = self;
    HMFGetOSLogHandle();
    v265 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v265, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v266 = (id)objc_claimAutoreleasedReturnValue();
      v267 = [(HMHome *)v264 personManagerSettings];
      v268 = [v6 personManagerSettings];
      v269 = [(HMHome *)v264 personManagerZoneUUID];
      v270 = [v6 personManagerZoneUUID];
      *(_DWORD *)buf = 138544386;
      id v460 = v266;
      __int16 v461 = 2112;
      *(void *)v462 = v267;
      *(_WORD *)&v462[8] = 2112;
      uint64_t v463 = (uint64_t)v268;
      __int16 v464 = 2112;
      v465 = v269;
      __int16 v466 = 2112;
      v467 = v270;
      _os_log_impl(&dword_19D1A8000, v265, OS_LOG_TYPE_INFO, "%{public}@Person manager settings updated from %@ to %@, zone UUID updated from %@ to %@", buf, 0x34u);
    }
    v271 = [v6 personManagerSettings];
    [(HMHome *)v264 setPersonManagerSettings:v271];

    v272 = [v6 personManagerZoneUUID];
    [(HMHome *)v264 setPersonManagerZoneUUID:v272];

    [(HMHome *)v264 configurePersonManager];
    if (objc_opt_respondsToSelector())
    {
      v273 = [(HMHome *)v264 context];
      v274 = [v273 queue];
      v413[0] = MEMORY[0x1E4F143A8];
      v413[1] = 3221225472;
      v413[2] = __29__HMHome_mergeFromNewObject___block_invoke_846;
      v413[3] = &unk_1E5945628;
      v413[4] = v264;
      id v414 = v392;
      dispatch_async(v274, v413);
    }
    char v29 = 1;
  }
  v275 = [(HMHome *)self supportedSiriEndPointVersion];
  v276 = [v6 supportedSiriEndPointVersion];
  char v277 = [v275 isEqualToVersion:v276];

  if ((v277 & 1) == 0)
  {
    v278 = [v6 supportedSiriEndPointVersion];
    [(HMHome *)self setSupportedSiriEndPointVersion:v278];

    char v29 = 1;
  }
  int v279 = [(HMHome *)self areBulletinNotificationsSupported];
  v280 = v392;
  if (v279 != [v6 areBulletinNotificationsSupported])
  {
    v281 = (void *)MEMORY[0x19F3A64A0]();
    v282 = self;
    HMFGetOSLogHandle();
    v283 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v283, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v284 = (id)objc_claimAutoreleasedReturnValue();
      [(HMHome *)v282 areBulletinNotificationsSupported];
      HMFBooleanToString();
      id v285 = (id)objc_claimAutoreleasedReturnValue();
      [v6 areBulletinNotificationsSupported];
      HMFBooleanToString();
      id v286 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v460 = v284;
      __int16 v461 = 2112;
      *(void *)v462 = v285;
      *(_WORD *)&v462[8] = 2112;
      uint64_t v463 = (uint64_t)v286;
      _os_log_impl(&dword_19D1A8000, v283, OS_LOG_TYPE_INFO, "%{public}@Bulletin notifications supported updated from %@ to %@", buf, 0x20u);

      v280 = v392;
    }

    -[HMHome setBulletinNotificationsSupported:](v282, "setBulletinNotificationsSupported:", [v6 areBulletinNotificationsSupported]);
    if (objc_opt_respondsToSelector())
    {
      v287 = [(HMHome *)v282 context];
      v288 = [v287 queue];
      v411[0] = MEMORY[0x1E4F143A8];
      v411[1] = 3221225472;
      v411[2] = __29__HMHome_mergeFromNewObject___block_invoke_849;
      v411[3] = &unk_1E5945628;
      v411[4] = v282;
      id v412 = v280;
      dispatch_async(v288, v411);
    }
    char v29 = 1;
  }
  int v289 = [(HMHome *)self didOnboardEventLog];
  if (v289 != [v6 didOnboardEventLog])
  {
    v290 = (void *)MEMORY[0x19F3A64A0]();
    v291 = self;
    HMFGetOSLogHandle();
    v292 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v292, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v293 = (id)objc_claimAutoreleasedReturnValue();
      [(HMHome *)v291 didOnboardEventLog];
      HMFBooleanToString();
      id v294 = (id)objc_claimAutoreleasedReturnValue();
      [v6 didOnboardEventLog];
      HMFBooleanToString();
      id v295 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v460 = v293;
      __int16 v461 = 2112;
      *(void *)v462 = v294;
      *(_WORD *)&v462[8] = 2112;
      uint64_t v463 = (uint64_t)v295;
      _os_log_impl(&dword_19D1A8000, v292, OS_LOG_TYPE_INFO, "%{public}@Activity history onboarding changed from %@ to %@", buf, 0x20u);

      v280 = v392;
    }

    -[HMHome setDidOnboardEventLog:](v291, "setDidOnboardEventLog:", [v6 didOnboardEventLog]);
    if ([v6 didOnboardEventLog]) {
      [(HMHome *)v291 _callDelegateDidOnboardEventLog];
    }
    char v29 = 1;
  }
  int v296 = [(HMHome *)self isEventLogEnabled];
  if (v296 != [v6 isEventLogEnabled])
  {
    v297 = (void *)MEMORY[0x19F3A64A0]();
    v298 = self;
    HMFGetOSLogHandle();
    v299 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v299, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v300 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v301 = [(HMHome *)v298 isEventLogEnabled];
      int v302 = [v6 isEventLogEnabled];
      *(_DWORD *)buf = 138543874;
      id v460 = v300;
      __int16 v461 = 1024;
      *(_DWORD *)v462 = v301;
      *(_WORD *)&v462[4] = 1024;
      *(_DWORD *)&v462[6] = v302;
      _os_log_impl(&dword_19D1A8000, v299, OS_LOG_TYPE_INFO, "%{public}@Activity history home setting enabled changed from %{BOOL}d to %{BOOL}d", buf, 0x18u);
    }
    -[HMHome setEventLogEnabled:](v298, "setEventLogEnabled:", [v6 isEventLogEnabled]);
    [(HMHome *)v298 _callDelegateDidUpdateEventLogEnabled];
    char v29 = 1;
  }
  unint64_t v303 = [(HMHome *)self eventLogDuration];
  if (v303 != [v6 eventLogDuration])
  {
    v304 = (void *)MEMORY[0x19F3A64A0]();
    v305 = self;
    HMFGetOSLogHandle();
    v306 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v306, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v307 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v308 = [(HMHome *)v305 eventLogDuration];
      uint64_t v309 = [v6 eventLogDuration];
      *(_DWORD *)buf = 138543874;
      id v460 = v307;
      __int16 v461 = 2048;
      *(void *)v462 = v308;
      *(_WORD *)&v462[8] = 2048;
      uint64_t v463 = v309;
      _os_log_impl(&dword_19D1A8000, v306, OS_LOG_TYPE_INFO, "%{public}@Activity history duration changed from %lu to %lu", buf, 0x20u);
    }
    -[HMHome setEventLogDuration:](v305, "setEventLogDuration:", [v6 eventLogDuration]);
    if (objc_opt_respondsToSelector())
    {
      v310 = [(HMHome *)v305 context];
      v311 = v310;
      if (v310)
      {
        v312 = [v310 queue];
        v407[0] = MEMORY[0x1E4F143A8];
        v407[1] = 3221225472;
        v407[2] = __29__HMHome_mergeFromNewObject___block_invoke_852;
        v407[3] = &unk_1E5945650;
        id v408 = v311;
        id v409 = v280;
        v410 = v305;
        dispatch_async(v312, v407);
      }
    }
    char v29 = 1;
  }
  v313 = [(HMHome *)self timeZone];
  v314 = [v6 timeZone];
  char v315 = HMFEqualObjects();

  if ((v315 & 1) == 0)
  {
    v316 = (void *)MEMORY[0x19F3A64A0]();
    v317 = self;
    HMFGetOSLogHandle();
    v318 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v318, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v319 = (id)objc_claimAutoreleasedReturnValue();
      v320 = [(HMHome *)v317 timeZone];
      v321 = [v6 timeZone];
      *(_DWORD *)buf = 138543874;
      id v460 = v319;
      __int16 v461 = 2112;
      *(void *)v462 = v320;
      *(_WORD *)&v462[8] = 2112;
      uint64_t v463 = (uint64_t)v321;
      _os_log_impl(&dword_19D1A8000, v318, OS_LOG_TYPE_INFO, "%{public}@Home timeZone changed from %@ to %@", buf, 0x20u);
    }
    v322 = [v6 timeZone];
    [(HMHome *)v317 setTimeZone:v322];

    if (objc_opt_respondsToSelector())
    {
      v323 = [(HMHome *)v317 context];
      v324 = v323;
      if (v323)
      {
        v325 = [v323 queue];
        v403[0] = MEMORY[0x1E4F143A8];
        v403[1] = 3221225472;
        v403[2] = __29__HMHome_mergeFromNewObject___block_invoke_855;
        v403[3] = &unk_1E5945650;
        id v404 = v324;
        id v405 = v280;
        v406 = v317;
        dispatch_async(v325, v403);
      }
    }
    char v29 = 1;
  }
  v326 = [(HMHome *)self numberOfCameras];
  v327 = [v6 numberOfCameras];
  char v328 = HMFEqualObjects();

  if ((v328 & 1) == 0)
  {
    v329 = (void *)MEMORY[0x19F3A64A0]();
    v330 = self;
    HMFGetOSLogHandle();
    v331 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v331, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v332 = (id)objc_claimAutoreleasedReturnValue();
      v333 = [(HMHome *)v330 numberOfCameras];
      int v334 = [v333 unsignedIntValue];
      v335 = [v6 numberOfCameras];
      int v336 = [v335 unsignedIntValue];
      *(_DWORD *)buf = 138543874;
      id v460 = v332;
      __int16 v461 = 1024;
      *(_DWORD *)v462 = v334;
      *(_WORD *)&v462[4] = 1024;
      *(_DWORD *)&v462[6] = v336;
      _os_log_impl(&dword_19D1A8000, v331, OS_LOG_TYPE_INFO, "%{public}@Home numberOfCameras changed from %u to %u", buf, 0x18u);

      v280 = v392;
    }

    v337 = [v6 numberOfCameras];
    [(HMHome *)v330 setNumberOfCameras:v337];

    char v29 = 1;
  }
  int v338 = [(HMHome *)self supportsResidentSelection];
  if (v338 != [v6 supportsResidentSelection])
  {
    -[HMHome setSupportsResidentSelection:](self, "setSupportsResidentSelection:", [v6 supportsResidentSelection]);
    v339 = [(HMHome *)self context];
    v340 = [v339 queue];
    v400[0] = MEMORY[0x1E4F143A8];
    v400[1] = 3221225472;
    v400[2] = __29__HMHome_mergeFromNewObject___block_invoke_857;
    v400[3] = &unk_1E5945628;
    id v401 = v280;
    v402 = self;
    dispatch_async(v340, v400);

    char v29 = 1;
  }
  v341 = [(HMHome *)self userSelectedPreferredResident];
  v342 = [v6 userSelectedPreferredResident];
  char v343 = HMFEqualObjects();

  if ((v343 & 1) == 0)
  {
    v344 = (void *)MEMORY[0x19F3A64A0]();
    v345 = self;
    HMFGetOSLogHandle();
    v346 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v346, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v347 = (id)objc_claimAutoreleasedReturnValue();
      v348 = [(HMHome *)v345 userSelectedPreferredResident];
      v349 = [v6 userSelectedPreferredResident];
      *(_DWORD *)buf = 138543874;
      id v460 = v347;
      __int16 v461 = 2112;
      *(void *)v462 = v348;
      *(_WORD *)&v462[8] = 2112;
      uint64_t v463 = (uint64_t)v349;
      _os_log_impl(&dword_19D1A8000, v346, OS_LOG_TYPE_INFO, "%{public}@User selected preferred resident is changing from [%@] to [%@]", buf, 0x20u);
    }
    v350 = [v6 userSelectedPreferredResident];
    [(HMHome *)v345 setUserSelectedPreferredResident:v350];

    v351 = [(HMHome *)v345 context];
    v352 = [v351 queue];
    v397[0] = MEMORY[0x1E4F143A8];
    v397[1] = 3221225472;
    v397[2] = __29__HMHome_mergeFromNewObject___block_invoke_860;
    v397[3] = &unk_1E5945628;
    id v398 = v280;
    v399 = v345;
    dispatch_async(v352, v397);

    char v29 = 1;
  }
  v353 = [(HMHome *)self autoSelectedPreferredResidents];
  v354 = [v6 autoSelectedPreferredResidents];
  char v355 = HMFEqualObjects();

  if ((v355 & 1) == 0)
  {
    v356 = (void *)MEMORY[0x19F3A64A0]();
    v357 = self;
    HMFGetOSLogHandle();
    v358 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v358, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v359 = (id)objc_claimAutoreleasedReturnValue();
      v360 = [(HMHome *)v357 autoSelectedPreferredResidents];
      v361 = [v6 autoSelectedPreferredResidents];
      *(_DWORD *)buf = 138543874;
      id v460 = v359;
      __int16 v461 = 2112;
      *(void *)v462 = v360;
      *(_WORD *)&v462[8] = 2112;
      uint64_t v463 = (uint64_t)v361;
      _os_log_impl(&dword_19D1A8000, v358, OS_LOG_TYPE_INFO, "%{public}@auto selected preferred resident is changing from [%@] to [%@]", buf, 0x20u);
    }
    v362 = [v6 autoSelectedPreferredResidents];
    [(HMHome *)v357 setAutoSelectedPreferredResidents:v362];

    v363 = [(HMHome *)v357 context];
    v364 = [v363 queue];
    v394[0] = MEMORY[0x1E4F143A8];
    v394[1] = 3221225472;
    v394[2] = __29__HMHome_mergeFromNewObject___block_invoke_863;
    v394[3] = &unk_1E5945628;
    id v395 = v280;
    v396 = v357;
    dispatch_async(v364, v394);

    char v29 = 1;
  }
  int64_t v365 = [(HMHome *)self homeLocationStatus];
  if (v365 != [v6 homeLocationStatus])
  {
    v366 = (void *)MEMORY[0x19F3A64A0]();
    v367 = self;
    HMFGetOSLogHandle();
    v368 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v368, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v369 = (id)objc_claimAutoreleasedReturnValue();
      unint64_t v370 = [(HMHome *)v367 homeLocationStatus];
      if (v370 > 3) {
        v371 = @"HMHomeLocationAway";
      }
      else {
        v371 = off_1E5941908[v370];
      }
      unint64_t v372 = [v6 homeLocationStatus];
      if (v372 > 3) {
        v373 = @"HMHomeLocationAway";
      }
      else {
        v373 = off_1E5941908[v372];
      }
      *(_DWORD *)buf = 138543874;
      id v460 = v369;
      __int16 v461 = 2112;
      *(void *)v462 = v371;
      *(_WORD *)&v462[8] = 2112;
      uint64_t v463 = (uint64_t)v373;
      _os_log_impl(&dword_19D1A8000, v368, OS_LOG_TYPE_INFO, "%{public}@Updating home location status from %@ to %@ via merge", buf, 0x20u);
    }
    -[HMHome setHomeLocationStatus:](v367, "setHomeLocationStatus:", [v6 homeLocationStatus]);
    v374 = [(HMHome *)v367 context];
    v375 = [v374 queue];
    v393[0] = MEMORY[0x1E4F143A8];
    v393[1] = 3221225472;
    v393[2] = __29__HMHome_mergeFromNewObject___block_invoke_866;
    v393[3] = &unk_1E59452E8;
    v393[4] = v367;
    dispatch_async(v375, v393);

    char v29 = 1;
    v280 = v392;
  }
  v376 = (void *)MEMORY[0x19F3A64A0]();
  v377 = self;
  HMFGetOSLogHandle();
  v378 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v378, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v379 = (id)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    id v380 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    id v460 = v379;
    __int16 v461 = 2112;
    *(void *)v462 = v380;
    _os_log_impl(&dword_19D1A8000, v378, OS_LOG_TYPE_INFO, "%{public}@Finished home merge with modified=%@", buf, 0x16u);
  }

  id v4 = v390;
LABEL_236:

  return v29 & 1;
}

void __29__HMHome_mergeFromNewObject___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__HMHome_mergeFromNewObject___block_invoke_2;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

void __29__HMHome_mergeFromNewObject___block_invoke_628(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__HMHome_mergeFromNewObject___block_invoke_2_629;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

void __29__HMHome_mergeFromNewObject___block_invoke_632(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__HMHome_mergeFromNewObject___block_invoke_2_633;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

void __29__HMHome_mergeFromNewObject___block_invoke_636(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__HMHome_mergeFromNewObject___block_invoke_2_637;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

void __29__HMHome_mergeFromNewObject___block_invoke_640(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__HMHome_mergeFromNewObject___block_invoke_2_641;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

void __29__HMHome_mergeFromNewObject___block_invoke_642(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__HMHome_mergeFromNewObject___block_invoke_2_643;
  v4[3] = &unk_1E59452E8;
  v4[4] = *(void *)(a1 + 32);
  [v3 invokeBlock:v4];
}

void __29__HMHome_mergeFromNewObject___block_invoke_646(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__HMHome_mergeFromNewObject___block_invoke_2_647;
  v4[3] = &unk_1E59452E8;
  v4[4] = *(void *)(a1 + 32);
  [v3 invokeBlock:v4];
}

void __29__HMHome_mergeFromNewObject___block_invoke_650(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__HMHome_mergeFromNewObject___block_invoke_2_651;
  v4[3] = &unk_1E59452E8;
  v4[4] = *(void *)(a1 + 32);
  [v3 invokeBlock:v4];
}

void __29__HMHome_mergeFromNewObject___block_invoke_662(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__HMHome_mergeFromNewObject___block_invoke_2_663;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

void __29__HMHome_mergeFromNewObject___block_invoke_666(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__HMHome_mergeFromNewObject___block_invoke_2_667;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

void __29__HMHome_mergeFromNewObject___block_invoke_670(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__HMHome_mergeFromNewObject___block_invoke_2_671;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

void __29__HMHome_mergeFromNewObject___block_invoke_674(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__HMHome_mergeFromNewObject___block_invoke_2_675;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

void __29__HMHome_mergeFromNewObject___block_invoke_678(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__HMHome_mergeFromNewObject___block_invoke_2_679;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfAppDataUpdate];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfHomeHubStateUpdate];
}

void __29__HMHome_mergeFromNewObject___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__HMHome_mergeFromNewObject___block_invoke_6;
  v6[3] = &unk_1E5944D60;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  char v9 = *(unsigned char *)(a1 + 48);
  [v3 invokeBlock:v6];
}

void __29__HMHome_mergeFromNewObject___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__HMHome_mergeFromNewObject___block_invoke_8;
  v6[3] = &unk_1E5944D60;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  char v9 = *(unsigned char *)(a1 + 48);
  [v3 invokeBlock:v6];
}

void __29__HMHome_mergeFromNewObject___block_invoke_826(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__HMHome_mergeFromNewObject___block_invoke_2_827;
  v6[3] = &unk_1E5945160;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  uint64_t v9 = *(void *)(a1 + 48);
  [v3 invokeBlock:v6];
}

void __29__HMHome_mergeFromNewObject___block_invoke_835(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__HMHome_mergeFromNewObject___block_invoke_2_836;
  v6[3] = &unk_1E5944D60;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  char v9 = *(unsigned char *)(a1 + 48);
  [v3 invokeBlock:v6];
}

void __29__HMHome_mergeFromNewObject___block_invoke_838(id *a1)
{
  uint64_t v2 = [a1[4] context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__HMHome_mergeFromNewObject___block_invoke_2_839;
  v6[3] = &unk_1E5945650;
  id v4 = a1[5];
  id v5 = a1[4];
  id v7 = v4;
  id v8 = v5;
  id v9 = a1[6];
  [v3 invokeBlock:v6];
}

void __29__HMHome_mergeFromNewObject___block_invoke_3_841(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__HMHome_mergeFromNewObject___block_invoke_4_842;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_5_843(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didUpdateNetworkRouterSupport];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_6_844(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyUpdatedSupportedFeatures];
}

void __29__HMHome_mergeFromNewObject___block_invoke_846(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__HMHome_mergeFromNewObject___block_invoke_2_847;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

void __29__HMHome_mergeFromNewObject___block_invoke_849(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__HMHome_mergeFromNewObject___block_invoke_2_850;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

void __29__HMHome_mergeFromNewObject___block_invoke_852(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__HMHome_mergeFromNewObject___block_invoke_2_853;
  v5[3] = &unk_1E5945628;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 invokeBlock:v5];
}

void __29__HMHome_mergeFromNewObject___block_invoke_855(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__HMHome_mergeFromNewObject___block_invoke_2_856;
  v5[3] = &unk_1E5945628;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 invokeBlock:v5];
}

void __29__HMHome_mergeFromNewObject___block_invoke_857(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [*(id *)(a1 + 40) context];
    id v3 = [v2 delegateCaller];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __29__HMHome_mergeFromNewObject___block_invoke_2_859;
    v6[3] = &unk_1E5945628;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v7 = v4;
    uint64_t v8 = v5;
    [v3 invokeBlock:v6];
  }
}

void __29__HMHome_mergeFromNewObject___block_invoke_860(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [*(id *)(a1 + 40) context];
    id v3 = [v2 delegateCaller];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __29__HMHome_mergeFromNewObject___block_invoke_2_862;
    v6[3] = &unk_1E5945628;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v7 = v4;
    uint64_t v8 = v5;
    [v3 invokeBlock:v6];
  }
}

void __29__HMHome_mergeFromNewObject___block_invoke_863(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [*(id *)(a1 + 40) context];
    id v3 = [v2 delegateCaller];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __29__HMHome_mergeFromNewObject___block_invoke_2_865;
    v6[3] = &unk_1E5945628;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v7 = v4;
    uint64_t v8 = v5;
    [v3 invokeBlock:v6];
  }
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_866(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfUpdatedHomeLocationStatus];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_2_865(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeDidUpdateAutoSelectedPreferredResident:*(void *)(a1 + 40)];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_2_862(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeDidUpdateUserSelectedPreferredResident:*(void *)(a1 + 40)];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_2_859(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeDidUpdateSupportsResidentSelection:*(void *)(a1 + 40)];
}

void __29__HMHome_mergeFromNewObject___block_invoke_2_856(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = [v2 timeZone];
  [v1 home:v2 didUpdateTimeZone:v3];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_2_853(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 eventLogDuration];

  return [v1 home:v2 didUpdateEventLogDuration:v3];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_2_850(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 areBulletinNotificationsSupported];

  return [v1 home:v2 didUpdateAreBulletinNotificationsSupported:v3];
}

void __29__HMHome_mergeFromNewObject___block_invoke_2_847(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = [v2 personManagerSettings];
  [v1 home:v2 didUpdatePersonManagerSettings:v3];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_4_842(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeDidUpdateProtectionMode:*(void *)(a1 + 40)];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_2_839(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateMediaPassword:*(void *)(a1 + 48)];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_2_836(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateMediaPeerToPeerEnabled:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_2_827(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateMinimumMediaUserPrivilege:*(void *)(a1 + 48)];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateAutomaticThirdPartyAccessorySoftwareUpdateEnabled:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateAutomaticSoftwareUpdateEnabled:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_2_679(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 dismissedWalletKeyUWBUnlockOnboarding];

  return [v1 home:v2 didUpdateDismissedWalletKeyUWBUnlockOnboarding:v3];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_2_675(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 hasOnboardedForWalletKey];

  return [v1 home:v2 didUpdateHasOnboardedForWalletKey:v3];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_2_671(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeDidSetHasOnboardedForAccessCode:*(void *)(a1 + 40)];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_2_667(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeDidSetHasAnyUserAcknowledgedCameraRecordingOnboarding:*(void *)(a1 + 40)];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_2_663(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeDidEnableMultiUser:*(void *)(a1 + 40)];
}

void __29__HMHome_mergeFromNewObject___block_invoke_2_651(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _privateDelegate];
  uint64_t v3 = (void *)MEMORY[0x19F3A64A0]();
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    __int16 v10 = v2;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of did onboard location services using delegate: %@", (uint8_t *)&v7, 0x16u);
  }
  if (objc_opt_respondsToSelector()) {
    [v2 homeDidOnboardLocationServices:*(void *)(a1 + 32)];
  }
}

void __29__HMHome_mergeFromNewObject___block_invoke_2_647(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _privateDelegate];
  uint64_t v3 = (void *)MEMORY[0x19F3A64A0]();
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    __int16 v10 = v2;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of updated location services using delegate: %@", (uint8_t *)&v7, 0x16u);
  }
  if (objc_opt_respondsToSelector()) {
    [v2 homeDidEnableLocationServices:*(void *)(a1 + 32)];
  }
}

void __29__HMHome_mergeFromNewObject___block_invoke_2_643(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _privateDelegate];
  uint64_t v3 = (void *)MEMORY[0x19F3A64A0]();
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    __int16 v10 = v2;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of updated Siri phrase options using delegate: %@", (uint8_t *)&v7, 0x16u);
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v2, "home:didUpdateSiriPhraseOptions:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "siriPhraseOptions"));
  }
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_2_641(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 didOnboardAudioAnalysis];

  return [v1 home:v2 didUpdateOnboardAudioAnalysis:v3];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_2_637(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 audioAnalysisClassifierOptions];

  return [v1 home:v2 didUpdateAudioAnalysisClassifierOptions:v3];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_2_633(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 supportsResidentActionSetStateEvaluation];

  return [v1 home:v2 didUpdateSupportsResidentActionSetStateEvaluation:v3];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_2_629(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeDidUpdateSoundCheck:*(void *)(a1 + 40)];
}

uint64_t __29__HMHome_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeDidUpdateName:*(void *)(a1 + 40)];
}

- (void)mergeFromNewObjectNoMergeCount:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMHome *)self context];
  if (v5)
  {
    id v6 = NSString;
    int v7 = [(HMHome *)self uuid];
    uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
    __int16 v9 = [v6 stringWithFormat:@"Merge-HM-%@-%@", v7, v8];

    __int16 v10 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__HMHome_mergeFromNewObjectNoMergeCount___block_invoke;
    block[3] = &unk_1E5945628;
    void block[4] = self;
    id v11 = v9;
    id v21 = v11;
    dispatch_async(v10, block);

    [(HMHome *)self mergeFromNewObject:v4];
    uint64_t v12 = [v5 queue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __41__HMHome_mergeFromNewObjectNoMergeCount___block_invoke_2;
    v18[3] = &unk_1E5945628;
    void v18[4] = self;
    id v19 = v11;
    id v13 = v11;
    dispatch_async(v12, v18);
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v15 = self;
    BOOL v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      char v23 = v17;
      __int16 v24 = 2080;
      BOOL v25 = "-[HMHome mergeFromNewObjectNoMergeCount:]";
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __41__HMHome_mergeFromNewObjectNoMergeCount___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homeManager];
  [v2 notifyDelegateOfBatchNotificationsStartWithReason:*(void *)(a1 + 40)];
}

void __41__HMHome_mergeFromNewObjectNoMergeCount___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homeManager];
  [v2 notifyDelegateOfBatchNotificationsEndWithReason:*(void *)(a1 + 40)];
}

- (void)recomputeAssistantIdentifiersWithCompletion:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  [(HMHome *)self recomputeAssistantIdentifier];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v5 = [(HMHome *)self rooms];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v65 objects:v76 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v66;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v66 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v65 + 1) + 8 * v9++) recomputeAssistantIdentifier];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v65 objects:v76 count:16];
    }
    while (v7);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  __int16 v10 = [(HMHome *)self zones];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v61 objects:v75 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v62;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v62 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v61 + 1) + 8 * v14++) recomputeAssistantIdentifier];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v61 objects:v75 count:16];
    }
    while (v12);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  __int16 v15 = [(HMHome *)self accessories];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v57 objects:v74 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v58;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v58 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v57 + 1) + 8 * v19++) recomputeAssistantIdentifier];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v57 objects:v74 count:16];
    }
    while (v17);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v20 = [(HMHome *)self serviceGroups];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v53 objects:v73 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v54;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v54 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v53 + 1) + 8 * v24++) recomputeAssistantIdentifier];
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v53 objects:v73 count:16];
    }
    while (v22);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  BOOL v25 = [(HMHome *)self actionSets];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v49 objects:v72 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v50;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v50 != v28) {
          objc_enumerationMutation(v25);
        }
        [*(id *)(*((void *)&v49 + 1) + 8 * v29++) recomputeAssistantIdentifier];
      }
      while (v27 != v29);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v49 objects:v72 count:16];
    }
    while (v27);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v30 = [(HMHome *)self triggers];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v45 objects:v71 count:16];
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
        [*(id *)(*((void *)&v45 + 1) + 8 * v34++) recomputeAssistantIdentifier];
      }
      while (v32 != v34);
      uint64_t v32 = [v30 countByEnumeratingWithState:&v45 objects:v71 count:16];
    }
    while (v32);
  }

  long long v35 = [(HMHome *)self context];
  long long v36 = [(HMHome *)self _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    long long v37 = (void *)MEMORY[0x19F3A64A0]();
    long long v38 = self;
    __int16 v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      int v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v70 = v40;
      _os_log_impl(&dword_19D1A8000, v39, OS_LOG_TYPE_INFO, "%{public}@Notifying client of assistant identifier update", buf, 0xCu);
    }
    __int16 v41 = [v35 delegateCaller];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __54__HMHome_recomputeAssistantIdentifiersWithCompletion___block_invoke;
    v42[3] = &unk_1E5945628;
    id v43 = v36;
    id v44 = v38;
    [v41 invokeBlock:v42];
  }
  if (v4) {
    v4[2](v4);
  }
}

uint64_t __54__HMHome_recomputeAssistantIdentifiersWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeDidUpdateAssistantIdentifiers:*(void *)(a1 + 40)];
}

- (void)recomputeAssistantIdentifier
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(HMHome *)self _recomputeAssistantIdentifier];

  os_unfair_lock_unlock(p_lock);
}

- (NSString)assistantIdentifier
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  assistantIdentifier = self->_assistantIdentifier;
  if (!assistantIdentifier)
  {
    [(HMHome *)self _recomputeAssistantIdentifier];
    assistantIdentifier = self->_assistantIdentifier;
  }
  uint64_t v5 = assistantIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (void)_recomputeAssistantIdentifier
{
  hm_assistantIdentifierWithSalts(@"HM", (uint64_t)self->_uuid, 0);
  uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  assistantIdentifier = self->_assistantIdentifier;
  self->_assistantIdentifier = v3;

  MEMORY[0x1F41817F8](v3, assistantIdentifier);
}

- (id)createActionSetWithName:(id)a3 type:(id)a4 uuid:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [[HMActionSet alloc] initWithName:v10 type:v9 uuid:v8];

  uint64_t v12 = [(HMHome *)self context];
  [(HMActionSet *)v11 __configureWithContext:v12 home:self];

  return v11;
}

- (BOOL)adoptTriggerOwnedActionSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMHome *)self currentTriggerOwnedActionSets];
  int v6 = [v5 addObjectIfNotPresent:v4];

  if (v6)
  {
    uint64_t v7 = [(HMHome *)self context];
    objc_msgSend(v4, "__configureWithContext:home:", v7, self);
  }
  return v6;
}

- (id)createAndAddActionSetWithName:(id)a3 type:(id)a4 uuid:(id)a5
{
  int v6 = [(HMHome *)self createActionSetWithName:a3 type:a4 uuid:a5];
  uint64_t v7 = [(HMHome *)self currentTriggerOwnedActionSets];
  [v7 addObject:v6];

  return v6;
}

- (id)accessoryInfoFetch
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_accessoryInfoFetch;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setAccessoryInfoFetch:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  id accessoryInfoFetch = self->_accessoryInfoFetch;
  self->_id accessoryInfoFetch = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setBulletinNotificationsSupported:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_bulletinNotificationsSupported = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)areBulletinNotificationsSupported
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_bulletinNotificationsSupported;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setNetworkRouterSupportDisableReason:(unint64_t)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_networkRouterSupportDisableReason = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)networkRouterSupportDisableReason
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t networkRouterSupportDisableReason = self->_networkRouterSupportDisableReason;
  os_unfair_lock_unlock(p_lock);
  return networkRouterSupportDisableReason;
}

- (void)setNetworkRouterSupport:(unint64_t)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_networkRouterSupport = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)networkRouterSupport
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t networkRouterSupport = self->_networkRouterSupport;
  os_unfair_lock_unlock(p_lock);
  return networkRouterSupport;
}

- (void)setProtectionMode:(int64_t)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_protectionMode = a3;

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)protectionMode
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t protectionMode = self->_protectionMode;
  os_unfair_lock_unlock(p_lock);
  return protectionMode;
}

- (NSDate)notificationsUpdatedTime
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_notificationsUpdatedTime;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)areNotificationsEnabled
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_notificationsEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)targetControllers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [(HMHome *)self accessories];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "supportsTargetController", (void)v12)) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = (void *)[v3 copy];

  return v10;
}

- (id)controlTargets
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [(HMHome *)self accessories];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "supportsTargetControl", (void)v11)) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)stageRemovedMediaSystemUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self mediaSystemStageManager];
  [v5 stageRemovedMediaSystemUUID:v4];
}

- (void)stageAddedMediaSystem:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self mediaSystemStageManager];
  [v5 stageAddedMediaSystem:v4];
}

- (BOOL)supportsAddingNetworkRouter
{
  id v2 = [(HMHome *)self supportedFeatures];
  char v3 = [v2 containsObject:&unk_1EEF07F38];

  return v3;
}

- (BOOL)_setSupportedFeature:(int64_t)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v8 = self->_supportedFeatures;
  id v9 = (void *)[(NSSet *)v8 mutableCopy];
  id v10 = [NSNumber numberWithInteger:a3];
  if (v4) {
    [v9 addObject:v10];
  }
  else {
    [v9 removeObject:v10];
  }

  BOOL v11 = [(NSSet *)v8 isEqualToSet:v9];
  if (!v11)
  {
    long long v12 = (NSSet *)[v9 copy];
    supportedFeatures = self->_supportedFeatures;
    self->_supportedFeatures = v12;
  }
  os_unfair_lock_unlock(p_lock);
  return !v11;
}

- (NSSet)supportedFeatures
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = self->_supportedFeatures;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setSupportedFeatures:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  BOOL v4 = (NSSet *)[v6 copy];
  supportedFeatures = self->_supportedFeatures;
  self->_supportedFeatures = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setApplicationData:(id)a3
{
  BOOL v4 = (HMApplicationData *)a3;
  os_unfair_lock_lock_with_options();
  applicationData = self->_applicationData;
  self->_applicationData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setCurrentUser:(id)a3
{
  BOOL v4 = (HMUser *)a3;
  os_unfair_lock_lock_with_options();
  currentUser = self->_currentUser;
  self->_currentUser = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setHomeLocation:(id)a3
{
  BOOL v4 = (CLLocation *)a3;
  os_unfair_lock_lock_with_options();
  homeLocation = self->_homeLocation;
  self->_homeLocation = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  BOOL v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setHomeLocationStatus:(int64_t)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_int64_t homeLocationStatus = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  BOOL v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    name = self->_name;
    uuid = self->_uuid;
    *(_DWORD *)buf = 138544130;
    id v10 = v5;
    __int16 v11 = 2112;
    long long v12 = name;
    __int16 v13 = 2112;
    long long v14 = uuid;
    __int16 v15 = 2048;
    uint64_t v16 = self;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Deallocating HMDHome(name=%@, uuid=%@); %p",
      buf,
      0x2Au);
  }
  v8.receiver = self;
  v8.super_class = (Class)HMHome;
  [(HMHome *)&v8 dealloc];
}

- (void)unconfigure
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v3 = [(HMHome *)self context];
  BOOL v4 = [v3 queue];

  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __21__HMHome_unconfigure__block_invoke;
    block[3] = &unk_1E59452E8;
    void block[4] = self;
    dispatch_async(v4, block);
  }
  else
  {
    id v5 = (void *)MEMORY[0x19F3A64A0]();
    id v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_super v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v11 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Attempted to unconfigure already unconfigured home", buf, 0xCu);
    }
  }
}

uint64_t __21__HMHome_unconfigure__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unconfigure];
}

- (void)_unconfigure
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  char v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  BOOL v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    uint64_t v7 = [(HMHome *)v4 name];
    *(_DWORD *)buf = 138543618;
    int v113 = v6;
    __int16 v114 = 2112;
    uint64_t v115 = v7;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Unconfiguring home [%@] and its child objects", buf, 0x16u);
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  objc_super v8 = [(HMHome *)v4 rooms];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v99 objects:v111 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v100;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v100 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v99 + 1) + 8 * v12++) _unconfigure];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v99 objects:v111 count:16];
    }
    while (v10);
  }

  __int16 v13 = [(HMHome *)v4 currentRooms];
  [v13 setArray:0];

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v14 = [(HMHome *)v4 zones];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v95 objects:v110 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v96;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v96 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v95 + 1) + 8 * v18++) _unconfigure];
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v95 objects:v110 count:16];
    }
    while (v16);
  }

  uint64_t v19 = [(HMHome *)v4 currentZones];
  [v19 setArray:0];

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  uint64_t v20 = [(HMHome *)v4 actionSets];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v91 objects:v109 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v92;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v92 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v91 + 1) + 8 * v24++) _unconfigure];
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v91 objects:v109 count:16];
    }
    while (v22);
  }

  BOOL v25 = [(HMHome *)v4 currentActionSets];
  [v25 setArray:0];

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  uint64_t v26 = [(HMHome *)v4 triggerOwnedActionSets];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v87 objects:v108 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v88;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v88 != v29) {
          objc_enumerationMutation(v26);
        }
        [*(id *)(*((void *)&v87 + 1) + 8 * v30++) _unconfigure];
      }
      while (v28 != v30);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v87 objects:v108 count:16];
    }
    while (v28);
  }

  uint64_t v31 = [(HMHome *)v4 currentTriggerOwnedActionSets];
  [v31 setArray:0];

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  uint64_t v32 = [(HMHome *)v4 triggers];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v83 objects:v107 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v84;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v84 != v35) {
          objc_enumerationMutation(v32);
        }
        [*(id *)(*((void *)&v83 + 1) + 8 * v36++) _unconfigure];
      }
      while (v34 != v36);
      uint64_t v34 = [v32 countByEnumeratingWithState:&v83 objects:v107 count:16];
    }
    while (v34);
  }

  long long v37 = [(HMHome *)v4 currentTriggers];
  [v37 setArray:0];

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v38 = [(HMHome *)v4 serviceGroups];
  uint64_t v39 = [v38 countByEnumeratingWithState:&v79 objects:v106 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v80;
    do
    {
      uint64_t v42 = 0;
      do
      {
        if (*(void *)v80 != v41) {
          objc_enumerationMutation(v38);
        }
        [*(id *)(*((void *)&v79 + 1) + 8 * v42++) _unconfigure];
      }
      while (v40 != v42);
      uint64_t v40 = [v38 countByEnumeratingWithState:&v79 objects:v106 count:16];
    }
    while (v40);
  }

  id v43 = [(HMHome *)v4 currentServiceGroups];
  [v43 setArray:0];

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v44 = [(HMHome *)v4 accessories];
  uint64_t v45 = [v44 countByEnumeratingWithState:&v75 objects:v105 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v76;
    do
    {
      uint64_t v48 = 0;
      do
      {
        if (*(void *)v76 != v47) {
          objc_enumerationMutation(v44);
        }
        [*(id *)(*((void *)&v75 + 1) + 8 * v48++) _unconfigure];
      }
      while (v46 != v48);
      uint64_t v46 = [v44 countByEnumeratingWithState:&v75 objects:v105 count:16];
    }
    while (v46);
  }

  long long v49 = [(HMHome *)v4 currentAccessories];
  [v49 setArray:0];

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v50 = [(HMHome *)v4 users];
  uint64_t v51 = [v50 countByEnumeratingWithState:&v71 objects:v104 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v72;
    do
    {
      uint64_t v54 = 0;
      do
      {
        if (*(void *)v72 != v53) {
          objc_enumerationMutation(v50);
        }
        [*(id *)(*((void *)&v71 + 1) + 8 * v54++) _unconfigure];
      }
      while (v52 != v54);
      uint64_t v52 = [v50 countByEnumeratingWithState:&v71 objects:v104 count:16];
    }
    while (v52);
  }

  long long v55 = [(HMHome *)v4 currentUsers];
  [v55 setArray:0];

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v56 = [(HMHome *)v4 residentDevices];
  uint64_t v57 = [v56 countByEnumeratingWithState:&v67 objects:v103 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v68;
    do
    {
      uint64_t v60 = 0;
      do
      {
        if (*(void *)v68 != v59) {
          objc_enumerationMutation(v56);
        }
        [*(id *)(*((void *)&v67 + 1) + 8 * v60++) _unconfigure];
      }
      while (v58 != v60);
      uint64_t v58 = [v56 countByEnumeratingWithState:&v67 objects:v103 count:16];
    }
    while (v58);
  }

  long long v61 = [(HMHome *)v4 currentResidentDevices];
  [v61 setArray:0];

  long long v62 = [(HMHome *)v4 mediaSystemStageManager];
  [v62 unconfigure];

  long long v63 = [(HMHome *)v4 accessCodeManager];
  [v63 unconfigure];

  [(HMHome *)v4 setHomeManager:0];
  long long v64 = [(HMHome *)v4 context];
  long long v65 = [v64 messageDispatcher];
  [v65 deregisterReceiver:v4];

  [(HMHome *)v4 setContext:0];
  long long v66 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v66 removeObserver:v4];
}

- (HMHome)initWithName:(id)a3 uuid:(id)a4
{
  return [(HMHome *)self initWithName:a3 uuid:a4 mediaSystems:MEMORY[0x1E4F1CBF0]];
}

- (HMHome)init
{
  return 0;
}

- (void)fetchTriggerNameForTriggerIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(HMHome *)self context];
  if (!v8)
  {
    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v20;
      __int16 v42 = 2080;
      id v43 = "-[HMHome(Trigger) fetchTriggerNameForTriggerIdentifier:completionHandler:]";
      uint64_t v21 = "%{public}@Nil context - %s";
      uint64_t v22 = v19;
      uint32_t v23 = 22;
LABEL_9:
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (!v7)
  {
    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v20;
      uint64_t v21 = "%{public}@completionHandler is required.";
      uint64_t v22 = v19;
      uint32_t v23 = 12;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if (v6)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F654B0];
    id v10 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v11 = [(HMHome *)self uuid];
    uint64_t v12 = (void *)[v10 initWithTarget:v11];
    long long v38 = @"triggerUUID";
    id v39 = v6;
    __int16 v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    long long v14 = [v9 messageWithName:@"HMHomeFetchTriggerNameMessage" destination:v12 payload:v13];

    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    uint64_t v31 = __74__HMHome_Trigger__fetchTriggerNameForTriggerIdentifier_completionHandler___block_invoke_2;
    uint64_t v32 = &unk_1E5945510;
    uint64_t v33 = self;
    id v35 = v7;
    id v15 = v8;
    id v34 = v15;
    [v14 setResponseHandler:&v29];
    uint64_t v16 = objc_msgSend(v15, "messageDispatcher", v29, v30, v31, v32, v33);
    [v16 sendMessage:v14 completionHandler:0];
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v25 = self;
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v27;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@trigger identifier is required.", buf, 0xCu);
    }
    uint64_t v28 = [v8 delegateCaller];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    void v36[2] = __74__HMHome_Trigger__fetchTriggerNameForTriggerIdentifier_completionHandler___block_invoke;
    void v36[3] = &unk_1E59454C0;
    id v37 = v7;
    [v28 invokeBlock:v36];
  }
LABEL_11:
}

void __74__HMHome_Trigger__fetchTriggerNameForTriggerIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (void (**)(id, void, void *))_Block_copy(*(const void **)(a1 + 32));
  if (v2)
  {
    uint64_t v1 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    v2[2](v2, 0, v1);
  }
}

void __74__HMHome_Trigger__fetchTriggerNameForTriggerIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    uint64_t v11 = _Block_copy(*(const void **)(a1 + 48));
    *(_DWORD *)buf = 138544130;
    BOOL v25 = v10;
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    uint64_t v29 = v11;
    __int16 v30 = 2112;
    id v31 = v5;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Fetch trigger name response : %@, completionHandler: %@ error %@", buf, 0x2Au);
  }
  if (v5)
  {
    uint64_t v12 = [*(id *)(a1 + 40) delegateCaller];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __74__HMHome_Trigger__fetchTriggerNameForTriggerIdentifier_completionHandler___block_invoke_2127;
    void v21[3] = &unk_1E59454E8;
    id v23 = *(id *)(a1 + 48);
    id v22 = v5;
    [v12 invokeBlock:v21];

    __int16 v13 = v23;
  }
  else
  {
    __int16 v13 = objc_msgSend(v6, "hmf_stringForKey:", @"kTriggerName");
    long long v14 = [*(id *)(a1 + 40) delegateCaller];
    if (v13)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __74__HMHome_Trigger__fetchTriggerNameForTriggerIdentifier_completionHandler___block_invoke_3;
      v16[3] = &unk_1E59454E8;
      id v15 = &v18;
      id v18 = *(id *)(a1 + 48);
      id v17 = v13;
      [v14 invokeBlock:v16];

      long long v14 = v17;
    }
    else
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __74__HMHome_Trigger__fetchTriggerNameForTriggerIdentifier_completionHandler___block_invoke_2_2128;
      v19[3] = &unk_1E59454C0;
      id v15 = &v20;
      id v20 = *(id *)(a1 + 48);
      [v14 invokeBlock:v19];
    }
  }
}

void __74__HMHome_Trigger__fetchTriggerNameForTriggerIdentifier_completionHandler___block_invoke_2127(uint64_t a1)
{
  id v2 = _Block_copy(*(const void **)(a1 + 40));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(void *, void, void))v2 + 2))(v2, 0, *(void *)(a1 + 32));
    id v2 = v3;
  }
}

void __74__HMHome_Trigger__fetchTriggerNameForTriggerIdentifier_completionHandler___block_invoke_2_2128(uint64_t a1)
{
  id v2 = (void (**)(id, void, void *))_Block_copy(*(const void **)(a1 + 32));
  if (v2)
  {
    uint64_t v1 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2035];
    v2[2](v2, 0, v1);
  }
}

void __74__HMHome_Trigger__fetchTriggerNameForTriggerIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = _Block_copy(*(const void **)(a1 + 40));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(void *, void, void))v2 + 2))(v2, *(void *)(a1 + 32), 0);
    id v2 = v3;
  }
}

- (void)resolveThreadNetworkCredentialsWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMHome *)self context];
  if (!v4)
  {
    uint64_t v14 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(ThreadManagement) resolveThreadNetworkCredentialsWithCompletion:]", @"completion"];
    id v15 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v18;
      __int16 v25 = 2112;
      __int16 v26 = (const char *)v14;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v14 userInfo:0];
    objc_exception_throw(v19);
  }
  id v6 = (void *)v5;
  if (v5)
  {
    id v7 = [(HMHome *)self context];

    if (v7)
    {
      id v8 = [v6 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__HMHome_ThreadManagement__resolveThreadNetworkCredentialsWithCompletion___block_invoke;
      block[3] = &unk_1E5945138;
      void block[4] = self;
      id v22 = v4;
      id v21 = v6;
      dispatch_async(v8, block);
    }
    else
    {
      __int16 v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      (*((void (**)(id, void *, void))v4 + 2))(v4, v13, 0);
    }
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x19F3A64A0]();
    id v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v12;
      __int16 v25 = 2080;
      __int16 v26 = "-[HMHome(ThreadManagement) resolveThreadNetworkCredentialsWithCompletion:]";
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __74__HMHome_ThreadManagement__resolveThreadNetworkCredentialsWithCompletion___block_invoke(id *a1)
{
  id v2 = (void *)MEMORY[0x1E4F654B0];
  id v3 = [a1[4] messageDestination];
  id v4 = [v2 messageWithName:@"HM.rtn" destination:v3 payload:0];

  objc_initWeak(&location, a1[4]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__HMHome_ThreadManagement__resolveThreadNetworkCredentialsWithCompletion___block_invoke_2;
  v6[3] = &unk_1E5944188;
  objc_copyWeak(&v8, &location);
  id v7 = a1[6];
  [v4 setResponseHandler:v6];
  uint64_t v5 = [a1[5] messageDispatcher];
  [v5 sendMessage:v4 completionHandler:0];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __74__HMHome_ThreadManagement__resolveThreadNetworkCredentialsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (v5)
  {
    uint64_t v9 = [WeakRetained context];
    id v10 = [v9 delegateCaller];
    [v10 callCompletion:*(void *)(a1 + 32) error:v5 obj:0];
  }
  else
  {
    uint64_t v11 = objc_msgSend(v6, "hmf_dataForKey:", @"threadNetworkCredentials");
    id v23 = 0;
    uint64_t v12 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:&v23];
    id v13 = v23;
    if (v12)
    {
      uint64_t v14 = [v8 context];
      id v15 = [v14 delegateCaller];
      [v15 callCompletion:*(void *)(a1 + 32) error:0 obj:v12];
    }
    else
    {
      uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
      id v17 = v8;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v19 = v22 = v16;
        *(_DWORD *)buf = 138543618;
        __int16 v25 = v19;
        __int16 v26 = 2112;
        id v27 = v13;
        _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode credentials, error: %@", buf, 0x16u);

        uint64_t v16 = v22;
      }

      uint64_t v14 = [v17 context];
      id v15 = [v14 delegateCaller];
      uint64_t v20 = *(void *)(a1 + 32);
      id v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v15 callCompletion:v20 error:v21 obj:0];
    }
  }
}

- (NSUUID)threadNetworkCredentialsUUID
{
  id v3 = [(HMHome *)self threadNetworkID];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F29128]);
    id v5 = [(HMHome *)self threadNetworkID];
    id v6 = (void *)[v4 initWithUUIDString:v5];
  }
  else
  {
    id v6 = 0;
  }

  return (NSUUID *)v6;
}

- (void)selectPreferredResident:(id)a3 requireAutoUpdate:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HMHome *)self context];
  uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v36 = v14;
    __int16 v37 = 2112;
    id v38 = v8;
    __int16 v39 = 1024;
    BOOL v40 = v6;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Set preferred resident as: %@, requireAutoUpdate: %{BOOL}d", buf, 0x1Cu);
  }
  id v15 = (void *)MEMORY[0x1E4F65480];
  uint64_t v16 = [(HMHome *)v12 messageDestination];
  if (v8)
  {
    v33[0] = @"HMHomePreferredResidentIDSKey";
    id v17 = [v8 IDSIdentifier];
    v33[1] = @"HMHomeRequireAutoUpdateKey";
    v34[0] = v17;
    id v18 = [NSNumber numberWithBool:v6];
    v34[1] = v18;
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
    uint64_t v20 = [v15 messageWithName:@"HM.setPreferredResidentSelection" qualityOfService:25 destination:v16 payload:v19];
  }
  else
  {
    uint64_t v20 = [v15 messageWithName:@"HM.setPreferredResidentSelection" qualityOfService:25 destination:v16 payload:0];
  }

  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  id v27 = __82__HMHome_ResidentSelection__selectPreferredResident_requireAutoUpdate_completion___block_invoke;
  uint64_t v28 = &unk_1E59441B0;
  uint64_t v29 = v12;
  id v30 = v8;
  id v31 = v10;
  id v32 = v9;
  id v21 = v9;
  id v22 = v10;
  id v23 = v8;
  [v20 setResponseHandler:&v25];
  uint64_t v24 = objc_msgSend(v22, "messageDispatcher", v25, v26, v27, v28, v29);
  [v24 sendMessage:v20];
}

void __82__HMHome_ResidentSelection__selectPreferredResident_requireAutoUpdate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v13 = 138543618;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Set preferred resident successful with %@.", (uint8_t *)&v13, 0x16u);
    }
    [*(id *)(a1 + 32) setUserSelectedPreferredResident:*(void *)(a1 + 40)];
  }
  uint64_t v12 = [*(id *)(a1 + 48) delegateCaller];
  [v12 callCompletion:*(void *)(a1 + 56) error:v5];
}

- (void)selectPreferredResident:(id)a3 completion:(id)a4
{
}

- (void)enableRemoteAccess:(BOOL)a3 completionHandler:(id)a4
{
  id v9 = a4;
  if (!v9)
  {
    id v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v8);
  }
  id v5 = [(HMHome *)self context];
  id v6 = [v5 delegateCaller];
  id v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  [v6 callCompletion:v9 error:v7];
}

- (void)queryRemoteAccessWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v9);
  }
  id v5 = v4;
  id v6 = [(HMHome *)self context];
  id v7 = [v6 delegateCaller];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__HMHome_RemoteAccess__queryRemoteAccessWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E59454C0;
  id v11 = v5;
  id v8 = v5;
  [v7 invokeBlock:v10];
}

void __63__HMHome_RemoteAccess__queryRemoteAccessWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)setAccessoryNetworkProtectionChangeSupportMinHomeKitVersion:(id)a3 completionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(NetworkRouter) setAccessoryNetworkProtectionChangeSupportMinHomeKitVersion:completionHandler:]", @"completion"];
    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v20;
      __int16 v29 = 2112;
      id v30 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __103__HMHome_NetworkRouter__setAccessoryNetworkProtectionChangeSupportMinHomeKitVersion_completionHandler___block_invoke;
    block[3] = &unk_1E5944360;
    id v23 = v6;
    uint64_t v24 = self;
    id v26 = v7;
    id v25 = v9;
    dispatch_async(v10, block);

    id v11 = v23;
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
    int v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v15;
      __int16 v29 = 2080;
      id v30 = "-[HMHome(NetworkRouter) setAccessoryNetworkProtectionChangeSupportMinHomeKitVersion:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

void __103__HMHome_NetworkRouter__setAccessoryNetworkProtectionChangeSupportMinHomeKitVersion_completionHandler___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v16 = @"kHomedVersionKey";
    v17[0] = v2;
    id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v4 = (void *)MEMORY[0x1E4F654B0];
    id v5 = [*(id *)(a1 + 40) messageDestination];
    id v6 = [v4 messageWithName:@"HMHomeInternalSetMinHomeKitVersionForAccessoryNetworkProtectionChangeRequest" destination:v5 payload:v3];

    objc_initWeak(&location, *(id *)(a1 + 40));
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __103__HMHome_NetworkRouter__setAccessoryNetworkProtectionChangeSupportMinHomeKitVersion_completionHandler___block_invoke_2;
    v12[3] = &unk_1E5944188;
    objc_copyWeak(&v14, &location);
    id v13 = *(id *)(a1 + 56);
    [v6 setResponseHandler:v12];
    id v7 = [*(id *)(a1 + 48) messageDispatcher];
    [v7 sendMessage:v6 completionHandler:0];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    id v11 = [*(id *)(a1 + 40) context];
    id v8 = [v11 delegateCaller];
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v8 callCompletion:v9 error:v10];
  }
}

void __103__HMHome_NetworkRouter__setAccessoryNetworkProtectionChangeSupportMinHomeKitVersion_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained context];
  id v6 = [v5 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 32) error:v4];
}

- (void)setNetworkRouterSupportMinimumHomeKitVersion:(id)a3 completionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(NetworkRouter) setNetworkRouterSupportMinimumHomeKitVersion:completionHandler:]", @"completion"];
    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v20;
      __int16 v29 = 2112;
      id v30 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__HMHome_NetworkRouter__setNetworkRouterSupportMinimumHomeKitVersion_completionHandler___block_invoke;
    block[3] = &unk_1E5944360;
    id v23 = v6;
    uint64_t v24 = self;
    id v26 = v7;
    id v25 = v9;
    dispatch_async(v10, block);

    id v11 = v23;
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v15;
      __int16 v29 = 2080;
      id v30 = "-[HMHome(NetworkRouter) setNetworkRouterSupportMinimumHomeKitVersion:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

void __88__HMHome_NetworkRouter__setNetworkRouterSupportMinimumHomeKitVersion_completionHandler___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v16 = @"kHomedVersionKey";
    v17[0] = v2;
    id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v4 = (void *)MEMORY[0x1E4F654B0];
    id v5 = [*(id *)(a1 + 40) messageDestination];
    id v6 = [v4 messageWithName:@"HM.nrsv" destination:v5 payload:v3];

    objc_initWeak(&location, *(id *)(a1 + 40));
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __88__HMHome_NetworkRouter__setNetworkRouterSupportMinimumHomeKitVersion_completionHandler___block_invoke_2;
    v12[3] = &unk_1E5944188;
    objc_copyWeak(&v14, &location);
    id v13 = *(id *)(a1 + 56);
    [v6 setResponseHandler:v12];
    id v7 = [*(id *)(a1 + 48) messageDispatcher];
    [v7 sendMessage:v6 completionHandler:0];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    id v11 = [*(id *)(a1 + 40) context];
    id v8 = [v11 delegateCaller];
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v8 callCompletion:v9 error:v10];
  }
}

void __88__HMHome_NetworkRouter__setNetworkRouterSupportMinimumHomeKitVersion_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained context];
  id v6 = [v5 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 32) error:v4];
}

- (void)_didUpdateNetworkRouterSupport
{
  id v3 = [(HMHome *)self delegate];
  if ([v3 conformsToProtocol:&unk_1EEF70488]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (objc_opt_respondsToSelector())
  {
    id v6 = [(HMHome *)self context];
    id v7 = [v6 delegateCaller];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__HMHome_NetworkRouter___didUpdateNetworkRouterSupport__block_invoke;
    v8[3] = &unk_1E5945628;
    id v9 = v5;
    id v10 = self;
    [v7 invokeBlock:v8];
  }
}

uint64_t __55__HMHome_NetworkRouter___didUpdateNetworkRouterSupport__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeDidUpdateNetworkRouterSupport:*(void *)(a1 + 40)];
}

- (void)_handleHomeNetworkRouterSupportUpdated:(id)a3
{
  id v4 = a3;
  id v5 = [v4 numberForKey:@"networkRouterSupportDisableReason"];
  id v6 = v5;
  if (v5)
  {
    unint64_t v7 = [v5 unsignedIntegerValue];
    if ([(HMHome *)self networkRouterSupportDisableReason] != v7)
    {
      [(HMHome *)self setNetworkRouterSupportDisableReason:v7];
      uint64_t v8 = ((uint64_t)(v7 << 60) >> 63) & 3;
      if ((v7 & 7) != 0) {
        uint64_t v8 = 7;
      }
      uint64_t v9 = v8 | (v7 >> 3) & 2;
      if ([(HMHome *)self networkRouterSupport] != v9)
      {
        [(HMHome *)self setNetworkRouterSupport:v9];
        [(HMHome *)self _didUpdateNetworkRouterSupport];
      }
    }
  }
  char v11 = 0;
  uint64_t v10 = [v4 BOOLForKey:@"addNetworkRouterEnabled" keyPresent:&v11];
  if (v11 && [(HMHome *)self _setSupportedFeature:1 enabled:v10]) {
    [(HMHome *)self _notifyUpdatedSupportedFeatures];
  }
}

- (void)_didUpdateAccessoryNetworkProtectionGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self delegate];
  if ([v5 conformsToProtocol:&unk_1EEF70488]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [(HMHome *)self context];
    uint64_t v9 = [v8 delegateCaller];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__HMHome_NetworkRouter___didUpdateAccessoryNetworkProtectionGroup___block_invoke;
    v10[3] = &unk_1E5945650;
    void v10[4] = self;
    id v11 = v7;
    id v12 = v4;
    [v9 invokeBlock:v10];
  }
}

uint64_t __67__HMHome_NetworkRouter___didUpdateAccessoryNetworkProtectionGroup___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@network.router: Telling delegate didUpdateAccessoryNetworkProtectionGroup. Delegate: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) home:*(void *)(a1 + 32) didUpdateAccessoryNetworkProtectionGroup:*(void *)(a1 + 48)];
}

- (void)_didRemoveAccessoryNetworkProtectionGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self delegate];
  if ([v5 conformsToProtocol:&unk_1EEF70488]) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (objc_opt_respondsToSelector())
  {
    int v8 = [(HMHome *)self context];
    uint64_t v9 = [v8 delegateCaller];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__HMHome_NetworkRouter___didRemoveAccessoryNetworkProtectionGroup___block_invoke;
    v10[3] = &unk_1E5945650;
    void v10[4] = self;
    id v11 = v7;
    id v12 = v4;
    [v9 invokeBlock:v10];
  }
}

uint64_t __67__HMHome_NetworkRouter___didRemoveAccessoryNetworkProtectionGroup___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@network.router: Telling delegate didRemoveAccessoryNetworkProtectionGroup. Delegate: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) home:*(void *)(a1 + 32) didRemoveAccessoryNetworkProtectionGroup:*(void *)(a1 + 48)];
}

- (void)_didAddAccessoryNetworkProtectionGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self delegate];
  if ([v5 conformsToProtocol:&unk_1EEF70488]) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (objc_opt_respondsToSelector())
  {
    int v8 = [(HMHome *)self context];
    uint64_t v9 = [v8 delegateCaller];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__HMHome_NetworkRouter___didAddAccessoryNetworkProtectionGroup___block_invoke;
    v10[3] = &unk_1E5945650;
    void v10[4] = self;
    id v11 = v7;
    id v12 = v4;
    [v9 invokeBlock:v10];
  }
}

uint64_t __64__HMHome_NetworkRouter___didAddAccessoryNetworkProtectionGroup___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@network.router: Telling delegate didAddAccessoryNetworkProtectionGroup. Delegate: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) home:*(void *)(a1 + 32) didAddAccessoryNetworkProtectionGroup:*(void *)(a1 + 48)];
}

- (void)_handleAccessoryNetworkProtectionGroupRemovedNotification:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v22 = 138543362;
    id v23 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@network.router: Received AccessoryNetworkProtectionGroupAddedNotification", (uint8_t *)&v22, 0xCu);
  }
  uint64_t v9 = [v4 uuidForKey:@"HMAccessoryNetworkProtectionGroupUUIDMessageKey"];
  if (v9)
  {
    __int16 v10 = [(HMHome *)v6 accessoryProtectionGroups];
    uint64_t v11 = objc_msgSend(v10, "hmf_firstObjectWithUUID:", v9);

    if (v11)
    {
      uint64_t v12 = [(HMHome *)v6 currentAccessoryProtectionGroups];
      [v12 removeObject:v11];

      [(HMHome *)v6 _didRemoveAccessoryNetworkProtectionGroup:v11];
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
      id v18 = v6;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        id v21 = [v9 UUIDString];
        int v22 = 138543618;
        id v23 = v20;
        __int16 v24 = 2112;
        id v25 = v21;
        _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@No matching accessory network protection group with uuid %@", (uint8_t *)&v22, 0x16u);
      }
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = v6;
    __int16 v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v22 = 138543618;
      id v23 = v16;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Message %@ missing uuid", (uint8_t *)&v22, 0x16u);
    }
  }
}

- (void)_handleAccessoryNetworkProtectionGroupAddedNotification:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v23 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@network.router: Received AccessoryNetworkProtectionGroupAddedNotification", buf, 0xCu);
  }
  uint64_t v9 = [v4 dataForKey:@"HMAccessoryNetworkProtectionGroupMessageKey"];
  if (v9)
  {
    id v21 = 0;
    __int16 v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v21];
    id v11 = v21;
    if (v10)
    {
      [v10 _configureWithHome:v6];
      uint64_t v12 = [(HMHome *)v6 currentAccessoryProtectionGroups];
      [v12 addObject:v10];

      [(HMHome *)v6 _didAddAccessoryNetworkProtectionGroup:v10];
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
      id v18 = v6;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v23 = v20;
        __int16 v24 = 2112;
        id v25 = v11;
        _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode added accessory protection group with error %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = v6;
    __int16 v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v16;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Message %@ missing accessory protection group encoded data", buf, 0x16u);
    }
  }
}

- (void)updateAccessoryNetworkProtectionGroup:(id)a3 protectionMode:(int64_t)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = [(HMHome *)self context];
  if (!v9)
  {
    uint64_t v18 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(NetworkRouter) updateAccessoryNetworkProtectionGroup:protectionMode:completion:]", @"completion"];
    id v19 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v22;
      __int16 v31 = 2112;
      id v32 = (const char *)v18;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v18 userInfo:0];
    objc_exception_throw(v23);
  }
  id v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__HMHome_NetworkRouter__updateAccessoryNetworkProtectionGroup_protectionMode_completion___block_invoke;
    block[3] = &unk_1E59417A0;
    void block[4] = self;
    id v25 = v8;
    int64_t v28 = a4;
    id v27 = v9;
    id v26 = v11;
    dispatch_async(v12, block);
  }
  else
  {
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = self;
    __int16 v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v16;
      __int16 v31 = 2080;
      id v32 = "-[HMHome(NetworkRouter) updateAccessoryNetworkProtectionGroup:protectionMode:completion:]";
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v9 + 2))(v9, v17);
  }
}

void __89__HMHome_NetworkRouter__updateAccessoryNetworkProtectionGroup_protectionMode_completion___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 138543874;
    int64_t v28 = v5;
    __int16 v29 = 2112;
    uint64_t v30 = v6;
    __int16 v31 = 2048;
    uint64_t v32 = v7;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@network.router: Updating accessory network protection group: %@, protectionMode: %ld", buf, 0x20u);
  }
  v25[0] = @"HMAccessoryNetworkProtectionGroupUUIDMessageKey";
  id v8 = [*(id *)(a1 + 40) uuid];
  id v9 = [v8 UUIDString];
  v25[1] = @"HMAccessoryNetworkProtectionGroupProtectionModeMessageKey";
  v26[0] = v9;
  __int16 v10 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
  v26[1] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

  uint64_t v12 = (void *)MEMORY[0x1E4F654B0];
  id v13 = [*(id *)(a1 + 32) messageDestination];
  id v14 = [v12 messageWithName:@"HMAccessoryNetworkProtectionGroupProtectionModeUpdateRequest" destination:v13 payload:v11];

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __89__HMHome_NetworkRouter__updateAccessoryNetworkProtectionGroup_protectionMode_completion___block_invoke_2061;
  id v21 = &unk_1E59428F8;
  objc_copyWeak(v24, (id *)buf);
  id v15 = *(id *)(a1 + 40);
  uint64_t v16 = *(void **)(a1 + 64);
  id v22 = v15;
  v24[1] = v16;
  id v23 = *(id *)(a1 + 56);
  [v14 setResponseHandler:&v18];
  uint64_t v17 = objc_msgSend(*(id *)(a1 + 48), "messageDispatcher", v18, v19, v20, v21);
  [v17 sendMessage:v14 completionHandler:0];

  objc_destroyWeak(v24);
  objc_destroyWeak((id *)buf);
}

void __89__HMHome_NetworkRouter__updateAccessoryNetworkProtectionGroup_protectionMode_completion___block_invoke_2061(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  __int16 v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 56);
    int v16 = 138544130;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    __int16 v20 = 2048;
    uint64_t v21 = v13;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@network.router: Updated accessory network protection group: %@, protectionMode: %ld with error: %@", (uint8_t *)&v16, 0x2Au);
  }
  if (!v5) {
    [*(id *)(a1 + 32) setTargetProtectionMode:*(void *)(a1 + 56)];
  }
  id v14 = [v9 context];
  id v15 = [v14 delegateCaller];
  [v15 callCompletion:*(void *)(a1 + 40) error:v5];
}

- (void)updateNetworkProtection:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(HMHome *)self context];
  if (!v6)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(NetworkRouter) updateNetworkProtection:completionHandler:]", @"completion"];
    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v29 = v20;
      __int16 v30 = 2112;
      __int16 v31 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v8 = (void *)v7;
  if (v7)
  {
    id v26 = @"kHomeNetworkProtectionModeKey";
    id v9 = [NSNumber numberWithInteger:a3];
    id v27 = v9;
    __int16 v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];

    id v11 = [(HMHome *)self uuid];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __67__HMHome_NetworkRouter__updateNetworkProtection_completionHandler___block_invoke;
    v22[3] = &unk_1E5945510;
    id v23 = v8;
    uint64_t v24 = self;
    id v25 = v6;
    -[_HMContext sendMessage:target:payload:responseHandler:](v23, @"HM.np", v11, v10, v22);
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v29 = v15;
      __int16 v30 = 2080;
      __int16 v31 = "-[HMHome(NetworkRouter) updateNetworkProtection:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    __int16 v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v10);
  }
}

void __67__HMHome_NetworkRouter__updateNetworkProtection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if (v11)
  {
    id v5 = [*(id *)(a1 + 32) delegateCaller];
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = v11;
  }
  else
  {
    id v9 = objc_msgSend(a3, "hmf_numberForKey:", @"kHomeNetworkProtectionModeKey");
    uint64_t v10 = [v9 unsignedIntegerValue];

    [*(id *)(a1 + 40) setProtectionMode:v10];
    id v5 = [*(id *)(a1 + 32) delegateCaller];
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = 0;
  }
  [v5 callCompletion:v7 error:v8];
}

- (void)performMediaGroupReadinessCheckForAccessory:(id)a3 timeout:(double)a4 setupSessionIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(HMHome *)self context];
  if (v13)
  {
    if (!v12)
    {
      uint64_t v47 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(MediaGroupReadinessCheck) performMediaGroupReadinessCheckForAccessory:timeout:setupSessionIdentifier:completion:]", @"completion"];
      uint64_t v48 = (void *)MEMORY[0x19F3A64A0]();
      long long v49 = self;
      long long v50 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        uint64_t v51 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v63 = v51;
        __int16 v64 = 2112;
        long long v65 = (const char *)v47;
        _os_log_impl(&dword_19D1A8000, v50, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
      }
      id v52 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v47 userInfo:0];
      objc_exception_throw(v52);
    }
    id v14 = [v10 uuid];

    if (v14)
    {
      id v15 = [(HMHome *)self homeManager];
      char v16 = [v15 isDaemonRunningWithROARFramework];

      if (v16)
      {
        uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
        __int16 v18 = [NSNumber numberWithDouble:a4];
        [v17 setObject:v18 forKeyedSubscript:@"HMHomePerformMediaGroupReadinessCheckTimeoutKey"];

        uint64_t v19 = [v10 uuid];
        [v17 setObject:v19 forKeyedSubscript:@"kAccessoryUUID"];

        if (v11) {
          uint64_t v20 = [v17 setObject:v11 forKeyedSubscript:@"HMHomePerformMediaGroupReadinessCheckSetupSessionIdentifierKey"];
        }
        id v21 = (void *)MEMORY[0x19F3A64A0](v20);
        __int16 v22 = self;
        id v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          uint64_t v24 = HMFGetLogIdentifier();
          id v25 = [NSNumber numberWithDouble:a4];
          *(_DWORD *)buf = 138543874;
          long long v63 = v24;
          __int16 v64 = 2112;
          long long v65 = (const char *)v10;
          __int16 v66 = 2112;
          long long v67 = v25;
          _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_INFO, "%{public}@Checking media group readiness for accessory %@ with timeout %@", buf, 0x20u);
        }
        id v26 = (void *)MEMORY[0x1E4F654B0];
        id v27 = objc_alloc(MEMORY[0x1E4F65488]);
        int64_t v28 = [(HMHome *)v22 uuid];
        __int16 v29 = (void *)[v27 initWithTarget:v28];
        __int16 v30 = [v26 messageWithName:@"HMHomePerformMediaGroupReadinessCheckMessage" destination:v29 payload:v17];

        objc_initWeak((id *)buf, v22);
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __122__HMHome_MediaGroupReadinessCheck__performMediaGroupReadinessCheckForAccessory_timeout_setupSessionIdentifier_completion___block_invoke_2101;
        v53[3] = &unk_1E5944978;
        objc_copyWeak(&v57, (id *)buf);
        id v54 = v10;
        id v31 = v13;
        id v55 = v31;
        id v56 = v12;
        [v30 setResponseHandler:v53];
        uint64_t v32 = [v31 messageDispatcher];
        [v32 sendMessage:v30 completionHandler:0];

        objc_destroyWeak(&v57);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        __int16 v42 = (void *)MEMORY[0x19F3A64A0]();
        id v43 = self;
        uint64_t v44 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          uint64_t v45 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          long long v63 = v45;
          _os_log_impl(&dword_19D1A8000, v44, OS_LOG_TYPE_INFO, "%{public}@Always returns YES in HH1", buf, 0xCu);
        }
        uint64_t v46 = [v13 delegateCaller];
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __122__HMHome_MediaGroupReadinessCheck__performMediaGroupReadinessCheckForAccessory_timeout_setupSessionIdentifier_completion___block_invoke_2100;
        v58[3] = &unk_1E59454C0;
        id v59 = v12;
        [v46 invokeBlock:v58];
      }
    }
    else
    {
      __int16 v37 = (void *)MEMORY[0x19F3A64A0]();
      id v38 = self;
      __int16 v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        BOOL v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v63 = v40;
        _os_log_impl(&dword_19D1A8000, v39, OS_LOG_TYPE_INFO, "%{public}@Accessory is invalid", buf, 0xCu);
      }
      uint64_t v41 = [v13 delegateCaller];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __122__HMHome_MediaGroupReadinessCheck__performMediaGroupReadinessCheckForAccessory_timeout_setupSessionIdentifier_completion___block_invoke;
      v60[3] = &unk_1E59454C0;
      id v61 = v12;
      [v41 invokeBlock:v60];
    }
  }
  else
  {
    uint64_t v33 = (void *)MEMORY[0x19F3A64A0]();
    id v34 = self;
    id v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v63 = v36;
      __int16 v64 = 2080;
      long long v65 = "-[HMHome(MediaGroupReadinessCheck) performMediaGroupReadinessCheckForAccessory:timeout:setupSessionIdentifier:completion:]";
      _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __122__HMHome_MediaGroupReadinessCheck__performMediaGroupReadinessCheckForAccessory_timeout_setupSessionIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __122__HMHome_MediaGroupReadinessCheck__performMediaGroupReadinessCheckForAccessory_timeout_setupSessionIdentifier_completion___block_invoke_2100(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __122__HMHome_MediaGroupReadinessCheck__performMediaGroupReadinessCheckForAccessory_timeout_setupSessionIdentifier_completion___block_invoke_2101(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v5)
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      id v26 = v11;
      __int16 v27 = 2112;
      uint64_t v28 = v12;
      __int16 v29 = 2112;
      id v30 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Media group readiness check failed for %@ with error: %@", buf, 0x20u);
    }
    uint64_t v13 = [*(id *)(a1 + 40) delegateCaller];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __122__HMHome_MediaGroupReadinessCheck__performMediaGroupReadinessCheckForAccessory_timeout_setupSessionIdentifier_completion___block_invoke_2102;
    v22[3] = &unk_1E59454E8;
    id v24 = *(id *)(a1 + 48);
    id v23 = v5;
    [v13 invokeBlock:v22];

    id v14 = v24;
  }
  else
  {
    id v15 = [v6 objectForKeyedSubscript:@"HMHomePerformMediaGroupReadinessCheckResponseKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v16 = v15;
    }
    else {
      char v16 = 0;
    }
    id v17 = v16;

    __int16 v18 = [*(id *)(a1 + 40) delegateCaller];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __122__HMHome_MediaGroupReadinessCheck__performMediaGroupReadinessCheckForAccessory_timeout_setupSessionIdentifier_completion___block_invoke_2;
    v19[3] = &unk_1E5945138;
    void v19[4] = WeakRetained;
    id v20 = v17;
    id v21 = *(id *)(a1 + 48);
    id v14 = v17;
    [v18 invokeBlock:v19];
  }
}

uint64_t __122__HMHome_MediaGroupReadinessCheck__performMediaGroupReadinessCheckForAccessory_timeout_setupSessionIdentifier_completion___block_invoke_2102(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __122__HMHome_MediaGroupReadinessCheck__performMediaGroupReadinessCheckForAccessory_timeout_setupSessionIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Media group readiness fetched:%@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [*(id *)(a1 + 40) BOOLValue], 0);
}

- (void)fetchWiFiInfosWithTimeout:(double)a3 completion:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(HMHome *)self context];
  if (v7)
  {
    if (!v6)
    {
      uint64_t v28 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HomeWiFiInfoFetch) fetchWiFiInfosWithTimeout:completion:]", @"completionHandler"];
      __int16 v29 = (void *)MEMORY[0x19F3A64A0]();
      id v30 = self;
      uint64_t v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = HMFGetLogIdentifier();
        *(_DWORD *)id location = 138543618;
        *(void *)&location[4] = v32;
        __int16 v43 = 2112;
        uint64_t v44 = (const char *)v28;
        _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);
      }
      id v33 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v28 userInfo:0];
      objc_exception_throw(v33);
    }
    int v8 = [(HMHome *)self homeManager];
    char v9 = [v8 isDaemonRunningWithROARFramework];

    if (v9)
    {
      __int16 v10 = (void *)MEMORY[0x1E4F654B0];
      id v11 = objc_alloc(MEMORY[0x1E4F65488]);
      uint64_t v12 = [(HMHome *)self uuid];
      uint64_t v13 = (void *)[v11 initWithTarget:v12];
      BOOL v40 = @"HMHomeFetchWiFiInfoTimeoutKey";
      id v14 = [NSNumber numberWithDouble:a3];
      uint64_t v41 = v14;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      char v16 = [v10 messageWithName:@"HMHomeFetchWiFiInfoMessage" destination:v13 payload:v15];

      objc_initWeak((id *)location, self);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      void v34[2] = __66__HMHome_HomeWiFiInfoFetch__fetchWiFiInfosWithTimeout_completion___block_invoke_2;
      v34[3] = &unk_1E59441D8;
      objc_copyWeak(&v37, (id *)location);
      id v17 = v7;
      id v35 = v17;
      id v36 = v6;
      [v16 setResponseHandler:v34];
      __int16 v18 = [v17 messageDispatcher];
      [v18 sendMessage:v16 completionHandler:0];

      objc_destroyWeak(&v37);
      objc_destroyWeak((id *)location);
    }
    else
    {
      id v23 = (void *)MEMORY[0x19F3A64A0]();
      id v24 = self;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v26 = HMFGetLogIdentifier();
        *(_DWORD *)id location = 138543362;
        *(void *)&location[4] = v26;
        _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@Fetch home WiFi info is only supported in HH2", location, 0xCu);
      }
      __int16 v27 = [v7 delegateCaller];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      void v38[2] = __66__HMHome_HomeWiFiInfoFetch__fetchWiFiInfosWithTimeout_completion___block_invoke;
      v38[3] = &unk_1E59454C0;
      id v39 = v6;
      [v27 invokeBlock:v38];
    }
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x19F3A64A0]();
    id v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = HMFGetLogIdentifier();
      *(_DWORD *)id location = 138543618;
      *(void *)&location[4] = v22;
      __int16 v43 = 2080;
      uint64_t v44 = "-[HMHome(HomeWiFiInfoFetch) fetchWiFiInfosWithTimeout:completion:]";
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);
    }
  }
}

void __66__HMHome_HomeWiFiInfoFetch__fetchWiFiInfosWithTimeout_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4F1C978] array];
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);
}

void __66__HMHome_HomeWiFiInfoFetch__fetchWiFiInfosWithTimeout_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (v5)
  {
    int v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = WeakRetained;
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v11;
      __int16 v32 = 2112;
      id v33 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Fetching home WiFi info returned an error: %@", buf, 0x16u);
    }
    uint64_t v12 = [a1[4] delegateCaller];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __66__HMHome_HomeWiFiInfoFetch__fetchWiFiInfosWithTimeout_completion___block_invoke_2091;
    v27[3] = &unk_1E59454E8;
    id v29 = a1[5];
    id v28 = v5;
    [v12 invokeBlock:v27];

    id v13 = v29;
  }
  else
  {
    id v14 = [v6 objectForKeyedSubscript:@"HMHomeFetchWiFiInfoSSIDResponseKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v13 = v15;

    char v16 = [v6 objectForKeyedSubscript:@"HMHomeFetchWiFiInfoRequiresPasswordResponseKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }
    id v18 = v17;

    if (v13) {
      uint64_t v19 = -[HMHomeWiFiInfo initWithSSID:requiresPassword:]([HMHomeWiFiInfo alloc], "initWithSSID:requiresPassword:", v13, [v18 BOOLValue]);
    }
    else {
      uint64_t v19 = 0;
    }
    id v20 = [MEMORY[0x1E4F1CA48] array];
    id v21 = v20;
    if (v19) {
      [v20 addObject:v19];
    }
    __int16 v22 = [a1[4] delegateCaller];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    id v24[2] = __66__HMHome_HomeWiFiInfoFetch__fetchWiFiInfosWithTimeout_completion___block_invoke_2_2093;
    v24[3] = &unk_1E5945138;
    void v24[4] = WeakRetained;
    id v25 = v21;
    id v26 = a1[5];
    id v23 = v21;
    [v22 invokeBlock:v24];
  }
}

void __66__HMHome_HomeWiFiInfoFetch__fetchWiFiInfosWithTimeout_completion___block_invoke_2091(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F1C978] array];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 32));
}

uint64_t __66__HMHome_HomeWiFiInfoFetch__fetchWiFiInfosWithTimeout_completion___block_invoke_2_2093(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Fetched home WiFi info: %@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)retrieveHomeKitLocationForFeedbackWithCompletionHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMHome *)self context];
  if (v5)
  {
    if (!v4) {
      _HMFPreconditionFailure();
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F654B0];
    id v7 = objc_alloc(MEMORY[0x1E4F65488]);
    int v8 = [(HMHome *)self uuid];
    id v9 = (void *)[v7 initWithTarget:v8];
    __int16 v10 = [v6 messageWithName:@"HM.retrieveHomeLocationForFeedback" destination:v9 payload:0];

    objc_initWeak((id *)location, self);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __88__HMHome_HomeLocationFeedback__retrieveHomeKitLocationForFeedbackWithCompletionHandler___block_invoke;
    v17[3] = &unk_1E59441D8;
    objc_copyWeak(&v20, (id *)location);
    id v11 = v5;
    id v18 = v11;
    id v19 = v4;
    [v10 setResponseHandler:v17];
    uint64_t v12 = [v11 messageDispatcher];
    [v12 sendMessage:v10 completionHandler:0];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      char v16 = HMFGetLogIdentifier();
      *(_DWORD *)id location = 138543618;
      *(void *)&location[4] = v16;
      __int16 v22 = 2080;
      id v23 = "-[HMHome(HomeLocationFeedback) retrieveHomeKitLocationForFeedbackWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);
    }
  }
}

void __88__HMHome_HomeLocationFeedback__retrieveHomeKitLocationForFeedbackWithCompletionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (v5)
  {
    int v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = WeakRetained;
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v22 = v11;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Got error while retrieving the location for feedback: %@", buf, 0x16u);
    }
    uint64_t v12 = [a1[4] delegateCaller];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __88__HMHome_HomeLocationFeedback__retrieveHomeKitLocationForFeedbackWithCompletionHandler___block_invoke_2097;
    v19[3] = &unk_1E59454C0;
    id v20 = a1[5];
    [v12 invokeBlock:v19];

    id v13 = v20;
  }
  else
  {
    id v14 = objc_msgSend(v6, "hmf_dateForKey:", @"HM.homeLocationUpdateTimestamp");
    id v15 = [a1[4] delegateCaller];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __88__HMHome_HomeLocationFeedback__retrieveHomeKitLocationForFeedbackWithCompletionHandler___block_invoke_2;
    v16[3] = &unk_1E5945138;
    void v16[4] = WeakRetained;
    id v17 = v14;
    id v18 = a1[5];
    id v13 = v14;
    [v15 invokeBlock:v16];
  }
}

uint64_t __88__HMHome_HomeLocationFeedback__retrieveHomeKitLocationForFeedbackWithCompletionHandler___block_invoke_2097(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __88__HMHome_HomeLocationFeedback__retrieveHomeKitLocationForFeedbackWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@lastUpdated:[%@]", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_removeZone:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMHome *)self context];
  id v9 = v8;
  if (v8)
  {
    if (v6)
    {
      __int16 v10 = [(HMHome *)self currentZones];
      char v11 = [v10 containsObject:v6];

      if (v11)
      {
        uint64_t v12 = [v6 uuid];
        id v13 = [(HMHome *)self uuid];
        id v29 = @"kZoneUUID";
        id v14 = [v12 UUIDString];
        id v30 = v14;
        id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        id v24[2] = __48__HMHome_HMZone___removeZone_completionHandler___block_invoke;
        v24[3] = &unk_1E59441B0;
        id v25 = v9;
        id v27 = v12;
        id v28 = v7;
        id v26 = self;
        id v16 = v12;
        -[_HMContext sendMessage:target:payload:responseHandler:](v25, @"kRemoveZoneRequestKey", v13, v15, v24);

LABEL_12:
        goto LABEL_13;
      }
      id v16 = [v9 delegateCaller];
      id v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = 2;
    }
    else
    {
      id v16 = [v8 delegateCaller];
      id v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = 20;
    }
    __int16 v23 = [v21 hmErrorWithCode:v22];
    [v16 callCompletion:v7 error:v23];

    goto LABEL_12;
  }
  id v17 = (void *)MEMORY[0x19F3A64A0]();
  id v18 = self;
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    id v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v32 = v20;
    __int16 v33 = 2080;
    uint64_t v34 = "-[HMHome(HMZone) _removeZone:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v7)
  {
    id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, id))v7 + 2))(v7, v16);
    goto LABEL_12;
  }
LABEL_13:
}

void __48__HMHome_HMZone___removeZone_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    id v3 = [*(id *)(a1 + 32) delegateCaller];
    [v3 callCompletion:*(void *)(a1 + 56) error:v6];
  }
  else
  {
    id v3 = [*(id *)(a1 + 40) zoneWithUUID:*(void *)(a1 + 48)];
    if (v3)
    {
      id v4 = [*(id *)(a1 + 40) currentZones];
      [v4 removeObject:v3];

      [v3 _unconfigure];
    }
    id v5 = [*(id *)(a1 + 32) delegateCaller];
    [v5 callCompletion:*(void *)(a1 + 56) error:0];
  }
}

- (void)removeZone:(HMZone *)zone completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = zone;
  id v7 = completion;
  int v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMZone) removeZone:completionHandler:]", @"completion"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v20;
      __int16 v27 = 2112;
      id v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    __int16 v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__HMHome_HMZone__removeZone_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    void block[4] = self;
    __int16 v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    char v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v14;
      __int16 v27 = 2080;
      id v28 = "-[HMHome(HMZone) removeZone:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __47__HMHome_HMZone__removeZone_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeZone:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_addZoneWithName:(id)a3 completionHandler:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMHome *)self context];
  id v9 = v8;
  if (v8)
  {
    if (v6)
    {
      unint64_t v10 = [v6 length];
      if (HMMaxLengthForNaming__hmf_once_t7 != -1) {
        dispatch_once(&HMMaxLengthForNaming__hmf_once_t7, &__block_literal_global_55_24575);
      }
      if (v10 > HMMaxLengthForNaming__hmf_once_v8)
      {
        char v11 = (void *)MEMORY[0x19F3A64A0]();
        uint64_t v12 = self;
        id v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          id v14 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v34 = v14;
          _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Zone name is longer than the pre-defined max length", buf, 0xCu);
        }
        id v15 = [v9 delegateCaller];
        uint64_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:46];
        goto LABEL_17;
      }
      __int16 v23 = [(HMHome *)self zoneWithName:v6];

      if (!v23)
      {
        id v25 = [(HMHome *)self uuid];
        uint64_t v31 = @"kZoneName";
        id v32 = v6;
        id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __53__HMHome_HMZone___addZoneWithName_completionHandler___block_invoke;
        v27[3] = &unk_1E5945510;
        id v28 = v9;
        uint64_t v29 = self;
        id v30 = v7;
        -[_HMContext sendMessage:target:payload:responseHandler:](v28, @"kAddZoneRequestKey", v25, v26, v27);

        goto LABEL_19;
      }
      id v15 = [v9 delegateCaller];
      id v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = 13;
    }
    else
    {
      id v15 = [v8 delegateCaller];
      id v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = 20;
    }
    uint64_t v16 = [v21 errorWithDomain:@"HMErrorDomain" code:v22 userInfo:0];
LABEL_17:
    id v24 = (void *)v16;
    [v15 callCompletion:v7 zone:0 error:v16];

    goto LABEL_18;
  }
  id v17 = (void *)MEMORY[0x19F3A64A0]();
  id v18 = self;
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    id v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v34 = v20;
    __int16 v35 = 2080;
    id v36 = "-[HMHome(HMZone) _addZoneWithName:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v7)
  {
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v15);
LABEL_18:
  }
LABEL_19:
}

void __53__HMHome_HMZone___addZoneWithName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (v12)
  {
    id v6 = [*(id *)(a1 + 32) delegateCaller];
    [v6 callCompletion:*(void *)(a1 + 48) zone:0 error:v12];
  }
  else
  {
    id v6 = objc_msgSend(v5, "hmf_UUIDForKey:", @"kZoneUUID");
    id v7 = objc_msgSend(v5, "hmf_stringForKey:", @"kZoneName");
    int v8 = [[HMZone alloc] initWithName:v7 uuid:v6];
    id v9 = [*(id *)(a1 + 40) context];
    [(HMZone *)v8 __configureWithContext:v9 home:*(void *)(a1 + 40)];

    unint64_t v10 = [*(id *)(a1 + 40) currentZones];
    [v10 addObject:v8];

    char v11 = [*(id *)(a1 + 32) delegateCaller];
    [v11 callCompletion:*(void *)(a1 + 48) zone:v8 error:0];
  }
}

- (void)addZoneWithName:(NSString *)zoneName completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = zoneName;
  id v7 = completion;
  int v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMZone) addZoneWithName:completionHandler:]", @"completion"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v20;
      __int16 v27 = 2112;
      id v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    unint64_t v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__HMHome_HMZone__addZoneWithName_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    void block[4] = self;
    __int16 v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    char v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v14;
      __int16 v27 = 2080;
      id v28 = "-[HMHome(HMZone) addZoneWithName:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void, void *))v7 + 2))(v7, 0, v15);
  }
}

uint64_t __52__HMHome_HMZone__addZoneWithName_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addZoneWithName:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)inviteUsers:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
        id v15 = [HMUserInviteInformation alloc];
        uint64_t v16 = -[HMUserInviteInformation initWithUser:administrator:remoteAccess:](v15, "initWithUser:administrator:remoteAccess:", v14, 0, 1, (void)v17);
        [v8 addObject:v16];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  [(HMHome *)self inviteUsersWithInviteInformation:v8 completionHandler:v7];
}

- (void)addUser:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v17 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMUser) addUser:withCompletionHandler:]", @"completion"];
    long long v18 = (void *)MEMORY[0x19F3A64A0]();
    long long v19 = self;
    long long v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v21;
      __int16 v27 = 2112;
      id v28 = (const char *)v17;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0];
    objc_exception_throw(v22);
  }
  id v9 = (void *)v8;
  if (v8)
  {
    uint64_t v10 = [(HMHome *)self context];
    uint64_t v11 = [v10 delegateCaller];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __48__HMHome_HMUser__addUser_withCompletionHandler___block_invoke;
    void v23[3] = &unk_1E59454C0;
    id v24 = v7;
    [v11 invokeBlock:v23];

    uint64_t v12 = v24;
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v16;
      __int16 v27 = 2080;
      id v28 = "-[HMHome(HMUser) addUser:withCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

void __48__HMHome_HMUser__addUser_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addUserWithoutConfirmation:(id)a3 privilege:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [(HMHome *)self context];
  if (!v8)
  {
    uint64_t v18 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMUser) addUserWithoutConfirmation:privilege:completionHandler:]", @"completion"];
    long long v19 = (void *)MEMORY[0x19F3A64A0]();
    long long v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v27 = v22;
      __int16 v28 = 2112;
      uint64_t v29 = (const char *)v18;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v18 userInfo:0];
    objc_exception_throw(v23);
  }
  uint64_t v10 = (void *)v9;
  if (v9)
  {
    uint64_t v11 = [(HMHome *)self context];
    uint64_t v12 = [v11 delegateCaller];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    id v24[2] = __73__HMHome_HMUser__addUserWithoutConfirmation_privilege_completionHandler___block_invoke;
    v24[3] = &unk_1E59454C0;
    id v25 = v8;
    [v12 invokeBlock:v24];

    uint64_t v13 = v25;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x19F3A64A0]();
    id v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v27 = v17;
      __int16 v28 = 2080;
      uint64_t v29 = "-[HMHome(HMUser) addUserWithoutConfirmation:privilege:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v13);
  }
}

void __73__HMHome_HMUser__addUserWithoutConfirmation_privilege_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addUserWithCompletionHandler:(void *)completion
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = completion;
  uint64_t v5 = [(HMHome *)self context];
  if (!v4)
  {
    uint64_t v14 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMUser) addUserWithCompletionHandler:]", @"completion"];
    id v15 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v18;
      __int16 v24 = 2112;
      id v25 = (const char *)v14;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v14 userInfo:0];
    objc_exception_throw(v19);
  }
  id v6 = (void *)v5;
  if (v5)
  {
    id v7 = [(HMHome *)self context];
    id v8 = [v7 delegateCaller];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __47__HMHome_HMUser__addUserWithCompletionHandler___block_invoke;
    v20[3] = &unk_1E59454C0;
    id v21 = v4;
    [v8 invokeBlock:v20];

    uint64_t v9 = v21;
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v13;
      __int16 v24 = 2080;
      id v25 = "-[HMHome(HMUser) addUserWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void, void *))v4 + 2))(v4, 0, v9);
  }
}

void __47__HMHome_HMUser__addUserWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)administrator
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMHome *)self currentUser];
  id v4 = [v3 homeAccessControl];
  int v5 = [v4 isAdministrator];

  if (v5)
  {
    id v6 = [(HMHome *)self currentUser];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = [(HMHome *)self currentUsers];
    id v8 = [v7 array];

    id v6 = (id)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v8);
          }
          uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v12 = [v11 homeAccessControl];
          int v13 = [v12 isAdministrator];

          if (v13)
          {
            id v6 = v11;
            goto LABEL_13;
          }
        }
        id v6 = (id)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }

  return v6;
}

- (id)_createFailedAccessoriesListFromError:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 userInfo];
  int v5 = objc_msgSend(v4, "hmf_arrayForKey:", @"kFailedAccessoriesListKey");

  if (v5)
  {
    id v25 = v3;
    __int16 v24 = [MEMORY[0x1E4F1CA60] dictionary];
    id v6 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v35;
      uint64_t v26 = *(void *)v35;
      do
      {
        uint64_t v10 = 0;
        uint64_t v27 = v8;
        do
        {
          if (*(void *)v35 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v34 + 1) + 8 * v10);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v29 = v10;
            id v12 = v11;
            long long v30 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v40 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v31;
              do
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v31 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * i);
                  long long v18 = [v12 objectForKeyedSubscript:v17];
                  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v17];
                  id v38 = v19;
                  id v39 = v18;
                  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
                  [v6 addObject:v20];
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v40 count:16];
              }
              while (v14);
            }

            uint64_t v9 = v26;
            uint64_t v8 = v27;
            uint64_t v10 = v29;
          }
          ++v10;
        }
        while (v10 != v8);
        uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v8);
    }

    id v21 = v24;
    [v24 setObject:v6 forKeyedSubscript:@"HMUserFailedAccessoriesKey"];

    id v3 = v25;
  }
  else
  {
    id v21 = 0;
  }
  id v22 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"HMErrorDomain", objc_msgSend(v3, "code"), v21);

  return v22;
}

- (void)_removeUser:(id)a3 completionHandler:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v24 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMUser) _removeUser:completionHandler:]", @"completion"];
    id v25 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v26 = self;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      __int16 v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v37 = v28;
      __int16 v38 = 2112;
      id v39 = (const char *)v24;
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v29 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v24 userInfo:0];
    objc_exception_throw(v29);
  }
  uint64_t v9 = v8;
  if (!v8)
  {
    long long v18 = (void *)MEMORY[0x19F3A64A0]();
    id v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v37 = v21;
      __int16 v38 = 2080;
      id v39 = "-[HMHome(HMUser) _removeUser:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v7[2](v7, v22);
    goto LABEL_11;
  }
  if (!v6)
  {
    id v22 = [v8 delegateCaller];
    id v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:20 userInfo:0];
    [v22 callCompletion:v7 error:v23];

LABEL_11:
    goto LABEL_12;
  }
  v34[0] = @"kUserUUIDKey";
  uint64_t v10 = [v6 uuid];
  uint64_t v11 = [v10 UUIDString];
  v34[1] = @"kConfirmUserManagementKey";
  v35[0] = v11;
  v35[1] = MEMORY[0x1E4F1CC28];
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];

  uint64_t v13 = [v6 senderCorrelationIdentifier];

  if (v13)
  {
    uint64_t v14 = (void *)[v12 mutableCopy];
    uint64_t v15 = [v6 senderCorrelationIdentifier];
    [v14 setObject:v15 forKeyedSubscript:@"HM.senderCorrelationIdentifier"];

    uint64_t v16 = [v14 copy];
    id v12 = (void *)v16;
  }
  uint64_t v17 = [(HMHome *)self uuid];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __48__HMHome_HMUser___removeUser_completionHandler___block_invoke;
  v30[3] = &unk_1E59441B0;
  void v30[4] = self;
  id v31 = v6;
  id v32 = v9;
  long long v33 = v7;
  -[_HMContext sendMessage:target:payload:responseHandler:](v32, @"kRemoveUserRequestKey", v17, v12, v30);

LABEL_12:
}

void __48__HMHome_HMUser___removeUser_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v8 = [v7 _createFailedAccessoriesListFromError:v5];
    uint64_t v9 = (void *)MEMORY[0x19F3A64A0]();
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      uint64_t v13 = *(void *)(a1 + 40);
      int v21 = 138543874;
      id v22 = v12;
      __int16 v23 = 2112;
      uint64_t v24 = v13;
      __int16 v25 = 2112;
      uint64_t v26 = v8;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Failed to remove user: %@, with error: %@", (uint8_t *)&v21, 0x20u);
    }
    uint64_t v14 = [*(id *)(a1 + 48) delegateCaller];
    [v14 callCompletion:*(void *)(a1 + 56) error:v8];
  }
  else
  {
    uint64_t v15 = [v7 currentUsers];
    [v15 removeObject:*(void *)(a1 + 40)];

    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = *(id *)(a1 + 32);
    long long v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      uint64_t v20 = *(void *)(a1 + 40);
      int v21 = 138543618;
      id v22 = v19;
      __int16 v23 = 2112;
      uint64_t v24 = v20;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@Calling completion for removed user: %@", (uint8_t *)&v21, 0x16u);
    }
    uint64_t v8 = [*(id *)(a1 + 48) delegateCaller];
    [v8 callCompletion:*(void *)(a1 + 56) error:0];
  }
}

- (void)removeUser:(HMUser *)user completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = user;
  uint64_t v7 = completion;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMUser) removeUser:completionHandler:]", @"completion"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    long long v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      __int16 v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__HMHome_HMUser__removeUser_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    void block[4] = self;
    __int16 v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v14;
      __int16 v27 = 2080;
      __int16 v28 = "-[HMHome(HMUser) removeUser:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __47__HMHome_HMUser__removeUser_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeUser:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (BOOL)_areAllUserInviteInformationValid:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__HMHome_HMUser___areAllUserInviteInformationValid___block_invoke;
  v4[3] = &unk_1E59416D8;
  v4[4] = self;
  return objc_msgSend(a3, "na_all:", v4);
}

uint64_t __52__HMHome_HMUser___areAllUserInviteInformationValid___block_invoke(uint64_t a1, void *a2)
{
  return [a2 validateInviteForHome:*(void *)(a1 + 32)];
}

- (void)inviteUsersWithInviteInformation:(id)a3 completionHandler:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v42 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMUser) inviteUsersWithInviteInformation:completionHandler:]", @"completion"];
    __int16 v43 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v44 = self;
    uint64_t v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      uint64_t v46 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v56 = v46;
      __int16 v57 = 2112;
      uint64_t v58 = (const char *)v42;
      _os_log_impl(&dword_19D1A8000, v45, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v47 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v42 userInfo:0];
    objc_exception_throw(v47);
  }
  uint64_t v9 = (void *)v8;
  if (!v8)
  {
    uint64_t v26 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v27 = self;
    __int16 v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v56 = v29;
      __int16 v57 = 2080;
      uint64_t v58 = "-[HMHome(HMUser) inviteUsersWithInviteInformation:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    long long v30 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v7[2](v7, 0, v30);
    goto LABEL_11;
  }
  if (![v6 count])
  {
    long long v30 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:3 userInfo:0];
    id v31 = [(HMHome *)self context];
    id v32 = [v31 delegateCaller];
    [v32 callCompletion:v7 invitations:0 error:v30];

LABEL_11:
    goto LABEL_20;
  }
  if ([(HMHome *)self _areAllUserInviteInformationValid:v6])
  {
    id v52 = 0;
    id v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v52];
    uint64_t v11 = (char *)v52;
    if (v10)
    {
      uint64_t v53 = @"HMHomeUserInviteInformationKey";
      id v54 = v10;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      id v13 = objc_alloc(MEMORY[0x1E4F654B0]);
      id v14 = objc_alloc(MEMORY[0x1E4F65488]);
      uint64_t v15 = [(HMHome *)self uuid];
      uint64_t v16 = (void *)[v14 initWithTarget:v15];
      id v17 = (void *)[v13 initWithName:@"kInviteUsersRequestKey" destination:v16 payload:v12];

      long long v18 = [(HMHome *)self context];
      id v19 = [v18 pendingRequests];

      uint64_t v20 = [v17 identifier];
      id v21 = _Block_copy(v7);
      [v19 addCompletionBlock:v21 forIdentifier:v20];

      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __69__HMHome_HMUser__inviteUsersWithInviteInformation_completionHandler___block_invoke;
      v48[3] = &unk_1E59450E8;
      id v49 = v19;
      id v50 = v20;
      id v22 = v9;
      id v51 = v22;
      id v23 = v20;
      id v24 = v19;
      [v17 setResponseHandler:v48];
      __int16 v25 = [v22 messageDispatcher];
      [v25 sendMessage:v17];
    }
    else
    {
      __int16 v38 = (void *)MEMORY[0x19F3A64A0]();
      id v39 = self;
      uint64_t v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        uint64_t v41 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v56 = v41;
        __int16 v57 = 2112;
        uint64_t v58 = v11;
        _os_log_impl(&dword_19D1A8000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode user invite information: %@", buf, 0x16u);
      }
      id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:3 userInfo:0];
      id v17 = [(HMHome *)v39 context];
      id v24 = [v17 delegateCaller];
      [v24 callCompletion:v7 invitations:0 error:v12];
    }
  }
  else
  {
    long long v33 = (void *)MEMORY[0x19F3A64A0]();
    long long v34 = self;
    long long v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      long long v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v56 = v36;
      _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_ERROR, "%{public}@Not all the HMUserInviteInformation objects are valid.", buf, 0xCu);
    }
    uint64_t v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    id v10 = [(HMHome *)v34 context];
    long long v37 = [v10 delegateCaller];
    [v37 callCompletion:v7 invitations:0 error:v11];
  }
LABEL_20:
}

void __69__HMHome_HMUser__inviteUsersWithInviteInformation_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = a2;
    id v7 = [v3 removeCompletionBlockForIdentifier:v4];
    id v6 = [*(id *)(a1 + 48) delegateCaller];
    [v6 callCompletion:v7 obj:0 error:v5];
  }
}

- (void)_manageUsersWithCompletionHandler:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMHome *)self context];
  if (!v4)
  {
    uint64_t v21 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMUser) _manageUsersWithCompletionHandler:]", @"completion"];
    id v22 = (void *)MEMORY[0x19F3A64A0]();
    id v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      __int16 v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v25;
      __int16 v32 = 2112;
      long long v33 = (const char *)v21;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v26 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v21 userInfo:0];
    objc_exception_throw(v26);
  }
  id v6 = (void *)v5;
  if (v5)
  {
    id v7 = [(HMHome *)self homeManager];
    if ([v7 isViewServiceActive])
    {
      uint64_t v8 = [(HMHome *)self context];
      uint64_t v9 = [v8 delegateCaller];
      id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:15 userInfo:0];
      [v9 callCompletion:v4 error:v10];
    }
    else
    {
      [v7 setViewServiceActive:1];
      id v15 = objc_alloc(MEMORY[0x1E4F654B0]);
      id v16 = objc_alloc(MEMORY[0x1E4F65488]);
      id v17 = [(HMHome *)self uuid];
      long long v18 = (void *)[v16 initWithTarget:v17];
      id v19 = (void *)[v15 initWithName:@"HMHomeAllowUserManagementMessage" destination:v18 payload:0];

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __52__HMHome_HMUser___manageUsersWithCompletionHandler___block_invoke;
      v27[3] = &unk_1E5945510;
      void v27[4] = self;
      id v7 = v7;
      id v28 = v7;
      id v29 = v4;
      [v19 setResponseHandler:v27];
      uint64_t v20 = [v6 messageDispatcher];
      [v20 sendMessage:v19];
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v14;
      __int16 v32 = 2080;
      long long v33 = "-[HMHome(HMUser) _manageUsersWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, id))v4 + 2))(v4, v7);
  }
}

void __52__HMHome_HMUser___manageUsersWithCompletionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = a1[4];
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v18 = v10;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to allow user management: %@", buf, 0x16u);
    }
    [a1[5] setViewServiceActive:0];
    uint64_t v11 = [a1[4] context];
    id v12 = [v11 delegateCaller];
    [v12 callCompletion:a1[6] error:v5];
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__HMHome_HMUser___manageUsersWithCompletionHandler___block_invoke_1924;
    v14[3] = &unk_1E5945138;
    id v13 = a1[5];
    void v14[4] = a1[4];
    id v15 = v13;
    id v16 = a1[6];
    runOnMainQueue(v14);
  }
}

void __52__HMHome_HMUser___manageUsersWithCompletionHandler___block_invoke_1924(uint64_t a1)
{
  id v2 = [HMUserListViewController alloc];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__HMHome_HMUser___manageUsersWithCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E5945188;
  uint64_t v3 = *(void *)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  id v4 = [(HMUserListViewController *)v2 initWithHome:v3 loadHandler:v14];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __52__HMHome_HMUser___manageUsersWithCompletionHandler___block_invoke_3;
  id v10 = &unk_1E59449F0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v6;
  id v13 = *(id *)(a1 + 48);
  [(HMUserListViewController *)v4 setCompletionHandler:&v7];
  [(HMUserListViewController *)v4 presentWhenLoaded];
}

uint64_t __52__HMHome_HMUser___manageUsersWithCompletionHandler___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) setViewServiceActive:0];
  }
  return result;
}

void __52__HMHome_HMUser___manageUsersWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setViewServiceActive:0];
  id v6 = [*(id *)(a1 + 40) context];
  id v5 = [v6 delegateCaller];
  [v5 callCompletion:*(void *)(a1 + 48) error:v4];
}

- (void)manageUsersWithCompletionHandler:(void *)completion
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = completion;
  id v5 = [(HMHome *)self context];
  if (!v4)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMUser) manageUsersWithCompletionHandler:]", @"completion"];
    id v14 = (void *)MEMORY[0x19F3A64A0]();
    id v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v22 = v17;
      __int16 v23 = 2112;
      id v24 = (const char *)v13;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0];
    objc_exception_throw(v18);
  }
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__HMHome_HMUser__manageUsersWithCompletionHandler___block_invoke;
    block[3] = &unk_1E59454E8;
    void block[4] = self;
    id v20 = v4;
    dispatch_async(v7, block);
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v22 = v11;
      __int16 v23 = 2080;
      id v24 = "-[HMHome(HMUser) manageUsersWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v4 + 2))(v4, v12);
  }
}

uint64_t __51__HMHome_HMUser__manageUsersWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _manageUsersWithCompletionHandler:*(void *)(a1 + 40)];
}

- (id)restrictedGuests
{
  uint64_t v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v5 = [(HMHome *)self currentUser];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [(HMHome *)self currentUser];
    uint64_t v8 = [v7 homeAccessControl];
    int v9 = [v8 isRestrictedGuest];

    if (v9)
    {
      id v10 = [(HMHome *)self currentUser];
      [v4 addObject:v10];
    }
  }
  id v11 = [(HMHome *)self currentUsers];
  uint64_t v12 = [v11 array];
  uint64_t v13 = objc_msgSend(v12, "na_filter:", &__block_literal_global_1923);

  [v4 addObjectsFromArray:v13];
  id v14 = [v4 allObjects];

  return v14;
}

uint64_t __34__HMHome_HMUser__restrictedGuests__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 homeAccessControl];
  uint64_t v3 = [v2 isRestrictedGuest];

  return v3;
}

- (id)communalUsers
{
  uint64_t v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v5 = [(HMHome *)self currentUser];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [(HMHome *)self currentUser];
    uint64_t v8 = [v7 homeAccessControl];
    char v9 = [v8 isRestrictedGuest];

    if ((v9 & 1) == 0)
    {
      id v10 = [(HMHome *)self currentUser];
      [v4 addObject:v10];
    }
  }
  id v11 = [(HMHome *)self currentUsers];
  uint64_t v12 = [v11 array];
  uint64_t v13 = objc_msgSend(v12, "na_filter:", &__block_literal_global_1921);

  [v4 addObjectsFromArray:v13];
  id v14 = [v4 allObjects];

  return v14;
}

uint64_t __31__HMHome_HMUser__communalUsers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 homeAccessControl];
  uint64_t v3 = [v2 isRestrictedGuest] ^ 1;

  return v3;
}

- (id)removeMediaSystemRequestResponseHandlerWithMediaSystem:(id)a3 context:(id)a4 messageIdentifier:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __120__HMHome_HMTrigger__removeMediaSystemRequestResponseHandlerWithMediaSystem_context_messageIdentifier_completionHandler___block_invoke;
  v17[3] = &unk_1E59441B0;
  void v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  id v20 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  id v15 = _Block_copy(v17);

  return v15;
}

void __120__HMHome_HMTrigger__removeMediaSystemRequestResponseHandlerWithMediaSystem_context_messageIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v18 = 138543874;
      id v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Send remove request for media system: %@ responded with error: %@", (uint8_t *)&v18, 0x20u);
    }
    id v12 = [*(id *)(a1 + 48) delegateCaller];
    id v13 = v12;
    uint64_t v14 = *(void *)(a1 + 56);
    id v15 = v5;
  }
  else
  {
    id v16 = *(void **)(a1 + 32);
    id v17 = [*(id *)(a1 + 40) uuid];
    [v16 stageRemovedMediaSystemUUID:v17];

    id v12 = [*(id *)(a1 + 48) delegateCaller];
    id v13 = v12;
    uint64_t v14 = *(void *)(a1 + 56);
    id v15 = 0;
  }
  [v12 callCompletion:v14 error:v15];
}

- (void)removeMediaSystem:(id)a3 completionHandler:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v46 = v11;
    __int16 v47 = 2112;
    uint64_t v48 = v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending request to remove media system: %@", buf, 0x16u);
  }
  uint64_t v12 = [(HMHome *)v9 context];
  if (!v7)
  {
    uint64_t v37 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMTrigger) removeMediaSystem:completionHandler:]", @"completion"];
    __int16 v38 = (void *)MEMORY[0x19F3A64A0]();
    id v39 = v9;
    uint64_t v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      uint64_t v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v46 = v41;
      __int16 v47 = 2112;
      uint64_t v48 = (const char *)v37;
      _os_log_impl(&dword_19D1A8000, v40, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v42 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v37 userInfo:0];
    objc_exception_throw(v42);
  }
  id v13 = (void *)v12;
  if (v12)
  {
    if (v6)
    {
      uint64_t v14 = [(HMHome *)v9 mediaSystemStageManager];
      id v15 = [v6 uuid];
      id v16 = [v14 mediaSystemWithUUID:v15];

      if (v16)
      {
        uint64_t v43 = kMediaSystemUUIDCodingKey;
        id v17 = [v6 uuid];
        int v18 = [v17 UUIDString];
        uint64_t v44 = v18;
        id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];

        id v20 = objc_alloc(MEMORY[0x1E4F654B0]);
        uint64_t v21 = kRemoveMediaSystemRequest;
        id v22 = objc_alloc(MEMORY[0x1E4F65488]);
        id v23 = [(HMHome *)v9 uuid];
        uint64_t v24 = (void *)[v22 initWithTarget:v23];
        uint64_t v25 = (void *)[v20 initWithName:v21 destination:v24 payload:v19];

        id v26 = [v25 identifier];
        __int16 v27 = [(HMHome *)v9 removeMediaSystemRequestResponseHandlerWithMediaSystem:v6 context:v13 messageIdentifier:v26 completionHandler:v7];
        [v25 setResponseHandler:v27];

        id v28 = [v13 messageDispatcher];
        [v28 sendMessage:v25];

        goto LABEL_14;
      }
      id v19 = [(HMHome *)v9 context];
      long long v33 = [v19 delegateCaller];
      uint64_t v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v35 = 2;
    }
    else
    {
      id v19 = [(HMHome *)v9 context];
      long long v33 = [v19 delegateCaller];
      uint64_t v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v35 = 20;
    }
    long long v36 = [v34 hmErrorWithCode:v35];
    [v33 callCompletion:v7 error:v36];

    goto LABEL_14;
  }
  id v29 = (void *)MEMORY[0x19F3A64A0]();
  long long v30 = v9;
  id v31 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    __int16 v32 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v46 = v32;
    __int16 v47 = 2080;
    uint64_t v48 = "-[HMHome(HMTrigger) removeMediaSystem:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  id v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
  v7[2](v7, v19);
LABEL_14:
}

- (void)_userDidConfirmExecution:(BOOL)a3 ofTriggerWithIdentifier:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  uint64_t v10 = [(HMHome *)self context];
  if (!v9)
  {
    uint64_t v28 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMTrigger) _userDidConfirmExecution:ofTriggerWithIdentifier:completionHandler:]", @"completion"];
    id v29 = (void *)MEMORY[0x19F3A64A0]();
    long long v30 = self;
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v32;
      __int16 v41 = 2112;
      id v42 = (const char *)v28;
      _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v33 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v28 userInfo:0];
    objc_exception_throw(v33);
  }
  uint64_t v11 = (void *)v10;
  if (!v10)
  {
    uint64_t v21 = (void *)MEMORY[0x19F3A64A0]();
    id v22 = self;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v24;
      __int16 v41 = 2080;
      id v42 = "-[HMHome(HMTrigger) _userDidConfirmExecution:ofTriggerWithIdentifier:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v9[2](v9, v25);
    goto LABEL_9;
  }
  if (!v8)
  {
    uint64_t v25 = [(HMHome *)self context];
    id v26 = [v25 delegateCaller];
    __int16 v27 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v26 callCompletion:v9 error:v27];

LABEL_9:
    goto LABEL_10;
  }
  v37[0] = @"kTriggerUUID";
  v37[1] = @"kTriggerExecuteConfirmationKey";
  v38[0] = v8;
  uint64_t v12 = [NSNumber numberWithBool:v6];
  v38[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];

  id v14 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v15 = objc_alloc(MEMORY[0x1E4F65488]);
  id v16 = [(HMHome *)self uuid];
  id v17 = (void *)[v15 initWithTarget:v16];
  int v18 = (void *)[v14 initWithName:@"kConfirmExecuteTriggerRequestKey" destination:v17 payload:v13];

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  void v34[2] = __88__HMHome_HMTrigger___userDidConfirmExecution_ofTriggerWithIdentifier_completionHandler___block_invoke;
  v34[3] = &unk_1E5944EF0;
  id v19 = v11;
  id v35 = v19;
  long long v36 = v9;
  [v18 setResponseHandler:v34];
  id v20 = [v19 messageDispatcher];
  [v20 sendMessage:v18];

LABEL_10:
}

void __88__HMHome_HMTrigger___userDidConfirmExecution_ofTriggerWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegateCaller];
  [v5 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (void)userDidConfirmExecution:(BOOL)a3 ofTriggerWithIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(HMHome *)self context];
  if (!v9)
  {
    uint64_t v18 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMTrigger) userDidConfirmExecution:ofTriggerWithIdentifier:completionHandler:]", @"completion"];
    id v19 = (void *)MEMORY[0x19F3A64A0]();
    id v20 = self;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v29 = v22;
      __int16 v30 = 2112;
      id v31 = (const char *)v18;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v18 userInfo:0];
    objc_exception_throw(v23);
  }
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__HMHome_HMTrigger__userDidConfirmExecution_ofTriggerWithIdentifier_completionHandler___block_invoke;
    block[3] = &unk_1E5941750;
    void block[4] = self;
    BOOL v27 = a3;
    id v25 = v8;
    id v26 = v9;
    dispatch_async(v12, block);
  }
  else
  {
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v29 = v16;
      __int16 v30 = 2080;
      id v31 = "-[HMHome(HMTrigger) userDidConfirmExecution:ofTriggerWithIdentifier:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v9 + 2))(v9, v17);
  }
}

uint64_t __87__HMHome_HMTrigger__userDidConfirmExecution_ofTriggerWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _userDidConfirmExecution:*(unsigned __int8 *)(a1 + 56) ofTriggerWithIdentifier:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)userDidConfirmExecution:(BOOL)a3 ofTrigger:(id)a4 completionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  uint64_t v10 = [(HMHome *)self context];
  if (!v9)
  {
    uint64_t v20 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMTrigger) userDidConfirmExecution:ofTrigger:completionHandler:]", @"completion"];
    uint64_t v21 = (void *)MEMORY[0x19F3A64A0]();
    id v22 = self;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v24;
      __int16 v32 = 2112;
      id v33 = (const char *)v20;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0];
    objc_exception_throw(v25);
  }
  uint64_t v11 = v10;
  if (!v10)
  {
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v16;
      __int16 v32 = 2080;
      id v33 = "-[HMHome(HMTrigger) userDidConfirmExecution:ofTrigger:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v9[2](v9, v17);
    goto LABEL_9;
  }
  if (!v8)
  {
    id v17 = [(HMHome *)self context];
    uint64_t v18 = [v17 delegateCaller];
    id v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v18 callCompletion:v9 error:v19];

LABEL_9:
    goto LABEL_10;
  }
  uint64_t v12 = [v10 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__HMHome_HMTrigger__userDidConfirmExecution_ofTrigger_completionHandler___block_invoke;
  block[3] = &unk_1E5941750;
  void block[4] = self;
  BOOL v29 = a3;
  id v27 = v8;
  uint64_t v28 = v9;
  dispatch_async(v12, block);

LABEL_10:
}

void __73__HMHome_HMTrigger__userDidConfirmExecution_ofTrigger_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) uniqueIdentifier];
  id v4 = [v5 UUIDString];
  [v3 _userDidConfirmExecution:v2 ofTriggerWithIdentifier:v4 completionHandler:*(void *)(a1 + 48)];
}

- (void)_removeTrigger:(id)a3 completionHandler:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v28 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMTrigger) _removeTrigger:completionHandler:]", @"completion"];
    BOOL v29 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v30 = self;
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = HMFGetLogIdentifier();
      *(_DWORD *)id location = 138543618;
      *(void *)&location[4] = v32;
      __int16 v40 = 2112;
      __int16 v41 = (const char *)v28;
      _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);
    }
    id v33 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v28 userInfo:0];
    objc_exception_throw(v33);
  }
  id v9 = (void *)v8;
  if (v8)
  {
    if (v6)
    {
      uint64_t v10 = [(HMHome *)self currentTriggers];
      char v11 = [v10 containsObject:v6];

      if (v11)
      {
        uint64_t v12 = (void *)MEMORY[0x1E4F654B0];
        id v13 = [(HMHome *)self messageDestination];
        uint64_t v37 = @"kTriggerUUID";
        id v14 = [v6 uuid];
        id v15 = [v14 UUIDString];
        __int16 v38 = v15;
        id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        id v17 = [v12 messageWithName:@"kRemoveTriggerRequestKey" destination:v13 payload:v16];

        objc_initWeak((id *)location, self);
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        void v34[2] = __54__HMHome_HMTrigger___removeTrigger_completionHandler___block_invoke;
        v34[3] = &unk_1E5944188;
        objc_copyWeak(&v36, (id *)location);
        id v35 = v7;
        [v17 setResponseHandler:v34];
        uint64_t v18 = [v9 messageDispatcher];
        [v18 sendMessage:v17 completionHandler:0];

        objc_destroyWeak(&v36);
        objc_destroyWeak((id *)location);

        goto LABEL_12;
      }
      uint64_t v24 = [(HMHome *)self context];
      id v25 = [v24 delegateCaller];
      uint64_t v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:2 userInfo:0];
    }
    else
    {
      uint64_t v24 = [(HMHome *)self context];
      id v25 = [v24 delegateCaller];
      uint64_t v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:20 userInfo:0];
    }
    id v27 = (void *)v26;
    [v25 callCompletion:v7 error:v26];

    goto LABEL_12;
  }
  id v19 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v20 = self;
  uint64_t v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    id v22 = HMFGetLogIdentifier();
    *(_DWORD *)id location = 138543618;
    *(void *)&location[4] = v22;
    __int16 v40 = 2080;
    __int16 v41 = "-[HMHome(HMTrigger) _removeTrigger:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", location, 0x16u);
  }
  id v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
  (*((void (**)(id, void *))v7 + 2))(v7, v23);

LABEL_12:
}

void __54__HMHome_HMTrigger___removeTrigger_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v9
    || !v5
    || [WeakRetained _removeTriggerFromResponse:v5 completion:*(void *)(a1 + 32)])
  {
    id v7 = [WeakRetained context];
    uint64_t v8 = [v7 delegateCaller];
    [v8 callCompletion:*(void *)(a1 + 32) error:v9];
  }
}

- (void)removeTrigger:(HMTrigger *)trigger completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = trigger;
  id v7 = completion;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMTrigger) removeTrigger:completionHandler:]", @"completion"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__HMHome_HMTrigger__removeTrigger_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    void block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    char v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v14;
      __int16 v27 = 2080;
      uint64_t v28 = "-[HMHome(HMTrigger) removeTrigger:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __53__HMHome_HMTrigger__removeTrigger_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeTrigger:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_addTrigger:(id)a3 completionHandler:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v45 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMTrigger) _addTrigger:completionHandler:]", @"clientCompletionHandler"];
    uint64_t v46 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v47 = self;
    uint64_t v48 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      uint64_t v49 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v49;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v45;
      _os_log_impl(&dword_19D1A8000, v48, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v50 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v45 userInfo:0];
    objc_exception_throw(v50);
  }
  id v9 = (void *)v8;
  if (v8)
  {
    if (v6)
    {
      uint64_t v10 = [v6 name];
      unint64_t v11 = [v10 length];
      if (HMMaxLengthForNaming__hmf_once_t7 != -1) {
        dispatch_once(&HMMaxLengthForNaming__hmf_once_t7, &__block_literal_global_55_24575);
      }
      unint64_t v12 = HMMaxLengthForNaming__hmf_once_v8;

      if (v11 > v12)
      {
        id v13 = (void *)MEMORY[0x19F3A64A0]();
        id v14 = self;
        id v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v16;
          _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Trigger name is longer than the pre-defined max length", buf, 0xCu);
        }
        id v17 = [v9 delegateCaller];
        uint64_t v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:46];
        [v17 callCompletion:v7 error:v18];

        goto LABEL_19;
      }
      __int16 v27 = [(HMHome *)self currentTriggers];
      int v28 = [v27 containsObject:v6];

      if (v28)
      {
        id v24 = [(HMHome *)self context];
        id v25 = [v24 delegateCaller];
        uint64_t v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:13 userInfo:0];
      }
      else
      {
        uint64_t v29 = [v6 home];

        if (!v29)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v31 = @"kAddTimerTriggerRequestKey";
            __int16 v32 = @"kAddTimerTriggerRequestKey";
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v24 = [(HMHome *)self context];
              id v25 = [v24 delegateCaller];
              uint64_t v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:22 userInfo:0];
              goto LABEL_18;
            }
            id v39 = @"kAddEventTriggerRequestKey";
            __int16 v40 = [v6 predicate];
            BOOL v41 = +[HMPredicateUtilities validatePredicate:v40];

            if (!v41)
            {
              uint64_t v42 = [(HMHome *)self context];
              uint64_t v43 = [v42 delegateCaller];
              uint64_t v44 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:3 userInfo:0];
              [v43 callCompletion:v7 error:v44];

              goto LABEL_19;
            }
            id v31 = @"kAddEventTriggerRequestKey";
          }
          id v33 = [v6 _serializeForAdd];
          uint64_t v34 = (void *)MEMORY[0x1E4F654B0];
          id v35 = [(HMHome *)self messageDestination];
          id v36 = [v34 messageWithName:v31 destination:v35 payload:v33];

          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          uint64_t v58 = __Block_byref_object_copy__29324;
          uint64_t v59 = __Block_byref_object_dispose__29325;
          id v37 = v6;
          id v60 = v37;
          objc_initWeak(&location, self);
          v51[0] = MEMORY[0x1E4F143A8];
          v51[1] = 3221225472;
          v51[2] = __51__HMHome_HMTrigger___addTrigger_completionHandler___block_invoke;
          v51[3] = &unk_1E5941700;
          objc_copyWeak(&v55, &location);
          id v52 = v37;
          id v54 = buf;
          id v53 = v7;
          [v36 setResponseHandler:v51];
          __int16 v38 = [v9 messageDispatcher];
          [v38 sendMessage:v36 completionHandler:0];

          objc_destroyWeak(&v55);
          objc_destroyWeak(&location);
          _Block_object_dispose(buf, 8);

          goto LABEL_19;
        }
        id v24 = [(HMHome *)self context];
        id v25 = [v24 delegateCaller];
        uint64_t v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:11 userInfo:0];
      }
    }
    else
    {
      id v24 = [(HMHome *)self context];
      id v25 = [v24 delegateCaller];
      uint64_t v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:20 userInfo:0];
    }
LABEL_18:
    __int16 v30 = (void *)v26;
    [v25 callCompletion:v7 error:v26];

    goto LABEL_19;
  }
  id v19 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v20 = self;
  id v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    id v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v22;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[HMHome(HMTrigger) _addTrigger:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  id v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
  (*((void (**)(id, void *))v7 + 2))(v7, v23);

LABEL_19:
}

void __51__HMHome_HMTrigger___addTrigger_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v12 || !v5) {
    goto LABEL_7;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if ((isKindOfClass & 1) == 0)
  {
    if (![WeakRetained _addEventTriggerFromResponse:v5 withEventTrigger:v9 completion:v8])goto LABEL_8; {
    goto LABEL_7;
    }
  }
  if ([WeakRetained _addTimerTriggerFromResponse:v5 withTimerTrigger:v9 completion:v8])
  {
LABEL_7:
    uint64_t v10 = [WeakRetained context];
    unint64_t v11 = [v10 delegateCaller];
    [v11 callCompletion:*(void *)(a1 + 40) error:v12];
  }
LABEL_8:
}

- (void)addTrigger:(HMTrigger *)trigger completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = trigger;
  id v7 = completion;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMTrigger) addTrigger:completionHandler:]", @"completion"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      int v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__HMHome_HMTrigger__addTrigger_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    void block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    unint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v14;
      __int16 v27 = 2080;
      int v28 = "-[HMHome(HMTrigger) addTrigger:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __50__HMHome_HMTrigger__addTrigger_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addTrigger:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HMHome *)self context];
  if (!v6)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMSoftwareUpdate) updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled:completionHandler:]", @"completionHandler"];
    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v19;
      __int16 v27 = 2112;
      int v28 = (const char *)v15;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0];
    objc_exception_throw(v20);
  }
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__HMHome_HMSoftwareUpdate__updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled_completionHandler___block_invoke;
    block[3] = &unk_1E5941750;
    void block[4] = self;
    BOOL v24 = a3;
    id v23 = v6;
    id v22 = v8;
    dispatch_async(v9, block);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x19F3A64A0]();
    unint64_t v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v13;
      __int16 v27 = 2080;
      int v28 = "-[HMHome(HMSoftwareUpdate) updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v14);
  }
}

void __102__HMHome_HMSoftwareUpdate__updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled_completionHandler___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F654B0];
  uint64_t v3 = (id *)(a1 + 32);
  id v4 = [*(id *)(a1 + 32) messageDestination];
  id v14 = @"kEnabledKey";
  id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v15[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v7 = [v2 messageWithName:@"HM.afue" destination:v4 payload:v6];

  objc_initWeak(&location, *v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __102__HMHome_HMSoftwareUpdate__updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled_completionHandler___block_invoke_2;
  v9[3] = &unk_1E5941728;
  objc_copyWeak(&v11, &location);
  char v12 = *(unsigned char *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  [v7 setResponseHandler:v9];
  uint64_t v8 = [*(id *)(a1 + 40) messageDispatcher];
  [v8 sendMessage:v7 completionHandler:0];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __102__HMHome_HMSoftwareUpdate__updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v6) {
    [WeakRetained setAutomaticThirdPartyAccessorySoftwareUpdateEnabled:*(unsigned __int8 *)(a1 + 48)];
  }
  if (*(void *)(a1 + 32))
  {
    id v4 = [WeakRetained context];
    id v5 = [v4 delegateCaller];
    [v5 callCompletion:*(void *)(a1 + 32) error:v6];
  }
}

- (void)setAutomaticThirdPartyAccessorySoftwareUpdateEnabled:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_automaticThirdPartyAccessorySoftwareUpdateEnabled = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isAutomaticThirdPartyAccessorySoftwareUpdateEnabled
{
  uint64_t v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_automaticThirdPartyAccessorySoftwareUpdateEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)updateAutomaticSoftwareUpdateEnabled:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    HMFBooleanToString();
    id v11 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    id v31 = v10;
    __int16 v32 = 2112;
    id v33 = v11;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating automatic software update to: %@", buf, 0x16u);
  }
  char v12 = [(HMHome *)v8 context];
  if (!v6)
  {
    uint64_t v20 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMSoftwareUpdate) updateAutomaticSoftwareUpdateEnabled:completionHandler:]", @"completionHandler"];
    id v21 = (void *)MEMORY[0x19F3A64A0]();
    id v22 = v8;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      BOOL v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v24;
      __int16 v32 = 2112;
      id v33 = (const char *)v20;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0];
    objc_exception_throw(v25);
  }
  id v13 = v12;
  if (v12)
  {
    id v14 = [v12 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__HMHome_HMSoftwareUpdate__updateAutomaticSoftwareUpdateEnabled_completionHandler___block_invoke;
    block[3] = &unk_1E5941750;
    void block[4] = v8;
    BOOL v29 = a3;
    id v28 = v6;
    id v27 = v13;
    dispatch_async(v14, block);
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v16 = v8;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v18;
      __int16 v32 = 2080;
      id v33 = "-[HMHome(HMSoftwareUpdate) updateAutomaticSoftwareUpdateEnabled:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v19);
  }
}

void __83__HMHome_HMSoftwareUpdate__updateAutomaticSoftwareUpdateEnabled_completionHandler___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F654B0];
  uint64_t v3 = (id *)(a1 + 32);
  id v4 = [*(id *)(a1 + 32) messageDestination];
  id v14 = @"kEnabledKey";
  id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v15[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v7 = [v2 messageWithName:@"HM.aue" destination:v4 payload:v6];

  objc_initWeak(&location, *v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__HMHome_HMSoftwareUpdate__updateAutomaticSoftwareUpdateEnabled_completionHandler___block_invoke_2;
  v9[3] = &unk_1E5941728;
  objc_copyWeak(&v11, &location);
  char v12 = *(unsigned char *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  [v7 setResponseHandler:v9];
  uint64_t v8 = [*(id *)(a1 + 40) messageDispatcher];
  [v8 sendMessage:v7 completionHandler:0];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __83__HMHome_HMSoftwareUpdate__updateAutomaticSoftwareUpdateEnabled_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v6) {
    [WeakRetained setAutomaticSoftwareUpdateEnabled:*(unsigned __int8 *)(a1 + 48)];
  }
  if (*(void *)(a1 + 32))
  {
    id v4 = [WeakRetained context];
    id v5 = [v4 delegateCaller];
    [v5 callCompletion:*(void *)(a1 + 32) error:v6];
  }
}

- (void)setAutomaticSoftwareUpdateEnabled:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_automaticSoftwareUpdateEnabled = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)_removeServiceGroup:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMHome *)self context];
  uint64_t v9 = v8;
  if (v8)
  {
    if (v6)
    {
      id v10 = [(HMHome *)self currentServiceGroups];
      char v11 = [v10 containsObject:v6];

      if (v11)
      {
        char v12 = [v6 uuid];
        id v13 = [(HMHome *)self uuid];
        BOOL v29 = @"kServiceGroupUUID";
        id v14 = [v12 UUIDString];
        __int16 v30 = v14;
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        id v24[2] = __64__HMHome_HMServiceGroup___removeServiceGroup_completionHandler___block_invoke;
        v24[3] = &unk_1E59441B0;
        id v25 = v9;
        id v27 = v12;
        id v28 = v7;
        uint64_t v26 = self;
        id v16 = v12;
        -[_HMContext sendMessage:target:payload:responseHandler:](v25, @"kRemoveServiceGroupRequestKey", v13, v15, v24);

LABEL_12:
        goto LABEL_13;
      }
      id v16 = [v9 delegateCaller];
      id v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = 2;
    }
    else
    {
      id v16 = [v8 delegateCaller];
      id v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = 20;
    }
    id v23 = [v21 hmErrorWithCode:v22];
    [v16 callCompletion:v7 error:v23];

    goto LABEL_12;
  }
  id v17 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v18 = self;
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v32 = v20;
    __int16 v33 = 2080;
    uint64_t v34 = "-[HMHome(HMServiceGroup) _removeServiceGroup:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v7)
  {
    id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, id))v7 + 2))(v7, v16);
    goto LABEL_12;
  }
LABEL_13:
}

void __64__HMHome_HMServiceGroup___removeServiceGroup_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v3 = [*(id *)(a1 + 32) delegateCaller];
    [v3 callCompletion:*(void *)(a1 + 56) error:v6];
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 40) serviceGroupWithUUID:*(void *)(a1 + 48)];
    if (v3)
    {
      id v4 = [*(id *)(a1 + 40) currentServiceGroups];
      [v4 removeObject:v3];

      [v3 _unconfigure];
    }
    id v5 = [*(id *)(a1 + 32) delegateCaller];
    [v5 callCompletion:*(void *)(a1 + 56) error:0];
  }
}

- (void)removeServiceGroup:(HMServiceGroup *)group completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = group;
  id v7 = completion;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMServiceGroup) removeServiceGroup:completionHandler:]", @"completion"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      id v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__HMHome_HMServiceGroup__removeServiceGroup_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    void block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    char v11 = (void *)MEMORY[0x19F3A64A0]();
    char v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v14;
      __int16 v27 = 2080;
      id v28 = "-[HMHome(HMServiceGroup) removeServiceGroup:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __63__HMHome_HMServiceGroup__removeServiceGroup_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeServiceGroup:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_addServiceGroupWithName:(id)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMHome *)self context];
  uint64_t v9 = v8;
  if (v8)
  {
    if (v6)
    {
      unint64_t v10 = [v6 length];
      if (HMMaxLengthForNaming__hmf_once_t7 != -1) {
        dispatch_once(&HMMaxLengthForNaming__hmf_once_t7, &__block_literal_global_55_24575);
      }
      if (v10 <= HMMaxLengthForNaming__hmf_once_v8)
      {
        uint64_t v22 = [(HMHome *)self serviceGroupWithName:v6];

        if (!v22)
        {
          id v24 = [(HMHome *)self uuid];
          __int16 v30 = @"kServiceGroupName";
          id v31 = v6;
          id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          void v26[2] = __69__HMHome_HMServiceGroup___addServiceGroupWithName_completionHandler___block_invoke;
          v26[3] = &unk_1E5945510;
          id v27 = v9;
          id v28 = self;
          id v29 = v7;
          -[_HMContext sendMessage:target:payload:responseHandler:](v27, @"kAddServiceGroupRequestKey", v24, v25, v26);

          goto LABEL_18;
        }
        uint64_t v15 = [v9 delegateCaller];
        uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v17 = 13;
      }
      else
      {
        char v11 = (void *)MEMORY[0x19F3A64A0]();
        char v12 = self;
        id v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          id v14 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          __int16 v33 = v14;
          _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Service group name is longer than the pre-defined max length", buf, 0xCu);
        }
        uint64_t v15 = [v9 delegateCaller];
        uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v17 = 46;
      }
    }
    else
    {
      uint64_t v15 = [v8 delegateCaller];
      uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = 20;
    }
    id v23 = [v16 hmErrorWithCode:v17];
    [v15 callCompletion:v7 serviceGroup:0 error:v23];

    goto LABEL_17;
  }
  uint64_t v18 = (void *)MEMORY[0x19F3A64A0]();
  id v19 = self;
  uint64_t v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    id v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v33 = v21;
    __int16 v34 = 2080;
    uint64_t v35 = "-[HMHome(HMServiceGroup) _addServiceGroupWithName:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v15);
LABEL_17:
  }
LABEL_18:
}

void __69__HMHome_HMServiceGroup___addServiceGroupWithName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (v12)
  {
    id v6 = [*(id *)(a1 + 32) delegateCaller];
    [v6 callCompletion:*(void *)(a1 + 48) serviceGroup:0 error:v12];
  }
  else
  {
    id v6 = objc_msgSend(v5, "hmf_UUIDForKey:", @"kServiceGroupUUID");
    id v7 = objc_msgSend(v5, "hmf_stringForKey:", @"kServiceGroupName");
    uint64_t v8 = [[HMServiceGroup alloc] initWithName:v7 uuid:v6];
    uint64_t v9 = [*(id *)(a1 + 40) context];
    [(HMServiceGroup *)v8 __configureWithContext:v9 home:*(void *)(a1 + 40)];

    unint64_t v10 = [*(id *)(a1 + 40) currentServiceGroups];
    [v10 addObject:v8];

    char v11 = [*(id *)(a1 + 32) delegateCaller];
    [v11 callCompletion:*(void *)(a1 + 48) serviceGroup:v8 error:0];
  }
}

- (void)addServiceGroupWithName:(NSString *)serviceGroupName completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = serviceGroupName;
  id v7 = completion;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMServiceGroup) addServiceGroupWithName:completionHandler:]", @"completion"];
    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      id v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  uint64_t v9 = v8;
  if (v8)
  {
    unint64_t v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__HMHome_HMServiceGroup__addServiceGroupWithName_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    void block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    char v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v14;
      __int16 v27 = 2080;
      id v28 = "-[HMHome(HMServiceGroup) addServiceGroupWithName:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void, void *))v7 + 2))(v7, 0, v15);
  }
}

uint64_t __68__HMHome_HMServiceGroup__addServiceGroupWithName_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addServiceGroupWithName:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_removeRoom:(id)a3 completionHandler:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMHome *)self context];
  if (v8)
  {
    if (!v6)
    {
      id v13 = [(HMHome *)self context];
      id v14 = [v13 delegateCaller];
      uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:20 userInfo:0];
      goto LABEL_13;
    }
    uint64_t v9 = [v6 uuid];
    unint64_t v10 = [(HMHome(HMRoom) *)self roomForEntireHome];
    char v11 = [v10 uuid];
    int v12 = [v9 isEqual:v11];

    if (v12)
    {
      id v13 = [(HMHome *)self context];
      id v14 = [v13 delegateCaller];
      uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:29 userInfo:0];
LABEL_13:
      __int16 v40 = (void *)v15;
      [v14 callCompletion:v7 error:v15];

      goto LABEL_14;
    }
    id v21 = [(HMHome *)self currentRooms];
    char v22 = [v21 containsObject:v6];

    if ((v22 & 1) == 0)
    {
      id v13 = [(HMHome *)self context];
      id v14 = [v13 delegateCaller];
      uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:2 userInfo:0];
      goto LABEL_13;
    }
    id v23 = objc_alloc(MEMORY[0x1E4F65488]);
    id v24 = [(HMHome *)self messageTargetUUID];
    id v25 = (void *)[v23 initWithTarget:v24];

    uint64_t v26 = (void *)MEMORY[0x1E4F654B0];
    id v52 = @"kRoomUUID";
    __int16 v27 = [v6 uuid];
    id v28 = [v27 UUIDString];
    id v53 = v28;
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    __int16 v30 = [v26 messageWithName:@"kRemoveRoomRequestKey" destination:v25 payload:v29];

    objc_initWeak((id *)buf, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__HMHome_HMRoom___removeRoom_completionHandler___block_invoke;
    aBlock[3] = &unk_1E5944AE0;
    objc_copyWeak(&v51, (id *)buf);
    id v49 = v6;
    id v50 = v7;
    id v31 = _Block_copy(aBlock);
    __int16 v32 = [(HMHome *)self context];
    __int16 v33 = [v32 pendingRequests];

    __int16 v34 = [v30 identifier];
    uint64_t v35 = _Block_copy(v31);
    [v33 addCompletionBlock:v35 forIdentifier:v34];

    uint64_t v41 = MEMORY[0x1E4F143A8];
    uint64_t v42 = 3221225472;
    uint64_t v43 = __48__HMHome_HMRoom___removeRoom_completionHandler___block_invoke_2;
    uint64_t v44 = &unk_1E5945510;
    id v36 = v33;
    id v45 = v36;
    id v37 = v34;
    id v46 = v37;
    id v38 = v31;
    id v47 = v38;
    [v30 setResponseHandler:&v41];
    id v39 = objc_msgSend(v8, "messageDispatcher", v41, v42, v43, v44);
    [v39 sendMessage:v30 completionHandler:0];

    objc_destroyWeak(&v51);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v55 = v19;
      __int16 v56 = 2080;
      __int16 v57 = "-[HMHome(HMRoom) _removeRoom:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    if (v7)
    {
      uint64_t v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
      (*((void (**)(id, void *))v7 + 2))(v7, v20);
    }
  }
LABEL_14:
}

void __48__HMHome_HMRoom___removeRoom_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (!v3)
  {
    id v6 = [WeakRetained currentRooms];
    [v6 removeObject:*(void *)(a1 + 32)];

    [*(id *)(a1 + 32) _unconfigure];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = objc_msgSend(v5, "zones", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v11++) _removeRoom:*(void *)(a1 + 32)];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  int v12 = [v5 context];
  id v13 = [v12 delegateCaller];
  [v13 callCompletion:*(void *)(a1 + 40) error:v3];
}

void __48__HMHome_HMRoom___removeRoom_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)removeRoom:(HMRoom *)room completionHandler:(void *)completion
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = room;
  id v7 = completion;
  uint64_t v8 = [(HMHome *)self context];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__HMHome_HMRoom__removeRoom_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    void block[4] = self;
    long long v16 = v6;
    id v17 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    int v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      long long v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v14;
      __int16 v20 = 2080;
      id v21 = "-[HMHome(HMRoom) removeRoom:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __47__HMHome_HMRoom__removeRoom_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeRoom:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_addRoomWithName:(id)a3 completionHandler:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v44 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMRoom) _addRoomWithName:completionHandler:]", @"completion"];
    id v45 = (void *)MEMORY[0x19F3A64A0]();
    id v46 = self;
    id v47 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      uint64_t v48 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v62 = v48;
      __int16 v63 = 2112;
      __int16 v64 = (const char *)v44;
      _os_log_impl(&dword_19D1A8000, v47, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v49 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v44 userInfo:0];
    objc_exception_throw(v49);
  }
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    if (v6)
    {
      unint64_t v10 = [v6 length];
      if (HMMaxLengthForNaming__hmf_once_t7 != -1) {
        dispatch_once(&HMMaxLengthForNaming__hmf_once_t7, &__block_literal_global_55_24575);
      }
      if (v10 <= HMMaxLengthForNaming__hmf_once_v8)
      {
        id v25 = (void *)[v6 copy];
        uint64_t v26 = [(HMHome *)self roomWithName:v25];

        if (v26)
        {
          __int16 v27 = [(HMHome *)self context];
          id v28 = [v27 delegateCaller];
          uint64_t v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:13 userInfo:0];
          [v28 callCompletion:v7 room:0 error:v29];
        }
        else
        {
          id v30 = objc_alloc(MEMORY[0x1E4F65488]);
          id v31 = [(HMHome *)self messageTargetUUID];
          id v50 = (void *)[v30 initWithTarget:v31];

          __int16 v32 = (void *)MEMORY[0x1E4F654B0];
          uint64_t v59 = @"kRoomName";
          id v60 = v25;
          __int16 v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
          __int16 v34 = [v32 messageWithName:@"kAddRoomRequestKey" destination:v50 payload:v33];

          objc_initWeak((id *)buf, self);
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __53__HMHome_HMRoom___addRoomWithName_completionHandler___block_invoke;
          aBlock[3] = &unk_1E59441D8;
          objc_copyWeak(&v58, (id *)buf);
          id v56 = v25;
          id v57 = v7;
          uint64_t v35 = _Block_copy(aBlock);
          id v36 = [(HMHome *)self context];
          id v37 = [v36 pendingRequests];

          id v38 = [v34 identifier];
          id v39 = _Block_copy(v35);
          [v37 addCompletionBlock:v39 forIdentifier:v38];

          v51[0] = MEMORY[0x1E4F143A8];
          v51[1] = 3221225472;
          v51[2] = __53__HMHome_HMRoom___addRoomWithName_completionHandler___block_invoke_3;
          v51[3] = &unk_1E5945510;
          id v40 = v37;
          id v52 = v40;
          id v41 = v38;
          id v53 = v41;
          id v42 = v35;
          id v54 = v42;
          [v34 setResponseHandler:v51];
          uint64_t v43 = [v9 messageDispatcher];
          [v43 sendMessage:v34 completionHandler:0];

          objc_destroyWeak(&v58);
          objc_destroyWeak((id *)buf);
        }
      }
      else
      {
        uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
        int v12 = self;
        id v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          long long v14 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          long long v62 = v14;
          _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Room name is longer than the pre-defined max length", buf, 0xCu);
        }
        long long v15 = [v9 delegateCaller];
        long long v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:46];
        [v15 callCompletion:v7 room:0 error:v16];
      }
    }
    else
    {
      uint64_t v22 = [(HMHome *)self context];
      id v23 = [v22 delegateCaller];
      id v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:20 userInfo:0];
      [v23 callCompletion:v7 room:0 error:v24];
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v62 = v20;
      __int16 v63 = 2080;
      __int16 v64 = "-[HMHome(HMRoom) _addRoomWithName:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v21);
  }
}

void __53__HMHome_HMRoom___addRoomWithName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = objc_msgSend(v6, "hmf_UUIDForKey:", @"kRoomUUID");
    if (v9)
    {
      uint64_t v8 = [[HMRoom alloc] initWithName:*(void *)(a1 + 32)];
      [(HMRoom *)v8 setUuid:v9];
      unint64_t v10 = [WeakRetained context];
      [(HMRoom *)v8 __configureWithContext:v10 home:WeakRetained];

      uint64_t v11 = [WeakRetained currentRooms];
      [v11 addObject:v8];

      id v5 = 0;
    }
    else
    {
      id v5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      uint64_t v8 = 0;
    }
  }
  int v12 = [WeakRetained context];
  id v13 = [v12 delegateCaller];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __53__HMHome_HMRoom___addRoomWithName_completionHandler___block_invoke_2;
  v17[3] = &unk_1E5945138;
  id v14 = *(id *)(a1 + 40);
  id v19 = v5;
  id v20 = v14;
  uint64_t v18 = v8;
  id v15 = v5;
  long long v16 = v8;
  [v13 invokeBlock:v17];
}

void __53__HMHome_HMRoom___addRoomWithName_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (v6) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __53__HMHome_HMRoom___addRoomWithName_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)addRoomWithName:(NSString *)roomName completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = roomName;
  id v7 = completion;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMRoom) addRoomWithName:completionHandler:]", @"completion"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      id v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  uint64_t v9 = v8;
  if (v8)
  {
    unint64_t v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__HMHome_HMRoom__addRoomWithName_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    void block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    int v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v14;
      __int16 v27 = 2080;
      id v28 = "-[HMHome(HMRoom) addRoomWithName:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void, void *))v7 + 2))(v7, 0, v15);
  }
}

uint64_t __52__HMHome_HMRoom__addRoomWithName_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addRoomWithName:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

void __59__HMHome_HMModernMessagingInternal__reRegisterHMMMHandlers__block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = a1[4];
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    unint64_t v10 = HMFGetLogIdentifier();
    int v18 = 138543874;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v5;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Reregistering with homed for HMMM request handler with message name: %@ options: %@", (uint8_t *)&v18, 0x20u);
  }
  uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
  int v12 = [MEMORY[0x1E4F1CA60] dictionary];
  id v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "userRestriction"));
  [v12 setObject:v13 forKeyedSubscript:@"HMMM.options.user.restriction"];

  [v11 setObject:v5 forKeyedSubscript:@"HMMM.payload.key.message.name"];
  [v11 setObject:v12 forKeyedSubscript:@"HMMM.payload.key.options"];
  id v14 = objc_alloc(MEMORY[0x1E4F65488]);
  id v15 = [a1[5] messageTargetUUID];
  uint64_t v16 = (void *)[v14 initWithTarget:v15];

  id v17 = [MEMORY[0x1E4F654B0] messageWithName:@"HMMM.register.request.handler" destination:v16 payload:v11];
  [a1[6] addObject:v17];
}

void __59__HMHome_HMModernMessagingInternal__reRegisterHMMMHandlers__block_invoke_2122(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 context];
  id v4 = [v5 messageDispatcher];
  [v4 sendMessage:v3];
}

- (id)userFromPayload:(id)a3
{
  id v4 = objc_msgSend(a3, "hmf_UUIDForKey:", @"HMMM.payload.key.user");
  if (v4)
  {
    id v5 = [(HMHome *)self currentUser];
    id v6 = [v5 uuid];
    int v7 = [v6 isEqual:v4];

    if (v7)
    {
      id v8 = [(HMHome *)self currentUser];
    }
    else
    {
      uint64_t v9 = [(HMHome *)self users];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __53__HMHome_HMModernMessagingInternal__userFromPayload___block_invoke;
      v11[3] = &unk_1E5941860;
      id v12 = v4;
      id v8 = objc_msgSend(v9, "na_firstObjectPassingTest:", v11);
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __53__HMHome_HMModernMessagingInternal__userFromPayload___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)sendModernMessagingRequestWithMessageName:(id)a3 destination:(id)a4 requestPayload:(id)a5 options:(id)a6 responseHandler:(id)a7 completionHandler:(id)a8
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v55 = a5;
  id v16 = a6;
  id v17 = a7;
  id v53 = a8;
  int v18 = [(HMHome *)self uuid];
  id v19 = [v18 UUIDString];
  uint64_t v20 = +[HMMMLogOrigin originWithLogIdentifier:v19];

  id v54 = v14;
  id v21 = (void *)[v14 copy];
  __int16 v22 = [MEMORY[0x1E4F1CA60] dictionary];
  id v23 = [(HMHome *)self context];
  id v56 = (void *)v20;
  if (v23)
  {
    uint64_t v24 = [v16 timeout];
    [v22 setObject:v24 forKeyedSubscript:@"HMMM.options.timeout"];

    id v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "transportRestriction"));
    [v22 setObject:v25 forKeyedSubscript:@"HMMM.options.transport.restriction"];

    uint64_t v26 = [NSNumber numberWithBool:v17 == 0];
    [v22 setObject:v26 forKeyedSubscript:@"HMMM.options.oneway"];

    __int16 v27 = [MEMORY[0x1E4F1CA60] dictionary];
    [v27 setObject:v21 forKeyedSubscript:@"HMMM.payload.key.message.name"];
    id v28 = v17;
    id v29 = v15;
    id v30 = [v15 idsIdentifier];
    [v27 setObject:v30 forKeyedSubscript:@"HMMM.payload.key.destination.identifier"];

    id v31 = [v15 idsTokenURI];
    [v27 setObject:v31 forKeyedSubscript:@"HMMM.payload.key.destination.uri"];

    [v27 setObject:v22 forKeyedSubscript:@"HMMM.payload.key.options"];
    id v51 = v23;
    [v27 setObject:v55 forKeyedSubscript:@"HMMM.payload.key.payload"];
    id v32 = objc_alloc(MEMORY[0x1E4F65488]);
    [(HMHome *)self messageTargetUUID];
    id v49 = v16;
    v34 = __int16 v33 = v21;
    uint64_t v35 = (void *)[v32 initWithTarget:v34];

    id v36 = [MEMORY[0x1E4F654B0] messageWithName:@"HMMM.send.request" destination:v35 payload:v27];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __140__HMHome_HMModernMessaging__sendModernMessagingRequestWithMessageName_destination_requestPayload_options_responseHandler_completionHandler___block_invoke;
    v57[3] = &unk_1E5941830;
    id v37 = v28;
    id v61 = v28;
    id v58 = v33;
    uint64_t v59 = v56;
    id v60 = v51;
    id v38 = v53;
    id v62 = v53;
    [v36 setResponseHandler:v57];
    id v39 = [(HMHome *)self context];
    id v40 = [v39 messageDispatcher];
    [v40 sendMessage:v36];

    id v21 = v33;
    id v41 = v29;
    id v42 = v37;
    uint64_t v43 = v49;
    id v23 = v51;
    uint64_t v44 = v55;
  }
  else
  {
    id v52 = v17;
    uint64_t v43 = v16;
    uint64_t v44 = v55;
    id v45 = (void *)MEMORY[0x19F3A64A0]();
    id v46 = self;
    id v47 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      uint64_t v48 = v50 = v21;
      *(_DWORD *)buf = 138543618;
      __int16 v64 = v48;
      __int16 v65 = 2080;
      __int16 v66 = "-[HMHome(HMModernMessaging) sendModernMessagingRequestWithMessageName:destination:requestPayload:options:res"
            "ponseHandler:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v47, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

      id v21 = v50;
    }

    id v41 = v15;
    id v42 = v52;
    id v38 = v53;
  }
}

void __140__HMHome_HMModernMessaging__sendModernMessagingRequestWithMessageName_destination_requestPayload_options_responseHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  id v8 = (void *)&unk_19D47B000;
  if (*(void *)(a1 + 56))
  {
    uint64_t v9 = objc_msgSend(v6, "hmf_dataForKey:", @"HMMM.payload.key.payload");
    uint64_t v10 = objc_msgSend(v7, "hmf_stringForKey:", @"HMMM.payload.key.destination.identifier");
    uint64_t v11 = objc_msgSend(v7, "hmf_stringForKey:", @"HMMM.payload.key.destination.uri");
    id v12 = [HMMMClientResponseHandlerOptions alloc];
    uint64_t v24 = (void *)v10;
    id v13 = [[HMMMMessageDestination alloc] initWithIDSIdentifier:v10 idsTokenURI:v11];
    id v14 = [(HMMMClientResponseHandlerOptions *)v12 initWithPeerDestination:v13 messageName:*(void *)(a1 + 32)];

    id v15 = (void *)MEMORY[0x19F3A64A0]();
    id v16 = *(id *)(a1 + 40);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = HMFGetLogIdentifier();
      uint64_t v19 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      __int16 v34 = v18;
      __int16 v35 = 2112;
      uint64_t v36 = v19;
      __int16 v37 = 2112;
      id v38 = v14;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@Response received for HMMT request with message name: %@. Sending response with options: %@", buf, 0x20u);
    }
    uint64_t v20 = [*(id *)(a1 + 48) delegateCaller];
    v28[0] = MEMORY[0x1E4F143A8];
    id v8 = &unk_19D47B000;
    v28[1] = 3221225472;
    v28[2] = __140__HMHome_HMModernMessaging__sendModernMessagingRequestWithMessageName_destination_requestPayload_options_responseHandler_completionHandler___block_invoke_2113;
    v28[3] = &unk_1E5944360;
    id v32 = *(id *)(a1 + 56);
    id v29 = v9;
    id v30 = v14;
    id v31 = v5;
    id v21 = v14;
    id v22 = v9;
    [v20 invokeBlock:v28];
  }
  if (*(void *)(a1 + 64))
  {
    id v23 = [*(id *)(a1 + 48) delegateCaller];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = v8[269];
    void v25[2] = __140__HMHome_HMModernMessaging__sendModernMessagingRequestWithMessageName_destination_requestPayload_options_responseHandler_completionHandler___block_invoke_2;
    void v25[3] = &unk_1E59454E8;
    id v27 = *(id *)(a1 + 64);
    id v26 = v5;
    [v23 invokeBlock:v25];
  }
}

uint64_t __140__HMHome_HMModernMessaging__sendModernMessagingRequestWithMessageName_destination_requestPayload_options_responseHandler_completionHandler___block_invoke_2113(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __140__HMHome_HMModernMessaging__sendModernMessagingRequestWithMessageName_destination_requestPayload_options_responseHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)unregisterModernMessagingRequestHandlerWithMessageName:(id)a3 completionHandler:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMHome *)self uuid];
  uint64_t v9 = [v8 UUIDString];
  uint64_t v10 = +[HMMMLogOrigin originWithLogIdentifier:v9];

  uint64_t v11 = (void *)[v6 copy];
  id v12 = [(HMHome *)self context];
  if (v12)
  {
    id v29 = [MEMORY[0x1E4F1CA60] dictionary];
    [v29 setObject:v11 forKeyedSubscript:@"HMMM.payload.key.message.name"];
    id v13 = objc_alloc(MEMORY[0x1E4F65488]);
    id v14 = [(HMHome *)self messageTargetUUID];
    id v28 = (void *)[v13 initWithTarget:v14];

    id v15 = [MEMORY[0x1E4F654B0] messageWithName:@"HMMM.unregister.request.handler" destination:v28 payload:v29];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __102__HMHome_HMModernMessaging__unregisterModernMessagingRequestHandlerWithMessageName_completionHandler___block_invoke;
    v30[3] = &unk_1E59441B0;
    void v30[4] = v10;
    id v16 = v11;
    id v31 = v16;
    id v33 = v7;
    id v32 = v12;
    [v15 setResponseHandler:v30];
    [(HMHome *)self context];
    id v17 = v11;
    id v18 = v6;
    v20 = id v19 = v7;
    [v20 messageDispatcher];
    id v21 = v12;
    v23 = id v22 = v10;
    [v23 sendMessage:v15];

    uint64_t v10 = v22;
    id v12 = v21;

    id v7 = v19;
    id v6 = v18;
    uint64_t v11 = v17;
    [(HMHome *)self _clearRequestHandlerForMessageName:v16];
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x19F3A64A0]();
    id v25 = self;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v35 = v27;
      __int16 v36 = 2080;
      __int16 v37 = "-[HMHome(HMModernMessaging) unregisterModernMessagingRequestHandlerWithMessageName:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __102__HMHome_HMModernMessaging__unregisterModernMessagingRequestHandlerWithMessageName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  uint64_t v10 = v9;
  if (v5)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    id v23 = v11;
    __int16 v24 = 2112;
    uint64_t v25 = v12;
    __int16 v26 = 2112;
    id v27 = v5;
    id v13 = "%{public}@Error while unregistering HMMM request handler for message name: %@, error: %@";
    id v14 = v10;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    uint32_t v16 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v17 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v23 = v11;
    __int16 v24 = 2112;
    uint64_t v25 = v17;
    id v13 = "%{public}@Unregistered HMMM request handler for message name: %@";
    id v14 = v10;
    os_log_type_t v15 = OS_LOG_TYPE_INFO;
    uint32_t v16 = 22;
  }
  _os_log_impl(&dword_19D1A8000, v14, v15, v13, buf, v16);

LABEL_7:
  if (*(void *)(a1 + 56))
  {
    id v18 = [*(id *)(a1 + 48) delegateCaller];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __102__HMHome_HMModernMessaging__unregisterModernMessagingRequestHandlerWithMessageName_completionHandler___block_invoke_2111;
    v19[3] = &unk_1E59454E8;
    id v21 = *(id *)(a1 + 56);
    id v20 = v5;
    [v18 invokeBlock:v19];
  }
}

uint64_t __102__HMHome_HMModernMessaging__unregisterModernMessagingRequestHandlerWithMessageName_completionHandler___block_invoke_2111(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)registerModernMessagingRequestHandlerWithMessageName:(id)a3 options:(id)a4 requestHandler:(id)a5 completionHandler:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v37 = a5;
  id v35 = a6;
  uint64_t v12 = [(HMHome *)self uuid];
  id v13 = [v12 UUIDString];
  id v14 = +[HMMMLogOrigin originWithLogIdentifier:v13];

  os_log_type_t v15 = (void *)[v10 copy];
  uint32_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "userRestriction"));
  [v16 setObject:v17 forKeyedSubscript:@"HMMM.options.user.restriction"];

  id v18 = [(HMHome *)self context];
  __int16 v36 = v16;
  if (v18)
  {
    [MEMORY[0x1E4F1CA60] dictionary];
    id v19 = v33 = v10;
    [v19 setObject:v15 forKeyedSubscript:@"HMMM.payload.key.message.name"];
    [v19 setObject:v16 forKeyedSubscript:@"HMMM.payload.key.options"];
    id v20 = objc_alloc(MEMORY[0x1E4F65488]);
    id v21 = [(HMHome *)self messageTargetUUID];
    id v32 = (void *)[v20 initWithTarget:v21];

    id v22 = [MEMORY[0x1E4F654B0] messageWithName:@"HMMM.register.request.handler" destination:v32 payload:v19];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    void v38[2] = __123__HMHome_HMModernMessaging__registerModernMessagingRequestHandlerWithMessageName_options_requestHandler_completionHandler___block_invoke;
    v38[3] = &unk_1E59417E0;
    void v38[4] = v14;
    id v39 = v15;
    id v40 = self;
    id v23 = v37;
    id v43 = v37;
    id v41 = v11;
    __int16 v24 = v35;
    id v44 = v35;
    id v42 = v18;
    [v22 setResponseHandler:v38];
    uint64_t v25 = [(HMHome *)self context];
    __int16 v26 = [v25 messageDispatcher];
    [v26 sendMessage:v22];

    id v27 = v36;
    id v10 = v33;
  }
  else
  {
    id v23 = v37;
    uint64_t v28 = (void *)MEMORY[0x19F3A64A0]();
    id v29 = self;
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = id v34 = v10;
      *(_DWORD *)buf = 138543618;
      id v46 = v31;
      __int16 v47 = 2080;
      uint64_t v48 = "-[HMHome(HMModernMessaging) registerModernMessagingRequestHandlerWithMessageName:options:requestHandler:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

      id v10 = v34;
    }

    __int16 v24 = v35;
    id v27 = v36;
  }
}

void __123__HMHome_HMModernMessaging__registerModernMessagingRequestHandlerWithMessageName_options_requestHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      id v20 = v11;
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error while registering HMMM request handler for message name: %@, error: %@", buf, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      id v20 = v13;
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Registered HMMM request handler for message name: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 48) _setRequestHandler:*(void *)(a1 + 72) forMessageName:*(void *)(a1 + 40) withOptions:*(void *)(a1 + 56)];
  }
  if (*(void *)(a1 + 80))
  {
    os_log_type_t v15 = [*(id *)(a1 + 64) delegateCaller];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __123__HMHome_HMModernMessaging__registerModernMessagingRequestHandlerWithMessageName_options_requestHandler_completionHandler___block_invoke_2110;
    v16[3] = &unk_1E59454E8;
    id v18 = *(id *)(a1 + 80);
    id v17 = v5;
    [v15 invokeBlock:v16];
  }
}

uint64_t __123__HMHome_HMModernMessaging__registerModernMessagingRequestHandlerWithMessageName_options_requestHandler_completionHandler___block_invoke_2110(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_clearRequestHandlerForMessageName:(id)a3
{
  id v7 = a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v5 = [(HMHome *)self hmModernMessagingRequestHandlersByMessageName];
  [v5 setObject:0 forKeyedSubscript:v7];

  id v6 = [(HMHome *)self hmModernMessagingOptionsByMessageName];
  [v6 setObject:0 forKeyedSubscript:v7];

  os_unfair_lock_unlock(p_lock);
}

- (void)_setRequestHandler:(id)a3 forMessageName:(id)a4 withOptions:(id)a5
{
  aBlocuint64_t k = a3;
  id v8 = a4;
  id v9 = a5;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v11 = _Block_copy(aBlock);
  uint64_t v12 = [(HMHome *)self hmModernMessagingRequestHandlersByMessageName];
  [v12 setObject:v11 forKeyedSubscript:v8];

  id v13 = [(HMHome *)self hmModernMessagingOptionsByMessageName];
  [v13 setObject:v9 forKeyedSubscript:v8];

  os_unfair_lock_unlock(p_lock);
}

- (void)updateMediaPassword:(id)a3 completionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMMediaProfile) updateMediaPassword:completionHandler:]", @"completionHandler"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v20;
      __int16 v29 = 2112;
      id v30 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__HMHome_HMMediaProfile__updateMediaPassword_completionHandler___block_invoke;
    block[3] = &unk_1E5944360;
    id v23 = v6;
    id v24 = self;
    id v26 = v7;
    id v25 = v9;
    dispatch_async(v10, block);

    id v11 = v23;
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
    id v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v15;
      __int16 v29 = 2080;
      id v30 = "-[HMHome(HMMediaProfile) updateMediaPassword:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

void __64__HMHome_HMMediaProfile__updateMediaPassword_completionHandler___block_invoke(id *a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  if (!v2)
  {
    id v4 = 0;
    goto LABEL_6;
  }
  id v23 = 0;
  BOOL v3 = +[HMHome isValidMediaPassword:v2 error:&v23];
  id v4 = v23;
  if (v3)
  {
    id v5 = a1[4];
    if (v5)
    {
      id v24 = @"value";
      id v25 = v5;
      id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
LABEL_7:
      id v7 = (void *)MEMORY[0x1E4F654B0];
      id v8 = [a1[5] messageDestination];
      id v9 = [v7 messageWithName:@"HM.mpw" destination:v8 payload:v6];

      objc_initWeak((id *)location, a1[5]);
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      id v18 = __64__HMHome_HMMediaProfile__updateMediaPassword_completionHandler___block_invoke_2006;
      id v19 = &unk_1E59441D8;
      objc_copyWeak(&v22, (id *)location);
      id v20 = a1[4];
      id v21 = a1[7];
      [v9 setResponseHandler:&v16];
      id v10 = objc_msgSend(a1[6], "messageDispatcher", v16, v17, v18, v19);
      [v10 sendMessage:v9 completionHandler:0];

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)location);
      goto LABEL_11;
    }
LABEL_6:
    id v6 = 0;
    goto LABEL_7;
  }
  id v11 = (void *)MEMORY[0x19F3A64A0]();
  id v12 = a1[5];
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    id v15 = a1[4];
    *(_DWORD *)id location = 138543874;
    *(void *)&location[4] = v14;
    __int16 v27 = 2112;
    id v28 = v15;
    __int16 v29 = 2112;
    id v30 = v4;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid media password, %@, with error: %@", location, 0x20u);
  }
  id v6 = [a1[5] context];
  id v9 = [v6 delegateCaller];
  [v9 callCompletion:a1[7] error:v4];
LABEL_11:
}

void __64__HMHome_HMMediaProfile__updateMediaPassword_completionHandler___block_invoke_2006(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!v6) {
    [WeakRetained setMediaPassword:*(void *)(a1 + 32)];
  }
  if (*(void *)(a1 + 40))
  {
    id v4 = [WeakRetained context];
    id v5 = [v4 delegateCaller];
    [v5 callCompletion:*(void *)(a1 + 40) error:v6];
  }
}

- (void)setMediaPassword:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  mediaPassword = self->_mediaPassword;
  self->_mediaPassword = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)mediaPassword
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_mediaPassword;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)updateMediaPeerToPeerEnabled:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HMHome *)self context];
  if (!v6)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMMediaProfile) updateMediaPeerToPeerEnabled:completionHandler:]", @"completionHandler"];
    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v19;
      __int16 v27 = 2112;
      id v28 = (const char *)v15;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0];
    objc_exception_throw(v20);
  }
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__HMHome_HMMediaProfile__updateMediaPeerToPeerEnabled_completionHandler___block_invoke;
    block[3] = &unk_1E5941750;
    void block[4] = self;
    BOOL v24 = a3;
    id v23 = v6;
    id v22 = v8;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v13;
      __int16 v27 = 2080;
      id v28 = "-[HMHome(HMMediaProfile) updateMediaPeerToPeerEnabled:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v14);
  }
}

void __73__HMHome_HMMediaProfile__updateMediaPeerToPeerEnabled_completionHandler___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F654B0];
  BOOL v3 = (id *)(a1 + 32);
  id v4 = [*(id *)(a1 + 32) messageDestination];
  uint64_t v14 = @"kEnabledKey";
  id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v15[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v7 = [v2 messageWithName:@"HM.p2p" destination:v4 payload:v6];

  objc_initWeak(&location, *v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__HMHome_HMMediaProfile__updateMediaPeerToPeerEnabled_completionHandler___block_invoke_2;
  v9[3] = &unk_1E5941728;
  objc_copyWeak(&v11, &location);
  char v12 = *(unsigned char *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  [v7 setResponseHandler:v9];
  id v8 = [*(id *)(a1 + 40) messageDispatcher];
  [v8 sendMessage:v7 completionHandler:0];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __73__HMHome_HMMediaProfile__updateMediaPeerToPeerEnabled_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v6) {
    [WeakRetained setMediaPeerToPeerEnabled:*(unsigned __int8 *)(a1 + 48)];
  }
  if (*(void *)(a1 + 32))
  {
    id v4 = [WeakRetained context];
    id v5 = [v4 delegateCaller];
    [v5 callCompletion:*(void *)(a1 + 32) error:v6];
  }
}

- (void)setMediaPeerToPeerEnabled:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_mediaPeerToPeerEnabled = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isMediaPeerToPeerEnabled
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_mediaPeerToPeerEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)updateMinimumMediaUserPrivilege:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HMHome *)self context];
  if (!v6)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMMediaProfile) updateMinimumMediaUserPrivilege:completionHandler:]", @"completionHandler"];
    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v19;
      __int16 v27 = 2112;
      id v28 = (const char *)v15;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0];
    objc_exception_throw(v20);
  }
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__HMHome_HMMediaProfile__updateMinimumMediaUserPrivilege_completionHandler___block_invoke;
    block[3] = &unk_1E5945110;
    void block[4] = self;
    int64_t v24 = a3;
    id v23 = v6;
    id v22 = v8;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = self;
    char v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v13;
      __int16 v27 = 2080;
      id v28 = "-[HMHome(HMMediaProfile) updateMinimumMediaUserPrivilege:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v14);
  }
}

void __76__HMHome_HMMediaProfile__updateMinimumMediaUserPrivilege_completionHandler___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F654B0];
  BOOL v3 = (id *)(a1 + 32);
  id v4 = [*(id *)(a1 + 32) messageDestination];
  id v13 = @"kUserPrivilegeLevelKey";
  id v5 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  v14[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  id v7 = [v2 messageWithName:@"HM.mup" destination:v4 payload:v6];

  objc_initWeak(&location, *v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__HMHome_HMMediaProfile__updateMinimumMediaUserPrivilege_completionHandler___block_invoke_2;
  v9[3] = &unk_1E5941778;
  objc_copyWeak(v11, &location);
  v11[1] = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  [v7 setResponseHandler:v9];
  id v8 = [*(id *)(a1 + 40) messageDispatcher];
  [v8 sendMessage:v7 completionHandler:0];

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __76__HMHome_HMMediaProfile__updateMinimumMediaUserPrivilege_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v6) {
    [WeakRetained setMinimumMediaUserPrivilege:*(void *)(a1 + 48)];
  }
  if (*(void *)(a1 + 32))
  {
    id v4 = [WeakRetained context];
    id v5 = [v4 delegateCaller];
    [v5 callCompletion:*(void *)(a1 + 32) error:v6];
  }
}

- (void)setMinimumMediaUserPrivilege:(int64_t)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_minimumMediaUserPrivilege = a3;

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)minimumMediaUserPrivilege
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t minimumMediaUserPrivilege = self->_minimumMediaUserPrivilege;
  os_unfair_lock_unlock(p_lock);
  return minimumMediaUserPrivilege;
}

- (id)accessoryWithIdsIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(HMHome *)self accessories];
  id v6 = (id)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [v9 device];

        if (v10)
        {
          id v11 = [v9 device];
          char v12 = [v11 idsIdentifier];
          char v13 = [v12 isEqual:v4];

          if (v13)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (void)_executeActionSet:(id)a3 activity:(id)a4 reportContext:(id)a5 completionHandler:(id)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v56 = a4;
  id v57 = a5;
  id v59 = a6;
  id v58 = [(HMHome *)self context];
  if (!v59)
  {
    uint64_t v50 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMActionSet) _executeActionSet:activity:reportContext:completionHandler:]", @"completion"];
    id v51 = (void *)MEMORY[0x19F3A64A0]();
    id v52 = self;
    id v53 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      id v54 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v71 = v54;
      __int16 v72 = 2112;
      long long v73 = (const char *)v50;
      _os_log_impl(&dword_19D1A8000, v53, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v55 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v50 userInfo:0];
    objc_exception_throw(v55);
  }
  if (v58)
  {
    if (!v10)
    {
      char v13 = [(HMHome *)self context];
      uint64_t v14 = [v13 delegateCaller];
      uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:20 userInfo:0];
      goto LABEL_11;
    }
    id v11 = [v10 actionSetType];
    if ([v11 isEqualToString:@"HMActionSetTypeTriggerOwned"])
    {
      BOOL v12 = isInternalBuild();

      if (!v12)
      {
        char v13 = [(HMHome *)self context];
        uint64_t v14 = [v13 delegateCaller];
        uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
LABEL_11:
        id v21 = (void *)v15;
        [v14 callCompletion:v59 error:v15];

        goto LABEL_31;
      }
    }
    else
    {
    }
    id v22 = [v10 actionSetType];
    int v23 = [v22 isEqualToString:@"HMActionSetTypeShortcutsComponent"];

    if (v23)
    {
      int64_t v24 = [v10 actions];
      [(HMHome *)self executeActions:v24 completionHandler:v59];

      goto LABEL_31;
    }
    id v25 = [(HMHome *)self currentActionSets];
    int v26 = [v25 containsObject:v10];

    if (v26)
    {
LABEL_16:
      v67[0] = @"kActionSetUUID";
      __int16 v27 = [v10 uuid];
      id v28 = [v27 UUIDString];
      v67[1] = @"kHomeUUID";
      v68[0] = v28;
      uint64_t v29 = [(HMHome *)self uuid];
      id v30 = [v29 UUIDString];
      v68[1] = v30;
      uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:2];
      id v32 = (void *)[v31 mutableCopy];

      id v33 = _dictionaryRepresentationForReportContext(v57);
      [v32 addEntriesFromDictionary:v33];

      id v34 = objc_alloc(MEMORY[0x1E4F65488]);
      id v35 = [(HMHome *)self uuid];
      __int16 v36 = (void *)[v34 initWithTarget:v35];

      id v37 = [MEMORY[0x1E4F654B0] messageWithName:@"kExecuteActionSetRequestKey" destination:v36 payload:v32];
      [v37 setActivity:v56];
      objc_initWeak((id *)buf, self);
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __82__HMHome_HMActionSet___executeActionSet_activity_reportContext_completionHandler___block_invoke;
      v60[3] = &unk_1E5944188;
      objc_copyWeak(&v62, (id *)buf);
      id v61 = v59;
      [v37 setResponseHandler:v60];
      uint64_t v38 = [v58 messageDispatcher];
      [v38 sendMessage:v37];

      objc_destroyWeak(&v62);
      objc_destroyWeak((id *)buf);

      goto LABEL_31;
    }
    if (isInternalBuild())
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v39 = [(HMHome *)self triggers];
      uint64_t v40 = [v39 countByEnumeratingWithState:&v63 objects:v69 count:16];
      if (v40)
      {
        char v41 = 0;
        uint64_t v42 = *(void *)v64;
        do
        {
          for (uint64_t i = 0; i != v40; ++i)
          {
            if (*(void *)v64 != v42) {
              objc_enumerationMutation(v39);
            }
            id v44 = [*(id *)(*((void *)&v63 + 1) + 8 * i) actionSets];
            id v45 = [v10 uuid];
            id v46 = objc_msgSend(v44, "hmf_firstObjectWithUUID:", v45);

            if (v46) {
              char v41 = 1;
            }
          }
          uint64_t v40 = [v39 countByEnumeratingWithState:&v63 objects:v69 count:16];
        }
        while (v40);

        if (v41) {
          goto LABEL_16;
        }
      }
      else
      {
      }
    }
    __int16 v47 = [(HMHome *)self context];
    uint64_t v48 = [v47 delegateCaller];
    uint64_t v49 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:2 userInfo:0];
    [v48 callCompletion:v59 error:v49];

    goto LABEL_31;
  }
  long long v16 = (void *)MEMORY[0x19F3A64A0]();
  long long v17 = self;
  long long v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    id v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v71 = v19;
    __int16 v72 = 2080;
    long long v73 = "-[HMHome(HMActionSet) _executeActionSet:activity:reportContext:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  uint64_t v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
  (*((void (**)(id, void *))v59 + 2))(v59, v20);

LABEL_31:
}

void __82__HMHome_HMActionSet___executeActionSet_activity_reportContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained context];
  id v6 = [v5 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 32) error:v4];
}

- (void)executeActionSet:(HMActionSet *)actionSet completionHandler:(void *)completion
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = actionSet;
  id v8 = completion;
  id v9 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v10 = NSString;
  id v11 = MEMORY[0x19F3A5D00](self, a2);
  BOOL v12 = [v10 stringWithFormat:@"%@, %s:%ld", v11, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/HMHome.m", 8875];
  char v13 = (void *)[v9 initWithName:v12];

  uint64_t v14 = [(HMHome *)self context];
  if (!v8)
  {
    uint64_t v22 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMActionSet) executeActionSet:completionHandler:]", @"completion"];
    int v23 = (void *)MEMORY[0x19F3A64A0]();
    int64_t v24 = self;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v34 = v26;
      __int16 v35 = 2112;
      __int16 v36 = (const char *)v22;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];
    objc_exception_throw(v27);
  }
  uint64_t v15 = v14;
  if (v14)
  {
    long long v16 = [v14 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__HMHome_HMActionSet__executeActionSet_completionHandler___block_invoke;
    block[3] = &unk_1E5944360;
    id v29 = v13;
    id v30 = self;
    uint64_t v31 = v7;
    id v32 = v8;
    dispatch_async(v16, block);

    long long v17 = v29;
  }
  else
  {
    long long v18 = (void *)MEMORY[0x19F3A64A0]();
    id v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v34 = v21;
      __int16 v35 = 2080;
      __int16 v36 = "-[HMHome(HMActionSet) executeActionSet:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    long long v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v8 + 2))(v8, v17);
  }
}

uint64_t __58__HMHome_HMActionSet__executeActionSet_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) begin];
  [*(id *)(a1 + 40) _executeActionSet:*(void *)(a1 + 48) activity:*(void *)(a1 + 32) reportContext:0 completionHandler:*(void *)(a1 + 56)];
  id v2 = *(void **)(a1 + 32);

  return [v2 end];
}

- (void)_removeActionSet:(id)a3 completionHandler:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v30 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMActionSet) _removeActionSet:completionHandler:]", @"clientCompletionHandler"];
    uint64_t v31 = (void *)MEMORY[0x19F3A64A0]();
    id v32 = self;
    id v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      id v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v34;
      __int16 v43 = 2112;
      id v44 = (const char *)v30;
      _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v35 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v30 userInfo:0];
    objc_exception_throw(v35);
  }
  id v9 = (void *)v8;
  if (v8)
  {
    if (!v6)
    {
      BOOL v12 = [(HMHome *)self context];
      char v13 = [v12 delegateCaller];
      uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:20 userInfo:0];
      goto LABEL_13;
    }
    id v10 = [v6 actionSetType];
    int v11 = [v10 isEqualToString:@"HMActionSetTypeTriggerOwned"];

    if (v11)
    {
      BOOL v12 = [(HMHome *)self context];
      char v13 = [v12 delegateCaller];
      uint64_t v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
LABEL_13:
      id v29 = (void *)v14;
      [v13 callCompletion:v7 error:v14];

      goto LABEL_14;
    }
    uint64_t v20 = [(HMHome *)self currentActionSets];
    int v21 = [v20 containsObject:v6];

    if ((v21 & 1) == 0)
    {
      BOOL v12 = [(HMHome *)self context];
      char v13 = [v12 delegateCaller];
      uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:2 userInfo:0];
      goto LABEL_13;
    }
    id v39 = @"kActionSetUUID";
    uint64_t v22 = [v6 uuid];
    int v23 = [v22 UUIDString];
    uint64_t v40 = v23;
    int64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];

    id v25 = (void *)MEMORY[0x1E4F654B0];
    int v26 = [(HMHome *)self messageDestination];
    id v27 = [v25 messageWithName:@"kRemoveActionSetRequestKey" destination:v26 payload:v24];

    objc_initWeak((id *)buf, self);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    void v36[2] = __58__HMHome_HMActionSet___removeActionSet_completionHandler___block_invoke;
    void v36[3] = &unk_1E5944188;
    objc_copyWeak(&v38, (id *)buf);
    id v37 = v7;
    [v27 setResponseHandler:v36];
    id v28 = [v9 messageDispatcher];
    [v28 sendMessage:v27 completionHandler:0];

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
    long long v16 = self;
    long long v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      long long v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v18;
      __int16 v43 = 2080;
      id v44 = "-[HMHome(HMActionSet) _removeActionSet:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v19);
  }
LABEL_14:
}

void __58__HMHome_HMActionSet___removeActionSet_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v9
    || !v5
    || [WeakRetained _handleActionSetRemovedFromResponse:*(void *)(a1 + 32) responsePayload:v5])
  {
    id v7 = [WeakRetained context];
    uint64_t v8 = [v7 delegateCaller];
    [v8 callCompletion:*(void *)(a1 + 32) error:v9];
  }
}

- (void)removeActionSet:(HMActionSet *)actionSet completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = actionSet;
  id v7 = completion;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMActionSet) removeActionSet:completionHandler:]", @"completion"];
    long long v17 = (void *)MEMORY[0x19F3A64A0]();
    long long v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v26 = v20;
      __int16 v27 = 2112;
      id v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__HMHome_HMActionSet__removeActionSet_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    void block[4] = self;
    int v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    int v11 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v12 = self;
    char v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v26 = v14;
      __int16 v27 = 2080;
      id v28 = "-[HMHome(HMActionSet) removeActionSet:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __57__HMHome_HMActionSet__removeActionSet_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeActionSet:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_addActionSetWithName:(id)a3 completionHandler:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v34 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMActionSet) _addActionSetWithName:completionHandler:]", @"clientCompletionHandler"];
    id v35 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v36 = self;
    id v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      id v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v46 = v38;
      __int16 v47 = 2112;
      uint64_t v48 = (const char *)v34;
      _os_log_impl(&dword_19D1A8000, v37, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v39 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v34 userInfo:0];
    objc_exception_throw(v39);
  }
  id v9 = (void *)v8;
  if (v8)
  {
    if (v6)
    {
      unint64_t v10 = [v6 length];
      if (HMMaxLengthForNaming__hmf_once_t7 != -1) {
        dispatch_once(&HMMaxLengthForNaming__hmf_once_t7, &__block_literal_global_55_24575);
      }
      if (v10 > HMMaxLengthForNaming__hmf_once_v8)
      {
        int v11 = (void *)MEMORY[0x19F3A64A0]();
        BOOL v12 = self;
        char v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          uint64_t v14 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v46 = v14;
          _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Action set name is longer than the pre-defined max length", buf, 0xCu);
        }
        uint64_t v15 = [v9 delegateCaller];
        uint64_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:46];
        [v15 callCompletion:v7 actionSet:0 error:v16];

        goto LABEL_17;
      }
      id v25 = [(HMHome *)self actionSetWithName:v6];

      if (!v25)
      {
        __int16 v27 = (void *)MEMORY[0x1E4F654B0];
        id v28 = objc_alloc(MEMORY[0x1E4F65488]);
        uint64_t v29 = [(HMHome *)self uuid];
        uint64_t v30 = (void *)[v28 initWithTarget:v29];
        __int16 v43 = @"kActionSetName";
        id v44 = v6;
        uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        id v32 = [v27 messageWithName:@"kAddActionSetRequestKey" destination:v30 payload:v31];

        objc_initWeak((id *)buf, self);
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __63__HMHome_HMActionSet___addActionSetWithName_completionHandler___block_invoke;
        v40[3] = &unk_1E5944188;
        objc_copyWeak(&v42, (id *)buf);
        id v41 = v7;
        [v32 setResponseHandler:v40];
        id v33 = [v9 messageDispatcher];
        [v33 sendMessage:v32 completionHandler:0];

        objc_destroyWeak(&v42);
        objc_destroyWeak((id *)buf);

        goto LABEL_17;
      }
      uint64_t v22 = [(HMHome *)self context];
      int v23 = [v22 delegateCaller];
      uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:13 userInfo:0];
    }
    else
    {
      uint64_t v22 = [(HMHome *)self context];
      int v23 = [v22 delegateCaller];
      uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:20 userInfo:0];
    }
    int v26 = (void *)v24;
    [v23 callCompletion:v7 actionSet:0 error:v24];

    goto LABEL_17;
  }
  long long v17 = (void *)MEMORY[0x19F3A64A0]();
  long long v18 = self;
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v46 = v20;
    __int16 v47 = 2080;
    uint64_t v48 = "-[HMHome(HMActionSet) _addActionSetWithName:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  id v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
  (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v21);

LABEL_17:
}

void __63__HMHome_HMActionSet___addActionSetWithName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v9
    || !v5
    || [WeakRetained _addActionSetFromResponse:v5 completion:*(void *)(a1 + 32)])
  {
    id v7 = [WeakRetained context];
    uint64_t v8 = [v7 delegateCaller];
    [v8 callCompletion:*(void *)(a1 + 32) actionSet:0 error:v9];
  }
}

- (void)addActionSetWithName:(NSString *)actionSetName completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = actionSetName;
  id v7 = completion;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMActionSet) addActionSetWithName:completionHandler:]", @"completion"];
    long long v17 = (void *)MEMORY[0x19F3A64A0]();
    long long v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v26 = v20;
      __int16 v27 = 2112;
      id v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    unint64_t v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__HMHome_HMActionSet__addActionSetWithName_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    void block[4] = self;
    int v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    int v11 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v12 = self;
    char v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v26 = v14;
      __int16 v27 = 2080;
      id v28 = "-[HMHome(HMActionSet) addActionSetWithName:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void, void *))v7 + 2))(v7, 0, v15);
  }
}

uint64_t __62__HMHome_HMActionSet__addActionSetWithName_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addActionSetWithName:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (HMActionSet)builtinActionSetOfType:(NSString *)actionSetType
{
  id v4 = actionSetType;
  if ([(NSString *)v4 isEqualToString:@"HMActionSetTypeUserDefined"])
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [(HMHome *)self currentActionSets];
    id v5 = [v6 firstItemWithValue:v4 forKey:@"actionSetType"];
  }

  return (HMActionSet *)v5;
}

- (void)retrieveResultsWithReportingContext:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  BOOL v12 = [(HMHome *)self context];
  if (v12)
  {
    if (v10)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F653F0]);
      uint64_t v14 = NSString;
      uint64_t v15 = MEMORY[0x19F3A5D00](self, a2);
      uint64_t v16 = [v14 stringWithFormat:@"%@, %s:%ld", v15, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/HMHome.m", 7951];
      long long v17 = (void *)[v13 initWithName:v16];

      long long v18 = [v12 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __93__HMHome_HMAccessory__retrieveResultsWithReportingContext_progressHandler_completionHandler___block_invoke;
      block[3] = &unk_1E5941548;
      id v27 = v17;
      id v28 = self;
      id v29 = v9;
      id v30 = v10;
      id v31 = v11;
      id v19 = v17;
      dispatch_async(v18, block);

LABEL_10:
      goto LABEL_11;
    }
    id v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = 20;
LABEL_9:
    id v19 = [v24 hmErrorWithCode:v25];
    (*((void (**)(id, id))v11 + 2))(v11, v19);
    goto LABEL_10;
  }
  uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
  id v21 = self;
  uint64_t v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    int v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v33 = v23;
    __int16 v34 = 2080;
    id v35 = "-[HMHome(HMAccessory) retrieveResultsWithReportingContext:progressHandler:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v11)
  {
    id v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = 12;
    goto LABEL_9;
  }
LABEL_11:
}

uint64_t __93__HMHome_HMAccessory__retrieveResultsWithReportingContext_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) begin];
  [*(id *)(a1 + 40) _retrieveResultsWithReportingContext:*(void *)(a1 + 48) progressHandler:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64) activity:*(void *)(a1 + 32)];
  id v2 = *(void **)(a1 + 32);

  return [v2 end];
}

- (void)_retrieveResultsWithReportingContext:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5 activity:(id)a6
{
  id v10 = (void *)MEMORY[0x1E4F1CA60];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [v10 dictionary];
  uint64_t v16 = _dictionaryRepresentationForReportContext(v14);

  [v15 addEntriesFromDictionary:v16];
  long long v17 = [MEMORY[0x1E4F654B0] messageWithName:@"HM.retrieveAsyncResults" messagePayload:v15];
  id v18 = objc_alloc(MEMORY[0x1E4F65488]);
  id v19 = [(HMHome *)self uuid];
  uint64_t v20 = (void *)[v18 initWithTarget:v19];
  [v17 setDestination:v20];

  [v17 setActivity:v11];
  id v21 = [(HMHome *)self __responseHandlerForRequests:0 progressHandler:v13 completionHandler:v12 activity:v11];

  uint64_t v22 = [(HMHome *)self context];
  int v23 = [v22 pendingRequests];

  id v24 = [v17 identifier];
  uint64_t v25 = _Block_copy(v21);
  [v23 addCompletionBlock:v25 forIdentifier:v24];

  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  id v32 = __103__HMHome_HMAccessory___retrieveResultsWithReportingContext_progressHandler_completionHandler_activity___block_invoke;
  id v33 = &unk_1E59455E8;
  id v34 = v23;
  id v35 = v24;
  id v26 = v24;
  id v27 = v23;
  [v17 setResponseHandler:&v30];
  id v28 = [(HMHome *)self context];
  id v29 = [v28 messageDispatcher];
  [v29 sendMessage:v17];
}

void __103__HMHome_HMAccessory___retrieveResultsWithReportingContext_progressHandler_completionHandler_activity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v6 = v3;
    uint64_t v4 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
    id v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t, id, void, void))(v4 + 16))(v4, v6, 0, 0);
    }

    id v3 = v6;
  }
}

- (void)__handleExecuteRequest:(id)a3 activity:(id)a4 batchRequest:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 requests];
  unint64_t v12 = [v11 count];

  if (v12 < 2)
  {
    long long v17 = [v8 actionSet];
    id v19 = [v10 reportContext];
    uint64_t v20 = [v10 completionHandler];
    [(HMHome *)self _executeActionSet:v17 activity:v9 reportContext:v19 completionHandler:v20];
  }
  else
  {
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v21 = 138543618;
      uint64_t v22 = v16;
      __int16 v23 = 2048;
      unint64_t v24 = v12;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Batch execute request does not support multiple requests - have %lu", (uint8_t *)&v21, 0x16u);
    }
    long long v17 = [v10 completionHandler];
    id v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    ((void (**)(void, void *))v17)[2](v17, v18);
  }
}

- (void)performBatchRequest:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v7 = NSString;
  id v8 = MEMORY[0x19F3A5D00](self, a2);
  id v9 = [v7 stringWithFormat:@"%@, %s:%ld", v8, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/HMHome.m", 7631];
  id v10 = (void *)[v6 initWithName:v9];

  uint64_t v11 = [v5 completionHandler];
  if (!v11
    || (unint64_t v12 = (void *)v11,
        [v5 progressHandler],
        id v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        !v13))
  {
    id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v22);
  }
  id v14 = [(HMHome *)self context];
  if (v14)
  {
    [v10 begin];
    [(HMHome *)self _performBatchRequest:v5 activity:v10];
    [v10 end];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v16 = self;
    long long v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      unint64_t v24 = v18;
      __int16 v25 = 2080;
      id v26 = "-[HMHome(HMAccessory) performBatchRequest:]";
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v19 = [v5 completionHandler];

    if (v19)
    {
      uint64_t v20 = [v5 completionHandler];
      int v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
      ((void (**)(void, void *))v20)[2](v20, v21);
    }
  }
}

- (void)unblockAccessory:(HMAccessory *)accessory completionHandler:(void *)completion
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = accessory;
  id v7 = completion;
  id v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMAccessory) unblockAccessory:completionHandler:]", @"completion"];
    long long v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v25 = v20;
      __int16 v26 = 2112;
      uint64_t v27 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__HMHome_HMAccessory__unblockAccessory_completionHandler___block_invoke;
    block[3] = &unk_1E59454E8;
    void block[4] = self;
    id v23 = v7;
    dispatch_async(v10, block);

    uint64_t v11 = v23;
  }
  else
  {
    unint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v25 = v15;
      __int16 v26 = 2080;
      uint64_t v27 = "-[HMHome(HMAccessory) unblockAccessory:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v11);
  }
}

void __58__HMHome_HMAccessory__unblockAccessory_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id v3 = [*(id *)(a1 + 32) context];
    id v2 = [v3 delegateCaller];
    [v2 callCompletion:*(void *)(a1 + 40) error:0];
  }
}

- (NSArray)servicesWithTypes:(NSArray *)serviceTypes
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = serviceTypes;
  id v5 = v4;
  if (v4 && [(NSArray *)v4 count])
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = [(HMHome *)self accessories];
    uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v22)
    {
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v9 = [v8 services];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v24 != v12) {
                  objc_enumerationMutation(v9);
                }
                id v14 = *(void **)(*((void *)&v23 + 1) + 8 * j);
                uint64_t v15 = [v14 serviceType];
                BOOL v16 = [(NSArray *)v5 containsObject:v15];

                if (v16) {
                  [v6 addObject:v14];
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v11);
          }
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v22);
    }

    if ([v6 count]) {
      long long v17 = v6;
    }
    else {
      long long v17 = 0;
    }
    id v18 = v17;
  }
  else
  {
    id v18 = 0;
  }

  return (NSArray *)v18;
}

- (void)_assignAccessory:(id)a3 toRoom:(id)a4 completionHandler:(id)a5
{
  id v12 = a5;
  if (a3 && a4)
  {
    [a3 _updateRoom:a4 completionHandler:v12];
    id v8 = v12;
  }
  else
  {
    id v9 = [(HMHome *)self context];
    uint64_t v10 = [v9 delegateCaller];
    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:20 userInfo:0];
    [v10 callCompletion:v12 error:v11];

    id v8 = v9;
  }
}

- (void)assignAccessory:(HMAccessory *)accessory toRoom:(HMRoom *)room completionHandler:(void *)completion
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = accessory;
  id v9 = room;
  uint64_t v10 = completion;
  uint64_t v11 = [(HMHome *)self context];
  if (!v10)
  {
    uint64_t v19 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMAccessory) assignAccessory:toRoom:completionHandler:]", @"completion"];
    uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v21 = self;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      long long v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v30 = v23;
      __int16 v31 = 2112;
      id v32 = (const char *)v19;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0];
    objc_exception_throw(v24);
  }
  id v12 = v11;
  if (v11)
  {
    id v13 = [v11 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__HMHome_HMAccessory__assignAccessory_toRoom_completionHandler___block_invoke;
    block[3] = &unk_1E5944360;
    void block[4] = self;
    long long v26 = v8;
    long long v27 = v9;
    id v28 = v10;
    dispatch_async(v13, block);
  }
  else
  {
    id v14 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v15 = self;
    BOOL v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      long long v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v30 = v17;
      __int16 v31 = 2080;
      id v32 = "-[HMHome(HMAccessory) assignAccessory:toRoom:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v10 + 2))(v10, v18);
  }
}

uint64_t __64__HMHome_HMAccessory__assignAccessory_toRoom_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _assignAccessory:*(void *)(a1 + 40) toRoom:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)_removeAccessory:(id)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMHome *)self context];
  id v9 = v8;
  if (v8)
  {
    if (v6)
    {
      uint64_t v10 = [(HMHome *)self uuid];
      id v24 = @"kAccessoryUUID";
      uint64_t v11 = [v6 uuid];
      id v12 = [v11 UUIDString];
      long long v25 = v12;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __58__HMHome_HMAccessory___removeAccessory_completionHandler___block_invoke;
      v20[3] = &unk_1E5945510;
      id v21 = v9;
      uint64_t v22 = self;
      id v23 = v7;
      -[_HMContext sendMessage:target:payload:responseHandler:](v21, @"kRemoveAccessoryRequestKey", v10, v13, v20);

      goto LABEL_10;
    }
    id v18 = [v8 delegateCaller];
    uint64_t v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v18 callCompletion:v7 error:v19];

LABEL_9:
    goto LABEL_10;
  }
  id v14 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v15 = self;
  BOOL v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    long long v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v27 = v17;
    __int16 v28 = 2080;
    long long v29 = "-[HMHome(HMAccessory) _removeAccessory:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v7)
  {
    id v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v18);
    goto LABEL_9;
  }
LABEL_10:
}

void __58__HMHome_HMAccessory___removeAccessory_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  if (v9)
  {
    id v5 = [*(id *)(a1 + 32) delegateCaller];
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = v9;
  }
  else
  {
    [*(id *)(a1 + 40) _handleAccessoryRemovedResponse:a3];
    id v5 = [*(id *)(a1 + 32) delegateCaller];
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = 0;
  }
  [v5 callCompletion:v7 error:v8];
}

- (void)removeAccessory:(HMAccessory *)accessory completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = accessory;
  uint64_t v7 = completion;
  id v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMAccessory) removeAccessory:completionHandler:]", @"completion"];
    long long v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v26 = v20;
      __int16 v27 = 2112;
      __int16 v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__HMHome_HMAccessory__removeAccessory_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    void block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v26 = v14;
      __int16 v27 = 2080;
      __int16 v28 = "-[HMHome(HMAccessory) removeAccessory:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __57__HMHome_HMAccessory__removeAccessory_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeAccessory:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_cancelPairingForAccessoryWithDescription:(id)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMHome *)self context];
  if (v8)
  {
    if (v6)
    {
      uint64_t v9 = encodeRootObject(v6);
      uint64_t v10 = (void *)v9;
      if (v9)
      {
        uint64_t v30 = @"kAccessoryDescriptionDataKey";
        uint64_t v31 = v9;
        uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        id v12 = objc_alloc(MEMORY[0x1E4F654B0]);
        id v13 = objc_alloc(MEMORY[0x1E4F65488]);
        id v14 = [(HMHome *)self uuid];
        uint64_t v15 = (void *)[v13 initWithTarget:v14];
        uint64_t v16 = (void *)[v12 initWithName:@"kCancelPairingAccessoryRequestKey" destination:v15 payload:v11];

        uint64_t v24 = MEMORY[0x1E4F143A8];
        uint64_t v25 = 3221225472;
        long long v26 = __83__HMHome_HMAccessory___cancelPairingForAccessoryWithDescription_completionHandler___block_invoke;
        __int16 v27 = &unk_1E5944EF0;
        id v17 = v8;
        id v28 = v17;
        id v29 = v7;
        [v16 setResponseHandler:&v24];
        id v18 = objc_msgSend(v17, "messageDispatcher", v24, v25, v26, v27);
        [v18 sendMessage:v16];
      }
      else
      {
        uint64_t v11 = [(HMHome *)self context];
        uint64_t v16 = [v11 delegateCaller];
        id v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
        [v16 callCompletion:v7 error:v23];
      }
    }
    else
    {
      uint64_t v10 = [(HMHome *)self context];
      uint64_t v11 = [v10 delegateCaller];
      uint64_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v11 callCompletion:v7 error:v16];
    }
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v22;
      __int16 v34 = 2080;
      id v35 = "-[HMHome(HMAccessory) _cancelPairingForAccessoryWithDescription:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __83__HMHome_HMAccessory___cancelPairingForAccessoryWithDescription_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegateCaller];
  [v5 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (void)cancelPairingForAccessoryWithDescription:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMAccessory) cancelPairingForAccessoryWithDescription:completionHandler:]", @"completion"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v26 = v20;
      __int16 v27 = 2112;
      id v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__HMHome_HMAccessory__cancelPairingForAccessoryWithDescription_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    void block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v26 = v14;
      __int16 v27 = 2080;
      id v28 = "-[HMHome(HMAccessory) cancelPairingForAccessoryWithDescription:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __82__HMHome_HMAccessory__cancelPairingForAccessoryWithDescription_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelPairingForAccessoryWithDescription:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)userDidRespondToConsentRequestForSetupAccessoryDescription:(id)a3 withResponse:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HMHome *)self context];
  if (v7)
  {
    uint64_t v8 = encodeRootObject(v6);
    uint64_t v9 = (void *)v8;
    if (v8)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F65480];
      uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", a4, @"kAccessoryDescriptionDataKey", @"HMHomeUserConsentResponseForAccessoryMessageKey", v8);
      v24[1] = v11;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:2];
      id v13 = [v10 messageWithName:@"HMHomeUserConsentForAccessoryReplacementRequestKey" messagePayload:v12];

      id v14 = [v7 messageDispatcher];
      uint64_t v15 = [(HMHome *)self uuid];
      [v14 sendMessage:v13 target:v15 andInvokeCompletionHandler:&__block_literal_global_1801];
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v26 = v22;
        _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@unable to encode accessory description in user consent response", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v26 = v19;
      __int16 v27 = 2080;
      id v28 = "-[HMHome(HMAccessory) userDidRespondToConsentRequestForSetupAccessoryDescription:withResponse:]";
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

- (void)_startPairingWithAccessoryDescription:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (char *)a3;
  id v53 = a4;
  id v54 = a5;
  uint64_t v10 = [(HMHome *)self context];
  uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  id v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v67 = v15;
      __int16 v68 = 2112;
      long long v69 = v9;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Starting pairing with accessory description: %@", buf, 0x16u);
    }
    if (v9)
    {
      id v52 = encodeRootObject(v9);
      if (v52)
      {
        id v51 = [v9 appIdentifier];
        if (!v51)
        {
          uint64_t v16 = [MEMORY[0x1E4F28B50] mainBundle];
          id v51 = [v16 bundleIdentifier];
        }
        v64[0] = @"kAccessoryDescriptionDataKey";
        v64[1] = @"kAccessorySetupCodeDeferredKey";
        v65[0] = v52;
        v65[1] = MEMORY[0x1E4F1CC38];
        v64[2] = @"kAccessorySetupRetryKey";
        id v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "retry"));
        v65[2] = v17;
        uint64_t v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:3];

        id v18 = (void *)MEMORY[0x1E4F654B0];
        uint64_t v19 = [(HMHome *)v12 messageDestination];
        uint64_t v20 = [v18 messageWithName:@"kAddAccessoryRequestKey" destination:v19 payload:v50];

        id v21 = [v9 setupAccessoryPayload];
        id v22 = objc_alloc(MEMORY[0x1E4F653F0]);
        uint64_t v23 = NSString;
        id v24 = MEMORY[0x19F3A5D00](v12, a2);
        uint64_t v25 = [v23 stringWithFormat:@"%@, %s:%ld", v24, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/HMHome.m", 7420];
        long long v26 = (void *)[v22 initWithName:v25];

        [(HMHome *)v12 uuid];
        [v21 categoryNumber];

        if (v21) {
          [v21 supportsBTLE];
        }
        [v20 setActivity:v26];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __95__HMHome_HMAccessory___startPairingWithAccessoryDescription_progressHandler_completionHandler___block_invoke;
        aBlock[3] = &unk_1E5941660;
        id v49 = v26;
        id v61 = v49;
        id v62 = v12;
        id v63 = v54;
        __int16 v27 = _Block_copy(aBlock);
        id v28 = [(HMHome *)v12 context];
        uint64_t v29 = [v28 pendingRequests];

        uint64_t v30 = [v20 identifier];
        uint64_t v31 = _Block_copy(v53);
        id v32 = _Block_copy(v27);
        [v29 addAccessoryDescription:v9 progressBlock:v31 andCompletionBlock:v32 forIdentifier:v30];

        objc_initWeak((id *)buf, v12);
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __95__HMHome_HMAccessory___startPairingWithAccessoryDescription_progressHandler_completionHandler___block_invoke_2;
        v55[3] = &unk_1E5944978;
        objc_copyWeak(&v59, (id *)buf);
        id v33 = v29;
        id v56 = v33;
        id v34 = v30;
        id v57 = v34;
        id v35 = v27;
        id v58 = v35;
        [v20 setResponseHandler:v55];
        uint64_t v36 = [v10 messageDispatcher];
        [v36 sendMessage:v20 completionHandler:0];

        objc_destroyWeak(&v59);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        uint64_t v45 = (void *)MEMORY[0x19F3A64A0]();
        id v46 = v12;
        __int16 v47 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          uint64_t v48 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v67 = v48;
          __int16 v68 = 2112;
          long long v69 = v9;
          _os_log_impl(&dword_19D1A8000, v47, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode accessory description: %@", buf, 0x16u);
        }
        id v51 = [(HMHome *)v46 context];
        uint64_t v50 = [v51 delegateCaller];
        uint64_t v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
        [v50 callCompletion:v54 array:0 additionalAccessoryInfo:0 error:v20];
      }
    }
    else
    {
      id v38 = (void *)MEMORY[0x19F3A64A0]();
      id v39 = v12;
      uint64_t v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        id v41 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v67 = v41;
        _os_log_impl(&dword_19D1A8000, v40, OS_LOG_TYPE_ERROR, "%{public}@Cannot start pairing with nil accessory description", buf, 0xCu);
      }
      id v42 = [(HMHome *)v39 context];
      __int16 v43 = [v42 delegateCaller];
      id v44 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v43 callCompletion:v54 array:0 additionalAccessoryInfo:0 error:v44];
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v37 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v67 = v37;
      __int16 v68 = 2080;
      long long v69 = "-[HMHome(HMAccessory) _startPairingWithAccessoryDescription:progressHandler:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __95__HMHome_HMAccessory___startPairingWithAccessoryDescription_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  [v7 begin];
  [*(id *)(a1 + 40) uuid];

  [v8 domain];
  [v8 code];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  uint64_t v11 = *(void **)(a1 + 32);

  return [v11 end];
}

void __95__HMHome_HMAccessory___startPairingWithAccessoryDescription_progressHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v8)
  {
    uint64_t v4 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
    id v5 = (void *)v4;
    if (WeakRetained && v4)
    {
      id v6 = [WeakRetained context];
      id v7 = [v6 delegateCaller];
      [v7 callCompletion:*(void *)(a1 + 48) array:0 additionalAccessoryInfo:0 error:v8];
    }
  }
}

- (void)startPairingWithAccessoryDescription:(id)a3 progress:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v19);
  }
  uint64_t v11 = v10;
  id v12 = [(HMHome *)self context];
  id v13 = v12;
  if (v12)
  {
    id v14 = [v12 queue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __80__HMHome_HMAccessory__startPairingWithAccessoryDescription_progress_completion___block_invoke;
    v20[3] = &unk_1E5941610;
    void v20[4] = self;
    id v21 = v8;
    id v22 = v9;
    id v23 = v11;
    dispatch_async(v14, v20);
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v18;
      __int16 v26 = 2080;
      __int16 v27 = "-[HMHome(HMAccessory) startPairingWithAccessoryDescription:progress:completion:]";
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __80__HMHome_HMAccessory__startPairingWithAccessoryDescription_progress_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startPairingWithAccessoryDescription:*(void *)(a1 + 40) progressHandler:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)stopDiscoveringSymptomsForNearbyDevices
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMHome *)self context];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F65480] messageWithName:@"kStopDiscoveringSymptomsForNearbyDevicesRequestKey" messagePayload:0];
    id v5 = [v3 messageDispatcher];
    id v6 = [(HMHome *)self uuid];
    [v5 sendMessage:v4 target:v6];
  }
  else
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      id v12 = v10;
      __int16 v13 = 2080;
      id v14 = "-[HMHome(HMAccessory) stopDiscoveringSymptomsForNearbyDevices]";
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (id)__defaultProgressHandlerForAddAccessory
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__HMHome_HMAccessory____defaultProgressHandlerForAddAccessory__block_invoke;
  v5[3] = &unk_1E5941638;
  objc_copyWeak(&v6, &location);
  id v2 = _Block_copy(v5);
  id v3 = _Block_copy(v2);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

void __62__HMHome_HMAccessory____defaultProgressHandlerForAddAccessory__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a3 == 6)
    {
      uint64_t v7 = 1;
    }
    else
    {
      if (a3 != 9) {
        goto LABEL_7;
      }
      uint64_t v7 = 3;
    }
    [WeakRetained userDidRespondToConsentRequestForSetupAccessoryDescription:v8 withResponse:v7];
  }
LABEL_7:
}

- (void)addAccessoryWithAccessorySetupPayload:(id)a3 progress:(id)a4 completionHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v19);
  }
  int v11 = v10;
  id v12 = [(HMHome *)self context];
  __int16 v13 = v12;
  if (v12)
  {
    id v14 = [v12 queue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __88__HMHome_HMAccessory__addAccessoryWithAccessorySetupPayload_progress_completionHandler___block_invoke;
    v20[3] = &unk_1E5941610;
    void v20[4] = self;
    id v21 = v8;
    id v22 = v9;
    id v23 = v11;
    dispatch_async(v14, v20);
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v18;
      __int16 v26 = 2080;
      __int16 v27 = "-[HMHome(HMAccessory) addAccessoryWithAccessorySetupPayload:progress:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __88__HMHome_HMAccessory__addAccessoryWithAccessorySetupPayload_progress_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) internalSetupPayload];
    uint64_t v7 = [*(id *)(a1 + 40) ownershipToken];
    *(_DWORD *)buf = 138543874;
    uint64_t v20 = v5;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Adding accessory with setup payload: %@ ownership token: %@", buf, 0x20u);
  }
  id v8 = [HMSetupAccessoryDescription alloc];
  id v9 = [*(id *)(a1 + 40) internalSetupPayload];
  id v10 = [MEMORY[0x1E4F28B50] mainBundle];
  int v11 = [v10 bundleIdentifier];
  id v12 = [*(id *)(a1 + 32) uuid];
  __int16 v13 = [*(id *)(a1 + 40) ownershipToken];
  id v14 = [(HMSetupAccessoryDescription *)v8 initWithSetupAccessoryPayload:v9 appID:v11 homeUUID:v12 ownershipToken:v13];

  uint64_t v15 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __88__HMHome_HMAccessory__addAccessoryWithAccessorySetupPayload_progress_completionHandler___block_invoke_1793;
  v17[3] = &unk_1E59415E8;
  void v17[4] = v15;
  uint64_t v16 = *(void *)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  [v15 _startPairingWithAccessoryDescription:v14 progressHandler:v16 completionHandler:v17];
}

void __88__HMHome_HMAccessory__addAccessoryWithAccessorySetupPayload_progress_completionHandler___block_invoke_1793(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a4;
  id v8 = a2;
  id v10 = [v6 context];
  id v9 = [v10 delegateCaller];
  [v9 callCompletion:*(void *)(a1 + 40) error:v7 array:v8];
}

- (void)establishShareWithHomeOwner:(id)a3 container:(id)a4 allowWriteAccess:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v12)
  {
    __int16 v21 = (void *)MEMORY[0x19F3A64A0]();
    id v22 = self;
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v32 = v24;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@nil completion", buf, 0xCu);
    }
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v25);
  }
  __int16 v13 = v12;
  id v14 = [(HMHome *)self context];
  uint64_t v15 = v14;
  if (v14)
  {
    uint64_t v16 = [v14 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__HMHome_HMAccessory__establishShareWithHomeOwner_container_allowWriteAccess_completionHandler___block_invoke;
    block[3] = &unk_1E5941F40;
    void block[4] = self;
    id v29 = v13;
    id v27 = v10;
    id v28 = v11;
    BOOL v30 = a5;
    dispatch_async(v16, block);
  }
  else
  {
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v32 = v20;
      __int16 v33 = 2080;
      id v34 = "-[HMHome(HMAccessory) establishShareWithHomeOwner:container:allowWriteAccess:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __96__HMHome_HMAccessory__establishShareWithHomeOwner_container_allowWriteAccess_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) owner];
  uint64_t v3 = [*(id *)(a1 + 32) currentUser];
  uint64_t v4 = (void *)v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      int v18 = 138543874;
      id v19 = v9;
      __int16 v20 = 2112;
      __int16 v21 = v2;
      __int16 v22 = 2112;
      __int16 v23 = v4;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Owner %@ or current user %@ is not known.", (uint8_t *)&v18, 0x20u);
    }
    uint64_t v10 = *(void *)(a1 + 56);
    id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Owner or current user not known" reason:@"Need owner and current user" suggestion:0];
    (*(void (**)(uint64_t, void, HMUserCloudShareWithOwnerOperation *))(v10 + 16))(v10, 0, v11);
  }
  else
  {
    id v11 = [[HMUserCloudShareWithOwnerOperation alloc] initWithShare:*(void *)(a1 + 40) container:*(void *)(a1 + 48) ownerUser:v2 allowWriteAccess:*(unsigned __int8 *)(a1 + 64) currentUser:v3];
    id v12 = (void *)MEMORY[0x19F3A64A0]([(HMUserCloudShareWithOwnerOperation *)v11 setCompletion:*(void *)(a1 + 56)]);
    id v13 = *(id *)(a1 + 32);
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v18 = 138543362;
      id v19 = v16;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Adding establish share with home owner cloud share operation.", (uint8_t *)&v18, 0xCu);
    }
    id v17 = [*(id *)(a1 + 32) shareWithHomeOwnerOperationQueue];
    [v17 addOperation:v11];
  }
}

- (void)establishShareWithHomeOwner:(id)a3 container:(id)a4 completionHandler:(id)a5
{
}

- (void)shareWithHomeOwner:(id)a3 container:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__HMHome_HMAccessory__shareWithHomeOwner_container_completionHandler___block_invoke;
  v10[3] = &unk_1E59415C0;
  id v11 = v8;
  id v9 = v8;
  [(HMHome *)self establishShareWithHomeOwner:a3 container:a4 completionHandler:v10];
}

void __70__HMHome_HMAccessory__shareWithHomeOwner_container_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v8 = [v6 participant];
  id v7 = [v6 ownerUser];

  (*(void (**)(uint64_t, id, void *, id))(v4 + 16))(v4, v8, v7, v5);
}

- (void)addAndSetUpNewAccessoriesWithSuggestedRoomName:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  id v7 = a4;
  if (!v7)
  {
    id v26 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v26);
  }
  id v8 = v7;
  id v9 = [(HMHome *)self context];
  uint64_t v10 = (void *)MEMORY[0x19F3A64A0]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v14;
      __int16 v32 = 2112;
      __int16 v33 = v6;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Adding and setting up accessories with suggested room name: %@", buf, 0x16u);
    }
    uint64_t v15 = objc_alloc_init(HMAccessorySetupRequest);
    uint64_t v16 = [(HMHome *)v11 uniqueIdentifier];
    [(HMAccessorySetupRequest *)v15 setHomeUniqueIdentifier:v16];

    if (v6)
    {
      id v17 = [(HMHome *)v11 roomWithName:v6];
      int v18 = v17;
      if (v17)
      {
        id v19 = [v17 uniqueIdentifier];
        [(HMAccessorySetupRequest *)v15 setSuggestedRoomUniqueIdentifier:v19];
      }
      else
      {
        __int16 v21 = (void *)MEMORY[0x19F3A64A0]();
        __int16 v22 = v11;
        __int16 v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          uint64_t v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v31 = v24;
          __int16 v32 = 2112;
          __int16 v33 = v6;
          _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Could not find room with name: %@", buf, 0x16u);
        }
      }
    }
    id v25 = objc_alloc_init(HMAccessorySetupManager);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __88__HMHome_HMAccessory__addAndSetUpNewAccessoriesWithSuggestedRoomName_completionHandler___block_invoke;
    v27[3] = &unk_1E5942148;
    void v27[4] = v11;
    id v28 = v9;
    id v29 = v8;
    [(HMAccessorySetupManager *)v25 performAccessorySetupUsingRequest:v15 completionHandler:v27];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v20;
      __int16 v32 = 2080;
      __int16 v33 = "-[HMHome(HMAccessory) addAndSetUpNewAccessoriesWithSuggestedRoomName:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __88__HMHome_HMAccessory__addAndSetUpNewAccessoriesWithSuggestedRoomName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 accessoryUniqueIdentifiers];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __88__HMHome_HMAccessory__addAndSetUpNewAccessoriesWithSuggestedRoomName_completionHandler___block_invoke_1784;
    v15[3] = &unk_1E59434B0;
    void v15[4] = *(void *)(a1 + 32);
    id v8 = objc_msgSend(v7, "na_map:", v15);

    id v9 = [*(id *)(a1 + 40) delegateCaller];
    [v9 callCompletion:*(void *)(a1 + 48) error:0 array:v8];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v17 = v13;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform accessory setup with suggested room name: %@", buf, 0x16u);
    }
    id v14 = [*(id *)(a1 + 40) delegateCaller];
    [v14 callCompletion:*(void *)(a1 + 48) error:v6 array:0];
  }
}

uint64_t __88__HMHome_HMAccessory__addAndSetUpNewAccessoriesWithSuggestedRoomName_completionHandler___block_invoke_1784(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) accessoryWithUniqueIdentifier:a2];
}

- (void)addAndSetupAccessoriesWithPayload:(HMAccessorySetupPayload *)payload completionHandler:(void *)completion
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = payload;
  id v7 = completion;
  if (!v7)
  {
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v21);
  }
  id v8 = v7;
  id v9 = [(HMHome *)self context];
  uint64_t v10 = (void *)MEMORY[0x19F3A64A0]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      uint64_t v15 = [(HMAccessorySetupPayload *)v6 internalSetupPayload];
      uint64_t v16 = [(HMAccessorySetupPayload *)v6 ownershipToken];
      *(_DWORD *)buf = 138543874;
      id v26 = v14;
      __int16 v27 = 2112;
      id v28 = v15;
      __int16 v29 = 2112;
      BOOL v30 = v16;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Adding and setting up accessories with setup payload: %@ ownership token: %@", buf, 0x20u);
    }
    id v17 = objc_alloc_init(HMAccessorySetupRequest);
    __int16 v18 = [(HMHome *)v11 uniqueIdentifier];
    [(HMAccessorySetupRequest *)v17 setHomeUniqueIdentifier:v18];

    [(HMAccessorySetupRequest *)v17 setPayload:v6];
    id v19 = objc_alloc_init(HMAccessorySetupManager);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __75__HMHome_HMAccessory__addAndSetupAccessoriesWithPayload_completionHandler___block_invoke;
    v22[3] = &unk_1E5942148;
    void v22[4] = v11;
    id v23 = v9;
    id v24 = v8;
    [(HMAccessorySetupManager *)v19 performAccessorySetupUsingRequest:v17 completionHandler:v22];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v20;
      __int16 v27 = 2080;
      id v28 = "-[HMHome(HMAccessory) addAndSetupAccessoriesWithPayload:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __75__HMHome_HMAccessory__addAndSetupAccessoriesWithPayload_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 accessoryUniqueIdentifiers];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __75__HMHome_HMAccessory__addAndSetupAccessoriesWithPayload_completionHandler___block_invoke_1782;
    v15[3] = &unk_1E59434B0;
    void v15[4] = *(void *)(a1 + 32);
    id v8 = objc_msgSend(v7, "na_map:", v15);

    id v9 = [*(id *)(a1 + 40) delegateCaller];
    [v9 callCompletion:*(void *)(a1 + 48) obj:v8 error:0];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v17 = v13;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform accessory setup with setup payload: %@", buf, 0x16u);
    }
    id v14 = [*(id *)(a1 + 40) delegateCaller];
    [v14 callCompletion:*(void *)(a1 + 48) obj:0 error:v6];
  }
}

uint64_t __75__HMHome_HMAccessory__addAndSetupAccessoriesWithPayload_completionHandler___block_invoke_1782(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) accessoryWithUniqueIdentifier:a2];
}

- (void)addAndSetupAccessoriesWithCompletionHandler:(void *)completion
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = completion;
  uint64_t v5 = [(HMHome *)self context];
  if (!v4)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMAccessory) addAndSetupAccessoriesWithCompletionHandler:]", @"completion"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v25 = v20;
      __int16 v26 = 2112;
      __int16 v27 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v6 = (void *)v5;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  uint64_t v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v25 = v11;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding and setting up accessories", buf, 0xCu);
    }
    id v12 = objc_alloc_init(HMAccessorySetupRequest);
    id v13 = [(HMHome *)v8 uniqueIdentifier];
    [(HMAccessorySetupRequest *)v12 setHomeUniqueIdentifier:v13];

    id v14 = objc_alloc_init(HMAccessorySetupManager);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __67__HMHome_HMAccessory__addAndSetupAccessoriesWithCompletionHandler___block_invoke;
    v22[3] = &unk_1E5941598;
    void v22[4] = v8;
    id v23 = v4;
    [(HMAccessorySetupManager *)v14 performAccessorySetupUsingRequest:v12 completionHandler:v22];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v25 = v15;
      __int16 v26 = 2080;
      __int16 v27 = "-[HMHome(HMAccessory) addAndSetupAccessoriesWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, HMAccessorySetupRequest *))v4 + 2))(v4, v12);
  }
}

void __67__HMHome_HMAccessory__addAndSetupAccessoriesWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v7 = [v4 context];
  id v6 = [v7 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 40) error:v5];
}

- (void)_continuePairingForAccessoryWithUUID:(id)a3 setupCode:(id)a4 onboardingSetupPayloadString:(id)a5 completionHandler:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(HMHome *)self context];
  if (v14)
  {
    v34[0] = @"kAccessoryUUID";
    v34[1] = @"kAccessoryPairingPasswordKey";
    v35[0] = v10;
    v35[1] = v11;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    uint64_t v16 = (void *)[v15 mutableCopy];

    [v16 setObject:v12 forKeyedSubscript:@"kAccessoryOnboardingSetupPayloadStringKey"];
    id v17 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v18 = objc_alloc(MEMORY[0x1E4F65488]);
    id v19 = [(HMHome *)self uuid];
    uint64_t v20 = (void *)[v18 initWithTarget:v19];
    id v21 = (void *)[v17 initWithName:@"kContinuePairingAccessoryRequestKey" destination:v20 payload:v16];

    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    BOOL v30 = __117__HMHome_HMAccessory___continuePairingForAccessoryWithUUID_setupCode_onboardingSetupPayloadString_completionHandler___block_invoke;
    uint64_t v31 = &unk_1E5944EF0;
    id v22 = v14;
    id v32 = v22;
    id v33 = v13;
    [v21 setResponseHandler:&v28];
    id v23 = objc_msgSend(v22, "messageDispatcher", v28, v29, v30, v31);
    [v23 sendMessage:v21];
  }
  else
  {
    id v24 = (void *)MEMORY[0x19F3A64A0]();
    id v25 = self;
    __int16 v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      __int16 v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v37 = v27;
      __int16 v38 = 2080;
      id v39 = "-[HMHome(HMAccessory) _continuePairingForAccessoryWithUUID:setupCode:onboardingSetupPayloadString:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __117__HMHome_HMAccessory___continuePairingForAccessoryWithUUID_setupCode_onboardingSetupPayloadString_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegateCaller];
  [v5 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (void)continuePairingForAccessoryWithUUID:(id)a3 setupCode:(id)a4 onboardingSetupPayloadString:(id)a5 completionHandler:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(HMHome *)self context];
  if (!v13)
  {
    uint64_t v22 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMAccessory) continuePairingForAccessoryWithUUID:setupCode:onboardingSetupPayloadString:completionHandler:]", @"completion"];
    id v23 = (void *)MEMORY[0x19F3A64A0]();
    id v24 = self;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v26;
      __int16 v35 = 2112;
      uint64_t v36 = (const char *)v22;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];
    objc_exception_throw(v27);
  }
  uint64_t v15 = v14;
  if (v14)
  {
    uint64_t v16 = [v14 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __116__HMHome_HMAccessory__continuePairingForAccessoryWithUUID_setupCode_onboardingSetupPayloadString_completionHandler___block_invoke;
    block[3] = &unk_1E5944900;
    void block[4] = self;
    id v29 = v10;
    id v30 = v11;
    id v31 = v12;
    id v32 = v13;
    dispatch_async(v16, block);
  }
  else
  {
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v20;
      __int16 v35 = 2080;
      uint64_t v36 = "-[HMHome(HMAccessory) continuePairingForAccessoryWithUUID:setupCode:onboardingSetupPayloadString:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v13 + 2))(v13, v21);
  }
}

uint64_t __116__HMHome_HMAccessory__continuePairingForAccessoryWithUUID_setupCode_onboardingSetupPayloadString_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _continuePairingForAccessoryWithUUID:*(void *)(a1 + 40) setupCode:*(void *)(a1 + 48) onboardingSetupPayloadString:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

- (void)continuePairingForAccessoryWithUUID:(id)a3 setupCode:(id)a4 completionHandler:(id)a5
{
}

- (void)_cancelPairingForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMHome *)self context];
  if (v8)
  {
    uint64_t v28 = @"kAccessoryUUID";
    id v9 = [v6 UUIDString];
    id v29 = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];

    id v11 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v12 = objc_alloc(MEMORY[0x1E4F65488]);
    id v13 = [(HMHome *)self uuid];
    id v14 = (void *)[v12 initWithTarget:v13];
    uint64_t v15 = (void *)[v11 initWithName:@"kCancelPairingAccessoryRequestKey" destination:v14 payload:v10];

    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    id v24 = __76__HMHome_HMAccessory___cancelPairingForAccessoryWithUUID_completionHandler___block_invoke;
    id v25 = &unk_1E5944EF0;
    id v16 = v8;
    id v26 = v16;
    id v27 = v7;
    [v15 setResponseHandler:&v22];
    id v17 = objc_msgSend(v16, "messageDispatcher", v22, v23, v24, v25);
    [v17 sendMessage:v15];
  }
  else
  {
    id v18 = (void *)MEMORY[0x19F3A64A0]();
    id v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v21;
      __int16 v32 = 2080;
      id v33 = "-[HMHome(HMAccessory) _cancelPairingForAccessoryWithUUID:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __76__HMHome_HMAccessory___cancelPairingForAccessoryWithUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegateCaller];
  [v5 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (void)cancelPairingForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMAccessory) cancelPairingForAccessoryWithUUID:completionHandler:]", @"completion"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__HMHome_HMAccessory__cancelPairingForAccessoryWithUUID_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    void block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    id v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v14;
      __int16 v27 = 2080;
      uint64_t v28 = "-[HMHome(HMAccessory) cancelPairingForAccessoryWithUUID:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __75__HMHome_HMAccessory__cancelPairingForAccessoryWithUUID_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelPairingForAccessoryWithUUID:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_addAccessory:(id)a3 accessoryDescription:(id)a4 password:(id)a5 setupCodeDeferred:(BOOL)a6 progress:(id)a7 completionHandler:(id)a8
{
  BOOL v10 = a6;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v80 = a8;
  id v18 = [(HMHome *)self context];
  if (v18)
  {
    if (v14)
    {
      id v19 = [v14 name];
      unint64_t v20 = [v19 length];
      long long v77 = v15;
      if (HMMaxLengthForNaming__hmf_once_t7 != -1) {
        dispatch_once(&HMMaxLengthForNaming__hmf_once_t7, &__block_literal_global_55_24575);
      }
      unint64_t v21 = HMMaxLengthForNaming__hmf_once_v8;

      if (v20 <= v21)
      {
        uint64_t v74 = v17;
        long long v76 = v16;
        uint64_t v40 = (void *)MEMORY[0x1E4F1CA60];
        v90[0] = @"kAccessoryUUID";
        id v41 = [v14 uuid];
        id v42 = [v41 UUIDString];
        v91[0] = v42;
        v90[1] = @"kAccessorySetupCodeDeferredKey";
        __int16 v43 = [NSNumber numberWithBool:v10];
        v91[1] = v43;
        v90[2] = @"kAccessorySetupRetryKey";
        id v44 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v77, "retry"));
        v91[2] = v44;
        uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:3];
        long long v75 = [v40 dictionaryWithDictionary:v45];

        uint64_t v46 = [v77 appIdentifier];
        if (!v46)
        {
          __int16 v47 = [MEMORY[0x1E4F28B50] mainBundle];
          uint64_t v46 = [v47 bundleIdentifier];
        }
        long long v73 = (void *)v46;
        if ([v76 length]) {
          [v75 setObject:v76 forKeyedSubscript:@"kAccessoryPairingPasswordKey"];
        }
        uint64_t v48 = [v14 peerIdentifier];

        if (v48)
        {
          id v49 = [v14 peerIdentifier];
          uint64_t v50 = [v49 UUIDString];
          [v75 setObject:v50 forKeyedSubscript:@"kAccessoryPeerIdentifierKey"];
        }
        id v51 = objc_alloc(MEMORY[0x1E4F654B0]);
        id v52 = objc_alloc(MEMORY[0x1E4F65488]);
        id v53 = [(HMHome *)self uuid];
        id v54 = (void *)[v52 initWithTarget:v53];
        id v55 = (void *)[v51 initWithName:@"kAddAccessoryRequestKey" destination:v54 payload:v75];

        objc_msgSend(v55, "hm_setXPCTimeoutDisabled:", 1);
        id v56 = [v77 setupAccessoryPayload];
        id v57 = objc_alloc(MEMORY[0x1E4F653F0]);
        id v58 = NSString;
        id v59 = MEMORY[0x19F3A5D00](self, a2);
        id v60 = [v58 stringWithFormat:@"%@, %s:%ld", v59, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/HMHome.m", 7008];
        id v61 = (void *)[v57 initWithName:v60];

        [(HMHome *)self uuid];
        [v56 categoryNumber];

        if (v56) {
          [v56 supportsBTLE];
        }
        [v55 setActivity:v61];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __112__HMHome_HMAccessory___addAccessory_accessoryDescription_password_setupCodeDeferred_progress_completionHandler___block_invoke;
        aBlock[3] = &unk_1E59449F0;
        id v87 = v61;
        long long v88 = self;
        id v89 = v80;
        id v79 = v61;
        id v62 = _Block_copy(aBlock);
        id v63 = [(HMHome *)self context];
        long long v64 = [v63 pendingRequests];

        long long v65 = [v55 identifier];
        long long v66 = _Block_copy(v62);
        [v64 addAccessory:v14 andCompletionBlock:v66 forIdentifier:v65];

        __int16 v72 = v56;
        id v17 = v74;
        uint64_t v67 = _Block_copy(v74);
        [v64 addAccessoryDescription:v77 progressBlock:v67 andCompletionBlock:0 forIdentifier:v65];

        v81[0] = MEMORY[0x1E4F143A8];
        v81[1] = 3221225472;
        v81[2] = __112__HMHome_HMAccessory___addAccessory_accessoryDescription_password_setupCodeDeferred_progress_completionHandler___block_invoke_2;
        v81[3] = &unk_1E5941570;
        id v82 = v64;
        id v83 = v65;
        id v68 = v18;
        id v84 = v68;
        long long v85 = self;
        id v69 = v65;
        id v70 = v64;
        [v55 setResponseHandler:v81];
        long long v71 = [v68 messageDispatcher];
        [v71 sendMessage:v55];

        id v15 = v77;
        uint64_t v28 = v80;

        id v16 = v76;
      }
      else
      {
        uint64_t v22 = (void *)MEMORY[0x19F3A64A0]();
        id v23 = self;
        id v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          id v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          long long v93 = v25;
          _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@Accessory name is longer than the pre-defined max length", buf, 0xCu);
        }
        id v26 = [v18 delegateCaller];
        __int16 v27 = [MEMORY[0x1E4F28C58] hmErrorWithCode:46];
        uint64_t v28 = v80;
        [v26 callCompletion:v80 error:v27];

        id v15 = v77;
      }
    }
    else
    {
      id v33 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v34 = self;
      __int16 v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v93 = v36;
        _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to add accessory due to no accessory given", buf, 0xCu);
      }
      uint64_t v37 = [(HMHome *)v34 context];
      __int16 v38 = [v37 delegateCaller];
      id v39 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:20 userInfo:0];
      uint64_t v28 = v80;
      [v38 callCompletion:v80 error:v39];
    }
  }
  else
  {
    uint64_t v29 = (void *)MEMORY[0x19F3A64A0]();
    id v30 = self;
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v93 = v32;
      __int16 v94 = 2080;
      long long v95 = "-[HMHome(HMAccessory) _addAccessory:accessoryDescription:password:setupCodeDeferred:progress:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
    uint64_t v28 = v80;
  }
}

uint64_t __112__HMHome_HMAccessory___addAccessory_accessoryDescription_password_setupCodeDeferred_progress_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 begin];
  [*(id *)(a1 + 40) uuid];

  [v4 domain];
  [v4 code];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  id v5 = *(void **)(a1 + 32);

  return [v5 end];
}

void __112__HMHome_HMAccessory___addAccessory_accessoryDescription_password_setupCodeDeferred_progress_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
    id v5 = [*(id *)(a1 + 48) delegateCaller];
    [v5 callCompletion:v4 error:v3];

    id v6 = (id)[*(id *)(a1 + 32) removeAccessoryForIdentifier:*(void *)(a1 + 40)];
    id v7 = *(void **)(a1 + 56);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __112__HMHome_HMAccessory___addAccessory_accessoryDescription_password_setupCodeDeferred_progress_completionHandler___block_invoke_3;
    v8[3] = &unk_1E5941470;
    id v9 = v3;
    [v7 _notifySetupFailedIfInHomeUIService:v8];
  }
}

id __112__HMHome_HMAccessory___addAccessory_accessoryDescription_password_setupCodeDeferred_progress_completionHandler___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)startPairingWithAccessory:(id)a3 accessorySetupDescription:(id)a4 progress:(id)a5 completionHandler:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  BOOL v10 = (char *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(HMHome *)self context];
  if (!v13)
  {
    uint64_t v24 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMAccessory) startPairingWithAccessory:accessorySetupDescription:progress:completionHandler:]", @"completion"];
    id v25 = (void *)MEMORY[0x19F3A64A0]();
    id v26 = self;
    __int16 v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = v28;
      __int16 v37 = 2112;
      __int16 v38 = (const char *)v24;
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v29 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v24 userInfo:0];
    objc_exception_throw(v29);
  }
  id v15 = (void *)v14;
  id v16 = (void *)MEMORY[0x19F3A64A0]();
  id v17 = self;
  id v18 = HMFGetOSLogHandle();
  id v19 = v18;
  if (v15)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      unint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v36 = v20;
      __int16 v37 = 2112;
      __int16 v38 = v10;
      __int16 v39 = 2112;
      id v40 = v11;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@Starting pairing with accessory: %@ accessoryDescription: %@", buf, 0x20u);
    }
    unint64_t v21 = [v15 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__HMHome_HMAccessory__startPairingWithAccessory_accessorySetupDescription_progress_completionHandler___block_invoke;
    block[3] = &unk_1E5941548;
    void block[4] = v17;
    id v31 = v10;
    id v32 = v11;
    id v33 = v12;
    id v34 = v13;
    dispatch_async(v21, block);
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = v22;
      __int16 v37 = 2080;
      __int16 v38 = "-[HMHome(HMAccessory) startPairingWithAccessory:accessorySetupDescription:progress:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v13 + 2))(v13, v23);
  }
}

uint64_t __102__HMHome_HMAccessory__startPairingWithAccessory_accessorySetupDescription_progress_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addAccessory:*(void *)(a1 + 40) accessoryDescription:*(void *)(a1 + 48) password:0 setupCodeDeferred:1 progress:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

- (void)addAccessory:(HMAccessory *)accessory completionHandler:(void *)completion
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = accessory;
  id v7 = completion;
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  BOOL v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    id v13 = v11;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending add request for accessory: %@", (uint8_t *)&v12, 0x16u);
  }
  [(HMHome *)v9 addAccessory:v6 password:0 progress:0 completionHandler:v7];
}

- (void)addAccessory:(id)a3 password:(id)a4 completionHandler:(id)a5
{
}

- (void)addAccessory:(id)a3 password:(id)a4 progress:(id)a5 completionHandler:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  BOOL v10 = (char *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = (void *)MEMORY[0x19F3A64A0]();
  id v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    id v18 = @"<non-nil>";
    *(_DWORD *)buf = 138543874;
    id v40 = v17;
    __int16 v41 = 2112;
    if (!v11) {
      id v18 = @"<nil>";
    }
    id v42 = v10;
    __int16 v43 = 2112;
    id v44 = v18;
    _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Sending add request for accessory: %@ password: %@", buf, 0x20u);
  }
  id v19 = [(HMHome *)v15 context];
  if (!v13)
  {
    uint64_t v27 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMAccessory) addAccessory:password:progress:completionHandler:]", @"completion"];
    uint64_t v28 = (void *)MEMORY[0x19F3A64A0]();
    id v29 = v15;
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v40 = v31;
      __int16 v41 = 2112;
      id v42 = (const char *)v27;
      _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v32 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v27 userInfo:0];
    objc_exception_throw(v32);
  }
  unint64_t v20 = v19;
  if (v19)
  {
    unint64_t v21 = [v19 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__HMHome_HMAccessory__addAccessory_password_progress_completionHandler___block_invoke;
    block[3] = &unk_1E5941548;
    id v34 = v10;
    __int16 v35 = v15;
    id v37 = v12;
    id v36 = v11;
    id v38 = v13;
    dispatch_async(v21, block);

    uint64_t v22 = v34;
  }
  else
  {
    id v23 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v24 = v15;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v40 = v26;
      __int16 v41 = 2080;
      id v42 = "-[HMHome(HMAccessory) addAccessory:password:progress:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v13 + 2))(v13, v22);
  }
}

void __72__HMHome_HMAccessory__addAccessory_password_progress_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];

  id v4 = [HMSetupAccessoryDescription alloc];
  id v5 = [*(id *)(a1 + 32) uuid];
  id v6 = [*(id *)(a1 + 32) name];
  id v7 = [*(id *)(a1 + 40) uuid];
  id v8 = [(HMSetupAccessoryDescription *)v4 initWithAccessoryUUID:v5 accessoryName:v6 appID:v3 homeUUID:v7];

  id v9 = _Block_copy(*(const void **)(a1 + 56));
  if (!v9)
  {
    id v9 = objc_msgSend(*(id *)(a1 + 40), "__defaultProgressHandlerForAddAccessory");
  }
  BOOL v10 = (void *)MEMORY[0x19F3A64A0]();
  id v11 = *(id *)(a1 + 40);
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v13 = HMFGetLogIdentifier();
    __int16 v14 = [*(id *)(a1 + 32) name];
    id v15 = [*(id *)(a1 + 32) uuid];
    [v15 UUIDString];
    uint64_t v16 = v17 = v3;
    *(_DWORD *)buf = 138544130;
    id v19 = v13;
    __int16 v20 = 2112;
    unint64_t v21 = v8;
    __int16 v22 = 2112;
    id v23 = v14;
    __int16 v24 = 2112;
    id v25 = v16;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Re-registering accessory description %@ for add accessory progress notification for accessory %@/%@", buf, 0x2Au);

    id v3 = v17;
  }

  [*(id *)(a1 + 40) _addAccessory:*(void *)(a1 + 32) accessoryDescription:v8 password:*(void *)(a1 + 48) setupCodeDeferred:0 progress:v9 completionHandler:*(void *)(a1 + 64)];
}

+ (BOOL)isValidMediaPassword:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    if (a4)
    {
      id v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = 20;
      goto LABEL_10;
    }
    goto LABEL_21;
  }
  unint64_t v7 = [v5 lengthOfBytesUsingEncoding:4];
  if (!v7)
  {
    if (a4)
    {
      id v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = 3;
      goto LABEL_10;
    }
    goto LABEL_21;
  }
  if (v7 < 0x41)
  {
    if (isValidMediaPassword_error__onceToken != -1) {
      dispatch_once(&isValidMediaPassword_error__onceToken, &__block_literal_global_2003);
    }
    if ([v6 rangeOfCharacterFromSet:isValidMediaPassword_error__invalidCharacters] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (!SecPasswordIsPasswordWeak())
      {
        BOOL v11 = 1;
        goto LABEL_22;
      }
      if (!a4) {
        goto LABEL_21;
      }
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = 2201;
    }
    else
    {
      if (!a4) {
        goto LABEL_21;
      }
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = 2200;
    }
    BOOL v10 = [v12 hmPrivateErrorWithCode:v13];
    goto LABEL_11;
  }
  if (!a4)
  {
LABEL_21:
    BOOL v11 = 0;
    goto LABEL_22;
  }
  id v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = 46;
LABEL_10:
  BOOL v10 = [v8 hmErrorWithCode:v9];
LABEL_11:
  BOOL v11 = 0;
  *a4 = v10;
LABEL_22:

  return v11;
}

void __53__HMHome_HMMediaProfile__isValidMediaPassword_error___block_invoke()
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E58]);
  uint64_t v0 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  [v4 formUnionWithCharacterSet:v0];

  uint64_t v1 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  [v4 formUnionWithCharacterSet:v1];

  uint64_t v2 = [v4 invertedSet];
  id v3 = (void *)isValidMediaPassword_error__invalidCharacters;
  isValidMediaPassword_error__invalidCharacters = v2;
}

+ (id)generateMediaPasswordWithError:(id *)a3
{
  return HMGenerateDecimalDigitPasswordWithLength(6, a3);
}

+ (BOOL)accessorySupportsMediaAccessControl:(id)a3
{
  return [a3 supportsMediaAccessControl];
}

- (id)createSiriEndpointProfilesMessenger
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMHome *)self uuid];
  id v4 = +[HMSiriEndpointProfilesMessenger messageTargetUUIDWithHomeUUID:v3];

  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  unint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v13 = 138543618;
    __int16 v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating siri endpoint profile messenger with message target UUID: %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v9 = [(HMHome *)v6 context];
  BOOL v10 = [v9 messageDispatcher];

  if (!v10) {
    _HMFPreconditionFailure();
  }
  BOOL v11 = [[HMSiriEndpointProfilesMessenger alloc] initWithMessageTargetUUID:v4 messageDispatcher:v10];

  return v11;
}

- (void)executeActions:(id)a3 completionHandler:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  unint64_t v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v22 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(HMActionExecution) executeActions:completionHandler:]", @"completionHandler"];
    id v23 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v24 = self;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v34 = v26;
      __int16 v35 = 2112;
      id v36 = (const char *)v22;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];
    objc_exception_throw(v27);
  }
  uint64_t v9 = (void *)v8;
  if (!v8)
  {
    id v12 = (void *)MEMORY[0x19F3A64A0]();
    int v13 = self;
    __int16 v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v34 = v15;
      __int16 v35 = 2080;
      id v36 = "-[HMHome(HMActionExecution) executeActions:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = 12;
    goto LABEL_11;
  }
  if (![v6 count])
  {
    id v18 = (void *)MEMORY[0x19F3A64A0]();
    id v19 = self;
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      unint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v34 = v21;
      __int16 v35 = 2112;
      id v36 = v6;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@No actions to execute, %@", buf, 0x16u);
    }
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = 3;
LABEL_11:
    BOOL v11 = [v16 hmErrorWithCode:v17];
    v7[2](v7, v11);
    goto LABEL_12;
  }
  BOOL v10 = [v9 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__HMHome_HMActionExecution__executeActions_completionHandler___block_invoke;
  block[3] = &unk_1E5944360;
  id v29 = v6;
  id v30 = self;
  id v31 = v9;
  id v32 = v7;
  dispatch_async(v10, block);

  BOOL v11 = v29;
LABEL_12:
}

void __62__HMHome_HMActionExecution__executeActions_completionHandler___block_invoke(id *a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  void v33[2] = __62__HMHome_HMActionExecution__executeActions_completionHandler___block_invoke_2;
  v33[3] = &unk_1E5943538;
  v33[4] = a1[5];
  char v3 = objc_msgSend(v2, "na_all:", v33);
  id v4 = [a1[6] delegateCaller];
  if (v3)
  {
    id v5 = objc_msgSend(a1[4], "na_map:", &__block_literal_global_42443);
    id v6 = [v5 allObjects];

    uint64_t v7 = [v6 count];
    if (v7 == [a1[4] count])
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F654B0];
      uint64_t v9 = [a1[5] messageDestination];
      id v34 = @"HM.homeExecuteActionsActionInfoKey";
      __int16 v35 = v6;
      BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      BOOL v11 = [v8 messageWithName:@"HM.homeExecuteActionsRequestKey" destination:v9 payload:v10];

      objc_initWeak((id *)location, a1[5]);
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      uint64_t v28 = __62__HMHome_HMActionExecution__executeActions_completionHandler___block_invoke_17;
      id v29 = &unk_1E59441D8;
      objc_copyWeak(&v32, (id *)location);
      id v30 = v4;
      id v31 = a1[7];
      [v11 setResponseHandler:&v26];
      id v12 = objc_msgSend(a1[6], "messageDispatcher", v26, v27, v28, v29);
      [v12 sendMessage:v11 completionHandler:0];

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)location);
    }
    else
    {
      id v18 = (void *)MEMORY[0x19F3A64A0]();
      id v19 = a1[5];
      __int16 v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        unint64_t v21 = HMFGetLogIdentifier();
        uint64_t v22 = [v6 count];
        uint64_t v23 = [a1[4] count];
        id v24 = a1[4];
        *(_DWORD *)id location = 138544386;
        *(void *)&location[4] = v21;
        __int16 v37 = 2048;
        uint64_t v38 = v22;
        __int16 v39 = 2048;
        uint64_t v40 = v23;
        __int16 v41 = 2112;
        id v42 = v6;
        __int16 v43 = 2112;
        id v44 = v24;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Only %tu of %tu actions could be serialized. Serialized: < %@ > from the given actions: < %@ >", location, 0x34u);
      }
      id v25 = a1[7];
      BOOL v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:3 userInfo:0];
      [v4 callCompletion:v25 error:v11];
    }
  }
  else
  {
    int v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = a1[5];
    __int16 v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)id location = 138543362;
      *(void *)&location[4] = v16;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Invalid action detected", location, 0xCu);
    }
    id v17 = a1[7];
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:3 userInfo:0];
    [v4 callCompletion:v17 error:v6];
  }
}

uint64_t __62__HMHome_HMActionExecution__executeActions_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 isValid];
  if ((v4 & 1) == 0)
  {
    id v5 = (void *)MEMORY[0x19F3A64A0]();
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      BOOL v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, "%{public}@Invalid action: %@", (uint8_t *)&v10, 0x16u);
    }
  }

  return v4;
}

void __62__HMHome_HMActionExecution__executeActions_completionHandler___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5)
  {
    uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = WeakRetained;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      id v13 = v11;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Execution of actions failed (%@)", (uint8_t *)&v12, 0x16u);
    }
  }
  [*(id *)(a1 + 32) callCompletion:*(void *)(a1 + 40) error:v5];
}

uint64_t __62__HMHome_HMActionExecution__executeActions_completionHandler___block_invoke_13(uint64_t a1, void *a2)
{
  return [a2 _serializeForAdd];
}

- (void)configurePersonManager
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMHome *)self personManagerSettings];
  if ([v3 isFaceClassificationEnabled]
    && ([(HMHome *)self personManager],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    int v10 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v16 = 138543362;
      id v17 = v13;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Creating person manager because face classification is enabled", (uint8_t *)&v16, 0xCu);
    }
    __int16 v14 = [[HMHomePersonManager alloc] initWithHome:v11];
    [(HMHome *)v11 setPersonManager:v14];

    id v15 = [(HMHome *)v11 personManager];
    [v15 configure];
  }
  else if (([v3 isFaceClassificationEnabled] & 1) == 0)
  {
    id v5 = [(HMHome *)self personManager];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v7 = self;
      uint64_t v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = HMFGetLogIdentifier();
        int v16 = 138543362;
        id v17 = v9;
        _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Destroying person manager because face classification is disabled", (uint8_t *)&v16, 0xCu);
      }
      [(HMHome *)v7 setPersonManager:0];
    }
  }
}

- (void)updatePersonManagerSettings:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMHome *)self context];
  if (v8)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Update person manager settings"];
    int v10 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      __int16 v14 = [v9 identifier];
      id v15 = [v14 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v34 = v13;
      __int16 v35 = 2114;
      id v36 = v15;
      __int16 v37 = 2112;
      id v38 = v6;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Updating person manager settings: %@", buf, 0x20u);
    }
    id v31 = @"HMHomePersonManagerSettingsMessageKey";
    int v16 = encodeRootObject(v6);
    id v32 = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];

    id v18 = objc_alloc(MEMORY[0x1E4F65488]);
    id v19 = [(HMHome *)v11 uuid];
    __int16 v20 = (void *)[v18 initWithTarget:v19];

    unint64_t v21 = [MEMORY[0x1E4F654B0] messageWithName:@"HMHomeUpdatePersonManagerSettingsMessage" destination:v20 payload:v17];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __57__HMHome_Person__updatePersonManagerSettings_completion___block_invoke;
    v28[3] = &unk_1E5945510;
    void v28[4] = v11;
    id v29 = v9;
    id v30 = v7;
    id v22 = v9;
    [v21 setResponseHandler:v28];
    uint64_t v23 = [v8 messageDispatcher];
    [v23 sendMessage:v21 completionHandler:0];

    goto LABEL_9;
  }
  id v24 = (void *)MEMORY[0x19F3A64A0]();
  id v25 = self;
  uint64_t v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    uint64_t v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v34 = v27;
    __int16 v35 = 2080;
    id v36 = "-[HMHome(Person) updatePersonManagerSettings:completion:]";
    _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v7)
  {
    id v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v17);
LABEL_9:
  }
}

void __57__HMHome_Person__updatePersonManagerSettings_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v32[0] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  uint64_t v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMHomePersonManagerSettingsMessageKey", v7);

  id v9 = objc_msgSend(v6, "hmf_UUIDForKey:", @"HMHomePersonManagerZoneUUIDMessageKey");
  int v10 = (void *)MEMORY[0x19F3A64A0]();
  id v11 = *(id *)(a1 + 32);
  int v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = id v22 = v5;
      id v15 = [*(id *)(a1 + 40) identifier];
      int v16 = [v15 shortDescription];
      *(_DWORD *)buf = 138544130;
      id v25 = v14;
      __int16 v26 = 2114;
      uint64_t v27 = v16;
      __int16 v28 = 2112;
      id v29 = v8;
      __int16 v30 = 2112;
      id v31 = v9;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully updated person manager settings: %@, zone UUID: %@", buf, 0x2Au);

      id v5 = v22;
    }

    [*(id *)(a1 + 32) setPersonManagerSettings:v8];
    [*(id *)(a1 + 32) setPersonManagerZoneUUID:v9];
    [*(id *)(a1 + 32) configurePersonManager];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      [*(id *)(a1 + 40) identifier];
      id v18 = v23 = v5;
      id v19 = [v18 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v25 = v17;
      __int16 v26 = 2114;
      uint64_t v27 = v19;
      __int16 v28 = 2112;
      id v29 = v23;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to update person manager settings: %@", buf, 0x20u);

      id v5 = v23;
    }
  }
  __int16 v20 = [*(id *)(a1 + 32) context];
  unint64_t v21 = [v20 delegateCaller];
  [v21 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (id)personManagerWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self personManager];
  id v6 = [v5 UUID];
  int v7 = [v6 isEqual:v4];

  if (v7) {
    [(HMHome *)self personManager];
  }
  else {
  uint64_t v8 = [(HMHome *)self photosPersonManagerWithUUID:v4];
  }

  return v8;
}

- (id)photosPersonManagerWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [HMPhotosPersonManager alloc];
  id v6 = [(HMHome *)self context];
  int v7 = [(HMPhotosPersonManager *)v5 initWithContext:v6 UUID:v4];

  [(HMPersonManager *)v7 configure];

  return v7;
}

- (id)photosPersonManagerForUser:(id)a3
{
  return (id)[a3 photosPersonManager];
}

- (id)matterStartupParametersXPCConnectBlock
{
  return &__block_literal_global_2;
}

id __56__HMHome_Matter__matterStartupParametersXPCConnectBlock__block_invoke()
{
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.matter.native.xpc" options:0];

  return v0;
}

- (void)matterControllerXPCConnectBlock
{
  return &__block_literal_global_48346;
}

id __49__HMHome_Matter__matterControllerXPCConnectBlock__block_invoke()
{
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.matter.framework.xpc" options:0];

  return v0;
}

- (void)resetAndRemoveAllCHIPPairingsFromAccessory:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  id v7 = a4;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v24 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(CHIP) resetAndRemoveAllCHIPPairingsFromAccessory:completion:]", @"completion"];
    id v25 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v26 = self;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      __int16 v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v38 = v28;
      __int16 v39 = 2112;
      uint64_t v40 = (const char *)v24;
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v29 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v24 userInfo:0];
    objc_exception_throw(v29);
  }
  id v9 = (void *)v8;
  int v10 = (void *)MEMORY[0x19F3A64A0]();
  id v11 = self;
  int v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v38 = v14;
      __int16 v39 = 2112;
      uint64_t v40 = v6;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Resetting and removing all CHIP pairings from accessory: %@", buf, 0x16u);
    }
    id v15 = objc_alloc(MEMORY[0x1E4F65488]);
    int v16 = [(HMHome *)v11 uuid];
    id v17 = (void *)[v15 initWithTarget:v16];

    __int16 v35 = @"kAccessoryUUID";
    id v18 = [v6 uuid];
    id v19 = [v18 UUIDString];
    id v36 = v19;
    __int16 v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];

    unint64_t v21 = [MEMORY[0x1E4F654B0] messageWithName:@"HMHomeResetAndRemoveAllCHIPPairingsFromAccessoryMessage" destination:v17 payload:v20];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __70__HMHome_CHIP__resetAndRemoveAllCHIPPairingsFromAccessory_completion___block_invoke;
    v30[3] = &unk_1E5943B08;
    id v31 = v21;
    id v32 = v11;
    id v33 = v9;
    id v34 = v7;
    id v22 = v21;
    [v6 removeCorrespondingSystemCommissionerPairingWithCompletion:v30];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v38 = v23;
      __int16 v39 = 2080;
      uint64_t v40 = "-[HMHome(CHIP) resetAndRemoveAllCHIPPairingsFromAccessory:completion:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v17);
  }
}

void __70__HMHome_CHIP__resetAndRemoveAllCHIPPairingsFromAccessory_completion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__HMHome_CHIP__resetAndRemoveAllCHIPPairingsFromAccessory_completion___block_invoke_2;
  v4[3] = &unk_1E5945510;
  id v2 = *(void **)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v2;
  id v6 = *(id *)(a1 + 56);
  [*(id *)(a1 + 32) setResponseHandler:v4];
  id v3 = [*(id *)(a1 + 48) messageDispatcher];
  [v3 sendMessage:*(void *)(a1 + 32)];
}

void __70__HMHome_CHIP__resetAndRemoveAllCHIPPairingsFromAccessory_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  int v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v17 = 138543618;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v5;
      int v12 = "%{public}@Failed to reset and remove all CHIP pairings: %@";
      id v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v13, v14, v12, (uint8_t *)&v17, v15);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v17 = 138543362;
    id v18 = v11;
    int v12 = "%{public}@Successfully reset and removed all CHIP pairings";
    id v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 12;
    goto LABEL_6;
  }

  int v16 = [*(id *)(a1 + 40) delegateCaller];
  [v16 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)addTimerTriggerFromBuilder:(id)a3 completionHandler:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v36 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(AutomationBuilders) addTimerTriggerFromBuilder:completionHandler:]", @"completion"];
    __int16 v37 = (void *)MEMORY[0x19F3A64A0]();
    id v38 = self;
    __int16 v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v50 = v40;
      __int16 v51 = 2112;
      id v52 = (const char *)v36;
      _os_log_impl(&dword_19D1A8000, v39, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v41 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v36 userInfo:0];
    objc_exception_throw(v41);
  }
  id v9 = (void *)v8;
  if (v8)
  {
    id v48 = 0;
    BOOL v10 = [(HMHome *)self validateBuilder:v6 error:&v48];
    id v11 = v48;
    int v12 = v11;
    if (v10)
    {
      id v47 = v11;
      id v13 = v6;
      if (self)
      {
        os_log_type_t v14 = -[HMHome _encodeTriggerBuilder:error:](self, v13, &v47);
        uint32_t v15 = (void *)[v14 mutableCopy];

        if (v15)
        {
          int v16 = [v13 fireDateIfSet];
          [v15 setObject:v16 forKeyedSubscript:@"kTimerTriggerInitialFireDateKey"];

          int v17 = [v13 timeZone];
          id v18 = v17;
          if (v17)
          {
            __int16 v19 = encodeRootObject(v17);
            [v15 setObject:v19 forKeyedSubscript:@"kTimerTriggerTimeZoneDataKey"];
          }
          id v42 = v18;
          id v20 = [v13 recurrence];
          uint64_t v21 = v20;
          if (v20)
          {
            id v22 = encodeRootObject(v20);
            [v15 setObject:v22 forKeyedSubscript:@"kTimerTriggerRecurrenceDataKey"];
          }
          id v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "recurrenceDays"));
          [v15 setObject:v23 forKeyedSubscript:@"kTimerTriggerRecurrencesKey"];

          uint64_t v24 = [v13 significantEvent];
          [v15 setObject:v24 forKeyedSubscript:@"kTimerTriggerSignificantEventKey"];

          id v25 = [v13 significantEventOffset];
          __int16 v26 = v25;
          if (v25)
          {
            uint64_t v27 = encodeRootObject(v25);
            [v15 setObject:v27 forKeyedSubscript:@"kTimerTriggerSignificantEventOffsetKey"];
          }
          __int16 v28 = (void *)[v15 copy];
        }
        else
        {
          __int16 v28 = 0;
        }
      }
      else
      {
        __int16 v28 = 0;
      }

      id v33 = v47;
      if (v28)
      {
        id v34 = [(HMHome *)self uuid];
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __75__HMHome_AutomationBuilders__addTimerTriggerFromBuilder_completionHandler___block_invoke;
        v43[3] = &unk_1E5945510;
        id v44 = v9;
        uint64_t v45 = self;
        id v46 = v7;
        -[_HMContext sendMessage:target:payload:responseHandler:](v44, @"HMAddTimerTriggerFromBuilderMessage", v34, v28, v43);

        __int16 v35 = v44;
      }
      else
      {
        __int16 v35 = [v9 delegateCaller];
        [v35 callCompletion:v7 timerTrigger:0 error:v33];
      }
    }
    else
    {
      __int16 v28 = [v9 delegateCaller];
      [v28 callCompletion:v7 timerTrigger:0 error:v12];
      id v33 = v12;
    }
  }
  else
  {
    id v29 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v30 = self;
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      id v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v50 = v32;
      __int16 v51 = 2080;
      id v52 = "-[HMHome(AutomationBuilders) addTimerTriggerFromBuilder:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v33 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v33);
  }
}

void __75__HMHome_AutomationBuilders__addTimerTriggerFromBuilder_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (v14)
  {
    id v6 = [*(id *)(a1 + 32) delegateCaller];
    [v6 callCompletion:*(void *)(a1 + 48) timerTrigger:0 error:v14];
  }
  else
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = [*(id *)(a1 + 40) currentTriggers];
    id v6 = -[HMHome _addObjectOfClass:fromResponse:toArray:](v7, v8, v5, v9);

    BOOL v10 = [*(id *)(a1 + 32) delegateCaller];
    id v11 = v10;
    uint64_t v12 = *(void *)(a1 + 48);
    if (v6)
    {
      [v10 callCompletion:v12 timerTrigger:v6 error:0];
    }
    else
    {
      id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      [v11 callCompletion:v12 timerTrigger:0 error:v13];
    }
  }
}

- (id)_addObjectOfClass:(void *)a3 fromResponse:(void *)a4 toArray:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    id v9 = (void *)[[a2 alloc] initWithDictionary:v7 home:a1];
    BOOL v10 = v9;
    if (v9)
    {
      id v11 = [v9 uuid];
      uint64_t v12 = [v8 firstItemWithUUID:v11];

      if (v12)
      {
        id v13 = (void *)MEMORY[0x19F3A64A0]();
        id v14 = a1;
        uint32_t v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v16 = HMFGetLogIdentifier();
          int v20 = 138543618;
          uint64_t v21 = v16;
          __int16 v22 = 2112;
          id v23 = v12;
          _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@Returning existing %@", (uint8_t *)&v20, 0x16u);
        }
        int v17 = v12;
      }
      else
      {
        id v18 = [a1 context];
        objc_msgSend(v10, "__configureWithContext:home:", v18, a1);

        [v8 addObject:v10];
        int v17 = v10;
      }
      a1 = v17;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)_encodeTriggerBuilder:(void *)a3 error:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = [v5 name];
    id v8 = [v5 configuredName];
    if (!+[HMTrigger _validateName:configuredName:error:]((uint64_t)HMTrigger, v7, v8, a3))
    {
      a1 = 0;
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v27 = a1;
    __int16 v30 = v7;
    [v6 setObject:v7 forKeyedSubscript:@"kTriggerName"];
    id v29 = v8;
    [v6 setObject:v8 forKeyedSubscript:@"HMT.triggerConfiguredNameKey"];
    id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isEnabled"));
    [v6 setObject:v9 forKeyedSubscript:@"kTriggerActivate"];

    BOOL v10 = NSNumber;
    id v11 = [v5 policy];
    objc_opt_class();
    uint64_t v12 = [v10 numberWithBool:objc_opt_isKindOfClass() & 1];
    id v31 = v6;
    [v6 setObject:v12 forKeyedSubscript:@"HMT.deleteAfterExecutionPolicyKey"];

    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v32 = v5;
    id v14 = [v5 actionSets];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
    __int16 v28 = a3;
    if (v15)
    {
      uint64_t v16 = v15;
      id v17 = 0;
      uint64_t v18 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(v14);
          }
          int v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v21 = [v20 actionSetType];
          if ([v21 isEqualToString:@"HMActionSetTypeTriggerOwned"])
          {
            id v22 = v20;
            id v23 = v17;
            id v17 = v22;
          }
          else
          {
            id v23 = [v20 uuid];
            uint64_t v24 = [v23 UUIDString];
            [v13 addObject:v24];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v16);
    }
    else
    {
      id v17 = 0;
    }

    id v25 = (void *)[v13 copy];
    id v6 = v31;
    [v31 setObject:v25 forKeyedSubscript:@"kTriggerActionSetUUIDKey"];

    id v5 = v32;
    id v7 = v30;
    if (v17 && ([v17 isEmpty] & 1) == 0)
    {
      a1 = [v27 encodeActionSetBuilder:v17 error:v28];
      if (!a1)
      {
LABEL_21:

        id v8 = v29;
        goto LABEL_22;
      }
      [v31 setObject:a1 forKeyedSubscript:@"kTriggerOwnedActionSetKey"];
    }
    a1 = (void *)[v31 copy];
    goto LABEL_21;
  }
LABEL_23:

  return a1;
}

- (id)newTimerTriggerBuilderWithName:(id)a3 significantEvent:(id)a4 significantEventOffset:(id)a5 recurrences:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(HMHome *)self newTimerTriggerBuilder];
  uint64_t v15 = v14;
  if (v14)
  {
    [v14 setName:v10];
    [v15 setSignificantEvent:v11];
    [v15 setSignificantEventOffset:v12];
    [v15 setRecurrences:v13];
  }

  return v15;
}

- (id)newTimerTriggerBuilderWithName:(id)a3 fireDate:(id)a4 timeZone:(id)a5 recurrence:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(HMHome *)self newTimerTriggerBuilder];
  uint64_t v15 = v14;
  if (v14)
  {
    [v14 setName:v10];
    [v15 setFireDate:v11];
    [v15 setTimeZone:v12];
    [v15 setRecurrence:v13];
  }

  return v15;
}

- (id)newTimerTriggerBuilder
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMHome *)self context];
  if (!v3)
  {
    id v5 = (void *)MEMORY[0x19F3A64A0]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      id v11 = v8;
      __int16 v12 = 2080;
      id v13 = "-[HMHome(AutomationBuilders) newTimerTriggerBuilder]";
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", (uint8_t *)&v10, 0x16u);
    }
    goto LABEL_7;
  }
  if (![(HMHome *)self areAutomationBuildersSupported])
  {
LABEL_7:
    id v4 = 0;
    goto LABEL_8;
  }
  id v4 = [[HMTimerTriggerBuilder alloc] initWithContext:v3 home:self];
LABEL_8:

  return v4;
}

- (id)encodeEventTriggerBuilder:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = -[HMHome _encodeTriggerBuilder:error:](self, v6, a4);
  id v8 = (void *)[v7 mutableCopy];

  if (!v8)
  {
    __int16 v19 = 0;
    goto LABEL_18;
  }
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "recurrenceDays"));
  [v8 setObject:v9 forKeyedSubscript:@"kEventTriggerRecurrencesKey"];

  int v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "executeOnce"));
  [v8 setObject:v10 forKeyedSubscript:@"kEventTriggerExecuteOnce"];

  id v11 = [v6 predicate];
  if (v11)
  {
    __int16 v12 = +[HMPredicateUtilities rewritePredicateForDaemon:v11];
    if (!v12)
    {
      int v20 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v21 = self;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        int v25 = 138543618;
        __int16 v26 = v23;
        __int16 v27 = 2112;
        __int16 v28 = v11;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Invalid event trigger predicate: %@", (uint8_t *)&v25, 0x16u);
      }
      if (a4)
      {
        [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
        __int16 v19 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        __int16 v19 = 0;
      }
      goto LABEL_17;
    }
    id v13 = v12;
    uint64_t v14 = encodeRootObject(v12);
    [v8 setObject:v14 forKeyedSubscript:@"kEventTriggerConditionKey"];
  }
  uint64_t v15 = [v6 events];
  uint64_t v16 = -[HMHome _encodeEvents:error:](self, v15, a4);

  if (v16)
  {
    [v8 setObject:v16 forKeyedSubscript:@"kEventTriggerEventsKey"];
    id v17 = [v6 endEvents];
    uint64_t v18 = -[HMHome _encodeEvents:error:](self, v17, a4);

    if (v18)
    {
      [v8 setObject:v18 forKeyedSubscript:@"kEventTriggerEndEventsKey"];
      __int16 v19 = (void *)[v8 copy];
    }
    else
    {
      __int16 v19 = 0;
    }
  }
  else
  {
    __int16 v19 = 0;
  }

LABEL_17:
LABEL_18:

  return v19;
}

- (id)_encodeEvents:(void *)a3 error:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          __int16 v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "_serializeForAdd", (void)v21);
          if (!v13)
          {
            uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
            id v17 = a1;
            uint64_t v18 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              __int16 v19 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              __int16 v26 = v19;
              __int16 v27 = 2112;
              __int16 v28 = v12;
              _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize event: %@", buf, 0x16u);
            }
            if (a3)
            {
              *a3 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
            }

            uint64_t v15 = 0;
            goto LABEL_16;
          }
          uint64_t v14 = (void *)v13;
          [v6 addObject:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    uint64_t v15 = (void *)[v6 copy];
LABEL_16:
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)addEventTriggerFromBuilder:(id)a3 completionHandler:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v21 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(AutomationBuilders) addEventTriggerFromBuilder:completionHandler:]", @"completion"];
    long long v22 = (void *)MEMORY[0x19F3A64A0]();
    long long v23 = self;
    long long v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v34 = v25;
      __int16 v35 = 2112;
      long long v36 = (const char *)v21;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v26 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v21 userInfo:0];
    objc_exception_throw(v26);
  }
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    id v32 = 0;
    BOOL v10 = [(HMHome *)self validateBuilder:v6 error:&v32];
    id v11 = v32;
    __int16 v12 = v11;
    if (v10)
    {
      id v31 = v11;
      uint64_t v13 = [(HMHome *)self encodeEventTriggerBuilder:v6 error:&v31];
      id v14 = v31;

      if (v13)
      {
        uint64_t v15 = [(HMHome *)self uuid];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __75__HMHome_AutomationBuilders__addEventTriggerFromBuilder_completionHandler___block_invoke;
        v27[3] = &unk_1E5945510;
        id v28 = v9;
        uint64_t v29 = self;
        id v30 = v7;
        -[_HMContext sendMessage:target:payload:responseHandler:](v28, @"HMAddEventTriggerFromBuilderMessage", v15, v13, v27);

        uint64_t v16 = v28;
      }
      else
      {
        uint64_t v16 = [v9 delegateCaller];
        [v16 callCompletion:v7 eventTrigger:0 error:v14];
      }
    }
    else
    {
      uint64_t v13 = [v9 delegateCaller];
      [v13 callCompletion:v7 eventTrigger:0 error:v12];
      id v14 = v12;
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v18 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v34 = v20;
      __int16 v35 = 2080;
      long long v36 = "-[HMHome(AutomationBuilders) addEventTriggerFromBuilder:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v14);
  }
}

void __75__HMHome_AutomationBuilders__addEventTriggerFromBuilder_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (v14)
  {
    id v6 = [*(id *)(a1 + 32) delegateCaller];
    [v6 callCompletion:*(void *)(a1 + 48) eventTrigger:0 error:v14];
  }
  else
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = [*(id *)(a1 + 40) currentTriggers];
    id v6 = -[HMHome _addObjectOfClass:fromResponse:toArray:](v7, v8, v5, v9);

    BOOL v10 = [*(id *)(a1 + 32) delegateCaller];
    id v11 = v10;
    uint64_t v12 = *(void *)(a1 + 48);
    if (v6)
    {
      [v10 callCompletion:v12 eventTrigger:v6 error:0];
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      [v11 callCompletion:v12 eventTrigger:0 error:v13];
    }
  }
}

- (id)newEventTriggerBuilderWithName:(id)a3 events:(id)a4 endEvents:(id)a5 recurrences:(id)a6 predicate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(HMHome *)self newEventTriggerBuilder];
  uint64_t v18 = v17;
  if (v17)
  {
    [v17 setName:v12];
    [v18 setEvents:v13];
    [v18 setEndEvents:v14];
    [v18 setRecurrences:v15];
    [v18 setPredicate:v16];
  }

  return v18;
}

- (id)newEventTriggerBuilderWithName:(id)a3 events:(id)a4 predicate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMHome *)self newEventTriggerBuilder];
  id v12 = v11;
  if (v11)
  {
    [v11 setName:v8];
    [v12 setEvents:v9];
    [v12 setPredicate:v10];
  }

  return v12;
}

- (id)newEventTriggerBuilder
{
  id v3 = [HMEventTriggerBuilder alloc];
  id v4 = [(HMHome *)self context];
  id v5 = [(HMEventTriggerBuilder *)v3 initWithContext:v4 home:self];

  return v5;
}

- (id)encodeActionSetBuilder:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [v4 name];
  [v5 setObject:v6 forKeyedSubscript:@"kActionSetName"];

  id v7 = [v4 applicationData];
  id v8 = [v7 dictionaryRepresentation];
  [v5 setObject:v8 forKeyedSubscript:@"kAppDataInformationKey"];

  id v9 = [v4 actions];
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v36;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v36 != v14) {
        objc_enumerationMutation(v11);
      }
      id v16 = *(void **)(*((void *)&v35 + 1) + 8 * v15);
      id v34 = 0;
      char v17 = [v16 isValidWithError:&v34];
      id v18 = v34;
      __int16 v19 = v18;
      if ((v17 & 1) == 0) {
        break;
      }
      uint64_t v20 = [v16 _serializeForAdd];
      if (!v20)
      {
        id v26 = (void *)MEMORY[0x19F3A64A0]();
        __int16 v27 = self;
        id v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v40 = v29;
          __int16 v41 = 2112;
          id v42 = v16;
          _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize action: %@", buf, 0x16u);
        }
        long long v24 = a4;
        if (a4)
        {
          id v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
LABEL_18:
          *long long v24 = v25;
        }
        goto LABEL_19;
      }
      uint64_t v21 = (void *)v20;
      [v10 addObject:v20];

      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v13) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    long long v24 = a4;
    if (a4)
    {
      if (v18)
      {
        id v25 = v18;
        __int16 v19 = v25;
        goto LABEL_18;
      }
      id v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      *a4 = v31;
    }
LABEL_19:

    long long v23 = 0;
    goto LABEL_20;
  }
LABEL_10:

  long long v22 = (void *)[v10 copy];
  [v5 setObject:v22 forKeyedSubscript:@"kActionSetActions"];

  long long v23 = (void *)[v5 copy];
LABEL_20:

  return v23;
}

- (void)addActionSetFromBuilder:(id)a3 completionHandler:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMHome *)self context];
  if (!v7)
  {
    uint64_t v21 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHome(AutomationBuilders) addActionSetFromBuilder:completionHandler:]", @"completion"];
    long long v22 = (void *)MEMORY[0x19F3A64A0]();
    long long v23 = self;
    long long v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v34 = v25;
      __int16 v35 = 2112;
      long long v36 = (const char *)v21;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v26 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v21 userInfo:0];
    objc_exception_throw(v26);
  }
  id v9 = (void *)v8;
  if (v8)
  {
    id v32 = 0;
    BOOL v10 = [(HMHome *)self validateBuilder:v6 error:&v32];
    id v11 = v32;
    uint64_t v12 = v11;
    if (v10)
    {
      id v31 = v11;
      uint64_t v13 = [(HMHome *)self encodeActionSetBuilder:v6 error:&v31];
      id v14 = v31;

      if (v13)
      {
        uint64_t v15 = [(HMHome *)self uuid];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __72__HMHome_AutomationBuilders__addActionSetFromBuilder_completionHandler___block_invoke;
        v27[3] = &unk_1E5945510;
        id v28 = v9;
        uint64_t v29 = self;
        id v30 = v7;
        -[_HMContext sendMessage:target:payload:responseHandler:](v28, @"HMAddActionSetFromBuilderMessage", v15, v13, v27);

        id v16 = v28;
      }
      else
      {
        id v16 = [v9 delegateCaller];
        [v16 callCompletion:v7 actionSet:0 error:v14];
      }
    }
    else
    {
      uint64_t v13 = [v9 delegateCaller];
      [v13 callCompletion:v7 actionSet:0 error:v12];
      id v14 = v12;
    }
  }
  else
  {
    char v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v34 = v20;
      __int16 v35 = 2080;
      long long v36 = "-[HMHome(AutomationBuilders) addActionSetFromBuilder:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v14);
  }
}

void __72__HMHome_AutomationBuilders__addActionSetFromBuilder_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (v14)
  {
    id v6 = [*(id *)(a1 + 32) delegateCaller];
    [v6 callCompletion:*(void *)(a1 + 48) actionSet:0 error:v14];
  }
  else
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = [*(id *)(a1 + 40) currentActionSets];
    id v6 = -[HMHome _addObjectOfClass:fromResponse:toArray:](v7, v8, v5, v9);

    BOOL v10 = [*(id *)(a1 + 32) delegateCaller];
    id v11 = v10;
    uint64_t v12 = *(void *)(a1 + 48);
    if (v6)
    {
      [v10 callCompletion:v12 actionSet:v6 error:0];
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      [v11 callCompletion:v12 actionSet:0 error:v13];
    }
  }
}

- (id)newActionSetBuilderWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHome *)self newActionSetBuilder];
  id v6 = v5;
  if (v5) {
    [v5 setName:v4];
  }

  return v6;
}

- (id)newActionSetBuilder
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMHome *)self context];
  if (!v3)
  {
    id v5 = (void *)MEMORY[0x19F3A64A0]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      id v11 = v8;
      __int16 v12 = 2080;
      uint64_t v13 = "-[HMHome(AutomationBuilders) newActionSetBuilder]";
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", (uint8_t *)&v10, 0x16u);
    }
    goto LABEL_7;
  }
  if (![(HMHome *)self areAutomationBuildersSupported])
  {
LABEL_7:
    id v4 = 0;
    goto LABEL_8;
  }
  id v4 = [[HMActionSetBuilder alloc] initWithType:@"HMActionSetTypeBuilder" context:v3 home:self];
LABEL_8:

  return v4;
}

- (BOOL)validateBuilder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![(HMHome *)self areAutomationBuildersSupported])
  {
    if (!a4) {
      goto LABEL_12;
    }
    uint64_t v12 = 48;
LABEL_11:
    [MEMORY[0x1E4F28C58] hmErrorWithCode:v12];
    BOOL v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (!v6)
  {
    if (!a4) {
      goto LABEL_12;
    }
    uint64_t v12 = 20;
    goto LABEL_11;
  }
  id v7 = [v6 home];
  uint64_t v8 = [v7 uuid];
  id v9 = [(HMHome *)self uuid];
  char v10 = [v8 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    if (a4)
    {
      uint64_t v12 = 11;
      goto LABEL_11;
    }
LABEL_12:
    BOOL v11 = 0;
    goto LABEL_13;
  }
  BOOL v11 = 1;
LABEL_13:

  return v11;
}

- (BOOL)areAutomationBuildersSupported
{
  id v2 = [(HMHome *)self homeManager];
  char v3 = [v2 isDaemonRunningWithROARFramework];

  return v3;
}

@end