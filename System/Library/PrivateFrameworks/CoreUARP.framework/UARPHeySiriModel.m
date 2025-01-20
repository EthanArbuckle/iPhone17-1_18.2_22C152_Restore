@interface UARPHeySiriModel
+ (id)hsModelWithUarpPayload:(id)a3;
+ (id)uarpPayloadWithHSModel:(id)a3;
- (BOOL)expandURL:(id *)a3;
- (NSArray)downloadedModels;
- (NSArray)fallbackModels;
- (NSArray)newModels;
- (NSArray)preInstalledModels;
- (UARPHeySiriModel)initWithURL:(id)a3;
- (id)exportAsSuperBinary:(id *)a3;
- (unint64_t)engineType;
- (unint64_t)majorVersion;
- (unint64_t)minorVersion;
- (void)addHeySiriDownloadedModel:(id)a3;
- (void)addHeySiriFallbackModel:(id)a3;
- (void)addHeySiriPreinstalledModel:(id)a3;
- (void)addHeySiriPrimaryModel:(id)a3;
- (void)expandSuperBinaryMetaData:(id)a3;
- (void)expandSuperBinaryPayloads:(id)a3;
@end

@implementation UARPHeySiriModel

- (UARPHeySiriModel)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UARPHeySiriModel;
  v5 = [(UARPHeySiriModel *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    url = v5->_url;
    v5->_url = (NSURL *)v6;
  }
  return v5;
}

- (NSArray)newModels
{
  return (NSArray *)objc_claimAutoreleasedReturnValue();
}

- (NSArray)fallbackModels
{
  return (NSArray *)[MEMORY[0x263EFF8C0] arrayWithArray:self->_fallbackModels];
}

- (NSArray)downloadedModels
{
  return (NSArray *)[MEMORY[0x263EFF8C0] arrayWithArray:self->_downloadedModels];
}

- (NSArray)preInstalledModels
{
  return (NSArray *)[MEMORY[0x263EFF8C0] arrayWithArray:self->_preInstalledModels];
}

- (void)addHeySiriPrimaryModel:(id)a3
{
  id v4 = a3;
  newModels = self->_newModels;
  id v8 = v4;
  if (!newModels)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_newModels;
    self->_newModels = v6;

    id v4 = v8;
    newModels = self->_newModels;
  }
  [(NSMutableArray *)newModels addObject:v4];
}

- (void)addHeySiriFallbackModel:(id)a3
{
  id v4 = a3;
  fallbackModels = self->_fallbackModels;
  id v8 = v4;
  if (!fallbackModels)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_fallbackModels;
    self->_fallbackModels = v6;

    id v4 = v8;
    fallbackModels = self->_fallbackModels;
  }
  [(NSMutableArray *)fallbackModels addObject:v4];
}

- (void)addHeySiriDownloadedModel:(id)a3
{
  id v4 = a3;
  downloadedModels = self->_downloadedModels;
  id v8 = v4;
  if (!downloadedModels)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_downloadedModels;
    self->_downloadedModels = v6;

    id v4 = v8;
    downloadedModels = self->_downloadedModels;
  }
  [(NSMutableArray *)downloadedModels addObject:v4];
}

- (void)addHeySiriPreinstalledModel:(id)a3
{
  id v4 = a3;
  preInstalledModels = self->_preInstalledModels;
  id v8 = v4;
  if (!preInstalledModels)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_preInstalledModels;
    self->_preInstalledModels = v6;

    id v4 = v8;
    preInstalledModels = self->_preInstalledModels;
  }
  [(NSMutableArray *)preInstalledModels addObject:v4];
}

- (void)expandSuperBinaryMetaData:(id)a3
{
  id v4 = a3;
  id v8 = +[UARPSuperBinaryAssetTLV findTLVWithType:1619725832 tlvs:v4];
  v5 = [v8 valueAsNumber];
  self->_engineType = [v5 unsignedShortValue];
  uint64_t v6 = +[UARPSuperBinaryAssetTLV findTLVWithType:1619725831 tlvs:v4];

  v7 = [v6 valueAsVersion];
  self->_majorVersion = [v7 majorVersion];
  self->_minorVersion = [v7 minorVersion];
}

- (void)expandSuperBinaryPayloads:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_super v9 = +[UARPHeySiriModel hsModelWithUarpPayload:v8];
        v10 = [v8 tlvs];
        v11 = +[UARPSuperBinaryAssetTLV findTLVWithType:1619725824 tlvs:v10];

        v12 = [v11 valueAsNumber];
        if ([v12 unsignedShortValue] == 1) {
          [(UARPHeySiriModel *)self addHeySiriPreinstalledModel:v9];
        }
        else {
          [(UARPHeySiriModel *)self addHeySiriDownloadedModel:v9];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (BOOL)expandURL:(id *)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[UARPSuperBinaryAsset alloc] initWithURL:self->_url];
  uint64_t v6 = v5;
  if (v5 && [(UARPSuperBinaryAsset *)v5 expandHeadersAndTLVs:a3])
  {
    v7 = [(UARPSuperBinaryAsset *)v6 tlvs];
    id v8 = +[UARPSuperBinaryAssetTLV findTLVWithType:1619725831 tlvs:v7];

    if (v8)
    {
      objc_super v9 = [v8 valueAsVersion];
      self->_majorVersion = [v9 majorVersion];
      self->_minorVersion = [v9 minorVersion];
    }
    v27 = v8;
    v10 = [(UARPSuperBinaryAsset *)v6 tlvs];
    v11 = +[UARPSuperBinaryAssetTLV findTLVWithType:1619725832 tlvs:v10];

    if (v11)
    {
      v12 = [v11 valueAsNumber];
      self->_engineType = [v12 unsignedShortValue];
    }
    v26 = v11;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v28 = v6;
    v13 = [(UARPSuperBinaryAsset *)v6 payloads];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v19 = +[UARPHeySiriModel hsModelWithUarpPayload:v18];
          v20 = [v18 tlvs];
          v21 = +[UARPSuperBinaryAssetTLV findTLVWithType:1619725824 tlvs:v20];

          if (v21
            && ([v21 valueAsNumber],
                v22 = objc_claimAutoreleasedReturnValue(),
                int v23 = [v22 unsignedShortValue],
                v22,
                v23 == 1))
          {
            [(UARPHeySiriModel *)self addHeySiriPreinstalledModel:v19];
          }
          else
          {
            [(UARPHeySiriModel *)self addHeySiriDownloadedModel:v19];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v15);
    }

    BOOL v24 = 1;
    uint64_t v6 = v28;
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

+ (id)uarpPayloadWithHSModel:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (unsigned __int8 *)uarpAssetTagHeySiriModel4cc();
  uint64_t v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"%c%c%c%c", *v4, v4[1], v4[2], v4[3]);
  uint64_t v6 = [[UARPSuperBinaryAssetPayload alloc] initWithTag:v5 majorVersion:&unk_26CEFE548 minorVersion:&unk_26CEFE548 releaseVersion:&unk_26CEFE548 buildVersion:&unk_26CEFE548];
  v7 = [v3 modelLocale];

  if (v7)
  {
    id v8 = [UARPSuperBinaryAssetTLV alloc];
    objc_super v9 = [v3 modelLocale];
    v10 = [(UARPSuperBinaryAssetTLV *)v8 initWithType:1619725825 stringValue:v9];

    [(UARPSuperBinaryAssetPayload *)v6 addMetaDataTLV:v10];
  }
  v11 = [v3 modelHash];

  if (v11)
  {
    v12 = [UARPSuperBinaryAssetTLV alloc];
    v13 = [v3 modelHash];
    uint64_t v14 = [(UARPSuperBinaryAssetTLV *)v12 initWithType:1619725826 stringValue:v13];

    [(UARPSuperBinaryAssetPayload *)v6 addMetaDataTLV:v14];
  }
  uint64_t v15 = [v3 digest];

  if (v15)
  {
    uint64_t v16 = [UARPSuperBinaryAssetTLV alloc];
    long long v17 = [v3 digest];
    v18 = [(UARPSuperBinaryAssetTLV *)v16 initWithType:1619725828 dataValue:v17];

    [(UARPSuperBinaryAssetPayload *)v6 addMetaDataTLV:v18];
  }
  uint64_t v19 = [v3 signature];

  if (v19)
  {
    v20 = [UARPSuperBinaryAssetTLV alloc];
    v21 = [v3 signature];
    v22 = [(UARPSuperBinaryAssetTLV *)v20 initWithType:1619725829 dataValue:v21];

    [(UARPSuperBinaryAssetPayload *)v6 addMetaDataTLV:v22];
  }
  int v23 = [v3 certificate];

  if (v23)
  {
    BOOL v24 = [UARPSuperBinaryAssetTLV alloc];
    v25 = [v3 certificate];
    v26 = [(UARPSuperBinaryAssetTLV *)v24 initWithType:1619725830 dataValue:v25];

    [(UARPSuperBinaryAssetPayload *)v6 addMetaDataTLV:v26];
  }
  v27 = [v3 modelData];

  if (v27)
  {
    v28 = [v3 modelData];
    [(UARPSuperBinaryAssetPayload *)v6 setPayloadToData:v28];
  }
  return v6;
}

+ (id)hsModelWithUarpPayload:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v24 = a3;
  id v3 = [v24 tlvs];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v25 = 0;
    uint64_t v6 = 0;
    v7 = 0;
    id v8 = 0;
    objc_super v9 = 0;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v3);
        }
        v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        switch([v12 type])
        {
          case 0x608B0E01u:
            uint64_t v13 = [v12 valueAsString];
            uint64_t v14 = v9;
            objc_super v9 = (void *)v13;
            goto LABEL_12;
          case 0x608B0E02u:
            uint64_t v16 = [v12 valueAsString];
            uint64_t v14 = v8;
            id v8 = (void *)v16;
            goto LABEL_12;
          case 0x608B0E04u:
            uint64_t v15 = [v12 valueAsData];
            uint64_t v14 = v7;
            v7 = (void *)v15;
            goto LABEL_12;
          case 0x608B0E05u:
            uint64_t v17 = [v12 valueAsData];
            uint64_t v14 = v25;
            v25 = (void *)v17;
            goto LABEL_12;
          case 0x608B0E06u:
            uint64_t v18 = [v12 valueAsData];
            uint64_t v14 = v6;
            uint64_t v6 = (void *)v18;
LABEL_12:

            break;
          default:
            continue;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v5);
  }
  else
  {
    v25 = 0;
    uint64_t v6 = 0;
    v7 = 0;
    id v8 = 0;
    objc_super v9 = 0;
  }
  uint64_t v19 = [v24 payload];
  id v20 = objc_alloc((Class)getCSVoiceTriggerRTModelClass());
  if (v19)
  {
    v21 = v25;
    v22 = (void *)[v20 initWithData:v19 hash:v8 locale:v9 digest:v7 signature:v25 certificate:v6];
  }
  else
  {
    v22 = (void *)[v20 initWithHash:v8 locale:v9];
    v21 = v25;
  }

  return v22;
}

- (id)exportAsSuperBinary:(id *)a3
{
  uint64_t v4 = [[UARPAssetVersion alloc] initWithMajorVersion:0 minorVersion:0 releaseVersion:0 buildVersion:0];
  uint64_t v5 = [[UARPSuperBinaryAsset alloc] initWithFormatVersion:3 assetVersion:v4];
  if ([(NSMutableArray *)self->_newModels count])
  {
    uint64_t v6 = [(NSMutableArray *)self->_newModels firstObject];
    v7 = +[UARPHeySiriModel uarpPayloadWithHSModel:v6];

    id v8 = [[UARPSuperBinaryAssetTLV alloc] initWithType:1619725827 unsignedInt16:0];
    [v7 addMetaDataTLV:v8];
    [(UARPSuperBinaryAsset *)v5 addPayload:v7];
  }
  if ([(NSMutableArray *)self->_fallbackModels count])
  {
    objc_super v9 = [(NSMutableArray *)self->_fallbackModels firstObject];
    uint64_t v10 = +[UARPHeySiriModel uarpPayloadWithHSModel:v9];

    v11 = [[UARPSuperBinaryAssetTLV alloc] initWithType:1619725827 unsignedInt16:1];
    [v10 addMetaDataTLV:v11];
    [(UARPSuperBinaryAsset *)v5 addPayload:v10];
  }
  return v5;
}

- (unint64_t)engineType
{
  return self->_engineType;
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preInstalledModels, 0);
  objc_storeStrong((id *)&self->_downloadedModels, 0);
  objc_storeStrong((id *)&self->_fallbackModels, 0);
  objc_storeStrong((id *)&self->_newModels, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end