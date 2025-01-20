@interface RPBroadcastController
- (BOOL)isBroadcasting;
- (BOOL)isPaused;
- (NSDictionary)serviceInfo;
- (NSString)broadcastExtensionBundleID;
- (NSString)broadcastExtensionBundleIdentifier;
- (NSURL)broadcastURL;
- (RPBroadcastController)init;
- (RPBroadcastController)initWithCurrentSession;
- (RPBroadcastController)initWithExtensionBundleID:(id)a3 broadcastURL:(id)a4;
- (id)delegate;
- (void)finishBroadcastWithHandler:(void *)handler;
- (void)finishSystemBroadcastWithHandler:(id)a3;
- (void)pauseBroadcast;
- (void)resumeBroadcast;
- (void)setBroadcastExtensionBundleIdentifier:(id)a3;
- (void)setBroadcastURL:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setServiceInfo:(id)a3;
- (void)startBroadcastWithHandler:(void *)handler;
- (void)startSystemBroadcastWithHandler:(id)a3;
@end

@implementation RPBroadcastController

- (RPBroadcastController)init
{
  return [(RPBroadcastController *)self initWithExtensionBundleID:0 broadcastURL:0];
}

- (RPBroadcastController)initWithExtensionBundleID:(id)a3 broadcastURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RPBroadcastController;
  v9 = [(RPBroadcastController *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_broadcastExtensionBundleID, a3);
    v11 = +[RPScreenRecorder sharedRecorder];
    [v11 setBroadcastURL:v8];
  }
  return v10;
}

- (RPBroadcastController)initWithCurrentSession
{
  v5.receiver = self;
  v5.super_class = (Class)RPBroadcastController;
  v2 = [(RPBroadcastController *)&v5 init];
  if (v2)
  {
    v3 = +[RPScreenRecorder sharedRecorder];
    [v3 setActiveBroadcastController:v2];
  }
  return v2;
}

- (BOOL)isBroadcasting
{
  v2 = +[RPScreenRecorder sharedRecorder];
  char v3 = [v2 isRecording];

  return v3;
}

- (BOOL)isPaused
{
  v2 = +[RPScreenRecorder sharedRecorder];
  char v3 = [v2 isPaused];

  return v3;
}

- (NSURL)broadcastURL
{
  v2 = +[RPScreenRecorder sharedRecorder];
  char v3 = [v2 broadcastURL];

  return (NSURL *)v3;
}

- (void)setBroadcastURL:(id)a3
{
  id v3 = a3;
  id v4 = +[RPScreenRecorder sharedRecorder];
  [v4 setBroadcastURL:v3];
}

- (void)startBroadcastWithHandler:(void *)handler
{
  id v4 = handler;
  objc_super v5 = +[RPScreenRecorder sharedRecorder];
  [v5 setActiveBroadcastController:self];

  v6 = +[RPScreenRecorder sharedRecorder];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__RPBroadcastController_startBroadcastWithHandler___block_invoke;
  v8[3] = &unk_26451DB20;
  id v9 = v4;
  id v7 = v4;
  [v6 startInAppBroadcastWithHandler:v8];
}

uint64_t __51__RPBroadcastController_startBroadcastWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pauseBroadcast
{
  id v3 = +[RPScreenRecorder sharedRecorder];
  [v3 setActiveBroadcastController:self];

  id v4 = +[RPScreenRecorder sharedRecorder];
  [v4 pauseInAppBroadcast];
}

- (void)resumeBroadcast
{
  id v3 = +[RPScreenRecorder sharedRecorder];
  [v3 setActiveBroadcastController:self];

  id v4 = +[RPScreenRecorder sharedRecorder];
  [v4 resumeInAppBroadcast];
}

- (void)finishBroadcastWithHandler:(void *)handler
{
  id v4 = handler;
  objc_super v5 = +[RPScreenRecorder sharedRecorder];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__RPBroadcastController_finishBroadcastWithHandler___block_invoke;
  v7[3] = &unk_26451DD50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 stopInAppBroadcastWithHandler:v7];
}

void __52__RPBroadcastController_finishBroadcastWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = a2;
  id v6 = +[RPScreenRecorder sharedRecorder];
  [v6 setActiveBroadcastController:0];

  [*(id *)(a1 + 32) setServiceInfo:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)startSystemBroadcastWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[RPScreenRecorder sharedRecorder];
  [v5 setActiveBroadcastController:self];

  id v6 = +[RPScreenRecorder sharedRecorder];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__RPBroadcastController_startSystemBroadcastWithHandler___block_invoke;
  v8[3] = &unk_26451DB20;
  id v9 = v4;
  id v7 = v4;
  [v6 startSystemBroadcastWithHandler:v8];
}

uint64_t __57__RPBroadcastController_startSystemBroadcastWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)finishSystemBroadcastWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[RPScreenRecorder sharedRecorder];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__RPBroadcastController_finishSystemBroadcastWithHandler___block_invoke;
  v7[3] = &unk_26451DD50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 stopSystemBroadcastWithHandler:v7];
}

void __58__RPBroadcastController_finishSystemBroadcastWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = a2;
  id v6 = +[RPScreenRecorder sharedRecorder];
  [v6 setActiveBroadcastController:0];

  [*(id *)(a1 + 32) setServiceInfo:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSDictionary)serviceInfo
{
  return self->_serviceInfo;
}

- (void)setServiceInfo:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (NSString)broadcastExtensionBundleID
{
  return self->_broadcastExtensionBundleID;
}

- (NSString)broadcastExtensionBundleIdentifier
{
  return self->_broadcastExtensionBundleIdentifier;
}

- (void)setBroadcastExtensionBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_broadcastExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_broadcastExtensionBundleID, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_serviceInfo, 0);
}

@end