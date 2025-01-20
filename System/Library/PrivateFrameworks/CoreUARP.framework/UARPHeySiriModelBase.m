@interface UARPHeySiriModelBase
- (BOOL)offerDynamicAssetToAccessory:(id)a3 tag:(id)a4 error:(id *)a5;
- (BOOL)processDynamicAsset:(id *)a3;
- (UARPAccessory)accessory;
- (UARPHeySiriModelBase)init;
- (UARPHeySiriModelBase)initWithAccessory:(id)a3 controller:(id)a4 url:(id)a5;
- (UARPHeySiriModelBase)initWithAccessory:(id)a3 uarpProtocolVersion:(unint64_t)a4 controller:(id)a5 url:(id)a6;
- (UARPHeySiriModelDelegateProtocol)delegate;
- (id)log;
- (id)superbinary;
- (id)uarpPayloadWithHSModel:(id)a3 tag:(id)a4;
- (id)url;
- (unint64_t)engineType;
- (unint64_t)majorVersion;
- (unint64_t)minorVersion;
- (unint64_t)uarpProtocolVersion;
- (void)addDownloadedModel:(id)a3;
- (void)addPreInstalledModel:(id)a3;
- (void)checkCurrentHeySiriModel;
- (void)checkCurrentJustSiriModelAvailable;
- (void)offerDownloadModel:(id)a3 fallbackModel:(id)a4 tag:(id)a5 assetVersion:(id)a6 error:(id)a7;
- (void)setDelegate:(id)a3;
- (void)setEngineType:(unint64_t)a3;
- (void)setMajorVersion:(unint64_t)a3;
- (void)setMinorVersion:(unint64_t)a3;
- (void)setSuperbinary:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation UARPHeySiriModelBase

- (UARPHeySiriModelBase)init
{
  return 0;
}

- (UARPHeySiriModelBase)initWithAccessory:(id)a3 controller:(id)a4 url:(id)a5
{
  return [(UARPHeySiriModelBase *)self initWithAccessory:a3 uarpProtocolVersion:3 controller:a4 url:a5];
}

- (UARPHeySiriModelBase)initWithAccessory:(id)a3 uarpProtocolVersion:(unint64_t)a4 controller:(id)a5 url:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)UARPHeySiriModelBase;
  v14 = [(UARPHeySiriModelBase *)&v25 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_accessory, a3);
    v15->_uarpProtocolVersion = a4;
    objc_storeStrong((id *)&v15->_controller, a5);
    objc_storeStrong((id *)&v15->_url, a6);
    os_log_t v16 = os_log_create("com.apple.accessoryupdater.uarp", "heySiri");
    log = v15->_log;
    v15->_log = (OS_os_log *)v16;

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.UARP.UARPHeySiriModelBase", 0);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    downloadedModels = v15->_downloadedModels;
    v15->_downloadedModels = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    preinstalledModels = v15->_preinstalledModels;
    v15->_preinstalledModels = v22;
  }
  return v15;
}

- (id)log
{
  return self->_log;
}

- (id)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  v4 = (NSURL *)a3;
  obj = self;
  objc_sync_enter(obj);
  url = obj->_url;
  obj->_url = v4;

  objc_sync_exit(obj);
}

- (id)superbinary
{
  return self->_superbinary;
}

- (void)setSuperbinary:(id)a3
{
  v4 = (UARPSuperBinaryAsset *)a3;
  obj = self;
  objc_sync_enter(obj);
  superbinary = obj->_superbinary;
  obj->_superbinary = v4;

  objc_sync_exit(obj);
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (void)setMajorVersion:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_majorVersion = a3;
  objc_sync_exit(obj);
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (void)setMinorVersion:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_minorVersion = a3;
  objc_sync_exit(obj);
}

- (unint64_t)uarpProtocolVersion
{
  return self->_uarpProtocolVersion;
}

- (unint64_t)engineType
{
  return self->_engineType;
}

- (void)setEngineType:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_engineType = a3;
  objc_sync_exit(obj);
}

- (BOOL)processDynamicAsset:(id *)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  v5 = [UARPSuperBinaryAsset alloc];
  v42 = self;
  v6 = [(UARPHeySiriModelBase *)self url];
  v7 = [(UARPSuperBinaryAsset *)v5 initWithURL:v6];
  [(UARPHeySiriModelBase *)self setSuperbinary:v7];

  v8 = [(UARPHeySiriModelBase *)self superbinary];
  int v9 = [v8 expandHeadersAndTLVs:a3];

  if (v9)
  {
    char v35 = v9;
    v10 = [(UARPHeySiriModelBase *)v42 superbinary];
    id v11 = [v10 tlvs];
    v38 = +[UARPSuperBinaryAssetTLV findTLVWithType:1619725831 tlvs:v11];

    v37 = [v38 valueAsVersion];
    -[UARPHeySiriModelBase setMajorVersion:](v42, "setMajorVersion:", [v37 majorVersion]);
    -[UARPHeySiriModelBase setMinorVersion:](v42, "setMinorVersion:", [v37 minorVersion]);
    id v12 = [(UARPHeySiriModelBase *)v42 superbinary];
    id v13 = [v12 tlvs];
    v36 = +[UARPSuperBinaryAssetTLV findTLVWithType:1619725832 tlvs:v13];

    v39 = [v36 valueAsNumber];
    -[UARPHeySiriModelBase setEngineType:](v42, "setEngineType:", [v39 unsignedShortValue]);
    log = v42->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v39;
      _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "HSML: process rx asset; Engine Type %@", buf, 0xCu);
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v15 = [(UARPHeySiriModelBase *)v42 superbinary];
    id obj = [v15 payloads];

    uint64_t v16 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v16)
    {
      uint64_t v41 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v44 != v41) {
            objc_enumerationMutation(obj);
          }
          dispatch_queue_t v18 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          v19 = [v18 tlvs];
          v20 = +[UARPSuperBinaryAssetTLV findTLVWithType:1619725826 tlvs:v19];

          v21 = [v20 valueAsString];
          v22 = [v18 tlvs];
          v23 = +[UARPSuperBinaryAssetTLV findTLVWithType:1619725825 tlvs:v22];

          v24 = [v23 valueAsString];
          objc_super v25 = [v18 tlvs];
          v26 = +[UARPSuperBinaryAssetTLV findTLVWithType:1619725824 tlvs:v25];

          v27 = [v26 valueAsNumber];
          int v28 = [v27 shortValue];
          uint64_t v47 = 0;
          v48 = &v47;
          uint64_t v49 = 0x2050000000;
          v29 = (void *)getCSVoiceTriggerRTModelClass_softClass_0;
          uint64_t v50 = getCSVoiceTriggerRTModelClass_softClass_0;
          if (!getCSVoiceTriggerRTModelClass_softClass_0)
          {
            *(void *)buf = MEMORY[0x263EF8330];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __getCSVoiceTriggerRTModelClass_block_invoke_0;
            v53 = &unk_2644926F0;
            v54 = &v47;
            __getCSVoiceTriggerRTModelClass_block_invoke_0((uint64_t)buf);
            v29 = (void *)v48[3];
          }
          v30 = v29;
          _Block_object_dispose(&v47, 8);
          v31 = (void *)[[v30 alloc] initWithHash:v21 locale:v24];
          if (v28 == 1)
          {
            v33 = v42->_log;
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v24;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v21;
              _os_log_impl(&dword_21E079000, v33, OS_LOG_TYPE_INFO, "HSML: rx pre-installed model locale <%@>, hash <%@>", buf, 0x16u);
            }
            [(UARPHeySiriModelBase *)v42 addPreInstalledModel:v31];
          }
          else if (!(_WORD)v28)
          {
            v32 = v42->_log;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v24;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v21;
              _os_log_impl(&dword_21E079000, v32, OS_LOG_TYPE_INFO, "HSML: rx downloaded model locale <%@>, hash <%@>", buf, 0x16u);
            }
            [(UARPHeySiriModelBase *)v42 addDownloadedModel:v31];
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v16);
    }

    LOBYTE(v9) = v35;
  }
  return v9;
}

- (void)addDownloadedModel:(id)a3
{
}

- (void)addPreInstalledModel:(id)a3
{
}

- (id)uarpPayloadWithHSModel:(id)a3 tag:(id)a4
{
  v42.wbuf[7] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [[UARPAssetVersion alloc] initWithMajorVersion:0 minorVersion:0 releaseVersion:0 buildVersion:0];
  v8 = [[UARPSuperBinaryAssetPayload alloc] initWithPayloadTag:v6 assetVersion:v7];

  int v9 = [v5 modelLocale];

  if (v9)
  {
    v10 = [UARPSuperBinaryAssetTLV alloc];
    id v11 = [v5 modelLocale];
    id v12 = [(UARPSuperBinaryAssetTLV *)v10 initWithType:1619725825 stringValue:v11];

    [(UARPSuperBinaryAssetPayload *)v8 addMetaDataTLV:v12];
  }
  id v13 = [v5 modelHash];

  if (v13)
  {
    v14 = [UARPSuperBinaryAssetTLV alloc];
    v15 = [v5 modelHash];
    uint64_t v16 = [(UARPSuperBinaryAssetTLV *)v14 initWithType:1619725826 stringValue:v15];

    [(UARPSuperBinaryAssetPayload *)v8 addMetaDataTLV:v16];
  }
  v17 = [v5 digest];

  if (v17)
  {
    dispatch_queue_t v18 = [UARPSuperBinaryAssetTLV alloc];
    v19 = [v5 digest];
    v20 = [(UARPSuperBinaryAssetTLV *)v18 initWithType:1619725828 dataValue:v19];

    [(UARPSuperBinaryAssetPayload *)v8 addMetaDataTLV:v20];
  }
  v21 = [v5 signature];

  if (v21)
  {
    v22 = [UARPSuperBinaryAssetTLV alloc];
    v23 = [v5 signature];
    v24 = [(UARPSuperBinaryAssetTLV *)v22 initWithType:1619725829 dataValue:v23];

    [(UARPSuperBinaryAssetPayload *)v8 addMetaDataTLV:v24];
  }
  objc_super v25 = [v5 certificate];

  if (v25)
  {
    v26 = [UARPSuperBinaryAssetTLV alloc];
    v27 = [v5 certificate];
    int v28 = [(UARPSuperBinaryAssetTLV *)v26 initWithType:1619725830 dataValue:v27];

    [(UARPSuperBinaryAssetPayload *)v8 addMetaDataTLV:v28];
  }
  uint64_t v29 = [v5 modelData];
  if (v29)
  {
    v30 = (void *)v29;
    v31 = [v5 modelData];
    uint64_t v32 = [v31 length];

    if (v32)
    {
      v33 = [v5 digest];

      if (!v33)
      {
        v34 = [[UARPSuperBinaryAssetTLV alloc] initWithType:3436347666 unsignedInt16:1];
        [(UARPSuperBinaryAssetPayload *)v8 addMetaDataTLV:v34];
        memset(&v42, 0, 104);
        uarpPlatformDarwinHashInit(1, &v42);
        id v35 = [v5 modelData];
        v36 = (void *)[v35 bytes];
        v37 = [v5 modelData];
        uarpPlatformDarwinHashUpdate(1, &v42, v36, [v37 length]);

        uarpPlatformDarwinHashFinal(1, &v42, (unsigned __int8 *)&v42.wbuf[3], 32);
        v38 = [MEMORY[0x263EFF8F8] dataWithBytes:&v42.wbuf[3] length:32];
        v39 = [[UARPSuperBinaryAssetTLV alloc] initWithType:3436347655 dataValue:v38];
        [(UARPSuperBinaryAssetPayload *)v8 addMetaDataTLV:v39];
      }
      v40 = [v5 modelData];
      [(UARPSuperBinaryAssetPayload *)v8 setPayloadToData:v40];
    }
  }

  return v8;
}

- (void)checkCurrentHeySiriModel
{
  id CSCoreSpeechServicesClass = getCSCoreSpeechServicesClass();
  unint64_t majorVersion = self->_majorVersion;
  unint64_t minorVersion = self->_minorVersion;
  downloadedModels = self->_downloadedModels;
  preinstalledModels = self->_preinstalledModels;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__UARPHeySiriModelBase_checkCurrentHeySiriModel__block_invoke;
  v8[3] = &unk_264492F58;
  v8[4] = self;
  [CSCoreSpeechServicesClass voiceTriggerRTModelForVersion:majorVersion minorVersion:minorVersion downloadedModels:downloadedModels preinstalledModels:preinstalledModels completion:v8];
}

void __48__UARPHeySiriModelBase_checkCurrentHeySiriModel__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    v10 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v7;
      _os_log_impl(&dword_21E079000, v10, OS_LOG_TYPE_INFO, "HSML: Voice Trigger Download Model %@", buf, 0xCu);
    }
    if (!v8) {
      goto LABEL_11;
    }
LABEL_7:
    id v11 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v8;
      _os_log_impl(&dword_21E079000, v11, OS_LOG_TYPE_INFO, "HSML: Voice Trigger Fallback Model %@", buf, 0xCu);
    }
    goto LABEL_11;
  }
  if (v8) {
    goto LABEL_7;
  }
  id v12 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    __48__UARPHeySiriModelBase_checkCurrentHeySiriModel__block_invoke_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
  }
LABEL_11:
  uint64_t v20 = *(void *)(a1 + 32);
  v21 = *(NSObject **)(v20 + 16);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __48__UARPHeySiriModelBase_checkCurrentHeySiriModel__block_invoke_8;
  v25[3] = &unk_264492CD8;
  v25[4] = v20;
  id v26 = v7;
  id v27 = v8;
  id v28 = v9;
  id v22 = v9;
  id v23 = v8;
  id v24 = v7;
  dispatch_async(v21, v25);
}

void __48__UARPHeySiriModelBase_checkCurrentHeySiriModel__block_invoke_8(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 104));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(a1[4] + 104));
    [v4 currentHeySiriModel:a1[5] fallbackModel:a1[6] error:a1[7]];
  }
}

- (void)checkCurrentJustSiriModelAvailable
{
  char v3 = [MEMORY[0x263F08C38] UUID];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2050000000;
  id v4 = (void *)getCSCoreSpeechServicesAccessoryInfoClass_softClass;
  uint64_t v17 = getCSCoreSpeechServicesAccessoryInfoClass_softClass;
  if (!getCSCoreSpeechServicesAccessoryInfoClass_softClass)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __getCSCoreSpeechServicesAccessoryInfoClass_block_invoke;
    v13[3] = &unk_2644926F0;
    v13[4] = &v14;
    __getCSCoreSpeechServicesAccessoryInfoClass_block_invoke((uint64_t)v13);
    id v4 = (void *)v15[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v14, 8);
  id v6 = objc_alloc_init(v5);
  [v6 setSupportsJustSiri:1];
  id CSCoreSpeechServicesClass = getCSCoreSpeechServicesClass();
  unint64_t majorVersion = self->_majorVersion;
  unint64_t minorVersion = self->_minorVersion;
  downloadedModels = self->_downloadedModels;
  preinstalledModels = self->_preinstalledModels;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__UARPHeySiriModelBase_checkCurrentJustSiriModelAvailable__block_invoke;
  v12[3] = &unk_264492F58;
  v12[4] = self;
  [CSCoreSpeechServicesClass voiceTriggerRTModelForVersion:majorVersion minorVersion:minorVersion accessoryRTModelType:0 accessoryInfo:v6 endpointId:v3 downloadedModels:downloadedModels preinstalledModels:preinstalledModels completion:v12];
}

void __58__UARPHeySiriModelBase_checkCurrentJustSiriModelAvailable__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    v10 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v7;
      _os_log_impl(&dword_21E079000, v10, OS_LOG_TYPE_INFO, "Download Model %@", buf, 0xCu);
    }
  }
  if (v8)
  {
    id v11 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v8;
      _os_log_impl(&dword_21E079000, v11, OS_LOG_TYPE_INFO, "Fallback Model %@", buf, 0xCu);
    }
  }
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(NSObject **)(v12 + 16);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __58__UARPHeySiriModelBase_checkCurrentJustSiriModelAvailable__block_invoke_14;
  v17[3] = &unk_264492CD8;
  v17[4] = v12;
  id v18 = v7;
  id v19 = v8;
  id v20 = v9;
  id v14 = v9;
  id v15 = v8;
  id v16 = v7;
  dispatch_async(v13, v17);
}

void __58__UARPHeySiriModelBase_checkCurrentJustSiriModelAvailable__block_invoke_14(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 104));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(a1[4] + 104));
    [v4 currentHeySiriModel:a1[5] fallbackModel:a1[6] error:a1[7]];
  }
}

- (void)offerDownloadModel:(id)a3 fallbackModel:(id)a4 tag:(id)a5 assetVersion:(id)a6 error:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  unsigned int uarpProtocolVersion_low = LOWORD(self->_uarpProtocolVersion);
  id v15 = a6;
  id v16 = [[UARPSuperBinaryAsset alloc] initWithFormatVersion:uarpAssetSuperBinaryVersionForProtocolVersion(uarpProtocolVersion_low) assetVersion:v15];

  if ([(UARPHeySiriModelBase *)self engineType]
    && [(UARPHeySiriModelBase *)self engineType] != 1)
  {
    uint64_t v17 = [[UARPSuperBinaryAssetTLV alloc] initWithType:1619725832 unsignedInt16:(unsigned __int16)[(UARPHeySiriModelBase *)self engineType]];
    [(UARPSuperBinaryAsset *)v16 addMetaDataTLV:v17];
  }
  if (v11)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[UARPHeySiriModelBase offerDownloadModel:fallbackModel:tag:assetVersion:error:].cold.4(log, v19, v20, v21, v22, v23, v24, v25);
    }
    id v26 = [(UARPHeySiriModelBase *)self uarpPayloadWithHSModel:v11 tag:v13];
    id v27 = [[UARPSuperBinaryAssetTLV alloc] initWithType:1619725827 unsignedInt16:0];
    [v26 addMetaDataTLV:v27];
    [(UARPSuperBinaryAsset *)v16 addPayload:v26];
  }
  if (v12)
  {
    id v28 = self->_log;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[UARPHeySiriModelBase offerDownloadModel:fallbackModel:tag:assetVersion:error:](v28, v29, v30, v31, v32, v33, v34, v35);
    }
    v36 = [(UARPHeySiriModelBase *)self uarpPayloadWithHSModel:v12 tag:v13];
    v37 = [[UARPSuperBinaryAssetTLV alloc] initWithType:1619725827 unsignedInt16:1];
    [v36 addMetaDataTLV:v37];
    [(UARPSuperBinaryAsset *)v16 addPayload:v36];
  }
  v38 = uarpDynamicAssetComponentURL(v13);
  id v46 = 0;
  BOOL v39 = [(UARPSuperBinaryAsset *)v16 writeToURL:v38 error:&v46];
  id v40 = v46;
  if (v39)
  {
    id v45 = 0;
    BOOL v41 = [(UARPHeySiriModelBase *)self offerDynamicAssetToAccessory:v38 tag:v13 error:&v45];
    id v42 = v45;

    if (!v41)
    {
      long long v43 = self->_log;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        -[UARPHeySiriModelBase offerDownloadModel:fallbackModel:tag:assetVersion:error:]((uint64_t)v42, v43);
      }
    }
    id v40 = v42;
  }
  else
  {
    long long v44 = self->_log;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      -[UARPHeySiriModelBase offerDownloadModel:fallbackModel:tag:assetVersion:error:]((uint64_t)v40, v44);
    }
  }
}

- (BOOL)offerDynamicAssetToAccessory:(id)a3 tag:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [[UARPAssetID alloc] initWithLocationType:0 assetTag:v8 url:v9];

  if (v10)
  {
    [(UARPAssetID *)v10 setReportProgressToDelegates:0];
    BOOL v11 = [(UARPController *)self->_controller dynamicAssetAvailableForAccessory:self->_accessory assetID:v10 error:a5];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (UARPAccessory)accessory
{
  return (UARPAccessory *)objc_getProperty(self, a2, 96, 1);
}

- (UARPHeySiriModelDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UARPHeySiriModelDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_preinstalledModels, 0);
  objc_storeStrong((id *)&self->_downloadedModels, 0);
  objc_storeStrong((id *)&self->_superbinary, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

void __48__UARPHeySiriModelBase_checkCurrentHeySiriModel__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)offerDownloadModel:(uint64_t)a1 fallbackModel:(NSObject *)a2 tag:assetVersion:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E079000, a2, OS_LOG_TYPE_ERROR, "Could not offer HSML dynamic asset to disk %@", (uint8_t *)&v2, 0xCu);
}

- (void)offerDownloadModel:(uint64_t)a1 fallbackModel:(NSObject *)a2 tag:assetVersion:error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E079000, a2, OS_LOG_TYPE_ERROR, "Could not export HSML dynamic asset to disk %@", (uint8_t *)&v2, 0xCu);
}

- (void)offerDownloadModel:(uint64_t)a3 fallbackModel:(uint64_t)a4 tag:(uint64_t)a5 assetVersion:(uint64_t)a6 error:(uint64_t)a7 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)offerDownloadModel:(uint64_t)a3 fallbackModel:(uint64_t)a4 tag:(uint64_t)a5 assetVersion:(uint64_t)a6 error:(uint64_t)a7 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end