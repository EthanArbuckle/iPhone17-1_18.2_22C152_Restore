@interface _UNNotificationContentExtensionHostContext
- (BOOL)isDelegateQueueSuspended;
- (BOOL)wantsToBecomeFirstResponder;
- (BOOL)wantsToReceiveActionResponses;
- (CGRect)playPauseMediaButtonFrame;
- (OS_dispatch_queue)delegateQueue;
- (UIColor)playPauseMediaButtonColor;
- (_UNNotificationContentExtensionHostContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (_UNNotificationContentExtensionHostContextDelegate)delegate;
- (unint64_t)playPauseMediaButtonType;
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
- (void)_resumeDelegateQueueIfNecessary;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setDelegateQueueSuspended:(BOOL)a3;
- (void)setPlayPauseMediaButtonColor:(id)a3;
- (void)setPlayPauseMediaButtonFrame:(CGRect)a3;
- (void)setPlayPauseMediaButtonType:(unint64_t)a3;
- (void)setWantsToBecomeFirstResponder:(BOOL)a3;
- (void)setWantsToReceiveActionResponses:(BOOL)a3;
@end

@implementation _UNNotificationContentExtensionHostContext

- (_UNNotificationContentExtensionHostContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)_UNNotificationContentExtensionHostContext;
  id v5 = [(_UNNotificationContentExtensionHostContext *)&v10 initWithInputItems:a3 listenerEndpoint:a4 contextUUID:a5];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.usernotificationsui.hostcontext.delegate", v6);
    v8 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v7;

    *((unsigned char *)v5 + 26) = 1;
    dispatch_suspend(*((dispatch_object_t *)v5 + 7));
  }
  return (_UNNotificationContentExtensionHostContext *)v5;
}

- (void)dealloc
{
  [(_UNNotificationContentExtensionHostContext *)self _resumeDelegateQueueIfNecessary];
  v3.receiver = self;
  v3.super_class = (Class)_UNNotificationContentExtensionHostContext;
  [(_UNNotificationContentExtensionHostContext *)&v3 dealloc];
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  if (a3)
  {
    [(_UNNotificationContentExtensionHostContext *)self _resumeDelegateQueueIfNecessary];
  }
}

- (void)_hostDidReceiveNotification:(id)a3
{
  id v4 = a3;
  id v6 = [(_UNNotificationContentExtensionHostContext *)self _auxiliaryConnection];
  id v5 = [v6 remoteObjectProxy];
  [v5 _hostDidReceiveNotification:v4];
}

- (void)_hostDidReceiveNotificationResponse:(id)a3
{
  id v4 = a3;
  id v6 = [(_UNNotificationContentExtensionHostContext *)self _auxiliaryConnection];
  id v5 = [v6 remoteObjectProxy];
  [v5 _hostDidReceiveNotificationResponse:v4];
}

- (void)_hostDidReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(_UNNotificationContentExtensionHostContext *)self _auxiliaryConnection];
  v8 = [v9 remoteObjectProxy];
  [v8 _hostDidReceiveNotificationResponse:v7 completionHandler:v6];
}

- (void)_hostWantsMediaToPause
{
  id v3 = [(_UNNotificationContentExtensionHostContext *)self _auxiliaryConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 _hostWantsMediaToPause];
}

- (void)_hostWantsMediaToPlay
{
  id v3 = [(_UNNotificationContentExtensionHostContext *)self _auxiliaryConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 _hostWantsMediaToPlay];
}

- (void)_hostWantsToUpdateMediaPlayPauseButton
{
  id v3 = [(_UNNotificationContentExtensionHostContext *)self _auxiliaryConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 _hostWantsToUpdateMediaPlayPauseButton];
}

- (void)_hostWantsToPreserveInputViews
{
  id v3 = [(_UNNotificationContentExtensionHostContext *)self _auxiliaryConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 _hostWantsToPreserveInputViews];
}

- (void)_hostWantsToRestoreInputViews
{
  id v3 = [(_UNNotificationContentExtensionHostContext *)self _auxiliaryConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 _hostWantsToRestoreInputViews];
}

- (void)_extensionDidUpdatePlayPauseMediaButton
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85___UNNotificationContentExtensionHostContext__extensionDidUpdatePlayPauseMediaButton__block_invoke;
  block[3] = &unk_2646035C0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)_extensionWantsToReceiveActionResponses:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __86___UNNotificationContentExtensionHostContext__extensionWantsToReceiveActionResponses___block_invoke;
  v3[3] = &unk_264603670;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

- (void)_extensionWantsToBecomeFirstResponder:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __84___UNNotificationContentExtensionHostContext__extensionWantsToBecomeFirstResponder___block_invoke;
  v3[3] = &unk_264603670;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

- (void)_extensionSetPlayPauseMediaButtonType:(unint64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __84___UNNotificationContentExtensionHostContext__extensionSetPlayPauseMediaButtonType___block_invoke;
  v3[3] = &unk_264603698;
  v3[4] = self;
  void v3[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

- (void)_extensionSetPlayPauseMediaButtonFrame:(CGRect)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85___UNNotificationContentExtensionHostContext__extensionSetPlayPauseMediaButtonFrame___block_invoke;
  block[3] = &unk_2646036C0;
  block[4] = self;
  CGRect v4 = a3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)_extensionSetPlayPauseMediaButtonColor:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __85___UNNotificationContentExtensionHostContext__extensionSetPlayPauseMediaButtonColor___block_invoke;
  v6[3] = &unk_2646036E8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

- (void)_extensionDidCompleteNotificationResponse:(id)a3 withOption:(unint64_t)a4
{
  id v6 = a3;
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99___UNNotificationContentExtensionHostContext__extensionDidCompleteNotificationResponse_withOption___block_invoke;
  block[3] = &unk_264603710;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(delegateQueue, block);
}

- (void)_extensionMediaPlayingStarted
{
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75___UNNotificationContentExtensionHostContext__extensionMediaPlayingStarted__block_invoke;
  block[3] = &unk_2646035C0;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

- (void)_extensionMediaPlayingPaused
{
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74___UNNotificationContentExtensionHostContext__extensionMediaPlayingPaused__block_invoke;
  block[3] = &unk_2646035C0;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

- (void)_extensionRequestsDefaultAction
{
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77___UNNotificationContentExtensionHostContext__extensionRequestsDefaultAction__block_invoke;
  block[3] = &unk_2646035C0;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

- (void)_extensionRequestsDismiss
{
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71___UNNotificationContentExtensionHostContext__extensionRequestsDismiss__block_invoke;
  block[3] = &unk_2646035C0;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

- (void)_extensionDidUpdateTitle:(id)a3
{
  id v4 = a3;
  delegateQueue = self->_delegateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71___UNNotificationContentExtensionHostContext__extensionDidUpdateTitle___block_invoke;
  v7[3] = &unk_2646036E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(delegateQueue, v7);
}

- (void)_extensionDidUpdateNotificationActions:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __85___UNNotificationContentExtensionHostContext__extensionDidUpdateNotificationActions___block_invoke;
    v10[3] = &unk_264603738;
    id v11 = v5;
    [v4 enumerateObjectsUsingBlock:v10];
  }
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85___UNNotificationContentExtensionHostContext__extensionDidUpdateNotificationActions___block_invoke_2;
  block[3] = &unk_2646036E8;
  block[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(delegateQueue, block);
}

- (void)_resumeDelegateQueueIfNecessary
{
  if (self->_delegateQueueSuspended)
  {
    dispatch_resume((dispatch_object_t)self->_delegateQueue);
    self->_delegateQueueSuspended = 0;
  }
}

- (BOOL)wantsToBecomeFirstResponder
{
  return self->_wantsToBecomeFirstResponder;
}

- (void)setWantsToBecomeFirstResponder:(BOOL)a3
{
  self->_wantsToBecomeFirstResponder = a3;
}

- (BOOL)wantsToReceiveActionResponses
{
  return self->_wantsToReceiveActionResponses;
}

- (void)setWantsToReceiveActionResponses:(BOOL)a3
{
  self->_wantsToReceiveActionResponses = a3;
}

- (unint64_t)playPauseMediaButtonType
{
  return self->_playPauseMediaButtonType;
}

- (void)setPlayPauseMediaButtonType:(unint64_t)a3
{
  self->_playPauseMediaButtonType = a3;
}

- (CGRect)playPauseMediaButtonFrame
{
  double x = self->_playPauseMediaButtonFrame.origin.x;
  double y = self->_playPauseMediaButtonFrame.origin.y;
  double width = self->_playPauseMediaButtonFrame.size.width;
  double height = self->_playPauseMediaButtonFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPlayPauseMediaButtonFrame:(CGRect)a3
{
  self->_playPauseMediaButtonFrame = a3;
}

- (UIColor)playPauseMediaButtonColor
{
  return self->_playPauseMediaButtonColor;
}

- (void)setPlayPauseMediaButtonColor:(id)a3
{
}

- (_UNNotificationContentExtensionHostContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_UNNotificationContentExtensionHostContextDelegate *)WeakRetained;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (BOOL)isDelegateQueueSuspended
{
  return self->_delegateQueueSuspended;
}

- (void)setDelegateQueueSuspended:(BOOL)a3
{
  self->_delegateQueueSuspended = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_playPauseMediaButtonColor, 0);
}

@end