@interface PHASEAssetRegistry
+ (PHASEAssetRegistry)new;
- (BOOL)addAssetInternal:(id)a3 assetId:(unint64_t)a4 outError:(id *)a5;
- (BOOL)addAssetInternal:(id)a3 assetId:(unint64_t)a4 stringPoolBuilder:(void *)a5 outError:(id *)a6;
- (BOOL)removeAssetInternal:(id)a3;
- (NSDictionary)globalMetaParameters;
- (NSMutableDictionary)metaParameterDictionary;
- (PHASEAsset)assetForIdentifier:(NSString *)identifier;
- (PHASEAssetRegistry)init;
- (PHASEAssetRegistry)initWithEngine:(id)a3;
- (PHASEGlobalMetaParameterAsset)registerGlobalMetaParameter:(PHASEMetaParameterDefinition *)metaParameterDefinition error:(NSError *)error;
- (PHASESoundAsset)registerSoundAssetAtURL:(NSURL *)url identifier:(NSString *)identifier assetType:(PHASEAssetType)assetType channelLayout:(AVAudioChannelLayout *)channelLayout normalizationMode:(PHASENormalizationMode)normalizationMode error:(NSError *)error;
- (PHASESoundAsset)registerSoundAssetWithData:(NSData *)data identifier:(NSString *)identifier format:(AVAudioFormat *)format normalizationMode:(PHASENormalizationMode)normalizationMode error:(NSError *)error;
- (PHASESoundEventNodeAsset)registerSoundEventAssetWithRootNode:(PHASESoundEventNodeDefinition *)rootNode identifier:(NSString *)identifier error:(NSError *)error;
- (const)getActionTree:(unint64_t)a3;
- (const)getChannelMapping:(unint64_t)a3;
- (const)getSoundAssetInfo:(unint64_t)a3;
- (const)getString:(unint64_t)a3;
- (const)getStringEmpty:(unint64_t)a3;
- (id).cxx_construct;
- (id)assetInfoString:(int64_t)a3;
- (id)getAssetForUID:(id)a3;
- (id)getGlobalMetaParameter:(unint64_t)a3;
- (id)getMixerInformationForActionTreeWithUID:(id)a3;
- (id)getUniqueIdentifier;
- (id)makeMetaParameterFromDefinition:(id)a3;
- (id)makeSoundAssetWithURL:(id)a3 uid:(id)a4 assetType:(int64_t)a5 channelLayout:(id)a6 normalizationMode:(int64_t)a7 targetLKFS:(double)a8 ownerTask:(unsigned int)a9 outError:(id *)a10;
- (id)mixerInformationForActionTreeWithIdentifier:(id)a3;
- (id)registerActionTreeWithRootNode:(id)a3 uid:(id)a4 outError:(id *)a5;
- (id)registerJSONDataBundleWithURL:(id)a3 assetBaseURL:(id)a4 identifier:(id)a5 error:(id *)a6;
- (id)registerJSONDataBundleWithURL:(id)a3 assetBaseURL:(id)a4 uid:(id)a5 outError:(id *)a6;
- (id)registerSoundAssetAtURL:(id)a3 identifier:(id)a4 assetType:(int64_t)a5 channelLayout:(id)a6 normalizationMode:(int64_t)a7 ownerTask:(unsigned int)a8 error:(id *)a9;
- (id)registerSoundAssetAtURL:(id)a3 identifier:(id)a4 assetType:(int64_t)a5 channelLayout:(id)a6 normalizationMode:(int64_t)a7 targetLKFS:(id)a8 ownerTask:(unsigned int)a9 error:(id *)a10;
- (id)registerSoundAssetWithAudioFileData:(id)a3 identifier:(id)a4 assetType:(int64_t)a5 fileTypeHint:(unsigned int)a6 channelLayout:(id)a7 error:(id *)a8;
- (id)registerSoundAssetWithAudioFileData:(id)a3 identifier:(id)a4 assetType:(int64_t)a5 fileTypeHint:(unsigned int)a6 channelLayout:(id)a7 normalizationMode:(int64_t)a8 error:(id *)a9;
- (id)registerSoundAssetWithAudioFileData:(id)a3 identifier:(id)a4 assetType:(int64_t)a5 fileTypeHint:(unsigned int)a6 channelLayout:(id)a7 normalizationMode:(int64_t)a8 ownerTask:(unsigned int)a9 error:(id *)a10;
- (id)registerSoundAssetWithAudioFileData:(id)a3 identifier:(id)a4 assetType:(int64_t)a5 fileTypeHint:(unsigned int)a6 channelLayout:(id)a7 normalizationMode:(int64_t)a8 targetLKFS:(id)a9 ownerTask:(unsigned int)a10 error:(id *)a11;
- (id)registerSoundAssetWithAudioFileData:(id)a3 uid:(id)a4 assetType:(int64_t)a5 fileTypeHint:(unsigned int)a6 channelLayout:(id)a7 referenceGainDBSPL:(double)a8 outError:(id *)a9;
- (id)registerSoundAssetWithData:(id)a3 identifier:(id)a4 format:(id)a5 normalizationMode:(int64_t)a6 ownerTask:(unsigned int)a7 error:(id *)a8;
- (id)registerSoundAssetWithData:(id)a3 identifier:(id)a4 format:(id)a5 normalizationMode:(int64_t)a6 targetLKFS:(id)a7 ownerTask:(unsigned int)a8 error:(id *)a9;
- (id)registerSoundAssetWithData:(id)a3 uid:(id)a4 format:(id)a5 referenceGainDBSPL:(double)a6 outError:(id *)a7;
- (id)registerSoundAssetWithURL:(id)a3 uid:(id)a4 assetType:(int64_t)a5 channelLayout:(id)a6 referenceGainDBSPL:(double)a7 outError:(id *)a8;
- (id)registerSoundEventAssetWithRootNode:(id)a3 uid:(id)a4 error:(id *)a5;
- (uint64_t)unregisterAssetWithIdentifier:(uint64_t)a1 completion:;
- (unint64_t)sizeInBytes;
- (void)logAddAsset:(id)a3;
- (void)logRemoveAsset:(id)a3;
- (void)removeAll;
- (void)setMetaParameter:(id)a3 value:(double)a4 withTimeInterval:(double)a5;
- (void)setMetaParameter:(id)a3 value:(id)a4;
- (void)setMetaParameterDictionary:(id)a3;
- (void)unregisterAssetWithIdentifier:(NSString *)identifier completion:(void *)handler;
- (void)unregisterAssetWithIdentifier:(uint64_t)a1 completion:;
- (void)unregisterAssetWithIdentifier:completion:;
- (void)unregisterAssetWithUID:(id)a3;
- (void)unregisterAssetWithUID:(id)a3 completionHandler:(id)a4;
@end

@implementation PHASEAssetRegistry

- (NSDictionary)globalMetaParameters
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [NSDictionary dictionaryWithDictionary:v2->_metaParameterDictionary];
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (PHASEAssetRegistry)init
{
  return 0;
}

+ (PHASEAssetRegistry)new
{
  return 0;
}

- (unint64_t)sizeInBytes
{
  next = (id *)self->_assetLookup.__table_.__p1_.__value_.__next_;
  if (!next) {
    return 0;
  }
  unint64_t v3 = 0;
  do
  {
    v3 += [next[3] sizeInBytes];
    next = (id *)*next;
  }
  while (next);
  return v3;
}

- (PHASEAssetRegistry)initWithEngine:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHASEAssetRegistry;
  v5 = [(PHASEAssetRegistry *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_engine, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    metaParameterDictionary = v6->_metaParameterDictionary;
    v6->_metaParameterDictionary = v7;
  }
  return v6;
}

- (id)registerJSONDataBundleWithURL:(id)a3 assetBaseURL:(id)a4 uid:(id)a5 outError:(id *)a6
{
  v6 = [(PHASEAssetRegistry *)self registerJSONDataBundleWithURL:a3 assetBaseURL:a4 identifier:a5 error:a6];

  return v6;
}

- (id)registerJSONDataBundleWithURL:(id)a3 assetBaseURL:(id)a4 identifier:(id)a5 error:(id *)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v12 = (Phase *)a5;
  if (a6) {
    *a6 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v14 = WeakRetained;
  v22 = v11;
  if (WeakRetained && [WeakRetained implementation])
  {
    if (!v12)
    {
      v12 = [(PHASEAssetRegistry *)self getUniqueIdentifier];
    }
    unint64_t StringHashId = Phase::GetStringHashId(v12, v15);
    v17 = self;
    objc_sync_enter(v17);
    v18 = (Phase::Logger *)std::__hash_table<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::__unordered_map_hasher<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::hash<PHASETapType>,std::equal_to<PHASETapType>,true>,std::__unordered_map_equal<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::equal_to<PHASETapType>,std::hash<PHASETapType>,true>,std::allocator<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>>>::find<PHASETapType>(&v17->_assetLookup.__table_.__bucket_list_.__ptr_.__value_, StringHashId);
    if (v18)
    {
      v23 = v12;
      v19 = **(id **)Phase::Logger::GetInstance(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = v12;
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = "PHASEAssetRegistry.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 519;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = [(Phase *)v20 UTF8String];
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = [(Phase *)v20 UTF8String];
        _os_log_impl(&dword_221E5E000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d Asset %s already exists. Not loading databundle %s", buf, 0x26u);
      }

      if (a6)
      {
        *a6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346920804 userInfo:0];
      }
      objc_sync_exit(v17);
    }
    else
    {
      objc_sync_exit(v17);

      memset(buf, 0, 32);
      *(_DWORD *)&buf[32] = 1065353216;
      v23 = v12;
      Phase::MakeDataBundleFromJSONFile([(Phase *)v23 UTF8String], v10, a6, &v24);
      if (v24) {
        Phase::BuildStringPool();
      }
      std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)buf);
    }
  }
  else
  {
    v23 = v12;
    if (a6)
    {
      *a6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346920802 userInfo:0];
    }
  }

  return 0;
}

- (id)makeSoundAssetWithURL:(id)a3 uid:(id)a4 assetType:(int64_t)a5 channelLayout:(id)a6 normalizationMode:(int64_t)a7 targetLKFS:(double)a8 ownerTask:(unsigned int)a9 outError:(id *)a10
{
  v24[8] = *MEMORY[0x263EF8340];
  id v15 = a3;
  v16 = (Phase *)a4;
  id v17 = a6;
  if (a10) {
    *a10 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v19 = WeakRetained;
  if (WeakRetained && [WeakRetained implementation])
  {
    if (!v16)
    {
      v16 = [(PHASEAssetRegistry *)self getUniqueIdentifier];
    }
    Phase::GetStringHashId(v16, v20);
    if (!a5) {
      operator new();
    }
    if (a5 == 1) {
      operator new();
    }
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"API Misuse", @"Unhandled Asset Type: %lu", a5);
    v24[0] = 0;
    v21 = [[PHASESoundAsset alloc] initWithURL:v15 uid:v16 assetType:a5 normalizationMode:a7 soundAssetInfo:v24 assetRegistry:self];
    uint64_t v22 = v24[0];
    v24[0] = 0;
    if (v22) {
      (*(void (**)(uint64_t))(*(void *)v22 + 8))(v22);
    }
    if (!v21) {
      std::terminate();
    }
  }
  else if (a10)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346920802 userInfo:0];
    v21 = 0;
    *a10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)registerSoundAssetWithURL:(id)a3 uid:(id)a4 assetType:(int64_t)a5 channelLayout:(id)a6 referenceGainDBSPL:(double)a7 outError:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v16 = [NSNumber numberWithDouble:-12.0];
  LODWORD(v19) = *MEMORY[0x263EF8960];
  id v17 = [(PHASEAssetRegistry *)self registerSoundAssetAtURL:v13 identifier:v14 assetType:a5 channelLayout:v15 normalizationMode:1 targetLKFS:v16 ownerTask:v19 error:a8];

  return v17;
}

- (PHASESoundAsset)registerSoundAssetAtURL:(NSURL *)url identifier:(NSString *)identifier assetType:(PHASEAssetType)assetType channelLayout:(AVAudioChannelLayout *)channelLayout normalizationMode:(PHASENormalizationMode)normalizationMode error:(NSError *)error
{
  id v14 = url;
  id v15 = identifier;
  v16 = channelLayout;
  id v17 = [NSNumber numberWithDouble:-12.0];
  LODWORD(v20) = *MEMORY[0x263EF8960];
  v18 = [(PHASEAssetRegistry *)self registerSoundAssetAtURL:v14 identifier:v15 assetType:assetType channelLayout:v16 normalizationMode:normalizationMode targetLKFS:v17 ownerTask:v20 error:error];

  return (PHASESoundAsset *)v18;
}

- (id)registerSoundAssetAtURL:(id)a3 identifier:(id)a4 assetType:(int64_t)a5 channelLayout:(id)a6 normalizationMode:(int64_t)a7 ownerTask:(unsigned int)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  v18 = [NSNumber numberWithDouble:-12.0];
  LODWORD(v21) = a8;
  uint64_t v19 = [(PHASEAssetRegistry *)self registerSoundAssetAtURL:v15 identifier:v16 assetType:a5 channelLayout:v17 normalizationMode:a7 targetLKFS:v18 ownerTask:v21 error:a9];

  return v19;
}

- (id)registerSoundAssetAtURL:(id)a3 identifier:(id)a4 assetType:(int64_t)a5 channelLayout:(id)a6 normalizationMode:(int64_t)a7 targetLKFS:(id)a8 ownerTask:(unsigned int)a9 error:(id *)a10
{
  id v32 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a8;
  if (a10) {
    *a10 = 0;
  }
  uint64_t v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  uint64_t v22 = NSStringFromSelector(a2);
  [v19 doubleValue];
  double v24 = PHASEGetPropertyBounded<double>(v21, v22, v23, -100.0, 0.0);

  v25 = [(PHASEAssetRegistry *)self makeSoundAssetWithURL:v32 uid:v17 assetType:a5 channelLayout:v18 normalizationMode:a7 targetLKFS:a9 ownerTask:v24 outError:a10];
  uint64_t v26 = v25;
  if (v25
    && ([v25 identifier],
        v27 = (Phase *)objc_claimAutoreleasedReturnValue(),
        BOOL v29 = [(PHASEAssetRegistry *)self addAssetInternal:v26 assetId:Phase::GetStringHashId(v27, v28) outError:a10], v27, v29))
  {
    id v30 = v26;
  }
  else
  {
    id v30 = 0;
  }

  return v30;
}

- (id)registerSoundAssetWithData:(id)a3 uid:(id)a4 format:(id)a5 referenceGainDBSPL:(double)a6 outError:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = [NSNumber numberWithDouble:-12.0];
  id v15 = [(PHASEAssetRegistry *)self registerSoundAssetWithData:v11 identifier:v12 format:v13 normalizationMode:1 targetLKFS:v14 ownerTask:*MEMORY[0x263EF8960] error:a7];

  return v15;
}

- (PHASESoundAsset)registerSoundAssetWithData:(NSData *)data identifier:(NSString *)identifier format:(AVAudioFormat *)format normalizationMode:(PHASENormalizationMode)normalizationMode error:(NSError *)error
{
  id v12 = data;
  id v13 = identifier;
  id v14 = format;
  id v15 = [NSNumber numberWithDouble:-12.0];
  id v16 = [(PHASEAssetRegistry *)self registerSoundAssetWithData:v12 identifier:v13 format:v14 normalizationMode:normalizationMode targetLKFS:v15 ownerTask:*MEMORY[0x263EF8960] error:error];

  return (PHASESoundAsset *)v16;
}

- (id)registerSoundAssetWithData:(id)a3 identifier:(id)a4 format:(id)a5 normalizationMode:(int64_t)a6 ownerTask:(unsigned int)a7 error:(id *)a8
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = [NSNumber numberWithDouble:-12.0];
  id v18 = [(PHASEAssetRegistry *)self registerSoundAssetWithData:v14 identifier:v15 format:v16 normalizationMode:a6 targetLKFS:v17 ownerTask:v9 error:a8];

  return v18;
}

- (id)registerSoundAssetWithData:(id)a3 identifier:(id)a4 format:(id)a5 normalizationMode:(int64_t)a6 targetLKFS:(id)a7 ownerTask:(unsigned int)a8 error:(id *)a9
{
  id v25 = a3;
  id v14 = (Phase *)a4;
  id v15 = a5;
  id v16 = a7;
  if (a9)
  {
    *a9 = 0;
    if (!v15)
    {
      *a9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346920803 userInfo:0];
      goto LABEL_14;
    }
  }
  else if (!v15)
  {
    goto LABEL_14;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  id v18 = WeakRetained;
  if (WeakRetained && [WeakRetained implementation])
  {
    if (!v14)
    {
      id v14 = [(PHASEAssetRegistry *)self getUniqueIdentifier];
    }
    Phase::GetStringHashId(v14, v19);
    uint64_t v20 = (objc_class *)objc_opt_class();
    uint64_t v21 = NSStringFromClass(v20);
    uint64_t v22 = NSStringFromSelector(a2);
    [v16 doubleValue];
    PHASEGetPropertyBounded<double>(v21, v22, v23, -100.0, 0.0);

    operator new();
  }
  if (a9)
  {
    *a9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346920802 userInfo:0];
  }

LABEL_14:

  return 0;
}

- (id)registerSoundAssetWithAudioFileData:(id)a3 identifier:(id)a4 assetType:(int64_t)a5 fileTypeHint:(unsigned int)a6 channelLayout:(id)a7 error:(id *)a8
{
  uint64_t v10 = *(void *)&a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = [NSNumber numberWithDouble:-12.0];
  LODWORD(v20) = *MEMORY[0x263EF8960];
  id v18 = [(PHASEAssetRegistry *)self registerSoundAssetWithAudioFileData:v14 identifier:v15 assetType:a5 fileTypeHint:v10 channelLayout:v16 normalizationMode:0 targetLKFS:v17 ownerTask:v20 error:a8];

  return v18;
}

- (id)registerSoundAssetWithAudioFileData:(id)a3 uid:(id)a4 assetType:(int64_t)a5 fileTypeHint:(unsigned int)a6 channelLayout:(id)a7 referenceGainDBSPL:(double)a8 outError:(id *)a9
{
  uint64_t v11 = *(void *)&a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = [NSNumber numberWithDouble:-12.0];
  LODWORD(v21) = *MEMORY[0x263EF8960];
  id v19 = [(PHASEAssetRegistry *)self registerSoundAssetWithAudioFileData:v15 identifier:v16 assetType:a5 fileTypeHint:v11 channelLayout:v17 normalizationMode:1 targetLKFS:v18 ownerTask:v21 error:a9];

  return v19;
}

- (id)registerSoundAssetWithAudioFileData:(id)a3 identifier:(id)a4 assetType:(int64_t)a5 fileTypeHint:(unsigned int)a6 channelLayout:(id)a7 normalizationMode:(int64_t)a8 error:(id *)a9
{
  uint64_t v11 = *(void *)&a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = [NSNumber numberWithDouble:-12.0];
  LODWORD(v21) = *MEMORY[0x263EF8960];
  id v19 = [(PHASEAssetRegistry *)self registerSoundAssetWithAudioFileData:v15 identifier:v16 assetType:a5 fileTypeHint:v11 channelLayout:v17 normalizationMode:a8 targetLKFS:v18 ownerTask:v21 error:a9];

  return v19;
}

- (id)registerSoundAssetWithAudioFileData:(id)a3 identifier:(id)a4 assetType:(int64_t)a5 fileTypeHint:(unsigned int)a6 channelLayout:(id)a7 normalizationMode:(int64_t)a8 ownerTask:(unsigned int)a9 error:(id *)a10
{
  uint64_t v12 = *(void *)&a6;
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = [NSNumber numberWithDouble:-12.0];
  LODWORD(v22) = a9;
  uint64_t v20 = [(PHASEAssetRegistry *)self registerSoundAssetWithAudioFileData:v16 identifier:v17 assetType:a5 fileTypeHint:v12 channelLayout:v18 normalizationMode:a8 targetLKFS:v19 ownerTask:v22 error:a10];

  return v20;
}

- (id)registerSoundAssetWithAudioFileData:(id)a3 identifier:(id)a4 assetType:(int64_t)a5 fileTypeHint:(unsigned int)a6 channelLayout:(id)a7 normalizationMode:(int64_t)a8 targetLKFS:(id)a9 ownerTask:(unsigned int)a10 error:(id *)a11
{
  v33[8] = *MEMORY[0x263EF8340];
  id v32 = a3;
  id v17 = (Phase *)a4;
  id v30 = a7;
  id v31 = a9;
  if (a11) {
    *a11 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  id v19 = WeakRetained;
  if (WeakRetained && [WeakRetained implementation])
  {
    if (!v17)
    {
      id v17 = [(PHASEAssetRegistry *)self getUniqueIdentifier];
    }
    uint64_t StringHashId = Phase::GetStringHashId(v17, v20);
    uint64_t v21 = (objc_class *)objc_opt_class();
    uint64_t v22 = NSStringFromClass(v21);
    double v23 = NSStringFromSelector(a2);
    [v31 doubleValue];
    PHASEGetPropertyBounded<double>(v22, v23, v24, -100.0, 0.0);

    if (!a5) {
      operator new();
    }
    if (a5 == 1) {
      operator new();
    }
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"API Misuse", @"Unhandled Asset Type: %lu", a5);
    v33[0] = 0;
    uint64_t v26 = [[PHASESoundAsset alloc] initWithData:v32 uid:v17 normalizationMode:a8 soundAssetInfo:v33 assetRegistry:self];
    uint64_t v27 = v33[0];
    v33[0] = 0;
    if (v27) {
      (*(void (**)(uint64_t))(*(void *)v27 + 8))(v27);
    }
    if (v26)
    {
      if ([(PHASEAssetRegistry *)self addAssetInternal:v26 assetId:StringHashId outError:a11])
      {
        id v25 = v26;
LABEL_22:

        goto LABEL_23;
      }
    }
    else if (a11)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346920806 userInfo:0];
      id v25 = 0;
      *a11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    id v25 = 0;
    goto LABEL_22;
  }
  if (a11)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346920802 userInfo:0];
    id v25 = 0;
    *a11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v25 = 0;
  }
LABEL_23:

  return v25;
}

- (id)makeMetaParameterFromDefinition:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [PHASENumberMetaParameter alloc];
    v7 = [v5 identifier];
    v8 = [v5 value];
    [v8 doubleValue];
    double v10 = v9;
    [v5 minimum];
    double v12 = v11;
    [v5 maximum];
    uint64_t v14 = [(PHASENumberMetaParameter *)v6 initWithUID:v7 value:self rangeMin:v10 rangeMax:v12 delegate:v13];
LABEL_5:
    id v17 = (void *)v14;

    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v4;
    id v16 = [PHASEStringMetaParameter alloc];
    v7 = [v15 identifier];
    v8 = [v15 value];
    uint64_t v14 = [(PHASEStringMetaParameter *)v16 initWithUID:v7 value:v8 delegate:self];
    goto LABEL_5;
  }
  id v17 = 0;
LABEL_7:

  return v17;
}

- (PHASEGlobalMetaParameterAsset)registerGlobalMetaParameter:(PHASEMetaParameterDefinition *)metaParameterDefinition error:(NSError *)error
{
  v6 = metaParameterDefinition;
  v7 = v6;
  if (error) {
    *error = 0;
  }
  v8 = [(PHASEDefinition *)v6 identifier];
  Phase::GetStringHashId(v8, v9);

  double v10 = self;
  objc_sync_enter(v10);
  double v11 = [MEMORY[0x263EFF8C0] arrayWithObject:v7];
  double v12 = [(NSMutableDictionary *)v10->_metaParameterDictionary allKeys];
  double v13 = +[PHASEActionTreeBuilder getParamArray:v11 globalParamUIDs:v12 outError:error];

  objc_sync_exit(v10);
  if (v13)
  {
    memset(v16, 0, sizeof(v16));
    int v17 = 1065353216;
    Phase::MakeGlobalMetaParameters(v13, (uint64_t)v16, error, &v15);
    if (v15) {
      operator new();
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v16);
  }

  return (PHASEGlobalMetaParameterAsset *)0;
}

- (id)registerActionTreeWithRootNode:(id)a3 uid:(id)a4 outError:(id *)a5
{
  id v5 = [(PHASEAssetRegistry *)self registerSoundEventAssetWithRootNode:a3 uid:a4 error:a5];

  return v5;
}

- (id)registerSoundEventAssetWithRootNode:(id)a3 uid:(id)a4 error:(id *)a5
{
  id v5 = [(PHASEAssetRegistry *)self registerSoundEventAssetWithRootNode:a3 identifier:a4 error:a5];

  return v5;
}

- (PHASESoundEventNodeAsset)registerSoundEventAssetWithRootNode:(PHASESoundEventNodeDefinition *)rootNode identifier:(NSString *)identifier error:(NSError *)error
{
  v8 = rootNode;
  double v9 = identifier;
  if (error) {
    *error = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  double v11 = WeakRetained;
  if (WeakRetained && [WeakRetained implementation])
  {
    if (!v9)
    {
      double v9 = [(PHASEAssetRegistry *)self getUniqueIdentifier];
    }
    Phase::GetStringHashId((Phase *)v9, v12);
    double v13 = objc_alloc_init(PHASEActionTreeBuilder);
    uint64_t v14 = self;
    objc_sync_enter(v14);
    uint64_t v15 = [(NSMutableDictionary *)v14->_metaParameterDictionary allKeys];
    objc_sync_exit(v14);

    id v16 = [MEMORY[0x263EFF8C0] arrayWithObject:v8];
    int v17 = [(PHASEActionTreeBuilder *)v13 createParseableDictionaryWithUID:v9 rootNodes:v16 globalParamUIDs:v15 assetRegistry:v14 outError:error];

    if (v17)
    {
      memset(v19, 0, sizeof(v19));
      int v20 = 1065353216;
      Phase::MakeActionTree(v17, (uint64_t)v19, objc_alloc_init(ActionTreeProgrammaticDetails), error);
    }
  }
  else if (error)
  {
    *error = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346920802 userInfo:0];
  }

  return (PHASESoundEventNodeAsset *)0;
}

- (id)getUniqueIdentifier
{
  v2 = [MEMORY[0x263F08C38] UUID];
  unint64_t v3 = [v2 UUIDString];

  return v3;
}

- (void)setMetaParameter:(id)a3 value:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v8 = WeakRetained;
  if (WeakRetained && [WeakRetained implementation])
  {
    uint64_t v9 = Phase::Controller::TaskManager::GetService<Phase::GlobalMetaParameterManager>((Phase::Logger *)([v8 implementation] + 48), 6);
    double v10 = (unsigned char *)[v6 UTF8String];
    if (v10 && (unsigned int v11 = *v10, *v10))
    {
      uint64_t v12 = 0xCBF29CE484222325;
      double v13 = v10 + 1;
      do
      {
        uint64_t v12 = 0x100000001B3 * (v12 ^ v11);
        unsigned int v14 = *v13++;
        unsigned int v11 = v14;
      }
      while (v14);
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v15 = (unsigned char *)[v20 UTF8String];
    if (v15 && (unsigned int v16 = *v15, *v15))
    {
      uint64_t v17 = 0xCBF29CE484222325;
      id v18 = v15 + 1;
      do
      {
        uint64_t v17 = 0x100000001B3 * (v17 ^ v16);
        unsigned int v19 = *v18++;
        unsigned int v16 = v19;
      }
      while (v19);
    }
    else
    {
      uint64_t v17 = 0;
    }
    Phase::Commandable<128,Phase::LockFreeQueueMPSC>::CallAsync<Phase::GlobalMetaParameterManager,BOOL,unsigned long long,Phase::InputMetaParamType,Phase::MetaParamValue,double>(v9, v17, 2, v12, 0.0);
  }
}

- (void)setMetaParameter:(id)a3 value:(double)a4 withTimeInterval:(double)a5
{
  id v16 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v9 = WeakRetained;
  if (WeakRetained && [WeakRetained implementation])
  {
    uint64_t v10 = Phase::Controller::TaskManager::GetService<Phase::GlobalMetaParameterManager>((Phase::Logger *)([v9 implementation] + 48), 6);
    unsigned int v11 = (unsigned char *)[v16 UTF8String];
    if (v11 && (unsigned int v12 = *v11, *v11))
    {
      double v13 = v11 + 1;
      uint64_t v14 = 0xCBF29CE484222325;
      do
      {
        uint64_t v14 = 0x100000001B3 * (v14 ^ v12);
        unsigned int v15 = *v13++;
        unsigned int v12 = v15;
      }
      while (v15);
    }
    else
    {
      uint64_t v14 = 0;
    }
    Phase::Commandable<128,Phase::LockFreeQueueMPSC>::CallAsync<Phase::GlobalMetaParameterManager,BOOL,unsigned long long,Phase::InputMetaParamType,Phase::MetaParamValue,double>(v10, v14, 1, *(uint64_t *)&a4, a5);
  }
}

- (id)getAssetForUID:(id)a3
{
  unint64_t v3 = [(PHASEAssetRegistry *)self assetForIdentifier:a3];

  return v3;
}

- (PHASEAsset)assetForIdentifier:(NSString *)identifier
{
  id v4 = identifier;
  id v5 = self;
  objc_sync_enter(v5);
  unint64_t StringHashId = Phase::GetStringHashId((Phase *)v4, v6);
  v8 = std::__hash_table<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::__unordered_map_hasher<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::hash<PHASETapType>,std::equal_to<PHASETapType>,true>,std::__unordered_map_equal<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::equal_to<PHASETapType>,std::hash<PHASETapType>,true>,std::allocator<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>>>::find<PHASETapType>(&v5->_assetLookup.__table_.__bucket_list_.__ptr_.__value_, StringHashId);
  if (v8) {
    id v9 = (id)v8[3];
  }
  else {
    id v9 = 0;
  }
  objc_sync_exit(v5);

  return (PHASEAsset *)v9;
}

- (void)unregisterAssetWithIdentifier:(NSString *)identifier completion:(void *)handler
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = identifier;
  v7 = handler;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  id v9 = WeakRetained;
  if (WeakRetained && [WeakRetained implementation])
  {
    uint64_t v10 = [(PHASEAssetRegistry *)self assetForIdentifier:v6];
    if (v10)
    {
      if (atomic_load((unint64_t *)([v9 implementation] + 24)))
      {
        uint64_t v12 = Phase::Controller::TaskManager::GetService<Phase::Controller::AssetUnloader>((Phase::Logger *)([v9 implementation] + 48), 12);
        id v13 = v10;
        uint64_t v14 = _Block_copy(v7);
        uint64_t v15 = **(void **)(v12 + 8);
        unint64_t v23 = 0;
        BOOL v22 = 1;
        id v16 = (void *)Phase::LockFreeQueueMPSC::GetWriteBuffer((atomic_uchar *)v15, 32, &v23, &v22);
        if (!v16)
        {
          Instance = (Phase::Logger *)Phase::Logger::GetInstance(0);
          Phase::Logger::DumpTailspinWithThrottleAsync(Instance, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
          id v20 = **(id **)(v15 + 48);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            id v25 = "CommandQueue.hpp";
            __int16 v26 = 1024;
            int v27 = 100;
            _os_log_impl(&dword_221E5E000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; b"
              "uffer is full, unable to grow.\"",
              buf,
              0x12u);
          }
          exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
        }
        if (v22)
        {
          uint64_t v17 = **(id **)(v15 + 48);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            id v25 = "CommandQueue.hpp";
            __int16 v26 = 1024;
            int v27 = 89;
            __int16 v28 = 2048;
            unint64_t v29 = v23;
            __int16 v30 = 2048;
            uint64_t v31 = 32;
            _os_log_impl(&dword_221E5E000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
          }
        }
        void *v16 = &unk_26D478D80;
        v16[1] = v12;
        _OWORD v16[2] = v13;
        v16[3] = v14;
        Phase::LockFreeQueueSPSC::CommitBytes((atomic_uchar *)v15, 32);
        atomic_store(0, (unsigned __int8 *)(v15 + 40));

        goto LABEL_15;
      }
      [(PHASEAssetRegistry *)self removeAssetInternal:v10];
      if (v7) {
        goto LABEL_14;
      }
    }
    else if (v7)
    {
      id v18 = **(id **)(Phase::Logger::GetInstance(0) + 432);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v25 = "PHASEAssetRegistry.mm";
        __int16 v26 = 1024;
        int v27 = 1601;
        _os_log_impl(&dword_221E5E000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Bad parameters when unregistering asset with identifier, aseet is nil.", buf, 0x12u);
      }
LABEL_14:
      (*((void (**)(void *, BOOL))v7 + 2))(v7, v10 != 0);
    }
LABEL_15:
  }
}

- (void)unregisterAssetWithUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PHASEAssetRegistry_unregisterAssetWithUID_completionHandler___block_invoke;
  aBlock[3] = &unk_2645F76F0;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = _Block_copy(aBlock);
  [(PHASEAssetRegistry *)self unregisterAssetWithIdentifier:v8 completion:v9];
}

uint64_t __63__PHASEAssetRegistry_unregisterAssetWithUID_completionHandler___block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (void)unregisterAssetWithUID:(id)a3
{
}

- (id)getMixerInformationForActionTreeWithUID:(id)a3
{
  unint64_t v3 = [(PHASEAssetRegistry *)self mixerInformationForActionTreeWithIdentifier:a3];

  return v3;
}

- (id)mixerInformationForActionTreeWithIdentifier:(id)a3
{
  uint64_t v15 = (Phase *)a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = [(PHASEAssetRegistry *)self getActionTree:Phase::GetStringHashId(v15, v5)];
  id v7 = v6;
  if (v6 && v6[24])
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = *((void *)v7 + 13);
      id v11 = [(PHASEAssetRegistry *)self getStringEmpty:*(void *)(v10 + v8)];
      if (v11)
      {
        uint64_t v12 = [NSString stringWithUTF8String:v11];
        id v13 = objc_alloc_init(PHASEMixerInformation);
        [(PHASEMixerInformation *)v13 setMixerType:*(void *)(v10 + v8 + 8)];
        [(PHASEMixerInformation *)v13 setIdentifier:v12];
        [v4 addObject:v13];
      }
      ++v9;
      v8 += 5944;
    }
    while (v9 < v7[24]);
  }

  return v4;
}

- (const)getString:(unint64_t)a3
{
  uint64_t result = [(PHASEAssetRegistry *)self getStringEmpty:a3];
  if (!result) {
    return "<invalid>";
  }
  return result;
}

- (const)getStringEmpty:(unint64_t)a3
{
  p_p1 = &self->_stringPools.__table_.__p1_;
  while (1)
  {
    p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::unique_ptr<Phase::StringPool>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::unique_ptr<Phase::StringPool>>, void *>>> *)p_p1->__value_.__next_;
    if (!p_p1) {
      break;
    }
    uint64_t result = (const char *)Phase::StringPool::GetString((Phase::StringPool *)p_p1[3].__value_.__next_, a3);
    if (result) {
      return result;
    }
  }
  return 0;
}

- (BOOL)addAssetInternal:(id)a3 assetId:(unint64_t)a4 outError:(id *)a5
{
  id v34 = a3;
  long long v36 = 0u;
  long long v37 = 0u;
  float v38 = 1.0;
  id v31 = [v34 identifier];
  id v5 = (char *)[v31 UTF8String];
  id v6 = operator new(0x28uLL);
  v39 = v6;
  v40 = &v37;
  char v41 = 0;
  void *v6 = 0;
  v6[1] = 0;
  std::string::basic_string[abi:ne180100]<0>(v6 + 2, v5);
  char v41 = 1;
  v6[1] = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&v37 + 8, (uint64_t)(v6 + 2));
  id v7 = (void **)v39;
  uint64_t v8 = (unsigned __int8 *)(v39 + 2);
  unint64_t v9 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&v37 + 8, (uint64_t)(v39 + 2));
  v7[1] = (void *)v9;
  if (!*((void *)&v36 + 1)) {
    goto LABEL_17;
  }
  unint64_t v10 = v9;
  uint8x8_t v11 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v36 + 8));
  v11.i16[0] = vaddlv_u8(v11);
  unint64_t v12 = v11.u32[0];
  if (v11.u32[0] > 1uLL)
  {
    unint64_t v13 = v9;
    if (*((void *)&v36 + 1) <= v9) {
      unint64_t v13 = v9 % *((void *)&v36 + 1);
    }
  }
  else
  {
    unint64_t v13 = (*((void *)&v36 + 1) - 1) & v9;
  }
  uint64_t v14 = *(unsigned __int8 ***)(v36 + 8 * v13);
  if (!v14 || (uint64_t v15 = *v14) == 0)
  {
LABEL_17:
    float v17 = (float)(unint64_t)(*((void *)&v37 + 1) + 1);
    if (!*((void *)&v36 + 1) || (float)(v38 * (float)*((unint64_t *)&v36 + 1)) < v17)
    {
      BOOL v18 = 1;
      if (*((void *)&v36 + 1) >= 3uLL) {
        BOOL v18 = (*((void *)&v36 + 1) & (*((void *)&v36 + 1) - 1)) != 0;
      }
      unint64_t v19 = v18 | (2 * *((void *)&v36 + 1));
      unint64_t v20 = vcvtps_u32_f32(v17 / v38);
      if (v19 <= v20) {
        size_t v21 = v20;
      }
      else {
        size_t v21 = v19;
      }
      std::__hash_table<std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>,std::__unordered_map_hasher<Phase::SpatialCategory,std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>,std::hash<Phase::SpatialCategory>,std::equal_to<Phase::SpatialCategory>,true>,std::__unordered_map_equal<Phase::SpatialCategory,std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>,std::equal_to<Phase::SpatialCategory>,std::hash<Phase::SpatialCategory>,true>,std::allocator<std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>>>::__rehash<true>((uint64_t)&v36, v21);
    }
    unint64_t v22 = *((void *)&v36 + 1);
    unint64_t v23 = (unint64_t)v7[1];
    uint8x8_t v24 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v36 + 8));
    v24.i16[0] = vaddlv_u8(v24);
    if (v24.u32[0] > 1uLL)
    {
      id v25 = v34;
      __int16 v26 = v31;
      if (v23 >= *((void *)&v36 + 1)) {
        v23 %= *((void *)&v36 + 1);
      }
    }
    else
    {
      v23 &= *((void *)&v36 + 1) - 1;
      id v25 = v34;
      __int16 v26 = v31;
    }
    int v27 = *(void ***)(v36 + 8 * v23);
    if (v27)
    {
      _DWORD *v7 = *v27;
    }
    else
    {
      _DWORD *v7 = (void *)v37;
      *(void *)&long long v37 = v7;
      *(void *)(v36 + 8 * v23) = &v37;
      if (!*v7)
      {
LABEL_38:
        ++*((void *)&v37 + 1);
        goto LABEL_39;
      }
      unint64_t v28 = *((void *)*v7 + 1);
      if (v24.u32[0] > 1uLL)
      {
        if (v28 >= v22) {
          v28 %= v22;
        }
      }
      else
      {
        v28 &= v22 - 1;
      }
      int v27 = (void **)(v36 + 8 * v28);
    }
    Phase *v27 = v7;
    goto LABEL_38;
  }
  while (1)
  {
    unint64_t v16 = *((void *)v15 + 1);
    if (v16 == v10) {
      break;
    }
    if (v12 > 1)
    {
      if (v16 >= *((void *)&v36 + 1)) {
        v16 %= *((void *)&v36 + 1);
      }
    }
    else
    {
      v16 &= *((void *)&v36 + 1) - 1;
    }
    if (v16 != v13) {
      goto LABEL_17;
    }
LABEL_16:
    uint64_t v15 = *(unsigned __int8 **)v15;
    if (!v15) {
      goto LABEL_17;
    }
  }
  if ((std::equal_to<std::string>::operator()[abi:ne180100]((uint64_t)&v38, v15 + 16, v8) & 1) == 0) {
    goto LABEL_16;
  }
  v39 = 0;
  id v25 = v34;
  __int16 v26 = v31;
  if (v7) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::string,void *>>>::operator()[abi:ne180100]((uint64_t)&v40, v7);
  }
LABEL_39:

  BOOL v29 = [(PHASEAssetRegistry *)self addAssetInternal:v25 assetId:a4 stringPoolBuilder:&v36 outError:a5];
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&v36);

  return v29;
}

- (void)logAddAsset:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = (Phase::Logger *)a3;
  id v5 = **(id **)Phase::Logger::GetInstance(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(Phase::Logger *)v4 identifier];
    uint64_t v7 = [v6 UTF8String];
    uint64_t v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v9 = objc_claimAutoreleasedReturnValue();
    int v10 = 136316418;
    uint8x8_t v11 = "PHASEAssetRegistry.mm";
    __int16 v12 = 1024;
    int v13 = 1731;
    __int16 v14 = 2080;
    uint64_t v15 = v7;
    __int16 v16 = 2080;
    uint64_t v17 = [v9 UTF8String];
    __int16 v18 = 2048;
    double v19 = (float)((float)(unint64_t)[(Phase::Logger *)v4 sizeInBytes] / 1000000.0);
    __int16 v20 = 2048;
    double v21 = (float)((float)[(PHASEAssetRegistry *)self sizeInBytes] / 1000000.0);
    _os_log_impl(&dword_221E5E000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Added Asset with name: %s, type: %s, size: %1.3f MB (total size: %1.3f MB)", (uint8_t *)&v10, 0x3Au);
  }
}

- (void)logRemoveAsset:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v7 = (Phase::Logger *)[v4 sizeInBytes];
  uint64_t v8 = **(id **)Phase::Logger::GetInstance(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v4 identifier];
    int v10 = 136316418;
    uint8x8_t v11 = "PHASEAssetRegistry.mm";
    __int16 v12 = 1024;
    int v13 = 1743;
    __int16 v14 = 2080;
    uint64_t v15 = [v9 UTF8String];
    __int16 v16 = 2080;
    uint64_t v17 = [v6 UTF8String];
    __int16 v18 = 2048;
    double v19 = (float)((float)(unint64_t)v7 / 1000000.0);
    __int16 v20 = 2048;
    double v21 = (float)((float)[(PHASEAssetRegistry *)self sizeInBytes] / 1000000.0);
    _os_log_impl(&dword_221E5E000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Removed Asset with name: %s, type: %s, size: %1.3f MB (total size: %1.3f MB)", (uint8_t *)&v10, 0x3Au);
  }
}

- (BOOL)addAssetInternal:(id)a3 assetId:(unint64_t)a4 stringPoolBuilder:(void *)a5 outError:(id *)a6
{
  id v7 = a3;
  if (a6) {
    *a6 = 0;
  }
  Phase::BuildStringPool();
}

- (BOOL)removeAssetInternal:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 owningDataBundleIdentifier];

    if (v6)
    {
      uint64_t v8 = (PHASEAssetRegistry *)**(id **)(Phase::Logger::GetInstance(v7) + 432);
      if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR))
      {
        id v9 = [v5 identifier];
        int v10 = [v5 owningDataBundleIdentifier];
        int v33 = 136315906;
        id v34 = "PHASEAssetRegistry.mm";
        __int16 v35 = 1024;
        int v36 = 1823;
        __int16 v37 = 2112;
        float v38 = v9;
        __int16 v39 = 2112;
        v40 = v10;
        _os_log_impl(&dword_221E5E000, &v8->super, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Trying to remove asset %@ that is owned by a data bundle %@.  Remove the data bundle to remove the asset.  Ignoring.", (uint8_t *)&v33, 0x26u);
      }
      goto LABEL_5;
    }
    uint64_t v8 = self;
    objc_sync_enter(v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (![v5 getDataBundle]) {
        std::terminate();
      }
      uint64_t next = (uint64_t)v8->_assetLookup.__table_.__p1_.__value_.__next_;
      while (next)
      {
        int v13 = [*(id *)(next + 24) owningDataBundleIdentifier];
        __int16 v14 = [v5 identifier];

        if (v13 == v14)
        {
          id v15 = *(id *)(next + 24);
          uint64_t next = std::__hash_table<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>>>::erase(&v8->_assetLookup.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)next);
          [(PHASEAssetRegistry *)v8 logRemoveAsset:v15];
        }
        else
        {
          uint64_t next = *(void *)next;
        }
      }
      id v25 = [v5 identifier];
      unint64_t StringHashId = Phase::GetStringHashId(v25, v26);

      std::__hash_table<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>>>::__erase_unique<unsigned long long>(&v8->_assetLookup.__table_.__bucket_list_.__ptr_.__value_, StringHashId);
      std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>>>::__erase_unique<unsigned long long>(&v8->_stringPools.__table_.__bucket_list_.__ptr_.__value_, StringHashId);
      [(PHASEAssetRegistry *)v8 logRemoveAsset:v5];
      goto LABEL_22;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      metaParameterDictionary = v8->_metaParameterDictionary;
      uint64_t v17 = [v5 identifier];
      __int16 v18 = [(NSMutableDictionary *)metaParameterDictionary objectForKeyedSubscript:v17];

      if (v18)
      {
        [v18 setDelegate:0];
        double v19 = v8->_metaParameterDictionary;
        __int16 v20 = [v5 identifier];
        [(NSMutableDictionary *)v19 removeObjectForKey:v20];
      }
      double v21 = [v5 identifier];
      unint64_t v23 = Phase::GetStringHashId(v21, v22);

      uint8x8_t v24 = std::__hash_table<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::__unordered_map_hasher<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::hash<PHASETapType>,std::equal_to<PHASETapType>,true>,std::__unordered_map_equal<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::equal_to<PHASETapType>,std::hash<PHASETapType>,true>,std::allocator<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>>>::find<PHASETapType>(&v8->_assetLookup.__table_.__bucket_list_.__ptr_.__value_, v23);
      if (v24)
      {
        std::__hash_table<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>>>::erase(&v8->_assetLookup.__table_.__bucket_list_.__ptr_.__value_, v24);
        std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>>>::__erase_unique<unsigned long long>(&v8->_stringPools.__table_.__bucket_list_.__ptr_.__value_, v23);
        [(PHASEAssetRegistry *)v8 logRemoveAsset:v5];

LABEL_22:
        objc_sync_exit(v8);
        BOOL v11 = 1;
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v28 = [v5 identifier];
      unint64_t v30 = Phase::GetStringHashId(v28, v29);

      id v31 = std::__hash_table<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::__unordered_map_hasher<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::hash<PHASETapType>,std::equal_to<PHASETapType>,true>,std::__unordered_map_equal<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::equal_to<PHASETapType>,std::hash<PHASETapType>,true>,std::allocator<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>>>::find<PHASETapType>(&v8->_assetLookup.__table_.__bucket_list_.__ptr_.__value_, v30);
      if (v31)
      {
        std::__hash_table<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>>>::erase(&v8->_assetLookup.__table_.__bucket_list_.__ptr_.__value_, v31);
        std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>>>::__erase_unique<unsigned long long>(&v8->_stringPools.__table_.__bucket_list_.__ptr_.__value_, v30);
        [(PHASEAssetRegistry *)v8 logRemoveAsset:v5];
        goto LABEL_22;
      }
    }
    objc_sync_exit(v8);
LABEL_5:
    BOOL v11 = 0;
LABEL_23:

    goto LABEL_24;
  }
  BOOL v11 = 0;
LABEL_24:

  return v11;
}

- (void)removeAll
{
  uint64_t next = (uint64_t *)self->_assetLookup.__table_.__p1_.__value_.__next_;
  if (next)
  {
    p_assetLookup = &self->_assetLookup;
    do
    {
      while (1)
      {
        while (1)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }
          uint64_t next = (uint64_t *)*next;
          if (!next) {
            goto LABEL_10;
          }
        }
        if (![(PHASEAssetRegistry *)self removeAssetInternal:next[3]]) {
          break;
        }
        uint64_t next = (uint64_t *)self->_assetLookup.__table_.__p1_.__value_.__next_;
        if (!next) {
          goto LABEL_10;
        }
      }
      uint64_t next = (uint64_t *)std::__hash_table<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>>>::erase(p_assetLookup, next);
    }
    while (next);
LABEL_10:
    while (1)
    {
      id v5 = (uint64_t *)self->_assetLookup.__table_.__p1_.__value_.__next_;
      if (!v5) {
        break;
      }
      while (![(PHASEAssetRegistry *)self removeAssetInternal:v5[3]])
      {
        id v5 = (uint64_t *)std::__hash_table<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>>>::erase(p_assetLookup, v5);
        if (!v5) {
          return;
        }
      }
    }
  }
}

- (id)assetInfoString:(int64_t)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  for (i = (id *)self->_assetLookup.__table_.__p1_.__value_.__next_; i; i = (id *)*i)
  {
    id v7 = objc_alloc_init(AssetInfo);
    uint64_t v8 = [i[3] identifier];
    identifier = v7->identifier;
    v7->identifier = (NSString *)v8;

    int v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    type = v7->type;
    v7->type = (NSString *)v11;

    v7->sizeInBytes = [i[3] sizeInBytes];
    [v5 addObject:v7];
  }
  if (a3 == 1935753580)
  {
    int v13 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"identifier" ascending:1 selector:sel_caseInsensitiveCompare_];
    v29[0] = v13;
    __int16 v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
    [v5 sortUsingDescriptors:v14];
  }
  else
  {
    if (a3 != 1935758451) {
      goto LABEL_8;
    }
    int v13 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"type" ascending:1];
    __int16 v14 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"sizeInBytes" ascending:0];
    v28[0] = v13;
    v28[1] = v14;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
    [v5 sortUsingDescriptors:v15];
  }
LABEL_8:
  id v16 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v16 appendString:@"\n=== Asset Registry ===\n"];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v17 = v5;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v17);
        }
        double v21 = [NSString stringWithFormat:@"asset name: %@, type: %@, size: %1.3f MB\n", *(void *)(*(void *)(*((void *)&v23 + 1) + 8 * j) + 8), *(void *)(*(void *)(*((void *)&v23 + 1) + 8 * j) + 16), (float)((float)*(unint64_t *)(*(void *)(*((void *)&v23 + 1) + 8 * j) + 24) / 1000000.0)];
        [v16 appendString:v21];
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v18);
  }

  [v16 appendString:@"\n"];

  return v16;
}

- (const)getSoundAssetInfo:(unint64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = std::__hash_table<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::__unordered_map_hasher<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::hash<PHASETapType>,std::equal_to<PHASETapType>,true>,std::__unordered_map_equal<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::equal_to<PHASETapType>,std::hash<PHASETapType>,true>,std::allocator<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>>>::find<PHASETapType>(&v4->_assetLookup.__table_.__bucket_list_.__ptr_.__value_, a3);
  if (v5)
  {
    id v6 = (id)v5[3];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = (const SoundAssetInfo *)[v6 getAssetInfo];
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  objc_sync_exit(v4);

  return v7;
}

- (const)getActionTree:(unint64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = std::__hash_table<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::__unordered_map_hasher<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::hash<PHASETapType>,std::equal_to<PHASETapType>,true>,std::__unordered_map_equal<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::equal_to<PHASETapType>,std::hash<PHASETapType>,true>,std::allocator<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>>>::find<PHASETapType>(&v4->_assetLookup.__table_.__bucket_list_.__ptr_.__value_, a3);
  if (v5)
  {
    id v6 = (id)v5[3];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = (const void *)[v6 getActionTree];
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  objc_sync_exit(v4);

  return v7;
}

- (const)getChannelMapping:(unint64_t)a3
{
  unint64_t v3 = self;
  objc_sync_enter(v3);
  objc_sync_exit(v3);

  return 0;
}

- (id)getGlobalMetaParameter:(unint64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = std::__hash_table<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::__unordered_map_hasher<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::hash<PHASETapType>,std::equal_to<PHASETapType>,true>,std::__unordered_map_equal<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::equal_to<PHASETapType>,std::hash<PHASETapType>,true>,std::allocator<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>>>::find<PHASETapType>(&v4->_assetLookup.__table_.__bucket_list_.__ptr_.__value_, a3);
  if (v5)
  {
    id v6 = (id)v5[3];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  objc_sync_exit(v4);

  return v7;
}

- (NSMutableDictionary)metaParameterDictionary
{
  return self->_metaParameterDictionary;
}

- (void)setMetaParameterDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaParameterDictionary, 0);
  uint64_t next = self->_stringPools.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      id v4 = (void *)*next;
      uint64_t v5 = next[3];
      next[3] = 0;
      if (v5) {
        std::default_delete<Phase::StringPool>::operator()[abi:ne180100]((uint64_t)(next + 3), v5);
      }
      operator delete(next);
      uint64_t next = v4;
    }
    while (v4);
  }
  value = self->_stringPools.__table_.__bucket_list_.__ptr_.__value_;
  self->_stringPools.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,void({block_pointer} {__strong})(AudioTimeStamp const*,unsigned int)>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,void({block_pointer} {__strong})(AudioTimeStamp const*,unsigned int)>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,void({block_pointer} {__strong})(AudioTimeStamp const*,unsigned int)>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,void({block_pointer} {__strong})(AudioTimeStamp const*,unsigned int)>>>::~__hash_table((uint64_t)&self->_assetLookup);

  objc_destroyWeak((id *)&self->_engine);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  return self;
}

- (uint64_t)unregisterAssetWithIdentifier:(uint64_t)a1 completion:
{
  return a1;
}

- (void)unregisterAssetWithIdentifier:(uint64_t)a1 completion:
{
  JUMPOUT(0x223C938A0);
}

- (void)unregisterAssetWithIdentifier:completion:
{
}

@end