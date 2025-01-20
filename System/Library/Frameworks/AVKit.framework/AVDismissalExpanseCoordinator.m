@interface AVDismissalExpanseCoordinator
+ (void)coordinateDismissalWithExpanseSessionForPlayer:(id)a3 cancellable:(BOOL)a4 dismissalBlock:(id)a5;
@end

@implementation AVDismissalExpanseCoordinator

+ (void)coordinateDismissalWithExpanseSessionForPlayer:(id)a3 cancellable:(BOOL)a4 dismissalBlock:(id)a5
{
  BOOL v6 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  v9 = [v7 backgroundPIPAuthorizationToken];

  if (v9)
  {
    v10 = [v7 playbackCoordinator];
    v11 = [v10 coordinationMediumDelegate];

    if (objc_opt_respondsToSelector())
    {
      id v12 = v11;
      v13 = [v7 playbackCoordinator];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __107__AVDismissalExpanseCoordinator_coordinateDismissalWithExpanseSessionForPlayer_cancellable_dismissalBlock___block_invoke;
      v16[3] = &unk_1E5FC2E58;
      id v17 = v8;
      [v12 playbackCoordinator:v13 promptForLeaveOrEndSessionAllowingCancellation:v6 completionHandler:v16];
    }
    else
    {
      v15 = _AVLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "+[AVDismissalExpanseCoordinator coordinateDismissalWithExpanseSessionForPlayer:cancellable:dismissalBlock:]";
        _os_log_impl(&dword_1B05B7000, v15, OS_LOG_TYPE_DEFAULT, "%s Playback coordination dismissal delegate not implemented. Dismissing.", buf, 0xCu);
      }

      (*((void (**)(id, void))v8 + 2))(v8, 0);
    }
  }
  else
  {
    v14 = _AVLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "+[AVDismissalExpanseCoordinator coordinateDismissalWithExpanseSessionForPlayer:cancellable:dismissalBlock:]";
      _os_log_impl(&dword_1B05B7000, v14, OS_LOG_TYPE_DEFAULT, "%s Not in Expanse session (AVPlayer.backgroundPIPAuthorizationToken not set). Dismissing.", buf, 0xCu);
    }

    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

uint64_t __107__AVDismissalExpanseCoordinator_coordinateDismissalWithExpanseSessionForPlayer_cancellable_dismissalBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = _AVLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      int v8 = 136315138;
      v9 = "+[AVDismissalExpanseCoordinator coordinateDismissalWithExpanseSessionForPlayer:cancellable:dismissalBlock:]_block_invoke";
      BOOL v6 = "%s Playback coordination dismissal delegate completed but cancelled. Not dismissing.";
LABEL_6:
      _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v5)
  {
    int v8 = 136315138;
    v9 = "+[AVDismissalExpanseCoordinator coordinateDismissalWithExpanseSessionForPlayer:cancellable:dismissalBlock:]_block_invoke";
    BOOL v6 = "%s Playback coordination dismissal delegate completed. Dismissing.";
    goto LABEL_6;
  }

  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2);
}

@end