@interface SFSpeechProfileContainerManager
+ (id)sharedInstance;
- (SFSpeechProfileContainerManager)init;
- (id)containerForCurrentPersona;
- (id)containerForPersona:(id)a3;
- (id)personaForContainerRelativeURL:(id)a3;
- (void)releaseContainerForPersona:(id)a3;
@end

@implementation SFSpeechProfileContainerManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerForPersona, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)releaseContainerForPersona:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__SFSpeechProfileContainerManager_releaseContainerForPersona___block_invoke;
  v7[3] = &unk_1E61557F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __62__SFSpeechProfileContainerManager_releaseContainerForPersona___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)personaForContainerRelativeURL:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1398;
  v17 = __Block_byref_object_dispose__1399;
  id v18 = 0;
  v5 = [v4 absoluteString];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__SFSpeechProfileContainerManager_personaForContainerRelativeURL___block_invoke;
  block[3] = &unk_1E61552D8;
  block[4] = self;
  id v11 = v5;
  v12 = &v13;
  id v7 = v5;
  dispatch_sync(queue, block);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

void __66__SFSpeechProfileContainerManager_personaForContainerRelativeURL___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__SFSpeechProfileContainerManager_personaForContainerRelativeURL___block_invoke_2;
  v5[3] = &unk_1E6154EE8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
}

void __66__SFSpeechProfileContainerManager_personaForContainerRelativeURL___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v8 = [a3 url];
  v9 = [v8 absoluteString];

  if ([*(id *)(a1 + 32) hasPrefix:v9])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)containerForPersona:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__1398;
  v16 = __Block_byref_object_dispose__1399;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SFSpeechProfileContainerManager_containerForPersona___block_invoke;
  block[3] = &unk_1E61552D8;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __55__SFSpeechProfileContainerManager_containerForPersona___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    v5 = [[SFSpeechProfileContainer alloc] initWithPersona:a1[5]];
    uint64_t v6 = *(void *)(a1[6] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (*(void *)(*(void *)(a1[6] + 8) + 40))
    {
      id v8 = *(void **)(a1[4] + 16);
      objc_msgSend(v8, "setObject:forKey:");
    }
  }
}

- (id)containerForCurrentPersona
{
  uint64_t v3 = +[SFPersonaManager currentPersonaId];
  id v4 = +[SFPersonaManager sharedInstance];
  int v5 = [v4 personaMatchesEnrolledUser:v3];

  if (v5)
  {
    uint64_t v6 = [(SFSpeechProfileContainerManager *)self containerForPersona:v3];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (SFSpeechProfileContainerManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)SFSpeechProfileContainerManager;
  uint64_t v2 = [(SFSpeechProfileContainerManager *)&v12 init];
  if (v2)
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    int v5 = (const char *)[v4 cStringUsingEncoding:4];
    uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_opt_new();
    containerForPersona = v2->_containerForPersona;
    v2->_containerForPersona = (NSMutableDictionary *)v9;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1410);
  }
  uint64_t v2 = (void *)sharedInstance_sharedManager;

  return v2;
}

uint64_t __49__SFSpeechProfileContainerManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedManager = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

@end