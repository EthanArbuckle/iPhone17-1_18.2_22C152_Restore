@interface MPAVOutputDeviceRoute
+ (NSString)localDeviceUID;
+ (int64_t)pickableRouteTypeForOutputDevice:(void *)a3;
+ (void)logicalLeaderFromOutputDevices:(id)a3;
- (BOOL)_anyOutputDeviceObjPassesTest:(id)a3;
- (BOOL)_anyOutputDevicePassesMRFunction:(void *)a3;
- (BOOL)_anyOutputDevicePassesTest:(id)a3;
- (BOOL)canAccessRemoteAssets;
- (BOOL)canFetchMediaDataFromSender;
- (BOOL)canPlayEncryptedProgressiveDownloadAssets;
- (BOOL)headTrackedSpatialAudioEnabled;
- (BOOL)isAirPlayRoute;
- (BOOL)isAppleAccessory;
- (BOOL)isAppleTVRoute;
- (BOOL)isB520Route;
- (BOOL)isCarplayRoute;
- (BOOL)isClusterRoute;
- (BOOL)isDeviceRoute;
- (BOOL)isDeviceSpeakerPhoneRoute;
- (BOOL)isDeviceSpeakerRoute;
- (BOOL)isGroupLeader;
- (BOOL)isHomePodRoute;
- (BOOL)isHomeTheaterRoute;
- (BOOL)isKnown;
- (BOOL)isLowFidelityRoute;
- (BOOL)isLowLatencyRoute;
- (BOOL)isMacRoute;
- (BOOL)isNearby;
- (BOOL)isPhoneLocalRoute;
- (BOOL)isPhoneRoute;
- (BOOL)isPickable;
- (BOOL)isPicked;
- (BOOL)isPickedOnPairedDevice;
- (BOOL)isProxyGroupPlayer;
- (BOOL)isSplitterCapable;
- (BOOL)isStereoPair;
- (BOOL)isVolumeControlAvailable;
- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets;
- (BOOL)requiresPassword;
- (BOOL)supportsAirPlayGrouping;
- (BOOL)supportsGrouping;
- (BOOL)supportsHeadTrackedSpatialAudio;
- (BOOL)supportsWirelessDisplay;
- (MPAVOutputDeviceRoute)initWithOutputDevices:(id)a3;
- (MPAVOutputDeviceRoute)initWithOutputDevices:(id)a3 parentRoute:(id)a4;
- (NSArray)clusterMemberRoutes;
- (NSArray)dnsNames;
- (NSArray)outputDevices;
- (NSArray)roomRoutes;
- (id)clusterComposition;
- (id)clusterCompositionRoutes;
- (id)description;
- (id)groupUID;
- (id)playingPairedDeviceName;
- (id)productIdentifier;
- (id)routeName;
- (id)routeUID;
- (id)subRoutes;
- (int64_t)clusterType;
- (int64_t)originalRouteSubtype;
- (int64_t)pickableRouteType;
- (int64_t)routeSubtype;
- (int64_t)routeType;
- (void)logicalLeaderOutputDevice;
@end

@implementation MPAVOutputDeviceRoute

- (BOOL)isDeviceSpeakerRoute
{
  return [(MPAVOutputDeviceRoute *)self _anyOutputDevicePassesTest:&__block_literal_global_40820];
}

- (id)description
{
  v2 = (__CFString *)CFCopyDescription([(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice]);
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"MRAVOutputDevice" withString:v4];

  return v5;
}

- (BOOL)isAirPlayRoute
{
  return MRAVOutputDeviceGetType() == 1;
}

- (id)productIdentifier
{
  [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];
  v2 = (void *)MRAVOutputDeviceCopyModelID();

  return v2;
}

- (void)logicalLeaderOutputDevice
{
  return self->_logicalLeaderOutputDevice;
}

- (BOOL)isPicked
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._parentRoute);
  if ([WeakRetained isPicked])
  {
    BOOL v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MPAVOutputDeviceRoute;
    BOOL v4 = [(MPAVRoute *)&v6 isPicked];
  }

  return v4;
}

- (NSArray)outputDevices
{
  return self->_outputDevices;
}

- (MPAVOutputDeviceRoute)initWithOutputDevices:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MPAVOutputDeviceRoute;
  objc_super v6 = [(MPAVOutputDeviceRoute *)&v17 init];
  if (v6)
  {
    if (!v5)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, v6, @"MPAVOutputDeviceRoute.m", 31, @"Invalid parameter not satisfying: %@", @"outputDevices" object file lineNumber description];
    }
    uint64_t v7 = [v5 copy];
    outputDevices = v6->_outputDevices;
    v6->_outputDevices = (NSArray *)v7;

    v6->_logicalLeaderOutputDevice = (void *)[(id)objc_opt_class() logicalLeaderFromOutputDevices:v5];
    uint64_t v9 = MRAVOutputDeviceCopyName();
    routeName = v6->super._routeName;
    v6->super._routeName = (NSString *)v9;

    v6->super._picked = 0;
    avRouteDescription = v6->super._avRouteDescription;
    v6->super._avRouteDescription = 0;

    wirelessDisplayRoute = v6->super._wirelessDisplayRoute;
    v6->super._wirelessDisplayRoute = 0;

    v6->super._displayRouteType = 0;
    v13 = [[MPAVBatteryLevel alloc] initWithOutputDevice:v6->_logicalLeaderOutputDevice];
    batteryLevel = v6->super._batteryLevel;
    v6->super._batteryLevel = v13;
  }
  return v6;
}

+ (void)logicalLeaderFromOutputDevices:(id)a3
{
  v3 = [a3 sortedArrayUsingComparator:&__block_literal_global_35_40865];
  BOOL v4 = (void *)[v3 firstObject];

  return v4;
}

- (BOOL)_anyOutputDevicePassesTest:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__MPAVOutputDeviceRoute__anyOutputDevicePassesTest___block_invoke;
  v7[3] = &unk_1E57F6508;
  id v8 = v4;
  id v5 = v4;
  LOBYTE(self) = [(MPAVOutputDeviceRoute *)self _anyOutputDeviceObjPassesTest:v7];

  return (char)self;
}

- (BOOL)_anyOutputDeviceObjPassesTest:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (uint64_t (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_outputDevices;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * i)))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

uint64_t __52__MPAVOutputDeviceRoute__anyOutputDevicePassesTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL __45__MPAVOutputDeviceRoute_isDeviceSpeakerRoute__block_invoke()
{
  return MRAVOutputDeviceGetType() == 4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_clusterCompositionMembers, 0);
  objc_storeStrong((id *)&self->_clusterMemberRoutes, 0);

  objc_storeStrong((id *)&self->_roomRoutes, 0);
}

- (id)routeName
{
  uint64_t v3 = MRAVOutputDeviceCopySourceInfo();
  if (v3)
  {
    id v4 = (const void *)v3;
    char v5 = MEMORY[0x19971A0C0]();
    CFRelease(v4);
  }
  else
  {
    char v5 = 0;
  }
  int IsLocalDevice = MRAVOutputDeviceIsLocalDevice();
  int Type = MRAVOutputDeviceGetType();
  if (IsLocalDevice) {
    BOOL v8 = Type == 4;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8 || (v5 & 1) != 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)MPAVOutputDeviceRoute;
    uint64_t v9 = [(MPAVRoute *)&v11 routeName];
  }
  else
  {
    uint64_t v9 = (void *)MRAVOutputDeviceCopyLocalDeviceLocalizedName();
  }

  return v9;
}

- (BOOL)isKnown
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(MPAVOutputDeviceRoute *)self outputDevices];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isKnown])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isNearby
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(MPAVOutputDeviceRoute *)self outputDevices];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isNearby])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_anyOutputDevicePassesMRFunction:(void *)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__MPAVOutputDeviceRoute__anyOutputDevicePassesMRFunction___block_invoke;
  v4[3] = &__block_descriptor_40_e26_B16__0__MRAVOutputDevice_8l;
  v4[4] = a3;
  return [(MPAVOutputDeviceRoute *)self _anyOutputDeviceObjPassesTest:v4];
}

uint64_t __58__MPAVOutputDeviceRoute__anyOutputDevicePassesMRFunction___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 32))(a2);
}

- (BOOL)isPickable
{
  v2 = [(MPAVOutputDeviceRoute *)self outputDevice];
  char v3 = [v2 isPickable];

  return v3;
}

- (NSArray)dnsNames
{
  [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];
  v2 = (void *)MRAVOutputDeviceCopyDNSNames();

  return (NSArray *)v2;
}

- (BOOL)isLowFidelityRoute
{
  v2 = [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];
  char v3 = [v2 producesLowFidelityAudio];

  return v3;
}

- (int64_t)clusterType
{
  v2 = [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];
  int64_t v3 = objc_msgSend((id)objc_opt_class(), "clusterTypeForMRClusterType:", objc_msgSend(v2, "clusterType"));

  return v3;
}

- (id)subRoutes
{
  int64_t v3 = [MEMORY[0x1E4F770F0] currentSettings];
  if ([v3 showMembersInsteadOfRooms]) {
    [(MPAVOutputDeviceRoute *)self clusterMemberRoutes];
  }
  else {
  uint64_t v4 = [(MPAVOutputDeviceRoute *)self roomRoutes];
  }

  if ([v4 count] == 1)
  {
    char v5 = [MEMORY[0x1E4F770F0] currentSettings];
    char v6 = [v5 allowSingleRoomExpandedRows];

    if ((v6 & 1) == 0)
    {

      uint64_t v4 = 0;
    }
  }

  return v4;
}

- (id)clusterComposition
{
  int64_t v3 = [(MPAVOutputDeviceRoute *)self outputDevices];
  unint64_t v4 = [v3 count];

  if (v4 <= 1
    && ([(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice],
        MRAVOutputDeviceGetSubtype() == 15))
  {
    char v5 = [(MPAVOutputDeviceRoute *)self outputDevices];
    char v6 = [v5 firstObject];

    long long v7 = [(id)objc_opt_class() clusterCompositionForOutputDevice:v6];
  }
  else
  {
    long long v7 = 0;
  }

  return v7;
}

- (BOOL)isAppleAccessory
{
  v2 = [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];
  char v3 = [v2 isAppleAccessory];

  return v3;
}

- (BOOL)isLowLatencyRoute
{
  if ([(NSArray *)self->_outputDevices count] != 1) {
    return 0;
  }
  [(NSArray *)self->_outputDevices firstObject];

  return (MRAVOutputDeviceGetType() & 0xFFFFFFFE) == 4;
}

- (BOOL)isSplitterCapable
{
  return [(MPAVOutputDeviceRoute *)self _anyOutputDevicePassesMRFunction:MEMORY[0x1E4F76F38]];
}

- (BOOL)supportsAirPlayGrouping
{
  return [(MPAVOutputDeviceRoute *)self _anyOutputDevicePassesMRFunction:MEMORY[0x1E4F76F20]];
}

- (BOOL)supportsGrouping
{
  if ([(MPAVOutputDeviceRoute *)self _anyOutputDevicePassesMRFunction:MEMORY[0x1E4F76F20]])
  {
    return 1;
  }
  uint64_t v4 = MEMORY[0x1E4F76F38];

  return [(MPAVOutputDeviceRoute *)self _anyOutputDevicePassesMRFunction:v4];
}

- (BOOL)headTrackedSpatialAudioEnabled
{
  v2 = [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];

  return MEMORY[0x1F412DC28](v2);
}

- (BOOL)supportsHeadTrackedSpatialAudio
{
  v2 = [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];

  return MEMORY[0x1F412DD28](v2);
}

- (BOOL)isMacRoute
{
  v2 = [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];
  BOOL v3 = [v2 deviceSubtype] == 18;

  return v3;
}

- (BOOL)isPhoneLocalRoute
{
  v2 = [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];
  BOOL v3 = [v2 hostDeviceClass] == 1;

  return v3;
}

- (BOOL)isPhoneRoute
{
  v2 = [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];
  BOOL v3 = [v2 hostDeviceClass] == 1 && objc_msgSend(v2, "deviceType") == 4;

  return v3;
}

- (BOOL)isHomeTheaterRoute
{
  v2 = [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];
  BOOL v3 = [v2 clusterType] == 2;

  return v3;
}

- (BOOL)isClusterRoute
{
  BOOL v3 = [(MPAVOutputDeviceRoute *)self outputDevices];
  if ([v3 count] == 1)
  {
    uint64_t v4 = [(MPAVOutputDeviceRoute *)self outputDevices];
    char v5 = [v4 firstObject];
    BOOL v6 = [v5 deviceSubtype] == 15;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isStereoPair
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(MPAVOutputDeviceRoute *)self isClusterRoute])
  {
    BOOL v3 = [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];
    BOOL v4 = [(NSArray *)v3 clusterType] == 1;
  }
  else
  {
    BOOL v4 = [(NSArray *)self->_outputDevices count] > 1;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v3 = self->_outputDevices;
    uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v3);
          }
          BOOL v4 = v4 && MRAVOutputDeviceGetSubtype() == 12;
        }
        uint64_t v6 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }

  return v4;
}

- (BOOL)requiresPassword
{
  v2 = [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];

  return MEMORY[0x1F412DCF8](v2);
}

- (BOOL)supportsWirelessDisplay
{
  v2 = [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];

  return MEMORY[0x1F412DD18](v2);
}

- (int64_t)pickableRouteType
{
  BOOL v3 = objc_opt_class();
  BOOL v4 = [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];

  return [v3 pickableRouteTypeForOutputDevice:v4];
}

- (int64_t)originalRouteSubtype
{
  [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];
  uint64_t Type = MRAVOutputDeviceGetType();
  [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];
  uint64_t Subtype = MRAVOutputDeviceGetSubtype();
  uint64_t v5 = objc_opt_class();

  return [v5 routeSubtypeForMRSubtype:Subtype mrType:Type];
}

- (int64_t)routeSubtype
{
  [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];
  uint64_t Type = MRAVOutputDeviceGetType();
  [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];
  uint64_t Subtype = MRAVOutputDeviceGetSubtype();
  uint64_t v5 = objc_opt_class();

  return [v5 routeSubtypeForMRSubtype:Subtype withOverridesFromMRType:Type];
}

- (int64_t)routeType
{
  if (MRAVOutputDeviceIsGroupable()) {
    return 3;
  }
  else {
    return 0;
  }
}

- (id)playingPairedDeviceName
{
  [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];
  v2 = (void *)MRAVOutputDeviceCopyPlayingPairedDeviceName();

  return v2;
}

- (id)groupUID
{
  [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];
  v2 = (void *)MRAVOutputDeviceCopyGroupIdentifier();

  return v2;
}

- (id)routeUID
{
  [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];
  v2 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();

  return v2;
}

- (BOOL)isPickedOnPairedDevice
{
  v2 = [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];

  return MEMORY[0x1F412DCE0](v2);
}

- (BOOL)isVolumeControlAvailable
{
  v2 = [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];

  return MEMORY[0x1F412DCE8](v2);
}

- (BOOL)isGroupLeader
{
  return [(MPAVOutputDeviceRoute *)self _anyOutputDevicePassesMRFunction:MEMORY[0x1E4F76F18]];
}

- (BOOL)isProxyGroupPlayer
{
  return [(MPAVOutputDeviceRoute *)self _anyOutputDevicePassesMRFunction:MEMORY[0x1E4F76F30]];
}

- (BOOL)isDeviceSpeakerPhoneRoute
{
  return [(MPAVOutputDeviceRoute *)self _anyOutputDeviceObjPassesTest:&__block_literal_global_29_40818];
}

uint64_t __50__MPAVOutputDeviceRoute_isDeviceSpeakerPhoneRoute__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 deviceType] == 4 && objc_msgSend(v2, "deviceSubtype") == 1)
  {
    BOOL v3 = [v2 sourceInfo];
    uint64_t v4 = [v3 multipleBuiltInDevices];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)isDeviceRoute
{
  return [(MPAVOutputDeviceRoute *)self _anyOutputDevicePassesMRFunction:MEMORY[0x1E4F76F28]];
}

- (BOOL)isB520Route
{
  [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];
  id v2 = (void *)MRAVOutputDeviceCopyModelID();
  char v3 = [v2 containsString:@"AudioAccessory5"];

  return v3;
}

- (BOOL)isHomePodRoute
{
  if ([(MPAVOutputDeviceRoute *)self isClusterRoute])
  {
    return [(MPAVOutputDeviceRoute *)self isStereoPair];
  }
  else
  {
    [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];
    uint64_t v4 = (void *)MRAVOutputDeviceCopyModelID();
    char v5 = [v4 containsString:@"AudioAccessory"];

    return v5;
  }
}

- (BOOL)isCarplayRoute
{
  return MRAVOutputDeviceGetType() == 3;
}

- (BOOL)isAppleTVRoute
{
  [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];
  id v2 = (void *)MRAVOutputDeviceCopyModelID();
  char v3 = [v2 containsString:@"TV"];

  return v3;
}

- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  id v2 = [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];

  return MEMORY[0x1F412DCF0](v2);
}

- (BOOL)canFetchMediaDataFromSender
{
  id v2 = [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];

  return MEMORY[0x1F412DC38](v2);
}

- (BOOL)canPlayEncryptedProgressiveDownloadAssets
{
  id v2 = [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];

  return MEMORY[0x1F412DC40](v2);
}

- (BOOL)canAccessRemoteAssets
{
  id v2 = [(MPAVOutputDeviceRoute *)self logicalLeaderOutputDevice];

  return MEMORY[0x1F412DC30](v2);
}

- (id)clusterCompositionRoutes
{
  clusterCompositionMembers = self->_clusterCompositionMembers;
  if (!clusterCompositionMembers)
  {
    uint64_t v4 = [(MPAVOutputDeviceRoute *)self outputDevices];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__MPAVOutputDeviceRoute_clusterCompositionRoutes__block_invoke;
    v8[3] = &unk_1E57F64A0;
    v8[4] = self;
    objc_msgSend(v4, "msv_flatMap:", v8);
    char v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_clusterCompositionMembers;
    self->_clusterCompositionMembers = v5;

    clusterCompositionMembers = self->_clusterCompositionMembers;
  }

  return clusterCompositionMembers;
}

id __49__MPAVOutputDeviceRoute_clusterCompositionRoutes__block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 clusterCompositionMembers];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__MPAVOutputDeviceRoute_clusterCompositionRoutes__block_invoke_2;
  v6[3] = &unk_1E57F6478;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "msv_map:", v6);

  return v4;
}

MPAVOutputDeviceRoute *__49__MPAVOutputDeviceRoute_clusterCompositionRoutes__block_invoke_2(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [MPAVOutputDeviceRoute alloc];
  v8[0] = v3;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  uint64_t v6 = [(MPAVOutputDeviceRoute *)v4 initWithOutputDevices:v5 parentRoute:*(void *)(a1 + 32)];

  return v6;
}

- (NSArray)clusterMemberRoutes
{
  clusterMemberRoutes = self->_clusterMemberRoutes;
  if (!clusterMemberRoutes)
  {
    uint64_t v4 = [(MPAVOutputDeviceRoute *)self outputDevices];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __44__MPAVOutputDeviceRoute_clusterMemberRoutes__block_invoke;
    v8[3] = &unk_1E57F64A0;
    v8[4] = self;
    objc_msgSend(v4, "msv_flatMap:", v8);
    char v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_clusterMemberRoutes;
    self->_clusterMemberRoutes = v5;

    clusterMemberRoutes = self->_clusterMemberRoutes;
  }

  return clusterMemberRoutes;
}

id __44__MPAVOutputDeviceRoute_clusterMemberRoutes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 activatedClusterMembersOutputDevices];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__MPAVOutputDeviceRoute_clusterMemberRoutes__block_invoke_2;
  v6[3] = &unk_1E57F6478;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "msv_map:", v6);

  return v4;
}

MPAVOutputDeviceRoute *__44__MPAVOutputDeviceRoute_clusterMemberRoutes__block_invoke_2(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [MPAVOutputDeviceRoute alloc];
  v8[0] = v3;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  uint64_t v6 = [(MPAVOutputDeviceRoute *)v4 initWithOutputDevices:v5 parentRoute:*(void *)(a1 + 32)];

  return v6;
}

- (NSArray)roomRoutes
{
  roomRoutes = self->_roomRoutes;
  if (!roomRoutes)
  {
    uint64_t v4 = [(MPAVOutputDeviceRoute *)self outputDevices];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __35__MPAVOutputDeviceRoute_roomRoutes__block_invoke;
    v8[3] = &unk_1E57F64A0;
    v8[4] = self;
    objc_msgSend(v4, "msv_flatMap:", v8);
    char v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_roomRoutes;
    self->_roomRoutes = v5;

    roomRoutes = self->_roomRoutes;
  }

  return roomRoutes;
}

id __35__MPAVOutputDeviceRoute_roomRoutes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 roomOutputDevices];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__MPAVOutputDeviceRoute_roomRoutes__block_invoke_2;
  v6[3] = &unk_1E57F6478;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "msv_map:", v6);

  return v4;
}

MPAVOutputDeviceRoute *__35__MPAVOutputDeviceRoute_roomRoutes__block_invoke_2(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [MPAVOutputDeviceRoute alloc];
  v8[0] = v3;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  uint64_t v6 = [(MPAVOutputDeviceRoute *)v4 initWithOutputDevices:v5 parentRoute:*(void *)(a1 + 32)];

  return v6;
}

- (MPAVOutputDeviceRoute)initWithOutputDevices:(id)a3 parentRoute:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(MPAVOutputDeviceRoute *)self initWithOutputDevices:a3];
  long long v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->super._parentRoute, v6);
  }

  return v8;
}

+ (int64_t)pickableRouteTypeForOutputDevice:(void *)a3
{
  return MRAVOutputDeviceGetType() - 1 < 2;
}

+ (NSString)localDeviceUID
{
  return (NSString *)@"LOCAL";
}

uint64_t __56__MPAVOutputDeviceRoute_logicalLeaderFromOutputDevices___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int IsGroupLeader = MRAVOutputDeviceIsGroupLeader();
  int v7 = MRAVOutputDeviceIsGroupLeader();
  if (!IsGroupLeader || v7)
  {
    if ((IsGroupLeader | v7 ^ 1) == 1)
    {
      long long v9 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
      long long v10 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
      uint64_t v8 = [v9 compare:v10];
    }
    else
    {
      uint64_t v8 = 1;
    }
  }
  else
  {
    uint64_t v8 = -1;
  }

  return v8;
}

@end