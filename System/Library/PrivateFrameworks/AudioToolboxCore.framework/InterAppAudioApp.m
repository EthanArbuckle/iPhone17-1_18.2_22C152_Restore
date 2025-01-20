@interface InterAppAudioApp
- (BOOL)isCurrentApp;
- (BOOL)isForeground;
- (BOOL)isHost;
- (BOOL)processRunningOnForeground:(int)a3;
- (NSString)name;
- (NSURL)url;
- (UIImage)icon;
- (id)description;
- (id)init:(const InterAppAudioAppInfo *)a3 iconSize:(float)a4;
- (int64_t)key;
- (void)dealloc;
@end

@implementation InterAppAudioApp

- (BOOL)isForeground
{
  return self->_isForeground;
}

- (BOOL)isCurrentApp
{
  return self->_isCurrentApp;
}

- (BOOL)isHost
{
  return self->_isHost;
}

- (NSURL)url
{
  return self->_url;
}

- (UIImage)icon
{
  return self->_icon;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)key
{
  return self->_key;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<InterAppAudioApp %p: '%@' url %@>", self, self->_name, self->_url];
}

- (BOOL)processRunningOnForeground:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  if (!self->appMonitor) {
    self->appMonitor = (BKSApplicationStateMonitor *)objc_alloc_init(MEMORY[0x1E4F4E270]);
  }
  v5 = dispatch_semaphore_create(0);
  appMonitor = self->appMonitor;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__InterAppAudioApp_processRunningOnForeground___block_invoke;
  v9[3] = &unk_1E5680BE0;
  v9[4] = v5;
  v9[5] = &v10;
  [(BKSApplicationStateMonitor *)appMonitor applicationInfoForPID:v3 completion:v9];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v5);
  char v7 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

intptr_t __47__InterAppAudioApp_processRunningOnForeground___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:*MEMORY[0x1E4F4E238]]
    && objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F4E228]), "BOOLValue"))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  v4 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v4);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)InterAppAudioApp;
  [(InterAppAudioApp *)&v3 dealloc];
}

- (id)init:(const InterAppAudioAppInfo *)a3 iconSize:(float)a4
{
  v14.receiver = self;
  v14.super_class = (Class)InterAppAudioApp;
  v5 = [(InterAppAudioApp *)&v14 init];
  v6 = v5;
  if (v5)
  {
    v5->_isHost = a3->var0;
    int var1 = a3->var1;
    v5->_isCurrentApp = var1 == getpid();
    v6->_key = a3->var1;
    v6->_isForeground = -[InterAppAudioApp processRunningOnForeground:](v6, "processRunningOnForeground:");
    var2 = (UIImage *)a3->var2;
    if (!var2) {
      var2 = (UIImage *)IPCAUIcons::GetIconFromBundle((IPCAUIcons *)a3->var4, v8);
    }
    v6->_icon = var2;
    v6->_url = (NSURL *)a3->var5;
    v6->_name = &a3->var3->isa;
    uint64_t v10 = var2;
    v11 = v6->_url;
    uint64_t v12 = v6->_name;
  }
  return v6;
}

@end