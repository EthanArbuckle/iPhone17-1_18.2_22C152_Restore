@interface AVMobileControlsViewController
+ (double)autoHideInterval;
- (AVKitLayoutItem)displayModeControlsLayoutItem;
- (AVKitLayoutItem)transportControlsLayoutItem;
- (AVKitLayoutItem)volumeControlsLayoutItem;
- (AVMobileControlsViewController)init;
- (AVMobileControlsViewControllerDelegate)delegate;
- (AVMobileFullscreenController)fullscreenController;
- (AVPictureInPictureController)pipController;
- (AVPlayerController)playerController;
- (AVRoutingConfiguration)routingConfiguration;
- (AVVolumeController)volumeController;
- (BOOL)optimizeForPerformance;
- (BOOL)requiresLinearPlayback;
- (BOOL)showsFullScreenControl;
- (NSArray)controlItems;
- (NSArray)transportBarCustomMenuItems;
- (id)controlsViewControllerIfChromed;
- (id)controlsViewControllerIfChromeless;
- (id)eventManager;
- (unint64_t)excludedControls;
- (unint64_t)includedControls;
- (unint64_t)secondaryPlaybackControlsType;
- (unint64_t)visibilityPolicy;
- (void)addAction:(SEL)a3 withTarget:(id)a4 forEvent:(id)a5;
- (void)addAction:(id)a3 forEvent:(id)a4;
- (void)removeAction:(SEL)a3 withTarget:(id)a4 forEvent:(id)a5;
- (void)setControlItems:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExcludedControls:(unint64_t)a3;
- (void)setFullscreenController:(id)a3;
- (void)setIncludedControls:(unint64_t)a3;
- (void)setOptimizeForPerformance:(BOOL)a3;
- (void)setPipController:(id)a3;
- (void)setPlayerController:(id)a3;
- (void)setRequiresLinearPlayback:(BOOL)a3;
- (void)setRoutingConfiguration:(id)a3;
- (void)setSecondaryPlaybackControlsType:(unint64_t)a3;
- (void)setShowsFullScreenControl:(BOOL)a3;
- (void)setTransportBarCustomMenuItems:(id)a3;
- (void)setVisibilityPolicy:(unint64_t)a3;
- (void)setVolumeController:(id)a3;
@end

@implementation AVMobileControlsViewController

- (NSArray)transportBarCustomMenuItems
{
  return self->_transportBarCustomMenuItems;
}

- (unint64_t)excludedControls
{
  return self->_excludedControls;
}

- (AVMobileFullscreenController)fullscreenController
{
  return self->_fullscreenController;
}

- (unint64_t)includedControls
{
  return self->_includedControls;
}

- (AVPictureInPictureController)pipController
{
  return self->_pipController;
}

- (id)controlsViewControllerIfChromed
{
  return 0;
}

- (unint64_t)secondaryPlaybackControlsType
{
  return self->_secondaryPlaybackControlsType;
}

- (void)addAction:(SEL)a3 withTarget:(id)a4 forEvent:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(AVMobileControlsViewController *)self eventManager];
  [v10 addAction:a3 withTarget:v9 forEvent:v8];
}

- (id)eventManager
{
  eventManager = self->_eventManager;
  if (!eventManager)
  {
    v4 = [[AVEventManager alloc] initWithOwner:self];
    v5 = self->_eventManager;
    self->_eventManager = v4;

    eventManager = self->_eventManager;
  }

  return eventManager;
}

- (void)setSecondaryPlaybackControlsType:(unint64_t)a3
{
  self->_secondaryPlaybackControlsType = a3;
}

- (void)setPipController:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setVolumeController:(id)a3
{
}

- (BOOL)showsFullScreenControl
{
  return self->_showsFullScreenControl;
}

- (void)setShowsFullScreenControl:(BOOL)a3
{
  self->_showsFullScreenControl = a3;
}

- (void)setRoutingConfiguration:(id)a3
{
}

- (AVRoutingConfiguration)routingConfiguration
{
  return self->_routingConfiguration;
}

- (BOOL)requiresLinearPlayback
{
  return self->_requiresLinearPlayback;
}

- (BOOL)optimizeForPerformance
{
  return self->_optimizeForPerformance;
}

- (void)setIncludedControls:(unint64_t)a3
{
  self->_includedControls = a3;
}

- (void)setFullscreenController:(id)a3
{
}

- (NSArray)controlItems
{
  return self->_controlItems;
}

- (AVMobileControlsViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVMobileControlsViewController;
  result = [(AVControlsViewController *)&v3 init];
  if (result)
  {
    result->_includedControls = 63;
    result->_visibilityPolicy = 1;
    result->_secondaryPlaybackControlsType = 0;
  }
  return result;
}

- (AVVolumeController)volumeController
{
  return self->_volumeController;
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (void)setPlayerController:(id)a3
{
}

- (unint64_t)visibilityPolicy
{
  return self->_visibilityPolicy;
}

- (void)setVisibilityPolicy:(unint64_t)a3
{
  self->_visibilityPolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayModeControlsLayoutItem, 0);
  objc_storeStrong((id *)&self->_volumeControlsLayoutItem, 0);
  objc_storeStrong((id *)&self->_transportControlsLayoutItem, 0);
  objc_storeStrong((id *)&self->_controlItems, 0);
  objc_storeStrong((id *)&self->_transportBarCustomMenuItems, 0);
  objc_storeStrong((id *)&self->_pipController, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_routingConfiguration, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_fullscreenController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_eventManager, 0);
}

- (AVKitLayoutItem)displayModeControlsLayoutItem
{
  return self->_displayModeControlsLayoutItem;
}

- (AVKitLayoutItem)volumeControlsLayoutItem
{
  return self->_volumeControlsLayoutItem;
}

- (AVKitLayoutItem)transportControlsLayoutItem
{
  return self->_transportControlsLayoutItem;
}

- (void)setRequiresLinearPlayback:(BOOL)a3
{
  self->_requiresLinearPlayback = a3;
}

- (void)setOptimizeForPerformance:(BOOL)a3
{
  self->_optimizeForPerformance = a3;
}

- (void)setExcludedControls:(unint64_t)a3
{
  self->_excludedControls = a3;
}

- (AVMobileControlsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVMobileControlsViewControllerDelegate *)WeakRetained;
}

- (void)removeAction:(SEL)a3 withTarget:(id)a4 forEvent:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(AVMobileControlsViewController *)self eventManager];
  [v10 removeAction:a3 withTarget:v9 forEvent:v8];
}

- (void)addAction:(id)a3 forEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AVMobileControlsViewController *)self eventManager];
  [v8 addAction:v7 forEvent:v6];
}

- (void)setTransportBarCustomMenuItems:(id)a3
{
  v4 = (NSArray *)[a3 copy];
  transportBarCustomMenuItems = self->_transportBarCustomMenuItems;
  self->_transportBarCustomMenuItems = v4;

  MEMORY[0x1F41817F8](v4, transportBarCustomMenuItems);
}

- (void)setControlItems:(id)a3
{
  if (self->_controlItems != a3)
  {
    v4 = (NSArray *)[a3 copy];
    controlItems = self->_controlItems;
    self->_controlItems = v4;
    MEMORY[0x1F41817F8](v4, controlItems);
  }
}

+ (double)autoHideInterval
{
  return 3.0;
}

- (id)controlsViewControllerIfChromeless
{
  return 0;
}

@end