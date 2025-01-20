@interface AVSwitchToLatestPublisher
+ (id)switchToLatestPublisherWithUpstream:(id)a3;
- (AVSwitchToLatestPublisher)initWithUpstream:(id)a3;
- (id)description;
- (id)subscribeRequestingInitialValue:(BOOL)a3 block:(id)a4;
- (void)dealloc;
@end

@implementation AVSwitchToLatestPublisher

void __67__AVSwitchToLatestPublisher_subscribeRequestingInitialValue_block___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x199715AE0]();
  Weak = objc_loadWeak((id *)(a1 + 48));
  if (Weak)
  {
    v4 = Weak;
    MEMORY[0x199714DD0](Weak[1]);
    if (*((_DWORD *)v4 + 8) == *(_DWORD *)(a1 + 56))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
      if (*(unsigned char *)(v5 + 24))
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
      }
      *(unsigned char *)(v5 + 24) = 1;
    }
    MEMORY[0x199714DF0](v4[1]);
  }
}

void __67__AVSwitchToLatestPublisher_subscribeRequestingInitialValue_block___block_invoke(uint64_t a1, void *a2)
{
  v4 = (void *)MEMORY[0x199715AE0]();
  Weak = objc_loadWeak((id *)(a1 + 48));
  if (Weak)
  {
    v6 = Weak;
    MEMORY[0x199714DD0](Weak[1]);
    int v7 = *((_DWORD *)v6 + 8) + 1;
    *((_DWORD *)v6 + 8) = v7;
    [(id)v6[3] cancel];

    v6[3] = 0;
    if (a2)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __67__AVSwitchToLatestPublisher_subscribeRequestingInitialValue_block___block_invoke_2;
      v9[3] = &unk_1E57B4490;
      objc_copyWeak(&v11, (id *)(a1 + 48));
      int v12 = v7;
      long long v10 = *(_OWORD *)(a1 + 32);
      v6[3] = (id)[a2 subscribeRequestingInitialValue:1 block:v9];
      objc_destroyWeak(&v11);
    }
    else
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      if (*(unsigned char *)(v8 + 24))
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      }
      *(unsigned char *)(v8 + 24) = 1;
    }
    MEMORY[0x199714DF0](v6[1]);
  }
}

- (id)subscribeRequestingInitialValue:(BOOL)a3 block:(id)a4
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  BOOL v13 = a3;
  objc_initWeak(&location, self);
  upstream = self->_upstream;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__AVSwitchToLatestPublisher_subscribeRequestingInitialValue_block___block_invoke;
  v9[3] = &unk_1E57B44B8;
  objc_copyWeak(&v10, &location);
  void v9[4] = a4;
  v9[5] = v12;
  id v7 = [(AVPublisher *)upstream subscribeRequestingInitialValue:1 block:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  _Block_object_dispose(v12, 8);
  return v7;
}

+ (id)switchToLatestPublisherWithUpstream:(id)a3
{
  v3 = [[AVSwitchToLatestPublisher alloc] initWithUpstream:a3];
  return v3;
}

- (AVSwitchToLatestPublisher)initWithUpstream:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVSwitchToLatestPublisher;
  v4 = [(AVPublisher *)&v6 init];
  if (v4)
  {
    v4->_callbackMutex = (OpaqueFigReentrantMutex *)FigReentrantMutexCreate();
    v4->_upstream = (AVPublisher *)a3;
    v4->_publisherIndex = 0;
  }
  return v4;
}

- (void)dealloc
{
  [(AVNotificationSubscription *)self->_outputPublisherSubscription cancel];
  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)AVSwitchToLatestPublisher;
  [(AVPublisher *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p upstream=%@", objc_opt_class(), self, self->_upstream];
}

@end