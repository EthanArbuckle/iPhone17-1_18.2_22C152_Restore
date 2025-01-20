@interface MRUOutputDeviceAsset
+ (MRUOutputDeviceAsset)inCallAsset;
+ (MRUOutputDeviceAsset)sharingAsset;
+ (MRUOutputDeviceAsset)speakerAsset;
- (BOOL)isEqual:(id)a3;
- (CCUICAPackageDescription)packageDescription;
- (MRUOutputDeviceAsset)initWithOutputDeviceRoute:(id)a3;
- (MRUOutputDeviceAsset)initWithPackageAsset:(id)a3 symbolName:(id)a4 image:(id)a5 type:(int64_t)a6 deviceCount:(unint64_t)a7;
- (NSString)localizedDisplayTitle;
- (id)localizedDisplayTitleForAssetType:(int64_t)a3 deviceCount:(unint64_t)a4;
- (int64_t)kind;
- (int64_t)outputDeviceAssetTypeForOutputDeviceRoute:(id)a3;
- (int64_t)type;
@end

@implementation MRUOutputDeviceAsset

- (MRUOutputDeviceAsset)initWithPackageAsset:(id)a3 symbolName:(id)a4 image:(id)a5 type:(int64_t)a6 deviceCount:(unint64_t)a7
{
  v14.receiver = self;
  v14.super_class = (Class)MRUOutputDeviceAsset;
  v9 = [(MRUAsset *)&v14 initWithPackageAsset:a3 symbolName:a4 image:a5];
  v10 = v9;
  if (v9)
  {
    v9->_type = a6;
    uint64_t v11 = [(MRUOutputDeviceAsset *)v9 localizedDisplayTitleForAssetType:a6 deviceCount:a7];
    localizedDisplayTitle = v10->_localizedDisplayTitle;
    v10->_localizedDisplayTitle = (NSString *)v11;
  }
  return v10;
}

- (MRUOutputDeviceAsset)initWithOutputDeviceRoute:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(MRUOutputDeviceAsset *)self outputDeviceAssetTypeForOutputDeviceRoute:v4];
  if (v5)
  {
    int64_t v20 = v5;
    id v21 = v4;
    v6 = [v4 outputDevices];
    v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * v12);
          id v14 = objc_alloc(MEMORY[0x1E4F31830]);
          uint64_t v26 = v13;
          v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
          v16 = (void *)[v14 initWithOutputDevices:v15];
          [v7 addObject:v16];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v10);
    }

    v17 = [MEMORY[0x1E4F31850] _symbolNameForRoutes:v7];
    self = -[MRUOutputDeviceAsset initWithPackageAsset:symbolName:image:type:deviceCount:](self, "initWithPackageAsset:symbolName:image:type:deviceCount:", 0, v17, 0, v20, [v7 count]);

    v18 = self;
    id v4 = v21;
  }
  else
  {
    v18 = [(id)objc_opt_class() speakerAsset];
  }

  return v18;
}

+ (MRUOutputDeviceAsset)speakerAsset
{
  v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v4 = [v3 userInterfaceLayoutDirection];

  if (+[MRUFeatureFlagProvider isNewControlsEnabled]) {
    BOOL v5 = v4 == 1;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v8 = @"VolumeSemiboldRTL";
  }
  else
  {
    BOOL v6 = +[MRUFeatureFlagProvider isNewControlsEnabled];
    v7 = @"Volume";
    if (v4 == 1) {
      v7 = @"VolumeRTL";
    }
    if (v6) {
      id v8 = @"VolumeSemibold";
    }
    else {
      id v8 = v7;
    }
  }
  uint64_t v9 = +[MRUCAPackageAsset packageNamed:v8];
  uint64_t v10 = (void *)[objc_alloc((Class)a1) initWithPackageAsset:v9 symbolName:0 image:0 type:0 deviceCount:1];

  return (MRUOutputDeviceAsset *)v10;
}

+ (MRUOutputDeviceAsset)inCallAsset
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[MRUAssetsProvider phone];
  uint64_t v4 = (void *)[v2 initWithPackageAsset:0 symbolName:0 image:v3 type:1 deviceCount:1];

  return (MRUOutputDeviceAsset *)v4;
}

+ (MRUOutputDeviceAsset)sharingAsset
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[MRUAssetsProvider sharing];
  uint64_t v4 = (void *)[v2 initWithPackageAsset:0 symbolName:0 image:v3 type:2 deviceCount:1];

  return (MRUOutputDeviceAsset *)v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MRUOutputDeviceAsset *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = v4;
      v13.receiver = self;
      v13.super_class = (Class)MRUOutputDeviceAsset;
      unsigned __int8 v6 = [(MRUAsset *)&v13 isEqual:v5];
      if ([(MRUOutputDeviceAsset *)v5 type] == self->_type) {
        unsigned __int8 v7 = v6;
      }
      else {
        unsigned __int8 v7 = 0;
      }
      id v8 = [(MRUOutputDeviceAsset *)v5 localizedDisplayTitle];
      uint64_t v9 = v8;
      if (v8 == self->_localizedDisplayTitle) {
        char v10 = 1;
      }
      else {
        char v10 = -[NSString isEqual:](v8, "isEqual:");
      }
      char v11 = v7 & v10;
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (int64_t)kind
{
  id v2 = [(MRUAsset *)self packageAsset];
  int64_t v3 = v2 == 0;

  return v3;
}

- (CCUICAPackageDescription)packageDescription
{
  id v2 = [(MRUAsset *)self packageAsset];
  int64_t v3 = [v2 packageDescription];

  return (CCUICAPackageDescription *)v3;
}

- (int64_t)outputDeviceAssetTypeForOutputDeviceRoute:(id)a3
{
  id v3 = a3;
  if ([v3 isAirpodsRoute])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isBeatsSoloRoute])
  {
    int64_t v4 = 10;
  }
  else if ([v3 isB419Route])
  {
    int64_t v4 = 11;
  }
  else if ([v3 isBeatsStudioRoute])
  {
    int64_t v4 = 12;
  }
  else if ([v3 isBeatsXRoute])
  {
    int64_t v4 = 13;
  }
  else if ([v3 isB494Route])
  {
    int64_t v4 = 17;
  }
  else
  {
    if (objc_opt_respondsToSelector() & 1) != 0 && ([v3 isB498Route]) {
      goto LABEL_23;
    }
    if ([v3 isB507Route])
    {
      int64_t v4 = 16;
      goto LABEL_24;
    }
    if (objc_opt_respondsToSelector() & 1) != 0 && ([v3 isB607Route])
    {
      int64_t v4 = 18;
      goto LABEL_24;
    }
    if (([v3 isPowerbeatsRoute] & 1) != 0
      || ([v3 isB444Route] & 1) != 0
      || ([v3 isB364Route] & 1) != 0)
    {
LABEL_23:
      int64_t v4 = 14;
      goto LABEL_24;
    }
    if ([v3 isB372Route])
    {
      int64_t v4 = 15;
    }
    else if ([v3 isBeatsLegacyRoute])
    {
      int64_t v4 = 9;
    }
    else if ([v3 isCarplayRoute])
    {
      int64_t v4 = 3;
    }
    else if ([v3 isHearingDeviceRoute])
    {
      int64_t v4 = 4;
    }
    else
    {
      if (([v3 isDeviceSpeakerRoute] & 1) == 0)
      {
        if ([v3 isJ327Route])
        {
          int64_t v4 = 7;
          goto LABEL_24;
        }
        if (([v3 isAirPlayRoute] & 1) != 0
          || ([v3 isClusterRoute] & 1) != 0
          || ([v3 isMacRoute] & 1) != 0)
        {
          int64_t v4 = 19;
          goto LABEL_24;
        }
        uint64_t v6 = [v3 routeSubtype];
        if ((unint64_t)(v6 - 2) <= 0x13)
        {
          int64_t v4 = qword_1AE963408[v6 - 2];
          goto LABEL_24;
        }
      }
      int64_t v4 = 0;
    }
  }
LABEL_24:

  return v4;
}

- (id)localizedDisplayTitleForAssetType:(int64_t)a3 deviceCount:(unint64_t)a4
{
  int64_t v4 = &stru_1F06524E0;
  switch(a3)
  {
    case 0:
      int64_t v4 = +[MRUStringsProvider volumeSpeaker];
      break;
    case 2:
      int64_t v4 = +[MRUStringsProvider volumeSharing];
      break;
    case 3:
      int64_t v4 = +[MRUStringsProvider volumeCarplay];
      break;
    case 4:
      int64_t v4 = +[MRUStringsProvider volumeHearingDevice];
      break;
    case 5:
      int64_t v4 = +[MRUStringsProvider volumeHeadphones];
      break;
    case 6:
      int64_t v4 = +[MRUStringsProvider volumeBluetooth];
      break;
    case 8:
      int64_t v4 = +[MRUStringsProvider volumeAirPods];
      break;
    case 9:
      int64_t v4 = +[MRUStringsProvider volumeBeats];
      break;
    case 10:
      int64_t v4 = +[MRUStringsProvider volumeBeatsSolo];
      break;
    case 11:
      int64_t v4 = +[MRUStringsProvider volumeBeatsSoloPro];
      break;
    case 12:
    case 16:
    case 18:
      int64_t v4 = +[MRUStringsProvider volumeBeatsStudio];
      break;
    case 13:
      int64_t v4 = +[MRUStringsProvider volumeBeatsX];
      break;
    case 14:
      int64_t v4 = +[MRUStringsProvider volumePowerbeats];
      break;
    case 15:
      int64_t v4 = +[MRUStringsProvider volumeBeatsFlex];
      break;
    case 17:
      int64_t v4 = +[MRUStringsProvider volumeB494];
      break;
    case 19:
      int64_t v4 = +[MRUStringsProvider volumeAirPlay];
      break;
    case 20:
      int64_t v4 = +[MRUStringsProvider volumeAppleTV];
      break;
    case 21:
      int64_t v4 = +[MRUStringsProvider volumeTVWithDeviceCount:a4];
      break;
    case 22:
      int64_t v4 = +[MRUStringsProvider volumeHomePod];
      break;
    default:
      break;
  }

  return v4;
}

- (NSString)localizedDisplayTitle
{
  return self->_localizedDisplayTitle;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end