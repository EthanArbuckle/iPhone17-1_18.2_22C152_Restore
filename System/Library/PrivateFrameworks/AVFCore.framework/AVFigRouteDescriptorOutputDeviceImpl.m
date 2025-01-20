@interface AVFigRouteDescriptorOutputDeviceImpl
- (AVFigRouteDescriptorOutputDeviceImpl)init;
- (AVFigRouteDescriptorOutputDeviceImpl)initWithRouteDescriptor:(__CFDictionary *)a3 routeDiscoverer:(OpaqueFigRouteDiscoverer *)a4 volumeController:(OpaqueFigVolumeControllerState *)a5 routingContextFactory:(id)a6 useRouteConfigUpdatedNotification:(BOOL)a7 routingContext:(OpaqueFigRoutingContext *)a8;
- (AVOutputDeviceDelegate)delegate;
- (AVOutputDeviceImplSupport)implEventListener;
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
- (NSArray)OEMIcons;
- (NSArray)availableBluetoothListeningModes;
- (NSArray)clusteredDeviceDescriptions;
- (NSArray)connectedPairedDevices;
- (NSArray)limitedUIElements;
- (NSArray)outputDeviceHIDs;
- (NSArray)screens;
- (NSArray)supportedFeatures;
- (NSData)MFiCertificateSerialNumber;
- (NSData)identifyingMACAddress;
- (NSDictionary)airPlayProperties;
- (NSDictionary)displayCornerMasks;
- (NSDictionary)outputDeviceInfo;
- (NSNumber)batteryLevel;
- (NSNumber)caseBatteryLevel;
- (NSNumber)isInEar;
- (NSNumber)leftBatteryLevel;
- (NSNumber)rightBatteryLevel;
- (NSNumber)supportsDataOverACLProtocol;
- (NSString)ID;
- (NSString)OEMIconLabel;
- (NSString)clusterID;
- (NSString)currentBluetoothListeningMode;
- (NSString)firmwareVersion;
- (NSString)groupID;
- (NSString)headTrackedSpatialAudioMode;
- (NSString)logicalDeviceID;
- (NSString)manufacturer;
- (NSString)modelID;
- (NSString)name;
- (NSString)proposedGroupID;
- (NSString)serialNumber;
- (__CFDictionary)routeDescriptor;
- (float)volume;
- (float)volumeForActivatedDeviceClusterMembersWithRoomID:(id)a3;
- (id)borrowScreenForClient:(id)a3 reason:(id)a4;
- (id)currentScreenViewAreaForScreenID:(id)a3;
- (id)requestTurnByTurnNavigationOwnership;
- (int)_withEndpoint:(id)a3;
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
- (void)_canMuteDidChangeForEndpointWithID:(__CFString *)a3;
- (void)_canSetEndpointVolumeDidChangeForEndpointWithID:(__CFString *)a3;
- (void)_carPlayTestNotification:(id)a3;
- (void)_endpointVolumeControlTypeDidChangeForEndpointWithID:(__CFString *)a3;
- (void)_handleRouteDescriptionEvent:(__CFString *)a3 payload:(id)a4;
- (void)_iOSUIRequestedNotification:(id)a3;
- (void)_mutedDidChangeForEndpointWithID:(__CFString *)a3;
- (void)_routeDescriptionDidChange:(__CFDictionary *)a3;
- (void)_siriRequestedNotification:(id)a3;
- (void)_unhandledRemoteCommandNotification:(id)a3;
- (void)_vehicleInformationDidChange:(id)a3;
- (void)_volumeDidChangeForEndpointWithID:(__CFString *)a3;
- (void)_volumeForEndpointDidChange:(__CFString *)a3 forRoomID:(__CFString *)a4;
- (void)configureUsingBlock:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)decreaseVolumeByCount:(int64_t)a3;
- (void)increaseVolumeByCount:(int64_t)a3;
- (void)performHapticFeedbackForUUID:(id)a3 withHapticType:(id)a4 completionHandler:(id)a5;
- (void)requestCarUIForURL:(id)a3 withUUID:(id)a4;
- (void)requestViewArea:(int64_t)a3 forScreenID:(id)a4;
- (void)setActivatedDeviceClusterMembersVolume:(float)a3 withRoomID:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDisplayCornerMasks:(id)a3;
- (void)setImplEventListener:(id)a3;
- (void)setMediaRemoteData:(id)a3 completionHandler:(id)a4;
- (void)setMuted:(BOOL)a3;
- (void)setRouteDescriptor:(__CFDictionary *)a3;
- (void)setSecondDisplayEnabled:(BOOL)a3;
- (void)setSecondDisplayMode:(id)a3 completionHandler:(id)a4;
- (void)setSiriForwardingEnabled:(BOOL)a3;
- (void)setVolume:(float)a3;
- (void)suggestUIWithURLs:(id)a3 completionHandler:(id)a4;
- (void)takeScreenForClient:(id)a3 reason:(id)a4;
@end

@implementation AVFigRouteDescriptorOutputDeviceImpl

- (BOOL)canFetchMediaDataFromSender
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  return objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F752E8]), "BOOLValue") ^ 1;
}

- (unint64_t)deviceFeatures
{
  v3 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  unint64_t v4 = objc_msgSend((id)CFDictionaryGetValue(v3, (const void *)*MEMORY[0x1E4F75418]), "BOOLValue");
  v5 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  if (objc_msgSend((id)CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E4F75410]), "BOOLValue")) {
    v4 |= 4uLL;
  }
  v6 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  if (objc_msgSend((id)CFDictionaryGetValue(v6, (const void *)*MEMORY[0x1E4F75408]), "BOOLValue")) {
    return v4 | 2;
  }
  else {
    return v4;
  }
}

- (int64_t)volumeControlType
{
  volumeController = self->_volumeController;
  if (!volumeController) {
    return 0;
  }
  uint64_t v9 = 0;
  v3 = [(AVFigRouteDescriptorOutputDeviceImpl *)self ID];
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  v7 = *(void (**)(OpaqueFigVolumeControllerState *, NSString *, uint64_t *))(v5 + 88);
  if (v7)
  {
    v7(volumeController, v3, &v9);
    uint64_t v8 = v9;
  }
  else
  {
    uint64_t v8 = 0;
  }
  return AVOutputDeviceVolumeControlTypeFromFigType(v8);
}

- (NSArray)clusteredDeviceDescriptions
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  Value = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F752C0]);
  return (NSArray *)AVOutputDeviceDescriptionsFromFigDescriptions(Value);
}

- (BOOL)isGroupLeader
{
  return 0;
}

- (BOOL)canBeGrouped
{
  return 0;
}

- (NSString)ID
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  v3 = (const void *)*MEMORY[0x1E4F75420];
  return (NSString *)CFDictionaryGetValue(v2, v3);
}

- (NSDictionary)airPlayProperties
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  v3 = (const void *)*MEMORY[0x1E4F75160];
  return (NSDictionary *)CFDictionaryGetValue(v2, v3);
}

- (__CFDictionary)routeDescriptor
{
  FigReadWriteLockLockForRead();
  v3 = self->_routeDescriptor;
  FigReadWriteLockUnlockForRead();
  return v3;
}

- (void)setImplEventListener:(id)a3
{
}

- (NSString)serialNumber
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  v3 = (const void *)*MEMORY[0x1E4F75428];
  return (NSString *)CFDictionaryGetValue(v2, v3);
}

- (NSString)name
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  v3 = (const void *)*MEMORY[0x1E4F753F8];
  return (NSString *)CFDictionaryGetValue(v2, v3);
}

- (NSString)modelID
{
  v3 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  result = (NSString *)CFDictionaryGetValue(v3, (const void *)*MEMORY[0x1E4F753A0]);
  if (!result)
  {
    uint64_t v5 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
    Value = (NSString *)CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E4F75400]);
    AVStringForOSType(0x6A333237u);
    if (FigCFEqual()) {
      return Value;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (NSString)manufacturer
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  v3 = (const void *)*MEMORY[0x1E4F75398];
  return (NSString *)CFDictionaryGetValue(v2, v3);
}

- (NSData)identifyingMACAddress
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  v3 = (const void *)*MEMORY[0x1E4F75390];
  return (NSData *)CFDictionaryGetValue(v2, v3);
}

- (NSString)firmwareVersion
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  v3 = (const void *)*MEMORY[0x1E4F75300];
  return (NSString *)CFDictionaryGetValue(v2, v3);
}

- (int64_t)deviceType
{
  uint64_t v3 = 0;
  AVOutputDeviceGetDeviceTypeAndSubTypeFromRouteDescriptor([(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor], &v3, 0);
  return v3;
}

- (int64_t)deviceSubType
{
  uint64_t v3 = 0;
  AVOutputDeviceGetDeviceTypeAndSubTypeFromRouteDescriptor([(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor], 0, &v3);
  return v3;
}

- (NSArray)availableBluetoothListeningModes
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  char v3 = objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F752A0]), "unsignedIntegerValue");
  return (NSArray *)AVOutputDeviceSupportedListeningModesForFigListeningModes(v3);
}

- (NSString)currentBluetoothListeningMode
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  int v3 = objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F75298]), "unsignedIntegerValue");
  return (NSString *)AVOutputDeviceAVFListeningModeForFigListeningMode(v3);
}

- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  return objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F752F0]), "BOOLValue") ^ 1;
}

- (BOOL)canPlayEncryptedProgressiveDownloadAssets
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  return objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F752F8]), "BOOLValue") ^ 1;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(AVFigRouteDescriptorOutputDeviceImpl *)self ID];
  uint64_t v6 = [a3 ID];
  return [(NSString *)v5 isEqualToString:v6];
}

- (NSArray)connectedPairedDevices
{
  v19 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  int v3 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v3, (const void *)*MEMORY[0x1E4F753A8]);
  CFIndex v5 = 0;
  v17 = (void *)*MEMORY[0x1E4F753B8];
  key = (void *)*MEMORY[0x1E4F753D0];
  v16 = (void *)*MEMORY[0x1E4F753B0];
  uint64_t v6 = (const void *)*MEMORY[0x1E4F753C8];
  v7 = (const void *)*MEMORY[0x1E4F753C0];
  if (!Value) {
    goto LABEL_3;
  }
LABEL_2:
  for (CFIndex i = CFArrayGetCount(Value); v5 < i; CFIndex i = 0)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, v5);
    v10 = CFDictionaryGetValue(ValueAtIndex, key);
    v11 = CFDictionaryGetValue(ValueAtIndex, v17);
    v12 = CFDictionaryGetValue(ValueAtIndex, v16);
    v13 = CFDictionaryGetValue(ValueAtIndex, v6);
    v14 = -[AVPairedDevice initWithName:ID:modelID:playing:productName:]([AVPairedDevice alloc], "initWithName:ID:modelID:playing:productName:", v11, v10, v12, objc_msgSend((id)CFDictionaryGetValue(ValueAtIndex, v7), "BOOLValue"), v13);
    [(NSArray *)v19 addObject:v14];

    ++v5;
    if (Value) {
      goto LABEL_2;
    }
LABEL_3:
    ;
  }
  return v19;
}

- (BOOL)supportsBufferedAirPlay
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  CFArrayRef Value = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F75430]);
  return [Value BOOLValue];
}

- (BOOL)canAccessiCloudMusicLibrary
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  CFArrayRef Value = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F752B0]);
  return [Value BOOLValue];
}

- (BOOL)canAccessRemoteAssets
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  CFArrayRef Value = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F753F0]);
  return [Value BOOLValue];
}

- (BOOL)canAccessAppleMusic
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  CFArrayRef Value = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F75330]);
  return [Value BOOLValue];
}

- (BOOL)supportsBluetoothSharing
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  CFArrayRef Value = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F75338]);
  return [Value BOOLValue];
}

- (int64_t)HAPConformance
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  if (objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F75158]), "BOOLValue")) {
    return 2;
  }
  else {
    return 0;
  }
}

- (BOOL)supportsConversationDetection
{
  int IsConversationDetectionFeatureEnabled = AVOutputDeviceIsConversationDetectionFeatureEnabled();
  if (IsConversationDetectionFeatureEnabled)
  {
    CFArrayRef Value = (void *)CFDictionaryGetValue([(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor], @"SupportsConversationDetect");
    LOBYTE(IsConversationDetectionFeatureEnabled) = [Value BOOLValue];
  }
  return IsConversationDetectionFeatureEnabled;
}

- (BOOL)isConversationDetectionEnabled
{
  int IsConversationDetectionFeatureEnabled = AVOutputDeviceIsConversationDetectionFeatureEnabled();
  if (IsConversationDetectionFeatureEnabled)
  {
    CFArrayRef Value = (void *)CFDictionaryGetValue([(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor], @"ConversationDetectEnable");
    LOBYTE(IsConversationDetectionFeatureEnabled) = [Value BOOLValue];
  }
  return IsConversationDetectionFeatureEnabled;
}

- (NSString)groupID
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  int v3 = (const void *)*MEMORY[0x1E4F75310];
  return (NSString *)CFDictionaryGetValue(v2, v3);
}

- (BOOL)isInUseByPairedDevice
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  CFArrayRef Value = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F75348]);
  return [Value BOOLValue];
}

- (NSNumber)batteryLevel
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  int v3 = (const void *)*MEMORY[0x1E4F75280];
  return (NSNumber *)CFDictionaryGetValue(v2, v3);
}

- (NSNumber)supportsDataOverACLProtocol
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  int v3 = (const void *)*MEMORY[0x1E4F752A8];
  return (NSNumber *)CFDictionaryGetValue(v2, v3);
}

- (NSNumber)rightBatteryLevel
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  int v3 = (const void *)*MEMORY[0x1E4F75278];
  return (NSNumber *)CFDictionaryGetValue(v2, v3);
}

- (NSNumber)leftBatteryLevel
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  int v3 = (const void *)*MEMORY[0x1E4F75270];
  return (NSNumber *)CFDictionaryGetValue(v2, v3);
}

- (NSNumber)isInEar
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  int v3 = (const void *)*MEMORY[0x1E4F753E0];
  return (NSNumber *)CFDictionaryGetValue(v2, v3);
}

- (NSNumber)caseBatteryLevel
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  int v3 = (const void *)*MEMORY[0x1E4F75268];
  return (NSNumber *)CFDictionaryGetValue(v2, v3);
}

- (NSString)logicalDeviceID
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  int v3 = (const void *)*MEMORY[0x1E4F75460];
  return (NSString *)CFDictionaryGetValue(v2, v3);
}

- (NSString)clusterID
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  int v3 = (const void *)*MEMORY[0x1E4F753D8];
  return (NSString *)CFDictionaryGetValue(v2, v3);
}

- (BOOL)groupContainsGroupLeader
{
  return 0;
}

- (BOOL)canRelayCommunicationChannel
{
  return 0;
}

- (BOOL)canBeGroupLeader
{
  return 0;
}

- (BOOL)supportsHeadTrackedSpatialAudio
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  CFArrayRef Value = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F75440]);
  return [Value BOOLValue];
}

- (BOOL)isHeadTrackedSpatialAudioActive
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  CFArrayRef Value = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F75320]);
  return [Value BOOLValue];
}

- (NSString)headTrackedSpatialAudioMode
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F75328]);
  return (NSString *)AVOutputDeviceHeadTrackedSpatialAudioModeFromFigMode(Value);
}

- (int64_t)configuredClusterSize
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  CFNumberRef Value = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F752D8]);
  return [Value integerValue];
}

- (BOOL)requiresAuthorization
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F75168]);
  return FigCFEqual() == 0;
}

- (BOOL)producesLowFidelityAudio
{
  return 0;
}

- (BOOL)isClusterLeader
{
  return 0;
}

- (int64_t)clusterType
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F752E0]);
  if (FigCFEqual()) {
    return 2;
  }
  else {
    return FigCFEqual() != 0;
  }
}

- (BOOL)isMuted
{
  volumeController = self->_volumeController;
  if (!volumeController) {
    return 0;
  }
  int v3 = [(AVFigRouteDescriptorOutputDeviceImpl *)self ID];
  return AVOutputDeviceImplIsMutedForEndpointID((uint64_t)volumeController, (uint64_t)v3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_implSupportEventListener);
}

- (void)dealloc
{
  if (self->_weakObserver)
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    uint64_t v4 = v3;
    if (self->_volumeController)
    {
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigRouteDescriptorOutputDeviceImplCanSetEndpointVolumeDidChange, *MEMORY[0x1E4F757F0]);
      [v4 removeListenerWithWeakReference:self->_weakObserver callback:AVFigRouteDescriptorOutputDeviceImplEndpointVolumeDidChange name:*MEMORY[0x1E4F75818] object:self->_volumeController];
      [v4 removeListenerWithWeakReference:self->_weakObserver callback:AVFigRouteDescriptorOutputDeviceImplEndpointVolumeControlTypeDidChange name:*MEMORY[0x1E4F75810] object:self->_volumeController];
      [v4 removeListenerWithWeakReference:self->_weakObserver callback:AVFigRouteDescriptorOutputDeviceImplEndpointMutedDidChange name:*MEMORY[0x1E4F75808] object:self->_volumeController];
      [v4 removeListenerWithWeakReference:self->_weakObserver callback:AVFigRouteDescriptorOutputDeviceImplEndpointCanMuteDidChange name:*MEMORY[0x1E4F75830] object:self->_volumeController];
      [v4 removeListenerWithWeakReference:self->_weakObserver callback:AVFigRouteDescriptorOutputDeviceImplEndpointRoomVolumeDidChange name:*MEMORY[0x1E4F75848] object:self->_volumeController];
    }
    weakObserver = self->_weakObserver;
    if (self->_routingContext)
    {
      objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", weakObserver, AVFigRouteDescriptorOutputDeviceImplRouteDescriptionEvent, @"routeDescriptionEvent");
      weakObserver = self->_weakObserver;
    }
  }
  else
  {
    weakObserver = 0;
  }

  routeDescriptor = self->_routeDescriptor;
  if (routeDescriptor) {
    CFRelease(routeDescriptor);
  }
  routeDiscoverer = self->_routeDiscoverer;
  if (routeDiscoverer) {
    CFRelease(routeDiscoverer);
  }
  volumeController = self->_volumeController;
  if (volumeController) {
    CFRelease(volumeController);
  }
  routingContext = self->_routingContext;
  if (routingContext) {
    CFRelease(routingContext);
  }
  if (self->_routeDescriptionRWLock)
  {
    FigReadWriteLockDestroy();
    self->_routeDescriptionRWLock = 0;
  }

  v10.receiver = self;
  v10.super_class = (Class)AVFigRouteDescriptorOutputDeviceImpl;
  [(AVFigRouteDescriptorOutputDeviceImpl *)&v10 dealloc];
}

- (AVFigRouteDescriptorOutputDeviceImpl)initWithRouteDescriptor:(__CFDictionary *)a3 routeDiscoverer:(OpaqueFigRouteDiscoverer *)a4 volumeController:(OpaqueFigVolumeControllerState *)a5 routingContextFactory:(id)a6 useRouteConfigUpdatedNotification:(BOOL)a7 routingContext:(OpaqueFigRoutingContext *)a8
{
  id v15 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  v28.receiver = self;
  v28.super_class = (Class)AVFigRouteDescriptorOutputDeviceImpl;
  v16 = [(AVFigRouteDescriptorOutputDeviceImpl *)&v28 init];
  v17 = v16;
  if (!v16) {
    goto LABEL_21;
  }
  if (!a3)
  {
    v21 = 0;
    v16->_routeDescriptor = 0;
    goto LABEL_20;
  }
  v18 = (__CFDictionary *)CFRetain(a3);
  v17->_routeDescriptor = v18;
  if (!v18) {
    goto LABEL_21;
  }
  if (!a4)
  {
    v21 = 0;
    v17->_routeDiscoverer = 0;
    goto LABEL_20;
  }
  v19 = (OpaqueFigRouteDiscoverer *)CFRetain(a4);
  v17->_routeDiscoverer = v19;
  if (!v19
    || (!a5 ? (v20 = 0) : (v20 = (OpaqueFigVolumeControllerState *)CFRetain(a5)),
        v17->_volumeController = v20,
        v22 = (FigRoutingContextFactory *)a6,
        (v17->_routingContextFactory = v22) == 0))
  {
LABEL_21:
    v21 = 0;
    goto LABEL_20;
  }
  v17->_useRouteConfigUpdatedNotification = a7;
  if (a8) {
    v23 = (OpaqueFigRoutingContext *)CFRetain(a8);
  }
  else {
    v23 = 0;
  }
  v17->_routingContext = v23;
  v17->_routeDescriptionRWLock = (OpaqueFigReadWriteLock *)FigReadWriteLockCreate();
  v24 = [[AVWeakReference alloc] initWithReferencedObject:v17];
  v17->_weakObserver = v24;
  volumeController = v17->_volumeController;
  if (volumeController)
  {
    [v15 addListenerWithWeakReference:v24 callback:AVFigRouteDescriptorOutputDeviceImplCanSetEndpointVolumeDidChange name:*MEMORY[0x1E4F757F0] object:volumeController flags:0];
    [v15 addListenerWithWeakReference:v17->_weakObserver callback:AVFigRouteDescriptorOutputDeviceImplEndpointVolumeDidChange name:*MEMORY[0x1E4F75818] object:v17->_volumeController flags:0];
    [v15 addListenerWithWeakReference:v17->_weakObserver callback:AVFigRouteDescriptorOutputDeviceImplEndpointVolumeControlTypeDidChange name:*MEMORY[0x1E4F75810] object:v17->_volumeController flags:0];
    [v15 addListenerWithWeakReference:v17->_weakObserver callback:AVFigRouteDescriptorOutputDeviceImplEndpointMutedDidChange name:*MEMORY[0x1E4F75808] object:v17->_volumeController flags:0];
    [v15 addListenerWithWeakReference:v17->_weakObserver callback:AVFigRouteDescriptorOutputDeviceImplEndpointCanMuteDidChange name:*MEMORY[0x1E4F75830] object:v17->_volumeController flags:0];
    [v15 addListenerWithWeakReference:v17->_weakObserver callback:AVFigRouteDescriptorOutputDeviceImplEndpointRoomVolumeDidChange name:*MEMORY[0x1E4F75848] object:v17->_volumeController flags:0];
  }
  routingContext = v17->_routingContext;
  if (routingContext) {
    [v15 addListenerWithWeakReference:v17->_weakObserver callback:AVFigRouteDescriptorOutputDeviceImplRouteDescriptionEvent name:@"routeDescriptionEvent" object:routingContext flags:0];
  }
  v21 = v17;
LABEL_20:

  return v21;
}

- (BOOL)isAppleAccessory
{
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
    FigCFDictionaryGetBooleanIfPresent();
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (AVFigRouteDescriptorOutputDeviceImpl)init
{
  return [(AVFigRouteDescriptorOutputDeviceImpl *)self initWithRouteDescriptor:0 routeDiscoverer:0 volumeController:0 routingContextFactory:0 useRouteConfigUpdatedNotification:0 routingContext:0];
}

- (unint64_t)hash
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self ID];
  return [(NSString *)v2 hash];
}

- (void)setRouteDescriptor:(__CFDictionary *)a3
{
  FigReadWriteLockLockForWrite();
  routeDescriptor = self->_routeDescriptor;
  self->_routeDescriptor = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (routeDescriptor) {
    CFRelease(routeDescriptor);
  }
  routeDescriptionRWLock = self->_routeDescriptionRWLock;
  MEMORY[0x1F40DDF98](routeDescriptionRWLock);
}

- (BOOL)isEligibleToBePredictedOutputDevice
{
  return 0;
}

- (BOOL)isActivatedForContinuityScreen
{
  return 0;
}

- (BOOL)automaticallyAllowsConnectionsFromPeersInHomeGroup
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F75360]);
  if (Value) {
    LOBYTE(Value) = CFBooleanGetValue(Value) != 0;
  }
  return (char)Value;
}

- (BOOL)onlyAllowsConnectionsFromPeersInHomeGroup
{
  BOOL v3 = [(AVFigRouteDescriptorOutputDeviceImpl *)self automaticallyAllowsConnectionsFromPeersInHomeGroup];
  if (v3)
  {
    uint64_t v4 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
    CFDictionaryGetValue(v4, (const void *)*MEMORY[0x1E4F75318]);
    LOBYTE(v3) = FigCFEqual() == 0;
  }
  return v3;
}

- (BOOL)allowsHeadTrackedSpatialAudio
{
  v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  CFBooleanRef Value = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E4F75178]);
  return [Value BOOLValue];
}

- (BOOL)setAllowsHeadTrackedSpatialAudio:(BOOL)a3 error:(id *)a4
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__AVFigRouteDescriptorOutputDeviceImpl_setAllowsHeadTrackedSpatialAudio_error___block_invoke;
  v8[3] = &__block_descriptor_33_e28_i16__0__OpaqueFigEndpoint__8l;
  BOOL v9 = a3;
  signed int v5 = [(AVFigRouteDescriptorOutputDeviceImpl *)self _withEndpoint:v8];
  signed int v6 = v5;
  if (a4 && v5) {
    *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v5, 0);
  }
  return v6 == 0;
}

uint64_t __79__AVFigRouteDescriptorOutputDeviceImpl_setAllowsHeadTrackedSpatialAudio_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return AVOutputDeviceSetAllowsHeadTrackedSpatialAudioOnEndpoint(a2, *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)setHeadTrackedSpatialAudioMode:(id)a3 error:(id *)a4
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__AVFigRouteDescriptorOutputDeviceImpl_setHeadTrackedSpatialAudioMode_error___block_invoke;
  v8[3] = &unk_1E57B5978;
  void v8[4] = a3;
  signed int v5 = [(AVFigRouteDescriptorOutputDeviceImpl *)self _withEndpoint:v8];
  signed int v6 = v5;
  if (a4 && v5) {
    *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v5, 0);
  }
  return v6 == 0;
}

uint64_t __77__AVFigRouteDescriptorOutputDeviceImpl_setHeadTrackedSpatialAudioMode_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return AVOutputDeviceSetHeadTrackedSpatialAudioModeOnEndpoint(a2, *(void **)(a1 + 32));
}

- (BOOL)setConversationDetectionEnabled:(BOOL)a3 error:(id *)a4
{
  if (AVOutputDeviceIsConversationDetectionFeatureEnabled())
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __78__AVFigRouteDescriptorOutputDeviceImpl_setConversationDetectionEnabled_error___block_invoke;
    v11[3] = &__block_descriptor_33_e28_i16__0__OpaqueFigEndpoint__8l;
    BOOL v12 = a3;
    signed int v7 = [(AVFigRouteDescriptorOutputDeviceImpl *)self _withEndpoint:v11];
    signed int v8 = v7;
    if (a4)
    {
      if (v7) {
        *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v7, 0);
      }
    }
    return v8 == 0;
  }
  else if (a4)
  {
    objc_super v10 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(-11862, 0);
    BOOL result = 0;
    *a4 = v10;
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t __78__AVFigRouteDescriptorOutputDeviceImpl_setConversationDetectionEnabled_error___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32)) {
    v1 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    v1 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  signed int v5 = *(uint64_t (**)(uint64_t, __CFString *, uint64_t))(v4 + 56);
  if (!v5) {
    return 4294954514;
  }
  uint64_t v6 = *v1;
  return v5(CMBaseObject, @"ConversationDetectEnable", v6);
}

- (int)_withEndpoint:(id)a3
{
  cf[16] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  CFArrayRef theArray = 0;
  CFTypeRef v32 = 0;
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  routingContext = self->_routingContext;
  if (routingContext)
  {
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    v13 = *(uint64_t (**)(OpaqueFigRoutingContext *, CFArrayRef *))(v8 + 56);
    if (v13)
    {
      int v14 = v13(routingContext, &theArray);
      if (!v14)
      {
        CFIndex v15 = 0;
        uint64_t v16 = *MEMORY[0x1E4F20E38];
        uint64_t v17 = *MEMORY[0x1E4F1CF80];
        while (1)
        {
          CFIndex Count = (CFIndex)theArray;
          if (theArray) {
            CFIndex Count = CFArrayGetCount(theArray);
          }
          if (v15 >= Count) {
            goto LABEL_36;
          }
          CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(theArray, v15);
          cf[0] = 0;
          uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
          uint64_t v21 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v21) {
            uint64_t v22 = v21;
          }
          else {
            uint64_t v22 = 0;
          }
          v23 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(v22 + 48);
          if (v23) {
            v23(CMBaseObject, v16, v17, cf);
          }
          v24 = [(AVFigRouteDescriptorOutputDeviceImpl *)self ID];
          if ([(NSString *)v24 isEqualToString:cf[0]])
          {
            if (ValueAtIndex) {
              CFTypeRef v26 = CFRetain(ValueAtIndex);
            }
            else {
              CFTypeRef v26 = 0;
            }
            CFTypeRef v32 = v26;
            if (cf[0]) {
              CFRelease(cf[0]);
            }
            if (v26) {
              goto LABEL_28;
            }
            goto LABEL_36;
          }
          if (cf[0]) {
            CFRelease(cf[0]);
          }
          ++v15;
        }
      }
      goto LABEL_37;
    }
LABEL_29:
    int v27 = -12782;
    goto LABEL_38;
  }
  routeDiscoverer = self->_routeDiscoverer;
  objc_super v10 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  v25 = *(uint64_t (**)(OpaqueFigRouteDiscoverer *, __CFDictionary *, CFTypeRef *))(v12 + 8);
  if (!v25) {
    goto LABEL_29;
  }
  int v14 = v25(routeDiscoverer, v10, &v32);
  if (!v14)
  {
    CFTypeRef v26 = v32;
    if (!v32)
    {
LABEL_36:
      int v14 = FigSignalErrorAt();
      goto LABEL_37;
    }
LABEL_28:
    int v14 = (*((uint64_t (**)(id, CFTypeRef))a3 + 2))(a3, v26);
  }
LABEL_37:
  int v27 = v14;
LABEL_38:
  if (v32) {
    CFRelease(v32);
  }
  if (theArray) {
    CFRelease(theArray);
  }
  return v27;
}

- (BOOL)setCurrentBluetoothListeningMode:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int valuePtr = 0;
  CFTypeRef cf = 0;
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  routeDiscoverer = self->_routeDiscoverer;
  BOOL v9 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(uint64_t (**)(OpaqueFigRouteDiscoverer *, __CFDictionary *, CFTypeRef *))(v11 + 8);
  if (v12)
  {
    int v13 = v12(routeDiscoverer, v9, &cf);
    if (v13)
    {
      int v16 = v13;
      CFNumberRef v14 = 0;
      goto LABEL_13;
    }
    if (!cf)
    {
      int v16 = 0;
      return v16 == 0;
    }
    int valuePtr = AVOutputDeviceFigListeningModeForAVFListeningMode(a3);
    CFNumberRef v14 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
    if (dword_1EB2D3A40)
    {
      CFIndex v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
    uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v19) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = 0;
    }
    uint64_t v21 = *(uint64_t (**)(uint64_t, void, CFNumberRef))(v20 + 56);
    if (v21)
    {
      int v16 = v21(CMBaseObject, *MEMORY[0x1E4F20EE8], v14);
      goto LABEL_13;
    }
  }
  else
  {
    CFNumberRef v14 = 0;
  }
  int v16 = -12782;
LABEL_13:
  if (cf) {
    CFRelease(cf);
  }
  if (v14) {
    CFRelease(v14);
  }
  if (a4 && v16)
  {
    *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v16 userInfo:0];
    int v16 = 1;
  }
  return v16 == 0;
}

- (void)setSecondDisplayEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__AVFigRouteDescriptorOutputDeviceImpl_setSecondDisplayEnabled___block_invoke;
  v3[3] = &unk_1E57B59A0;
  v3[4] = self;
  BOOL v4 = a3;
  [(AVFigRouteDescriptorOutputDeviceImpl *)self _withEndpoint:v3];
}

uint64_t __64__AVFigRouteDescriptorOutputDeviceImpl_setSecondDisplayEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) name];
  int v5 = *(unsigned __int8 *)(a1 + 40);
  return AVOutputDeviceSetSecondDisplayEnabledOnEndpoint(a2, v4, v5);
}

- (void)setSecondDisplayMode:(id)a3 completionHandler:(id)a4
{
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__AVFigRouteDescriptorOutputDeviceImpl_setSecondDisplayMode_completionHandler___block_invoke;
  v7[3] = &unk_1E57B59C8;
  v7[4] = a3;
  v7[5] = a4;
  v7[6] = &v8;
  signed int v5 = [(AVFigRouteDescriptorOutputDeviceImpl *)self _withEndpoint:v7];
  if (v5) {
    uint64_t v6 = AVLocalizedErrorWithUnderlyingOSStatus(v5, 0);
  }
  else {
    uint64_t v6 = 0;
  }
  if (*((unsigned char *)v9 + 24)) {
    (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0, v6);
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __79__AVFigRouteDescriptorOutputDeviceImpl_setSecondDisplayMode_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  return 0;
}

- (void)setMediaRemoteData:(id)a3 completionHandler:(id)a4
{
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__AVFigRouteDescriptorOutputDeviceImpl_setMediaRemoteData_completionHandler___block_invoke;
  v7[3] = &unk_1E57B59C8;
  v7[4] = a3;
  v7[5] = a4;
  v7[6] = &v8;
  signed int v5 = [(AVFigRouteDescriptorOutputDeviceImpl *)self _withEndpoint:v7];
  if (v5) {
    uint64_t v6 = AVLocalizedErrorWithUnderlyingOSStatus(v5, 0);
  }
  else {
    uint64_t v6 = 0;
  }
  if (*((unsigned char *)v9 + 24)) {
    (*((void (**)(id, uint64_t))a4 + 2))(a4, v6);
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __77__AVFigRouteDescriptorOutputDeviceImpl_setMediaRemoteData_completionHandler___block_invoke(uint64_t *a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  return 0;
}

- (float)volume
{
  float v9 = 0.0;
  volumeController = self->_volumeController;
  float v3 = 0.0;
  if (volumeController)
  {
    uint64_t v4 = [(AVFigRouteDescriptorOutputDeviceImpl *)self ID];
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void (**)(OpaqueFigVolumeControllerState *, NSString *, float *))(v6 + 72);
    if (v7)
    {
      v7(volumeController, v4, &v9);
      return v9;
    }
  }
  return v3;
}

- (void)_mutedDidChangeForEndpointWithID:(__CFString *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(__CFString *)a3 isEqual:[(AVFigRouteDescriptorOutputDeviceImpl *)self ID]])
  {
    if (dword_1EB2D3A40)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    [(AVOutputDeviceImplSupport *)[(AVFigRouteDescriptorOutputDeviceImpl *)self implEventListener] outputDeviceImplDidChangeMute:self];
  }
}

- (void)_canMuteDidChangeForEndpointWithID:(__CFString *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(__CFString *)a3 isEqual:[(AVFigRouteDescriptorOutputDeviceImpl *)self ID]])
  {
    if (dword_1EB2D3A40)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    [(AVOutputDeviceImplSupport *)[(AVFigRouteDescriptorOutputDeviceImpl *)self implEventListener] outputDeviceImplCanMuteDidChange:self];
  }
}

- (void)_routeDescriptionDidChange:(__CFDictionary *)a3
{
  if (objc_msgSend((id)FigCFDictionaryGetValue(), "isEqual:", -[AVFigRouteDescriptorOutputDeviceImpl ID](self, "ID")))
  {
    [(AVFigRouteDescriptorOutputDeviceImpl *)self setRouteDescriptor:a3];
  }
}

- (void)_handleRouteDescriptionEvent:(__CFString *)a3 payload:(id)a4
{
  if (FigCFEqual())
  {
    [(AVFigRouteDescriptorOutputDeviceImpl *)self _vehicleInformationDidChange:a4];
  }
  else if (FigCFEqual())
  {
    if ([(AVFigRouteDescriptorOutputDeviceImpl *)self delegate])
    {
      [(AVFigRouteDescriptorOutputDeviceImpl *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v7 = [(AVFigRouteDescriptorOutputDeviceImpl *)self delegate];
        uint64_t v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"viewAreaIndex"), "integerValue");
        uint64_t v9 = [a4 objectForKeyedSubscript:@"adjacentViewAreas"];
        uint64_t v10 = [a4 objectForKeyedSubscript:@"uuid"];
        [(AVOutputDeviceDelegate *)v7 setViewAreaIndex:v8 andAdjacentViewAreas:v9 forScreenID:v10];
      }
    }
  }
  else
  {
    char v11 = (void *)AVOutputDeviceNotificationFromFigNotification((uint64_t)a3);
    if ([v11 isEqual:@"AVOutputDeviceCarPlayTestNotification"])
    {
      [(AVFigRouteDescriptorOutputDeviceImpl *)self _carPlayTestNotification:a4];
    }
    else if ([v11 isEqual:@"AVOutputDeviceiOSUIRequestedNotification"])
    {
      [(AVFigRouteDescriptorOutputDeviceImpl *)self _iOSUIRequestedNotification:a4];
    }
    else if ([v11 isEqual:@"AVOutputDeviceSiriRequestedNotification"])
    {
      [(AVFigRouteDescriptorOutputDeviceImpl *)self _siriRequestedNotification:a4];
    }
    else if ([v11 isEqual:@"AVOutputDeviceUnhandledRemoteEventNotification"])
    {
      [(AVFigRouteDescriptorOutputDeviceImpl *)self _unhandledRemoteCommandNotification:a4];
    }
    else if (v11)
    {
      uint64_t v12 = [(AVFigRouteDescriptorOutputDeviceImpl *)self implEventListener];
      [(AVOutputDeviceImplSupport *)v12 postNotification:v11 fromImpl:self];
    }
  }
}

- (void)_iOSUIRequestedNotification:(id)a3
{
  uint64_t v5 = [a3 objectForKey:*MEMORY[0x1E4F215A8]];
  uint64_t v6 = [a3 objectForKey:*MEMORY[0x1E4F215B0]];
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [v7 setValue:v6 forKey:@"AVOutputDeviceiOSUIRequestedDisplayUUIDKey"];
  [v7 setValue:v5 forKey:@"AVOutputDeviceiOSUIRequestedApplicationURLKey"];
  uint64_t v8 = [(AVFigRouteDescriptorOutputDeviceImpl *)self implEventListener];
  [(AVOutputDeviceImplSupport *)v8 postNotification:@"AVOutputDeviceiOSUIRequestedNotification" withPayload:v7 fromImpl:self];
}

- (void)_carPlayTestNotification:(id)a3
{
  [a3 objectForKey:*MEMORY[0x1E4F21280]];
  uint64_t SiriRequestedActionFromFigAction = AVOutputDeviceGetSiriRequestedActionFromFigAction();
  uint64_t v6 = [a3 objectForKey:*MEMORY[0x1E4F21288]];
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v7, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", SiriRequestedActionFromFigAction), @"AVOutputDeviceSiriRequestedActionKey");
  [v7 setValue:v6 forKey:@"AVOutputDeviceSiriRequestedTimestampKey"];
  uint64_t v8 = [(AVFigRouteDescriptorOutputDeviceImpl *)self implEventListener];
  [(AVOutputDeviceImplSupport *)v8 postNotification:@"AVOutputDeviceCarPlayTestNotification" withPayload:v7 fromImpl:self];
}

- (void)_siriRequestedNotification:(id)a3
{
  [a3 objectForKey:*MEMORY[0x1E4F21280]];
  uint64_t SiriRequestedActionFromFigAction = AVOutputDeviceGetSiriRequestedActionFromFigAction();
  uint64_t v6 = [a3 objectForKey:*MEMORY[0x1E4F21288]];
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v7, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", SiriRequestedActionFromFigAction), @"AVOutputDeviceSiriRequestedActionKey");
  [v7 setValue:v6 forKey:@"AVOutputDeviceSiriRequestedTimestampKey"];
  uint64_t v8 = [(AVFigRouteDescriptorOutputDeviceImpl *)self implEventListener];
  [(AVOutputDeviceImplSupport *)v8 postNotification:@"AVOutputDeviceSiriRequestedNotification" withPayload:v7 fromImpl:self];
}

- (void)_unhandledRemoteCommandNotification:(id)a3
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v5, "setValue:forKey:", objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F21588]), @"AVOutputDeviceUnhandledRemoteEventCommandTypeKey");
  objc_msgSend(v5, "setValue:forKey:", objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F21580]), @"AVOutputDeviceUnhandledRemoteEventCommandParametersKey");
  uint64_t v6 = [(AVFigRouteDescriptorOutputDeviceImpl *)self implEventListener];
  [(AVOutputDeviceImplSupport *)v6 postNotification:@"AVOutputDeviceUnhandledRemoteEventNotification" withPayload:v5 fromImpl:self];
}

- (void)_vehicleInformationDidChange:(id)a3
{
  uint64_t v4 = (void *)[a3 objectForKey:*MEMORY[0x1E4F21590]];
  if (v4)
  {
    uint64_t v5 = v4;
    if ([v4 valueForKey:*MEMORY[0x1E4F21598]]) {
      [(AVOutputDeviceImplSupport *)[(AVFigRouteDescriptorOutputDeviceImpl *)self implEventListener] postNotification:@"AVOutputDeviceElectronicTollCollectionStateChangedNotification" fromImpl:self];
    }
    if ([v5 valueForKey:*MEMORY[0x1E4F215A0]])
    {
      uint64_t v6 = [(AVFigRouteDescriptorOutputDeviceImpl *)self implEventListener];
      [(AVOutputDeviceImplSupport *)v6 postNotification:@"AVOutputDeviceNavigationAidedDrivingStateChangedNotification" fromImpl:self];
    }
  }
}

- (void)_volumeDidChangeForEndpointWithID:(__CFString *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(__CFString *)a3 isEqual:[(AVFigRouteDescriptorOutputDeviceImpl *)self ID]])
  {
    if (dword_1EB2D3A40)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    [(AVOutputDeviceImplSupport *)[(AVFigRouteDescriptorOutputDeviceImpl *)self implEventListener] outputDeviceImplDidChangeVolume:self];
  }
}

- (void)_volumeForEndpointDidChange:(__CFString *)a3 forRoomID:(__CFString *)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(__CFString *)a3 isEqual:[(AVFigRouteDescriptorOutputDeviceImpl *)self ID]])
  {
    if (dword_1EB2D3A40)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    [(AVOutputDeviceImplSupport *)[(AVFigRouteDescriptorOutputDeviceImpl *)self implEventListener] activatedDeviceClusterMembersDidChangeVolume:self forRoomID:a4];
  }
}

- (BOOL)canSetVolume
{
  char v8 = 0;
  volumeController = self->_volumeController;
  if (!volumeController) {
    return 0;
  }
  float v3 = [(AVFigRouteDescriptorOutputDeviceImpl *)self ID];
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  uint64_t v5 = v4 ? v4 : 0;
  uint64_t v6 = *(void (**)(OpaqueFigVolumeControllerState *, NSString *, char *))(v5 + 80);
  if (!v6) {
    return 0;
  }
  v6(volumeController, v3, &v8);
  return v8 != 0;
}

- (void)_canSetEndpointVolumeDidChangeForEndpointWithID:(__CFString *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(__CFString *)a3 isEqual:[(AVFigRouteDescriptorOutputDeviceImpl *)self ID]])
  {
    if (dword_1EB2D3A40)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    [(AVOutputDeviceImplSupport *)[(AVFigRouteDescriptorOutputDeviceImpl *)self implEventListener] outputDeviceImplDidChangeCanChangeVolume:self];
  }
}

- (void)_endpointVolumeControlTypeDidChangeForEndpointWithID:(__CFString *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(__CFString *)a3 isEqualToString:[(AVFigRouteDescriptorOutputDeviceImpl *)self ID]])
  {
    if (dword_1EB2D3A40)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    [(AVOutputDeviceImplSupport *)[(AVFigRouteDescriptorOutputDeviceImpl *)self implEventListener] outputDeviceImplDidChangeVolumeControlType:self];
  }
}

- (void)setVolume:(float)a3
{
  if (self->_volumeController)
  {
    uint64_t v5 = [(AVFigRouteDescriptorOutputDeviceImpl *)self ID];
    if (dword_1EB2D3A40)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    volumeController = self->_volumeController;
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = *(void (**)(OpaqueFigVolumeControllerState *, NSString *, float))(v9 + 64);
    if (v10) {
      v10(volumeController, v5, a3);
    }
  }
}

- (void)increaseVolumeByCount:(int64_t)a3
{
  volumeController = self->_volumeController;
  if (volumeController)
  {
    uint64_t v5 = [(AVFigRouteDescriptorOutputDeviceImpl *)self ID];
    AVOutputDeviceImplChangeVolumeByCount((uint64_t)volumeController, (uint64_t)v5, a3);
  }
}

- (void)decreaseVolumeByCount:(int64_t)a3
{
  volumeController = self->_volumeController;
  if (volumeController)
  {
    uint64_t v5 = [(AVFigRouteDescriptorOutputDeviceImpl *)self ID];
    AVOutputDeviceImplChangeVolumeByCount((uint64_t)volumeController, (uint64_t)v5, -a3);
  }
}

- (void)setActivatedDeviceClusterMembersVolume:(float)a3 withRoomID:(id)a4
{
  volumeController = self->_volumeController;
  if (volumeController)
  {
    uint64_t v7 = [(AVFigRouteDescriptorOutputDeviceImpl *)self ID];
    AVOutputDeviceImplChangeRoomVolumeForEndpoint((uint64_t)volumeController, (uint64_t)v7, (uint64_t)a4, a3);
  }
}

- (float)volumeForActivatedDeviceClusterMembersWithRoomID:(id)a3
{
  float v11 = 0.0;
  volumeController = self->_volumeController;
  float v4 = 0.0;
  if (volumeController)
  {
    uint64_t v6 = [(AVFigRouteDescriptorOutputDeviceImpl *)self ID];
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = *(void (**)(OpaqueFigVolumeControllerState *, NSString *, id, float *))(v8 + 216);
    if (v9)
    {
      v9(volumeController, v6, a3, &v11);
      return v11;
    }
  }
  return v4;
}

- (BOOL)canMute
{
  volumeController = self->_volumeController;
  if (!volumeController) {
    return 0;
  }
  float v3 = [(AVFigRouteDescriptorOutputDeviceImpl *)self ID];
  return AVOutputDeviceImplCanMuteForEndpointID((uint64_t)volumeController, (uint64_t)v3);
}

- (void)setMuted:(BOOL)a3
{
  volumeController = self->_volumeController;
  if (volumeController)
  {
    BOOL v4 = a3;
    uint64_t v5 = [(AVFigRouteDescriptorOutputDeviceImpl *)self ID];
    AVOutputDeviceImplSetMutedForEndpointID((uint64_t)volumeController, (uint64_t)v5, v4);
  }
}

- (NSString)proposedGroupID
{
  return 0;
}

- (BOOL)participatesInGroupPlayback
{
  return 1;
}

- (BOOL)isLogicalDeviceLeader
{
  return 0;
}

- (BOOL)canCommunicateWithAllLogicalDeviceMembers
{
  return 1;
}

- (BOOL)supportsFitnessDataDestination
{
  return 0;
}

- (BOOL)supportsScreenMirroringControls
{
  return 0;
}

- (void)configureUsingBlock:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  v27[19] = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  id v9 = +[AVGlobalOperationQueue defaultQueue];
  uint64_t v10 = *MEMORY[0x1E4F1CF80];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"AVOutputDeviceConfigurationOptionCancelConfigurationIfAuthRequired"), "BOOLValue"))CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F75758], (const void *)*MEMORY[0x1E4F1CFD0]); {
  if (dword_1EB2D3A40)
  }
  {
    int v24 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  signed int v13 = -[FigRoutingContextFactory createControlChannelOnlyContextWithAllocator:options:context:](self->_routingContextFactory, "createControlChannelOnlyContextWithAllocator:options:context:", v10, 0, &cf, v20, v21);
  if (v13)
  {
    int v16 = 0;
    goto LABEL_11;
  }
  if (cf)
  {
    CFNumberRef v14 = AVMakeSelectRouteDescriptorOperation(cf, [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor], Mutable, self->_useRouteConfigUpdatedNotification);
    CFIndex v15 = [AVFigRoutingContextSendConfigureDeviceCommandOperation alloc];
    int v16 = [(AVFigRoutingContextSendConfigureDeviceCommandOperation *)v15 initWithRoutingContext:cf configuratorBlock:a3];
    -[AVFigRoutingContextSendConfigureDeviceCommandOperation setName:](v16, "setName:", [NSString stringWithFormat:@"Set configuration on device represented by %@ (impl=%@)", -[AVFigRouteDescriptorOutputDeviceImpl implEventListener](self, "implEventListener"), self]);
    [(AVFigRoutingContextSendConfigureDeviceCommandOperation *)v16 addDependency:v14];
    if (cf)
    {
      CFRetain(cf);
      CFTypeRef v17 = cf;
    }
    else
    {
      CFTypeRef v17 = 0;
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __86__AVFigRouteDescriptorOutputDeviceImpl_configureUsingBlock_options_completionHandler___block_invoke;
    v22[3] = &unk_1E57B59F0;
    v22[4] = v16;
    v22[5] = v14;
    v22[6] = a5;
    v22[7] = v17;
    [(AVFigRoutingContextSendConfigureDeviceCommandOperation *)v16 setCompletionBlock:v22];
    [v9 enqueueOperation:v14];
    [v9 enqueueOperation:v16];
LABEL_11:
    if (cf) {
      goto LABEL_16;
    }
    goto LABEL_12;
  }
  int v16 = 0;
LABEL_12:
  uint64_t v26 = *MEMORY[0x1E4F1D138];
  v27[0] = @"Failed to create FigRoutingContext";
  v18 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  if (v13) {
    uint64_t v19 = AVLocalizedErrorWithUnderlyingOSStatus(v13, v18);
  }
  else {
    uint64_t v19 = AVLocalizedError(@"AVFoundationErrorDomain", -11800, v18);
  }
  (*((void (**)(id, uint64_t, void, void, uint64_t))a5 + 2))(a5, 1, 0, 0, v19);
LABEL_16:
  if (Mutable) {
    CFRelease(Mutable);
  }

  if (cf) {
    CFRelease(cf);
  }
}

void __86__AVFigRouteDescriptorOutputDeviceImpl_configureUsingBlock_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) status];
  switch(v2)
  {
    case 4:
      (*(void (**)(void, uint64_t, void, void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 1, 0, 0, [*(id *)(a1 + 32) error]);
      break;
    case 3:
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "result"), "cancellationReason"), "isEqualToString:", @"AVOutputContextDestinationChangeCancellationReasonAuthorizationSkipped"))float v3 = @"AVOutputDeviceConfigurationCancellationReasonAuthorizationSkipped"; {
      else
      }
        float v3 = 0;
      (*(void (**)(void, uint64_t, void, __CFString *, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 2, 0, v3, 0);
      break;
    case 2:
      (*(void (**)(void, void, uint64_t, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0, [*(id *)(a1 + 32) finalConfiguration], 0, 0);
      break;
    default:
      (*(void (**)(void, uint64_t, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 2, 0, 0, 0);
      break;
  }
  if ([*(id *)(a1 + 40) status] == 2)
  {
    if (dword_1EB2D3A40)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(void (**)(uint64_t, void, void))(v7 + 16);
    if (v8) {
      v8(v5, 0, 0);
    }
  }
  id v9 = *(const void **)(a1 + 56);
  if (v9) {
    CFRelease(v9);
  }
}

- (NSArray)OEMIcons
{
  CFBooleanRef Value = (void *)CFDictionaryGetValue([(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor], @"OEMIcons");
  return (NSArray *)AVOutputDeviceAVOutputDeviceIconsFromOEMIcons(Value);
}

- (NSString)OEMIconLabel
{
  uint64_t v2 = [(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor];
  return (NSString *)CFDictionaryGetValue(v2, @"OEMIconLabel");
}

- (BOOL)OEMIconVisible
{
  return 0;
}

- (NSArray)outputDeviceHIDs
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__21;
  id v9 = __Block_byref_object_dispose__21;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__AVFigRouteDescriptorOutputDeviceImpl_outputDeviceHIDs__block_invoke;
  v4[3] = &unk_1E57B5A18;
  v4[4] = self;
  v4[5] = &v5;
  [(AVFigRouteDescriptorOutputDeviceImpl *)self _withEndpoint:v4];
  uint64_t v2 = (NSArray *)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __56__AVFigRouteDescriptorOutputDeviceImpl_outputDeviceHIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  CFBooleanRef Value = (void *)CFDictionaryGetValue((CFDictionaryRef)[*(id *)(a1 + 32) routeDescriptor], @"HIDs");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = AVOutputDeviceMakeAVOutputDeviceHIDsFromFigHIDs(Value, a2);
  return 0;
}

- (BOOL)nightMode
{
  return 0;
}

- (BOOL)isNightModeSupported
{
  return FigCFDictionaryGetValue() != 0;
}

- (BOOL)rightHandDrive
{
  return 0;
}

- (NSArray)limitedUIElements
{
  CFBooleanRef Value = (void *)CFDictionaryGetValue([(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor], @"LimitedUIElements");
  if (Value)
  {
    id v3 = Value;
    return (NSArray *)v3;
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
    return (NSArray *)[v5 array];
  }
}

- (BOOL)limitedUI
{
  return 0;
}

- (BOOL)carOwnsScreen
{
  return 0;
}

- (BOOL)ownsTurnByTurnNavigation
{
  return 0;
}

- (BOOL)recognizingSpeech
{
  return 0;
}

- (NSArray)supportedFeatures
{
  CFBooleanRef Value = (void *)CFDictionaryGetValue([(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor], @"ExtendedFeatures");
  if (Value)
  {
    id v3 = Value;
    return (NSArray *)v3;
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
    return (NSArray *)[v5 array];
  }
}

- (int64_t)electronicTollCollection
{
  CFBooleanRef Value = (void *)CFDictionaryGetValue([(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor], @"VehicleInformation");
  return AVOutputDeviceElectronicTollCollectionStateFromVehicleInfo(Value);
}

- (int64_t)navigationAidedDriving
{
  CFBooleanRef Value = (void *)CFDictionaryGetValue([(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor], @"VehicleInformation");
  return AVOutputDeviceNavigationAidedDrivingStateFromVehicleInfo(Value);
}

- (int64_t)transportType
{
  CFDictionaryGetValue([(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor], @"TransportType");
  return AVOutputDeviceTransportTypeFromFigTransportType();
}

- (NSData)MFiCertificateSerialNumber
{
  CFBooleanRef Value = (void *)CFDictionaryGetValue([(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor], @"AuthenticationData");
  if (Value)
  {
    id v3 = Value;
    return (NSData *)v3;
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1C9B8];
    return (NSData *)[v5 data];
  }
}

- (void)requestViewArea:(int64_t)a3 forScreenID:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__AVFigRouteDescriptorOutputDeviceImpl_requestViewArea_forScreenID___block_invoke;
  v4[3] = &unk_1E57B5A40;
  v4[4] = a4;
  v4[5] = a3;
  [(AVFigRouteDescriptorOutputDeviceImpl *)self _withEndpoint:v4];
}

uint64_t __68__AVFigRouteDescriptorOutputDeviceImpl_requestViewArea_forScreenID___block_invoke(uint64_t a1, uint64_t a2)
{
  return AVOutputDeviceRequestViewAreaForFigEndpoint(a2, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)requestCarUIForURL:(id)a3 withUUID:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__AVFigRouteDescriptorOutputDeviceImpl_requestCarUIForURL_withUUID___block_invoke;
  v4[3] = &unk_1E57B5A68;
  v4[4] = a4;
  v4[5] = a3;
  [(AVFigRouteDescriptorOutputDeviceImpl *)self _withEndpoint:v4];
}

uint64_t __68__AVFigRouteDescriptorOutputDeviceImpl_requestCarUIForURL_withUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  return AVOutputDeviceRequestCarUIForEndpoint(a2, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (id)requestTurnByTurnNavigationOwnership
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__21;
  id v9 = __Block_byref_object_dispose__21;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__AVFigRouteDescriptorOutputDeviceImpl_requestTurnByTurnNavigationOwnership__block_invoke;
  v4[3] = &unk_1E57B5A90;
  v4[4] = &v5;
  [(AVFigRouteDescriptorOutputDeviceImpl *)self _withEndpoint:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __76__AVFigRouteDescriptorOutputDeviceImpl_requestTurnByTurnNavigationOwnership__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [[AVOutputDeviceTurnByTurnToken alloc] initWithEndpoint:a2];
  return 0;
}

- (id)borrowScreenForClient:(id)a3 reason:(id)a4
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__21;
  float v11 = __Block_byref_object_dispose__21;
  uint64_t v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__AVFigRouteDescriptorOutputDeviceImpl_borrowScreenForClient_reason___block_invoke;
  v6[3] = &unk_1E57B5AB8;
  v6[5] = a4;
  v6[6] = &v7;
  v6[4] = a3;
  [(AVFigRouteDescriptorOutputDeviceImpl *)self _withEndpoint:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __69__AVFigRouteDescriptorOutputDeviceImpl_borrowScreenForClient_reason___block_invoke(void *a1, uint64_t a2)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [[AVOutputDeviceScreenBorrowToken alloc] initWithEndpoint:a2 client:a1[4] reason:a1[5]];
  return 0;
}

- (void)takeScreenForClient:(id)a3 reason:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__AVFigRouteDescriptorOutputDeviceImpl_takeScreenForClient_reason___block_invoke;
  v4[3] = &unk_1E57B5A68;
  v4[4] = a3;
  void v4[5] = a4;
  [(AVFigRouteDescriptorOutputDeviceImpl *)self _withEndpoint:v4];
}

uint64_t __67__AVFigRouteDescriptorOutputDeviceImpl_takeScreenForClient_reason___block_invoke(uint64_t a1, uint64_t a2)
{
  return AVOutputDeviceTakeScreenForClient(a2, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (BOOL)siriForwardingEnabled
{
  return 0;
}

- (void)setSiriForwardingEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__AVFigRouteDescriptorOutputDeviceImpl_setSiriForwardingEnabled___block_invoke;
  v3[3] = &__block_descriptor_33_e28_i16__0__OpaqueFigEndpoint__8l;
  BOOL v4 = a3;
  [(AVFigRouteDescriptorOutputDeviceImpl *)self _withEndpoint:v3];
}

uint64_t __65__AVFigRouteDescriptorOutputDeviceImpl_setSiriForwardingEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
  return AVOutputDeviceSetAlternateSiriOnEndpoint(a2, *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)carOwnsMainAudio
{
  return 0;
}

- (NSDictionary)displayCornerMasks
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__21;
  uint64_t v9 = __Block_byref_object_dispose__21;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__AVFigRouteDescriptorOutputDeviceImpl_displayCornerMasks__block_invoke;
  v4[3] = &unk_1E57B5A90;
  v4[4] = &v5;
  [(AVFigRouteDescriptorOutputDeviceImpl *)self _withEndpoint:v4];
  id v2 = (NSDictionary *)v6[5];
  if (!v2) {
    id v2 = (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionary];
  }
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __58__AVFigRouteDescriptorOutputDeviceImpl_displayCornerMasks__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = AVOutputDeviceGetDisplayCornerMasksFromEndpoint();
  return 0;
}

- (void)setDisplayCornerMasks:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__AVFigRouteDescriptorOutputDeviceImpl_setDisplayCornerMasks___block_invoke;
  v3[3] = &unk_1E57B5978;
  void v3[4] = a3;
  [(AVFigRouteDescriptorOutputDeviceImpl *)self _withEndpoint:v3];
}

uint64_t __62__AVFigRouteDescriptorOutputDeviceImpl_setDisplayCornerMasks___block_invoke(uint64_t a1, uint64_t a2)
{
  return AVOutputDeviceSetDisplayCornerMasksEndpoint(a2, *(void *)(a1 + 32));
}

- (int64_t)voiceTriggerMode
{
  int64_t result = (int64_t)CFDictionaryGetValue([(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor], @"VoiceActivationType");
  if (result)
  {
    return [(id)result unsignedIntegerValue];
  }
  return result;
}

- (int64_t)authenticationType
{
  CFDictionaryGetValue([(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor], @"AuthenticationType");
  return AVOutputDeviceAuthenticationTypeFromFigAuthenticationType();
}

- (id)currentScreenViewAreaForScreenID:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__21;
  uint64_t v10 = __Block_byref_object_dispose__21;
  uint64_t v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__AVFigRouteDescriptorOutputDeviceImpl_currentScreenViewAreaForScreenID___block_invoke;
  v5[3] = &unk_1E57B5A18;
  v5[4] = a3;
  v5[5] = &v6;
  [(AVFigRouteDescriptorOutputDeviceImpl *)self _withEndpoint:v5];
  id v3 = (void *)v7[5];
  if (!v3) {
    id v3 = (void *)[MEMORY[0x1E4F1C9E8] dictionary];
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __73__AVFigRouteDescriptorOutputDeviceImpl_currentScreenViewAreaForScreenID___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = AVOutputDeviceGetCurrentScreenViewAreaFromEndpoint(a2, *(void *)(a1 + 32));
  return 0;
}

- (BOOL)isActivated
{
  return 0;
}

- (NSArray)screens
{
  CFBooleanRef Value = (void *)CFDictionaryGetValue([(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor], @"ScreenInfo");
  return (NSArray *)AVOutputDeviceAVOutputDeviceScreenInfoFromFigScreens(Value);
}

- (NSDictionary)outputDeviceInfo
{
  CFBooleanRef Value = (void *)CFDictionaryGetValue([(AVFigRouteDescriptorOutputDeviceImpl *)self routeDescriptor], @"EndpointInfo");
  if (Value)
  {
    id v3 = Value;
    return (NSDictionary *)v3;
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
    return (NSDictionary *)[v5 dictionary];
  }
}

- (void)suggestUIWithURLs:(id)a3 completionHandler:(id)a4
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__AVFigRouteDescriptorOutputDeviceImpl_suggestUIWithURLs_completionHandler___block_invoke;
  v7[3] = &unk_1E57B5AE0;
  v7[4] = a3;
  v7[5] = a4;
  v7[6] = &v9;
  int v8 = 0;
  signed int v5 = [(AVFigRouteDescriptorOutputDeviceImpl *)self _withEndpoint:v7];
  if (v5) {
    uint64_t v6 = AVLocalizedErrorWithUnderlyingOSStatus(v5, 0);
  }
  else {
    uint64_t v6 = 0;
  }
  if (*((unsigned char *)v10 + 24)) {
    (*((void (**)(id, uint64_t))a4 + 2))(a4, v6);
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __76__AVFigRouteDescriptorOutputDeviceImpl_suggestUIWithURLs_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  return *(unsigned int *)(a1 + 56);
}

- (void)performHapticFeedbackForUUID:(id)a3 withHapticType:(id)a4 completionHandler:(id)a5
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __102__AVFigRouteDescriptorOutputDeviceImpl_performHapticFeedbackForUUID_withHapticType_completionHandler___block_invoke;
  v8[3] = &unk_1E57B5B08;
  void v8[4] = a3;
  void v8[5] = a4;
  v8[6] = a5;
  v8[7] = &v10;
  int v9 = 0;
  signed int v6 = [(AVFigRouteDescriptorOutputDeviceImpl *)self _withEndpoint:v8];
  if (v6) {
    uint64_t v7 = AVLocalizedErrorWithUnderlyingOSStatus(v6, 0);
  }
  else {
    uint64_t v7 = 0;
  }
  if (*((unsigned char *)v11 + 24)) {
    (*((void (**)(id, uint64_t))a5 + 2))(a5, v7);
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __102__AVFigRouteDescriptorOutputDeviceImpl_performHapticFeedbackForUUID_withHapticType_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  return *(unsigned int *)(a1 + 64);
}

- (AVOutputDeviceImplSupport)implEventListener
{
  return (AVOutputDeviceImplSupport *)objc_loadWeak((id *)&self->_implSupportEventListener);
}

- (AVOutputDeviceDelegate)delegate
{
  return (AVOutputDeviceDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

@end