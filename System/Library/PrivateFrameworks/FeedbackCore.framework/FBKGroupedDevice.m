@interface FBKGroupedDevice
+ (id)FBKKnownDevices;
+ (id)currentDevicePlatform;
+ (id)currentGroupedDevice;
+ (id)deviceDefaults;
+ (id)inspectFBKPairing;
+ (id)sortedDevices:(id)a3;
- (BOOL)hasCapabilities:(id)a3;
- (BOOL)isCurrentDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDevice:(id)a3;
- (BOOL)isFBKPaired;
- (BOOL)isLikeDEDDevice:(id)a3;
- (BOOL)isReady;
- (BOOL)isVisibleToDED;
- (BOOL)needsPairing;
- (FBKGroupedDevice)initWithDevices:(id)a3;
- (NSMutableDictionary)devices;
- (NSString)description;
- (id)anyDEDDevice;
- (id)bestStringForKey:(id)a3;
- (id)build;
- (id)color;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDetails;
- (id)dedIDSDevice;
- (id)dedSharingDevice;
- (id)deviceClass;
- (id)deviceDataForSubmissionWithSession:(id)a3;
- (id)deviceDefaults;
- (id)diffableHashWithContext:(id)a3;
- (id)displayName;
- (id)displayType;
- (id)identifier;
- (id)imageData;
- (id)inferredPlatform;
- (id)mostReliableDevice;
- (id)name;
- (id)platform;
- (id)productType;
- (id)publicLogDescription;
- (id)readyDevice;
- (id)serialize;
- (id)transportsForDisplay;
- (int64_t)hash;
- (void)_postDeviceChangeNotification;
- (void)_updateWithDevices:(id)a3;
- (void)addDevice:(id)a3;
- (void)dealloc;
- (void)deviceListChanged:(id)a3;
- (void)fetchIconImageDataForScale:(float)a3 completionCompletion:(id)a4;
- (void)imageData;
- (void)pairToFBK;
- (void)removeFBKPairing;
- (void)setDevices:(id)a3;
- (void)updateStoredCopyIfNeeded;
@end

@implementation FBKGroupedDevice

- (FBKGroupedDevice)initWithDevices:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBKGroupedDevice;
  v5 = [(FBKGroupedDevice *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(FBKGroupedDevice *)v5 _updateWithDevices:v4];
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v6 selector:sel_deviceListChanged_ name:@"FBKDeviceListDidChange" object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FBKGroupedDevice;
  [(FBKGroupedDevice *)&v4 dealloc];
}

+ (id)FBKKnownDevices
{
  return (id)[MEMORY[0x263F3A140] FBKKnownDevices];
}

+ (id)currentGroupedDevice
{
  v2 = +[FBKDeviceManager sharedInstance];
  v3 = [v2 thisDevice];

  return v3;
}

+ (id)currentDevicePlatform
{
  return (id)*MEMORY[0x263F3A118];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(FBKGroupedDevice *)self isEqualToDevice:v4];

  return v5;
}

- (BOOL)isEqualToDevice:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = [a3 identifier];
  BOOL v5 = [(FBKGroupedDevice *)self identifier];
  char v6 = [v4 isEqualToString:v5];

  return v6;
}

- (NSString)description
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"%@\n", v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v6 = [(FBKGroupedDevice *)self devices];
  v7 = [v6 allValues];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        [v3 appendFormat:@"%@\n", *(void *)(*((void *)&v14 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  v12 = [NSString stringWithString:v3];

  return (NSString *)v12;
}

- (id)transportsForDisplay
{
  v3 = [(FBKGroupedDevice *)self devices];
  id v4 = [v3 allKeys];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    char v6 = [(FBKGroupedDevice *)self devices];
    v7 = [v6 allKeys];
    uint64_t v8 = objc_msgSend(v7, "ded_mapWithBlock:", &__block_literal_global_4);
    uint64_t v9 = [v8 componentsJoinedByString:@", "];
  }
  else
  {
    uint64_t v9 = &stru_26DDF6A30;
  }

  return v9;
}

uint64_t __40__FBKGroupedDevice_transportsForDisplay__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSString;
  unint64_t v3 = [a2 integerValue];
  if (v3 > 4) {
    id v4 = "Unknown";
  }
  else {
    id v4 = off_264873F60[v3];
  }

  return [v2 stringWithUTF8String:v4];
}

- (BOOL)isReady
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(FBKGroupedDevice *)self devices];
  unint64_t v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) status] == 1)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)needsPairing
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(FBKGroupedDevice *)self devices];
  unint64_t v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) status] == 2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)dedIDSDevice
{
  v2 = [(FBKGroupedDevice *)self devices];
  unint64_t v3 = [v2 objectForKeyedSubscript:&unk_26DE1E750];

  return v3;
}

- (id)dedSharingDevice
{
  v2 = [(FBKGroupedDevice *)self devices];
  unint64_t v3 = [v2 objectForKeyedSubscript:&unk_26DE1E768];

  return v3;
}

- (id)anyDEDDevice
{
  v2 = [(FBKGroupedDevice *)self devices];
  unint64_t v3 = [v2 allValues];
  uint64_t v4 = [v3 firstObject];

  return v4;
}

- (id)mostReliableDevice
{
  if ([(FBKGroupedDevice *)self isCurrentDevice])
  {
    id v3 = [(FBKGroupedDevice *)self anyDEDDevice];
  }
  else
  {
    uint64_t v4 = [(FBKGroupedDevice *)self dedIDSDevice];
    uint64_t v5 = [(FBKGroupedDevice *)self dedSharingDevice];
    char v6 = [(FBKGroupedDevice *)self anyDEDDevice];
    uint64_t v7 = [v4 status];
    long long v8 = v4;
    if (v7 == 1 || (uint64_t v9 = [v5 status], v8 = v5, v9 == 1)) {
      id v10 = v8;
    }
    else {
      id v10 = 0;
    }
    if (v10) {
      long long v11 = v10;
    }
    else {
      long long v11 = v6;
    }
    id v3 = v11;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(FBKGroupedDevice *)self devices];
  uint64_t v4 = [v3 allValues];
  uint64_t v5 = objc_msgSend(v4, "ded_mapWithBlock:", &__block_literal_global_28);

  char v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDevices:v5];
  return v6;
}

id __33__FBKGroupedDevice_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 copy];

  return v2;
}

- (id)inferredPlatform
{
  v2 = [(FBKGroupedDevice *)self productType];
  uint64_t v3 = [v2 length];
  uint64_t v4 = (id *)MEMORY[0x263F3A100];
  if (v3 && [v2 containsString:@"AppleTV"]) {
    uint64_t v4 = (id *)MEMORY[0x263F3A0F8];
  }
  id v5 = *v4;

  return v5;
}

- (void)addDevice:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(FBKGroupedDevice *)self devices];
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "remoteTransport"));
  char v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6 || ([v6 isMoreCompleteThan:v9] & 1) == 0)
  {
    uint64_t v7 = [(FBKGroupedDevice *)self devices];
    long long v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "remoteTransport"));
    [v7 setObject:v9 forKeyedSubscript:v8];
  }
}

- (BOOL)isLikeDEDDevice:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(FBKGroupedDevice *)self devices];
  char v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        if (![*(id *)(*((void *)&v17 + 1) + 8 * i) isLikeDevice:v4])
        {
          char v15 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  long long v11 = [(FBKGroupedDevice *)self devices];
  v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "remoteTransport"));
  char v6 = [v11 objectForKeyedSubscript:v12];

  if (v6)
  {
    uint64_t v13 = [v6 address];
    long long v14 = [v4 address];
    char v15 = [v13 isEqualToString:v14];
  }
  else
  {
    char v15 = 1;
  }
LABEL_12:

  return v15;
}

- (id)deviceDataForSubmissionWithSession:(id)a3
{
  v15[3] = *MEMORY[0x263EF8340];
  id v4 = [(FBKGroupedDevice *)self mostReliableDevice];
  id v5 = objc_alloc(MEMORY[0x263EFF9A0]);
  char v6 = [v4 serialize];
  uint64_t v7 = (void *)[v5 initWithDictionary:v6];

  uint64_t v8 = *MEMORY[0x263F3A0D8];
  v15[0] = *MEMORY[0x263F3A0E0];
  v15[1] = v8;
  v15[2] = *MEMORY[0x263F3A0C0];
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];
  [v7 removeObjectsForKeys:v9];

  int v10 = [v4 isVisibleToDED];
  uint64_t v11 = 1;
  if (!a3) {
    uint64_t v11 = 2;
  }
  if (v10) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 3;
  }
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:v12];
  [v7 setObject:v13 forKeyedSubscript:@"connectivity"];

  [v7 replaceCamelCaseKeysWithSnakeCaseKeys];

  return v7;
}

- (id)identifier
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v2 = [(FBKGroupedDevice *)self devices];
  uint64_t v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v3);
        }
        int v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = [v10 identifier];
        uint64_t v12 = [v11 length];

        if (v12)
        {
          int v13 = [v10 isTemporaryDevice];
          id v14 = v10;
          if (v13) {
            char v15 = v6;
          }
          else {
            char v15 = v7;
          }
          if (v13) {
            char v6 = v14;
          }
          else {
            uint64_t v7 = v14;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);

    if (v7)
    {
      long long v16 = [v7 identifier];
      goto LABEL_20;
    }
  }
  else
  {

    char v6 = 0;
  }
  long long v16 = [v6 identifier];
  uint64_t v7 = 0;
LABEL_20:
  if (v16) {
    long long v17 = v16;
  }
  else {
    long long v17 = &stru_26DDF6A30;
  }
  long long v18 = v17;

  return v18;
}

- (id)platform
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v2 = [(FBKGroupedDevice *)self devices];
  uint64_t v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  uint64_t v5 = (void *)*MEMORY[0x263F3A100];
  if (!v4)
  {
LABEL_12:

    goto LABEL_15;
  }
  uint64_t v6 = v4;
  uint64_t v7 = *(void *)v17;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v17 != v7) {
      objc_enumerationMutation(v3);
    }
    uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
    int v10 = [v9 platform];
    if (![v10 length])
    {

      goto LABEL_10;
    }
    uint64_t v11 = [v9 platform];
    int v12 = [v11 isEqualToString:v5];

    if (!v12) {
      break;
    }
LABEL_10:
    if (v6 == ++v8)
    {
      uint64_t v6 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        goto LABEL_3;
      }
      goto LABEL_12;
    }
  }
  id v13 = v9;

  if (v13)
  {
    id v14 = [v13 platform];

    goto LABEL_16;
  }
LABEL_15:
  id v14 = v5;
LABEL_16:

  return v14;
}

- (BOOL)isCurrentDevice
{
  v2 = [(FBKGroupedDevice *)self anyDEDDevice];
  char v3 = [v2 isCurrentDevice];

  return v3;
}

- (id)publicLogDescription
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v3 = [(FBKGroupedDevice *)self devices];
  uint64_t v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v5)
  {
LABEL_12:

    goto LABEL_15;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v18;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v18 != v7) {
      objc_enumerationMutation(v4);
    }
    uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
    int v10 = [v9 productType];
    if (![v10 length])
    {

      goto LABEL_10;
    }
    uint64_t v11 = [v9 name];
    uint64_t v12 = [v11 length];

    if (v12) {
      break;
    }
LABEL_10:
    if (v6 == ++v8)
    {
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        goto LABEL_3;
      }
      goto LABEL_12;
    }
  }
  id v13 = v9;

  if (v13)
  {
    id v14 = v13;
    goto LABEL_16;
  }
LABEL_15:
  id v14 = [(FBKGroupedDevice *)self anyDEDDevice];
  id v13 = v14;
LABEL_16:
  char v15 = [v14 publicLogDescription];

  return v15;
}

- (id)build
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v4 = *MEMORY[0x263F3C610];
  uint64_t v5 = [v3 objectForKey:*MEMORY[0x263F3C610]];

  if (FBKIsEmptyString(v5))
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v6 = [(FBKGroupedDevice *)self devices];
    uint64_t v7 = [v6 allValues];

    id v8 = (id)[v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v20;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
        uint64_t v12 = [v11 build];
        uint64_t v13 = [v12 length];

        if (v13) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = (id)[v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_15;
        }
      }
      char v16 = [v11 isVisibleToDED];
      id v8 = v11;
      if ((v16 & 1) == 0) {
        goto LABEL_15;
      }

      if (v8)
      {
        char v15 = [v8 build];
        goto LABEL_20;
      }
    }
    else
    {
LABEL_15:
    }
    long long v17 = [v8 build];
    if (v17)
    {
      char v15 = [v8 build];
    }
    else
    {
      char v15 = &stru_26DDF6A30;
    }

LABEL_20:
  }
  else
  {
    id v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
    char v15 = [v14 objectForKey:v4];
  }

  return v15;
}

- (id)color
{
  return [(FBKGroupedDevice *)self bestStringForKey:@"color"];
}

- (id)deviceClass
{
  return [(FBKGroupedDevice *)self bestStringForKey:@"deviceClass"];
}

- (id)name
{
  return [(FBKGroupedDevice *)self bestStringForKey:@"name"];
}

- (id)productType
{
  return [(FBKGroupedDevice *)self bestStringForKey:@"productType"];
}

- (id)serialize
{
  v2 = NSDictionary;
  char v3 = [(FBKGroupedDevice *)self devices];
  uint64_t v4 = [v2 dictionaryWithDictionary:v3];

  return v4;
}

- (BOOL)hasCapabilities:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKGroupedDevice *)self readyDevice];
  char v6 = [v5 hasCapabilities:v4];

  return v6;
}

- (id)debugDetails
{
  v2 = [(FBKGroupedDevice *)self devices];
  char v3 = [v2 allValues];
  id v4 = [v3 valueForKeyPath:@"debugDetails"];
  uint64_t v5 = [v4 componentsJoinedByString:@"\n"];

  return v5;
}

- (id)deviceDefaults
{
  return (id)[MEMORY[0x263F3A140] deviceDefaults];
}

+ (id)deviceDefaults
{
  return (id)[MEMORY[0x263F3A140] deviceDefaults];
}

+ (id)inspectFBKPairing
{
  return (id)[MEMORY[0x263F3A140] inspectFBKPairing];
}

- (void)fetchIconImageDataForScale:(float)a3 completionCompletion:(id)a4
{
  id v10 = a4;
  char v6 = [(FBKGroupedDevice *)self devices];
  uint64_t v7 = [v6 objectForKeyedSubscript:&unk_26DE1E780];

  if (!v7)
  {
    uint64_t v9 = [(FBKGroupedDevice *)self devices];
    uint64_t v7 = [v9 objectForKeyedSubscript:&unk_26DE1E750];

    if (!v7)
    {
      uint64_t v7 = [(FBKGroupedDevice *)self anyDEDDevice];
    }
  }
  *(float *)&double v8 = a3;
  [v7 fetchIconImageDataForScale:v10 completionCompletion:v8];
}

- (id)imageData
{
  v2 = +[FBKLog ded];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[FBKGroupedDevice imageData](v2);
  }

  return 0;
}

- (BOOL)isFBKPaired
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(FBKGroupedDevice *)self devices];
  char v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) isFBKPaired])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)displayName
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = [(FBKGroupedDevice *)self devices];
  char v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    uint64_t v7 = &stru_26DDF6A30;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = [v9 displayName];
        uint64_t v11 = [v10 length];

        if (v11)
        {
          uint64_t v7 = [v9 displayName];
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v7 = &stru_26DDF6A30;
  }
LABEL_12:

  return v7;
}

- (id)displayType
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = [(FBKGroupedDevice *)self devices];
  char v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    uint64_t v7 = &stru_26DDF6A30;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = [v9 displayType];
        uint64_t v11 = [v10 length];

        if (v11)
        {
          uint64_t v7 = [v9 displayType];
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v7 = &stru_26DDF6A30;
  }
LABEL_12:

  return v7;
}

- (void)pairToFBK
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  char v3 = [(FBKGroupedDevice *)self devices];
  uint64_t v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) pairToFBK];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(FBKGroupedDevice *)self _postDeviceChangeNotification];
}

- (void)updateStoredCopyIfNeeded
{
  uint64_t v7 = [a2 identifier];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_22A36D000, a4, OS_LOG_TYPE_DEBUG, "updating stored copy of device [%@]", a1, 0xCu);
}

- (void)removeFBKPairing
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  char v3 = [(FBKGroupedDevice *)self devices];
  uint64_t v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) removeFBKPairing];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(FBKGroupedDevice *)self _postDeviceChangeNotification];
}

- (BOOL)isVisibleToDED
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(FBKGroupedDevice *)self devices];
  char v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) isVisibleToDED])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)diffableHashWithContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = NSString;
    uint64_t v6 = [(FBKGroupedDevice *)self identifier];
    uint64_t v7 = [v5 stringWithFormat:@"%@-%@", v6, v4];
  }
  else
  {
    uint64_t v7 = [(FBKGroupedDevice *)self identifier];
  }

  return v7;
}

- (void)_updateWithDevices:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
  [(FBKGroupedDevice *)self setDevices:v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
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
        long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        long long v12 = [(FBKGroupedDevice *)self devices];
        uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "remoteTransport"));
        [v12 setObject:v11 forKeyedSubscript:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)deviceListChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKGroupedDevice *)self identifier];
  id v6 = [v4 userInfo];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"configured"];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __38__FBKGroupedDevice_deviceListChanged___block_invoke;
  v12[3] = &unk_264873F20;
  id v13 = v5;
  id v8 = v5;
  uint64_t v9 = objc_msgSend(v7, "ded_findWithBlock:", v12);
  uint64_t v10 = v9;
  if (v9)
  {
    long long v11 = [v9 devices];
    [(FBKGroupedDevice *)self setDevices:v11];
  }
}

uint64_t __38__FBKGroupedDevice_deviceListChanged___block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)bestStringForKey:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(FBKGroupedDevice *)self devices];
  id v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      long long v11 = [*(id *)(*((void *)&v15 + 1) + 8 * v10) valueForKey:v4];
      if ([(__CFString *)v11 length]) {
        break;
      }

      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    long long v11 = 0;
  }

  if (v11) {
    long long v12 = v11;
  }
  else {
    long long v12 = &stru_26DDF6A30;
  }
  id v13 = v12;

  return v13;
}

- (id)readyDevice
{
  v2 = [(FBKGroupedDevice *)self devices];
  char v3 = [v2 allValues];
  id v4 = objc_msgSend(v3, "ded_findWithBlock:", &__block_literal_global_67);

  return v4;
}

BOOL __31__FBKGroupedDevice_readyDevice__block_invoke(uint64_t a1, void *a2)
{
  return [a2 status] == 1;
}

- (void)_postDeviceChangeNotification
{
  v6[1] = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v5 = @"device";
  v6[0] = self;
  id v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v3 postNotificationName:@"FBKDeviceStateDidChange" object:0 userInfo:v4];
}

- (NSMutableDictionary)devices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDevices:(id)a3
{
}

- (void).cxx_destruct
{
}

- (int64_t)hash
{
  v2 = self;
  id v3 = [(FBKGroupedDevice *)v2 identifier];
  sub_22A4B3458();

  int64_t v4 = sub_22A4B35A8();
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)sortedDevices:(id)a3
{
  sub_22A40F5A0(0, &qword_268376840);
  uint64_t v3 = sub_22A4B3628();
  swift_getObjCClassMetadata();
  if (v3 < 0 || (v3 & 0x4000000000000000) != 0)
  {
    unint64_t v7 = swift_bridgeObjectRetain();
    uint64_t v4 = (uint64_t)sub_22A4A4884(v7, (void (*)(void *, uint64_t, unint64_t))sub_22A4A20F0);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  uint64_t v8 = v4;
  sub_22A4A3030(&v8);
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)sub_22A4B3618();
  swift_release();

  return v5;
}

- (void)imageData
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "imageData is not used in FBK", v1, 2u);
}

@end