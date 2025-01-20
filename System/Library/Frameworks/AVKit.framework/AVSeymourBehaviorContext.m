@interface AVSeymourBehaviorContext
- (AVPlayerViewController)playerViewController;
- (AVSeymourBehaviorContext)initWithAVKitOwner:(id)a3;
- (NSEdgeInsets)legibleContentInsets;
- (id)behavior;
- (void)_updateLegibleContentInsets;
- (void)didRemoveBehavior:(id)a3;
- (void)hidePlaybackControlsImmediately;
- (void)setBehavior:(id)a3;
- (void)setLegibleContentInsets:(NSEdgeInsets)a3;
- (void)seymourBehaviorContextDidReceiveButtonTap:(id)a3;
- (void)viewDidLoad;
@end

@implementation AVSeymourBehaviorContext

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_behavior);

  objc_destroyWeak((id *)&self->_playerViewController);
}

- (NSEdgeInsets)legibleContentInsets
{
  double top = self->_legibleContentInsets.top;
  double left = self->_legibleContentInsets.left;
  double bottom = self->_legibleContentInsets.bottom;
  double right = self->_legibleContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setBehavior:(id)a3
{
}

- (id)behavior
{
  id WeakRetained = objc_loadWeakRetained(&self->_behavior);

  return WeakRetained;
}

- (AVPlayerViewController)playerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerViewController);

  return (AVPlayerViewController *)WeakRetained;
}

- (void)seymourBehaviorContextDidReceiveButtonTap:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(AVSeymourBehaviorContext *)self behavior];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__AVSeymourBehaviorContext_seymourBehaviorContextDidReceiveButtonTap___block_invoke;
  v6[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v7, &location);
  [v5 seymourBehaviorContext:self didRecieveDoneButtonTapWithDismissalBlock:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __70__AVSeymourBehaviorContext_seymourBehaviorContextDidReceiveButtonTap___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained playerViewController];
    [v3 doneButtonTapped:0];
  }
  else
  {
    v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "AVSeymourBehaviorContext is no longer around, playerViewController will not be dismissed.", v4, 2u);
    }
  }
}

- (void)hidePlaybackControlsImmediately
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[AVSeymourBehaviorContext hidePlaybackControlsImmediately]";
    __int16 v8 = 1024;
    int v9 = 102;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v6, 0x12u);
  }

  id v4 = [(AVSeymourBehaviorContext *)self playerViewController];
  v5 = [v4 playbackControlsController];
  [v5 flashPlaybackControlsWithDuration:0.0];
}

- (void)_updateLegibleContentInsets
{
  v3 = [(AVSeymourBehaviorContext *)self playerViewController];
  id v4 = [v3 contentView];
  v5 = [v4 playbackContentContainerView];
  int v6 = [v5 activeContentView];
  id v7 = [v6 playerLayerView];
  id v8 = [v7 playerLayer];

  [(AVSeymourBehaviorContext *)self legibleContentInsets];
  objc_msgSend(v8, "setLegibleContentInsets:");
}

- (void)setLegibleContentInsets:(NSEdgeInsets)a3
{
  self->_legibleContentInsets = a3;
  [(AVSeymourBehaviorContext *)self _updateLegibleContentInsets];
}

- (void)viewDidLoad
{
  v3 = [(AVSeymourBehaviorContext *)self playerViewController];
  id v4 = [v3 playbackControlsController];
  [v4 setShowsVideoGravityButton:0];

  v5 = [(AVSeymourBehaviorContext *)self playerViewController];
  int v6 = [v5 playbackControlsController];
  [v6 setWantsExternalPlaybackButtonShown:0];

  id v7 = [(AVSeymourBehaviorContext *)self playerViewController];
  id v8 = [v7 contentView];
  int v9 = [v8 playbackControlsView];
  uint64_t v10 = [v9 doneButton];
  [v10 removeTarget:0 action:sel_doneButtonTapped_ forControlEvents:64];

  v11 = [(AVSeymourBehaviorContext *)self playerViewController];
  v12 = [v11 contentView];
  v13 = [v12 playbackControlsView];
  v14 = [v13 doneButton];
  [v14 addTarget:self action:sel_seymourBehaviorContextDidReceiveButtonTap_ forControlEvents:64];

  v15 = [(AVSeymourBehaviorContext *)self playerViewController];
  v16 = [v15 controlsViewController];
  v17 = [(AVSeymourBehaviorContext *)self playerViewController];
  [v16 removeAction:sel_doneButtonTapped_ withTarget:v17 forEvent:@"AVChromelessControlsDoneButtonPressedEvent"];

  v18 = [(AVSeymourBehaviorContext *)self playerViewController];
  v19 = [v18 controlsViewController];
  [v19 addAction:sel_seymourBehaviorContextDidReceiveButtonTap_ withTarget:self forEvent:@"AVChromelessControlsDoneButtonPressedEvent"];

  [(AVSeymourBehaviorContext *)self _updateLegibleContentInsets];
}

- (AVSeymourBehaviorContext)initWithAVKitOwner:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVSeymourBehaviorContext;
  v5 = [(AVSeymourBehaviorContext *)&v9 init];
  int v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_playerViewController, v4);
    [v4 setSpeeds:MEMORY[0x1E4F1CBF0]];
  }
  return v6;
}

- (void)didRemoveBehavior:(id)a3
{
  id v4 = [(AVSeymourBehaviorContext *)self playerViewController];
  v5 = [v4 contentView];
  int v6 = [v5 playbackControlsView];
  id v7 = [v6 doneButton];
  [v7 removeTarget:self action:sel_seymourBehaviorContextDidReceiveButtonTap_ forControlEvents:64];

  id v8 = [(AVSeymourBehaviorContext *)self playerViewController];
  objc_super v9 = [v8 contentView];
  uint64_t v10 = [v9 playbackControlsView];
  v11 = [v10 doneButton];
  v12 = [(AVSeymourBehaviorContext *)self playerViewController];
  [v11 addTarget:v12 action:sel_doneButtonTapped_ forControlEvents:64];

  v13 = [(AVSeymourBehaviorContext *)self playerViewController];
  v14 = [v13 controlsViewController];
  [v14 removeAction:sel_seymourBehaviorContextDidReceiveButtonTap_ withTarget:self forEvent:@"AVChromelessControlsDoneButtonPressedEvent"];

  id v17 = [(AVSeymourBehaviorContext *)self playerViewController];
  v15 = [v17 controlsViewController];
  v16 = [(AVSeymourBehaviorContext *)self playerViewController];
  [v15 addAction:sel_doneButtonTapped_ withTarget:v16 forEvent:@"AVChromelessControlsDoneButtonPressedEvent"];
}

@end