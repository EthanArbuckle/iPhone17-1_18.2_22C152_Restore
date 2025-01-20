@interface MusicUIServiceCarDisplayBrowsableContentViewController
- (id)preferredFocusEnvironments;
- (void)_performSwitchToNowPlayingForBundleID:(id)a3 showNowPlaying:(BOOL)a4;
- (void)saveCurrentStack;
- (void)switchToState:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MusicUIServiceCarDisplayBrowsableContentViewController

- (void)switchToState:(id)a3
{
  id v4 = a3;
  v5 = [v4 associatedBundleID];
  if (v5)
  {
    v6 = [v4 stateName];
    BOOL v7 = ([v6 isEqualToString:@"nowplaying"] & 1) != 0
      || MRMediaRemoteApplicationSupportsImmediatePlayback() != 0;

    v8 = [(MusicUIServiceCarDisplayBrowsableContentViewController *)self traitCollection];
    id v9 = [v8 userInterfaceIdiom];

    if (v9 == (id)3)
    {
      [(MusicUIServiceCarDisplayBrowsableContentViewController *)self _performSwitchToNowPlayingForBundleID:v5 showNowPlaying:v7];
    }
    else
    {
      objc_initWeak(&location, self);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100005C1C;
      v12[3] = &unk_10000C3A0;
      objc_copyWeak(&v14, &location);
      id v13 = v5;
      BOOL v15 = v7;
      v10 = objc_retainBlock(v12);
      id needsSwitch = self->_needsSwitch;
      self->_id needsSwitch = v10;

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MusicUIServiceCarDisplayBrowsableContentViewController;
  [(MusicUIServiceCarDisplayBrowsableContentViewController *)&v6 traitCollectionDidChange:a3];
  id v4 = [(MusicUIServiceCarDisplayBrowsableContentViewController *)self traitCollection];
  if ([v4 userInterfaceIdiom] == (id)3)
  {
    id needsSwitch = self->_needsSwitch;

    if (!needsSwitch) {
      return;
    }
    (*((void (**)(void))self->_needsSwitch + 2))();
    id v4 = self->_needsSwitch;
    self->_id needsSwitch = 0;
  }
}

- (void)_performSwitchToNowPlayingForBundleID:(id)a3 showNowPlaying:(BOOL)a4
{
  BOOL v4 = a4;
  p_displayedViewControllerKey = &self->_displayedViewControllerKey;
  id v17 = a3;
  if ([v17 isEqualToString:*p_displayedViewControllerKey])
  {
    if (v4) {
      [(MCDPlayableContentViewController *)self->_nowPlayingViewController refreshNavigationStackForLaunch];
    }
  }
  else
  {
    [(MusicUIServiceCarDisplayBrowsableContentViewController *)self saveCurrentStack];
    objc_storeStrong((id *)&self->_displayedViewControllerKey, a3);
    [(MCDPlayableContentViewController *)self->_nowPlayingViewController willMoveToParentViewController:0];
    v8 = [(MCDPlayableContentViewController *)self->_nowPlayingViewController view];
    [v8 removeFromSuperview];

    [(MCDPlayableContentViewController *)self->_nowPlayingViewController removeFromParentViewController];
    id v9 = objc_alloc((Class)MCDPlayableContentViewController);
    v10 = [(NSMutableDictionary *)self->_bundleIDsToStacks objectForKey:*p_displayedViewControllerKey];
    v11 = (MCDPlayableContentViewController *)[v9 initWithBundleID:v17 stack:v10];
    nowPlayingViewController = self->_nowPlayingViewController;
    self->_nowPlayingViewController = v11;

    id v13 = [(MusicUIServiceCarDisplayBrowsableContentViewController *)self view];
    id v14 = [(MCDPlayableContentViewController *)self->_nowPlayingViewController view];
    [v13 bounds];
    [v14 setFrame:];

    [(MusicUIServiceCarDisplayBrowsableContentViewController *)self addChildViewController:self->_nowPlayingViewController];
    BOOL v15 = [(MCDPlayableContentViewController *)self->_nowPlayingViewController view];
    [v13 addSubview:v15];

    v16 = self->_nowPlayingViewController;
    if (v4)
    {
      [(MCDPlayableContentViewController *)v16 refreshNavigationStackForLaunch];
    }
    else
    {
      [(MCDPlayableContentViewController *)v16 didMoveToParentViewController:self];
      if (!self->_firstLaunchCompleted) {
        [(MCDPlayableContentViewController *)self->_nowPlayingViewController refreshNavigationStackForLaunch];
      }
      [(MusicUIServiceCarDisplayBrowsableContentViewController *)self setNeedsFocusUpdate];
    }
    self->_firstLaunchCompleted = 1;
  }
}

- (void)saveCurrentStack
{
  if (!self->_bundleIDsToStacks)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    bundleIDsToStacks = self->_bundleIDsToStacks;
    self->_bundleIDsToStacks = v3;
  }
  nowPlayingViewController = self->_nowPlayingViewController;
  if (nowPlayingViewController && self->_displayedViewControllerKey)
  {
    uint64_t v6 = [(MCDPlayableContentViewController *)nowPlayingViewController currentStack];
    BOOL v7 = self->_bundleIDsToStacks;
    displayedViewControllerKey = self->_displayedViewControllerKey;
    id v9 = (id)v6;
    if (v6) {
      [(NSMutableDictionary *)v7 setObject:v6 forKey:displayedViewControllerKey];
    }
    else {
      [(NSMutableDictionary *)v7 removeObjectForKey:displayedViewControllerKey];
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MusicUIServiceCarDisplayBrowsableContentViewController;
  [(MusicUIServiceCarDisplayBrowsableContentViewController *)&v6 viewWillDisappear:a3];
  [(MCDPlayableContentViewController *)self->_nowPlayingViewController willMoveToParentViewController:0];
  BOOL v4 = [(MCDPlayableContentViewController *)self->_nowPlayingViewController view];
  [v4 removeFromSuperview];

  [(MCDPlayableContentViewController *)self->_nowPlayingViewController removeFromParentViewController];
  nowPlayingViewController = self->_nowPlayingViewController;
  self->_nowPlayingViewController = 0;
}

- (id)preferredFocusEnvironments
{
  if (self->_nowPlayingViewController)
  {
    nowPlayingViewController = self->_nowPlayingViewController;
    v2 = +[NSArray arrayWithObjects:&nowPlayingViewController count:1];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)MusicUIServiceCarDisplayBrowsableContentViewController;
    v2 = [(MusicUIServiceCarDisplayBrowsableContentViewController *)&v4 preferredFocusEnvironments];
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_needsSwitch, 0);
  objc_storeStrong((id *)&self->_bundleIDsToStacks, 0);
  objc_storeStrong((id *)&self->_displayedViewControllerKey, 0);

  objc_storeStrong((id *)&self->_nowPlayingViewController, 0);
}

@end