@interface MRAVConcreteOutputDevice
- (AVOutputDevice)avOutputDevice;
- (BOOL)allowsHeadTrackedSpatialAudio;
- (BOOL)canAccessAppleMusic;
- (BOOL)canAccessRemoteAssets;
- (BOOL)canAccessiCloudMusicLibrary;
- (BOOL)canFetchMediaDataFromSender;
- (BOOL)canPlayEncryptedProgressiveDownloadAssets;
- (BOOL)canRelayCommunicationChannel;
- (BOOL)containsUID:(id)a3;
- (BOOL)discoveredOnSameInfra;
- (BOOL)groupContainsGroupLeader;
- (BOOL)hasBatteryLevel;
- (BOOL)isActivatedForContinuityScreen;
- (BOOL)isAddedToHomeKit;
- (BOOL)isAirPlayReceiverSessionActive;
- (BOOL)isAppleAccessory;
- (BOOL)isClusterLeader;
- (BOOL)isConversationDetectionEnabled;
- (BOOL)isDeviceGroupable;
- (BOOL)isGroupLeader;
- (BOOL)isGroupable;
- (BOOL)isHeadTrackedSpatialAudioActive;
- (BOOL)isLocalDevice;
- (BOOL)isPickedOnPairedDevice;
- (BOOL)isProxyGroupPlayer;
- (BOOL)isRemoteControllable;
- (BOOL)isVolumeMuted;
- (BOOL)parentGroupContainsDiscoverableLeader;
- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets;
- (BOOL)producesLowFidelityAudio;
- (BOOL)requiresAuthorization;
- (BOOL)setAllowsHeadTrackedSpatialAudio:(BOOL)a3 error:(id *)a4;
- (BOOL)setConversationDetectionEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)setCurrentBluetoothListeningMode:(id)a3 error:(id *)a4;
- (BOOL)setHeadTrackedSpatialAudioMode:(id)a3 error:(id *)a4;
- (BOOL)supportsBluetoothSharing;
- (BOOL)supportsBufferedAirPlay;
- (BOOL)supportsConversationDetection;
- (BOOL)supportsEngageOnClusterActivation;
- (BOOL)supportsExternalScreen;
- (BOOL)supportsHAP;
- (BOOL)supportsHeadTrackedSpatialAudio;
- (BOOL)supportsMultiplayer;
- (BOOL)supportsRapport;
- (BOOL)supportsRapportRemoteControlTransport;
- (BOOL)supportsSharePlayHandoff;
- (MRAVConcreteOutputDevice)initWithAVOutputDevice:(id)a3 sourceInfo:(id)a4;
- (MRAVOutputDeviceSourceInfo)sourceInfo;
- (dispatch_queue_t)_onQueue_nearbyObject;
- (float)batteryLevel;
- (float)distance;
- (float)volume;
- (id)MACAddress;
- (id)_playingPairedDeviceNameForAVOutputDevice:(uint64_t)a1;
- (id)activatedClusterMembersOutputDevices;
- (id)airPlayGroupID;
- (id)allClusterMembers;
- (id)availableBluetoothListeningModes;
- (id)bluetoothID;
- (id)clusterComposition;
- (id)clusterID;
- (id)currentBluetoothListeningMode;
- (id)deviceEnclosureColor;
- (id)dnsNames;
- (id)firmwareVersion;
- (id)headTrackedSpatialAudioMode;
- (id)logicalDeviceID;
- (id)modelID;
- (id)modelSpecificInfo;
- (id)name;
- (id)parentGroupIdentifier;
- (id)playingPairedDeviceName;
- (id)rooms;
- (id)tightSyncID;
- (id)uid;
- (int64_t)transportType;
- (unint64_t)configuredClusterSize;
- (unsigned)clusterType;
- (unsigned)deviceSubtype;
- (unsigned)deviceType;
- (unsigned)volumeCapabilities;
- (void)_onqueue_clearCachedAVOutputDeviceProperties;
- (void)adjustVolume:(int64_t)a3 details:(id)a4;
- (void)setAVOutputDevice:(id)a3;
- (void)setAirPlayGroupID:(id)a3;
- (void)setSourceInfo:(id)a3;
- (void)setVolume:(float)a3 details:(id)a4;
- (void)setVolumeMuted:(BOOL)a3 details:(id)a4;
@end

@implementation MRAVConcreteOutputDevice

void __42__MRAVConcreteOutputDevice_avOutputDevice__block_invoke(uint64_t a1)
{
}

- (id)uid
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__37;
  v10 = __Block_byref_object_dispose__37;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__MRAVConcreteOutputDevice_uid__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (unsigned)volumeCapabilities
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__MRAVConcreteOutputDevice_volumeCapabilities__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isLocalDevice
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__MRAVConcreteOutputDevice_isLocalDevice__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__MRAVConcreteOutputDevice_airPlayGroupID__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 376))
  {
    char v3 = *(void **)(v2 + 368);
    if (!v3
      || ([*(id *)(v2 + 312) groupID],
          v4 = objc_claimAutoreleasedReturnValue(),
          char v5 = [v3 isEqualToString:v4],
          v4,
          uint64_t v2 = *(void *)(a1 + 32),
          (v5 & 1) == 0))
    {
      uint64_t v6 = [*(id *)(v2 + 312) groupID];
      uint64_t v7 = [v6 copy];
      uint64_t v8 = *(void *)(a1 + 32);
      char v9 = *(void **)(v8 + 368);
      *(void *)(v8 + 368) = v7;

      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(v2 + 368) copy];

  return MEMORY[0x1F41817F8]();
}

- (id)clusterComposition
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__37;
  v10 = __Block_byref_object_dispose__37;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__MRAVConcreteOutputDevice_clusterComposition__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (unsigned)deviceSubtype
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__MRAVConcreteOutputDevice_deviceSubtype__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)modelSpecificInfo
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__37;
  v10 = __Block_byref_object_dispose__37;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__MRAVConcreteOutputDevice_modelSpecificInfo__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)modelID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__37;
  v10 = __Block_byref_object_dispose__37;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__MRAVConcreteOutputDevice_modelID__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (int64_t)transportType
{
  return 1;
}

- (unsigned)clusterType
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__MRAVConcreteOutputDevice_clusterType__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)name
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__37;
  v15 = __Block_byref_object_dispose__37;
  id v16 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__MRAVConcreteOutputDevice_name__block_invoke;
  v10[3] = &unk_1E57D07E0;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(accessSerialQueue, v10);
  if (!v12[5] && [(MRAVConcreteOutputDevice *)self isLocalDevice])
  {
    v4 = +[MROrigin localOrigin];
    char v5 = +[MRDeviceInfoRequest cachedDeviceInfoForOrigin:v4];
    uint64_t v6 = [v5 name];
    uint64_t v7 = (void *)v12[5];
    v12[5] = v6;
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (BOOL)isGroupable
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__MRAVConcreteOutputDevice_isGroupable__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasBatteryLevel
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__MRAVConcreteOutputDevice_hasBatteryLevel__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__MRAVConcreteOutputDevice_hasBatteryLevel__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) hasBatteryLevel];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)canAccessAppleMusic
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__MRAVConcreteOutputDevice_canAccessAppleMusic__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__MRAVConcreteOutputDevice_canAccessRemoteAssets__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) canAccessRemoteAssets];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)supportsBluetoothSharing
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__MRAVConcreteOutputDevice_supportsBluetoothSharing__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)supportsBufferedAirPlay
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__MRAVConcreteOutputDevice_supportsBufferedAirPlay__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isDeviceGroupable
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__MRAVConcreteOutputDevice_isDeviceGroupable__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)canRelayCommunicationChannel
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__MRAVConcreteOutputDevice_canRelayCommunicationChannel__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)canPlayEncryptedProgressiveDownloadAssets
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__MRAVConcreteOutputDevice_canPlayEncryptedProgressiveDownloadAssets__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)canFetchMediaDataFromSender
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__MRAVConcreteOutputDevice_canFetchMediaDataFromSender__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)supportsMultiplayer
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__MRAVConcreteOutputDevice_supportsMultiplayer__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)airPlayGroupID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__37;
  v10 = __Block_byref_object_dispose__37;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__MRAVConcreteOutputDevice_airPlayGroupID__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __91__MRAVConcreteOutputDevice_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)parentGroupIdentifier
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__37;
  v10 = __Block_byref_object_dispose__37;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__MRAVConcreteOutputDevice_parentGroupIdentifier__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)parentGroupContainsDiscoverableLeader
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__MRAVConcreteOutputDevice_parentGroupContainsDiscoverableLeader__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isRemoteControllable
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__MRAVConcreteOutputDevice_isRemoteControllable__block_invoke;
  v6[3] = &unk_1E57D0590;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(accessSerialQueue, v6);
  if (*((unsigned char *)v8 + 24)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(MRAVOutputDevice *)self shouldBeLocallyHosted];
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isProxyGroupPlayer
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__MRAVConcreteOutputDevice_isProxyGroupPlayer__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isGroupLeader
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__MRAVConcreteOutputDevice_isGroupLeader__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isAirPlayReceiverSessionActive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__MRAVConcreteOutputDevice_isAirPlayReceiverSessionActive__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isAddedToHomeKit
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__MRAVConcreteOutputDevice_isAddedToHomeKit__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)groupContainsGroupLeader
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__MRAVConcreteOutputDevice_groupContainsGroupLeader__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)canAccessiCloudMusicLibrary
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__MRAVConcreteOutputDevice_canAccessiCloudMusicLibrary__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)canAccessRemoteAssets
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__MRAVConcreteOutputDevice_canAccessRemoteAssets__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __91__MRAVConcreteOutputDevice_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __69__MRAVConcreteOutputDevice_canPlayEncryptedProgressiveDownloadAssets__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) canPlayEncryptedProgressiveDownloadAssets];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __56__MRAVConcreteOutputDevice_canRelayCommunicationChannel__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) canRelayCommunicationChannel];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __55__MRAVConcreteOutputDevice_canFetchMediaDataFromSender__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) canFetchMediaDataFromSender];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __55__MRAVConcreteOutputDevice_canAccessiCloudMusicLibrary__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) canAccessiCloudMusicLibrary];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __52__MRAVConcreteOutputDevice_groupContainsGroupLeader__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) groupContainsGroupLeader];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __51__MRAVConcreteOutputDevice_supportsBufferedAirPlay__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) supportsBufferedAirPlay];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __47__MRAVConcreteOutputDevice_canAccessAppleMusic__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) canAccessAppleMusic];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __52__MRAVConcreteOutputDevice_supportsBluetoothSharing__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) supportsBluetoothSharing];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (BOOL)supportsHAP
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__MRAVConcreteOutputDevice_supportsHAP__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)bluetoothID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__37;
  char v10 = __Block_byref_object_dispose__37;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__MRAVConcreteOutputDevice_bluetoothID__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)isPickedOnPairedDevice
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__MRAVConcreteOutputDevice_isPickedOnPairedDevice__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)allClusterMembers
{
  return 0;
}

- (BOOL)supportsHeadTrackedSpatialAudio
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__MRAVConcreteOutputDevice_supportsHeadTrackedSpatialAudio__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)configuredClusterSize
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__MRAVConcreteOutputDevice_configuredClusterSize__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isAppleAccessory
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__MRAVConcreteOutputDevice_isAppleAccessory__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)supportsConversationDetection
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__MRAVConcreteOutputDevice_supportsConversationDetection__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)playingPairedDeviceName
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__37;
  char v10 = __Block_byref_object_dispose__37;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__MRAVConcreteOutputDevice_playingPairedDeviceName__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)tightSyncID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__37;
  char v10 = __Block_byref_object_dispose__37;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__MRAVConcreteOutputDevice_tightSyncID__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)MACAddress
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__37;
  char v10 = __Block_byref_object_dispose__37;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__MRAVConcreteOutputDevice_MACAddress__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)supportsSharePlayHandoff
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__MRAVConcreteOutputDevice_supportsSharePlayHandoff__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)supportsRapport
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__MRAVConcreteOutputDevice_supportsRapport__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)supportsRapportRemoteControlTransport
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__MRAVConcreteOutputDevice_supportsRapportRemoteControlTransport__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)supportsExternalScreen
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__MRAVConcreteOutputDevice_supportsExternalScreen__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)supportsEngageOnClusterActivation
{
  uint64_t v2 = [(MRAVConcreteOutputDevice *)self avOutputDevice];
  char v3 = [v2 airPlayProperties];
  BOOL v4 = [v3 objectForKeyedSubscript:@"SupportsClusterEngageOnActivation"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)requiresAuthorization
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__MRAVConcreteOutputDevice_requiresAuthorization__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)producesLowFidelityAudio
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__MRAVConcreteOutputDevice_producesLowFidelityAudio__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isHeadTrackedSpatialAudioActive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__MRAVConcreteOutputDevice_isHeadTrackedSpatialAudioActive__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isConversationDetectionEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__MRAVConcreteOutputDevice_isConversationDetectionEnabled__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)headTrackedSpatialAudioMode
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__37;
  char v10 = __Block_byref_object_dispose__37;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__MRAVConcreteOutputDevice_headTrackedSpatialAudioMode__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)dnsNames
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__37;
  char v10 = __Block_byref_object_dispose__37;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__MRAVConcreteOutputDevice_dnsNames__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (float)distance
{
  uint64_t v6 = 0;
  uint64_t v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__MRAVConcreteOutputDevice_distance__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)discoveredOnSameInfra
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__MRAVConcreteOutputDevice_discoveredOnSameInfra__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)deviceEnclosureColor
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__37;
  char v10 = __Block_byref_object_dispose__37;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__MRAVConcreteOutputDevice_deviceEnclosureColor__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)currentBluetoothListeningMode
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__37;
  char v10 = __Block_byref_object_dispose__37;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__MRAVConcreteOutputDevice_currentBluetoothListeningMode__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)availableBluetoothListeningModes
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__37;
  char v10 = __Block_byref_object_dispose__37;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__MRAVConcreteOutputDevice_availableBluetoothListeningModes__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)activatedClusterMembersOutputDevices
{
  return 0;
}

uint64_t __46__MRAVConcreteOutputDevice_volumeCapabilities__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) volumeControlType];
  if (result == 2) {
    int v3 = 5;
  }
  else {
    int v3 = 0;
  }
  if (result == 1) {
    int v3 = 2;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

uint64_t __45__MRAVConcreteOutputDevice_isDeviceGroupable__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) canBeGrouped];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __39__MRAVConcreteOutputDevice_isGroupable__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) canBeGrouped];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __48__MRAVConcreteOutputDevice_isRemoteControllable__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) canBeGroupLeader];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __38__MRAVConcreteOutputDevice_sourceInfo__block_invoke(uint64_t a1)
{
}

uint64_t __39__MRAVConcreteOutputDevice_supportsHAP__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) HAPConformance];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result == 2;
  return result;
}

uint64_t __50__MRAVConcreteOutputDevice_isPickedOnPairedDevice__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) isInUseByPairedDevice];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __50__MRAVConcreteOutputDevice_supportsExternalScreen__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) deviceFeatures];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (result & 2) != 0;
  return result;
}

uint64_t __46__MRAVConcreteOutputDevice_clusterComposition__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(v2 + 416);
  if (!v3)
  {
    BOOL v4 = [*(id *)(v2 + 312) clusteredDeviceDescriptions];
    uint64_t v5 = objc_msgSend(v4, "mr_map:", &__block_literal_global_88);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 416);
    *(void *)(v6 + 416) = v5;

    int v3 = *(void **)(*(void *)(a1 + 32) + 416);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [v3 copy];

  return MEMORY[0x1F41817F8]();
}

void __60__MRAVConcreteOutputDevice_availableBluetoothListeningModes__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 312) availableBluetoothListeningModes];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __41__MRAVConcreteOutputDevice_isGroupLeader__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) isGroupLeader];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __41__MRAVConcreteOutputDevice_isLocalDevice__block_invoke(uint64_t a1)
{
  id v3 = [(Class)getAVOutputDeviceClass[0]() sharedLocalDevice];
  BOOL v2 = (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 312), "isEqual:") & 1) != 0
    || MROutputDeviceIsAVOutputDeviceLocal(*(void **)(*(void *)(a1 + 32) + 312));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
}

- (unsigned)deviceType
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__MRAVConcreteOutputDevice_deviceType__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

unint64_t __38__MRAVConcreteOutputDevice_deviceType__block_invoke(uint64_t a1)
{
  unint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) deviceType];
  if (result < 5) {
    int v3 = result + 1;
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

void __36__MRAVConcreteOutputDevice_distance__block_invoke(uint64_t a1)
{
  -[MRAVConcreteOutputDevice _onQueue_nearbyObject](*(dispatch_queue_t **)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 distance];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
}

- (dispatch_queue_t)_onQueue_nearbyObject
{
  if (a1)
  {
    int v2 = a1;
    dispatch_assert_queue_V2(a1[38]);
    dispatch_queue_t v3 = v2[51];
    if (!v3)
    {
      BOOL v4 = [v2[39] airPlayProperties];
      id v5 = [v4 objectForKeyedSubscript:@"SerializedNIRangingData"];

      if (v5)
      {
        getNINearbyObjectClass();
        uint64_t v6 = MSVUnarchivedObjectOfClass();
        dispatch_queue_t v7 = v2[51];
        v2[51] = (dispatch_queue_t)v6;
      }
      dispatch_queue_t v3 = v2[51];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

uint64_t __52__MRAVConcreteOutputDevice_supportsSharePlayHandoff__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 312) airPlayProperties];
  id v5 = [v2 objectForKeyedSubscript:@"SupportsSharePlayHandoff"];

  if (v5) {
    char v3 = [v5 BOOLValue];
  }
  else {
    char v3 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;

  return MEMORY[0x1F41817F8]();
}

void __65__MRAVConcreteOutputDevice_supportsRapportRemoteControlTransport__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 312) airPlayProperties];
  int v2 = [v3 objectForKeyedSubscript:@"SupportsRapportRemoteControlTransport"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

void __43__MRAVConcreteOutputDevice_supportsRapport__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 312) airPlayProperties];
  int v2 = [v3 objectForKeyedSubscript:@"SupportsRapportRemoteControl"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

void __49__MRAVConcreteOutputDevice_discoveredOnSameInfra__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 312) airPlayProperties];
  id v4 = [v2 objectForKeyedSubscript:@"IsDiscoveredOverInfra"];

  id v3 = v4;
  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 BOOLValue];
    id v3 = v4;
  }
}

void __36__MRAVConcreteOutputDevice_dnsNames__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(*(void *)(a1 + 32) + 312) airPlayProperties];
  int v2 = [v6 objectForKeyedSubscript:@"CUDNSNames"];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __48__MRAVConcreteOutputDevice_deviceEnclosureColor__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 312) airPlayProperties];
  uint64_t v2 = [v5 objectForKeyedSubscript:@"DeviceEnclosureColor"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __39__MRAVConcreteOutputDevice_bluetoothID__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(*(void *)(a1 + 32) + 312) airPlayProperties];
  uint64_t v2 = [v6 objectForKeyedSubscript:@"BluetoothIdentifier"];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __49__MRAVConcreteOutputDevice_parentGroupIdentifier__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(*(void *)(a1 + 32) + 312) airPlayProperties];
  uint64_t v2 = [v6 objectForKeyedSubscript:@"ParentGroupUUID"];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __58__MRAVConcreteOutputDevice_isAirPlayReceiverSessionActive__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 312) airPlayProperties];
  uint64_t v2 = [v3 objectForKeyedSubscript:@"ReceiverSessionIsActive"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

void __65__MRAVConcreteOutputDevice_parentGroupContainsDiscoverableLeader__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 312) airPlayProperties];
  uint64_t v2 = [v3 objectForKeyedSubscript:@"ParentGroupContainsDiscoverableLeader"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

void __44__MRAVConcreteOutputDevice_isAddedToHomeKit__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 312) airPlayProperties];
  uint64_t v2 = [v3 objectForKeyedSubscript:@"SupportsHangdogRemoteControl"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

void __32__MRAVConcreteOutputDevice_name__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 312) airPlayProperties];
  id v3 = [v2 objectForKeyedSubscript:@"GroupPublicName"];
  id v10 = (id)[v3 copy];

  if ([v10 length])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = v10;
    id v6 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v5;
  }
  else
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 312) name];
    uint64_t v7 = [v6 copy];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    int v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

void __47__MRAVConcreteOutputDevice_supportsMultiplayer__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 312) airPlayProperties];
  uint64_t v2 = [v3 objectForKeyedSubscript:@"SupportsMultiplayer"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

unint64_t __39__MRAVConcreteOutputDevice_clusterType__block_invoke(uint64_t a1)
{
  unint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) clusterType];
  if (result < 3) {
    unint64_t result = dword_1952245B0[result];
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __45__MRAVConcreteOutputDevice_modelSpecificInfo__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 392);
  if (!v3)
  {
    uint64_t v4 = [*(id *)(v2 + 312) modelSpecificInformation];
    uint64_t v5 = [v4 copy];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 392);
    *(void *)(v6 + 392) = v5;

    id v3 = *(void **)(*(void *)(a1 + 32) + 392);
  }
  uint64_t v8 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v8, v3);
}

uint64_t __59__MRAVConcreteOutputDevice_supportsHeadTrackedSpatialAudio__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) supportsHeadTrackedSpatialAudio];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __59__MRAVConcreteOutputDevice_isHeadTrackedSpatialAudioActive__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) isHeadTrackedSpatialAudioActive];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __58__MRAVConcreteOutputDevice_isConversationDetectionEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) isConversationDetectionEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __57__MRAVConcreteOutputDevice_supportsConversationDetection__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) supportsConversationDetection];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __52__MRAVConcreteOutputDevice_producesLowFidelityAudio__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) producesLowFidelityAudio];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __49__MRAVConcreteOutputDevice_requiresAuthorization__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) requiresAuthorization];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __49__MRAVConcreteOutputDevice_configuredClusterSize__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) configuredClusterSize];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __44__MRAVConcreteOutputDevice_isAppleAccessory__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) isAppleAccessory];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __38__MRAVConcreteOutputDevice_MACAddress__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 384);
  if (!v3)
  {
    uint64_t v4 = [*(id *)(v2 + 312) identifyingMACAddress];
    uint64_t v5 = [v4 copy];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 384);
    *(void *)(v6 + 384) = v5;

    id v3 = *(void **)(*(void *)(a1 + 32) + 384);
  }
  uint64_t v8 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v8, v3);
}

void __35__MRAVConcreteOutputDevice_modelID__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 344);
  if (!v3)
  {
    uint64_t v4 = [*(id *)(v2 + 312) modelID];
    uint64_t v5 = [v4 copy];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 344);
    *(void *)(v6 + 344) = v5;

    id v3 = *(void **)(*(void *)(a1 + 32) + 344);
  }
  uint64_t v8 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v8, v3);
}

uint64_t __57__MRAVConcreteOutputDevice_currentBluetoothListeningMode__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 312) currentBluetoothListeningMode];

  return MEMORY[0x1F41817F8]();
}

uint64_t __55__MRAVConcreteOutputDevice_headTrackedSpatialAudioMode__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 312) headTrackedSpatialAudioMode];

  return MEMORY[0x1F41817F8]();
}

uint64_t __46__MRAVConcreteOutputDevice_isProxyGroupPlayer__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) isGroupLeader];
    if (result)
    {
      uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) participatesInGroupPlayback];
      char v3 = result ^ 1;
    }
    else
    {
      char v3 = 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  }
  return result;
}

void __51__MRAVConcreteOutputDevice_playingPairedDeviceName__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(void **)(v2 + 400);
  if (!v3)
  {
    uint64_t v4 = -[MRAVConcreteOutputDevice _playingPairedDeviceNameForAVOutputDevice:](v2, *(void **)(v2 + 312));
    uint64_t v5 = [v4 copy];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 400);
    *(void *)(v6 + 400) = v5;

    char v3 = *(void **)(*(void *)(a1 + 32) + 400);
  }
  uint64_t v8 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v8, v3);
}

- (id)_playingPairedDeviceNameForAVOutputDevice:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [(Class)getAVPairedDeviceClass[0]() pairedDevicesConnectedToOutputDevice:v3];
    uint64_t v5 = (void *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if ([v8 isPlaying])
          {
            uint64_t v5 = [v8 name];
            goto LABEL_12;
          }
        }
        uint64_t v5 = (void *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (MRAVOutputDeviceSourceInfo)sourceInfo
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__37;
  long long v10 = __Block_byref_object_dispose__37;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__MRAVConcreteOutputDevice_sourceInfo__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRAVOutputDeviceSourceInfo *)v3;
}

- (MRAVConcreteOutputDevice)initWithAVOutputDevice:(id)a3 sourceInfo:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MRAVConcreteOutputDevice;
  long long v10 = [(MRAVConcreteOutputDevice *)&v20 init];
  if (v10)
  {
    if (!v8)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, v10, @"MRAVConcreteOutputDevice.m", 71, @"Invalid parameter not satisfying: %@", @"avOutputDevice" object file lineNumber description];
    }
    objc_storeStrong((id *)&v10->_avOutputDevice, a3);
    objc_storeStrong((id *)&v10->_sourceInfo, a4);
    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.mediaremote.MRAVOutputDevice", v11);
    accessSerialQueue = v10->_accessSerialQueue;
    v10->_accessSerialQueue = (OS_dispatch_queue *)v12;

    if ([(MRAVConcreteOutputDevice *)v10 isLocalDevice])
    {
      if ([v8 deviceSubType] != 15)
      {
        v14 = +[MROrigin localOrigin];
        uint64_t v15 = +[MRDeviceInfoRequest cachedDeviceInfoForOrigin:v14];
        uint64_t v16 = [v15 deviceUID];
        uid = v10->_uid;
        v10->_uid = (NSString *)v16;

        [(NSString *)v10->_uid length];
        if ([(NSString *)v10->_uid length]) {
          v10->_overrideUID = 1;
        }
      }
    }
  }

  return v10;
}

uint64_t __41__MRAVConcreteOutputDevice_deviceSubtype__block_invoke(uint64_t a1)
{
  uint64_t result = MRAVOutputDeviceSubtypeFromAVSubtype([*(id *)(*(void *)(a1 + 32) + 312) deviceSubType]);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __39__MRAVConcreteOutputDevice_tightSyncID__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 360);
  if (v3)
  {
    uint64_t v4 = [*(id *)(v2 + 312) logicalDeviceID];
    char v5 = [v3 isEqualToString:v4];

    if (v5) {
      goto LABEL_5;
    }
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v6 = [*(id *)(v2 + 312) logicalDeviceID];
  uint64_t v7 = [v6 copy];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 360);
  *(void *)(v8 + 360) = v7;

LABEL_5:
  long long v10 = *(void **)(*(void *)(a1 + 32) + 360);
  id v11 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v11, v10);
}

- (BOOL)containsUID:(id)a3
{
  id v4 = a3;
  char v5 = [(MRAVConcreteOutputDevice *)self avOutputDevice];
  uint64_t v6 = [v5 deviceID];
  if ([v6 isEqualToString:v4])
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MRAVConcreteOutputDevice;
    BOOL v7 = [(MRAVOutputDevice *)&v9 containsUID:v4];
  }

  return v7;
}

- (id)clusterID
{
  id v3 = [(MRAVConcreteOutputDevice *)self clusterComposition];
  if ([v3 count])
  {
    id v4 = 0;
  }
  else
  {
    char v5 = [(MRAVConcreteOutputDevice *)self avOutputDevice];
    id v4 = [v5 clusterID];
  }

  return v4;
}

- (BOOL)isClusterLeader
{
  uint64_t v2 = [(MRAVConcreteOutputDevice *)self avOutputDevice];
  char v3 = [v2 isClusterLeader];

  return v3;
}

- (BOOL)isVolumeMuted
{
  uint64_t v2 = [(MRAVConcreteOutputDevice *)self avOutputDevice];
  char v3 = [v2 isMuted];

  return v3;
}

- (AVOutputDevice)avOutputDevice
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  objc_super v9 = __Block_byref_object_copy__37;
  long long v10 = __Block_byref_object_dispose__37;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__MRAVConcreteOutputDevice_avOutputDevice__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AVOutputDevice *)v3;
}

- (id)logicalDeviceID
{
  id v3 = +[MRUserSettings currentSettings];
  char v4 = [v3 useClusterDevices];

  if (v4)
  {
    char v5 = 0;
  }
  else
  {
    char v5 = [(MRAVConcreteOutputDevice *)self tightSyncID];
  }

  return v5;
}

- (void)setAirPlayGroupID:(id)a3
{
  id v4 = a3;
  accessSerialQueue = self->_accessSerialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__MRAVConcreteOutputDevice_setAirPlayGroupID___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessSerialQueue, v7);
}

void __31__MRAVConcreteOutputDevice_uid__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 336) && !*(void *)(v2 + 328))
  {
    id v3 = [*(id *)(v2 + 312) ID];
    uint64_t v4 = [v3 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 328);
    *(void *)(v5 + 328) = v4;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  BOOL v7 = *(void **)(v2 + 328);
  id v8 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v8, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterComposition, 0);
  objc_storeStrong((id *)&self->_nearbyObject, 0);
  objc_storeStrong((id *)&self->_playingPairedDeviceName, 0);
  objc_storeStrong((id *)&self->_modelSpecificInfo, 0);
  objc_storeStrong((id *)&self->_MACAddress, 0);
  objc_storeStrong((id *)&self->_airPlayGroupID, 0);
  objc_storeStrong((id *)&self->_logicalDeviceID, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_sourceInfo, 0);
  objc_storeStrong((id *)&self->_avOutputDevice, 0);

  objc_storeStrong((id *)&self->_accessSerialQueue, 0);
}

uint64_t __46__MRAVConcreteOutputDevice_setAirPlayGroupID___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 376) = 1;
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 368);
  if (result | v2)
  {
    uint64_t result = objc_msgSend((id)result, "isEqualToString:");
    if ((result & 1) == 0)
    {
      *(void *)(*(void *)(a1 + 32) + 368) = [*(id *)(a1 + 40) copy];
      return MEMORY[0x1F41817F8]();
    }
  }
  return result;
}

- (void)setAVOutputDevice:(id)a3
{
  id v4 = a3;
  accessSerialQueue = self->_accessSerialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__MRAVConcreteOutputDevice_setAVOutputDevice___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessSerialQueue, v7);
}

void __46__MRAVConcreteOutputDevice_setAVOutputDevice___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 312) != *(void *)(a1 + 40))
  {
    -[MRAVConcreteOutputDevice _onqueue_clearCachedAVOutputDeviceProperties](v2);
    id v3 = *(void **)(a1 + 40);
    id v4 = (id *)(*(void *)(a1 + 32) + 312);
    objc_storeStrong(v4, v3);
  }
}

- (void)_onqueue_clearCachedAVOutputDeviceProperties
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 304));
    uint64_t v2 = *(void **)(a1 + 392);
    *(void *)(a1 + 392) = 0;

    id v3 = *(void **)(a1 + 328);
    *(void *)(a1 + 328) = 0;

    id v4 = *(void **)(a1 + 344);
    *(void *)(a1 + 344) = 0;

    uint64_t v5 = *(void **)(a1 + 352);
    *(void *)(a1 + 352) = 0;

    id v6 = *(void **)(a1 + 360);
    *(void *)(a1 + 360) = 0;

    BOOL v7 = *(void **)(a1 + 368);
    *(void *)(a1 + 368) = 0;

    id v8 = *(void **)(a1 + 384);
    *(void *)(a1 + 384) = 0;

    objc_super v9 = *(void **)(a1 + 400);
    *(void *)(a1 + 400) = 0;

    long long v10 = *(void **)(a1 + 408);
    *(void *)(a1 + 408) = 0;
  }
}

- (void)setSourceInfo:(id)a3
{
  id v4 = a3;
  accessSerialQueue = self->_accessSerialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__MRAVConcreteOutputDevice_setSourceInfo___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessSerialQueue, v7);
}

void __42__MRAVConcreteOutputDevice_setSourceInfo___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 320) isEqual:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 40);
    id v3 = (id *)(*(void *)(a1 + 32) + 320);
    objc_storeStrong(v3, v2);
  }
}

- (id)firmwareVersion
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  objc_super v9 = __Block_byref_object_copy__37;
  long long v10 = __Block_byref_object_dispose__37;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__MRAVConcreteOutputDevice_firmwareVersion__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__MRAVConcreteOutputDevice_firmwareVersion__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 352);
  if (!v3)
  {
    id v4 = [*(id *)(v2 + 312) firmwareVersion];
    uint64_t v5 = [v4 copy];
    uint64_t v6 = *(void *)(a1 + 32);
    BOOL v7 = *(void **)(v6 + 352);
    *(void *)(v6 + 352) = v5;

    id v3 = *(void **)(*(void *)(a1 + 32) + 352);
  }
  uint64_t v8 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v8, v3);
}

- (BOOL)setCurrentBluetoothListeningMode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__37;
  v19 = __Block_byref_object_dispose__37;
  id v20 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__MRAVConcreteOutputDevice_setCurrentBluetoothListeningMode_error___block_invoke;
  v11[3] = &unk_1E57D8910;
  long long v13 = &v21;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  v14 = &v15;
  dispatch_sync(accessSerialQueue, v11);
  if (a4) {
    *a4 = (id) v16[5];
  }
  char v9 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __67__MRAVConcreteOutputDevice_setCurrentBluetoothListeningMode_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  id v3 = *(void **)(a1[4] + 312);
  id v10 = 0;
  char v4 = [v3 setCurrentBluetoothListeningMode:v2 error:&v10];
  id v5 = v10;
  id v6 = v5;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v4;
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v7 = objc_msgSend(v5, "mr_errorByEnvelopingWithMRError:", 43);
    uint64_t v8 = *(void *)(a1[7] + 8);
    char v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (BOOL)allowsHeadTrackedSpatialAudio
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__MRAVConcreteOutputDevice_allowsHeadTrackedSpatialAudio__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__MRAVConcreteOutputDevice_allowsHeadTrackedSpatialAudio__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) allowsHeadTrackedSpatialAudio];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)setAllowsHeadTrackedSpatialAudio:(BOOL)a3 error:(id *)a4
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = __Block_byref_object_copy__37;
  v14 = __Block_byref_object_dispose__37;
  id v15 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__MRAVConcreteOutputDevice_setAllowsHeadTrackedSpatialAudio_error___block_invoke;
  v8[3] = &unk_1E57D8938;
  v8[4] = self;
  v8[5] = &v16;
  BOOL v9 = a3;
  v8[6] = &v10;
  dispatch_sync(accessSerialQueue, v8);
  if (a4) {
    *a4 = (id) v11[5];
  }
  char v6 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __67__MRAVConcreteOutputDevice_setAllowsHeadTrackedSpatialAudio_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 312);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [v2 setAllowsHeadTrackedSpatialAudio:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
}

- (BOOL)setHeadTrackedSpatialAudioMode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__37;
  char v19 = __Block_byref_object_dispose__37;
  id v20 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__MRAVConcreteOutputDevice_setHeadTrackedSpatialAudioMode_error___block_invoke;
  v11[3] = &unk_1E57D8910;
  long long v13 = &v21;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  v14 = &v15;
  dispatch_sync(accessSerialQueue, v11);
  if (a4) {
    *a4 = (id) v16[5];
  }
  char v9 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __65__MRAVConcreteOutputDevice_setHeadTrackedSpatialAudioMode_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void **)(a1[4] + 312);
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [v3 setHeadTrackedSpatialAudioMode:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
}

- (BOOL)setConversationDetectionEnabled:(BOOL)a3 error:(id *)a4
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = __Block_byref_object_copy__37;
  v14 = __Block_byref_object_dispose__37;
  id v15 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__MRAVConcreteOutputDevice_setConversationDetectionEnabled_error___block_invoke;
  v8[3] = &unk_1E57D8938;
  v8[4] = self;
  v8[5] = &v16;
  BOOL v9 = a3;
  v8[6] = &v10;
  dispatch_sync(accessSerialQueue, v8);
  if (a4) {
    *a4 = (id) v11[5];
  }
  char v6 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __66__MRAVConcreteOutputDevice_setConversationDetectionEnabled_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 312);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  id v10 = 0;
  char v4 = [v2 setConversationDetectionEnabled:v3 error:&v10];
  id v5 = v10;
  char v6 = v5;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v7 = objc_msgSend(v5, "mr_errorByEnvelopingWithMRError:", 49);
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    BOOL v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

MRAVOutputDeviceDescription *__46__MRAVConcreteOutputDevice_clusterComposition__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[MRAVOutputDeviceDescription alloc] initWithAVDescription:v2];

  return v3;
}

- (id)rooms
{
  return 0;
}

- (float)batteryLevel
{
  uint64_t v6 = 0;
  uint64_t v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__MRAVConcreteOutputDevice_batteryLevel__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__MRAVConcreteOutputDevice_batteryLevel__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) batteryLevel];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (float)volume
{
  uint64_t v6 = 0;
  uint64_t v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__MRAVConcreteOutputDevice_volume__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__MRAVConcreteOutputDevice_volume__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) volume];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)setVolume:(float)a3 details:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (objc_class *)NSString;
  id v7 = a4;
  id v8 = [v6 alloc];
  int v9 = [(MRAVOutputDevice *)self debugName];
  id v10 = (void *)[v8 initWithFormat:@"%@ -> %lf", v9, a3];

  id v11 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v12 = [v7 requestID];

  long long v13 = (void *)[v11 initWithFormat:@"%@<%@>", @"ConcreteOutputDevice.setVolume", v12];
  if (v10) {
    [v13 appendFormat:@" for %@", v10];
  }
  v14 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v13;
    _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v15 = [(MRAVConcreteOutputDevice *)self avOutputDevice];
  *(float *)&double v16 = a3;
  [v15 setVolume:v16];
}

- (void)adjustVolume:(int64_t)a3 details:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (objc_class *)NSString;
  id v7 = a4;
  id v8 = [v6 alloc];
  int v9 = [(MRAVOutputDevice *)self debugName];
  id v10 = MRMediaRemoteVolumeControlAdjustmentDescription(a3);
  id v11 = (void *)[v8 initWithFormat:@"%@ -> %@", v9, v10];

  id v12 = objc_alloc(MEMORY[0x1E4F28E78]);
  long long v13 = [v7 requestID];

  v14 = (void *)[v12 initWithFormat:@"%@<%@>", @"ConcreteOutputDevice.adjustVolume", v13];
  if (v11) {
    [v14 appendFormat:@" for %@", v11];
  }
  id v15 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = v14;
    _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__MRAVConcreteOutputDevice_adjustVolume_details___block_invoke;
  block[3] = &unk_1E57D2098;
  block[4] = self;
  block[5] = a3;
  dispatch_async(accessSerialQueue, block);
}

uint64_t __49__MRAVConcreteOutputDevice_adjustVolume_details___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) volumeControlType];
  if (result == 2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if ((unint64_t)(v3 - 1) > 2)
    {
      if ((unint64_t)(v3 - 4) <= 2)
      {
        id v5 = *(void **)(*(void *)(a1 + 32) + 312);
        return [v5 decreaseVolumeByCount:1];
      }
    }
    else
    {
      char v4 = *(void **)(*(void *)(a1 + 32) + 312);
      return [v4 increaseVolumeByCount:1];
    }
  }
  return result;
}

- (void)setVolumeMuted:(BOOL)a3 details:(id)a4
{
  BOOL v4 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (objc_class *)NSString;
  id v7 = a4;
  id v8 = [v6 alloc];
  int v9 = [(MRAVOutputDevice *)self debugName];
  id v10 = (void *)[v8 initWithFormat:@"%@ -> %u", v9, v4];

  id v11 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v12 = [v7 requestID];

  long long v13 = (void *)[v11 initWithFormat:@"%@<%@>", @"ConcreteOutputDevice.setVolumeMuted", v12];
  if (v10) {
    [v13 appendFormat:@" for %@", v10];
  }
  v14 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v13;
    _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v15 = [(MRAVConcreteOutputDevice *)self avOutputDevice];
  [v15 setMuted:v4];
}

- (BOOL)isActivatedForContinuityScreen
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__MRAVConcreteOutputDevice_isActivatedForContinuityScreen__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__MRAVConcreteOutputDevice_isActivatedForContinuityScreen__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) isActivatedForContinuityScreen];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end