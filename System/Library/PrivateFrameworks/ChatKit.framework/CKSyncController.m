@interface CKSyncController
+ (id)sharedInstance;
- (BOOL)isRestoring;
- (CKSyncController)init;
- (int)attachmentRestoredToken;
- (int)restoreStateChangedToken;
- (void)attachmentRestored;
- (void)postAttachmentRestored;
- (void)prioritizeAttachmentAtPath:(id)a3;
- (void)setAttachmentRestoredToken:(int)a3;
- (void)setRestoreStateChangedToken:(int)a3;
- (void)setRestoring:(BOOL)a3;
- (void)updateRestoreState;
@end

@implementation CKSyncController

- (CKSyncController)init
{
  v17.receiver = self;
  v17.super_class = (Class)CKSyncController;
  v2 = [(CKSyncController *)&v17 init];
  if (v2)
  {
    v3 = (const char *)[@"com.apple.ChatKit.attachmentRestoredNotification" UTF8String];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __24__CKSyncController_init__block_invoke;
    handler[3] = &unk_1E562A460;
    v4 = v2;
    v16 = v4;
    v5 = MEMORY[0x1E4F14428];
    notify_register_dispatch(v3, &v2->_attachmentRestoredToken, MEMORY[0x1E4F14428], handler);
    v6 = (const char *)[@"com.apple.MobileBackup.restoreStateChanged" UTF8String];
    p_restoreStateChangedToken = &v4->_restoreStateChangedToken;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __24__CKSyncController_init__block_invoke_2;
    v13 = &unk_1E562A460;
    v8 = v4;
    v14 = v8;
    notify_register_dispatch(v6, p_restoreStateChangedToken, v5, &v10);

    [(CKSyncController *)v8 updateRestoreState];
  }
  return v2;
}

uint64_t __24__CKSyncController_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) attachmentRestored];
}

uint64_t __24__CKSyncController_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateRestoreState];
}

+ (id)sharedInstance
{
  if (sharedInstance_once_3 != -1) {
    dispatch_once(&sharedInstance_once_3, &__block_literal_global_200);
  }
  v2 = (void *)sharedInstance___instance;

  return v2;
}

void __34__CKSyncController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CKSyncController);
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;
}

- (void)prioritizeAttachmentAtPath:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(46);
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_DEBUG, "Prioritize attachment at path %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
    _CKLog();
  }
  id v5 = objc_alloc_init((Class)MEMORY[0x192FBA860](@"ATConnection", @"AirTraffic"));
  [v5 prioritizeAsset:v3 forDataclass:@"MessagePart"];
}

- (void)updateRestoreState
{
  uint64_t state64 = 0;
  notify_get_state(self->_restoreStateChangedToken, &state64);
  uint64_t v3 = state64;
  [(CKSyncController *)self setRestoring:state64 == 2];
  if (v3 != 2)
  {
    notify_cancel(self->_attachmentRestoredToken);
    self->_attachmentRestoredToken = -1;
    notify_cancel(self->_restoreStateChangedToken);
    self->_restoreStateChangedToken = -1;
  }
}

- (void)attachmentRestored
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_postAttachmentRestored object:0];

  [(CKSyncController *)self performSelector:sel_postAttachmentRestored withObject:0 afterDelay:0.0];
}

- (void)postAttachmentRestored
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"com.apple.ChatKit.attachmentRestoredNotification" object:self];
}

- (BOOL)isRestoring
{
  return self->_restoring;
}

- (void)setRestoring:(BOOL)a3
{
  self->_restoring = a3;
}

- (int)restoreStateChangedToken
{
  return self->_restoreStateChangedToken;
}

- (void)setRestoreStateChangedToken:(int)a3
{
  self->_restoreStateChangedToken = a3;
}

- (int)attachmentRestoredToken
{
  return self->_attachmentRestoredToken;
}

- (void)setAttachmentRestoredToken:(int)a3
{
  self->_attachmentRestoredToken = a3;
}

@end