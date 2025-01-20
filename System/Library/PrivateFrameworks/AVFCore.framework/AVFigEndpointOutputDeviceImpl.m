@interface AVFigEndpointOutputDeviceImpl
- (AVFigEndpointOutputDeviceImpl)init;
- (AVFigEndpointOutputDeviceImpl)initWithFigEndpoint:(OpaqueFigEndpoint *)a3 volumeController:(OpaqueFigVolumeControllerState *)a4 routingContextFactory:(id)a5 useRouteConfigUpdatedNotification:(BOOL)a6;
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
- (BOOL)supportsHeadTrackedSpatialAudio;
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
- (OpaqueFigEndpoint)figEndpoint;
- (float)volume;
- (float)volumeForActivatedDeviceClusterMembersWithRoomID:(id)a3;
- (id)_figEndpointPropertyValueForKey:(__CFString *)a3;
- (id)borrowScreenForClient:(id)a3 reason:(id)a4;
- (id)currentScreenViewAreaForScreenID:(id)a3;
- (id)requestTurnByTurnNavigationOwnership;
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
- (void)_handleFigEndpointEvent:(__CFString *)a3 payload:(id)a4;
- (void)_iOSUIRequestedNotification:(id)a3;
- (void)_mutedDidChangeForEndpointWithID:(__CFString *)a3;
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
- (void)setCurrentBluetoothListeningMode:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayCornerMasks:(id)a3;
- (void)setImplEventListener:(id)a3;
- (void)setMediaRemoteData:(id)a3 completionHandler:(id)a4;
- (void)setMuted:(BOOL)a3;
- (void)setSecondDisplayEnabled:(BOOL)a3;
- (void)setSecondDisplayMode:(id)a3 completionHandler:(id)a4;
- (void)setSiriForwardingEnabled:(BOOL)a3;
- (void)setVolume:(float)a3;
- (void)suggestUIWithURLs:(id)a3 completionHandler:(id)a4;
- (void)takeScreenForClient:(id)a3 reason:(id)a4;
@end

@implementation AVFigEndpointOutputDeviceImpl

- (AVFigEndpointOutputDeviceImpl)init
{
  return [(AVFigEndpointOutputDeviceImpl *)self initWithFigEndpoint:0 volumeController:0 routingContextFactory:0 useRouteConfigUpdatedNotification:0];
}

- (AVFigEndpointOutputDeviceImpl)initWithFigEndpoint:(OpaqueFigEndpoint *)a3 volumeController:(OpaqueFigVolumeControllerState *)a4 routingContextFactory:(id)a5 useRouteConfigUpdatedNotification:(BOOL)a6
{
  if (!a3)
  {
    v18 = self;
    v24 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v19, v20, v21, v22, v23, (uint64_t)"figEndpoint != NULL"), 0 reason userInfo];
    objc_exception_throw(v24);
  }
  v25.receiver = self;
  v25.super_class = (Class)AVFigEndpointOutputDeviceImpl;
  v11 = [(AVFigEndpointOutputDeviceImpl *)&v25 init];
  if (v11)
  {
    id v12 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    v11->_figEndpoint = (OpaqueFigEndpoint *)CFRetain(a3);
    v13 = a4 ? (OpaqueFigVolumeControllerState *)CFRetain(a4) : 0;
    v11->_volumeController = v13;
    v11->_routingContextFactory = (FigRoutingContextFactory *)a5;
    v11->_useRouteConfigUpdatedNotification = a6;
    v14 = [[AVWeakReference alloc] initWithReferencedObject:v11];
    v11->_weakObserver = v14;
    volumeController = v11->_volumeController;
    if (volumeController)
    {
      [v12 addListenerWithWeakReference:v14 callback:AVFigEndpointOutputDeviceImplCanSetEndpointVolumeDidChange name:*MEMORY[0x1E4F757F0] object:volumeController flags:0];
      [v12 addListenerWithWeakReference:v11->_weakObserver callback:AVFigEndpointOutputDeviceImplEndpointVolumeDidChange name:*MEMORY[0x1E4F75818] object:v11->_volumeController flags:0];
      [v12 addListenerWithWeakReference:v11->_weakObserver callback:AVFigEndpointOutputDeviceImplEndpointVolumeControlTypeDidChange name:*MEMORY[0x1E4F75810] object:v11->_volumeController flags:0];
      [v12 addListenerWithWeakReference:v11->_weakObserver callback:AVFigEndpointOutputDeviceImplEndpointMutedDidChange name:*MEMORY[0x1E4F75808] object:v11->_volumeController flags:0];
      [v12 addListenerWithWeakReference:v11->_weakObserver callback:AVFigEndpointOutputDeviceImplEndpointCanMuteDidChange name:*MEMORY[0x1E4F75830] object:v11->_volumeController flags:0];
      [v12 addListenerWithWeakReference:v11->_weakObserver callback:AVFigEndpointOutputDeviceImplEndpointRoomVolumeDidChange name:*MEMORY[0x1E4F75848] object:v11->_volumeController flags:0];
    }
  }
  if (v11->_figEndpoint)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddListeners();
  }
  return v11;
}

- (void)dealloc
{
  if (self->_weakObserver)
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    if (self->_volumeController)
    {
      v4 = v3;
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigEndpointOutputDeviceImplCanSetEndpointVolumeDidChange, *MEMORY[0x1E4F757F0]);
      [v4 removeListenerWithWeakReference:self->_weakObserver callback:AVFigEndpointOutputDeviceImplEndpointVolumeDidChange name:*MEMORY[0x1E4F75818] object:self->_volumeController];
      [v4 removeListenerWithWeakReference:self->_weakObserver callback:AVFigEndpointOutputDeviceImplEndpointVolumeControlTypeDidChange name:*MEMORY[0x1E4F75810] object:self->_volumeController];
      [v4 removeListenerWithWeakReference:self->_weakObserver callback:AVFigEndpointOutputDeviceImplEndpointMutedDidChange name:*MEMORY[0x1E4F75808] object:self->_volumeController];
      [v4 removeListenerWithWeakReference:self->_weakObserver callback:AVFigEndpointOutputDeviceImplEndpointCanMuteDidChange name:*MEMORY[0x1E4F75830] object:self->_volumeController];
      [v4 removeListenerWithWeakReference:self->_weakObserver callback:AVFigEndpointOutputDeviceImplEndpointRoomVolumeDidChange name:*MEMORY[0x1E4F75848] object:self->_volumeController];
    }
    if (self->_figEndpoint)
    {
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterRemoveListeners();
    }
  }

  figEndpoint = self->_figEndpoint;
  if (figEndpoint) {
    CFRelease(figEndpoint);
  }
  volumeController = self->_volumeController;
  if (volumeController) {
    CFRelease(volumeController);
  }

  v7.receiver = self;
  v7.super_class = (Class)AVFigEndpointOutputDeviceImpl;
  [(AVFigEndpointOutputDeviceImpl *)&v7 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  [(AVFigEndpointOutputDeviceImpl *)self figEndpoint];
  [a3 figEndpoint];
  return FigCFEqual() != 0;
}

- (unint64_t)hash
{
  v2 = [(AVFigEndpointOutputDeviceImpl *)self ID];
  return [(NSString *)v2 hash];
}

- (id)_figEndpointPropertyValueForKey:(__CFString *)a3
{
  v10 = 0;
  [(AVFigEndpointOutputDeviceImpl *)self figEndpoint];
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  objc_super v7 = *(void (**)(uint64_t, __CFString *, void, void **))(v6 + 48);
  if (v7)
  {
    v7(CMBaseObject, a3, *MEMORY[0x1E4F1CF80], &v10);
    v8 = v10;
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (NSString)name
{
  return (NSString *)[(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20F28]];
}

- (NSString)ID
{
  return (NSString *)[(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20E38]];
}

- (int64_t)deviceType
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F21048]];
  objc_msgSend(+[AVExecutionEnvironment sharedExecutionEnvironment](AVExecutionEnvironment, "sharedExecutionEnvironment"), "platformIdentifier");
  if (!v2) {
    return 0;
  }
  if ([v2 isEqualToString:*MEMORY[0x1E4F21558]]) {
    return 1;
  }
  if ([v2 isEqualToString:*MEMORY[0x1E4F21560]]) {
    return 2;
  }
  return 0;
}

- (int64_t)deviceSubType
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20FB8]];
  objc_msgSend(+[AVExecutionEnvironment sharedExecutionEnvironment](AVExecutionEnvironment, "sharedExecutionEnvironment"), "platformIdentifier");
  return AVOutputDeviceSubTypeFromFigSubType((uint64_t)v2);
}

- (int64_t)clusterType
{
  if (FigCFEqual()) {
    return 2;
  }
  else {
    return FigCFEqual() != 0;
  }
}

- (int64_t)configuredClusterSize
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20D78]];
  return [v2 integerValue];
}

- (NSString)manufacturer
{
  return (NSString *)[(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20EF8]];
}

- (NSString)modelID
{
  return (NSString *)[(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20F18]];
}

- (NSString)serialNumber
{
  return (NSString *)[(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20F88]];
}

- (NSString)firmwareVersion
{
  return (NSString *)[(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20DF0]];
}

- (NSData)identifyingMACAddress
{
  return (NSData *)[(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20EF0]];
}

- (NSArray)clusteredDeviceDescriptions
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20D60]];
  return (NSArray *)AVOutputDeviceDescriptionsFromFigDescriptions(v2);
}

- (BOOL)isClusterLeader
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20E58]];
  return [v2 BOOLValue];
}

- (BOOL)producesLowFidelityAudio
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20E90]];
  return [v2 BOOLValue];
}

- (BOOL)isAppleAccessory
{
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    id v4 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:@"IsGenuineAppleAccessory"];
    LOBYTE(v3) = [v4 BOOLValue];
  }
  return v3;
}

- (NSString)clusterID
{
  return (NSString *)[(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20F60]];
}

- (NSNumber)batteryLevel
{
  result = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20D18]];
  if (result)
  {
    uint64_t v3 = *MEMORY[0x1E4F203F8];
    return (NSNumber *)[(NSNumber *)result objectForKey:v3];
  }
  return result;
}

- (NSNumber)caseBatteryLevel
{
  result = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20D18]];
  if (result)
  {
    uint64_t v3 = *MEMORY[0x1E4F203E0];
    return (NSNumber *)[(NSNumber *)result objectForKey:v3];
  }
  return result;
}

- (NSNumber)leftBatteryLevel
{
  result = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20D18]];
  if (result)
  {
    uint64_t v3 = *MEMORY[0x1E4F203E8];
    return (NSNumber *)[(NSNumber *)result objectForKey:v3];
  }
  return result;
}

- (NSNumber)rightBatteryLevel
{
  result = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20D18]];
  if (result)
  {
    uint64_t v3 = *MEMORY[0x1E4F203F0];
    return (NSNumber *)[(NSNumber *)result objectForKey:v3];
  }
  return result;
}

- (NSNumber)supportsDataOverACLProtocol
{
  return 0;
}

- (NSNumber)isInEar
{
  return 0;
}

- (OpaqueFigEndpoint)figEndpoint
{
  return self->_figEndpoint;
}

- (NSDictionary)airPlayProperties
{
  return (NSDictionary *)[(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20CA0]];
}

- (BOOL)isInUseByPairedDevice
{
  return 0;
}

- (NSArray)connectedPairedDevices
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (unint64_t)deviceFeatures
{
  unint64_t v2 = objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E4F20FC0]), "unsignedIntegerValue");
  return v2 & 4 | (v2 >> 1) & 1 | (2 * (v2 & 1));
}

- (BOOL)requiresAuthorization
{
  return FigCFEqual() == 0;
}

- (BOOL)automaticallyAllowsConnectionsFromPeersInHomeGroup
{
  CFBooleanRef v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20E80]];
  if (v2) {
    LOBYTE(v2) = CFBooleanGetValue(v2) != 0;
  }
  return (char)v2;
}

- (BOOL)onlyAllowsConnectionsFromPeersInHomeGroup
{
  BOOL v3 = [(AVFigEndpointOutputDeviceImpl *)self automaticallyAllowsConnectionsFromPeersInHomeGroup];
  if (v3)
  {
    [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20E18]];
    LOBYTE(v3) = FigCFEqual() == 0;
  }
  return v3;
}

- (BOOL)canAccessRemoteAssets
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20CA8]];
  return [v2 BOOLValue];
}

- (BOOL)canAccessAppleMusic
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20E48]];
  return [v2 BOOLValue];
}

- (BOOL)canAccessiCloudMusicLibrary
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20D50]];
  return [v2 BOOLValue];
}

- (BOOL)supportsBufferedAirPlay
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20FE0]];
  return [v2 BOOLValue];
}

- (BOOL)canPlayEncryptedProgressiveDownloadAssets
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E4F20DD8]), "BOOLValue") ^ 1;
}

- (BOOL)canFetchMediaDataFromSender
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E4F20DB8]), "BOOLValue") ^ 1;
}

- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E4F20DD0]), "BOOLValue") ^ 1;
}

- (BOOL)supportsBluetoothSharing
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20E50]];
  return [v2 BOOLValue];
}

- (BOOL)isActivatedForContinuityScreen
{
  return 0;
}

- (int64_t)HAPConformance
{
  if (objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E4F20C98]), "BOOLValue"))return 2; {
  else
  }
    return 0;
}

- (BOOL)supportsHeadTrackedSpatialAudio
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20FF8]];
  return [v2 BOOLValue];
}

- (BOOL)allowsHeadTrackedSpatialAudio
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20CE0]];
  return [v2 BOOLValue];
}

- (BOOL)setAllowsHeadTrackedSpatialAudio:(BOOL)a3 error:(id *)a4
{
  signed int v5 = AVOutputDeviceSetAllowsHeadTrackedSpatialAudioOnEndpoint((uint64_t)[(AVFigEndpointOutputDeviceImpl *)self figEndpoint], a3);
  signed int v6 = v5;
  if (a4 && v5) {
    *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v5, 0);
  }
  return v6 == 0;
}

- (NSString)headTrackedSpatialAudioMode
{
  CFNumberRef v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20E28]];
  return (NSString *)AVOutputDeviceHeadTrackedSpatialAudioModeFromFigMode(v2);
}

- (BOOL)setHeadTrackedSpatialAudioMode:(id)a3 error:(id *)a4
{
  signed int v5 = AVOutputDeviceSetHeadTrackedSpatialAudioModeOnEndpoint((uint64_t)[(AVFigEndpointOutputDeviceImpl *)self figEndpoint], a3);
  signed int v6 = v5;
  if (a4 && v5) {
    *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v5, 0);
  }
  return v6 == 0;
}

- (BOOL)supportsConversationDetection
{
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    id v4 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:@"SupportsConversationDetect"];
    LOBYTE(v3) = [v4 BOOLValue];
  }
  return v3;
}

- (BOOL)isConversationDetectionEnabled
{
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    id v4 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:@"ConversationDetectEnable"];
    LOBYTE(v3) = [v4 BOOLValue];
  }
  return v3;
}

- (BOOL)setConversationDetectionEnabled:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  if (_os_feature_enabled_impl())
  {
    [(AVFigEndpointOutputDeviceImpl *)self figEndpoint];
    if (v5) {
      objc_super v7 = (void *)MEMORY[0x1E4F1CFD0];
    }
    else {
      objc_super v7 = (void *)MEMORY[0x1E4F1CFC8];
    }
    uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    v13 = *(uint64_t (**)(uint64_t, __CFString *, void))(v10 + 56);
    if (v13)
    {
      signed int v14 = v13(CMBaseObject, @"ConversationDetectEnable", *v7);
      if (!a4) {
        return v14 == 0;
      }
    }
    else
    {
      signed int v14 = -12782;
      if (!a4) {
        return v14 == 0;
      }
    }
    if (v14) {
      *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v14, 0);
    }
    return v14 == 0;
  }
  if (!a4) {
    return 0;
  }
  v11 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(-11862, 0);
  BOOL result = 0;
  *a4 = v11;
  return result;
}

- (BOOL)isHeadTrackedSpatialAudioActive
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20E20]];
  return [v2 BOOLValue];
}

- (NSArray)availableBluetoothListeningModes
{
  char v2 = objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E4F20FC8]), "unsignedIntegerValue");
  return (NSArray *)AVOutputDeviceSupportedListeningModesForFigListeningModes(v2);
}

- (NSString)currentBluetoothListeningMode
{
  int v2 = objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E4F20EE8]), "unsignedIntegerValue");
  return (NSString *)AVOutputDeviceAVFListeningModeForFigListeningMode(v2);
}

- (void)setCurrentBluetoothListeningMode:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int valuePtr = AVOutputDeviceFigListeningModeForAVFListeningMode(a3);
  CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(AVFigEndpointOutputDeviceImpl *)self figEndpoint];
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void (**)(uint64_t, void, CFNumberRef))(v8 + 56);
  if (v9) {
    v9(CMBaseObject, *MEMORY[0x1E4F20EE8], v4);
  }
  if (v4) {
    CFRelease(v4);
  }
}

- (BOOL)setCurrentBluetoothListeningMode:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int valuePtr = AVOutputDeviceFigListeningModeForAVFListeningMode(a3);
  CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(AVFigEndpointOutputDeviceImpl *)self figEndpoint];
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = *(uint64_t (**)(uint64_t, void, CFNumberRef))(v10 + 56);
  if (v11)
  {
    int v12 = v11(CMBaseObject, *MEMORY[0x1E4F20EE8], v6);
    if (!v6) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  int v12 = -12782;
  if (v6) {
LABEL_10:
  }
    CFRelease(v6);
LABEL_11:
  if (a4 && v12) {
    *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v12 userInfo:0];
  }
  return v12 == 0;
}

- (void)setSecondDisplayEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(AVFigEndpointOutputDeviceImpl *)self figEndpoint];
  CFNumberRef v6 = [(AVFigEndpointOutputDeviceImpl *)self name];
  AVOutputDeviceSetSecondDisplayEnabledOnEndpoint((uint64_t)v5, (uint64_t)v6, v3);
}

- (void)setSecondDisplayMode:(id)a3 completionHandler:(id)a4
{
  CFNumberRef v6 = [(AVFigEndpointOutputDeviceImpl *)self figEndpoint];
  AVOutputDeviceSetSecondDisplayModeOnEndpoint((uint64_t)v6, a3, (uint64_t)a4);
}

- (void)setMediaRemoteData:(id)a3 completionHandler:(id)a4
{
  CFNumberRef v6 = [(AVFigEndpointOutputDeviceImpl *)self figEndpoint];
  AVOutputDeviceSetMediaRemoteDataOnEndpoint((uint64_t)v6, (uint64_t)a3, (uint64_t)a4);
}

- (float)volume
{
  float v9 = 0.0;
  volumeController = self->_volumeController;
  float v3 = 0.0;
  if (volumeController)
  {
    CFNumberRef v4 = [(AVFigEndpointOutputDeviceImpl *)self ID];
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

- (void)_volumeDidChangeForEndpointWithID:(__CFString *)a3
{
  if ([(__CFString *)a3 isEqual:[(AVFigEndpointOutputDeviceImpl *)self ID]])
  {
    CFNumberRef v4 = [(AVFigEndpointOutputDeviceImpl *)self implEventListener];
    [(AVOutputDeviceImplSupport *)v4 outputDeviceImplDidChangeVolume:self];
  }
}

- (BOOL)canSetVolume
{
  char v8 = 0;
  volumeController = self->_volumeController;
  if (!volumeController) {
    return 0;
  }
  float v3 = [(AVFigEndpointOutputDeviceImpl *)self ID];
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  uint64_t v5 = v4 ? v4 : 0;
  uint64_t v6 = *(void (**)(OpaqueFigVolumeControllerState *, NSString *, char *))(v5 + 80);
  if (!v6) {
    return 0;
  }
  v6(volumeController, v3, &v8);
  return v8 != 0;
}

- (void)_handleFigEndpointEvent:(__CFString *)a3 payload:(id)a4
{
  if (FigCFEqual())
  {
    [(AVFigEndpointOutputDeviceImpl *)self _vehicleInformationDidChange:a4];
  }
  else if (FigCFEqual())
  {
    if ([(AVFigEndpointOutputDeviceImpl *)self delegate])
    {
      [(AVFigEndpointOutputDeviceImpl *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v7 = [(AVFigEndpointOutputDeviceImpl *)self delegate];
        uint64_t v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"viewAreaIndex"), "integerValue");
        uint64_t v9 = [a4 objectForKeyedSubscript:@"adjacentViewAreas"];
        uint64_t v10 = [a4 objectForKeyedSubscript:@"uuid"];
        [(AVOutputDeviceDelegate *)v7 setViewAreaIndex:v8 andAdjacentViewAreas:v9 forScreenID:v10];
      }
    }
  }
  else
  {
    uint64_t v11 = (void *)AVOutputDeviceNotificationFromFigNotification((uint64_t)a3);
    if ([v11 isEqual:@"AVOutputDeviceCarPlayTestNotification"])
    {
      [(AVFigEndpointOutputDeviceImpl *)self _carPlayTestNotification:a4];
    }
    else if ([v11 isEqual:@"AVOutputDeviceiOSUIRequestedNotification"])
    {
      [(AVFigEndpointOutputDeviceImpl *)self _iOSUIRequestedNotification:a4];
    }
    else if ([v11 isEqual:@"AVOutputDeviceSiriRequestedNotification"])
    {
      [(AVFigEndpointOutputDeviceImpl *)self _siriRequestedNotification:a4];
    }
    else if ([v11 isEqual:@"AVOutputDeviceUnhandledRemoteEventNotification"])
    {
      [(AVFigEndpointOutputDeviceImpl *)self _unhandledRemoteCommandNotification:a4];
    }
    else if (v11)
    {
      int v12 = [(AVFigEndpointOutputDeviceImpl *)self implEventListener];
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
  uint64_t v8 = [(AVFigEndpointOutputDeviceImpl *)self implEventListener];
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
  uint64_t v8 = [(AVFigEndpointOutputDeviceImpl *)self implEventListener];
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
  uint64_t v8 = [(AVFigEndpointOutputDeviceImpl *)self implEventListener];
  [(AVOutputDeviceImplSupport *)v8 postNotification:@"AVOutputDeviceSiriRequestedNotification" withPayload:v7 fromImpl:self];
}

- (void)_unhandledRemoteCommandNotification:(id)a3
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v5, "setValue:forKey:", objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F21588]), @"AVOutputDeviceUnhandledRemoteEventCommandTypeKey");
  objc_msgSend(v5, "setValue:forKey:", objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F21580]), @"AVOutputDeviceUnhandledRemoteEventCommandParametersKey");
  uint64_t v6 = [(AVFigEndpointOutputDeviceImpl *)self implEventListener];
  [(AVOutputDeviceImplSupport *)v6 postNotification:@"AVOutputDeviceUnhandledRemoteEventNotification" withPayload:v5 fromImpl:self];
}

- (void)_vehicleInformationDidChange:(id)a3
{
  uint64_t v4 = (void *)[a3 objectForKey:*MEMORY[0x1E4F21590]];
  if (v4)
  {
    uint64_t v5 = v4;
    if ([v4 valueForKey:*MEMORY[0x1E4F21598]]) {
      [(AVOutputDeviceImplSupport *)[(AVFigEndpointOutputDeviceImpl *)self implEventListener] postNotification:@"AVOutputDeviceElectronicTollCollectionStateChangedNotification" fromImpl:self];
    }
    if ([v5 valueForKey:*MEMORY[0x1E4F215A0]])
    {
      uint64_t v6 = [(AVFigEndpointOutputDeviceImpl *)self implEventListener];
      [(AVOutputDeviceImplSupport *)v6 postNotification:@"AVOutputDeviceNavigationAidedDrivingStateChangedNotification" fromImpl:self];
    }
  }
}

- (void)_volumeForEndpointDidChange:(__CFString *)a3 forRoomID:(__CFString *)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(__CFString *)a3 isEqual:[(AVFigEndpointOutputDeviceImpl *)self ID]])
  {
    if (dword_1EB2D3A40)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    [(AVOutputDeviceImplSupport *)[(AVFigEndpointOutputDeviceImpl *)self implEventListener] activatedDeviceClusterMembersDidChangeVolume:self forRoomID:a4];
  }
}

- (void)_mutedDidChangeForEndpointWithID:(__CFString *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(__CFString *)a3 isEqual:[(AVFigEndpointOutputDeviceImpl *)self ID]])
  {
    if (dword_1EB2D3A40)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    [(AVOutputDeviceImplSupport *)[(AVFigEndpointOutputDeviceImpl *)self implEventListener] outputDeviceImplDidChangeMute:self];
  }
}

- (void)_canMuteDidChangeForEndpointWithID:(__CFString *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(__CFString *)a3 isEqual:[(AVFigEndpointOutputDeviceImpl *)self ID]])
  {
    if (dword_1EB2D3A40)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    [(AVOutputDeviceImplSupport *)[(AVFigEndpointOutputDeviceImpl *)self implEventListener] outputDeviceImplCanMuteDidChange:self];
  }
}

- (void)_endpointVolumeControlTypeDidChangeForEndpointWithID:(__CFString *)a3
{
  if ([(__CFString *)a3 isEqualToString:[(AVFigEndpointOutputDeviceImpl *)self ID]])
  {
    uint64_t v4 = [(AVFigEndpointOutputDeviceImpl *)self implEventListener];
    [(AVOutputDeviceImplSupport *)v4 outputDeviceImplDidChangeVolumeControlType:self];
  }
}

- (int64_t)volumeControlType
{
  volumeController = self->_volumeController;
  if (volumeController
    && ((uint64_t v8 = 0,
         float v3 = [(AVFigEndpointOutputDeviceImpl *)self ID],
         (uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16)) == 0)
      ? (uint64_t v5 = 0)
      : (uint64_t v5 = v4),
        (uint64_t v6 = *(void (**)(OpaqueFigVolumeControllerState *, NSString *, uint64_t *))(v5 + 88)) != 0
     && (v6(volumeController, v3, &v8), (unint64_t)(v8 - 1) <= 2)))
  {
    return qword_194C5FE48[v8 - 1];
  }
  else
  {
    return 0;
  }
}

- (void)_canSetEndpointVolumeDidChangeForEndpointWithID:(__CFString *)a3
{
  if ([(__CFString *)a3 isEqual:[(AVFigEndpointOutputDeviceImpl *)self ID]])
  {
    [(AVOutputDeviceImplSupport *)[(AVFigEndpointOutputDeviceImpl *)self implEventListener] outputDeviceImplDidChangeCanChangeVolume:self];
    uint64_t v4 = [(AVFigEndpointOutputDeviceImpl *)self implEventListener];
    [(AVOutputDeviceImplSupport *)v4 outputDeviceImplDidChangeVolumeControlType:self];
  }
}

- (void)setVolume:(float)a3
{
  if (self->_volumeController)
  {
    uint64_t v5 = [(AVFigEndpointOutputDeviceImpl *)self ID];
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
    uint64_t v5 = [(AVFigEndpointOutputDeviceImpl *)self ID];
    AVOutputDeviceImplChangeVolumeByCount((uint64_t)volumeController, (uint64_t)v5, a3);
  }
}

- (void)decreaseVolumeByCount:(int64_t)a3
{
  volumeController = self->_volumeController;
  if (volumeController)
  {
    uint64_t v5 = [(AVFigEndpointOutputDeviceImpl *)self ID];
    AVOutputDeviceImplChangeVolumeByCount((uint64_t)volumeController, (uint64_t)v5, -a3);
  }
}

- (void)setActivatedDeviceClusterMembersVolume:(float)a3 withRoomID:(id)a4
{
  volumeController = self->_volumeController;
  if (volumeController)
  {
    uint64_t v7 = [(AVFigEndpointOutputDeviceImpl *)self ID];
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
    uint64_t v6 = [(AVFigEndpointOutputDeviceImpl *)self ID];
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
  float v3 = [(AVFigEndpointOutputDeviceImpl *)self ID];
  return AVOutputDeviceImplCanMuteForEndpointID((uint64_t)volumeController, (uint64_t)v3);
}

- (BOOL)isMuted
{
  volumeController = self->_volumeController;
  if (!volumeController) {
    return 0;
  }
  float v3 = [(AVFigEndpointOutputDeviceImpl *)self ID];
  return AVOutputDeviceImplIsMutedForEndpointID((uint64_t)volumeController, (uint64_t)v3);
}

- (void)setMuted:(BOOL)a3
{
  volumeController = self->_volumeController;
  if (volumeController)
  {
    BOOL v4 = a3;
    uint64_t v5 = [(AVFigEndpointOutputDeviceImpl *)self ID];
    AVOutputDeviceImplSetMutedForEndpointID((uint64_t)volumeController, (uint64_t)v5, v4);
  }
}

- (BOOL)canBeGrouped
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20E78]];
  return [v2 BOOLValue];
}

- (NSString)groupID
{
  return (NSString *)[(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20E08]];
}

- (NSString)proposedGroupID
{
  return 0;
}

- (BOOL)canBeGroupLeader
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20F10]];
  return [v2 BOOLValue];
}

- (BOOL)isGroupLeader
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20E70]];
  return [v2 BOOLValue];
}

- (BOOL)participatesInGroupPlayback
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E4F20F90]), "BOOLValue") ^ 1;
}

- (BOOL)groupContainsGroupLeader
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20E00]];
  return [v2 BOOLValue];
}

- (NSString)logicalDeviceID
{
  return (NSString *)[(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F21038]];
}

- (BOOL)isLogicalDeviceLeader
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F21028]];
  return [v2 BOOLValue];
}

- (BOOL)canCommunicateWithAllLogicalDeviceMembers
{
  return objc_msgSend(-[AVFigEndpointOutputDeviceImpl _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E4F21020]), "BOOLValue") ^ 1;
}

- (BOOL)canRelayCommunicationChannel
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F21008]];
  return [v2 BOOLValue];
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
    v16 = 0;
    goto LABEL_11;
  }
  if (cf)
  {
    uint64_t v14 = AVMakeSelectEndpointOperation(cf, self->_figEndpoint, Mutable, self->_useRouteConfigUpdatedNotification);
    uint64_t v15 = [AVFigRoutingContextSendConfigureDeviceCommandOperation alloc];
    v16 = [(AVFigRoutingContextSendConfigureDeviceCommandOperation *)v15 initWithRoutingContext:cf configuratorBlock:a3];
    -[AVFigRoutingContextSendConfigureDeviceCommandOperation setName:](v16, "setName:", [NSString stringWithFormat:@"Set configuration on device represented by (impl=%@)", self]);
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
    v22[2] = __79__AVFigEndpointOutputDeviceImpl_configureUsingBlock_options_completionHandler___block_invoke;
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
  v16 = 0;
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

void __79__AVFigEndpointOutputDeviceImpl_configureUsingBlock_options_completionHandler___block_invoke(uint64_t a1)
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
    uint64_t v8 = *(void (**)(uint64_t, void, void))(v7 + 8);
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
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20F48]];
  return (NSArray *)AVOutputDeviceAVOutputDeviceIconsFromOEMIcons(v2);
}

- (NSString)OEMIconLabel
{
  return (NSString *)[(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20F38]];
}

- (BOOL)OEMIconVisible
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20F40]];
  return [v2 BOOLValue];
}

- (NSArray)outputDeviceHIDs
{
  id v3 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20E10]];
  BOOL v4 = [(AVFigEndpointOutputDeviceImpl *)self figEndpoint];
  return (NSArray *)AVOutputDeviceMakeAVOutputDeviceHIDsFromFigHIDs(v3, (uint64_t)v4);
}

- (BOOL)nightMode
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20F30]];
  return [v2 BOOLValue];
}

- (BOOL)isNightModeSupported
{
  return [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20F30]] != 0;
}

- (BOOL)rightHandDrive
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20F70]];
  return [v2 BOOLValue];
}

- (NSArray)limitedUIElements
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20EE0]];
  if (v2)
  {
    id v3 = v2;
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
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20ED8]];
  return [v2 BOOLValue];
}

- (BOOL)carOwnsScreen
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20D40]];
  return [v2 BOOLValue];
}

- (BOOL)ownsTurnByTurnNavigation
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20D28]];
  return [v2 BOOLValue];
}

- (BOOL)recognizingSpeech
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20D30]];
  return [v2 BOOLValue];
}

- (NSArray)supportedFeatures
{
  BOOL result = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20DB0]];
  if (!result)
  {
    id v3 = (void *)MEMORY[0x1E4F1C978];
    return (NSArray *)[v3 array];
  }
  return result;
}

- (int64_t)electronicTollCollection
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F21070]];
  return AVOutputDeviceElectronicTollCollectionStateFromVehicleInfo(v2);
}

- (int64_t)navigationAidedDriving
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F21070]];
  return AVOutputDeviceNavigationAidedDrivingStateFromVehicleInfo(v2);
}

- (int64_t)transportType
{
  [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F21040]];
  return AVOutputDeviceTransportTypeFromFigTransportType();
}

- (NSData)MFiCertificateSerialNumber
{
  return (NSData *)[(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20CF8]];
}

- (void)requestViewArea:(int64_t)a3 forScreenID:(id)a4
{
  uint64_t v6 = [(AVFigEndpointOutputDeviceImpl *)self figEndpoint];
  AVOutputDeviceRequestViewAreaForFigEndpoint((uint64_t)v6, (uint64_t)a4, a3);
}

- (void)requestCarUIForURL:(id)a3 withUUID:(id)a4
{
  uint64_t v6 = [(AVFigEndpointOutputDeviceImpl *)self figEndpoint];
  AVOutputDeviceRequestCarUIForEndpoint((uint64_t)v6, (uint64_t)a4, (uint64_t)a3);
}

- (id)requestTurnByTurnNavigationOwnership
{
  id v2 = [[AVOutputDeviceTurnByTurnToken alloc] initWithEndpoint:[(AVFigEndpointOutputDeviceImpl *)self figEndpoint]];
  return v2;
}

- (id)borrowScreenForClient:(id)a3 reason:(id)a4
{
  BOOL v4 = [[AVOutputDeviceScreenBorrowToken alloc] initWithEndpoint:[(AVFigEndpointOutputDeviceImpl *)self figEndpoint] client:a3 reason:a4];
  return v4;
}

- (void)takeScreenForClient:(id)a3 reason:(id)a4
{
  uint64_t v6 = [(AVFigEndpointOutputDeviceImpl *)self figEndpoint];
  AVOutputDeviceTakeScreenForClient((uint64_t)v6, (uint64_t)a3, (uint64_t)a4);
}

- (BOOL)siriForwardingEnabled
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20CE8]];
  return [v2 BOOLValue];
}

- (void)setSiriForwardingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(AVFigEndpointOutputDeviceImpl *)self figEndpoint];
  AVOutputDeviceSetAlternateSiriOnEndpoint((uint64_t)v4, v3);
}

- (BOOL)carOwnsMainAudio
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20D38]];
  return [v2 BOOLValue];
}

- (NSDictionary)displayCornerMasks
{
  [(AVFigEndpointOutputDeviceImpl *)self figEndpoint];
  return (NSDictionary *)AVOutputDeviceGetDisplayCornerMasksFromEndpoint();
}

- (void)setDisplayCornerMasks:(id)a3
{
  BOOL v4 = [(AVFigEndpointOutputDeviceImpl *)self figEndpoint];
  AVOutputDeviceSetDisplayCornerMasksEndpoint((uint64_t)v4, (uint64_t)a3);
}

- (int64_t)voiceTriggerMode
{
  int64_t result = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F21078]];
  if (result)
  {
    return [(id)result unsignedIntegerValue];
  }
  return result;
}

- (int64_t)authenticationType
{
  [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20D00]];
  return AVOutputDeviceAuthenticationTypeFromFigAuthenticationType();
}

- (id)currentScreenViewAreaForScreenID:(id)a3
{
  BOOL v4 = [(AVFigEndpointOutputDeviceImpl *)self figEndpoint];
  return AVOutputDeviceGetCurrentScreenViewAreaFromEndpoint(v4, (uint64_t)a3);
}

- (BOOL)isActivated
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20E40]];
  return [v2 BOOLValue];
}

- (NSArray)screens
{
  id v2 = [(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20F80]];
  return (NSArray *)AVOutputDeviceAVOutputDeviceScreenInfoFromFigScreens(v2);
}

- (NSDictionary)outputDeviceInfo
{
  return (NSDictionary *)[(AVFigEndpointOutputDeviceImpl *)self _figEndpointPropertyValueForKey:@"EndpointInfo"];
}

- (void)suggestUIWithURLs:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = [(AVFigEndpointOutputDeviceImpl *)self figEndpoint];
  AVOutputDeviceSuggestUIWithURLSAndCompletionHandler((uint64_t)v6, (uint64_t)a3, (uint64_t)a4);
}

- (void)performHapticFeedbackForUUID:(id)a3 withHapticType:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = [(AVFigEndpointOutputDeviceImpl *)self figEndpoint];
  AVOutputDevicePerformHapticFeedback((uint64_t)v8, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

- (AVOutputDeviceImplSupport)implEventListener
{
  return (AVOutputDeviceImplSupport *)objc_loadWeak((id *)&self->_implSupportEventListener);
}

- (void)setImplEventListener:(id)a3
{
}

- (AVOutputDeviceDelegate)delegate
{
  return (AVOutputDeviceDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_implSupportEventListener);
}

@end