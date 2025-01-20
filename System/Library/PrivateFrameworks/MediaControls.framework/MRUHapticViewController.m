@interface MRUHapticViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)delayArtworkChange;
- (BOOL)hasAppeared;
- (BOOL)isDimmed;
- (BOOL)isOnScreen;
- (MRUHapticViewController)initWithContext:(unint64_t)a3 nowPlayingController:(id)a4;
- (MRUNowPlayingController)nowPlayingController;
- (unint64_t)context;
- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4;
- (void)loadView;
- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5;
- (void)setContext:(unint64_t)a3;
- (void)setDelayArtworkChange:(BOOL)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setHasAppeared:(BOOL)a3;
- (void)setNowPlayingController:(id)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)updateArtworkImageWithMediaCode:(id)a3 treatCodesAsAdamIDs:(BOOL)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MRUHapticViewController

- (MRUHapticViewController)initWithContext:(unint64_t)a3 nowPlayingController:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MRUHapticViewController;
  id v5 = a4;
  v6 = [(MRUHapticViewController *)&v8 init];
  v6->_context = a3;
  -[MRUHapticViewController setNowPlayingController:](v6, "setNowPlayingController:", v5, v8.receiver, v8.super_class);

  return v6;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v3 = [MRUHapticView alloc];
  v4 = -[MRUHapticView initWithContext:frame:](v3, "initWithContext:frame:", self->_context, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MRUHapticViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)MRUHapticViewController;
  [(MRUHapticViewController *)&v12 viewDidLoad];
  v3 = [(MRUNowPlayingController *)self->_nowPlayingController metadataController];
  v4 = [v3 dataSource];
  id v5 = [v4 nowPlayingInfo];

  v6 = [v5 internationalStandardRecordingCode];

  if (v6)
  {
    v7 = [v5 internationalStandardRecordingCode];
    [(MRUHapticViewController *)self updateArtworkImageWithMediaCode:v7 treatCodesAsAdamIDs:0];
  }
  else
  {
    objc_super v8 = [v5 adamID];
    v9 = [NSNumber numberWithLong:0];
    char v10 = [v8 isEqualToNumber:v9];

    if (v10)
    {
      v7 = [(MRUHapticViewController *)self view];
      [v7 updateArtworkImageForHapticStatus:2];
    }
    else
    {
      v7 = [v5 adamID];
      v11 = [v7 stringValue];
      [(MRUHapticViewController *)self updateArtworkImageWithMediaCode:v11 treatCodesAsAdamIDs:1];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRUHapticViewController;
  [(MRUHapticViewController *)&v4 viewWillAppear:a3];
  self->_hasAppeared = 1;
  [(MRUHapticViewController *)self updateVisibility];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRUHapticViewController;
  [(MRUHapticViewController *)&v4 viewWillDisappear:a3];
  self->_hasAppeared = 0;
  [(MRUHapticViewController *)self updateVisibility];
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    [(MRUHapticViewController *)self updateVisibility];
  }
}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    [(MRUHapticViewController *)self updateVisibility];
    [MEMORY[0x1E4FB1FF0] _defaultAnimationDuration];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __37__MRUHapticViewController_setDimmed___block_invoke;
    v5[3] = &unk_1E5F0D8C0;
    v5[4] = self;
    BOOL v6 = a3;
    objc_msgSend(MEMORY[0x1E4FB1EB0], "animateWithDuration:animations:", v5);
  }
}

void __37__MRUHapticViewController_setDimmed___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setDimmed:v1];
}

- (void)setNowPlayingController:(id)a3
{
  objc_super v4 = (MRUNowPlayingController *)a3;
  [(MRUNowPlayingController *)self->_nowPlayingController removeObserver:self];
  nowPlayingController = self->_nowPlayingController;
  self->_nowPlayingController = v4;
  BOOL v6 = v4;

  [(MRUNowPlayingController *)v6 addObserver:self];
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5
{
  id v12 = a5;
  BOOL v6 = [v12 internationalStandardRecordingCode];

  if (v6)
  {
    v7 = [v12 internationalStandardRecordingCode];
    [(MRUHapticViewController *)self updateArtworkImageWithMediaCode:v7 treatCodesAsAdamIDs:0];
  }
  else
  {
    objc_super v8 = [v12 adamID];
    v9 = [NSNumber numberWithLong:0];
    char v10 = [v8 isEqualToNumber:v9];

    if (v10)
    {
      v7 = [(MRUHapticViewController *)self view];
      [v7 updateArtworkImageForHapticStatus:2];
    }
    else
    {
      v7 = [v12 adamID];
      v11 = [v7 stringValue];
      [(MRUHapticViewController *)self updateArtworkImageWithMediaCode:v11 treatCodesAsAdamIDs:1];
    }
  }
}

- (void)updateArtworkImageWithMediaCode:(id)a3 treatCodesAsAdamIDs:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_initWeak(&location, self);
  v7 = [MEMORY[0x1E4F31208] sharedManager];
  [v7 setTreatCodesAsAdamIDs:v4];

  objc_super v8 = [MEMORY[0x1E4F31208] sharedManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__MRUHapticViewController_updateArtworkImageWithMediaCode_treatCodesAsAdamIDs___block_invoke;
  v9[3] = &unk_1E5F0E120;
  objc_copyWeak(&v10, &location);
  [v8 checkHapticTrackAvailabilityForMediaMatchingCode:v6 completionHandler:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __79__MRUHapticViewController_updateArtworkImageWithMediaCode_treatCodesAsAdamIDs___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    if (a2)
    {
      BOOL v4 = [MEMORY[0x1E4F31208] sharedManager];
      int v5 = [v4 isActive];

      id v6 = [v9 view];
      v7 = v6;
      uint64_t v8 = v5 == 0;
    }
    else
    {
      id v6 = [WeakRetained view];
      v7 = v6;
      uint64_t v8 = 2;
    }
    [v6 updateArtworkImageForHapticStatus:v8];

    id WeakRetained = v9;
  }
}

- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4
{
  id v5 = a4;
  id v6 = [(MRUHapticViewController *)self view];
  [v6 setArtworkImage:v5];
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (MRUNowPlayingController)nowPlayingController
{
  return self->_nowPlayingController;
}

- (BOOL)hasAppeared
{
  return self->_hasAppeared;
}

- (void)setHasAppeared:(BOOL)a3
{
  self->_hasAppeared = a3;
}

- (BOOL)delayArtworkChange
{
  return self->_delayArtworkChange;
}

- (void)setDelayArtworkChange:(BOOL)a3
{
  self->_delayArtworkChange = a3;
}

- (void).cxx_destruct
{
}

@end