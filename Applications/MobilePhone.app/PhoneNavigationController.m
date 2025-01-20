@interface PhoneNavigationController
+ ($1FF454C5B48E436092D281DABF654916)badge;
+ (id)defaultPNGName;
+ (id)tabBarIconImage;
+ (id)tabBarIconName;
+ (int)tabViewType;
- (BOOL)shouldSnapshot;
- (MPVoicemailController)voicemailController;
- (PhoneNavigationController)initWithRootViewController:(id)a3;
- (VMPlayerController)playerController;
- (id)rootViewController;
- (id)selectedMessage;
- (id)selectedMessageTableViewCell;
- (void)_updateRootViewController;
- (void)dealloc;
- (void)handleURL:(id)a3;
- (void)playerController:(id)a3 didChangeToCurrentTime:(float)a4;
- (void)playerController:(id)a3 didChangeToDuration:(double)a4;
- (void)playerController:(id)a3 didChangeToStatus:(int64_t)a4;
- (void)playerController:(id)a3 didChangeToTimeControlStatus:(int64_t)a4;
- (void)playerController:(id)a3 didSeekToTime:(float)a4;
- (void)playerController:(id)a3 willSeekToTime:(float)a4;
- (void)playerControllerDidReset:(id)a3;
- (void)prepareForSnapshot;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setPlayerController:(id)a3;
- (void)setViewControllers:(id)a3;
- (void)setVoicemailController:(id)a3;
@end

@implementation PhoneNavigationController

- (void)setVoicemailController:(id)a3
{
}

- (void)setViewControllers:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PhoneNavigationController;
  [(PhoneNavigationController *)&v4 setViewControllers:a3];
  [(PhoneNavigationController *)self _updateRootViewController];
}

- (void)_updateRootViewController
{
  id v5 = [(PhoneNavigationController *)self viewControllers];
  if (![v5 count]) {
    goto LABEL_5;
  }
  v3 = [v5 objectAtIndex:0];
  objc_super v4 = v3;
  if (v3
    && ([(PhoneTabViewController *)v3 conformsToProtocol:&OBJC_PROTOCOL___PhoneTabViewController] & 1) == 0)
  {

LABEL_5:
    objc_super v4 = 0;
  }
  if (v4 != self->_rootController) {
    objc_storeStrong((id *)&self->_rootController, v4);
  }
}

- (MPVoicemailController)voicemailController
{
  return self->_voicemailController;
}

+ (int)tabViewType
{
  return 0;
}

+ ($1FF454C5B48E436092D281DABF654916)badge
{
  BOOL v2 = 1;
  unint64_t v3 = 0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

+ (id)tabBarIconName
{
  return 0;
}

+ (id)tabBarIconImage
{
  return 0;
}

+ (id)defaultPNGName
{
  return @"Default";
}

- (PhoneNavigationController)initWithRootViewController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PhoneNavigationController;
  unint64_t v3 = [(PhoneNavigationController *)&v9 initWithRootViewController:a3];
  if (v3)
  {
    if ([UIApp userInterfaceStyle] == 1)
    {
      id v4 = objc_alloc_init((Class)UIImage);
      id v5 = [(PhoneNavigationController *)v3 navigationBar];
      [v5 setBackgroundImage:v4 forBarPosition:0 barMetrics:0];

      v6 = [(PhoneNavigationController *)v3 navigationBar];
      [v6 setBarStyle:1];

      v7 = [(PhoneNavigationController *)v3 navigationBar];
      [v7 setTranslucent:1];

      [(PhoneNavigationController *)v3 _setClipUnderlapWhileTransitioning:1];
    }
    [(PhoneNavigationController *)v3 setDefinesPresentationContext:0];
  }
  return v3;
}

- (void)dealloc
{
  unint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PhoneNavigationController;
  [(PhoneNavigationController *)&v4 dealloc];
}

- (id)rootViewController
{
  return self->_rootController;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([UIApp userInterfaceStyle] == 1) {
    [v6 setEdgesForExtendedLayout:0];
  }
  v9.receiver = self;
  v9.super_class = (Class)PhoneNavigationController;
  [(PhoneNavigationController *)&v9 pushViewController:v6 animated:v4];
  v7 = [(PhoneNavigationController *)self viewControllers];
  id v8 = [v7 count];

  if (v8 == (id)1) {
    [(PhoneNavigationController *)self _updateRootViewController];
  }
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([UIApp userInterfaceStyle] == 1) {
    [v8 setEdgesForExtendedLayout:0];
  }
  v10.receiver = self;
  v10.super_class = (Class)PhoneNavigationController;
  [(PhoneNavigationController *)&v10 presentViewController:v8 animated:v6 completion:v9];
}

- (BOOL)shouldSnapshot
{
  unint64_t v3 = [(PhoneNavigationController *)self rootViewController];
  BOOL v4 = [(PhoneNavigationController *)self visibleViewController];
  if (v4 == v3) {
    unsigned __int8 v5 = [v3 shouldSnapshot];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)prepareForSnapshot
{
  id v2 = [(PhoneNavigationController *)self rootViewController];
  [v2 prepareForSnapshot];
}

- (void)handleURL:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(PhoneNavigationController *)self rootViewController];
  if (objc_opt_respondsToSelector()) {
    [v4 handleURL:v5];
  }
}

- (VMPlayerController)playerController
{
  playerController = self->_playerController;
  if (!playerController)
  {
    BOOL v4 = objc_alloc_init(VMPlayerController);
    id v5 = self->_playerController;
    self->_playerController = v4;

    [(VMPlayerController *)self->_playerController setDelegate:self];
    playerController = self->_playerController;
  }

  return playerController;
}

- (id)selectedMessage
{
  id v2 = [(PhoneNavigationController *)self topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    BOOL v4 = [v3 detailIndexPath];
    id v5 = v4;
    if (v4)
    {
      BOOL v6 = [v3 messageAtIndex:[v4 row]];
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)selectedMessageTableViewCell
{
  id v2 = [(PhoneNavigationController *)self topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    BOOL v4 = [v3 detailIndexPath];
    if (v4)
    {
      id v5 = [v3 tableView];
      BOOL v6 = [v5 cellForRowAtIndexPath:v4];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)playerControllerDidReset:(id)a3
{
}

- (void)playerController:(id)a3 didChangeToCurrentTime:(float)a4
{
  BOOL v6 = [(PhoneNavigationController *)self selectedMessageTableViewCell];
  id v7 = v6;
  if (v6)
  {
    double v8 = a4;
    id v9 = [v6 playerControlsView];
    [v9 setElapsedTime:v8];

    objc_super v10 = [(PhoneNavigationController *)self selectedMessage];
    v11 = v10;
    if (v10)
    {
      if ([v10 shouldMarkAsReadForPlaybackCurrentTime:v8])
      {
        v12 = [(PhoneNavigationController *)self voicemailController];
        v14 = v11;
        v13 = +[NSArray arrayWithObjects:&v14 count:1];
        [v12 markMessagesAsRead:v13];

        if (([v7 isRead] & 1) == 0) {
          [v7 setRead:1];
        }
      }
    }
  }
}

- (void)playerController:(id)a3 didChangeToDuration:(double)a4
{
  id v15 = a3;
  BOOL v6 = [(PhoneNavigationController *)self selectedMessageTableViewCell];
  id v7 = v6;
  if (v6)
  {
    double v8 = [v6 playerControlsView];
    id v9 = [v8 timelineSlider];
    [v9 setDuration:a4];

    if ([v15 status] == (id)1)
    {
      [v15 duration];
      double v11 = v10;
      v12 = [v7 playerControlsView];
      [v12 setDuration:v11];

      v13 = [v7 playerControlsView];
      [v13 setElapsedTime:0.0];

      v14 = [v7 playerControlsView];
      [v14 setEnabled:1];
    }
  }
}

- (void)playerController:(id)a3 didChangeToStatus:(int64_t)a4
{
  id v5 = [(PhoneNavigationController *)self selectedMessageTableViewCell];
  if (v5)
  {
    if (a4 == 2)
    {
      id v9 = v5;
      [UIApp setIdleTimerDisabled:0];
    }
    else
    {
      if (a4 == 1)
      {
        id v9 = v5;
        BOOL v6 = [v5 playerControlsView];
        id v7 = v6;
        uint64_t v8 = 1;
      }
      else
      {
        if (a4) {
          goto LABEL_10;
        }
        id v9 = v5;
        BOOL v6 = [v5 playerControlsView];
        id v7 = v6;
        uint64_t v8 = 0;
      }
      [v6 setEnabled:v8];
    }
    id v5 = v9;
  }
LABEL_10:
}

- (void)playerController:(id)a3 didChangeToTimeControlStatus:(int64_t)a4
{
  id v5 = [(PhoneNavigationController *)self selectedMessageTableViewCell];
  if (v5)
  {
    if (a4 == 2)
    {
      id v14 = v5;
      double v10 = [v5 toolbar];
      double v11 = [v10 playerControlButton];
      [v11 setPlayerState:1 enabled:1];

      uint64_t v8 = (void *)UIApp;
      uint64_t v9 = 1;
    }
    else
    {
      if (a4 == 1)
      {
        id v14 = v5;
        v12 = [v5 toolbar];
        v13 = [v12 playerControlButton];
        [v13 setPlayerState:1 enabled:1];

        goto LABEL_9;
      }
      if (a4) {
        goto LABEL_10;
      }
      id v14 = v5;
      BOOL v6 = [v5 toolbar];
      id v7 = [v6 playerControlButton];
      [v7 setPlayerState:0 enabled:1];

      uint64_t v8 = (void *)UIApp;
      uint64_t v9 = 0;
    }
    [v8 setIdleTimerDisabled:v9];
LABEL_9:
    id v5 = v14;
  }
LABEL_10:
}

- (void)playerController:(id)a3 willSeekToTime:(float)a4
{
  id v11 = a3;
  id v5 = [(PhoneNavigationController *)self selectedMessage];
  BOOL v6 = [v5 dataURL];

  uint64_t v7 = [v11 URL];
  if (!v7
    || (uint64_t v8 = (void *)v7,
        [v11 URL],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v10 = [v9 isEqual:v6],
        v9,
        v8,
        (v10 & 1) == 0))
  {
    [v11 setURL:v6];
  }
}

- (void)playerController:(id)a3 didSeekToTime:(float)a4
{
  id v5 = [(PhoneNavigationController *)self selectedMessageTableViewCell];
  if (v5)
  {
    id v7 = v5;
    BOOL v6 = [v5 playerControlsView];
    [v6 setElapsedTime:0 animated:a4];

    id v5 = v7;
  }
}

- (void)setPlayerController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_voicemailController, 0);

  objc_storeStrong((id *)&self->_rootController, 0);
}

@end