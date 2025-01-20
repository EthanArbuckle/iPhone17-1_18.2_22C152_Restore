@interface AudioComponentRegistrar
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)initForMode:(BOOL)a3;
- (id)replaceListener:(id)a3 withListener:(id)a4;
- (void)dealloc;
- (void)impl;
- (void)resumeListeners;
@end

@implementation AudioComponentRegistrar

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v19[3] = *(id *)MEMORY[0x1E4F143B8];
  impl = self->_impl;
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 _queue];
  [v7 _setQueue:v8];

  id v9 = (id)*((void *)impl + 13);
  if (!gAudioComponentLogCategory) {
    operator new();
  }
  v10 = *(id *)gAudioComponentLogCategory;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "AudioComponentRegistrar.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 195;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v9 != v6;
    LOWORD(v18) = 1024;
    *(_DWORD *)((char *)&v18 + 2) = [v7 processIdentifier];
    _os_log_impl(&dword_18FEC0000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d (main %d  pid %d)", buf, 0x1Eu);
  }

  if (v9 == v6)
  {
    [v7 setExportedInterface:*((void *)impl + 14)];
    v12 = [[AudioComponentPrefRegConnection alloc] initWithRegistrar:impl connection:v7];
    [v7 setExportedObject:v12];
  }
  else
  {
    [v7 setExportedInterface:*((void *)impl + 11)];
    [v7 setRemoteObjectInterface:*((void *)impl + 12)];
    v12 = [[AudioComponentMainRegConnection alloc] initWithRegistrar:impl connection:v7];
    [*((id *)impl + 16) addObject:v12];
    objc_initWeak(&location, v12);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = ___ZN27AudioComponentRegistrarImpl33listenerShouldAcceptNewConnectionEP13NSXPCListenerP15NSXPCConnection_block_invoke;
    v18 = &unk_1E5688AC0;
    v19[1] = impl;
    objc_copyWeak(v19, &location);
    [v7 setInterruptionHandler:buf];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = ___ZN27AudioComponentRegistrarImpl33listenerShouldAcceptNewConnectionEP13NSXPCListenerP15NSXPCConnection_block_invoke_2;
    v14[3] = &unk_1E5688AC0;
    v15[1] = impl;
    objc_copyWeak(v15, &location);
    [v7 setInvalidationHandler:v14];
    [v7 setExportedObject:v12];
    objc_destroyWeak(v15);
    objc_destroyWeak(v19);
    objc_destroyWeak(&location);
  }

  [v7 resume];
  return 1;
}

- (void)impl
{
  return self->_impl;
}

- (void)resumeListeners
{
  impl = (id *)self->_impl;
  [impl[10] resume];
  if (!*(unsigned char *)impl)
  {
    id v3 = impl[13];
    [v3 resume];
  }
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!gAudioComponentLogCategory) {
    operator new();
  }
  id v3 = *(id *)gAudioComponentLogCategory;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v7 = "AudioComponentRegistrar.mm";
    __int16 v8 = 1024;
    int v9 = 565;
    _os_log_impl(&dword_18FEC0000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AudioComponentRegistrar stopping", buf, 0x12u);
  }
  v5.receiver = self;
  v5.super_class = (Class)AudioComponentRegistrar;
  [(AudioComponentRegistrar *)&v5 dealloc];
}

- (id)initForMode:(BOOL)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)AudioComponentRegistrar;
  if ([(AudioComponentRegistrar *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (id)replaceListener:(id)a3 withListener:(id)a4
{
  impl = (char *)self->_impl;
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"com.apple.audio.AudioComponentRegistrar"])
  {
    __int16 v8 = (id *)(impl + 80);
LABEL_5:
    id v9 = *v8;
    objc_storeStrong(v8, a4);
    goto LABEL_7;
  }
  if ([v6 isEqualToString:@"com.apple.audio.AudioComponentPrefs"])
  {
    __int16 v8 = (id *)(impl + 104);
    goto LABEL_5;
  }
  id v9 = 0;
LABEL_7:

  return v9;
}

@end