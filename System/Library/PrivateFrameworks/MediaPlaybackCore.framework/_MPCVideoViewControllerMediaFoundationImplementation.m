@interface _MPCVideoViewControllerMediaFoundationImplementation
+ (id)keyPathsForValuesAffectingAllowsPictureInPicturePlayback;
+ (id)keyPathsForValuesAffectingIsPictureInPictureActive;
+ (id)keyPathsForValuesAffectingIsReadyForDisplay;
+ (id)keyPathsForValuesAffectingPresentationSize;
+ (id)keyPathsForValuesAffectingShowsPlaybackControls;
+ (id)keyPathsForValuesAffectingVideoBounds;
+ (id)keyPathsForValuesAffectingVideoGravity;
- (AVPlayerViewController)internalController;
- (BOOL)_isBinCompatApp;
- (BOOL)allowsPictureInPicturePlayback;
- (BOOL)allowsVideoFrameAnalysis;
- (BOOL)isPictureInPictureActive;
- (BOOL)isReadyForDisplay;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)showsPlaybackControls;
- (CGRect)videoBounds;
- (CGSize)presentationSize;
- (MPCPlaybackEngine)playbackEngine;
- (MPCVideoOutputDelegate)videoOutputDelegate;
- (NSString)description;
- (NSString)videoGravity;
- (_MPCVideoViewControllerMediaFoundationImplementation)initWithPlaybackEngine:(id)a3;
- (id)_stateDictionary;
- (void)_transferPropertiesFromOldPlayerController:(id)a3 toNewPlayerController:(id)a4;
- (void)_updateViewControllerHierarchyForPlaybackEngine:(id)a3;
- (void)dealloc;
- (void)enterFullScreenWithCompletion:(id)a3;
- (void)exitFullScreenWithCompletion:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setAllowsPictureInPicturePlayback:(BOOL)a3;
- (void)setAllowsVideoFrameAnalysis:(BOOL)a3;
- (void)setShowsPlaybackControls:(BOOL)a3;
- (void)setVideoGravity:(id)a3;
- (void)setVideoOutputDelegate:(id)a3;
- (void)showFullScreenPresentationFromView:(id)a3 completion:(id)a4;
- (void)stopPictureInPicture;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation _MPCVideoViewControllerMediaFoundationImplementation

- (BOOL)respondsToSelector:(SEL)a3
{
  v5 = &unk_26CC42300;
  if ((unint64_t)protocol_getMethodDescription((Protocol *)v5, a3, 1, 1).name
    || (unint64_t)protocol_getMethodDescription((Protocol *)v5, a3, 0, 1).name
    || (unint64_t)protocol_getMethodDescription((Protocol *)v5, a3, 1, 0).name)
  {
  }
  else
  {
    SEL name = protocol_getMethodDescription((Protocol *)v5, a3, 0, 0).name;

    if (!name) {
      goto LABEL_15;
    }
  }
  v6 = NSStringFromSelector(a3);
  v7 = [v6 stringByReplacingOccurrencesOfString:@"playerViewController" withString:@"videoOutput"];

  v8 = NSSelectorFromString(v7);
  v9 = &unk_26CC775C8;
  if ((unint64_t)protocol_getMethodDescription((Protocol *)v9, v8, 1, 1).name
    || (unint64_t)protocol_getMethodDescription((Protocol *)v9, v8, 0, 1).name
    || (unint64_t)protocol_getMethodDescription((Protocol *)v9, v8, 1, 0).name)
  {
  }
  else
  {
    SEL v13 = protocol_getMethodDescription((Protocol *)v9, v8, 0, 0).name;

    if (!v13)
    {

      goto LABEL_15;
    }
  }

  if (!v8)
  {
LABEL_15:
    v15.receiver = self;
    v15.super_class = (Class)_MPCVideoViewControllerMediaFoundationImplementation;
    unsigned __int8 v11 = [(_MPCVideoViewControllerMediaFoundationImplementation *)&v15 respondsToSelector:a3];
    return v11 & 1;
  }
  v10 = [(_MPCVideoViewControllerMediaFoundationImplementation *)self videoOutputDelegate];
  unsigned __int8 v11 = objc_opt_respondsToSelector();

  return v11 & 1;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)_MPCVideoViewControllerMediaFoundationImplementation;
  [(_MPCVideoViewControllerMediaFoundationImplementation *)&v5 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] clearColor];
  v4 = [(_MPCVideoViewControllerMediaFoundationImplementation *)self view];
  [v4 setBackgroundColor:v3];
}

- (_MPCVideoViewControllerMediaFoundationImplementation)initWithPlaybackEngine:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_MPCVideoViewControllerMediaFoundationImplementation;
  objc_super v5 = [(_MPCVideoViewControllerMediaFoundationImplementation *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_playbackEngine, v4);
    [v4 addEngineObserver:v6];
    [(_MPCVideoViewControllerMediaFoundationImplementation *)v6 _updateViewControllerHierarchyForPlaybackEngine:v4];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __79___MPCVideoViewControllerMediaFoundationImplementation_initWithPlaybackEngine___block_invoke;
    v14[3] = &unk_2643C34D8;
    v7 = v6;
    objc_super v15 = v7;
    v7->_stateHandle = __79___MPCVideoViewControllerMediaFoundationImplementation_initWithPlaybackEngine___block_invoke((uint64_t)v14);
    if (MSVDeviceOSIsInternalInstall())
    {
      objc_initWeak(&location, v7);
      v8 = MEMORY[0x263EF83A0];
      id v9 = MEMORY[0x263EF83A0];
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __79___MPCVideoViewControllerMediaFoundationImplementation_initWithPlaybackEngine___block_invoke_3;
      handler[3] = &unk_2643C3930;
      objc_copyWeak(&v12, &location);
      notify_register_dispatch("com.apple.mediaplaybackcore.videodebug", &v7->_videoDebugToken, v8, handler);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
  return v6;
}

- (void)_updateViewControllerHierarchyForPlaybackEngine:(id)a3
{
  id v13 = [a3 player];
  id v4 = [v13 playerViewController];
  p_internalController = &self->_internalController;
  internalController = self->_internalController;
  if (internalController != v4)
  {
    [(_MPCVideoViewControllerMediaFoundationImplementation *)self _transferPropertiesFromOldPlayerController:internalController toNewPlayerController:v4];
    [(AVPlayerViewController *)*p_internalController willMoveToParentViewController:0];
    v7 = [(AVPlayerViewController *)*p_internalController view];
    v8 = [v7 superview];
    id v9 = [(_MPCVideoViewControllerMediaFoundationImplementation *)self view];

    if (v8 == v9)
    {
      v10 = [(AVPlayerViewController *)*p_internalController view];
      [v10 removeFromSuperview];
    }
    [(AVPlayerViewController *)*p_internalController removeFromParentViewController];
    [(_MPCVideoViewControllerMediaFoundationImplementation *)self willChangeValueForKey:@"internalController"];
    objc_storeStrong((id *)&self->_internalController, v4);
    [(AVPlayerViewController *)*p_internalController setDelegate:self];
    [(_MPCVideoViewControllerMediaFoundationImplementation *)self didChangeValueForKey:@"internalController"];
    if (*p_internalController)
    {
      -[_MPCVideoViewControllerMediaFoundationImplementation addChildViewController:](self, "addChildViewController:");
      unsigned __int8 v11 = [(_MPCVideoViewControllerMediaFoundationImplementation *)self view];
      id v12 = [(AVPlayerViewController *)*p_internalController view];
      [v11 addSubview:v12];

      [(AVPlayerViewController *)*p_internalController didMoveToParentViewController:self];
    }
  }
}

- (void)_transferPropertiesFromOldPlayerController:(id)a3 toNewPlayerController:(id)a4
{
  if (a3 && a4)
  {
    id v5 = a4;
    objc_msgSend(v5, "setAllowsVideoFrameAnalysis:", objc_msgSend(a3, "allowsVideoFrameAnalysis"));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalController, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);

  objc_destroyWeak((id *)&self->_videoOutputDelegate);
}

- (AVPlayerViewController)internalController
{
  return self->_internalController;
}

- (MPCPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (MPCPlaybackEngine *)WeakRetained;
}

- (void)setVideoOutputDelegate:(id)a3
{
}

- (MPCVideoOutputDelegate)videoOutputDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_videoOutputDelegate);

  return (MPCVideoOutputDelegate *)WeakRetained;
}

- (BOOL)_isBinCompatApp
{
  v2 = [(_MPCVideoViewControllerMediaFoundationImplementation *)self traitCollection];
  BOOL v3 = [v2 userInterfaceIdiom] == 1;

  return v3;
}

- (id)_stateDictionary
{
  v58[6] = *MEMORY[0x263EF8340];
  BOOL v3 = [(_MPCVideoViewControllerMediaFoundationImplementation *)self playbackEngine];
  id v4 = [(_MPCVideoViewControllerMediaFoundationImplementation *)self parentViewController];
  v49 = v4;
  v50 = [(__CFString *)v3 player];
  v57[0] = @"_obj";
  v48 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
  v58[0] = v48;
  v57[1] = @"videoOutputDelegate";
  uint64_t v5 = [(_MPCVideoViewControllerMediaFoundationImplementation *)self videoOutputDelegate];
  v46 = (void *)v5;
  v47 = v3;
  if (v5) {
    v6 = (__CFString *)v5;
  }
  else {
    v6 = @"@";
  }
  if (v3) {
    v7 = v3;
  }
  else {
    v7 = @"@";
  }
  v58[1] = v6;
  v58[2] = v7;
  v57[2] = @"playbackEngine";
  v57[3] = @"video";
  v55[0] = @"isReadyForDisplay";
  BOOL v8 = [(_MPCVideoViewControllerMediaFoundationImplementation *)self isReadyForDisplay];
  id v9 = @"NO";
  if (v8) {
    id v9 = @"YES";
  }
  v56[0] = v9;
  v55[1] = @"presentationSize";
  [(_MPCVideoViewControllerMediaFoundationImplementation *)self presentationSize];
  v45 = NSStringFromCGSize(v60);
  v56[1] = v45;
  v55[2] = @"videoBounds";
  [(_MPCVideoViewControllerMediaFoundationImplementation *)self videoBounds];
  v44 = NSStringFromCGRect(v61);
  v56[2] = v44;
  v43 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:3];
  v58[3] = v43;
  v57[4] = @"view";
  v53[0] = @"_obj";
  uint64_t v10 = [(_MPCVideoViewControllerMediaFoundationImplementation *)self view];
  v42 = (void *)v10;
  if (v10) {
    unsigned __int8 v11 = (__CFString *)v10;
  }
  else {
    unsigned __int8 v11 = @"@";
  }
  v54[0] = v11;
  v53[1] = @"internalViewController.view";
  v41 = [(_MPCVideoViewControllerMediaFoundationImplementation *)self internalController];
  uint64_t v12 = [v41 view];
  v40 = (void *)v12;
  if (v12) {
    id v13 = (__CFString *)v12;
  }
  else {
    id v13 = @"@";
  }
  v54[1] = v13;
  v53[2] = @"parentViewController.view.recursiveDescription";
  v39 = [(__CFString *)v4 view];
  v38 = [v39 valueForKey:@"recursiveDescription"];
  uint64_t v14 = [v38 componentsSeparatedByString:@"\n"];
  objc_super v15 = (void *)v14;
  if (v14) {
    objc_super v16 = (__CFString *)v14;
  }
  else {
    objc_super v16 = @"@";
  }
  v54[2] = v16;
  v53[3] = @"view.superview";
  v37 = [(_MPCVideoViewControllerMediaFoundationImplementation *)self view];
  uint64_t v17 = [v37 superview];
  v18 = (void *)v17;
  if (v17) {
    v19 = (__CFString *)v17;
  }
  else {
    v19 = @"@";
  }
  v54[3] = v19;
  v53[4] = @"view.superview.recursiveDescription";
  v36 = [(_MPCVideoViewControllerMediaFoundationImplementation *)self view];
  v20 = [v36 superview];
  v21 = [v20 valueForKey:@"recursiveDescription"];
  uint64_t v22 = [v21 componentsSeparatedByString:@"\n"];
  v23 = (void *)v22;
  if (v22) {
    v24 = (__CFString *)v22;
  }
  else {
    v24 = @"@";
  }
  v54[4] = v24;
  v25 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:5];
  v58[4] = v25;
  v57[5] = @"viewController";
  v51[0] = @"playbackEngine.implementation.playerViewController";
  uint64_t v26 = [v50 playerViewController];
  v27 = (void *)v26;
  if (v26) {
    v28 = (__CFString *)v26;
  }
  else {
    v28 = @"@";
  }
  v52[0] = v28;
  v51[1] = @"internalViewController";
  uint64_t v29 = [(_MPCVideoViewControllerMediaFoundationImplementation *)self internalController];
  v30 = (void *)v29;
  if (v29) {
    v31 = (__CFString *)v29;
  }
  else {
    v31 = @"@";
  }
  v51[2] = @"parentViewController";
  v32 = v49;
  if (!v49) {
    v32 = @"@";
  }
  v52[1] = v31;
  v52[2] = v32;
  v33 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:3];
  v58[5] = v33;
  v34 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:6];

  return v34;
}

- (void)setAllowsPictureInPicturePlayback:(BOOL)a3
{
}

- (BOOL)allowsPictureInPicturePlayback
{
  return [(AVPlayerViewController *)self->_internalController allowsPictureInPicturePlayback];
}

- (void)setAllowsVideoFrameAnalysis:(BOOL)a3
{
}

- (BOOL)allowsVideoFrameAnalysis
{
  return [(AVPlayerViewController *)self->_internalController allowsVideoFrameAnalysis];
}

- (void)stopPictureInPicture
{
}

- (void)exitFullScreenWithCompletion:(id)a3
{
  internalController = self->_internalController;
  if (internalController) {
    [(AVPlayerViewController *)internalController exitFullScreenWithCompletion:a3];
  }
  else {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)enterFullScreenWithCompletion:(id)a3
{
  internalController = self->_internalController;
  if (internalController) {
    [(AVPlayerViewController *)internalController enterFullScreenWithCompletion:a3];
  }
  else {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)showFullScreenPresentationFromView:(id)a3 completion:(id)a4
{
  internalController = self->_internalController;
  if (internalController) {
    [(AVPlayerViewController *)internalController showFullScreenPresentationFromView:a3 completion:a4];
  }
  else {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (BOOL)isPictureInPictureActive
{
  return [(AVPlayerViewController *)self->_internalController isPictureInPictureActive];
}

- (BOOL)isReadyForDisplay
{
  if ([(AVPlayerViewController *)self->_internalController isReadyForDisplay]) {
    return 1;
  }
  internalController = self->_internalController;

  return [(AVPlayerViewController *)internalController isPictureInPictureActive];
}

- (CGRect)videoBounds
{
  [(AVPlayerViewController *)self->_internalController videoBounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setVideoGravity:(id)a3
{
}

- (NSString)videoGravity
{
  return [(AVPlayerViewController *)self->_internalController videoGravity];
}

- (CGSize)presentationSize
{
  double v2 = [(AVPlayerViewController *)self->_internalController player];
  double v3 = [v2 currentItem];
  [v3 presentationSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setShowsPlaybackControls:(BOOL)a3
{
}

- (BOOL)showsPlaybackControls
{
  return [(AVPlayerViewController *)self->_internalController showsPlaybackControls];
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  if (self->_internalController)
  {
    internalController = self->_internalController;
    [(AVPlayerViewController *)internalController presentViewController:a3 animated:a4 completion:a5];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_MPCVideoViewControllerMediaFoundationImplementation;
    [(_MPCVideoViewControllerMediaFoundationImplementation *)&v6 presentViewController:a3 animated:a4 completion:a5];
  }
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)_MPCVideoViewControllerMediaFoundationImplementation;
  [(_MPCVideoViewControllerMediaFoundationImplementation *)&v13 viewDidLayoutSubviews];
  double v3 = [(_MPCVideoViewControllerMediaFoundationImplementation *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(AVPlayerViewController *)self->_internalController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = (const char *)[v4 selector];
  double v6 = &unk_26CC42300;
  if ((unint64_t)protocol_getMethodDescription((Protocol *)v6, v5, 1, 1).name
    || (unint64_t)protocol_getMethodDescription((Protocol *)v6, v5, 0, 1).name
    || (unint64_t)protocol_getMethodDescription((Protocol *)v6, v5, 1, 0).name)
  {
  }
  else
  {
    SEL name = protocol_getMethodDescription((Protocol *)v6, v5, 0, 0).name;

    if (!name)
    {
      v16.receiver = self;
      v16.super_class = (Class)_MPCVideoViewControllerMediaFoundationImplementation;
      [(_MPCVideoViewControllerMediaFoundationImplementation *)&v16 forwardInvocation:v4];
      goto LABEL_15;
    }
  }
  double v7 = NSStringFromSelector((SEL)[v4 selector]);
  double v8 = [v7 stringByReplacingOccurrencesOfString:@"playerViewController" withString:@"videoOutput"];

  double v9 = NSSelectorFromString(v8);
  double v10 = &unk_26CC775C8;
  if ((unint64_t)protocol_getMethodDescription((Protocol *)v10, v9, 1, 1).name
    || (unint64_t)protocol_getMethodDescription((Protocol *)v10, v9, 0, 1).name
    || (unint64_t)protocol_getMethodDescription((Protocol *)v10, v9, 1, 0).name)
  {
  }
  else
  {
    SEL v15 = protocol_getMethodDescription((Protocol *)v10, v9, 0, 0).name;

    if (!v15) {
      double v9 = 0;
    }
  }

  double v11 = [(_MPCVideoViewControllerMediaFoundationImplementation *)self videoOutputDelegate];
  uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v13 = NSStringFromSelector(v9);
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = self;
    __int16 v18 = 2114;
    v19 = v13;
    __int16 v20 = 2114;
    v21 = v11;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ forwarding AV invocation %{public}@ to delegate %{public}@", buf, 0x20u);
  }
  if (v9 && v11)
  {
    [v4 setSelector:v9];
    *(void *)buf = self;
    [v4 setArgument:buf atIndex:2];
    [v4 invokeWithTarget:v11];
  }

LABEL_15:
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p internalViewController=%@>", objc_opt_class(), self, self->_internalController];
}

- (void)dealloc
{
  MEMORY[0x21D49D7C0](self->_stateHandle, a2);
  notify_cancel(self->_videoDebugToken);
  v3.receiver = self;
  v3.super_class = (Class)_MPCVideoViewControllerMediaFoundationImplementation;
  [(_MPCVideoViewControllerMediaFoundationImplementation *)&v3 dealloc];
}

+ (id)keyPathsForValuesAffectingAllowsPictureInPicturePlayback
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"internalController.allowsPictureInPicturePlayback", 0);
}

+ (id)keyPathsForValuesAffectingIsPictureInPictureActive
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"internalController.isPictureInPictureActive"];
}

+ (id)keyPathsForValuesAffectingIsReadyForDisplay
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"internalController.isReadyForDisplay", @"internalController.isPictureInPictureActive", 0);
}

+ (id)keyPathsForValuesAffectingVideoBounds
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"internalController.videoBounds"];
}

+ (id)keyPathsForValuesAffectingVideoGravity
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"internalController.videoGravity"];
}

+ (id)keyPathsForValuesAffectingPresentationSize
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"internalController.player.currentItem.presentationSize"];
}

+ (id)keyPathsForValuesAffectingShowsPlaybackControls
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"internalController.showsPlaybackControls"];
}

@end