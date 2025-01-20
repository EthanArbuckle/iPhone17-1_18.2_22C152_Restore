@interface DRSCloudChannelConfig
+ (id)_iOSSliceCountDict;
+ (id)_smallPopulationCountDict;
+ (id)channelIDForName:(id)a3;
+ (id)channelNameForPlatform:(unsigned __int8)a3 type:(unsigned __int8)a4 sliceNum:(id)a5;
+ (id)currentDeviceDefaultCloudChannelConfig;
+ (id)sliceCountForPlatform:(unsigned __int8)a3 channelType:(unsigned __int8)a4;
+ (id)staticSnapshotDeviceDefaultCloudChannelConfig;
+ (id)stringForChannelType:(unsigned __int8)a3;
+ (id)stringForEnvironment:(unsigned __int8)a3;
+ (unsigned)channelTypeForIsInternal:(BOOL)a3 isSeed:(BOOL)a4 isQA:(BOOL)a5 isCarrier:(BOOL)a6;
+ (unsigned)populationSliceForDevice:(unsigned __int16)a3;
- (BOOL)allowsWildcardBuild;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNoSubscriptionConfig;
- (BOOL)overridesDeviceDefault;
- (DRSCloudChannelConfig)initWithMO:(id)a3;
- (DRSCloudChannelConfig)initWithValidPlatform:(unsigned __int8)a3 channelType:(unsigned __int8)a4 environment:(unsigned __int8)a5 populationSliceNumber:(id)a6 overridesDeviceDefault:(BOOL)a7;
- (NSNumber)populationSliceNumber;
- (NSString)channelID;
- (NSString)channelName;
- (id)debugDescription;
- (id)initNoChecksWithPlatform:(unsigned __int8)a3 channelType:(unsigned __int8)a4 environment:(unsigned __int8)a5 populationSliceNumber:(id)a6 overridesDeviceDefault:(BOOL)a7;
- (id)initNoSubscriptionConfig:(BOOL)a3;
- (id)jsonDictionaryRepresentation;
- (unsigned)environment;
- (unsigned)platform;
- (unsigned)type;
@end

@implementation DRSCloudChannelConfig

+ (id)stringForChannelType:(unsigned __int8)a3
{
  if (a3 > 4u) {
    return @"Unknown";
  }
  else {
    return off_263FCA4F8[(char)a3];
  }
}

+ (id)stringForEnvironment:(unsigned __int8)a3
{
  if (a3 > 2u) {
    return @"Unknown";
  }
  else {
    return off_263FCA520[(char)a3];
  }
}

- (id)debugDescription
{
  BOOL v3 = [(DRSCloudChannelConfig *)self isNoSubscriptionConfig];
  v4 = NSString;
  if (v3)
  {
    BOOL v5 = [(DRSCloudChannelConfig *)self overridesDeviceDefault];
    v6 = @"DEFAULT";
    if (v5) {
      v6 = @"Override";
    }
    v7 = [v4 stringWithFormat:@"No Subscription (%@)", v6];
  }
  else
  {
    v8 = [(DRSCloudChannelConfig *)self channelName];
    if ([(DRSCloudChannelConfig *)self overridesDeviceDefault]) {
      v9 = @"Override";
    }
    else {
      v9 = @"DEFAULT";
    }
    v10 = [(DRSCloudChannelConfig *)self channelID];
    v7 = [v4 stringWithFormat:@"%@ (%@, %@)", v8, v9, v10];
  }

  return v7;
}

- (DRSCloudChannelConfig)initWithValidPlatform:(unsigned __int8)a3 channelType:(unsigned __int8)a4 environment:(unsigned __int8)a5 populationSliceNumber:(id)a6 overridesDeviceDefault:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = a5;
  uint64_t v9 = a4;
  uint64_t v10 = a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v12 = a6;
  v13 = v12;
  v14 = 0;
  if (v10)
  {
    if (v10 != 5)
    {
      v14 = 0;
      if ((v9 - 1) <= 3u && (v8 - 1) <= 1u)
      {
        if (!v12)
        {
LABEL_9:
          self = (DRSCloudChannelConfig *)[(DRSCloudChannelConfig *)self initNoChecksWithPlatform:v10 channelType:v9 environment:v8 populationSliceNumber:v13 overridesDeviceDefault:v7];
          v14 = self;
          goto LABEL_16;
        }
        unint64_t v15 = [v12 unsignedLongLongValue];
        v16 = [(id)objc_opt_class() sliceCountForPlatform:v10 channelType:v9];
        v17 = v16;
        if (v16)
        {
          unint64_t v18 = [v16 unsignedLongLongValue];
          if (v15 < v18)
          {

            goto LABEL_9;
          }
          unint64_t v24 = v18;
          v19 = DPLogHandle_ConfigPersistedStoreError();
          if (os_signpost_enabled(v19))
          {
            int v26 = 134218240;
            unint64_t v27 = v15;
            __int16 v28 = 2048;
            unint64_t v29 = v24;
            v20 = "InvalidSlice";
            v21 = "Slice %llu is >= %llu (the slice count for the population)";
            v22 = v19;
            uint32_t v23 = 22;
            goto LABEL_14;
          }
        }
        else
        {
          v19 = DPLogHandle_ConfigPersistedStoreError();
          if (os_signpost_enabled(v19))
          {
            LOWORD(v26) = 0;
            v20 = "UnexpectedPopulationSliceNumber";
            v21 = "Tried to specify population slice for a platform/channelType that does not support it";
            v22 = v19;
            uint32_t v23 = 2;
LABEL_14:
            _os_signpost_emit_with_name_impl(&dword_209E70000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v20, v21, (uint8_t *)&v26, v23);
          }
        }

        v14 = 0;
      }
    }
  }
LABEL_16:

  return v14;
}

- (id)initNoChecksWithPlatform:(unsigned __int8)a3 channelType:(unsigned __int8)a4 environment:(unsigned __int8)a5 populationSliceNumber:(id)a6 overridesDeviceDefault:(BOOL)a7
{
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)DRSCloudChannelConfig;
  v14 = [(DRSCloudChannelConfig *)&v17 init];
  unint64_t v15 = v14;
  if (v14)
  {
    v14->_platform = a3;
    v14->_type = a4;
    v14->_environment = a5;
    objc_storeStrong((id *)&v14->_populationSliceNumber, a6);
    v15->_overridesDeviceDefault = a7;
  }

  return v15;
}

- (id)initNoSubscriptionConfig:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DRSCloudChannelConfig;
  v4 = [(DRSCloudChannelConfig *)&v8 init];
  BOOL v5 = v4;
  if (v4)
  {
    *(_WORD *)&v4->_platform = 0;
    v4->_environment = 0;
    populationSliceNumber = v4->_populationSliceNumber;
    v4->_populationSliceNumber = 0;

    v5->_overridesDeviceDefault = a3;
  }
  return v5;
}

- (BOOL)isNoSubscriptionConfig
{
  return ![(DRSCloudChannelConfig *)self platform]
      && ![(DRSCloudChannelConfig *)self type]
      && [(DRSCloudChannelConfig *)self environment] == 0;
}

- (BOOL)allowsWildcardBuild
{
  return 1;
}

- (DRSCloudChannelConfig)initWithMO:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    unsigned __int8 v5 = [v4 platform];
    unsigned __int8 v6 = [v4 channelType];
    unsigned __int8 v7 = [v4 environment];
    objc_super v8 = [v4 populationSliceNumber];
    uint64_t v9 = [v4 overridesDeviceDefault];

    self = (DRSCloudChannelConfig *)[(DRSCloudChannelConfig *)self initNoChecksWithPlatform:v5 channelType:v6 environment:v7 populationSliceNumber:v8 overridesDeviceDefault:v9];
    uint64_t v10 = self;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 v5 = (DRSCloudChannelConfig *)a3;
  unsigned __int8 v6 = v5;
  if (v5 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned __int8 v7 = v6;
        objc_super v8 = [(DRSCloudChannelConfig *)self populationSliceNumber];
        if (!v8
          || ([(DRSCloudChannelConfig *)v7 populationSliceNumber],
              (BOOL v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v10 = [(DRSCloudChannelConfig *)v7 populationSliceNumber];
          if (v10)
          {
            v11 = [(DRSCloudChannelConfig *)self populationSliceNumber];

            if (v8)
            {

              if (!v11) {
                goto LABEL_22;
              }
            }
            else if (!v11)
            {
              goto LABEL_22;
            }
          }
          else
          {

            if (v8)
            {
            }
          }
          id v12 = [(DRSCloudChannelConfig *)self populationSliceNumber];

          if (!v12
            || ([(DRSCloudChannelConfig *)self populationSliceNumber],
                id v13 = objc_claimAutoreleasedReturnValue(),
                [(DRSCloudChannelConfig *)v7 populationSliceNumber],
                v14 = objc_claimAutoreleasedReturnValue(),
                int v15 = [v13 isEqualToNumber:v14],
                v14,
                v13,
                v15))
          {
            int v16 = [(DRSCloudChannelConfig *)self platform];
            if (v16 == [(DRSCloudChannelConfig *)v7 platform])
            {
              int v17 = [(DRSCloudChannelConfig *)self environment];
              if (v17 == [(DRSCloudChannelConfig *)v7 environment])
              {
                int v18 = [(DRSCloudChannelConfig *)self type];
                if (v18 == [(DRSCloudChannelConfig *)v7 type])
                {
                  BOOL v19 = [(DRSCloudChannelConfig *)self overridesDeviceDefault];
                  BOOL v9 = v19 ^ [(DRSCloudChannelConfig *)v7 overridesDeviceDefault] ^ 1;
LABEL_23:

                  goto LABEL_24;
                }
              }
            }
          }
        }
        else
        {
        }
LABEL_22:
        LOBYTE(v9) = 0;
        goto LABEL_23;
      }
    }
    LOBYTE(v9) = 0;
  }
LABEL_24:

  return v9;
}

- (id)jsonDictionaryRepresentation
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  BOOL v5 = [(DRSCloudChannelConfig *)self isNoSubscriptionConfig];
  BOOL v6 = v5;
  v21 = @"platform";
  if (v5)
  {
    unint64_t v29 = @"(None)";
    uint64_t v30 = @"(None)";
    v22 = @"channelType";
    uint32_t v23 = @"environment";
    uint64_t v7 = MEMORY[0x263EFFA80];
    objc_super v8 = @"(None)";
  }
  else
  {
    DRSSystemProfilePlatformStringForPlatform([(DRSCloudChannelConfig *)self platform]);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    unint64_t v29 = v2;
    v22 = @"channelType";
    objc_msgSend((id)objc_opt_class(), "stringForChannelType:", -[DRSCloudChannelConfig type](self, "type"));
    BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = v3;
    uint32_t v23 = @"environment";
    objc_msgSend((id)objc_opt_class(), "stringForEnvironment:", -[DRSCloudChannelConfig environment](self, "environment"));
    objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = MEMORY[0x263EFFA88];
  }
  v31 = v8;
  uint64_t v32 = v7;
  unint64_t v24 = @"isSubscribed";
  v25 = @"populationSliceNumber";
  uint64_t v9 = [(DRSCloudChannelConfig *)self populationSliceNumber];
  uint64_t v10 = (void *)v9;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  else {
    v11 = @"(None)";
  }
  v33 = v11;
  int v26 = @"overridesDeviceDefault";
  id v12 = objc_msgSend(NSNumber, "numberWithBool:", -[DRSCloudChannelConfig overridesDeviceDefault](self, "overridesDeviceDefault"));
  v34 = v12;
  unint64_t v27 = @"channelName";
  uint64_t v13 = [(DRSCloudChannelConfig *)self channelName];
  v14 = (void *)v13;
  if (v13) {
    int v15 = (__CFString *)v13;
  }
  else {
    int v15 = @"(None)";
  }
  v35 = v15;
  __int16 v28 = @"channelID";
  uint64_t v16 = [(DRSCloudChannelConfig *)self channelID];
  int v17 = (void *)v16;
  if (v16) {
    int v18 = (__CFString *)v16;
  }
  else {
    int v18 = @"(None)";
  }
  v36 = v18;
  BOOL v19 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v21 count:8];

  if (!v6)
  {
  }

  return v19;
}

+ (id)channelNameForPlatform:(unsigned __int8)a3 type:(unsigned __int8)a4 sliceNum:(id)a5
{
  uint64_t v5 = a4;
  unsigned int v6 = a3;
  id v7 = a5;
  if (v6 - 1 < 4 || v6 == 6)
  {
    objc_super v8 = NSString;
    uint64_t v9 = DRSSystemProfilePlatformStringForPlatform(v6);
    uint64_t v10 = +[DRSCloudChannelConfig stringForChannelType:v5];
    v11 = (void *)v10;
    if (v7) {
      [v8 stringWithFormat:@"%@_%@_%@", v9, v10, v7];
    }
    else {
    id v12 = [v8 stringWithFormat:@"%@_%@", v9, v10, v14];
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (NSString)channelName
{
  BOOL v3 = objc_opt_class();
  uint64_t v4 = [(DRSCloudChannelConfig *)self platform];
  uint64_t v5 = [(DRSCloudChannelConfig *)self type];
  unsigned int v6 = [(DRSCloudChannelConfig *)self populationSliceNumber];
  id v7 = [v3 channelNameForPlatform:v4 type:v5 sliceNum:v6];

  return (NSString *)v7;
}

+ (id)channelIDForName:(id)a3
{
  return _base64EncodedMD5Digest((uint64_t)a3);
}

- (NSString)channelID
{
  BOOL v3 = objc_opt_class();
  uint64_t v4 = [(DRSCloudChannelConfig *)self channelName];
  uint64_t v5 = [v3 channelIDForName:v4];

  return (NSString *)v5;
}

+ (unsigned)channelTypeForIsInternal:(BOOL)a3 isSeed:(BOOL)a4 isQA:(BOOL)a5 isCarrier:(BOOL)a6
{
  if (a4) {
    unsigned __int8 v6 = 3;
  }
  else {
    unsigned __int8 v6 = 4;
  }
  if (a3) {
    unsigned __int8 v6 = 2;
  }
  if (a5 || a6) {
    return !a6;
  }
  else {
    return v6;
  }
}

+ (id)staticSnapshotDeviceDefaultCloudChannelConfig
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__DRSCloudChannelConfig_staticSnapshotDeviceDefaultCloudChannelConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (staticSnapshotDeviceDefaultCloudChannelConfig_onceToken != -1) {
    dispatch_once(&staticSnapshotDeviceDefaultCloudChannelConfig_onceToken, block);
  }
  v2 = (void *)staticSnapshotDeviceDefaultCloudChannelConfig_defaultConfig;

  return v2;
}

void __70__DRSCloudChannelConfig_staticSnapshotDeviceDefaultCloudChannelConfig__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) currentDeviceDefaultCloudChannelConfig];
  v2 = (void *)staticSnapshotDeviceDefaultCloudChannelConfig_defaultConfig;
  staticSnapshotDeviceDefaultCloudChannelConfig_defaultConfig = v1;
}

+ (id)currentDeviceDefaultCloudChannelConfig
{
  BOOL v3 = +[DRSSystemProfile sharedInstance];
  uint64_t v4 = objc_msgSend(a1, "channelTypeForIsInternal:isSeed:isQA:isCarrier:", objc_msgSend(v3, "isInternal"), objc_msgSend(v3, "isSeed"), 0, objc_msgSend(v3, "isCarrier"));
  if (v4)
  {
    uint64_t v5 = v4;
    unsigned __int8 v6 = objc_msgSend(a1, "sliceCountForPlatform:channelType:", objc_msgSend(v3, "platform"), v4);
    id v7 = v6;
    if (v6)
    {
      objc_super v8 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", +[DRSCloudChannelConfig populationSliceForDevice:](DRSCloudChannelConfig, "populationSliceForDevice:", objc_msgSend(v6, "unsignedShortValue")));
    }
    else
    {
      objc_super v8 = 0;
    }
    uint64_t v9 = -[DRSCloudChannelConfig initWithValidPlatform:channelType:environment:populationSliceNumber:overridesDeviceDefault:]([DRSCloudChannelConfig alloc], "initWithValidPlatform:channelType:environment:populationSliceNumber:overridesDeviceDefault:", [v3 platform], v5, 2, v8, 0);
  }
  else
  {
    uint64_t v9 = [[DRSCloudChannelConfig alloc] initNoSubscriptionConfig:0];
  }

  return v9;
}

+ (unsigned)populationSliceForDevice:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  uint64_t v4 = +[DRSSystemProfile sharedInstance];
  LOWORD(v3) = [v4 deviceHash] % (unint64_t)v3;

  return v3;
}

+ (id)_smallPopulationCountDict
{
  if (_smallPopulationCountDict_onceToken != -1) {
    dispatch_once(&_smallPopulationCountDict_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)_smallPopulationCountDict_kCountDict;

  return v2;
}

void __50__DRSCloudChannelConfig__smallPopulationCountDict__block_invoke()
{
  v3[4] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26BE05790;
  v2[1] = &unk_26BE057C0;
  v3[0] = &unk_26BE057A8;
  v3[1] = &unk_26BE057A8;
  v2[2] = &unk_26BE057D8;
  v2[3] = &unk_26BE05808;
  v3[2] = &unk_26BE057F0;
  v3[3] = &unk_26BE057F0;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:4];
  uint64_t v1 = (void *)_smallPopulationCountDict_kCountDict;
  _smallPopulationCountDict_kCountDict = v0;
}

+ (id)_iOSSliceCountDict
{
  if (_iOSSliceCountDict_onceToken != -1) {
    dispatch_once(&_iOSSliceCountDict_onceToken, &__block_literal_global_242);
  }
  v2 = (void *)_iOSSliceCountDict_kCountDict;

  return v2;
}

void __43__DRSCloudChannelConfig__iOSSliceCountDict__block_invoke()
{
  v3[4] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26BE05790;
  v2[1] = &unk_26BE057C0;
  v3[0] = &unk_26BE057A8;
  v3[1] = &unk_26BE057A8;
  v2[2] = &unk_26BE057D8;
  v2[3] = &unk_26BE05808;
  v3[2] = &unk_26BE057F0;
  v3[3] = &unk_26BE05820;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:4];
  uint64_t v1 = (void *)_iOSSliceCountDict_kCountDict;
  _iOSSliceCountDict_kCountDict = v0;
}

+ (id)sliceCountForPlatform:(unsigned __int8)a3 channelType:(unsigned __int8)a4
{
  if (a4)
  {
    int v4 = a3;
    unsigned __int8 v6 = [NSNumber numberWithUnsignedChar:a4];
    id v7 = 0;
    switch(v4)
    {
      case 1:
        objc_super v8 = [a1 _macOSSliceCountDict];
        goto LABEL_9;
      case 2:
        objc_super v8 = [a1 _iOSSliceCountDict];
        goto LABEL_9;
      case 3:
        objc_super v8 = [a1 _watchOSSliceCountDict];
        goto LABEL_9;
      case 4:
        objc_super v8 = [a1 _tvOSSliceCountDict];
        goto LABEL_9;
      case 6:
        objc_super v8 = [a1 _smallPopulationCountDict];
LABEL_9:
        uint64_t v9 = v8;
        id v7 = [v8 objectForKeyedSubscript:v6];

        break;
      default:
        break;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (unsigned)platform
{
  return self->_platform;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)environment
{
  return self->_environment;
}

- (BOOL)overridesDeviceDefault
{
  return self->_overridesDeviceDefault;
}

- (NSNumber)populationSliceNumber
{
  return self->_populationSliceNumber;
}

- (void).cxx_destruct
{
}

@end