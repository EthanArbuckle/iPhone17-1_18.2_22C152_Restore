@interface CBSharedFrameLinkRunLoop
+ (id)addDisplayLinkToRunLoop:(id)a3 forMode:(id)a4;
- (CBSharedFrameLinkRunLoop)initWithDisplayLink:(id)a3 forMode:(id)a4;
- (id)getRunLoop;
- (void)dealloc;
@end

@implementation CBSharedFrameLinkRunLoop

+ (id)addDisplayLinkToRunLoop:(id)a3 forMode:(id)a4
{
  pthread_mutex_lock(&_sharedFrameLinkRunLoopMutex);
  if (_sharedFrameLinkRunLoop)
  {
    id v5 = (id)_sharedFrameLinkRunLoop;
    objc_msgSend(a3, "addToRunLoop:forMode:", objc_msgSend(v5, "getRunLoop"), a4);
  }
  else
  {
    _sharedFrameLinkRunLoop = [[CBSharedFrameLinkRunLoop alloc] initWithDisplayLink:a3 forMode:a4];
    id v5 = (id)_sharedFrameLinkRunLoop;
  }
  pthread_mutex_unlock(&_sharedFrameLinkRunLoopMutex);
  return v5;
}

- (CBSharedFrameLinkRunLoop)initWithDisplayLink:(id)a3 forMode:(id)a4
{
  v16 = self;
  SEL v15 = a2;
  id v14 = a3;
  id v13 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CBSharedFrameLinkRunLoop;
  v16 = [(CBSharedFrameLinkRunLoop *)&v12 init];
  id v11 = objc_alloc_init(MEMORY[0x1E4F28BB0]);
  if (v11)
  {
    uint64_t v6 = 0;
    v7 = &v6;
    int v8 = 0x20000000;
    int v9 = 32;
    char v10 = 0;
    id v5 = objc_alloc(MEMORY[0x1E4F29060]);
    v16->_thread = (NSThread *)objc_msgSend(v5, "initWithBlock:");
    if (v16->_thread)
    {
      [(NSThread *)v16->_thread setQualityOfService:33];
      [(NSThread *)v16->_thread start];
      [(NSThread *)v16->_thread setName:@"com.apple.CoreBrightness.CBFrameLink"];
      [v11 lock];
      while ((v7[3] & 1) == 0)
        [v11 wait];
      [v11 unlock];

      v17 = v16;
    }
    else
    {

      v16 = 0;
      v17 = 0;
    }
    _Block_object_dispose(&v6, 8);
  }
  else
  {

    v16 = 0;
    return 0;
  }
  return v17;
}

void __56__CBSharedFrameLinkRunLoop_initWithDisplayLink_forMode___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [*(id *)(a1 + 40) addToRunLoop:*(void *)(*(void *)(a1 + 32) + 16) forMode:*MEMORY[0x1E4F1C4B0]];
  [*(id *)(a1 + 48) lock];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  [*(id *)(a1 + 48) signal];
  [*(id *)(a1 + 48) unlock];
  CFRunLoopRun();
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  pthread_mutex_lock(&_sharedFrameLinkRunLoopMutex);
  if (v4->_thread)
  {

    v4->_thread = 0;
    _sharedFrameLinkRunLoop = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBSharedFrameLinkRunLoop;
  [(CBSharedFrameLinkRunLoop *)&v2 dealloc];
  pthread_mutex_unlock(&_sharedFrameLinkRunLoopMutex);
}

- (id)getRunLoop
{
  return self->_runLoop;
}

@end