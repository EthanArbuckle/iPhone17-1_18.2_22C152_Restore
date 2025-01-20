@interface PHASEPreSpatialTapSource
+ (id)new;
- (AVAudioFormat)format;
- (NSString)identifier;
- (PHASEPreSpatialTapSource)init;
- (PHASEPreSpatialTapSource)initWithEngine:(id)a3 description:(id)a4;
- (PHASEPreSpatialTapSource)initWithEngine:(id)a3 identifier:(id)a4;
- (PHASEPreSpatialTapSource)initWithEngine:(id)a3 identifier:(id)a4 binding:(int64_t)a5;
- (PHASEPreSpatialTapSource)initWithEngine:(id)a3 identifier:(id)a4 binding:(int64_t)a5 tapType:(int64_t)a6;
- (void)addMixer:(id)a3;
- (void)addSource:(id)a3;
- (void)addSubmixId:(UniqueObjectId)a3;
- (void)dealloc;
- (void)removeMixer:(id)a3;
- (void)removeSource:(id)a3;
- (void)removeSubmixId:(UniqueObjectId)a3;
@end

@implementation PHASEPreSpatialTapSource

- (PHASEPreSpatialTapSource)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (PHASEPreSpatialTapSource)initWithEngine:(id)a3 identifier:(id)a4 binding:(int64_t)a5
{
  return [(PHASEPreSpatialTapSource *)self initWithEngine:a3 identifier:a4 binding:a5 tapType:0];
}

- (PHASEPreSpatialTapSource)initWithEngine:(id)a3 identifier:(id)a4 binding:(int64_t)a5 tapType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PHASEPreSpatialTapSource;
  v12 = [(PHASEPreSpatialTapSource *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_weakEngine, v10);
    objc_storeStrong((id *)&v13->_identifier, a4);
    v14 = (void *)[objc_alloc(MEMORY[0x263EF9328]) initWithLayoutTag:6553601];
    uint64_t v15 = [objc_alloc(MEMORY[0x263EF9388]) initWithCommonFormat:1 sampleRate:0 interleaved:v14 channelLayout:48000.0];
    format = v13->_format;
    v13->_format = (AVAudioFormat *)v15;

    uint64_t v17 = *(void *)([v10 implementation] + 424);
    uint64_t StringHashId = Phase::GetStringHashId((Phase *)v13->_identifier, v18);
    (*(void (**)(uint64_t, uint64_t, void, int64_t, int64_t))(*(void *)v17 + 16))(v17, StringHashId, 0, a5, a6);
    v20 = v13;
  }
  return v13;
}

- (PHASEPreSpatialTapSource)initWithEngine:(id)a3 identifier:(id)a4
{
  return [(PHASEPreSpatialTapSource *)self initWithEngine:a3 identifier:a4 binding:1];
}

- (PHASEPreSpatialTapSource)initWithEngine:(id)a3 description:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 uidString];
  v9 = -[PHASEPreSpatialTapSource initWithEngine:identifier:binding:tapType:](self, "initWithEngine:identifier:binding:tapType:", v6, v8, [v7 binding], objc_msgSend(v7, "type"));

  return v9;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakEngine);
  v4 = WeakRetained;
  if (WeakRetained && [WeakRetained implementation])
  {
    uint64_t v5 = *(void *)([v4 implementation] + 424);
    uint64_t StringHashId = Phase::GetStringHashId((Phase *)self->_identifier, v6);
    (*(void (**)(uint64_t, uint64_t, void))(*(void *)v5 + 24))(v5, StringHashId, 0);
  }

  v8.receiver = self;
  v8.super_class = (Class)PHASEPreSpatialTapSource;
  [(PHASEPreSpatialTapSource *)&v8 dealloc];
}

- (void)addSubmixId:(UniqueObjectId)a3
{
  unint64_t v3 = a3.mStorage[1];
  unint64_t v4 = a3.mStorage[0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakEngine);
  if (WeakRetained)
  {
    uint64_t v6 = *(void *)([WeakRetained implementation] + 424);
    uint64_t StringHashId = Phase::GetStringHashId((Phase *)self->_identifier, v7);
    (*(void (**)(uint64_t, uint64_t, void, unint64_t, unint64_t))(*(void *)v6 + 32))(v6, StringHashId, 0, v4, v3);
  }
}

- (void)removeSubmixId:(UniqueObjectId)a3
{
  unint64_t v3 = a3.mStorage[1];
  unint64_t v4 = a3.mStorage[0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakEngine);
  if (WeakRetained)
  {
    uint64_t v6 = *(void *)([WeakRetained implementation] + 424);
    uint64_t StringHashId = Phase::GetStringHashId((Phase *)self->_identifier, v7);
    (*(void (**)(uint64_t, uint64_t, void, unint64_t, unint64_t))(*(void *)v6 + 40))(v6, StringHashId, 0, v4, v3);
  }
}

- (void)addMixer:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = (Phase::Logger *)objc_loadWeakRetained((id *)&self->_weakEngine);
  uint64_t v6 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_15;
  }
  if (!v4 || ([v4 weakActionTreeObject], (id WeakRetained = *(Phase::Logger **)&v19[8]) == 0))
  {
    id v7 = 0;
    goto LABEL_11;
  }
  id v7 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)&v19[8]);
  if (v7) {
    objc_super v8 = *(Phase::ActionTreeObject **)v19;
  }
  else {
    objc_super v8 = 0;
  }
  std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v19[8]);
  if (!v8)
  {
LABEL_11:
    v18 = **(id **)(Phase::Logger::GetInstance(WeakRetained) + 432);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v19 = 136315394;
      *(void *)&v19[4] = "PHASETaps.mm";
      *(_WORD *)&v19[12] = 1024;
      *(_DWORD *)&v19[14] = 503;
      _os_log_impl(&dword_221E5E000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to get an Action Tree Object. The PHASEMixer will not be added to the Tap.", v19, 0x12u);
    }
    goto LABEL_13;
  }
  v9 = [v4 identifier];
  uint64_t StringHashId = Phase::GetStringHashId(v9, v10);
  uint64_t SubmixIdFromHashName = Phase::ActionTreeObject::FindSubmixIdFromHashName(v8, StringHashId);
  uint64_t v14 = v13;

  if (SubmixIdFromHashName | v14)
  {
    uint64_t v15 = *(void *)([(Phase::Logger *)v6 implementation] + 424);
    uint64_t v17 = Phase::GetStringHashId((Phase *)self->_identifier, v16);
    (*(void (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(*(void *)v15 + 32))(v15, v17, 0, SubmixIdFromHashName, v14);
  }
LABEL_13:
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
LABEL_15:
}

- (void)removeMixer:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = (Phase::Logger *)objc_loadWeakRetained((id *)&self->_weakEngine);
  uint64_t v6 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_15;
  }
  if (!v4 || ([v4 weakActionTreeObject], (id WeakRetained = *(Phase::Logger **)&v19[8]) == 0))
  {
    id v7 = 0;
    goto LABEL_11;
  }
  id v7 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)&v19[8]);
  if (v7) {
    objc_super v8 = *(Phase::ActionTreeObject **)v19;
  }
  else {
    objc_super v8 = 0;
  }
  std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v19[8]);
  if (!v8)
  {
LABEL_11:
    v18 = **(id **)(Phase::Logger::GetInstance(WeakRetained) + 432);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v19 = 136315394;
      *(void *)&v19[4] = "PHASETaps.mm";
      *(_WORD *)&v19[12] = 1024;
      *(_DWORD *)&v19[14] = 530;
      _os_log_impl(&dword_221E5E000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to get an Action Tree Object. The PHASEMixer will not be removed from the Tap.", v19, 0x12u);
    }
    goto LABEL_13;
  }
  v9 = [v4 identifier];
  uint64_t StringHashId = Phase::GetStringHashId(v9, v10);
  uint64_t SubmixIdFromHashName = Phase::ActionTreeObject::FindSubmixIdFromHashName(v8, StringHashId);
  uint64_t v14 = v13;

  if (SubmixIdFromHashName | v14)
  {
    uint64_t v15 = *(void *)([(Phase::Logger *)v6 implementation] + 424);
    uint64_t v17 = Phase::GetStringHashId((Phase *)self->_identifier, v16);
    (*(void (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(*(void *)v15 + 40))(v15, v17, 0, SubmixIdFromHashName, v14);
  }
LABEL_13:
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
LABEL_15:
}

- (void)addSource:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakEngine);
  if (WeakRetained)
  {
    id v6 = [v4 engine];

    if (WeakRetained == v6)
    {
      uint64_t v9 = *(void *)([WeakRetained implementation] + 424);
      uint64_t StringHashId = Phase::GetStringHashId((Phase *)self->_identifier, v10);
      (*(void (**)(uint64_t, uint64_t, void, uint64_t))(*(void *)v9 + 48))(v9, StringHashId, 0, [v4 geoEntityHandle]);
    }
    else
    {
      objc_super v8 = **(id **)(Phase::Logger::GetInstance(v7) + 432);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315394;
        uint64_t v13 = "PHASETaps.mm";
        __int16 v14 = 1024;
        int v15 = 543;
        _os_log_impl(&dword_221E5E000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d PHASEPreSpatialTapSource addSource failed: PHASESource is from a different engine instance", (uint8_t *)&v12, 0x12u);
      }
    }
  }
}

- (void)removeSource:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakEngine);
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = *(void *)([WeakRetained implementation] + 424);
    uint64_t StringHashId = Phase::GetStringHashId((Phase *)self->_identifier, v7);
    (*(void (**)(uint64_t, uint64_t, void, uint64_t))(*(void *)v6 + 56))(v6, StringHashId, 0, [v9 geoEntityHandle]);
  }
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_weakEngine);
}

@end