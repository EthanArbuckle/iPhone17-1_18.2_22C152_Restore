@interface AVOutputDevice
+ (AVOutputDevice)outputDeviceWithFigEndpoint:(OpaqueFigEndpoint *)a3;
+ (AVOutputDevice)outputDeviceWithFigEndpoint:(OpaqueFigEndpoint *)a3 routingContextFactory:(id)a4;
+ (AVOutputDevice)outputDeviceWithFigEndpoint:(OpaqueFigEndpoint *)a3 volumeController:(OpaqueFigVolumeControllerState *)a4;
+ (AVOutputDevice)outputDeviceWithRouteDescriptor:(__CFDictionary *)a3;
+ (AVOutputDevice)outputDeviceWithRouteDescriptor:(__CFDictionary *)a3 routeDiscoverer:(OpaqueFigRouteDiscoverer *)a4;
+ (AVOutputDevice)outputDeviceWithRouteDescriptor:(__CFDictionary *)a3 routingContextFactory:(id)a4;
+ (AVOutputDevice)outputDeviceWithRouteDescriptor:(__CFDictionary *)a3 volumeController:(OpaqueFigVolumeControllerState *)a4;
+ (AVOutputDevice)outputDeviceWithRouteDescriptor:(__CFDictionary *)a3 withRoutingContext:(OpaqueFigRoutingContext *)a4;
+ (BOOL)prefersRouteDescriptors;
+ (id)sharedLocalDevice;
+ (void)initialize;
+ (void)localDeviceDidChange;
- (AVOutputDevice)init;
- (AVOutputDevice)initWithOutputDeviceImpl:(id)a3 commChannelManager:(id)a4;
- (BOOL)OEMIconVisible;
- (BOOL)allowsHeadTrackedSpatialAudio;
- (BOOL)automaticallyAllowsConnectionsFromPeersInHomeGroup;
- (BOOL)canAccessAppleMusic;
- (BOOL)canAccessRemoteAssets;
- (BOOL)canAccessiCloudMusicLibrary;
- (BOOL)canBeGroupLeader;
- (BOOL)canBeGrouped;
- (BOOL)canCommunicateWithAllLogicalDeviceMembers;
- (BOOL)canFetchMediaDataFromSender;
- (BOOL)canMute;
- (BOOL)canPlayEncryptedProgressiveDownloadAssets;
- (BOOL)canRelayCommunicationChannel;
- (BOOL)canSetVolume;
- (BOOL)carOwnsMainAudio;
- (BOOL)carOwnsScreen;
- (BOOL)groupContainsGroupLeader;
- (BOOL)hasBatteryLevel;
- (BOOL)isActivated;
- (BOOL)isActivatedForContinuityScreen;
- (BOOL)isAppleAccessory;
- (BOOL)isClusterLeader;
- (BOOL)isConversationDetectionEnabled;
- (BOOL)isEligibleToBePredictedOutputDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroupLeader;
- (BOOL)isHeadTrackedSpatialAudioActive;
- (BOOL)isInUseByPairedDevice;
- (BOOL)isLogicalDeviceLeader;
- (BOOL)isMuted;
- (BOOL)isNightModeSupported;
- (BOOL)limitedUI;
- (BOOL)nightMode;
- (BOOL)onlyAllowsConnectionsFromPeersInHomeGroup;
- (BOOL)ownsTurnByTurnNavigation;
- (BOOL)participatesInGroupPlayback;
- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets;
- (BOOL)producesLowFidelityAudio;
- (BOOL)recognizingSpeech;
- (BOOL)requiresAuthorization;
- (BOOL)rightHandDrive;
- (BOOL)setAllowsHeadTrackedSpatialAudio:(BOOL)a3 error:(id *)a4;
- (BOOL)setConversationDetectionEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)setCurrentBluetoothListeningMode:(id)a3 error:(id *)a4;
- (BOOL)setHeadTrackedSpatialAudioMode:(id)a3 error:(id *)a4;
- (BOOL)siriForwardingEnabled;
- (BOOL)supportsBluetoothSharing;
- (BOOL)supportsBufferedAirPlay;
- (BOOL)supportsConversationDetection;
- (BOOL)supportsFitnessDataDestination;
- (BOOL)supportsHeadTrackedSpatialAudio;
- (BOOL)supportsScreenMirroringControls;
- (double)frecencyScore;
- (float)batteryLevel;
- (float)volume;
- (float)volumeForActivatedDeviceClusterMembersWithRoomID:(id)a3;
- (id)MFiCertificateSerialNumber;
- (id)OEMIconLabel;
- (id)OEMIcons;
- (id)airPlayProperties;
- (id)availableBluetoothListeningModes;
- (id)borrowScreenForClient:(id)a3 reason:(id)a4;
- (id)clusterID;
- (id)clusteredDeviceDescriptions;
- (id)communicationChannelDelegate;
- (id)connectedPairedDevices;
- (id)currentBluetoothListeningMode;
- (id)currentScreenViewAreaForScreenID:(id)a3;
- (id)delegate;
- (id)description;
- (id)deviceID;
- (id)displayCornerMasks;
- (id)figEndpointOutputDeviceImpl;
- (id)firmwareVersion;
- (id)groupID;
- (id)headTrackedSpatialAudioMode;
- (id)identifyingMACAddress;
- (id)impl;
- (id)limitedUIElements;
- (id)logicalDeviceID;
- (id)manufacturer;
- (id)modelID;
- (id)modelSpecificInformation;
- (id)name;
- (id)outputDeviceHIDs;
- (id)outputDeviceInfo;
- (id)proposedGroupID;
- (id)requestTurnByTurnNavigationOwnership;
- (id)screens;
- (id)serialNumber;
- (id)supportedFeatures;
- (int64_t)HAPConformance;
- (int64_t)authenticationType;
- (int64_t)clusterType;
- (int64_t)configuredClusterSize;
- (int64_t)deviceSubType;
- (int64_t)deviceType;
- (int64_t)electronicTollCollection;
- (int64_t)navigationAidedDriving;
- (int64_t)transportType;
- (int64_t)voiceTriggerMode;
- (int64_t)volumeControlType;
- (unint64_t)deviceFeatures;
- (unint64_t)hash;
- (void)activatedDeviceClusterMembersDidChangeVolume:(id)a3 forRoomID:(__CFString *)a4;
- (void)communicationChannelManager:(id)a3 didCloseCommunicationChannel:(id)a4;
- (void)communicationChannelManager:(id)a3 didReceiveData:(id)a4 fromCommunicationChannel:(id)a5;
- (void)configureUsingBlock:(id)a3 completionHandler:(id)a4;
- (void)configureUsingBlock:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)decreaseVolumeByCount:(int64_t)a3;
- (void)increaseVolumeByCount:(int64_t)a3;
- (void)openCommunicationChannelToDestination:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)openCommunicationChannelWithOptions:(id)a3 completionHandler:(id)a4;
- (void)outputDeviceImplCanMuteDidChange:(id)a3;
- (void)outputDeviceImplDidChangeCanChangeVolume:(id)a3;
- (void)outputDeviceImplDidChangeMute:(id)a3;
- (void)outputDeviceImplDidChangeProposedGroupID:(id)a3;
- (void)outputDeviceImplDidChangeVolume:(id)a3;
- (void)outputDeviceImplDidChangeVolumeControlType:(id)a3;
- (void)performHapticFeedbackForUUID:(id)a3 withHapticType:(id)a4 completionHandler:(id)a5;
- (void)postNotification:(id)a3 fromImpl:(id)a4;
- (void)postNotification:(id)a3 withPayload:(id)a4 fromImpl:(id)a5;
- (void)requestCarUIForURL:(id)a3 withUUID:(id)a4;
- (void)requestViewArea:(int64_t)a3 forScreenID:(id)a4;
- (void)setActivatedDeviceClusterMembersVolume:(float)a3 withRoomID:(id)a4;
- (void)setCommunicationChannelDelegate:(id)a3;
- (void)setCurrentBluetoothListeningMode:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayCornerMasks:(id)a3;
- (void)setMediaRemoteData:(id)a3 completionHandler:(id)a4;
- (void)setMuted:(BOOL)a3;
- (void)setSecondDisplayEnabled:(BOOL)a3;
- (void)setSecondDisplayMode:(id)a3 completionHandler:(id)a4;
- (void)setSiriForwardingEnabled:(BOOL)a3;
- (void)setVolume:(float)a3;
- (void)suggestUIWithURLs:(id)a3 completionHandler:(id)a4;
- (void)takeScreenForClient:(id)a3 reason:(id)a4;
- (void)updateFrecencyScore;
@end

@implementation AVOutputDevice

- (int64_t)deviceType
{
  return self->_outputDevice->deviceType;
}

- (int64_t)deviceSubType
{
  return self->_outputDevice->deviceSubType;
}

- (id)modelID
{
  return self->_outputDevice->modelID;
}

- (id)identifyingMACAddress
{
  return self->_outputDevice->MACAddress;
}

- (unint64_t)deviceFeatures
{
  return self->_outputDevice->deviceFeatures;
}

+ (id)sharedLocalDevice
{
  v2 = objc_alloc_init(AVLocalOutputDeviceImpl);
  v3 = [[AVOutputDevice alloc] initWithOutputDeviceImpl:v2 commChannelManager:0];

  return v3;
}

- (AVOutputDevice)initWithOutputDeviceImpl:(id)a3 commChannelManager:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVOutputDevice;
  v6 = [(AVOutputDevice *)&v9 init];
  if (v6
    && (v6->_outputDevice = objc_alloc_init(AVOutputDeviceInternal),
        (v6->_outputDevice->impl = (AVOutputDeviceImpl *)a3) != 0))
  {
    v6->_outputDevice->name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "name"), "copy");
    v6->_outputDevice->ID = (NSString *)objc_msgSend((id)objc_msgSend(a3, "ID"), "copy");
    v6->_outputDevice->deviceType = [a3 deviceType];
    v6->_outputDevice->deviceSubType = [a3 deviceSubType];
    v6->_outputDevice->manufacturer = (NSString *)objc_msgSend((id)objc_msgSend(a3, "manufacturer"), "copy");
    v6->_outputDevice->modelID = (NSString *)objc_msgSend((id)objc_msgSend(a3, "modelID"), "copy");
    v6->_outputDevice->serialNumber = (NSString *)objc_msgSend((id)objc_msgSend(a3, "serialNumber"), "copy");
    v6->_outputDevice->firmwareVersion = (NSString *)objc_msgSend((id)objc_msgSend(a3, "firmwareVersion"), "copy");
    v6->_outputDevice->MACAddress = (NSData *)objc_msgSend((id)objc_msgSend(a3, "identifyingMACAddress"), "copy");
    v6->_outputDevice->deviceFeatures = [a3 deviceFeatures];
    [(AVOutputDeviceImpl *)v6->_outputDevice->impl setImplEventListener:v6];
    v6->_outputDevice->commChannelManager = (AVOutputDeviceCommunicationChannelManager *)a4;
    [(AVOutputDeviceCommunicationChannelManager *)v6->_outputDevice->commChannelManager setParentOutputDevice:v6];
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)name
{
  return self->_outputDevice->name;
}

- (double)frecencyScore
{
  id v2 = [(AVOutputDevice *)self ID];
  +[AVOutputDeviceFrecencyManager frecencyScoreForDeviceID:v2];
  return result;
}

- (id)deviceID
{
  return self->_outputDevice->ID;
}

+ (BOOL)prefersRouteDescriptors
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"UseFigRouteDescriptor", @"com.apple.avfoundation", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    int AppBooleanValue = objc_msgSend(+[AVExecutionEnvironment sharedExecutionEnvironment](AVExecutionEnvironment, "sharedExecutionEnvironment"), "platformIdentifier") != (void)@"AVPlatformIdentifierMacOS";
  }
  return AppBooleanValue != 0;
}

+ (AVOutputDevice)outputDeviceWithRouteDescriptor:(__CFDictionary *)a3 routeDiscoverer:(OpaqueFigRouteDiscoverer *)a4
{
  FigVolumeControllerCopySharedControllerRemote();
  uint64_t v6 = AVDefaultRoutingContextFactory();
  v7 = [[AVFigRouteDescriptorOutputDeviceImpl alloc] initWithRouteDescriptor:a3 routeDiscoverer:a4 volumeController:0 routingContextFactory:v6 useRouteConfigUpdatedNotification:AVOutputContextUsesRouteConfigUpdatedNotification() routingContext:0];
  v8 = [[AVSystemRemotePoolOutputDeviceCommunicationChannelManager alloc] initWithDeviceID:[(AVFigRouteDescriptorOutputDeviceImpl *)v7 ID]];
  objc_super v9 = [[AVOutputDevice alloc] initWithOutputDeviceImpl:v7 commChannelManager:v8];

  return v9;
}

+ (AVOutputDevice)outputDeviceWithRouteDescriptor:(__CFDictionary *)a3 withRoutingContext:(OpaqueFigRoutingContext *)a4
{
  if (a3)
  {
    uint64_t v6 = (const void *)AVOutputDeviceCopySharedRouteDiscovererForRouteDescriptor((uint64_t)a3);
    FigVolumeControllerCopySharedControllerRemote();
    uint64_t v7 = AVDefaultRoutingContextFactory();
    v8 = [[AVFigRouteDescriptorOutputDeviceImpl alloc] initWithRouteDescriptor:a3 routeDiscoverer:v6 volumeController:0 routingContextFactory:v7 useRouteConfigUpdatedNotification:AVOutputContextUsesRouteConfigUpdatedNotification() routingContext:a4];
    objc_super v9 = [[AVSystemRemotePoolOutputDeviceCommunicationChannelManager alloc] initWithDeviceID:[(AVFigRouteDescriptorOutputDeviceImpl *)v8 ID]];
    v10 = [[AVOutputDevice alloc] initWithOutputDeviceImpl:v8 commChannelManager:v9];
    if (v6) {
      CFRelease(v6);
    }
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)clusterID
{
  id v2 = [(AVOutputDevice *)self impl];
  return (id)[v2 clusterID];
}

- (id)availableBluetoothListeningModes
{
  id v2 = [(AVOutputDevice *)self impl];
  return (id)[v2 availableBluetoothListeningModes];
}

- (id)headTrackedSpatialAudioMode
{
  id v2 = [(AVOutputDevice *)self impl];
  return (id)[v2 headTrackedSpatialAudioMode];
}

- (int64_t)configuredClusterSize
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 configuredClusterSize];
}

- (BOOL)isHeadTrackedSpatialAudioActive
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 isHeadTrackedSpatialAudioActive];
}

- (BOOL)isConversationDetectionEnabled
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 isConversationDetectionEnabled];
}

- (id)currentBluetoothListeningMode
{
  id v2 = [(AVOutputDevice *)self impl];
  return (id)[v2 currentBluetoothListeningMode];
}

- (BOOL)isAppleAccessory
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 isAppleAccessory];
}

- (BOOL)isClusterLeader
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 isClusterLeader];
}

- (BOOL)supportsHeadTrackedSpatialAudio
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 supportsHeadTrackedSpatialAudio];
}

- (id)connectedPairedDevices
{
  id v2 = [(AVOutputDevice *)self impl];
  return (id)[v2 connectedPairedDevices];
}

- (BOOL)supportsConversationDetection
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 supportsConversationDetection];
}

- (BOOL)requiresAuthorization
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 requiresAuthorization];
}

- (BOOL)producesLowFidelityAudio
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 producesLowFidelityAudio];
}

- (id)logicalDeviceID
{
  id v2 = [(AVOutputDevice *)self impl];
  return (id)[v2 logicalDeviceID];
}

- (BOOL)isMuted
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 isMuted];
}

- (id)groupID
{
  id v2 = [(AVOutputDevice *)self impl];
  return (id)[v2 groupID];
}

- (BOOL)isInUseByPairedDevice
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 isInUseByPairedDevice];
}

- (int64_t)HAPConformance
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 HAPConformance];
}

- (BOOL)supportsBluetoothSharing
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 supportsBluetoothSharing];
}

- (BOOL)canRelayCommunicationChannel
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 canRelayCommunicationChannel];
}

- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets];
}

- (BOOL)canAccessRemoteAssets
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 canAccessRemoteAssets];
}

- (BOOL)supportsBufferedAirPlay
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 supportsBufferedAirPlay];
}

- (BOOL)groupContainsGroupLeader
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 groupContainsGroupLeader];
}

- (BOOL)canFetchMediaDataFromSender
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 canFetchMediaDataFromSender];
}

- (BOOL)canAccessiCloudMusicLibrary
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 canAccessiCloudMusicLibrary];
}

- (BOOL)canBeGroupLeader
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 canBeGroupLeader];
}

- (BOOL)canAccessAppleMusic
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 canAccessAppleMusic];
}

- (BOOL)canPlayEncryptedProgressiveDownloadAssets
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 canPlayEncryptedProgressiveDownloadAssets];
}

- (BOOL)hasBatteryLevel
{
  return objc_msgSend(-[AVOutputDevice impl](self, "impl"), "batteryLevel") != 0;
}

- (int64_t)clusterType
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 clusterType];
}

- (id)modelSpecificInformation
{
  v3 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  uint64_t v4 = objc_msgSend(-[AVOutputDevice impl](self, "impl"), "caseBatteryLevel");
  if (v4) {
    [v3 setObject:v4 forKey:@"AVOutputDeviceBatteryLevelCaseKey"];
  }
  uint64_t v5 = objc_msgSend(-[AVOutputDevice impl](self, "impl"), "leftBatteryLevel");
  if (v5) {
    [v3 setObject:v5 forKey:@"AVOutputDeviceBatteryLevelLeftKey"];
  }
  uint64_t v6 = objc_msgSend(-[AVOutputDevice impl](self, "impl"), "rightBatteryLevel");
  if (v6) {
    [v3 setObject:v6 forKey:@"AVOutputDeviceBatteryLevelRightKey"];
  }
  uint64_t v7 = objc_msgSend(-[AVOutputDevice impl](self, "impl"), "supportsDataOverACLProtocol");
  if (v7) {
    [v3 setObject:v7 forKey:@"AVOutputDeviceSupportsDataOverACLProtocolKey"];
  }
  uint64_t v8 = objc_msgSend(-[AVOutputDevice impl](self, "impl"), "isInEar");
  if (v8) {
    [v3 setObject:v8 forKey:@"AVOutputDeviceIsInEarKey"];
  }
  objc_super v9 = (void *)[v3 copy];
  return v9;
}

- (id)clusteredDeviceDescriptions
{
  id v2 = [(AVOutputDevice *)self impl];
  return (id)[v2 clusteredDeviceDescriptions];
}

- (BOOL)isGroupLeader
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 isGroupLeader];
}

- (BOOL)canBeGrouped
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 canBeGrouped];
}

- (int64_t)volumeControlType
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 volumeControlType];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [a3 impl];
  id v6 = [(AVOutputDevice *)self impl];
  return [v6 isEqual:v5];
}

- (id)airPlayProperties
{
  id v2 = [(AVOutputDevice *)self impl];
  return (id)[v2 airPlayProperties];
}

- (id)impl
{
  return self->_outputDevice->impl;
}

- (void)dealloc
{
  outputDevice = self->_outputDevice;
  if (outputDevice)
  {
  }
  v4.receiver = self;
  v4.super_class = (Class)AVOutputDevice;
  [(AVOutputDevice *)&v4 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (AVOutputDevice)init
{
  objc_super v4 = self;
  v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Not available", v5, v6, v7, v8, v9, v11), 0 reason userInfo];
  objc_exception_throw(v10);
}

- (unint64_t)hash
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 hash];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@: %@", -[AVOutputDevice name](self, "name"), -[AVOutputDevice ID](self, "ID")];
}

- (id)manufacturer
{
  return self->_outputDevice->manufacturer;
}

- (id)serialNumber
{
  return self->_outputDevice->serialNumber;
}

- (id)firmwareVersion
{
  return self->_outputDevice->firmwareVersion;
}

- (BOOL)isEligibleToBePredictedOutputDevice
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 isEligibleToBePredictedOutputDevice];
}

- (BOOL)isActivatedForContinuityScreen
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 isActivatedForContinuityScreen];
}

- (float)batteryLevel
{
  id v2 = objc_msgSend(-[AVOutputDevice impl](self, "impl"), "batteryLevel");
  [v2 floatValue];
  return result;
}

- (BOOL)automaticallyAllowsConnectionsFromPeersInHomeGroup
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 automaticallyAllowsConnectionsFromPeersInHomeGroup];
}

- (BOOL)onlyAllowsConnectionsFromPeersInHomeGroup
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 onlyAllowsConnectionsFromPeersInHomeGroup];
}

- (void)setSecondDisplayEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(-[AVOutputDevice impl](self, "impl", v6, v7), "setSecondDisplayEnabled:", v3);
}

- (void)setSecondDisplayMode:(id)a3 completionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    int v13 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v8 = [(AVOutputDevice *)self impl];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__AVOutputDevice_setSecondDisplayMode_completionHandler___block_invoke;
  v11[3] = &unk_1E57B5868;
  v11[4] = a4;
  [v8 setSecondDisplayMode:a3 completionHandler:v11];
}

uint64_t __57__AVOutputDevice_setSecondDisplayMode_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (float)volume
{
  id v2 = [(AVOutputDevice *)self impl];
  [v2 volume];
  return result;
}

- (void)outputDeviceImplDidChangeVolume:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, v5, v6), "postNotificationName:object:", @"AVOutputDeviceVolumeDidChangeNotification", self);
}

- (BOOL)canSetVolume
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 canSetVolume];
}

- (void)outputDeviceImplDidChangeCanChangeVolume:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, v5, v6), "postNotificationName:object:", @"AVOutputDeviceCanSetVolumeDidChangeNotification", self);
}

- (void)outputDeviceImplDidChangeVolumeControlType:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, v5, v6), "postNotificationName:object:", @"AVOutputDeviceVolumeControlTypeDidChangeNotification", self);
}

- (void)outputDeviceImplDidChangeMute:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, v5, v6), "postNotificationName:object:", @"AVOutputDeviceMutedDidChangeNotification", self);
}

- (void)postNotification:(id)a3 fromImpl:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, a4, v7, v8), "postNotificationName:object:", a3, self);
}

- (void)postNotification:(id)a3 withPayload:(id)a4 fromImpl:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, a4, a5, v9, v10), "postNotificationName:object:userInfo:", a3, self, a4);
}

- (void)outputDeviceImplCanMuteDidChange:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, v5, v6), "postNotificationName:object:", @"AVOutputDeviceCanMuteDidChangeNotification", self);
}

- (void)activatedDeviceClusterMembersDidChangeVolume:(id)a3 forRoomID:(__CFString *)a4
{
  v11[20] = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v10 = @"AVOutputDeviceActivatedClusterMembersRoomIDKey";
  v11[0] = a4;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1, v8, v9);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"AVOutputDeviceActivatedClusterMembersRoomVolumeDidChangeNotification", self, v7);
}

+ (void)localDeviceDidChange
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v3, v4), "postNotificationName:object:", @"AVOutputDeviceLocalDeviceDidChangeNotification", objc_opt_class());
}

- (void)setVolume:(float)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v6 = [(AVOutputDevice *)self impl];
  *(float *)&double v7 = a3;
  [v6 setVolume:v7];
}

- (void)increaseVolumeByCount:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(-[AVOutputDevice impl](self, "impl", v6, v7), "increaseVolumeByCount:", a3);
}

- (void)decreaseVolumeByCount:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(-[AVOutputDevice impl](self, "impl", v6, v7), "decreaseVolumeByCount:", a3);
}

- (void)setActivatedDeviceClusterMembersVolume:(float)a3 withRoomID:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v8 = [(AVOutputDevice *)self impl];
  *(float *)&double v9 = a3;
  [v8 setActivatedDeviceClusterMembersVolume:a4 withRoomID:v9];
}

- (float)volumeForActivatedDeviceClusterMembersWithRoomID:(id)a3
{
  id v4 = [(AVOutputDevice *)self impl];
  [v4 volumeForActivatedDeviceClusterMembersWithRoomID:a3];
  return result;
}

- (BOOL)canMute
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 canMute];
}

- (void)setMuted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(-[AVOutputDevice impl](self, "impl", v6, v7), "setMuted:", v3);
}

- (id)proposedGroupID
{
  id v2 = [(AVOutputDevice *)self impl];
  return (id)[v2 proposedGroupID];
}

- (void)outputDeviceImplDidChangeProposedGroupID:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, v5, v6), "postNotificationName:object:", @"AVOutputDeviceProposedGroupIDDidChangeNotification", self);
}

- (BOOL)participatesInGroupPlayback
{
  id v3 = [(AVOutputDevice *)self groupID];
  if (v3)
  {
    id v4 = [(AVOutputDevice *)self impl];
    LOBYTE(v3) = [v4 participatesInGroupPlayback];
  }
  return (char)v3;
}

- (BOOL)isLogicalDeviceLeader
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 isLogicalDeviceLeader];
}

- (BOOL)canCommunicateWithAllLogicalDeviceMembers
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 canCommunicateWithAllLogicalDeviceMembers];
}

- (BOOL)allowsHeadTrackedSpatialAudio
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 allowsHeadTrackedSpatialAudio];
}

- (BOOL)setAllowsHeadTrackedSpatialAudio:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend(-[AVOutputDevice impl](self, "impl", v9, v10), "setAllowsHeadTrackedSpatialAudio:error:", v5, a4);
}

- (BOOL)setConversationDetectionEnabled:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  id v6 = [(AVOutputDevice *)self impl];
  return [v6 setConversationDetectionEnabled:v5 error:a4];
}

- (BOOL)setHeadTrackedSpatialAudioMode:(id)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend(-[AVOutputDevice impl](self, "impl", v9, v10), "setHeadTrackedSpatialAudioMode:error:", a3, a4);
}

- (void)setCurrentBluetoothListeningMode:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVOutputDevice setCurrentBluetoothListeningMode:error:](self, "setCurrentBluetoothListeningMode:error:", a3, 0, v6, v7);
}

- (BOOL)setCurrentBluetoothListeningMode:(id)a3 error:(id *)a4
{
  v17[20] = *(id *)MEMORY[0x1E4F143B8];
  v17[0] = 0;
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int v8 = objc_msgSend(-[AVOutputDevice impl](self, "impl", v15, v16), "setCurrentBluetoothListeningMode:error:", a3, v17);
  BOOL v9 = v8;
  if (a4 && !v8 && v17[0])
  {
    uint64_t v10 = [v17[0] code];
    if (v10 == 1852797029)
    {
      id v11 = (id)AVLocalizedError(@"AVFoundationErrorDomain", -11910, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:v17[0] forKey:*MEMORY[0x1E4F28A50]]);
    }
    else
    {
      signed int v12 = v10;
      int v13 = (void *)[v17[0] domain];
      if ([v13 isEqualToString:*MEMORY[0x1E4F28760]]) {
        id v11 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v12, 0);
      }
      else {
        id v11 = v17[0];
      }
    }
    *a4 = v11;
  }
  return v9;
}

- (BOOL)supportsFitnessDataDestination
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 supportsFitnessDataDestination];
}

- (BOOL)supportsScreenMirroringControls
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 supportsScreenMirroringControls];
}

- (void)openCommunicationChannelWithOptions:(id)a3 completionHandler:(id)a4
{
}

- (void)openCommunicationChannelToDestination:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v8 = (void *)[a4 objectForKeyedSubscript:@"AVOutputDeviceCommunicationChannelOptionCancelIfAuthRequired"];
  uint64_t v9 = [a4 objectForKeyedSubscript:@"AVOutputDeviceCommunicationChannelOptionCorrelationID"];
  uint64_t v10 = [a4 objectForKeyedSubscript:@"AVOutputDeviceCommunicationChannelOptionInitiator"];
  uint64_t v11 = [a4 objectForKeyedSubscript:@"AVOutputContextAddOutputDeviceOptionAuthorizationToken"];
  uint64_t v24 = [a4 objectForKeyedSubscript:@"AVOutputDeviceCommunicationChannelOptionControlType"];
  uint64_t v12 = [a4 objectForKeyedSubscript:@"AVOutputDeviceCommunicationChannelOptionClientUUID"];
  uint64_t v23 = [a4 objectForKeyedSubscript:@"AVOutputDeviceCommunicationChannelOptionQualityOfService"];
  uint64_t v22 = [a4 objectForKeyedSubscript:@"AVOutputDeviceCommunicationChannelOptionStreamPriority"];
  uint64_t v21 = [a4 objectForKeyedSubscript:@"AVOutputDeviceCommunicationChannelOptionAwaitReply"];
  if (dword_1EB2D3A40)
  {
    int v28 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ([(AVOutputDevice *)self deviceType] == 2) {
    id v14 = +[AVOutputContext sharedSystemRemoteDisplayContext];
  }
  else {
    id v14 = +[AVOutputContext sharedSystemRemotePoolContext];
  }
  uint64_t v15 = v14;
  if (v14)
  {
    uint64_t v16 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    v17 = v16;
    if (v9) {
      [v16 setObject:v9 forKeyedSubscript:0x1EE5A1FD8];
    }
    if (v10) {
      [v17 setObject:v10 forKeyedSubscript:@"AVOutputContextAddOutputDeviceOptionInitiator"];
    }
    if ([v8 BOOLValue]) {
      [v17 setObject:v8 forKeyedSubscript:@"AVOutputContextAddOutputDeviceCancelIfAuthRequiredKey"];
    }
    if (v11) {
      [v17 setObject:v11 forKeyedSubscript:@"AVOutputContextAddOutputDeviceOptionAuthorizationToken"];
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __82__AVOutputDevice_openCommunicationChannelToDestination_options_completionHandler___block_invoke;
    v26[3] = &unk_1E57B5890;
    v26[4] = v24;
    v26[5] = a3;
    v26[6] = v9;
    v26[7] = v12;
    v26[8] = v23;
    v26[9] = v22;
    v26[10] = v21;
    v26[11] = v15;
    v26[12] = self;
    v26[13] = a5;
    [v15 addOutputDevice:self options:v17 completionHandler:v26];
  }
  else
  {
    uint64_t v18 = AVLocalizedError(@"AVFoundationErrorDomain", -11800, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Error retrieving system remote pool context." forKey:*MEMORY[0x1E4F28228]]);
    (*((void (**)(id, void, uint64_t, void))a5 + 2))(a5, 0, v18, 0);
  }
}

void __82__AVOutputDevice_openCommunicationChannelToDestination_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  cf[16] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  CFTypeRef v35 = 0;
  CFArrayRef theArray = 0;
  p_superclass = &OBJC_METACLASS___AVFigRouteDescriptorFigRoutingContextOutputDeviceTranslator.superclass;
  if ([a2 status] != 2)
  {
    [a2 cancellationReason];
    Mutable = 0;
    uint64_t v10 = 0;
    goto LABEL_55;
  }
  uint64_t v5 = *MEMORY[0x1E4F1CF80];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  uint64_t v7 = *(void **)(a1 + 32);
  if (v7)
  {
    if ([v7 isEqualToString:@"AVOutputDeviceCommunicationChannelControlTypeDirect"])
    {
      char v8 = 0;
      uint64_t v9 = 2;
    }
    else
    {
      unsigned int v11 = [*(id *)(a1 + 32) isEqualToString:@"AVOutputDeviceCommunicationChannelControlTypeRelayed"];
      char v8 = v11 ^ 1;
      uint64_t v9 = v11;
    }
  }
  else
  {
    uint64_t v9 = 0;
    char v8 = 1;
  }
  if ([*(id *)(a1 + 40) isEqualToString:@"AVOutputDeviceCommunicationChannelDataDestinationMediaRemote"]|| objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", @"AVOutputDeviceCommunicationChannelDataDestinationFitness")|| objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", @"AVOutputDeviceCommunicationChannelDataDestinationCarPlayData")|| objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", @"AVOutputDeviceCommunicationChannelDataDestinationCarPlayDataVersionTwo")|| objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", @"AVOutputDeviceCommunicationChannelDataDestinationCarPlayDataUpdate")
    || [*(id *)(a1 + 40) isEqualToString:@"AVOutputDeviceCommunicationChannelDataDestinationCarPlayDataLogging"])
  {
    if (v8) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  [*(id *)(a1 + 40) isEqualToString:@"AVOutputDeviceCommunicationChannelDataDestinationCarPlayClusterControl"];
  if ((v8 & 1) == 0) {
LABEL_15:
  }
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F21108], (const void *)[MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v9]);
LABEL_16:
  FigCFDictionarySetValue();
  FigCFDictionarySetValue();
  FigCFDictionarySetInt32();
  FigCFDictionarySetValue();
  FigCFDictionarySetValue();
  FigCFDictionarySetValue();
  uint64_t v12 = *(void **)(a1 + 80);
  if (v12)
  {
    [v12 BOOLValue];
    FigCFDictionarySetValue();
  }
  uint64_t v13 = [*(id *)(a1 + 88) figRoutingContext];
  if (!v13)
  {
    AVLocalizedError(@"AVFoundationErrorDomain", -11800, 0);
    goto LABEL_54;
  }
  uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = *(uint64_t (**)(uint64_t, CFArrayRef *))(v15 + 56);
  if (v16)
  {
    signed int v17 = v16(v13, &theArray);
    if (v17)
    {
      signed int v31 = v17;
      goto LABEL_53;
    }
    if (!theArray) {
      goto LABEL_43;
    }
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count < 1) {
      goto LABEL_43;
    }
    CFIndex v19 = Count;
    CFIndex v20 = 0;
    uint64_t v21 = *MEMORY[0x1E4F20E38];
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, v20);
      cf[0] = 0;
      uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
      uint64_t v24 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v24) {
        uint64_t v25 = v24;
      }
      else {
        uint64_t v25 = 0;
      }
      v26 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(v25 + 48);
      if (v26) {
        v26(CMBaseObject, v21, v5, cf);
      }
      [*(id *)(a1 + 96) deviceID];
      if (FigCFEqual()) {
        break;
      }
      if (cf[0]) {
        CFRelease(cf[0]);
      }
      if (v19 == ++v20) {
        goto LABEL_43;
      }
    }
    if (cf[0]) {
      CFRelease(cf[0]);
    }
    if (!ValueAtIndex || (FigEndpointExtendedGetClassID(), !CMBaseObjectIsMemberOfClass()))
    {
LABEL_43:
      AVLocalizedError(@"AVFoundationErrorDomain", -11800, 0);
      uint64_t v10 = 0;
      p_superclass = (__objc2_class **)(&OBJC_METACLASS___AVFigRouteDescriptorFigRoutingContextOutputDeviceTranslator + 8);
      goto LABEL_55;
    }
    p_superclass = &OBJC_METACLASS___AVFigRouteDescriptorFigRoutingContextOutputDeviceTranslator.superclass;
    if (dword_1EB2D3A40)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      p_superclass = (__objc2_class **)(&OBJC_METACLASS___AVFigRouteDescriptorFigRoutingContextOutputDeviceTranslator + 8);
    }
    uint64_t v28 = *(void *)(CMBaseObjectGetVTable() + 24);
    if (v28) {
      uint64_t v29 = v28;
    }
    else {
      uint64_t v29 = 0;
    }
    v30 = *(uint64_t (**)(const void *, __CFDictionary *, CFTypeRef *))(v29 + 80);
    if (v30)
    {
      signed int v31 = v30(ValueAtIndex, Mutable, &v35);
      if (!v31)
      {
        v32 = [AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl alloc];
        v33 = [(AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl *)v32 initWithRemoteControlSession:v35];
        uint64_t v10 = [[AVOutputDeviceCommunicationChannel alloc] initWithOutputDeviceCommunicationChannelImpl:v33];

        goto LABEL_55;
      }
      goto LABEL_53;
    }
  }
  signed int v31 = -12782;
LABEL_53:
  AVLocalizedErrorWithUnderlyingOSStatus(v31, 0);
LABEL_54:
  uint64_t v10 = 0;
LABEL_55:
  (*(void (**)(void, AVOutputDeviceCommunicationChannel *))(*(void *)(a1 + 104) + 16))(*(void *)(a1 + 104), v10);
  if (*((_DWORD *)p_superclass + 656))
  {
    v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v35) {
    CFRelease(v35);
  }
  if (theArray) {
    CFRelease(theArray);
  }
}

- (void)setCommunicationChannelDelegate:(id)a3
{
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_storeWeak((id *)&self->_outputDevice->communicationChannelDelegate, a3);
}

- (id)communicationChannelDelegate
{
  return objc_loadWeak((id *)&self->_outputDevice->communicationChannelDelegate);
}

- (void)communicationChannelManager:(id)a3 didReceiveData:(id)a4 fromCommunicationChannel:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id Weak = objc_loadWeak((id *)&self->_outputDevice->communicationChannelDelegate);
  if (objc_opt_respondsToSelector())
  {
    if (dword_1EB2D3A40)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(Weak, "outputDevice:didReceiveData:fromCommunicationChannel:", self, a4, a5, v11, v12);
  }
  else if (dword_1EB2D3A40)
  {
    uint64_t v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)communicationChannelManager:(id)a3 didCloseCommunicationChannel:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id Weak = objc_loadWeak((id *)&self->_outputDevice->communicationChannelDelegate);
  if (objc_opt_respondsToSelector())
  {
    if (dword_1EB2D3A40)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(Weak, "outputDevice:didCloseCommunicationChannel:", self, a4, v9, v10);
  }
  else if (dword_1EB2D3A40)
  {
    char v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)configureUsingBlock:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [a4 objectForKeyedSubscript:@"AVOutputDeviceConfigurationOptionCancelConfigurationIfAuthRequired"];
  if (dword_1EB2D3A40)
  {
    int v15 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v10 = [(AVOutputDevice *)self impl];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__AVOutputDevice_configureUsingBlock_options_completionHandler___block_invoke;
  v13[3] = &unk_1E57B58B8;
  v13[4] = a5;
  [v10 configureUsingBlock:a3 options:a4 completionHandler:v13];
}

uint64_t __64__AVOutputDevice_configureUsingBlock_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2);
}

- (void)configureUsingBlock:(id)a3 completionHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    int v12 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__AVOutputDevice_configureUsingBlock_completionHandler___block_invoke;
  v10[3] = &unk_1E57B58B8;
  v10[4] = a4;
  -[AVOutputDevice configureUsingBlock:options:completionHandler:](self, "configureUsingBlock:options:completionHandler:", a3, 0, v10, v8, v9);
}

uint64_t __56__AVOutputDevice_configureUsingBlock_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a3);
}

- (void)setMediaRemoteData:(id)a3 completionHandler:(id)a4
{
  id v6 = [(AVOutputDevice *)self impl];
  [v6 setMediaRemoteData:a3 completionHandler:a4];
}

- (void)updateFrecencyScore
{
  id v2 = [(AVOutputDevice *)self ID];
  +[AVOutputDeviceFrecencyManager updateFrecencyListForDeviceID:v2];
}

- (id)OEMIcons
{
  id v2 = [(AVOutputDevice *)self impl];
  return (id)[v2 OEMIcons];
}

- (id)OEMIconLabel
{
  id v2 = [(AVOutputDevice *)self impl];
  return (id)[v2 OEMIconLabel];
}

- (BOOL)OEMIconVisible
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 OEMIconVisible];
}

- (id)outputDeviceHIDs
{
  id v2 = [(AVOutputDevice *)self impl];
  return (id)[v2 outputDeviceHIDs];
}

- (BOOL)nightMode
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 nightMode];
}

- (BOOL)isNightModeSupported
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 isNightModeSupported];
}

- (BOOL)rightHandDrive
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 rightHandDrive];
}

- (id)limitedUIElements
{
  id v2 = [(AVOutputDevice *)self impl];
  return (id)[v2 limitedUIElements];
}

- (BOOL)limitedUI
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 limitedUI];
}

- (BOOL)carOwnsScreen
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 carOwnsScreen];
}

- (BOOL)ownsTurnByTurnNavigation
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 ownsTurnByTurnNavigation];
}

- (BOOL)recognizingSpeech
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 recognizingSpeech];
}

- (id)supportedFeatures
{
  id v2 = [(AVOutputDevice *)self impl];
  return (id)[v2 supportedFeatures];
}

- (int64_t)electronicTollCollection
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 electronicTollCollection];
}

- (int64_t)navigationAidedDriving
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 navigationAidedDriving];
}

- (int64_t)transportType
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 transportType];
}

- (id)MFiCertificateSerialNumber
{
  id v2 = [(AVOutputDevice *)self impl];
  return (id)[v2 MFiCertificateSerialNumber];
}

- (void)requestViewArea:(int64_t)a3 forScreenID:(id)a4
{
  id v6 = [(AVOutputDevice *)self impl];
  [v6 requestViewArea:a3 forScreenID:a4];
}

- (void)requestCarUIForURL:(id)a3 withUUID:(id)a4
{
  id v6 = [(AVOutputDevice *)self impl];
  [v6 requestCarUIForURL:a3 withUUID:a4];
}

- (id)requestTurnByTurnNavigationOwnership
{
  id v2 = [(AVOutputDevice *)self impl];
  return (id)[v2 requestTurnByTurnNavigationOwnership];
}

- (id)borrowScreenForClient:(id)a3 reason:(id)a4
{
  id v6 = [(AVOutputDevice *)self impl];
  return (id)[v6 borrowScreenForClient:a3 reason:a4];
}

- (void)takeScreenForClient:(id)a3 reason:(id)a4
{
  id v6 = [(AVOutputDevice *)self impl];
  [v6 takeScreenForClient:a3 reason:a4];
}

- (BOOL)siriForwardingEnabled
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 siriForwardingEnabled];
}

- (void)setSiriForwardingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AVOutputDevice *)self impl];
  [v4 setSiriForwardingEnabled:v3];
}

- (BOOL)carOwnsMainAudio
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 carOwnsMainAudio];
}

- (id)displayCornerMasks
{
  id v2 = [(AVOutputDevice *)self impl];
  return (id)[v2 displayCornerMasks];
}

- (void)setDisplayCornerMasks:(id)a3
{
  id v4 = [(AVOutputDevice *)self impl];
  [v4 setDisplayCornerMasks:a3];
}

- (int64_t)voiceTriggerMode
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 voiceTriggerMode];
}

- (int64_t)authenticationType
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 authenticationType];
}

- (id)currentScreenViewAreaForScreenID:(id)a3
{
  id v4 = [(AVOutputDevice *)self impl];
  return (id)[v4 currentScreenViewAreaForScreenID:a3];
}

- (BOOL)isActivated
{
  id v2 = [(AVOutputDevice *)self impl];
  return [v2 isActivated];
}

- (id)screens
{
  id v2 = [(AVOutputDevice *)self impl];
  return (id)[v2 screens];
}

- (id)outputDeviceInfo
{
  id v2 = [(AVOutputDevice *)self impl];
  return (id)[v2 outputDeviceInfo];
}

- (void)suggestUIWithURLs:(id)a3 completionHandler:(id)a4
{
  id v6 = [(AVOutputDevice *)self impl];
  [v6 suggestUIWithURLs:a3 completionHandler:a4];
}

- (void)performHapticFeedbackForUUID:(id)a3 withHapticType:(id)a4 completionHandler:(id)a5
{
  id v8 = [(AVOutputDevice *)self impl];
  [v8 performHapticFeedbackForUUID:a3 withHapticType:a4 completionHandler:a5];
}

- (void)setDelegate:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(-[AVOutputDevice impl](self, "impl", v6, v7), "setDelegate:", a3);
}

- (id)delegate
{
  id v2 = [(AVOutputDevice *)self impl];
  return (id)[v2 delegate];
}

+ (AVOutputDevice)outputDeviceWithRouteDescriptor:(__CFDictionary *)a3 volumeController:(OpaqueFigVolumeControllerState *)a4
{
  uint64_t v6 = (const void *)AVOutputDeviceCopySharedRouteDiscovererForRouteDescriptor((uint64_t)a3);
  uint64_t v7 = AVDefaultRoutingContextFactory();
  uint64_t v8 = [[AVFigRouteDescriptorOutputDeviceImpl alloc] initWithRouteDescriptor:a3 routeDiscoverer:v6 volumeController:a4 routingContextFactory:v7 useRouteConfigUpdatedNotification:AVOutputContextUsesRouteConfigUpdatedNotification() routingContext:0];
  uint64_t v9 = [[AVSystemRemotePoolOutputDeviceCommunicationChannelManager alloc] initWithDeviceID:[(AVFigRouteDescriptorOutputDeviceImpl *)v8 ID]];
  id v10 = [[AVOutputDevice alloc] initWithOutputDeviceImpl:v8 commChannelManager:v9];
  if (v6) {
    CFRelease(v6);
  }

  return v10;
}

+ (AVOutputDevice)outputDeviceWithRouteDescriptor:(__CFDictionary *)a3 routingContextFactory:(id)a4
{
  uint64_t v6 = (const void *)AVOutputDeviceCopySharedRouteDiscovererForRouteDescriptor((uint64_t)a3);
  FigVolumeControllerCopySharedControllerRemote();
  uint64_t v7 = [[AVFigRouteDescriptorOutputDeviceImpl alloc] initWithRouteDescriptor:a3 routeDiscoverer:v6 volumeController:0 routingContextFactory:a4 useRouteConfigUpdatedNotification:AVOutputContextUsesRouteConfigUpdatedNotification() routingContext:0];
  uint64_t v8 = [[AVSystemRemotePoolOutputDeviceCommunicationChannelManager alloc] initWithDeviceID:[(AVFigRouteDescriptorOutputDeviceImpl *)v7 ID]];
  uint64_t v9 = [[AVOutputDevice alloc] initWithOutputDeviceImpl:v7 commChannelManager:v8];
  if (v6) {
    CFRelease(v6);
  }

  return v9;
}

+ (AVOutputDevice)outputDeviceWithRouteDescriptor:(__CFDictionary *)a3
{
  return (AVOutputDevice *)[a1 outputDeviceWithRouteDescriptor:a3 withRoutingContext:0];
}

+ (AVOutputDevice)outputDeviceWithFigEndpoint:(OpaqueFigEndpoint *)a3
{
  FigVolumeControllerCopySharedControllerRemote();
  uint64_t v5 = AVDefaultRoutingContextFactory();
  if (a3)
  {
    uint64_t v6 = [[AVFigEndpointOutputDeviceImpl alloc] initWithFigEndpoint:a3 volumeController:0 routingContextFactory:v5 useRouteConfigUpdatedNotification:AVOutputContextUsesRouteConfigUpdatedNotification()];
    a3 = [[AVSystemRemotePoolOutputDeviceCommunicationChannelManager alloc] initWithDeviceID:[(AVFigEndpointOutputDeviceImpl *)v6 ID]];
    uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithOutputDeviceImpl:v6 commChannelManager:a3];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (AVOutputDevice *)v7;
}

+ (AVOutputDevice)outputDeviceWithFigEndpoint:(OpaqueFigEndpoint *)a3 volumeController:(OpaqueFigVolumeControllerState *)a4
{
  uint64_t v7 = AVDefaultRoutingContextFactory();
  uint64_t v8 = [[AVFigEndpointOutputDeviceImpl alloc] initWithFigEndpoint:a3 volumeController:a4 routingContextFactory:v7 useRouteConfigUpdatedNotification:AVOutputContextUsesRouteConfigUpdatedNotification()];
  uint64_t v9 = [[AVSystemRemotePoolOutputDeviceCommunicationChannelManager alloc] initWithDeviceID:[(AVFigEndpointOutputDeviceImpl *)v8 ID]];
  id v10 = (void *)[objc_alloc((Class)a1) initWithOutputDeviceImpl:v8 commChannelManager:v9];

  return (AVOutputDevice *)v10;
}

+ (AVOutputDevice)outputDeviceWithFigEndpoint:(OpaqueFigEndpoint *)a3 routingContextFactory:(id)a4
{
  FigVolumeControllerCopySharedControllerRemote();
  uint64_t v7 = [[AVFigEndpointOutputDeviceImpl alloc] initWithFigEndpoint:a3 volumeController:0 routingContextFactory:a4 useRouteConfigUpdatedNotification:AVOutputContextUsesRouteConfigUpdatedNotification()];
  uint64_t v8 = [[AVSystemRemotePoolOutputDeviceCommunicationChannelManager alloc] initWithDeviceID:[(AVFigEndpointOutputDeviceImpl *)v7 ID]];
  uint64_t v9 = (void *)[objc_alloc((Class)a1) initWithOutputDeviceImpl:v7 commChannelManager:v8];

  return (AVOutputDevice *)v9;
}

- (id)figEndpointOutputDeviceImpl
{
  id v2 = [(AVOutputDevice *)self impl];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

@end