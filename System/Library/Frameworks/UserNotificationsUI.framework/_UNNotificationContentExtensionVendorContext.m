@interface _UNNotificationContentExtensionVendorContext
- (BOOL)didCheckActionResponseDelegate;
- (BOOL)isQueueInactive;
- (NSArray)notificationActions;
- (OS_dispatch_queue)queue;
- (_UNNotificationContentExtensionVendorContainer)notificationExtensionContainer;
- (_UNNotificationContentExtensionVendorContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (void)_activateQueueIfNecessary;
- (void)_extensionDidCompleteNotificationResponse:(id)a3 withOption:(unint64_t)a4;
- (void)_extensionDidUpdateNotificationActions:(id)a3;
- (void)_extensionDidUpdatePlayPauseMediaButton;
- (void)_extensionDidUpdateTitle:(id)a3;
- (void)_extensionMediaPlayingPaused;
- (void)_extensionMediaPlayingStarted;
- (void)_extensionRequestsDefaultAction;
- (void)_extensionRequestsDismiss;
- (void)_extensionSetPlayPauseMediaButtonColor:(id)a3;
- (void)_extensionSetPlayPauseMediaButtonFrame:(CGRect)a3;
- (void)_extensionSetPlayPauseMediaButtonType:(unint64_t)a3;
- (void)_extensionWantsToBecomeFirstResponder:(BOOL)a3;
- (void)_extensionWantsToReceiveActionResponses:(BOOL)a3;
- (void)_hostDidReceiveNotification:(id)a3;
- (void)_hostDidReceiveNotificationResponse:(id)a3;
- (void)_hostDidReceiveNotificationResponse:(id)a3 completionHandler:(id)a4;
- (void)_hostWantsMediaToPause;
- (void)_hostWantsMediaToPlay;
- (void)_hostWantsToPreserveInputViews;
- (void)_hostWantsToRestoreInputViews;
- (void)_hostWantsToUpdateMediaPlayPauseButton;
- (void)_updateMediaPlayPauseButton;
- (void)dealloc;
- (void)openURL:(id)a3 completionHandler:(id)a4;
- (void)performNotificationDefaultAction;
- (void)setDidCheckActionResponseDelegate:(BOOL)a3;
- (void)setNotificationActions:(id)a3;
- (void)setNotificationExtensionContainer:(id)a3;
- (void)setQueue:(id)a3;
- (void)setQueueInactive:(BOOL)a3;
@end

@implementation _UNNotificationContentExtensionVendorContext

- (_UNNotificationContentExtensionVendorContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  v26.receiver = self;
  v26.super_class = (Class)_UNNotificationContentExtensionVendorContext;
  v5 = [(_UNNotificationContentExtensionVendorContext *)&v26 initWithInputItems:a3 listenerEndpoint:a4 contextUUID:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(_UNNotificationContentExtensionVendorContext *)v5 inputItems];
    v8 = [v7 firstObject];
    v9 = [v8 userInfo];
    v10 = [v9 objectForKey:@"actions"];
    v11 = (void *)MEMORY[0x263F08928];
    v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    id v25 = 0;
    v15 = [v11 unarchivedObjectOfClasses:v14 fromData:v10 error:&v25];
    id v16 = v25;

    uint64_t v17 = [v15 copy];
    v18 = (void *)v17;
    if (v17) {
      v19 = (void *)v17;
    }
    else {
      v19 = (void *)MEMORY[0x263EFFA68];
    }
    objc_storeStrong((id *)&v6->_notificationActions, v19);

    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = dispatch_queue_attr_make_initially_inactive(v20);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.UserNotificationsUI.ExtensionVendorContext", v21);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v22;

    v6->_queueInactive = 1;
  }
  return v6;
}

- (void)dealloc
{
  [(_UNNotificationContentExtensionVendorContext *)self _activateQueueIfNecessary];
  v3.receiver = self;
  v3.super_class = (Class)_UNNotificationContentExtensionVendorContext;
  [(_UNNotificationContentExtensionVendorContext *)&v3 dealloc];
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74___UNNotificationContentExtensionVendorContext_openURL_completionHandler___block_invoke;
  v10[3] = &unk_264603798;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

- (void)performNotificationDefaultAction
{
  id v3 = [(_UNNotificationContentExtensionVendorContext *)self _auxiliaryConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 _extensionRequestsDefaultAction];
}

- (void)setNotificationActions:(id)a3
{
  if (self->_notificationActions != a3)
  {
    v4 = (NSArray *)[a3 copy];
    notificationActions = self->_notificationActions;
    self->_notificationActions = v4;

    id v6 = [MEMORY[0x263EFF980] array];
    v7 = self->_notificationActions;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __71___UNNotificationContentExtensionVendorContext_setNotificationActions___block_invoke;
    v9[3] = &unk_2646037C0;
    id v10 = v6;
    id v8 = v6;
    [(NSArray *)v7 enumerateObjectsUsingBlock:v9];
    [(_UNNotificationContentExtensionVendorContext *)self _extensionDidUpdateNotificationActions:v8];
  }
}

- (void)_extensionWantsToReceiveActionResponses:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_UNNotificationContentExtensionVendorContext *)self _auxiliaryConnection];
  v4 = [v5 remoteObjectProxy];
  [v4 _extensionWantsToReceiveActionResponses:v3];
}

- (void)_extensionWantsToBecomeFirstResponder:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_UNNotificationContentExtensionVendorContext *)self _auxiliaryConnection];
  v4 = [v5 remoteObjectProxy];
  [v4 _extensionWantsToBecomeFirstResponder:v3];
}

- (void)_extensionDidCompleteNotificationResponse:(id)a3 withOption:(unint64_t)a4
{
  id v6 = a3;
  id v8 = [(_UNNotificationContentExtensionVendorContext *)self _auxiliaryConnection];
  v7 = [v8 remoteObjectProxy];
  [v7 _extensionDidCompleteNotificationResponse:v6 withOption:a4];
}

- (void)_extensionSetPlayPauseMediaButtonType:(unint64_t)a3
{
  id v5 = [(_UNNotificationContentExtensionVendorContext *)self _auxiliaryConnection];
  v4 = [v5 remoteObjectProxy];
  [v4 _extensionSetPlayPauseMediaButtonType:a3];
}

- (void)_extensionSetPlayPauseMediaButtonFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(_UNNotificationContentExtensionVendorContext *)self _auxiliaryConnection];
  v7 = [v8 remoteObjectProxy];
  objc_msgSend(v7, "_extensionSetPlayPauseMediaButtonFrame:", x, y, width, height);
}

- (void)_extensionSetPlayPauseMediaButtonColor:(id)a3
{
  id v4 = a3;
  id v6 = [(_UNNotificationContentExtensionVendorContext *)self _auxiliaryConnection];
  id v5 = [v6 remoteObjectProxy];
  [v5 _extensionSetPlayPauseMediaButtonColor:v4];
}

- (void)_extensionMediaPlayingPaused
{
  id v3 = [(_UNNotificationContentExtensionVendorContext *)self _auxiliaryConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 _extensionMediaPlayingPaused];
}

- (void)_extensionMediaPlayingStarted
{
  id v3 = [(_UNNotificationContentExtensionVendorContext *)self _auxiliaryConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 _extensionMediaPlayingStarted];
}

- (void)_extensionRequestsDefaultAction
{
  id v3 = [(_UNNotificationContentExtensionVendorContext *)self _auxiliaryConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 _extensionRequestsDefaultAction];
}

- (void)_extensionRequestsDismiss
{
  id v3 = [(_UNNotificationContentExtensionVendorContext *)self _auxiliaryConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 _extensionRequestsDismiss];
}

- (void)_extensionDidUpdateTitle:(id)a3
{
  id v4 = a3;
  id v6 = [(_UNNotificationContentExtensionVendorContext *)self _auxiliaryConnection];
  id v5 = [v6 remoteObjectProxy];
  [v5 _extensionDidUpdateTitle:v4];
}

- (void)_extensionDidUpdateNotificationActions:(id)a3
{
  id v4 = a3;
  id v6 = [(_UNNotificationContentExtensionVendorContext *)self _auxiliaryConnection];
  id v5 = [v6 remoteObjectProxy];
  [v5 _extensionDidUpdateNotificationActions:v4];
}

- (void)_extensionDidUpdatePlayPauseMediaButton
{
  id v3 = [(_UNNotificationContentExtensionVendorContext *)self _auxiliaryConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 _extensionDidUpdatePlayPauseMediaButton];
}

- (void)_hostWantsToPreserveInputViews
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78___UNNotificationContentExtensionVendorContext__hostWantsToPreserveInputViews__block_invoke;
  block[3] = &unk_2646035C0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_hostWantsToRestoreInputViews
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77___UNNotificationContentExtensionVendorContext__hostWantsToRestoreInputViews__block_invoke;
  block[3] = &unk_2646035C0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_hostDidReceiveNotification:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76___UNNotificationContentExtensionVendorContext__hostDidReceiveNotification___block_invoke;
  v7[3] = &unk_2646036E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)_hostDidReceiveNotificationResponse:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse___block_invoke;
  v7[3] = &unk_2646036E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)_hostDidReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __102___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse_completionHandler___block_invoke;
  block[3] = &unk_264603838;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

- (void)_hostWantsMediaToPause
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70___UNNotificationContentExtensionVendorContext__hostWantsMediaToPause__block_invoke;
  block[3] = &unk_2646035C0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_hostWantsMediaToPlay
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69___UNNotificationContentExtensionVendorContext__hostWantsMediaToPlay__block_invoke;
  block[3] = &unk_2646035C0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_hostWantsToUpdateMediaPlayPauseButton
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86___UNNotificationContentExtensionVendorContext__hostWantsToUpdateMediaPlayPauseButton__block_invoke;
  block[3] = &unk_2646035C0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_updateMediaPlayPauseButton
{
  id v5 = [(_UNNotificationContentExtensionVendorContext *)self _notificationExtension];
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [v5 mediaPlayPauseButtonType];
    if ((unint64_t)(v3 - 1) > 1)
    {
      [(_UNNotificationContentExtensionVendorContext *)self _extensionSetPlayPauseMediaButtonType:0];
    }
    else
    {
      [(_UNNotificationContentExtensionVendorContext *)self _extensionSetPlayPauseMediaButtonType:v3];
      [v5 mediaPlayPauseButtonFrame];
      -[_UNNotificationContentExtensionVendorContext _extensionSetPlayPauseMediaButtonFrame:](self, "_extensionSetPlayPauseMediaButtonFrame:");
      if (objc_opt_respondsToSelector())
      {
        id v4 = [v5 mediaPlayPauseButtonTintColor];
        [(_UNNotificationContentExtensionVendorContext *)self _extensionSetPlayPauseMediaButtonColor:v4];
      }
    }
  }
  [(_UNNotificationContentExtensionVendorContext *)self _extensionDidUpdatePlayPauseMediaButton];
}

- (void)_activateQueueIfNecessary
{
  if (self->_queueInactive)
  {
    dispatch_activate((dispatch_object_t)self->_queue);
    self->_queueInactive = 0;
  }
}

- (NSArray)notificationActions
{
  return self->_notificationActions;
}

- (_UNNotificationContentExtensionVendorContainer)notificationExtensionContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationExtensionContainer);

  return (_UNNotificationContentExtensionVendorContainer *)WeakRetained;
}

- (void)setNotificationExtensionContainer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)isQueueInactive
{
  return self->_queueInactive;
}

- (void)setQueueInactive:(BOOL)a3
{
  self->_queueInactive = a3;
}

- (BOOL)didCheckActionResponseDelegate
{
  return self->_didCheckActionResponseDelegate;
}

- (void)setDidCheckActionResponseDelegate:(BOOL)a3
{
  self->_didCheckActionResponseDelegate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_notificationExtensionContainer);

  objc_storeStrong((id *)&self->_notificationActions, 0);
}

@end