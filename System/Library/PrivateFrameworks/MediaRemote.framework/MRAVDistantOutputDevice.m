@interface MRAVDistantOutputDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsHeadTrackedSpatialAudio;
- (BOOL)canAccessAppleMusic;
- (BOOL)canAccessRemoteAssets;
- (BOOL)canAccessiCloudMusicLibrary;
- (BOOL)canFetchMediaDataFromSender;
- (BOOL)canPlayEncryptedProgressiveDownloadAssets;
- (BOOL)canRelayCommunicationChannel;
- (BOOL)discoveredOnSameInfra;
- (BOOL)groupContainsGroupLeader;
- (BOOL)hasBatteryLevel;
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
- (BOOL)isPickable;
- (BOOL)isPickedOnPairedDevice;
- (BOOL)isProxyGroupPlayer;
- (BOOL)isRemoteControllable;
- (BOOL)isUsingJSONProtocol;
- (BOOL)isVolumeMuted;
- (BOOL)parentGroupContainsDiscoverableLeader;
- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets;
- (BOOL)producesLowFidelityAudio;
- (BOOL)requiresAuthorization;
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
- (MRAVDistantOutputDevice)initWithCoder:(id)a3;
- (MRAVDistantOutputDevice)initWithDescriptor:(id)a3;
- (MRAVDistantOutputDevice)initWithSkeleton:(id)a3;
- (_MRAVOutputDeviceDescriptorProtobuf)generateDescriptor;
- (_MRAVOutputDeviceDescriptorProtobuf)protobuf;
- (float)batteryLevel;
- (float)distance;
- (float)volume;
- (id)MACAddress;
- (id)activatedClusterMembersOutputDevices;
- (id)airPlayGroupID;
- (id)allClusterMembers;
- (id)availableBluetoothListeningModes;
- (id)bluetoothID;
- (id)clusterComposition;
- (id)clusterID;
- (id)currentBluetoothListeningMode;
- (id)descriptor;
- (id)deviceEnclosureColor;
- (id)dnsNames;
- (id)firmwareVersion;
- (id)groupID;
- (id)groupSessionInfo;
- (id)groupableOutputDevice;
- (id)headTrackedSpatialAudioMode;
- (id)logicalDeviceID;
- (id)modelID;
- (id)modelSpecificInfo;
- (id)name;
- (id)parentGroupIdentifier;
- (id)parentUID;
- (id)playingPairedDeviceName;
- (id)primaryID;
- (id)roomID;
- (id)roomName;
- (id)rooms;
- (id)sourceInfo;
- (id)tightSyncID;
- (id)uid;
- (int64_t)hostDeviceClass;
- (int64_t)transportType;
- (unint64_t)configuredClusterSize;
- (unsigned)clusterType;
- (unsigned)deviceSubtype;
- (unsigned)deviceType;
- (unsigned)volumeCapabilities;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MRAVDistantOutputDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rooms, 0);
  objc_storeStrong((id *)&self->_allClusterMembers, 0);
  objc_storeStrong((id *)&self->_activatedClusterMemebers, 0);
  objc_storeStrong((id *)&self->_clusterComposition, 0);
  objc_storeStrong((id *)&self->_modelSpecificInfo, 0);
  objc_storeStrong((id *)&self->_sourceInfo, 0);

  objc_storeStrong((id *)&self->_protobuf, 0);
}

- (MRAVDistantOutputDevice)initWithDescriptor:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v37.receiver = self;
    v37.super_class = (Class)MRAVDistantOutputDevice;
    v6 = [(MRAVDistantOutputDevice *)&v37 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_protobuf, a3);
      v8 = [(_MRAVOutputDeviceDescriptorProtobuf *)v7->_protobuf modelSpecificInfoData];
      v9 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
      uint64_t v13 = MRCreateFromData(v8, v12);
      modelSpecificInfo = v7->_modelSpecificInfo;
      v7->_modelSpecificInfo = (NSDictionary *)v13;

      v15 = [v5 sourceInfo];
      v16 = [MRAVOutputDeviceSourceInfo alloc];
      v17 = [v15 routingContextUID];
      uint64_t v18 = -[MRAVOutputDeviceSourceInfo initWithRoutingContextUID:multipleBuiltInDevices:](v16, "initWithRoutingContextUID:multipleBuiltInDevices:", v17, [v15 multipleBuiltInDevices]);
      sourceInfo = v7->_sourceInfo;
      v7->_sourceInfo = (MRAVOutputDeviceSourceInfo *)v18;

      v20 = [v5 clusterCompositions];
      uint64_t v21 = objc_msgSend(v20, "mr_map:", &__block_literal_global_15);
      clusterComposition = v7->_clusterComposition;
      v7->_clusterComposition = (NSArray *)v21;

      v23 = [v5 activatedClusterMembers];
      uint64_t v24 = objc_msgSend(v23, "msv_map:", &__block_literal_global_8);
      activatedClusterMemebers = v7->_activatedClusterMemebers;
      v7->_activatedClusterMemebers = (NSArray *)v24;

      v26 = [v5 allClusterMembers];
      uint64_t v27 = objc_msgSend(v26, "msv_map:", &__block_literal_global_11);
      allClusterMembers = v7->_allClusterMembers;
      v7->_allClusterMembers = (NSArray *)v27;

      v29 = [(MRAVOutputDevice *)v7 roomsLookupTable];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __46__MRAVDistantOutputDevice_initWithDescriptor___block_invoke_4;
      v35[3] = &unk_1E57D18F0;
      v30 = v7;
      v36 = v30;
      uint64_t v31 = objc_msgSend(v29, "msv_map:", v35);
      rooms = v30->_rooms;
      v30->_rooms = (NSArray *)v31;
    }
    self = v7;
    v33 = self;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (id)activatedClusterMembersOutputDevices
{
  return self->_activatedClusterMemebers;
}

- (id)uid
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf uniqueIdentifier];
}

- (id)descriptor
{
  v2 = (void *)[(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf copy];

  return v2;
}

- (_MRAVOutputDeviceDescriptorProtobuf)protobuf
{
  return self->_protobuf;
}

- (id)logicalDeviceID
{
  v3 = +[MRUserSettings currentSettings];
  char v4 = [v3 useClusterDevices];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf logicalDeviceID];
  }

  return v5;
}

- (id)modelSpecificInfo
{
  return self->_modelSpecificInfo;
}

- (int64_t)transportType
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf transportType];
}

- (BOOL)supportsMultiplayer
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf supportsMultiplayer];
}

- (unsigned)deviceType
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf deviceType];
}

- (BOOL)isLocalDevice
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf isLocalDevice];
}

- (unsigned)deviceSubtype
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf deviceSubType];
}

- (BOOL)supportsHAP
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf supportsHAP];
}

- (BOOL)supportsBufferedAirPlay
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf supportsBufferedAirPlay];
}

- (BOOL)supportsBluetoothSharing
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf supportsBluetoothSharing];
}

- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets];
}

- (id)parentGroupIdentifier
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf parentGroupIdentifier];
}

- (BOOL)parentGroupContainsDiscoverableLeader
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf parentGroupContainsDiscoverableLeader];
}

- (id)name
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf name];
}

- (id)modelID
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf modelID];
}

- (BOOL)isUsingJSONProtocol
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf usingJSONProtocol];
}

- (BOOL)isRemoteControllable
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf isRemoteControllable];
}

- (BOOL)isProxyGroupPlayer
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf isProxyGroupPlayer];
}

- (BOOL)isGroupable
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf isGroupable];
}

- (BOOL)isGroupLeader
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf isGroupLeader];
}

- (BOOL)isDeviceGroupable
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf isDeviceGroupable];
}

- (BOOL)isAirPlayReceiverSessionActive
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf isAirPlayReceiverSessionActive];
}

- (BOOL)isAddedToHomeKit
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf isAddedToHomeKit];
}

- (BOOL)hasBatteryLevel
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf hasBatteryLevel];
}

- (id)groupID
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf groupID];
}

- (BOOL)groupContainsGroupLeader
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf groupContainsGroupLeader];
}

- (unsigned)clusterType
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf clusterType];
}

- (id)clusterComposition
{
  return self->_clusterComposition;
}

- (BOOL)canRelayCommunicationChannel
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf canRelayCommunicationChannel];
}

- (BOOL)canPlayEncryptedProgressiveDownloadAssets
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf canPlayEncryptedProgressiveDownloadAssets];
}

- (BOOL)canFetchMediaDataFromSender
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf canFetchMediaDataFromSender];
}

- (BOOL)canAccessiCloudMusicLibrary
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf canAccessiCloudMusicLibrary];
}

- (BOOL)canAccessRemoteAssets
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf canAccessRemoteAssets];
}

- (BOOL)canAccessAppleMusic
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf canAccessAppleMusic];
}

- (id)bluetoothID
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf bluetoothID];
}

- (unsigned)volumeCapabilities
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf volumeCapabilities];
}

- (BOOL)isVolumeMuted
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf volumeMuted];
}

- (float)volume
{
  [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf volume];
  return result;
}

MRAVOutputDeviceDescription *__46__MRAVDistantOutputDevice_initWithDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MRAVOutputDeviceDescription alloc] initWithDescriptor:v2];

  return v3;
}

MRAVDistantOutputDevice *__46__MRAVDistantOutputDevice_initWithDescriptor___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MRAVDistantOutputDevice alloc] initWithDescriptor:v2];

  return v3;
}

MRAVOutputDeviceDescription *__46__MRAVDistantOutputDevice_initWithDescriptor___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MRAVOutputDeviceDescription alloc] initWithDescriptor:v2];

  return v3;
}

MRAVRoomOutputDevice *__46__MRAVDistantOutputDevice_initWithDescriptor___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [[MRAVRoomOutputDevice alloc] initWithOutputDevice:*(void *)(a1 + 32) memberOutputDevices:v4];

  return v5;
}

- (MRAVDistantOutputDevice)initWithSkeleton:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(_MRAVOutputDeviceDescriptorProtobuf);
  v6 = [v4 uniqueIdentifier];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v5 setUniqueIdentifier:v6];

  v7 = [v4 name];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v5 setName:v7];

  -[_MRAVOutputDeviceDescriptorProtobuf setDeviceType:](v5, "setDeviceType:", [v4 deviceType]);
  -[_MRAVOutputDeviceDescriptorProtobuf setDeviceSubType:](v5, "setDeviceSubType:", [v4 deviceSubType]);
  v8 = [v4 modelID];
  [(_MRAVOutputDeviceDescriptorProtobuf *)v5 setModelID:v8];

  if ([v4 isVolumeControlAvailable])
  {
    -[_MRAVOutputDeviceDescriptorProtobuf setIsVolumeControlAvailable:](v5, "setIsVolumeControlAvailable:", [v4 isVolumeControlAvailable]);
    [v4 volume];
    -[_MRAVOutputDeviceDescriptorProtobuf setVolume:](v5, "setVolume:");
  }
  -[_MRAVOutputDeviceDescriptorProtobuf setVolumeCapabilities:](v5, "setVolumeCapabilities:", [v4 volumeCapabilities]);
  -[_MRAVOutputDeviceDescriptorProtobuf setHostDeviceClass:](v5, "setHostDeviceClass:", [v4 hostDeviceClass]);
  v9 = [(MRAVDistantOutputDevice *)self initWithDescriptor:v5];

  return v9;
}

- (MRAVDistantOutputDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobuf"];

  v6 = [(MRAVDistantOutputDevice *)self initWithDescriptor:v5];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (_MRAVOutputDeviceDescriptorProtobuf)generateDescriptor
{
  v4.receiver = self;
  v4.super_class = (Class)MRAVDistantOutputDevice;
  id v2 = [(MRAVOutputDevice *)&v4 descriptor];

  return (_MRAVOutputDeviceDescriptorProtobuf *)v2;
}

- (id)firmwareVersion
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf firmwareVersion];
}

- (id)tightSyncID
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf logicalDeviceID];
}

- (id)MACAddress
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf macAddress];
}

- (int64_t)hostDeviceClass
{
  int v2 = [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf hostDeviceClass];

  return MRDeviceClassFromProtobuf(v2);
}

- (float)batteryLevel
{
  [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf batteryLevel];
  return result;
}

- (BOOL)supportsExternalScreen
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf supportsExternalScreen];
}

- (BOOL)requiresAuthorization
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf requiresAuthorization];
}

- (id)sourceInfo
{
  return self->_sourceInfo;
}

- (id)primaryID
{
  if ([(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf hasPrimaryUID]) {
    [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf primaryUID];
  }
  else {
  v3 = [(MRAVDistantOutputDevice *)self uid];
  }

  return v3;
}

- (unint64_t)configuredClusterSize
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf configuredClusterSize];
}

- (BOOL)supportsRapportRemoteControlTransport
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf supportsRapportRemoteControlTransport];
}

- (id)availableBluetoothListeningModes
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf availableBluetoothListeningModes];
}

- (id)currentBluetoothListeningMode
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf currentBluetoothListeningMode];
}

- (BOOL)supportsConversationDetection
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf supportsConversationDetection];
}

- (BOOL)isConversationDetectionEnabled
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf conversationDetectionEnabled];
}

- (BOOL)producesLowFidelityAudio
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf producesLowFidelityAudio];
}

- (id)airPlayGroupID
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf airPlayGroupID];
}

- (BOOL)supportsSharePlayHandoff
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf supportsSharePlayHandoff];
}

- (float)distance
{
  [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf distance];
  return result;
}

- (BOOL)discoveredOnSameInfra
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf discoveredOnSameInfra];
}

- (id)allClusterMembers
{
  return self->_allClusterMembers;
}

- (BOOL)isPickable
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf pickable];
}

- (id)clusterID
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf clusterID];
}

- (BOOL)isClusterLeader
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf isClusterLeader];
}

- (BOOL)isAppleAccessory
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf isAppleAccessory];
}

- (id)parentUID
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf parentUniqueIdentifier];
}

- (id)roomID
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf roomID];
}

- (id)roomName
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf roomName];
}

- (BOOL)supportsEngageOnClusterActivation
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf engageOnClusterActivate];
}

- (id)rooms
{
  v3 = [(MRAVOutputDevice *)self roomsLookupTable];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__MRAVDistantOutputDevice_rooms__block_invoke;
  v6[3] = &unk_1E57D18F0;
  v6[4] = self;
  objc_super v4 = objc_msgSend(v3, "msv_map:", v6);

  return v4;
}

MRAVRoomOutputDevice *__32__MRAVDistantOutputDevice_rooms__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [[MRAVRoomOutputDevice alloc] initWithOutputDevice:*(void *)(a1 + 32) memberOutputDevices:v4];

  return v5;
}

- (id)groupableOutputDevice
{
  if ([(MRAVDistantOutputDevice *)self isGroupable])
  {
    v3 = self;
  }
  else
  {
    id v4 = [(MRAVDistantOutputDevice *)self descriptor];
    [v4 setIsGroupable:1];
    v3 = (MRAVDistantOutputDevice *)[objc_alloc((Class)objc_opt_class()) initWithDescriptor:v4];
  }

  return v3;
}

- (id)groupSessionInfo
{
  if ([(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf hasGroupSessionInfo])
  {
    v3 = [MRGroupSessionInfo alloc];
    id v4 = [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf groupSessionInfo];
    id v5 = [(MRGroupSessionInfo *)v3 initWithProtobuf:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)deviceEnclosureColor
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf deviceEnclosureColor];
}

- (id)playingPairedDeviceName
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf playingPairedDeviceName];
}

- (BOOL)supportsRapport
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf supportsRapport];
}

- (BOOL)isPickedOnPairedDevice
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf isPickedOnPairedDevice];
}

- (BOOL)supportsHeadTrackedSpatialAudio
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf supportsHeadTrackedSpatialAudio];
}

- (BOOL)allowsHeadTrackedSpatialAudio
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf allowsHeadTrackedSpatialAudio];
}

- (BOOL)isHeadTrackedSpatialAudioActive
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf isHeadTrackedSpatialAudioActive];
}

- (id)headTrackedSpatialAudioMode
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf headTrackedSpatialAudioMode];
}

- (id)dnsNames
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_protobuf dnsNames];
}

@end