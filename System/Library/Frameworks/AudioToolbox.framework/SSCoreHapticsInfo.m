@interface SSCoreHapticsInfo
+ (id)instance;
- (SSCoreHapticsInfo)init;
- (id).cxx_construct;
- (id)getPlayerForSSID:(unint64_t)a3;
- (unint64_t)generateNewSSIDForPlayer:(id)a3;
- (void)disposeSSID:(unint64_t)a3;
- (void)registerSSID:(unint64_t)a3 withPlayer:(id)a4;
- (void)unregisterSSID:(unint64_t)a3;
@end

@implementation SSCoreHapticsInfo

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  fObj = self->_SSIDMapQueue.fObj.fObj;
  self->_SSIDMapQueue.fObj.fObj = 0;

  objc_storeStrong((id *)&self->_SSIDToPlayerMap, 0);
}

- (void)disposeSSID:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (kSystemSoundClientLogSubsystem)
  {
    v5 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315650;
    v8 = "SSCoreHapticsPlayer.mm";
    __int16 v9 = 1024;
    int v10 = 105;
    __int16 v11 = 2048;
    unint64_t v12 = a3;
    _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d disposing SSID %ld and its SSCoreHapticsPlayer", (uint8_t *)&v7, 0x1Cu);
  }

LABEL_8:
  [(SSCoreHapticsInfo *)self unregisterSSID:a3];
}

- (id)getPlayerForSSID:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3153;
  v17 = __Block_byref_object_dispose__3154;
  id v18 = 0;
  fObj = self->_SSIDMapQueue.fObj.fObj;
  id v6 = applesauce::dispatch::v1::queue::operator*(fObj);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SSCoreHapticsInfo_getPlayerForSSID___block_invoke;
  block[3] = &unk_1E5B145E8;
  block[4] = self;
  block[5] = &v13;
  block[6] = a3;
  dispatch_sync(v6, block);

  int v7 = (void *)v14[5];
  if (v7)
  {
    id v8 = v7;
    goto LABEL_10;
  }
  if (kSystemSoundClientLogSubsystem)
  {
    __int16 v9 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v9) {
      goto LABEL_10;
    }
  }
  else
  {
    __int16 v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "SSCoreHapticsPlayer.mm";
    __int16 v21 = 1024;
    int v22 = 97;
    __int16 v23 = 2048;
    unint64_t v24 = a3;
    _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d No player associated with SSID %ld", buf, 0x1Cu);
  }

LABEL_10:
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __38__SSCoreHapticsInfo_getPlayerForSSID___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 8);
  id v6 = [NSNumber numberWithUnsignedInteger:a1[6]];
  uint64_t v3 = objc_msgSend(v2, "objectForKey:");
  uint64_t v4 = *(void *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (unint64_t)generateNewSSIDForPlayer:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = -[SSCoreHapticsInfo generateNewSSIDForPlayer:]::currentToken++;
    [(SSCoreHapticsInfo *)self registerSSID:v5 withPlayer:v4];
  }
  else
  {
    if (kSystemSoundClientLogSubsystem)
    {
      v5 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v5) {
        goto LABEL_10;
      }
    }
    else
    {
      v5 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      __int16 v9 = "SSCoreHapticsPlayer.mm";
      __int16 v10 = 1024;
      int v11 = 77;
      _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d SSCoreHapticsPlayer invalid!", (uint8_t *)&v8, 0x12u);
    }

    v5 = 0;
  }
LABEL_10:

  return (unint64_t)v5;
}

- (void)unregisterSSID:(unint64_t)a3
{
  fObj = self->_SSIDMapQueue.fObj.fObj;
  id v6 = applesauce::dispatch::v1::queue::operator*(fObj);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__SSCoreHapticsInfo_unregisterSSID___block_invoke;
  v7[3] = &unk_1E5B145C0;
  v7[4] = self;
  v7[5] = a3;
  dispatch_barrier_async(v6, v7);
}

void __36__SSCoreHapticsInfo_unregisterSSID___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  id v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  objc_msgSend(v1, "removeObjectForKey:");
}

- (void)registerSSID:(unint64_t)a3 withPlayer:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (kSystemSoundClientLogSubsystem)
  {
    int v7 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    int v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v15 = "SSCoreHapticsPlayer.mm";
    __int16 v16 = 1024;
    int v17 = 61;
    __int16 v18 = 2048;
    unint64_t v19 = a3;
    __int16 v20 = 2048;
    id v21 = v6;
    _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d registering SSID %ld <-> SSCoreHapticsPlayer %p", buf, 0x26u);
  }

LABEL_8:
  fObj = self->_SSIDMapQueue.fObj.fObj;
  applesauce::dispatch::v1::queue::operator*(fObj);
  objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SSCoreHapticsInfo_registerSSID_withPlayer___block_invoke;
  block[3] = &unk_1E5B14598;
  block[4] = self;
  id v12 = v6;
  unint64_t v13 = a3;
  id v10 = v6;
  dispatch_barrier_async(fObj, block);
}

void __45__SSCoreHapticsInfo_registerSSID_withPlayer___block_invoke(void *a1)
{
  uint64_t v1 = a1[5];
  id v2 = *(void **)(a1[4] + 8);
  id v3 = [NSNumber numberWithUnsignedInteger:a1[6]];
  objc_msgSend(v2, "setObject:forKey:", v1);
}

- (SSCoreHapticsInfo)init
{
  v8.receiver = self;
  v8.super_class = (Class)SSCoreHapticsInfo;
  id v2 = [(SSCoreHapticsInfo *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    SSIDToPlayerMap = v2->_SSIDToPlayerMap;
    v2->_SSIDToPlayerMap = (NSMutableDictionary *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("SSIDPlayerDictQueue", MEMORY[0x1E4F14430]);
    fObj = v2->_SSIDMapQueue.fObj.fObj;
    v2->_SSIDMapQueue.fObj.fObj = (OS_dispatch_object *)v5;
  }
  return v2;
}

+ (id)instance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__SSCoreHapticsInfo_instance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[SSCoreHapticsInfo instance]::onceToken != -1) {
    dispatch_once(&+[SSCoreHapticsInfo instance]::onceToken, block);
  }
  id v2 = (void *)+[SSCoreHapticsInfo instance]::inst;

  return v2;
}

uint64_t __29__SSCoreHapticsInfo_instance__block_invoke(uint64_t a1)
{
  +[SSCoreHapticsInfo instance]::inst = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

@end