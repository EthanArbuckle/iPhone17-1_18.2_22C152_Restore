@interface _SWCollaborationCoordinator
+ (SWCollaborationCoordinator)sharedManager;
- (void)_sendStartCollaborationAction:(id)a3;
- (void)_sendUpdateCollaborationParticipantsAction:(id)a3;
@end

@implementation _SWCollaborationCoordinator

+ (SWCollaborationCoordinator)sharedManager
{
  v2 = objc_opt_class();

  return (SWCollaborationCoordinator *)[v2 sharedCoordinator];
}

- (void)_sendStartCollaborationAction:(id)a3
{
  id v4 = a3;
  v5 = [(SWCollaborationCoordinator *)self actionHandler];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C0DE000, v7, OS_LOG_TYPE_DEFAULT, "_sendStartCollaborationAction: invoking the action handler", buf, 2u);
    }

    v8 = [(SWCollaborationCoordinator *)self actionHandler];
    [v8 handleStartCollaborationAction:v4];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_SWCollaborationCoordinator;
    [(SWCollaborationCoordinator *)&v9 _sendStartCollaborationAction:v4];
  }
}

- (void)_sendUpdateCollaborationParticipantsAction:(id)a3
{
  id v4 = a3;
  v5 = [(SWCollaborationCoordinator *)self actionHandler];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74___SWCollaborationCoordinator__sendUpdateCollaborationParticipantsAction___block_invoke;
    block[3] = &unk_1E54D85F0;
    block[4] = self;
    id v9 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_SWCollaborationCoordinator;
    [(SWCollaborationCoordinator *)&v7 _sendUpdateCollaborationParticipantsAction:v4];
  }
}

@end