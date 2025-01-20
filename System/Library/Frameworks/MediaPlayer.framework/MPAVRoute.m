@interface MPAVRoute
+ (BOOL)supportsSecureCoding;
+ (id)clusterCompositionForOutputDevice:(id)a3;
+ (int64_t)clusterTypeForMRClusterType:(unsigned int)a3;
+ (int64_t)routeSubtypeForMRSubtype:(unsigned int)a3 mrType:(unsigned int)a4;
+ (int64_t)routeSubtypeForMRSubtype:(unsigned int)a3 withOverridesFromMRType:(unsigned int)a4;
- (BOOL)canAccessRemoteAssets;
- (BOOL)canFetchMediaDataFromSender;
- (BOOL)canPlayEncryptedProgressiveDownloadAssets;
- (BOOL)containsDeviceWithSubtype:(int64_t)a3;
- (BOOL)headTrackedSpatialAudioEnabled;
- (BOOL)isAirPlayRoute;
- (BOOL)isAirPlayingToDevice;
- (BOOL)isAirpodsRoute;
- (BOOL)isAppleAccessory;
- (BOOL)isAppleTVRoute;
- (BOOL)isB298Route;
- (BOOL)isB364Route;
- (BOOL)isB372Route;
- (BOOL)isB419Route;
- (BOOL)isB444Route;
- (BOOL)isB494Route;
- (BOOL)isB498Route;
- (BOOL)isB507Route;
- (BOOL)isB515Route;
- (BOOL)isB520Route;
- (BOOL)isB607Route;
- (BOOL)isB688Route;
- (BOOL)isB698CRoute;
- (BOOL)isB698Route;
- (BOOL)isB735ERoute;
- (BOOL)isB735MRoute;
- (BOOL)isB768CHERoute;
- (BOOL)isB768CHMRoute;
- (BOOL)isB768ERoute;
- (BOOL)isB768MRoute;
- (BOOL)isBeatsLegacyRoute;
- (BOOL)isBeatsRoute;
- (BOOL)isBeatsSoloRoute;
- (BOOL)isBeatsStudioProRoute;
- (BOOL)isBeatsStudioRoute;
- (BOOL)isBeatsXRoute;
- (BOOL)isCarplayRoute;
- (BOOL)isClusterRoute;
- (BOOL)isDeviceRoute;
- (BOOL)isDeviceSpeakerPhoneRoute;
- (BOOL)isDeviceSpeakerRoute;
- (BOOL)isDisplayedAsPicked;
- (BOOL)isEqual:(id)a3;
- (BOOL)isH1Route;
- (BOOL)isHeadphonesRoute;
- (BOOL)isHearingDeviceRoute;
- (BOOL)isHomePodRoute;
- (BOOL)isHomeTheaterB520Route;
- (BOOL)isHomeTheaterRoute;
- (BOOL)isJ327Route;
- (BOOL)isKnown;
- (BOOL)isLowFidelityRoute;
- (BOOL)isLowLatencyRoute;
- (BOOL)isMacRoute;
- (BOOL)isNearby;
- (BOOL)isPhoneRoute;
- (BOOL)isPickable;
- (BOOL)isPicked;
- (BOOL)isPickedOnPairedDevice;
- (BOOL)isPlayingOnPairedDevice;
- (BOOL)isPowerbeatsRoute;
- (BOOL)isProxyGroupPlayer;
- (BOOL)isRoutingToWirelessDevice;
- (BOOL)isSetTopBoxRoute;
- (BOOL)isShareableRoute;
- (BOOL)isSmartAudio;
- (BOOL)isSplitRoute;
- (BOOL)isSplitterCapable;
- (BOOL)isStereoPair;
- (BOOL)isSubRoute;
- (BOOL)isTVRoute;
- (BOOL)isTVStickRoute;
- (BOOL)isVisionRoute;
- (BOOL)isVolumeControlAvailable;
- (BOOL)isW1Route;
- (BOOL)isW3Route;
- (BOOL)isiOSRoute;
- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets;
- (BOOL)requiresPassword;
- (BOOL)supportsAirPlayGrouping;
- (BOOL)supportsGrouping;
- (BOOL)supportsHeadTrackedSpatialAudio;
- (BOOL)supportsPicking;
- (BOOL)supportsRemoteControl;
- (BOOL)supportsWirelessDisplay;
- (MPAVBatteryLevel)batteryLevel;
- (MPAVRoute)initWithCoder:(id)a3;
- (MPAVRoute)parentRoute;
- (MPAVRoute)wirelessDisplayRoute;
- (MPAVRouteConnection)connection;
- (NSArray)auxiliaryDevices;
- (NSArray)clusterComposition;
- (NSArray)clusterCompositionRoutes;
- (NSArray)routeNames;
- (NSArray)subRoutes;
- (NSDictionary)avRouteDescription;
- (NSString)designatedGroupLeaderName;
- (NSString)designatedGroupLeaderRouteUID;
- (NSString)groupLeaderAirplayIdentifier;
- (NSString)groupUID;
- (NSString)playingPairedDeviceName;
- (NSString)productIdentifier;
- (NSString)routeName;
- (NSString)routeUID;
- (id)debugDescription;
- (id)description;
- (int64_t)clusterType;
- (int64_t)displayRouteType;
- (int64_t)numberOfOutputDevices;
- (int64_t)originalRouteSubtype;
- (int64_t)passwordType;
- (int64_t)pickableRouteType;
- (int64_t)routeSubtype;
- (int64_t)routeType;
- (unint64_t)hash;
- (void)_externalDevice;
- (void)setAVRouteDescription:(id)a3;
- (void)setDisplayRouteType:(int64_t)a3;
- (void)setParentRoute:(id)a3;
- (void)setPicked:(BOOL)a3;
- (void)setRouteName:(id)a3;
- (void)setWirelessDisplayRoute:(id)a3;
@end

@implementation MPAVRoute

- (unint64_t)hash
{
  v3 = [(MPAVRoute *)self routeUID];
  v4 = [(MPAVRoute *)self routeName];
  int64_t v5 = [(MPAVRoute *)self routeType];
  int64_t v6 = [(MPAVRoute *)self routeSubtype];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    unint64_t v7 = [v3 hash];
  }
  else if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    unint64_t v7 = v6 + v5 + [v4 hash];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(MPAVRoute *)self routeName];
  int64_t v6 = [(MPAVRoute *)self routeUID];
  unint64_t v7 = [(MPAVRoute *)self routeType];
  if (v7 > 3) {
    v8 = @"Undefined";
  }
  else {
    v8 = off_1E57F2708[v7];
  }
  unint64_t v9 = [(MPAVRoute *)self routeSubtype];
  if (v9 > 0x1B) {
    v10 = @"Undefined";
  }
  else {
    v10 = off_1E57F2628[v9];
  }
  v11 = v10;
  v12 = [v3 stringWithFormat:@"<%@: %p name=%@ uid=%@ type=%@ subtype=%@>", v4, self, v5, v6, v8, v11];

  return v12;
}

- (BOOL)isB507Route
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,8209"];

  return v3;
}

- (BOOL)isB515Route
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,8202"];

  return v3;
}

- (BOOL)isB298Route
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,8206"];

  return v3;
}

- (BOOL)isW1Route
{
  char v3 = [(MPAVRoute *)self productIdentifier];
  if ([v3 containsString:@"76,8194"])
  {
    char v4 = 1;
  }
  else
  {
    int64_t v5 = [(MPAVRoute *)self productIdentifier];
    if ([v5 containsString:@"76,8195"])
    {
      char v4 = 1;
    }
    else
    {
      int64_t v6 = [(MPAVRoute *)self productIdentifier];
      if ([v6 containsString:@"76,8197"])
      {
        char v4 = 1;
      }
      else
      {
        unint64_t v7 = [(MPAVRoute *)self productIdentifier];
        if ([v7 containsString:@"76,8198"])
        {
          char v4 = 1;
        }
        else
        {
          v8 = [(MPAVRoute *)self productIdentifier];
          if ([v8 containsString:@"76,8201"])
          {
            char v4 = 1;
          }
          else
          {
            unint64_t v9 = [(MPAVRoute *)self productIdentifier];
            char v4 = [v9 containsString:@"76,8208"];
          }
        }
      }
    }
  }
  return v4;
}

- (BOOL)isH1Route
{
  char v3 = [(MPAVRoute *)self productIdentifier];
  if ([v3 containsString:@"76,8207"])
  {
    char v4 = 1;
  }
  else
  {
    int64_t v5 = [(MPAVRoute *)self productIdentifier];
    if ([v5 containsString:@"76,8203"])
    {
      char v4 = 1;
    }
    else
    {
      int64_t v6 = [(MPAVRoute *)self productIdentifier];
      if ([v6 containsString:@"76,8204"])
      {
        char v4 = 1;
      }
      else
      {
        unint64_t v7 = [(MPAVRoute *)self productIdentifier];
        if ([v7 containsString:@"76,8205"])
        {
          char v4 = 1;
        }
        else
        {
          v8 = [(MPAVRoute *)self productIdentifier];
          if ([v8 containsString:@"76,8206"])
          {
            char v4 = 1;
          }
          else
          {
            unint64_t v9 = [(MPAVRoute *)self productIdentifier];
            if ([v9 containsString:@"76,8202"])
            {
              char v4 = 1;
            }
            else
            {
              v10 = [(MPAVRoute *)self productIdentifier];
              if ([v10 containsString:@"76,8208"])
              {
                char v4 = 1;
              }
              else
              {
                v11 = [(MPAVRoute *)self productIdentifier];
                if ([v11 containsString:@"76,8210"])
                {
                  char v4 = 1;
                }
                else
                {
                  v12 = [(MPAVRoute *)self productIdentifier];
                  char v4 = [v12 containsString:@"76,8211"];
                }
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

- (BOOL)isPicked
{
  return self->_picked;
}

- (void)setPicked:(BOOL)a3
{
  self->_picked = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    int64_t v6 = [(MPAVRoute *)self routeUID];
    unint64_t v7 = [(MPAVRoute *)self routeName];
    int64_t v8 = [(MPAVRoute *)self routeType];
    int64_t v9 = [(MPAVRoute *)self routeSubtype];
    if ([v6 length])
    {
      if ([v6 length])
      {
        v10 = [v5 routeUID];
        v11 = v6;
LABEL_5:
        unsigned __int8 v12 = [v11 isEqualToString:v10];

LABEL_11:
        goto LABEL_12;
      }
    }
    else if (v8 == [v5 routeType] && v9 == objc_msgSend(v5, "routeSubtype"))
    {
      v10 = [v5 routeName];
      v11 = v7;
      goto LABEL_5;
    }
    unsigned __int8 v12 = 0;
    goto LABEL_11;
  }
  v14.receiver = self;
  v14.super_class = (Class)MPAVRoute;
  unsigned __int8 v12 = [(MPAVRoute *)&v14 isEqual:v4];
LABEL_12:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_playingPairedDeviceName, 0);
  objc_storeStrong((id *)&self->_auxiliaryDevices, 0);
  objc_storeStrong((id *)&self->_clusterCompositionRoutes, 0);
  objc_storeStrong((id *)&self->_subRoutes, 0);
  objc_storeStrong((id *)&self->_clusterComposition, 0);
  objc_storeStrong((id *)&self->_designatedGroupLeaderRouteUID, 0);
  objc_storeStrong((id *)&self->_groupUID, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_routeUID, 0);
  objc_destroyWeak((id *)&self->_parentRoute);
  objc_storeStrong((id *)&self->_batteryLevel, 0);
  objc_storeStrong((id *)&self->_wirelessDisplayRoute, 0);
  objc_storeStrong((id *)&self->_avRouteDescription, 0);

  objc_storeStrong((id *)&self->_routeName, 0);
}

- (MPAVRouteConnection)connection
{
  return self->_connection;
}

- (int64_t)originalRouteSubtype
{
  return self->_originalRouteSubtype;
}

- (void)setParentRoute:(id)a3
{
}

- (MPAVRoute)parentRoute
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentRoute);

  return (MPAVRoute *)WeakRetained;
}

- (BOOL)isPickable
{
  return self->_pickable;
}

- (void)_externalDevice
{
  return self->_externalDevice;
}

- (BOOL)supportsPicking
{
  return self->_supportsPicking;
}

- (int64_t)clusterType
{
  return self->_clusterType;
}

- (BOOL)isAppleAccessory
{
  return self->_appleAccessory;
}

- (BOOL)isClusterRoute
{
  return self->_clusterRoute;
}

- (BOOL)isLowFidelityRoute
{
  return self->_lowFidelityRoute;
}

- (BOOL)isHomeTheaterRoute
{
  return self->_homeTheaterRoute;
}

- (BOOL)isB520Route
{
  return self->_b520Route;
}

- (BOOL)isHomePodRoute
{
  return self->_homePodRoute;
}

- (BOOL)isCarplayRoute
{
  return self->_carplayRoute;
}

- (BOOL)requiresPassword
{
  return self->_requiresPassword;
}

- (BOOL)isPlayingOnPairedDevice
{
  return self->_playingOnPairedDevice;
}

- (BOOL)isPickedOnPairedDevice
{
  return self->_pickedOnPairedDevice;
}

- (NSString)playingPairedDeviceName
{
  return self->_playingPairedDeviceName;
}

- (NSArray)auxiliaryDevices
{
  return self->_auxiliaryDevices;
}

- (MPAVBatteryLevel)batteryLevel
{
  return self->_batteryLevel;
}

- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  return self->_presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets;
}

- (BOOL)canFetchMediaDataFromSender
{
  return self->_canFetchMediaDataFromSender;
}

- (BOOL)canPlayEncryptedProgressiveDownloadAssets
{
  return self->_canPlayEncryptedProgressiveDownloadAssets;
}

- (BOOL)canAccessRemoteAssets
{
  return self->_canAccessRemoteAssets;
}

- (NSArray)clusterCompositionRoutes
{
  return self->_clusterCompositionRoutes;
}

- (NSArray)subRoutes
{
  return self->_subRoutes;
}

- (NSArray)clusterComposition
{
  return self->_clusterComposition;
}

- (int64_t)routeSubtype
{
  return self->_routeSubtype;
}

- (int64_t)pickableRouteType
{
  return self->_pickableRouteType;
}

- (int64_t)routeType
{
  return self->_routeType;
}

- (NSString)designatedGroupLeaderRouteUID
{
  return self->_designatedGroupLeaderRouteUID;
}

- (NSString)groupUID
{
  return self->_groupUID;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (NSString)routeUID
{
  return self->_routeUID;
}

- (id)debugDescription
{
  char v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(MPAVRoute *)self routeName];
  if ([(MPAVRoute *)self isPicked]) {
    int64_t v6 = @"YES";
  }
  else {
    int64_t v6 = @"NO";
  }
  unint64_t v7 = [(MPAVRoute *)self routeUID];
  int64_t v8 = [v3 stringWithFormat:@"<%@: %p, \"%@\", picked=%@ uid=%@>", v4, self, v5, v6, v7];

  wirelessDisplayRoute = self->_wirelessDisplayRoute;
  if (wirelessDisplayRoute)
  {
    v10 = [(MPAVRoute *)wirelessDisplayRoute description];
    uint64_t v11 = [v8 stringByAppendingFormat:@"\n\t| Mirroring Route: %@", v10];

    int64_t v8 = (void *)v11;
  }

  return v8;
}

- (BOOL)isSubRoute
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentRoute);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (BOOL)isKnown
{
  return 1;
}

- (BOOL)isNearby
{
  return 0;
}

- (BOOL)containsDeviceWithSubtype:(int64_t)a3
{
  if ([(MPAVRoute *)self originalRouteSubtype] == a3) {
    return 1;
  }
  int64_t v6 = [(MPAVRoute *)self clusterComposition];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__MPAVRoute_containsDeviceWithSubtype___block_invoke;
  v10[3] = &__block_descriptor_40_e54_B24__0__MPAVOutputDeviceDescription_8__NSDictionary_16l;
  v10[4] = a3;
  unint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:v10];
  int64_t v8 = [v6 filteredArrayUsingPredicate:v7];
  BOOL v5 = [v8 count] != 0;

  return v5;
}

BOOL __39__MPAVRoute_containsDeviceWithSubtype___block_invoke(uint64_t a1, void *a2)
{
  return [a2 routeSubtype] == *(void *)(a1 + 32);
}

- (BOOL)supportsWirelessDisplay
{
  return self->_wirelessDisplayRoute != 0;
}

- (BOOL)isLowLatencyRoute
{
  return 0;
}

- (BOOL)headTrackedSpatialAudioEnabled
{
  return 0;
}

- (BOOL)supportsHeadTrackedSpatialAudio
{
  return 0;
}

- (BOOL)isVisionRoute
{
  return [(MPAVRoute *)self originalRouteSubtype] == 27;
}

- (BOOL)isMacRoute
{
  return [(MPAVRoute *)self originalRouteSubtype] == 24;
}

- (BOOL)isiOSRoute
{
  return [(MPAVRoute *)self isPhoneRoute]
      || [(MPAVRoute *)self originalRouteSubtype] == 25;
}

- (BOOL)isPhoneRoute
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MPAVRoute isPhoneRoute]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (BOOL)isSetTopBoxRoute
{
  return [(MPAVRoute *)self originalRouteSubtype] == 22;
}

- (BOOL)isTVStickRoute
{
  return [(MPAVRoute *)self originalRouteSubtype] == 23;
}

- (BOOL)isTVRoute
{
  if ([(MPAVRoute *)self isAppleTVRoute]
    || [(MPAVRoute *)self routeSubtype] == 16
    || [(MPAVRoute *)self isTVStickRoute])
  {
    return 1;
  }

  return [(MPAVRoute *)self isSetTopBoxRoute];
}

- (BOOL)isHomeTheaterB520Route
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [(MPAVRoute *)self clusterComposition];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        if (v6)
        {
          char v6 = 1;
        }
        else
        {
          int64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) modelID];
          char v6 = [v9 containsString:@"AudioAccessory5"];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    char v6 = 0;
  }

  return [(MPAVRoute *)self isHomeTheaterRoute] & v6;
}

- (BOOL)isStereoPair
{
  return 0;
}

- (BOOL)isSmartAudio
{
  return [(MPAVRoute *)self routeType] == 3;
}

- (BOOL)isHearingDeviceRoute
{
  v2 = [(MPAVRoute *)self routeUID];
  char v3 = [v2 containsString:@"-tlea"];

  return v3;
}

- (BOOL)isDeviceSpeakerPhoneRoute
{
  return 0;
}

- (BOOL)isDeviceSpeakerRoute
{
  return 0;
}

- (BOOL)isAirPlayRoute
{
  return 0;
}

- (BOOL)isJ327Route
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"j327"];

  return v3;
}

- (BOOL)isB498Route
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,8221"];

  return v3;
}

- (BOOL)isB494Route
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,8210"];

  return v3;
}

- (BOOL)isB364Route
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,8205"];

  return v3;
}

- (BOOL)isB419Route
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,8204"];

  return v3;
}

- (BOOL)isB444Route
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,8203"];

  return v3;
}

- (BOOL)isB372Route
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,8208"];

  return v3;
}

- (BOOL)isBeatsLegacyRoute
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 componentsSeparatedByString:@","];
  uint64_t v4 = [v3 firstObject];

  if (v4)
  {
    if ([v4 containsString:@"10507"]) {
      char v5 = 1;
    }
    else {
      char v5 = [v4 containsString:@"204"];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isBeatsXRoute
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,8197"];

  return v3;
}

- (BOOL)isBeatsStudioProRoute
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,8215"];

  return v3;
}

- (BOOL)isBeatsStudioRoute
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,8201"];

  return v3;
}

- (BOOL)isBeatsSoloRoute
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,8198"];

  return v3;
}

- (BOOL)isPowerbeatsRoute
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,8195"];

  return v3;
}

- (BOOL)isB607Route
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,8214"];

  return v3;
}

- (BOOL)isBeatsRoute
{
  if ([(MPAVRoute *)self isBeatsSoloRoute]
    || [(MPAVRoute *)self isBeatsStudioRoute]
    || [(MPAVRoute *)self isBeatsStudioProRoute]
    || [(MPAVRoute *)self isBeatsXRoute]
    || [(MPAVRoute *)self isPowerbeatsRoute]
    || [(MPAVRoute *)self isB364Route]
    || [(MPAVRoute *)self isB372Route]
    || [(MPAVRoute *)self isB419Route]
    || [(MPAVRoute *)self isB444Route]
    || [(MPAVRoute *)self isB494Route]
    || [(MPAVRoute *)self isB498Route]
    || [(MPAVRoute *)self isB507Route])
  {
    return 1;
  }

  return [(MPAVRoute *)self isB607Route];
}

- (BOOL)isB735MRoute
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,5024"];

  return v3;
}

- (BOOL)isB735ERoute
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,5023"];

  return v3;
}

- (BOOL)isB768CHMRoute
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,8224"];

  return v3;
}

- (BOOL)isB768CHERoute
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,8222"];

  return v3;
}

- (BOOL)isB768MRoute
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,8219"];

  return v3;
}

- (BOOL)isB768ERoute
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,8217"];

  return v3;
}

- (BOOL)isB698CRoute
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,8228"];

  return v3;
}

- (BOOL)isB698Route
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,8212"];

  return v3;
}

- (BOOL)isB688Route
{
  v2 = [(MPAVRoute *)self productIdentifier];
  char v3 = [v2 containsString:@"76,8211"];

  return v3;
}

- (BOOL)isAirpodsRoute
{
  char v3 = [(MPAVRoute *)self productIdentifier];
  if ([v3 containsString:@"76,8194"])
  {
    BOOL v4 = 1;
  }
  else
  {
    char v5 = [(MPAVRoute *)self productIdentifier];
    BOOL v4 = ([v5 containsString:@"76,8207"] & 1) != 0
      || [(MPAVRoute *)self isB298Route]
      || [(MPAVRoute *)self isB515Route]
      || [(MPAVRoute *)self isB688Route]
      || [(MPAVRoute *)self isB698Route]
      || [(MPAVRoute *)self isB698CRoute]
      || [(MPAVRoute *)self isB768ERoute]
      || [(MPAVRoute *)self isB768MRoute]
      || [(MPAVRoute *)self isB768CHERoute]
      || [(MPAVRoute *)self isB768CHMRoute]
      || [(MPAVRoute *)self isB735ERoute]
      || [(MPAVRoute *)self isB735MRoute];
  }
  return v4;
}

- (BOOL)isW3Route
{
  if ([(MPAVRoute *)self isB698Route]
    || [(MPAVRoute *)self isB698CRoute]
    || [(MPAVRoute *)self isB768ERoute]
    || [(MPAVRoute *)self isB768MRoute]
    || [(MPAVRoute *)self isB768CHERoute]
    || [(MPAVRoute *)self isB768CHMRoute]
    || [(MPAVRoute *)self isB735ERoute])
  {
    return 1;
  }

  return [(MPAVRoute *)self isB735MRoute];
}

- (BOOL)isHeadphonesRoute
{
  unint64_t v2 = [(MPAVRoute *)self routeSubtype];
  return (v2 < 0xE) & (0x3804u >> v2);
}

- (BOOL)isShareableRoute
{
  if ([(MPAVRoute *)self isAirpodsRoute] || [(MPAVRoute *)self isW1Route]) {
    return 1;
  }

  return [(MPAVRoute *)self isH1Route];
}

- (void)setDisplayRouteType:(int64_t)a3
{
  self->_displayRouteType = a3;
}

- (int64_t)displayRouteType
{
  return self->_displayRouteType;
}

- (BOOL)isDisplayedAsPicked
{
  if ([(MPAVRoute *)self isPicked] || [(MPAVRoute *)self->_wirelessDisplayRoute isPicked]) {
    return 1;
  }

  return [(MPAVRoute *)self isPickedOnPairedDevice];
}

- (int64_t)passwordType
{
  return 0;
}

- (void)setWirelessDisplayRoute:(id)a3
{
}

- (MPAVRoute)wirelessDisplayRoute
{
  return self->_wirelessDisplayRoute;
}

- (BOOL)isRoutingToWirelessDevice
{
  return 0;
}

- (int64_t)numberOfOutputDevices
{
  return 1;
}

- (BOOL)isSplitRoute
{
  return 0;
}

- (BOOL)isSplitterCapable
{
  return 0;
}

- (BOOL)supportsRemoteControl
{
  return 0;
}

- (BOOL)supportsAirPlayGrouping
{
  return 0;
}

- (BOOL)supportsGrouping
{
  return 0;
}

- (BOOL)isVolumeControlAvailable
{
  return 0;
}

- (BOOL)isProxyGroupPlayer
{
  return 0;
}

- (BOOL)isDeviceRoute
{
  int64_t v3 = [(MPAVRoute *)self routeSubtype];
  if (v3 != 1) {
    LOBYTE(v3) = [(MPAVRoute *)self routeSubtype] == 2;
  }
  return v3;
}

- (BOOL)isAppleTVRoute
{
  int64_t v3 = [(MPAVRoute *)self routeType];
  if (v3 != 1) {
    LOBYTE(v3) = [(MPAVRoute *)self routeType] == 2;
  }
  return v3;
}

- (NSString)groupLeaderAirplayIdentifier
{
  return 0;
}

- (BOOL)isAirPlayingToDevice
{
  return 0;
}

- (void)setAVRouteDescription:(id)a3
{
  BOOL v4 = (NSDictionary *)[a3 copy];
  avRouteDescription = self->_avRouteDescription;
  self->_avRouteDescription = v4;
}

- (NSDictionary)avRouteDescription
{
  return self->_avRouteDescription;
}

- (void)setRouteName:(id)a3
{
  BOOL v4 = (NSString *)[a3 copy];
  routeName = self->_routeName;
  self->_routeName = v4;
}

- (NSArray)routeNames
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (self->_routeName)
  {
    v4[0] = self->_routeName;
    unint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    unint64_t v2 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v2;
}

- (NSString)designatedGroupLeaderName
{
  return 0;
}

- (NSString)routeName
{
  return self->_routeName;
}

- (MPAVRoute)initWithCoder:(id)a3
{
  return 0;
}

+ (int64_t)clusterTypeForMRClusterType:(unsigned int)a3
{
  if (a3 - 1 > 2) {
    return 0;
  }
  else {
    return qword_19568AD50[a3 - 1];
  }
}

+ (id)clusterCompositionForOutputDevice:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 deviceSubtype] == 15)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F1CA48];
    char v5 = [v3 clusterComposition];
    char v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = [v3 clusterComposition];
    uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(obj);
          }
          long long v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          long long v12 = [MPAVOutputDeviceDescription alloc];
          uint64_t v13 = objc_msgSend((id)objc_opt_class(), "routeSubtypeForMRSubtype:mrType:", objc_msgSend(v11, "deviceSubtype"), objc_msgSend(v11, "deviceType"));
          long long v14 = [v11 uid];
          v15 = [v11 modelID];
          uint64_t v16 = [(MPAVOutputDeviceDescription *)v12 initWithDeviceType:0 deviceSubtype:v13 uid:v14 modelID:v15];

          [v6 addObject:v16];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (int64_t)routeSubtypeForMRSubtype:(unsigned int)a3 mrType:(unsigned int)a4
{
  switch(a3)
  {
    case 1u:
      int64_t v4 = 9;
      if (a4 != 1) {
        int64_t v4 = 1;
      }
      BOOL v5 = a4 == 2;
      int64_t v6 = 21;
      goto LABEL_8;
    case 2u:
      BOOL v5 = a4 == 2;
      int64_t v4 = 2;
      int64_t v6 = 11;
      goto LABEL_8;
    case 3u:
      BOOL v5 = a4 == 2;
      int64_t v4 = 3;
      int64_t v6 = 12;
LABEL_8:
      if (v5) {
        int64_t result = v6;
      }
      else {
        int64_t result = v4;
      }
      break;
    case 4u:
      int64_t result = 4;
      break;
    case 5u:
      int64_t result = 5;
      break;
    case 6u:
      int64_t result = 7;
      break;
    case 7u:
      int64_t result = 8;
      break;
    case 8u:
      int64_t result = 10;
      break;
    case 9u:
      int64_t result = 13;
      break;
    case 0xAu:
      int64_t result = 14;
      break;
    case 0xBu:
      int64_t result = 16;
      break;
    case 0xCu:
      int64_t result = 17;
      break;
    case 0xDu:
      int64_t result = 18;
      break;
    case 0xEu:
      int64_t result = 19;
      break;
    case 0xFu:
      int64_t result = 20;
      break;
    case 0x10u:
      int64_t result = 22;
      break;
    case 0x11u:
      int64_t result = 23;
      break;
    case 0x12u:
      int64_t result = 24;
      break;
    case 0x13u:
      int64_t result = 25;
      break;
    case 0x14u:
      int64_t result = 26;
      break;
    case 0x15u:
      int64_t result = 27;
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

+ (int64_t)routeSubtypeForMRSubtype:(unsigned int)a3 withOverridesFromMRType:(unsigned int)a4
{
  if (a3 == 11 || (a4 & 0xFFFFFFFD) != 1) {
    return objc_msgSend(a1, "routeSubtypeForMRSubtype:mrType:");
  }
  int64_t v4 = 9;
  if (a4 == 3) {
    int64_t v4 = 15;
  }
  if (a4 == 2) {
    return 0;
  }
  else {
    return v4;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end