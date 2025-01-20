@interface AXAsset
+ (BOOL)supportsSecureCoding;
+ (id)archivedAssets:(id)a3 error:(id *)a4;
+ (id)assetsFromMAAssets:(id)a3;
+ (id)downloadableAssets:(id)a3;
+ (id)installedAssets:(id)a3;
+ (id)newsestCompatibleImageCaptionModelAssetFromAssets:(id)a3 withStage:(id)a4 language:(id)a5 isInstalled:(BOOL)a6 isDownloadable:(BOOL)a7;
+ (id)unarchivedAssets:(id)a3 error:(id *)a4;
- (AXAsset)initWithCoder:(id)a3;
- (AXAsset)initWithMAAsset:(id)a3;
- (AXImageCaptionModel)imageCaptionModel;
- (BOOL)assetStateIsInstalled:(int64_t)a3;
- (BOOL)isDownloading;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToMAAsset:(id)a3;
- (BOOL)isInstalled;
- (BOOL)isOlderThanAsset:(id)a3;
- (BOOL)isUsingSoundPrint;
- (MAAsset)maAsset;
- (NSDictionary)properties;
- (NSNumber)computedOnDiskSize;
- (NSNumber)downloadSize;
- (NSNumber)unarchivedFileSize;
- (NSString)assetId;
- (NSString)assetType;
- (NSString)characterVoiceLanguage;
- (NSString)characterVoiceName;
- (NSString)ultronModelName;
- (NSURL)localCopyURL;
- (NSURL)localURL;
- (NSURL)originalURL;
- (id)assertionForVersionLockedImageCaptionModelAsset:(id)a3;
- (id)assetInfoDictionary;
- (id)description;
- (unint64_t)compatibilityVersion;
- (unint64_t)contentVersion;
- (unint64_t)formatVersion;
- (void)attachProgressHandlerIfNeeded:(id)a3;
- (void)copyLocally;
- (void)encodeWithCoder:(id)a3;
- (void)refreshMAAsset;
- (void)resetPropertiesFromMAAsset:(id)a3;
- (void)setLocalCopyURL:(id)a3;
- (void)setOriginalURL:(id)a3;
@end

@implementation AXAsset

+ (id)installedAssets:(id)a3
{
  return (id)objc_msgSend(a3, "ax_filteredArrayUsingBlock:", &__block_literal_global_3);
}

+ (id)assetsFromMAAssets:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = [AXAsset alloc];
        v12 = -[AXAsset initWithMAAsset:](v11, "initWithMAAsset:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSString)characterVoiceLanguage
{
  v2 = [(AXAsset *)self properties];
  id v3 = [v2 objectForKey:@"Language"];

  return (NSString *)v3;
}

- (NSString)characterVoiceName
{
  v2 = [(AXAsset *)self properties];
  id v3 = [v2 objectForKey:@"Character"];

  return (NSString *)v3;
}

- (NSString)ultronModelName
{
  v2 = [(AXAsset *)self properties];
  id v3 = [v2 objectForKey:@"ModelName"];

  return (NSString *)v3;
}

- (BOOL)isUsingSoundPrint
{
  v2 = [(AXAsset *)self properties];
  id v3 = [v2 objectForKey:@"SoundPrint"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isOlderThanAsset:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 compatibilityVersion];
  BOOL v8 = 1;
  if (v5 <= [(AXAsset *)self compatibilityVersion])
  {
    uint64_t v6 = [v4 compatibilityVersion];
    if (v6 != [(AXAsset *)self compatibilityVersion]
      || (unint64_t v7 = [v4 contentVersion], v7 <= -[AXAsset contentVersion](self, "contentVersion")))
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (AXImageCaptionModel)imageCaptionModel
{
  v2 = [(AXAsset *)self properties];
  id v3 = [v2 objectForKey:@"Model"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = [[AXImageCaptionModel alloc] initWithModelProperties:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)assertionForVersionLockedImageCaptionModelAsset:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_alloc_init(AXImageCaptionModelAssetAssertion);
  [(AXImageCaptionModelAssetAssertion *)v5 setAssertionType:0];
  [(AXImageCaptionModelAssetAssertion *)v5 setClientIdentifier:v4];

  uint64_t v6 = [(AXAsset *)self imageCaptionModel];
  unint64_t v7 = [v6 version];
  [(AXImageCaptionModelAssetAssertion *)v5 setModelVersion:v7];

  BOOL v8 = [v6 stage];
  [(AXImageCaptionModelAssetAssertion *)v5 setModelStage:v8];

  v9 = [v6 language];
  [(AXImageCaptionModelAssetAssertion *)v5 setModelLanguage:v9];

  return v5;
}

+ (id)newsestCompatibleImageCaptionModelAssetFromAssets:(id)a3 withStage:(id)a4 language:(id)a5 isInstalled:(BOOL)a6 isDownloadable:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  int64_t v14 = +[AXImageCaptionModelAssetPolicy minimumCompatibilityVersion];
  int64_t v15 = +[AXImageCaptionModelAssetPolicy maximumCompatibilityVersion];
  long long v16 = AXLogAssetLoader();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    long long v17 = &stru_1F367E168;
    if (v8) {
      long long v17 = @"installed";
    }
    *(_DWORD *)buf = 138412802;
    if (v7) {
      long long v17 = @"downloadable";
    }
    v56 = v17;
    __int16 v57 = 2048;
    int64_t v58 = v14;
    __int16 v59 = 2048;
    int64_t v60 = v15;
    _os_log_impl(&dword_1DC53F000, v16, OS_LOG_TYPE_INFO, "Finding newest %@ compatible image caption model asset. Compat version range %ld-%ld", buf, 0x20u);
  }

  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __126__AXAsset_ImageCaptionModel__newsestCompatibleImageCaptionModelAssetFromAssets_withStage_language_isInstalled_isDownloadable___block_invoke;
  v47[3] = &unk_1E6C422F8;
  BOOL v52 = v8;
  BOOL v53 = v7;
  int64_t v50 = v14;
  int64_t v51 = v15;
  id v18 = v12;
  id v48 = v18;
  id v19 = v13;
  id v49 = v19;
  objc_msgSend(v11, "ax_filteredArrayUsingBlock:", v47);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [obj countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (!v20)
  {
LABEL_29:
    if (v8)
    {
      v33 = AXLogAssetLoader();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v37 = "No installed compatible image caption model asset found";
LABEL_35:
        _os_log_impl(&dword_1DC53F000, v33, OS_LOG_TYPE_INFO, v37, buf, 2u);
      }
    }
    else
    {
      if (!v7)
      {
        id v22 = 0;
        goto LABEL_38;
      }
      v33 = AXLogAssetLoader();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v37 = "No downloadable compatible image caption model asset found (it may already be downloaded/installed though!)";
        goto LABEL_35;
      }
    }
    id v22 = 0;
    goto LABEL_37;
  }
  uint64_t v21 = v20;
  id v39 = v19;
  id v40 = v18;
  id v41 = v11;
  id v22 = 0;
  uint64_t v23 = *(void *)v44;
  do
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      BOOL v25 = v8;
      BOOL v26 = v7;
      if (*(void *)v44 != v23) {
        objc_enumerationMutation(obj);
      }
      v27 = *(void **)(*((void *)&v43 + 1) + 8 * i);
      v28 = objc_msgSend(v27, "imageCaptionModel", v39, v40, v41);
      v29 = [v28 version];

      if (!v29) {
        goto LABEL_18;
      }
      if (!v22)
      {
        id v22 = v27;
LABEL_18:
        BOOL v7 = v26;
        goto LABEL_19;
      }
      v30 = [v22 imageCaptionModel];
      v31 = [v30 version];

      if ([v29 compare:v31 options:64] == 1)
      {
        id v32 = v27;

        id v22 = v32;
      }
      BOOL v7 = v26;

LABEL_19:
      BOOL v8 = v25;
    }
    uint64_t v21 = [obj countByEnumeratingWithState:&v43 objects:v54 count:16];
  }
  while (v21);
  id v18 = v40;
  id v11 = v41;
  id v19 = v39;
  if (!v22) {
    goto LABEL_29;
  }
  v33 = AXLogAssetLoader();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    v34 = &stru_1F367E168;
    if (v25) {
      v34 = @"installed";
    }
    if (v7) {
      v35 = @"downloadable";
    }
    else {
      v35 = v34;
    }
    v36 = [v22 imageCaptionModel];
    *(_DWORD *)buf = 138412802;
    v56 = v35;
    __int16 v57 = 2112;
    int64_t v58 = (int64_t)v22;
    __int16 v59 = 2112;
    int64_t v60 = (int64_t)v36;
    _os_log_impl(&dword_1DC53F000, v33, OS_LOG_TYPE_INFO, "Returning newest %@ compatible image caption model asset: %@ (%@)", buf, 0x20u);
  }
LABEL_37:

LABEL_38:
  return v22;
}

uint64_t __126__AXAsset_ImageCaptionModel__newsestCompatibleImageCaptionModelAssetFromAssets_withStage_language_isInstalled_isDownloadable___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if ((!*(unsigned char *)(a1 + 64) || [v3 isInstalled])
    && (!*(unsigned char *)(a1 + 65) || ([v4 isInstalled] & 1) == 0)
    && (unint64_t)[v4 compatibilityVersion] >= *(void *)(a1 + 48)
    && (unint64_t)[v4 compatibilityVersion] <= *(void *)(a1 + 56))
  {
    BOOL v7 = [v4 imageCaptionModel];
    BOOL v8 = v7;
    if (v7)
    {
      v9 = [v7 stage];
      if ([v9 isEqualToString:*(void *)(a1 + 32)])
      {
        uint64_t v10 = [v8 language];
        char v11 = [v10 isEqualToString:*(void *)(a1 + 40)];

        if (v11)
        {
          uint64_t v5 = 1;
LABEL_15:

          goto LABEL_8;
        }
      }
      else
      {
      }
    }
    uint64_t v5 = 0;
    goto LABEL_15;
  }
  uint64_t v5 = 0;
LABEL_8:

  return v5;
}

- (AXAsset)initWithMAAsset:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXAsset;
  uint64_t v6 = [(AXAsset *)&v9 init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_maAsset, a3);
    [(AXAsset *)v7 resetPropertiesFromMAAsset:v5];
  }

  return v7;
}

- (NSURL)localURL
{
  localCopyURL = self->_localCopyURL;
  if (!localCopyURL) {
    localCopyURL = self->_originalURL;
  }
  id v3 = localCopyURL;
  return v3;
}

- (void)resetPropertiesFromMAAsset:(id)a3
{
  id v4 = a3;
  id v5 = [v4 assetId];
  assetId = self->_assetId;
  self->_assetId = v5;

  BOOL v7 = [v4 assetType];
  assetType = self->_assetType;
  self->_assetType = v7;

  self->_isInstalled = -[AXAsset assetStateIsInstalled:](self, "assetStateIsInstalled:", [v4 state]);
  self->_isDownloading = [v4 state] == 4;
  if (self->_isInstalled)
  {
    objc_super v9 = [v4 getLocalFileUrl];
    originalURL = self->_originalURL;
    self->_originalURL = v9;
  }
  char v11 = [v4 attributes];
  properties = self->_properties;
  self->_properties = v11;

  self->_formatVersion = 1;
  id v13 = [v4 attributes];
  int64_t v14 = [v13 objectForKeyedSubscript:@"FormatVersion"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    self->_formatVersion = [v14 unsignedIntegerValue];
  }
  self->_contentVersion = 1;
  int64_t v15 = [v4 attributes];
  long long v16 = [v15 objectForKeyedSubscript:@"_AXContentVersion"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self->_contentVersion = [v16 unsignedIntValue];
  }
  else
  {
    long long v17 = [v4 attributes];
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    id v18 = (void *)getASAttributeContentVersionSymbolLoc_ptr;
    uint64_t v30 = getASAttributeContentVersionSymbolLoc_ptr;
    if (!getASAttributeContentVersionSymbolLoc_ptr)
    {
      id v19 = (void *)MobileAssetLibrary_1();
      v28[3] = (uint64_t)dlsym(v19, "ASAttributeContentVersion");
      getASAttributeContentVersionSymbolLoc_ptr = v28[3];
      id v18 = (void *)v28[3];
    }
    _Block_object_dispose(&v27, 8);
    if (!v18)
    {
LABEL_21:
      BOOL v26 = (_Unwind_Exception *)-[AXAudiogramIngestionAssetPolicy init]();
      _Block_object_dispose(&v27, 8);
      _Unwind_Resume(v26);
    }
    uint64_t v20 = [v17 objectForKeyedSubscript:*v18];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v21 = [v20 unsignedIntValue];
    }
    else {
      unint64_t v21 = 0;
    }
    self->_contentVersion = v21;
  }
  self->_compatibilityVersion = 1;
  id v22 = [v4 attributes];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v23 = (void *)getASAttributeCompatibilityVersionSymbolLoc_ptr;
  uint64_t v30 = getASAttributeCompatibilityVersionSymbolLoc_ptr;
  if (!getASAttributeCompatibilityVersionSymbolLoc_ptr)
  {
    v24 = (void *)MobileAssetLibrary_1();
    v28[3] = (uint64_t)dlsym(v24, "ASAttributeCompatibilityVersion");
    getASAttributeCompatibilityVersionSymbolLoc_ptr = v28[3];
    uint64_t v23 = (void *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (!v23)
  {
    -[AXAudiogramIngestionAssetPolicy init]();
    goto LABEL_21;
  }
  BOOL v25 = [v22 objectForKeyedSubscript:*v23];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    self->_compatibilityVersion = [v25 unsignedIntValue];
  }
}

- (void)refreshMAAsset
{
  id v3 = [(AXAsset *)self maAsset];

  if (v3)
  {
    id v4 = [(AXAsset *)self maAsset];
    [v4 refreshState];

    id v5 = [(AXAsset *)self maAsset];
    [(AXAsset *)self resetPropertiesFromMAAsset:v5];
  }
}

- (void)attachProgressHandlerIfNeeded:(id)a3
{
  id v4 = a3;
  if (!self->_didAttachProgressHandler)
  {
    id v7 = v4;
    id v5 = [(AXAsset *)self maAsset];
    uint64_t v6 = v5;
    if (v5)
    {
      self->_didAttachProgressHandler = 1;
      [v5 attachProgressCallBack:v7];
    }

    id v4 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)AXAsset;
  id v4 = [(AXAsset *)&v15 description];
  id v5 = [(AXAsset *)self assetId];
  uint64_t v6 = [(AXAsset *)self assetType];
  if ([(AXAsset *)self isInstalled]) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  if ([(AXAsset *)self isDownloading]) {
    BOOL v8 = @"YES";
  }
  else {
    BOOL v8 = @"NO";
  }
  unint64_t v9 = [(AXAsset *)self compatibilityVersion];
  unint64_t v10 = [(AXAsset *)self contentVersion];
  unint64_t v11 = [(AXAsset *)self formatVersion];
  id v12 = [(AXAsset *)self localURL];
  id v13 = [v3 stringWithFormat:@"%@, AssetID=%@, Type=%@, Installed=%@, Downloading=%@ compatVers=%lu, contentVers=%lu, fmtVers=%lu, localURL=%@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (BOOL)assetStateIsInstalled:(int64_t)a3
{
  return ((unint64_t)a3 < 7) & (0x6Cu >> a3);
}

- (BOOL)isEquivalentToMAAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(AXAsset *)self maAsset];
  char v6 = [v5 isEqual:v4];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(AXAsset *)self assetId];
    char v6 = [v4 assetId];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSNumber)downloadSize
{
  v2 = [(AXAsset *)self properties];
  uint64_t v8 = 0;
  unint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  id v3 = (void *)getASAttributeDownloadSizeSymbolLoc_ptr;
  uint64_t v11 = getASAttributeDownloadSizeSymbolLoc_ptr;
  if (!getASAttributeDownloadSizeSymbolLoc_ptr)
  {
    id v4 = (void *)MobileAssetLibrary_1();
    v9[3] = (uint64_t)dlsym(v4, "ASAttributeDownloadSize");
    getASAttributeDownloadSizeSymbolLoc_ptr = v9[3];
    id v3 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
  {
    char v7 = (_Unwind_Exception *)-[AXAudiogramIngestionAssetPolicy init]();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  id v5 = [v2 objectForKey:*v3];

  return (NSNumber *)v5;
}

- (NSNumber)unarchivedFileSize
{
  v2 = [(AXAsset *)self properties];
  uint64_t v8 = 0;
  unint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  id v3 = (void *)getASAttributeUnarchivedSizeSymbolLoc_ptr;
  uint64_t v11 = getASAttributeUnarchivedSizeSymbolLoc_ptr;
  if (!getASAttributeUnarchivedSizeSymbolLoc_ptr)
  {
    id v4 = (void *)MobileAssetLibrary_1();
    v9[3] = (uint64_t)dlsym(v4, "ASAttributeUnarchivedSize");
    getASAttributeUnarchivedSizeSymbolLoc_ptr = v9[3];
    id v3 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
  {
    char v7 = (_Unwind_Exception *)-[AXAudiogramIngestionAssetPolicy init]();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  id v5 = [v2 objectForKey:*v3];

  return (NSNumber *)v5;
}

- (NSNumber)computedOnDiskSize
{
  v47[3] = *MEMORY[0x1E4F143B8];
  cachedComputedOnDiskSize = self->_cachedComputedOnDiskSize;
  if (!cachedComputedOnDiskSize)
  {
    uint64_t v27 = [(AXAsset *)self localURL];
    if (v27)
    {
      v24 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v3 = *MEMORY[0x1E4F1C670];
      uint64_t v4 = *MEMORY[0x1E4F1C558];
      v47[0] = *MEMORY[0x1E4F1C670];
      v47[1] = v4;
      uint64_t v26 = v4;
      uint64_t v5 = *MEMORY[0x1E4F1C718];
      v47[2] = *MEMORY[0x1E4F1C718];
      uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:3];
      uint64_t v36 = 0;
      v37 = &v36;
      uint64_t v38 = 0x3032000000;
      id v39 = __Block_byref_object_copy__1;
      id v40 = __Block_byref_object_dispose__1;
      id v41 = 0;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __29__AXAsset_computedOnDiskSize__block_invoke;
      v35[3] = &unk_1E6C42338;
      v35[4] = &v36;
      BOOL v25 = (void *)MEMORY[0x1E019EE50](v35);
      [v24 enumeratorAtURL:v27 includingPropertiesForKeys:v23 options:0 errorHandler:v25];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = 0;
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v46 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v32;
        while (2)
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v32 != v9) {
              objc_enumerationMutation(v6);
            }
            if (v37[5])
            {
              id v19 = AXLogCommon();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v20 = [v27 path];
                uint64_t v21 = v37[5];
                *(_DWORD *)buf = 138412546;
                long long v43 = v20;
                __int16 v44 = 2112;
                uint64_t v45 = v21;
                _os_log_impl(&dword_1DC53F000, v19, OS_LOG_TYPE_DEFAULT, "Error calculating size of item: %@. %@", buf, 0x16u);
              }
              _Block_object_dispose(&v36, 8);

              long long v17 = 0;
              goto LABEL_21;
            }
            uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8 * v10);
            id v30 = 0;
            [v11 getResourceValue:&v30 forKey:v3 error:0];
            id v12 = v30;
            if ([v12 BOOLValue])
            {
              id v29 = 0;
              [v11 getResourceValue:&v29 forKey:v5 error:0];
              id v13 = v29;
              if ([v13 unsignedLongLongValue])
              {
                v7 += [v13 unsignedLongLongValue];
              }
              else
              {
                id v28 = 0;
                [v11 getResourceValue:&v28 forKey:v26 error:0];
                id v14 = v28;

                if ([v14 unsignedLongLongValue]) {
                  v7 += [v14 unsignedLongLongValue];
                }
                id v13 = v14;
              }
            }
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v46 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

      objc_super v15 = [NSNumber numberWithUnsignedLongLong:v7];
      long long v16 = self->_cachedComputedOnDiskSize;
      self->_cachedComputedOnDiskSize = v15;

      _Block_object_dispose(&v36, 8);
    }

    cachedComputedOnDiskSize = self->_cachedComputedOnDiskSize;
  }
  long long v17 = cachedComputedOnDiskSize;
LABEL_21:
  return v17;
}

uint64_t __29__AXAsset_computedOnDiskSize__block_invoke(uint64_t a1, int a2, id obj)
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[AXAsset isInstalled](self, "isInstalled"), @"isInstalled");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXAsset isDownloading](self, "isDownloading"), @"isDownloading");
  uint64_t v5 = [(AXAsset *)self assetId];
  [v4 encodeObject:v5 forKey:@"assetId"];

  id v6 = [(AXAsset *)self assetType];
  [v4 encodeObject:v6 forKey:@"assetType"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[AXAsset compatibilityVersion](self, "compatibilityVersion"), @"compatibilityVersion");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXAsset contentVersion](self, "contentVersion"), @"contentVersion");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXAsset formatVersion](self, "formatVersion"), @"formatVersion");
  uint64_t v7 = [(AXAsset *)self originalURL];
  [v4 encodeObject:v7 forKey:@"originalURL"];

  id v8 = [(AXAsset *)self properties];
  [v4 encodeObject:v8 forKey:@"properties"];
}

- (AXAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AXAsset;
  uint64_t v5 = [(AXAsset *)&v15 init];
  if (v5)
  {
    v5->_isInstalled = [v4 decodeBoolForKey:@"isInstalled"];
    v5->_isDownloading = [v4 decodeBoolForKey:@"isDownloading"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetId"];
    assetId = v5->_assetId;
    v5->_assetId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetType"];
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v8;

    v5->_compatibilityVersion = [v4 decodeIntegerForKey:@"compatibilityVersion"];
    v5->_contentVersion = [v4 decodeIntegerForKey:@"contentVersion"];
    v5->_formatVersion = [v4 decodeIntegerForKey:@"formatVersion"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalURL"];
    originalURL = v5->_originalURL;
    v5->_originalURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodePropertyListForKey:@"properties"];
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v12;
  }
  return v5;
}

+ (id)archivedAssets:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:a4];
}

+ (id)unarchivedAssets:(id)a3 error:(id *)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  uint64_t v9 = [v6 setWithArray:v8];
  uint64_t v10 = [v5 unarchivedObjectOfClasses:v9 fromData:v7 error:a4];

  return v10;
}

uint64_t __27__AXAsset_installedAssets___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isInstalled];
}

+ (id)downloadableAssets:(id)a3
{
  return (id)objc_msgSend(a3, "ax_filteredArrayUsingBlock:", &__block_literal_global_321);
}

uint64_t __30__AXAsset_downloadableAssets___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isInstalled] ^ 1;
}

- (id)assetInfoDictionary
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(AXAsset *)self assetId];
  [v3 setObject:v4 forKeyedSubscript:@"AssetID"];

  uint64_t v5 = [(AXAsset *)self assetType];
  [v3 setObject:v5 forKeyedSubscript:@"AssetType"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXAsset contentVersion](self, "contentVersion"));
  [v3 setObject:v6 forKeyedSubscript:@"ContentVersion"];

  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXAsset compatibilityVersion](self, "compatibilityVersion"));
  [v3 setObject:v7 forKeyedSubscript:@"CompatibilityVersion"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXAsset formatVersion](self, "formatVersion"));
  [v3 setObject:v8 forKeyedSubscript:@"FormatVersion"];

  uint64_t v9 = [(AXAsset *)self properties];
  [v3 setObject:v9 forKeyedSubscript:@"UserInfo"];

  uint64_t v10 = [(AXAsset *)self downloadSize];
  [v3 setObject:v10 forKeyedSubscript:@"DownloadSize"];

  uint64_t v11 = [(AXAsset *)self unarchivedFileSize];
  [v3 setObject:v11 forKeyedSubscript:@"UnarchivedSize"];

  return v3;
}

- (void)copyLocally
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DC53F000, v0, v1, "Could not create clone directory for asset: %@. error: %@");
}

- (BOOL)isInstalled
{
  return self->_isInstalled;
}

- (BOOL)isDownloading
{
  return self->_isDownloading;
}

- (NSString)assetId
{
  return self->_assetId;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (unint64_t)contentVersion
{
  return self->_contentVersion;
}

- (unint64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (unint64_t)formatVersion
{
  return self->_formatVersion;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (void)setOriginalURL:(id)a3
{
}

- (NSURL)localCopyURL
{
  return self->_localCopyURL;
}

- (void)setLocalCopyURL:(id)a3
{
}

- (MAAsset)maAsset
{
  return self->_maAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maAsset, 0);
  objc_storeStrong((id *)&self->_localCopyURL, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_assetId, 0);
  objc_storeStrong((id *)&self->_cachedComputedOnDiskSize, 0);
}

@end