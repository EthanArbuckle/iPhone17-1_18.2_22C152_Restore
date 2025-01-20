@interface BaseMessagesViewController
+ (UIViewController)pendingChildViewController;
+ (void)setPendingChildViewController:(id)a3;
- (AVTUIControllerPresentation)currentControllerPresentation;
- (BOOL)automaticallyDisplaysLandscapeRotationOverlay;
- (BOOL)didOrientationChangeSemantically;
- (BOOL)isCustomMessageOverlayShown;
- (BOOL)isLandcapeTrapOverlayShown;
- (BOOL)isLandscapeMode;
- (BOOL)isLoaded;
- (BOOL)isOverlayShown;
- (BOOL)needsLandscapeOverlayUpdate;
- (BOOL)snapshottingEnabled;
- (BOOL)strongPopoverCurrentlyPresented;
- (BaseMessagesViewController)initWithCoder:(id)a3;
- (BaseMessagesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CGSize)previousSize;
- (FBSDisplayLayoutMonitor)displayLayoutMonitor;
- (MSMessagesAppViewController)baseMessagesViewController;
- (NSArray)childConstraints;
- (NSArray)customMessageOverlayConstraints;
- (NSArray)landscapeOverlayConstraints;
- (NSString)customOverlayMessage;
- (NSString)landscapeOverlayMessage;
- (TrapOverlayView)customMessageTrapOverlay;
- (TrapOverlayView)landscapeTrapOverlay;
- (UIColor)overlayMessageBackgroundColor;
- (UIColor)overlayMessageTextColor;
- (UIImage)emptySnapshotImage;
- (id)defaultMessagesChildViewControllerForPresentationContext:(unint64_t)a3;
- (id)overrideTraitCollectionForChildViewController:(id)a3;
- (int64_t)currentOrientation;
- (int64_t)previousOrientation;
- (int64_t)snapshottingEnabledUpdateIdentifier;
- (void)_addStickerAnimationDidFinishWithCompletion:(id)a3;
- (void)_addStickerToStoreWithRepresentations:(id)a3 completionHandler:(id)a4;
- (void)_addStickerToStoreWithRepresentations:(id)a3 completionWithStickerIDs:(id)a4;
- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5;
- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 effect:(int64_t)a5 completion:(id)a6;
- (void)_addStickerToStoreWithUISticker:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5;
- (void)_configure;
- (void)beginHidingInterfaceWithMessage:(id)a3;
- (void)configureNewTrapOverlayView:(id *)a3 constraints:(id *)a4;
- (void)dealloc;
- (void)didBecomeActiveWithConversation:(id)a3;
- (void)didResignActiveWithConversation:(id)a3;
- (void)didTransitionToPresentationStyle:(unint64_t)a3;
- (void)endHidingInterface;
- (void)layoutMonitorDidUpdateDisplayLayout:(id)a3 withContext:(id)a4;
- (void)scheduleSnapshotEnabledUpdateAfter:(double)a3 currentValue:(id)a4 futureValue:(id)a5;
- (void)setAutomaticallyDisplaysLandscapeRotationOverlay:(BOOL)a3;
- (void)setBaseMessagesViewController:(id)a3;
- (void)setChildConstraints:(id)a3;
- (void)setCurrentControllerPresentation:(id)a3;
- (void)setCustomMessageOverlayConstraints:(id)a3;
- (void)setCustomMessageTrapOverlay:(id)a3;
- (void)setCustomOverlayMessage:(id)a3;
- (void)setDisplayLayoutMonitor:(id)a3;
- (void)setIsLoaded:(BOOL)a3;
- (void)setLandscapeOverlayConstraints:(id)a3;
- (void)setLandscapeOverlayMessage:(id)a3;
- (void)setLandscapeTrapOverlay:(id)a3;
- (void)setOverlayShown:(BOOL)a3;
- (void)setPreviousOrientation:(int64_t)a3;
- (void)setPreviousSize:(CGSize)a3;
- (void)setSnapshottingEnabled:(BOOL)a3;
- (void)setSnapshottingEnabledUpdateIdentifier:(int64_t)a3;
- (void)setStrongPopoverCurrentlyPresented:(BOOL)a3;
- (void)setupDisplayLayoutMonitor;
- (void)updateHiddenSubviewsForAnyOverlays;
- (void)updateLandscapeOverlayIfNecessaryWithCoordinator:(id)a3;
- (void)updateLandscapeOverlayImmediately;
- (void)updateSnapshotWithCompletionBlock:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willBecomeActiveWithConversation:(id)a3;
- (void)willResignActiveWithConversation:(id)a3;
- (void)willTransitionToPresentationStyle:(unint64_t)a3;
@end

@implementation BaseMessagesViewController

- (BaseMessagesViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BaseMessagesViewController;
  v3 = [(BaseMessagesViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(BaseMessagesViewController *)v3 _configure];
  }
  return v4;
}

- (BaseMessagesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BaseMessagesViewController;
  v4 = [(BaseMessagesViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(BaseMessagesViewController *)v4 _configure];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [(BaseMessagesViewController *)self displayLayoutMonitor];

  if (v3)
  {
    v4 = [(BaseMessagesViewController *)self displayLayoutMonitor];
    [v4 invalidate];
  }
  v5.receiver = self;
  v5.super_class = (Class)BaseMessagesViewController;
  [(BaseMessagesViewController *)&v5 dealloc];
}

- (void)_configure
{
  self->_overlayShown = 0;
  self->_strongPopoverCurrentlyPresented = 0;
  self->_snapshottingEnabledUpdateIdentifier = 0;
  self->_snapshottingEnabled = 0;
  self->_previousOrientation = 0;
  self->_previousSize = CGSizeZero;
  id v3 = +[UIDevice currentDevice];
  self->_automaticallyDisplaysLandscapeRotationOverlay = [v3 userInterfaceIdiom] == 0;
}

- (id)overrideTraitCollectionForChildViewController:(id)a3
{
  id v3 = [(BaseMessagesViewController *)self traitCollection];
  v4 = +[AVTUITraitCollectionHelper overridenTraitFromTrait:v3];

  return v4;
}

- (void)configureNewTrapOverlayView:(id *)a3 constraints:(id *)a4
{
  objc_super v5 = -[TrapOverlayView initWithFrame:]([TrapOverlayView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_super v6 = [(BaseMessagesViewController *)self overlayMessageBackgroundColor];
  [(TrapOverlayView *)v5 setBackgroundColor:v6];

  objc_super v7 = [(BaseMessagesViewController *)self overlayMessageTextColor];
  v8 = [(TrapOverlayView *)v5 label];
  [v8 setTextColor:v7];

  [(TrapOverlayView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = [(BaseMessagesViewController *)self view];
  [v9 addSubview:v5];

  v27 = [(TrapOverlayView *)v5 leadingAnchor];
  v28 = [(BaseMessagesViewController *)self view];
  v26 = [v28 leadingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v31[0] = v25;
  v23 = [(TrapOverlayView *)v5 trailingAnchor];
  v24 = [(BaseMessagesViewController *)self view];
  v22 = [v24 trailingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v31[1] = v21;
  v10 = [(TrapOverlayView *)v5 topAnchor];
  v11 = [(BaseMessagesViewController *)self view];
  v12 = [v11 topAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  v31[2] = v13;
  v14 = [(TrapOverlayView *)v5 bottomAnchor];
  v15 = [(BaseMessagesViewController *)self view];
  v16 = [v15 bottomAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  v31[3] = v17;
  v18 = +[NSArray arrayWithObjects:v31 count:4];

  +[NSLayoutConstraint activateConstraints:v18];
  v19 = v5;
  *a3 = v19;
  id v20 = v18;
  *a4 = v20;
}

- (BOOL)isLandcapeTrapOverlayShown
{
  return self->_landscapeTrapOverlay != 0;
}

- (BOOL)isCustomMessageOverlayShown
{
  return self->_customMessageTrapOverlay != 0;
}

- (void)setCustomOverlayMessage:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_customOverlayMessage, a3);
  if (v5)
  {
    if (self->_customMessageTrapOverlay)
    {
      objc_super v6 = [(BaseMessagesViewController *)self view];
      [(TrapOverlayView *)v6 bringSubviewToFront:self->_landscapeTrapOverlay];
    }
    else
    {
      id v15 = 0;
      id v16 = 0;
      [(BaseMessagesViewController *)self configureNewTrapOverlayView:&v16 constraints:&v15];
      v10 = (TrapOverlayView *)v16;
      v11 = (NSArray *)v15;
      customMessageTrapOverlay = self->_customMessageTrapOverlay;
      self->_customMessageTrapOverlay = v10;
      objc_super v6 = v10;

      customMessageOverlayConstraints = self->_customMessageOverlayConstraints;
      self->_customMessageOverlayConstraints = v11;
    }
    v14 = [(TrapOverlayView *)self->_customMessageTrapOverlay label];
    [v14 setText:v5];

    [(TrapOverlayView *)self->_customMessageTrapOverlay layoutIfNeeded];
  }
  else
  {
    if (self->_customMessageOverlayConstraints)
    {
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
      objc_super v7 = self->_customMessageOverlayConstraints;
      self->_customMessageOverlayConstraints = 0;
    }
    v8 = self->_customMessageTrapOverlay;
    if (v8)
    {
      [(TrapOverlayView *)v8 removeFromSuperview];
      v9 = self->_customMessageTrapOverlay;
      self->_customMessageTrapOverlay = 0;
    }
  }
  [(BaseMessagesViewController *)self updateHiddenSubviewsForAnyOverlays];
}

- (int64_t)currentOrientation
{
  return (int64_t)[(BaseMessagesViewController *)self interfaceOrientation];
}

- (BOOL)isLandscapeMode
{
  return (char *)[(BaseMessagesViewController *)self currentOrientation] - 3 < (char *)2;
}

- (BOOL)didOrientationChangeSemantically
{
  int64_t previousOrientation = self->_previousOrientation;
  int64_t v4 = [(BaseMessagesViewController *)self currentOrientation];
  self->_int64_t previousOrientation = v4;
  if (v4 == previousOrientation) {
    return 0;
  }
  if (previousOrientation) {
    return ((unint64_t)(previousOrientation - 3) < 2) ^ ((unint64_t)(v4 - 3) < 2);
  }
  return 1;
}

- (BOOL)needsLandscapeOverlayUpdate
{
  BOOL v3 = [(BaseMessagesViewController *)self automaticallyDisplaysLandscapeRotationOverlay];
  if (v3)
  {
    LOBYTE(v3) = [(BaseMessagesViewController *)self didOrientationChangeSemantically];
  }
  return v3;
}

- (void)updateLandscapeOverlayImmediately
{
  if ([(BaseMessagesViewController *)self automaticallyDisplaysLandscapeRotationOverlay])
  {
    if ([(BaseMessagesViewController *)self isLandscapeMode])
    {
      BOOL v3 = [(BaseMessagesViewController *)self currentControllerPresentation];

      if (v3)
      {
        int64_t v4 = [(BaseMessagesViewController *)self currentControllerPresentation];
        [v4 viewWillBeObstructed];
      }
      if (self->_landscapeTrapOverlay)
      {
        id v5 = [(BaseMessagesViewController *)self view];
        [(TrapOverlayView *)v5 bringSubviewToFront:self->_landscapeTrapOverlay];
      }
      else
      {
        id v15 = 0;
        id v16 = 0;
        [(BaseMessagesViewController *)self configureNewTrapOverlayView:&v16 constraints:&v15];
        v9 = (TrapOverlayView *)v16;
        v10 = (NSArray *)v15;
        landscapeTrapOverlay = self->_landscapeTrapOverlay;
        self->_landscapeTrapOverlay = v9;
        id v5 = v9;

        landscapeOverlayConstraints = self->_landscapeOverlayConstraints;
        self->_landscapeOverlayConstraints = v10;
      }
      v13 = [(BaseMessagesViewController *)self landscapeOverlayMessage];
      v14 = [(TrapOverlayView *)self->_landscapeTrapOverlay label];
      [v14 setText:v13];

      [(TrapOverlayView *)self->_landscapeTrapOverlay layoutIfNeeded];
    }
    else
    {
      if (self->_landscapeOverlayConstraints)
      {
        +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
        objc_super v6 = self->_landscapeOverlayConstraints;
        self->_landscapeOverlayConstraints = 0;
      }
      objc_super v7 = self->_landscapeTrapOverlay;
      if (v7)
      {
        [(TrapOverlayView *)v7 removeFromSuperview];
        v8 = self->_landscapeTrapOverlay;
        self->_landscapeTrapOverlay = 0;
      }
    }
    [(BaseMessagesViewController *)self updateHiddenSubviewsForAnyOverlays];
  }
}

- (void)updateLandscapeOverlayIfNecessaryWithCoordinator:(id)a3
{
  if (a3)
  {
    v4[4] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100003EF8;
    v5[3] = &unk_10009A578;
    v5[4] = self;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100004078;
    v4[3] = &unk_10009A578;
    [a3 animateAlongsideTransition:v5 completion:v4];
  }
  else
  {
    [(BaseMessagesViewController *)self updateLandscapeOverlayImmediately];
  }
}

- (void)updateHiddenSubviewsForAnyOverlays
{
  landscapeTrapOverlay = self->_landscapeTrapOverlay;
  if (!landscapeTrapOverlay) {
    landscapeTrapOverlay = self->_customMessageTrapOverlay;
  }
  int64_t v4 = landscapeTrapOverlay;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(BaseMessagesViewController *)self view];
  objc_super v6 = [v5 subviews];

  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(TrapOverlayView **)(*((void *)&v18 + 1) + 8 * (void)v10);
        if (v4) {
          BOOL v12 = v11 == v4;
        }
        else {
          BOOL v12 = 1;
        }
        uint64_t v13 = !v12;
        [(TrapOverlayView *)v11 setHidden:v13];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }

  if (self->_landscapeTrapOverlay)
  {
    if (![(BaseMessagesViewController *)self isOverlayShown])
    {
      BOOL v14 = 1;
LABEL_20:
      [(BaseMessagesViewController *)self setOverlayShown:v14];
      CFStringRef v22 = @"BaseMessagesViewControllerOverlayPresentedKey";
      id v15 = +[NSNumber numberWithBool:v14];
      v23 = v15;
      id v16 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];

      v17 = +[NSNotificationCenter defaultCenter];
      [v17 postNotificationName:@"BaseMessagesViewControllerOverlayPresentationNotification" object:self userInfo:v16];
    }
  }
  else
  {
    BOOL v14 = self->_customMessageTrapOverlay != 0;
    if (v14 != [(BaseMessagesViewController *)self isOverlayShown]) {
      goto LABEL_20;
    }
  }
}

- (UIColor)overlayMessageTextColor
{
  return +[UIColor secondaryLabelColor];
}

- (UIColor)overlayMessageBackgroundColor
{
  return (UIColor *)+[AVTUIColorRepository trapOverlayBackgroundColor];
}

- (NSString)landscapeOverlayMessage
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"StickersLandscapeTrapMessage" value:&stru_10009DF88 table:@"Localizable"];

  return (NSString *)v3;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)BaseMessagesViewController;
  [(BaseMessagesViewController *)&v5 viewDidLoad];
  uint64_t v3 = +[AVTUIColorRepository appBackgroundColor];
  int64_t v4 = [(BaseMessagesViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BaseMessagesViewController;
  [(BaseMessagesViewController *)&v5 viewDidAppear:a3];
  [(BaseMessagesViewController *)self scheduleSnapshotEnabledUpdateAfter:0 currentValue:&__kCFBooleanTrue futureValue:1.0];
  int64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"BaseMessagesViewControllerDidAppearNotification" object:self];
}

- (void)scheduleSnapshotEnabledUpdateAfter:(double)a3 currentValue:(id)a4 futureValue:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[BaseAnimoji] updating snapshottingEnabled applying currentValue: %@", buf, 0xCu);
    }
    -[BaseMessagesViewController setSnapshottingEnabled:](self, "setSnapshottingEnabled:", [v8 BOOLValue]);
  }
  if (v9)
  {
    v10 = (void *)(self->_snapshottingEnabledUpdateIdentifier + 1);
    self->_snapshottingEnabledUpdateIdentifier = (int64_t)v10;
    objc_initWeak((id *)buf, self);
    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000045D4;
    block[3] = &unk_10009A5A0;
    objc_copyWeak(v14, (id *)buf);
    v14[1] = v10;
    id v13 = v9;
    dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(v14);
    objc_destroyWeak((id *)buf);
  }
}

- (void)setSnapshottingEnabled:(BOOL)a3
{
  if (self->_snapshottingEnabled != a3)
  {
    [(BaseMessagesViewController *)self willChangeValueForKey:@"snapshottingEnabled"];
    self->_snapshottingEnabled = a3;
    [(BaseMessagesViewController *)self didChangeValueForKey:@"snapshottingEnabled"];
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 postNotificationName:@"BaseMessagesViewControllerSnapshottingEnabledChangedNotification" object:self userInfo:0];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)BaseMessagesViewController;
  id v7 = a4;
  -[BaseMessagesViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  self->_previousSize.double width = width;
  self->_previousSize.double height = height;
  -[BaseMessagesViewController updateLandscapeOverlayIfNecessaryWithCoordinator:](self, "updateLandscapeOverlayIfNecessaryWithCoordinator:", v7, v8.receiver, v8.super_class);
}

- (void)viewDidLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)BaseMessagesViewController;
  [(BaseMessagesViewController *)&v9 viewDidLayoutSubviews];
  uint64_t v3 = [(BaseMessagesViewController *)self view];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  if (self->_previousSize.width != v5 || self->_previousSize.height != v7)
  {
    self->_previousSize.double width = v5;
    self->_previousSize.double height = v7;
    [(BaseMessagesViewController *)self updateLandscapeOverlayIfNecessaryWithCoordinator:0];
  }
}

- (id)defaultMessagesChildViewControllerForPresentationContext:(unint64_t)a3
{
  if (+[MSMessagesAppViewController instancesRespondToSelector:](MSMessagesAppViewController, "instancesRespondToSelector:", "initWithShouldBeSheetPresentationControllerDelegate:"))id v3 = [objc_alloc((Class)MSMessagesAppViewController) initWithShouldBeSheetPresentationControllerDelegate:0]; {
  else
  }
    id v3 = objc_alloc_init((Class)MSMessagesAppViewController);

  return v3;
}

+ (UIViewController)pendingChildViewController
{
  return (UIViewController *)(id)qword_1000AD9A0;
}

+ (void)setPendingChildViewController:(id)a3
{
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  v42.receiver = self;
  v42.super_class = (Class)BaseMessagesViewController;
  id v4 = a3;
  [(BaseMessagesViewController *)&v42 willBecomeActiveWithConversation:v4];
  if (![(BaseMessagesViewController *)self isLoaded])
  {
    [(BaseMessagesViewController *)self setIsLoaded:1];
    double v5 = +[AVTUIControllerPresentation pendingGlobalPresentation];
    [(BaseMessagesViewController *)self setCurrentControllerPresentation:v5];
    double v6 = +[BaseMessagesViewController pendingChildViewController];
    double v7 = v6;
    if (v5)
    {
      id v8 = [v5 controller];
      [v5 setModalMessagesController:self];
      objc_super v9 = +[AVTUIColorRepository modalBackgroundColor];
      v10 = [(BaseMessagesViewController *)self view];
      [v10 setBackgroundColor:v9];

      if (!v8)
      {
LABEL_12:
        [(BaseMessagesViewController *)self updateLandscapeOverlayImmediately];

        goto LABEL_13;
      }
    }
    else if (v6)
    {
      id v8 = v6;
      +[BaseMessagesViewController setPendingChildViewController:0];
    }
    else
    {
      dispatch_time_t v11 = [(BaseMessagesViewController *)self baseMessagesViewController];

      if (!v11)
      {
        BOOL v12 = [(BaseMessagesViewController *)self defaultMessagesChildViewControllerForPresentationContext:[(BaseMessagesViewController *)self presentationContext]];
        [(BaseMessagesViewController *)self setBaseMessagesViewController:v12];
      }
      id v8 = [(BaseMessagesViewController *)self baseMessagesViewController];
      if (!v8) {
        goto LABEL_12;
      }
    }
    id v13 = [v8 parentViewController];

    if (!v13)
    {
      BOOL v14 = [(BaseMessagesViewController *)self view];
      id v15 = [v8 view];
      [v14 addSubview:v15];

      id v16 = [v8 view];
      [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

      v40 = [(BaseMessagesViewController *)self view];
      v38 = [v40 leftAnchor];
      v39 = [v8 view];
      v37 = [v39 leftAnchor];
      v36 = [v38 constraintEqualToAnchor:v37];
      v43[0] = v36;
      v35 = [(BaseMessagesViewController *)self view];
      v33 = [v35 rightAnchor];
      v34 = [v8 view];
      v32 = [v34 rightAnchor];
      v31 = [v33 constraintEqualToAnchor:v32];
      v43[1] = v31;
      v30 = [(BaseMessagesViewController *)self view];
      v28 = [v30 topAnchor];
      v29 = [v8 view];
      v27 = [v29 topAnchor];
      v26 = [v28 constraintEqualToAnchor:v27];
      v43[2] = v26;
      v17 = [(BaseMessagesViewController *)self view];
      long long v18 = [v17 bottomAnchor];
      [v8 view];
      long long v19 = v41 = v7;
      long long v20 = [v19 bottomAnchor];
      long long v21 = [v18 constraintEqualToAnchor:v20];
      v43[3] = v21;
      CFStringRef v22 = +[NSArray arrayWithObjects:v43 count:4];
      [(BaseMessagesViewController *)self setChildConstraints:v22];

      double v7 = v41;
      v23 = [(BaseMessagesViewController *)self view];
      v24 = [(BaseMessagesViewController *)self childConstraints];
      [v23 addConstraints:v24];

      [(BaseMessagesViewController *)self addChildViewController:v8];
      [v8 didMoveToParentViewController:self];
    }
    goto LABEL_12;
  }
LABEL_13:
  v25 = [(BaseMessagesViewController *)self baseMessagesViewController];
  [v25 willBecomeActiveWithConversation:v4];
}

- (void)didBecomeActiveWithConversation:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BaseMessagesViewController;
  id v4 = a3;
  [(BaseMessagesViewController *)&v6 didBecomeActiveWithConversation:v4];
  double v5 = [(BaseMessagesViewController *)self baseMessagesViewController];
  [v5 didBecomeActiveWithConversation:v4];

  [(BaseMessagesViewController *)self setupDisplayLayoutMonitor];
}

- (void)willResignActiveWithConversation:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BaseMessagesViewController;
  id v4 = a3;
  [(BaseMessagesViewController *)&v7 willResignActiveWithConversation:v4];
  double v5 = [(BaseMessagesViewController *)self baseMessagesViewController];
  [v5 willResignActiveWithConversation:v4];

  objc_super v6 = [(BaseMessagesViewController *)self displayLayoutMonitor];
  [v6 invalidate];

  [(BaseMessagesViewController *)self setDisplayLayoutMonitor:0];
}

- (void)didResignActiveWithConversation:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BaseMessagesViewController;
  id v4 = a3;
  [(BaseMessagesViewController *)&v6 didResignActiveWithConversation:v4];
  double v5 = [(BaseMessagesViewController *)self baseMessagesViewController];
  [v5 didResignActiveWithConversation:v4];
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BaseMessagesViewController;
  -[BaseMessagesViewController willTransitionToPresentationStyle:](&v6, "willTransitionToPresentationStyle:");
  if (!a3) {
    [(BaseMessagesViewController *)self scheduleSnapshotEnabledUpdateAfter:&__kCFBooleanFalse currentValue:0 futureValue:0.0];
  }
  double v5 = [(BaseMessagesViewController *)self baseMessagesViewController];
  [v5 willTransitionToPresentationStyle:a3];
}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BaseMessagesViewController;
  -[BaseMessagesViewController didTransitionToPresentationStyle:](&v6, "didTransitionToPresentationStyle:");
  if (!a3) {
    [(BaseMessagesViewController *)self scheduleSnapshotEnabledUpdateAfter:&__kCFBooleanFalse currentValue:&__kCFBooleanTrue futureValue:0.1];
  }
  double v5 = [(BaseMessagesViewController *)self baseMessagesViewController];
  [v5 didTransitionToPresentationStyle:a3];
}

- (UIImage)emptySnapshotImage
{
  v12.double width = 1.0;
  v12.double height = 1.0;
  UIGraphicsBeginImageContextWithOptions(v12, 1, 0.0);
  id v3 = [(BaseMessagesViewController *)self childViewControllers];
  id v4 = [v3 lastObject];

  double v5 = [(BaseMessagesViewController *)self view];
  objc_super v6 = [v5 backgroundColor];
  objc_super v7 = [v4 traitCollection];
  id v8 = [v6 resolvedColorWithTraitCollection:v7];
  [v8 setFill];

  v13.origin.x = 0.0;
  v13.origin.y = 0.0;
  v13.size.double width = 1.0;
  v13.size.double height = 1.0;
  UIRectFill(v13);
  objc_super v9 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return (UIImage *)v9;
}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    double v5 = [(BaseMessagesViewController *)self baseMessagesViewController];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      unsigned int v7 = [(BaseMessagesViewController *)self snapshottingEnabled];
      BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v8)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[BaseAnimoji] updateSnapshotWithCompletionBlock snapshots enabled", buf, 2u);
        }
        objc_super v9 = [(BaseMessagesViewController *)self baseMessagesViewController];
        [v9 updateSnapshotWithCompletionBlock:v4];
      }
      else
      {
        if (v8)
        {
          *(_WORD *)dispatch_time_t v11 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[BaseAnimoji] updateSnapshotWithCompletionBlock snapshots disabled, returning 1x1 empty snapshot", v11, 2u);
        }
        objc_super v9 = [(BaseMessagesViewController *)self emptySnapshotImage];
        v4[2](v4, v9);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[BaseAnimoji] updateSnapshotWithCompletionBlock snapshots disabled", (uint8_t *)v10, 2u);
      }
      v4[2](v4, 0);
    }
  }
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:0];
  (*((void (**)(id, id, CGFloat, CGFloat, CGFloat, CGFloat))a4 + 2))(v5, v6, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 completionWithStickerIDs:(id)a4
{
  id v5 = a4;
  id v6 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:0];
  (*((void (**)(id, void, id, CGFloat, CGFloat, CGFloat, CGFloat))a4 + 2))(v5, 0, v6, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:0];
  (*((void (**)(id, void, id))a5 + 2))(v6, 0, v7);
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 effect:(int64_t)a5 completion:(id)a6
{
  id v7 = a6;
  id v8 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:0];
  (*((void (**)(id, void, id))a6 + 2))(v7, 0, v8);
}

- (void)_addStickerToStoreWithUISticker:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:0];
  (*((void (**)(id, void, id))a5 + 2))(v6, 0, v7);
}

- (void)_addStickerAnimationDidFinishWithCompletion:(id)a3
{
}

- (void)setupDisplayLayoutMonitor
{
  id v3 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
  objc_initWeak(&location, self);
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  id v7 = sub_10000571C;
  id v8 = &unk_10009A5C8;
  objc_copyWeak(&v9, &location);
  [v3 setTransitionHandler:&v5];
  id v4 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v3, v5, v6, v7, v8);
  [(BaseMessagesViewController *)self setDisplayLayoutMonitor:v4];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)layoutMonitorDidUpdateDisplayLayout:(id)a3 withContext:(id)a4
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [a3 elements];
  id v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v22 = *(void *)v26;
    uint64_t v7 = FBSDisplayLayoutElementControlCenterIdentifier;
    uint64_t v8 = FBSDisplayLayoutElementLockScreenIdentifier;
    uint64_t v9 = FBSDisplayLayoutElementSiriIdentifier;
    uint64_t v21 = FBSDisplayLayoutElementNotificationCenterIdentifier;
    long long v19 = self;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(obj);
        }
        dispatch_time_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        CGSize v12 = [v11 identifier];
        if ([v12 isEqualToString:v7]) {
          goto LABEL_16;
        }
        CGRect v13 = [v11 identifier];
        if ([v13 isEqualToString:v8]) {
          goto LABEL_15;
        }
        BOOL v14 = [v11 identifier];
        if ([v14 isEqualToString:v9])
        {

LABEL_15:
LABEL_16:

LABEL_17:
          char v17 = 1;
          self = v19;
          goto LABEL_18;
        }
        id v15 = [v11 identifier];
        unsigned __int8 v16 = [v15 isEqualToString:v21];

        if (v16) {
          goto LABEL_17;
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      char v17 = 0;
      self = v19;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v17 = 0;
  }
LABEL_18:

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100005A14;
  v23[3] = &unk_10009A5F0;
  char v24 = v17;
  v23[4] = self;
  long long v18 = objc_retainBlock(v23);
  if (+[NSThread isMainThread]) {
    ((void (*)(void *))v18[2])(v18);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);
  }
}

- (void)beginHidingInterfaceWithMessage:(id)a3
{
  if (!a3) {
    a3 = &stru_10009DF88;
  }
  [(BaseMessagesViewController *)self setCustomOverlayMessage:a3];
}

- (void)endHidingInterface
{
}

- (BOOL)snapshottingEnabled
{
  return self->_snapshottingEnabled;
}

- (MSMessagesAppViewController)baseMessagesViewController
{
  return self->_baseMessagesViewController;
}

- (void)setBaseMessagesViewController:(id)a3
{
}

- (BOOL)automaticallyDisplaysLandscapeRotationOverlay
{
  return self->_automaticallyDisplaysLandscapeRotationOverlay;
}

- (void)setAutomaticallyDisplaysLandscapeRotationOverlay:(BOOL)a3
{
  self->_automaticallyDisplaysLandscapeRotationOverlay = a3;
}

- (void)setLandscapeOverlayMessage:(id)a3
{
}

- (NSString)customOverlayMessage
{
  return self->_customOverlayMessage;
}

- (BOOL)isOverlayShown
{
  return self->_overlayShown;
}

- (void)setOverlayShown:(BOOL)a3
{
  self->_overlayShown = a3;
}

- (NSArray)childConstraints
{
  return self->_childConstraints;
}

- (void)setChildConstraints:(id)a3
{
}

- (NSArray)landscapeOverlayConstraints
{
  return self->_landscapeOverlayConstraints;
}

- (void)setLandscapeOverlayConstraints:(id)a3
{
}

- (NSArray)customMessageOverlayConstraints
{
  return self->_customMessageOverlayConstraints;
}

- (void)setCustomMessageOverlayConstraints:(id)a3
{
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (void)setIsLoaded:(BOOL)a3
{
  self->_isLoaded = a3;
}

- (CGSize)previousSize
{
  double width = self->_previousSize.width;
  double height = self->_previousSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreviousSize:(CGSize)a3
{
  self->_previousSize = a3;
}

- (int64_t)previousOrientation
{
  return self->_previousOrientation;
}

- (void)setPreviousOrientation:(int64_t)a3
{
  self->_int64_t previousOrientation = a3;
}

- (TrapOverlayView)landscapeTrapOverlay
{
  return self->_landscapeTrapOverlay;
}

- (void)setLandscapeTrapOverlay:(id)a3
{
}

- (TrapOverlayView)customMessageTrapOverlay
{
  return self->_customMessageTrapOverlay;
}

- (void)setCustomMessageTrapOverlay:(id)a3
{
}

- (int64_t)snapshottingEnabledUpdateIdentifier
{
  return self->_snapshottingEnabledUpdateIdentifier;
}

- (void)setSnapshottingEnabledUpdateIdentifier:(int64_t)a3
{
  self->_snapshottingEnabledUpdateIdentifier = a3;
}

- (BOOL)strongPopoverCurrentlyPresented
{
  return self->_strongPopoverCurrentlyPresented;
}

- (void)setStrongPopoverCurrentlyPresented:(BOOL)a3
{
  self->_strongPopoverCurrentlyPresented = a3;
}

- (AVTUIControllerPresentation)currentControllerPresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentControllerPresentation);

  return (AVTUIControllerPresentation *)WeakRetained;
}

- (void)setCurrentControllerPresentation:(id)a3
{
}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return self->_displayLayoutMonitor;
}

- (void)setDisplayLayoutMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_destroyWeak((id *)&self->_currentControllerPresentation);
  objc_storeStrong((id *)&self->_customMessageTrapOverlay, 0);
  objc_storeStrong((id *)&self->_landscapeTrapOverlay, 0);
  objc_storeStrong((id *)&self->_customMessageOverlayConstraints, 0);
  objc_storeStrong((id *)&self->_landscapeOverlayConstraints, 0);
  objc_storeStrong((id *)&self->_childConstraints, 0);
  objc_storeStrong((id *)&self->_customOverlayMessage, 0);
  objc_storeStrong((id *)&self->_landscapeOverlayMessage, 0);

  objc_storeStrong((id *)&self->_baseMessagesViewController, 0);
}

@end