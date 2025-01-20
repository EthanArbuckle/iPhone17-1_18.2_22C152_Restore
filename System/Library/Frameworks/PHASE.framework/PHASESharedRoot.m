@interface PHASESharedRoot
- (AVAudioSession)session;
- (PHASESharedRoot)initWithEngine:(id)a3;
- (PHASESharedRoot)initWithEngine:(id)a3 entityType:(unsigned int)a4 shapes:(id)a5;
- (PHASESharedRoot)initWithEngine:(id)a3 session:(id)a4 sessionUUID:(id)a5;
- (PHASESharedRoot)initWithEngine:(id)a3 sessionUUID:(id)a4;
- (void)dealloc;
- (void)setTransform:(void *)a1;
@end

@implementation PHASESharedRoot

- (PHASESharedRoot)initWithEngine:(id)a3
{
  return 0;
}

- (PHASESharedRoot)initWithEngine:(id)a3 entityType:(unsigned int)a4 shapes:(id)a5
{
  return 0;
}

- (PHASESharedRoot)initWithEngine:(id)a3 sessionUUID:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v11[0].receiver = self;
  v11[0].super_class = (Class)PHASESharedRoot;
  v8 = [(objc_super *)v11 initWithEngine:v6 entityType:0 shapes:0];
  if (!v8) {
    goto LABEL_4;
  }
  v9 = *(PHASESharedRoot **)([v6 implementation] + 488);
  if (v9)
  {
    objc_super v12 = (objc_super)0;
    [v7 getUUIDBytes:&v12];
    v11[1] = v12;
    v8->_sessionUUID = (UniqueObjectId)v12;
    [(PHASEObject *)v8 setGeoEntityHandle:(*((uint64_t (**)(PHASESharedRoot *, unint64_t, unint64_t))v9->super.super.isa + 5))(v9, v8->_sessionUUID.mStorage[0], v8->_sessionUUID.mStorage[1])];
LABEL_4:
    v9 = v8;
  }

  return v9;
}

- (PHASESharedRoot)initWithEngine:(id)a3 session:(id)a4 sessionUUID:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0].receiver = self;
  v15[0].super_class = (Class)PHASESharedRoot;
  v11 = [(objc_super *)v15 initWithEngine:v8 entityType:0 shapes:0];
  if (v11)
  {
    uint64_t v12 = *(void *)([v8 implementation] + 488);
    if (!v12)
    {
      uint64_t v13 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v11->_session, a4);
    objc_super v16 = (objc_super)0;
    [v10 getUUIDBytes:&v16];
    v15[1] = v16;
    v11->_sessionUUID = (UniqueObjectId)v16;
    [(PHASEObject *)v11 setGeoEntityHandle:(*(uint64_t (**)(uint64_t, unint64_t, unint64_t))(*(void *)v12 + 40))(v12, v11->_sessionUUID.mStorage[0], v11->_sessionUUID.mStorage[1])];
  }
  uint64_t v13 = v11;
LABEL_6:

  return v13;
}

- (void)dealloc
{
  v3 = [(PHASEObject *)self engine];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 implementation];
    if (v5)
    {
      uint64_t v6 = *(void *)(v5 + 488);
      if (v6) {
        (*(void (**)(uint64_t, unint64_t, unint64_t))(*(void *)v6 + 48))(v6, self->_sessionUUID.mStorage[0], self->_sessionUUID.mStorage[1]);
      }
    }
  }

  v7.receiver = self;
  v7.super_class = (Class)PHASESharedRoot;
  [(PHASEObject *)&v7 dealloc];
}

- (void)setTransform:(void *)a1
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (Phase::CurrentProcessCanModifySharedEntities(void)::onceToken != -1) {
    dispatch_once(&Phase::CurrentProcessCanModifySharedEntities(void)::onceToken, &__block_literal_global_4);
  }
  if (Phase::CurrentProcessCanModifySharedEntities(void)::currentProcessCanModifySharedEntities)
  {
    v3.receiver = a1;
    v3.super_class = (Class)PHASESharedRoot;
    -[PHASEObject setTransform:](&v3, sel_setTransform_);
  }
  else
  {
    v2 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)a1) + 432);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v5 = "PHASESharedRoot.mm";
      __int16 v6 = 1024;
      int v7 = 86;
      _os_log_impl(&dword_221E5E000, v2, OS_LOG_TYPE_ERROR, "%25s:%-5d Setting root object's transform has no effect", buf, 0x12u);
    }
  }
}

- (AVAudioSession)session
{
  return (AVAudioSession *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
}

@end