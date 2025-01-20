@interface MPVolumeSlider
- (BOOL)_isOffScreen;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isInOptimisticState;
- (BOOL)isOnScreenForVolumeDisplay;
- (BOOL)isTracking;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)hitRect;
- (MPAVEndpointRoute)groupRoute;
- (MPAVOutputDeviceRoute)outputDeviceRoute;
- (MPAVRoute)route;
- (MPVolumeController)volumeController;
- (MPVolumeSlider)initWithFrame:(CGRect)a3;
- (MPVolumeSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (MPVolumeSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4 endpointRoute:(id)a5 outputDeviceRoute:(id)a6;
- (NSString)description;
- (NSString)volumeAudioCategory;
- (NSString)volumeControlLabel;
- (UIEdgeInsets)hitRectInsets;
- (UIImage)volumeWarningTrackImage;
- (UILayoutGuide)trackLayoutGuide;
- (UIView)thumbView;
- (UIWindowScene)windowSceneForVolumeDisplay;
- (_UISliderFluidConfiguration)configuration;
- (double)expansionFactor;
- (float)maximumValue;
- (float)minimumValue;
- (float)optimisticValue;
- (id)_routeName;
- (id)createThumbView;
- (int64_t)style;
- (void)_commitVolumeChange;
- (void)_setIsOffScreen:(BOOL)a3;
- (void)_sliderFluidInteractionWillBegin:(id)a3 withLocation:(CGPoint)a4;
- (void)_sliderFluidInteractionWillEnd:(id)a3;
- (void)_updateVolumeAnimated:(BOOL)a3 silenceVolumeHUD:(BOOL)a4;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)setAlpha:(double)a3;
- (void)setConfiguration:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setExpansionFactor:(double)a3;
- (void)setGroupRoute:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHitRectInsets:(UIEdgeInsets)a3;
- (void)setOptimisticState:(BOOL)a3;
- (void)setOptimisticValue:(float)a3;
- (void)setOutputDeviceRoute:(id)a3;
- (void)setRoute:(id)a3;
- (void)setValue:(float)a3 animated:(BOOL)a4;
- (void)setVolumeController:(id)a3;
- (void)setVolumeDataSource:(id)a3;
- (void)setVolumeWarningTrackImage:(id)a3;
- (void)updateConstraints;
- (void)updateVolume;
- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4;
- (void)volumeController:(id)a3 volumeControlCapabilitiesDidChange:(unsigned int)a4;
- (void)volumeController:(id)a3 volumeControlLabelDidChange:(id)a4;
- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4 silenceVolumeHUD:(BOOL)a5;
@end

@implementation MPVolumeSlider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceRoute, 0);
  objc_storeStrong((id *)&self->_groupRoute, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_trackLayoutGuide, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_volumeWarningTrackImage, 0);

  objc_storeStrong((id *)&self->_thumbImageView, 0);
}

- (void)setOptimisticValue:(float)a3
{
  self->_optimisticValue = a3;
}

- (float)optimisticValue
{
  return self->_optimisticValue;
}

- (void)setOptimisticState:(BOOL)a3
{
  self->_optimisticState = a3;
}

- (BOOL)isInOptimisticState
{
  return self->_optimisticState;
}

- (MPAVOutputDeviceRoute)outputDeviceRoute
{
  return self->_outputDeviceRoute;
}

- (MPAVEndpointRoute)groupRoute
{
  return self->_groupRoute;
}

- (MPVolumeController)volumeController
{
  return self->_volumeController;
}

- (UILayoutGuide)trackLayoutGuide
{
  return self->_trackLayoutGuide;
}

- (void)setHitRectInsets:(UIEdgeInsets)a3
{
  self->_hitRectInsets = a3;
}

- (UIEdgeInsets)hitRectInsets
{
  double top = self->_hitRectInsets.top;
  double left = self->_hitRectInsets.left;
  double bottom = self->_hitRectInsets.bottom;
  double right = self->_hitRectInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setConfiguration:(id)a3
{
}

- (_UISliderFluidConfiguration)configuration
{
  return self->_configuration;
}

- (void)setVolumeWarningTrackImage:(id)a3
{
}

- (UIImage)volumeWarningTrackImage
{
  return self->_volumeWarningTrackImage;
}

- (int64_t)style
{
  return self->_style;
}

- (id)_routeName
{
  v3 = [(MPVolumeSlider *)self volumeController];
  v4 = [v3 dataSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [(MPVolumeSlider *)self volumeController];
    v7 = [v6 dataSource];

    v8 = [v7 outputDeviceRoute];
    v9 = [v8 routeName];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      v12 = [(MPVolumeSlider *)self groupRoute];
      id v11 = [v12 routeName];
    }
  }
  else
  {
    MRAVEndpointGetLocalEndpoint();
    id v11 = (id)MRAVEndpointCopyLocalizedName();
  }

  return v11;
}

- (void)_updateVolumeAnimated:(BOOL)a3 silenceVolumeHUD:(BOOL)a4
{
  BOOL v5 = a3;
  BOOL v7 = [(MPVolumeController *)self->_volumeController isVolumeControlAvailable];
  [(MPVolumeController *)self->_volumeController volumeValue];
  float v9 = v8;
  [(MPVolumeSlider *)self setEnabled:v7];
  [(MPVolumeSlider *)self value];
  *(float *)&double v10 = *(float *)&v10 - v9;
  if (*(float *)&v10 < 0.0) {
    *(float *)&double v10 = -*(float *)&v10;
  }
  if (*(float *)&v10 > 0.00000011921)
  {
    v11.receiver = self;
    v11.super_class = (Class)MPVolumeSlider;
    *(float *)&double v10 = v9;
    [(MPVolumeSlider *)&v11 setValue:v5 animated:v10];
    if (!a4) {
      [(MPVolumeSlider *)self sendActionsForControlEvents:4096];
    }
  }
}

- (void)_commitVolumeChange
{
  volumeController = self->_volumeController;
  [(MPVolumeSlider *)self value];
  -[MPVolumeController setVolumeValue:](volumeController, "setVolumeValue:");

  [(MPVolumeSlider *)self sendActionsForControlEvents:4096];
}

- (UIView)thumbView
{
  return (UIView *)self->_thumbImageView;
}

- (void)_setIsOffScreen:(BOOL)a3
{
  self->_forcingOffscreenVisibility = 1;
  if (self->_isOffScreen != a3)
  {
    self->_isOffScreen = a3;
    BOOL v5 = +[MPVolumeHUDController sharedInstance];
    [v5 setNeedsUpdate];

    if (!a3)
    {
      v6 = [(MPVolumeSlider *)self superview];

      if (v6)
      {
        id v7 = [(MPVolumeSlider *)self volumeController];
        [v7 updateVolumeValue];
      }
    }
  }
}

- (BOOL)_isOffScreen
{
  v3 = [(MPVolumeSlider *)self window];

  if (v3)
  {
    if (self->_forcingOffscreenVisibility)
    {
      LOBYTE(v4) = self->_isOffScreen;
    }
    else
    {
      BOOL v5 = self;
      while (([(MPVolumeSlider *)v5 isHidden] & 1) == 0)
      {
        [(MPVolumeSlider *)v5 alpha];
        if (v6 < 0.00000011920929) {
          break;
        }
        uint64_t v4 = [(MPVolumeSlider *)v5 superview];

        BOOL v5 = (MPVolumeSlider *)v4;
        if (!v4) {
          goto LABEL_11;
        }
      }
      LOBYTE(v4) = 1;
LABEL_11:
    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)_sliderFluidInteractionWillEnd:(id)a3
{
  self->_isFluidTracking = 0;
  [(MPVolumeSlider *)self _commitVolumeChange];

  [(MPVolumeSlider *)self sendActionsForControlEvents:64];
}

- (void)_sliderFluidInteractionWillBegin:(id)a3 withLocation:(CGPoint)a4
{
  self->_isFluidTracking = 1;
  -[MPVolumeSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 1, a4.x, a4.y);
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4 silenceVolumeHUD:(BOOL)a5
{
  BOOL v5 = a5;
  if (![(MPVolumeSlider *)self isTracking])
  {
    [(MPVolumeSlider *)self _updateVolumeAnimated:1 silenceVolumeHUD:v5];
  }
}

- (void)volumeController:(id)a3 volumeControlLabelDidChange:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 postNotificationName:@"MPVolumeSliderVolumeControlLabelDidChangeNotification" object:self];
}

- (void)volumeController:(id)a3 volumeControlCapabilitiesDidChange:(unsigned int)a4
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, *(void *)&a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 postNotificationName:@"MPVolumeSliderVolumeControlCapabilitiesDidChangeNotification" object:self];
}

- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4
{
  [(MPVolumeSlider *)self _updateVolumeAnimated:1 silenceVolumeHUD:0];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"MPVolumeSliderVolumeControlAvailabilityDidChangeNotification" object:self];
}

- (NSString)volumeAudioCategory
{
  return [(MPVolumeController *)self->_volumeController volumeAudioCategory];
}

- (BOOL)isOnScreenForVolumeDisplay
{
  return ![(MPVolumeSlider *)self _isOffScreen];
}

- (UIWindowScene)windowSceneForVolumeDisplay
{
  v2 = [(MPVolumeSlider *)self window];
  v3 = [v2 windowScene];

  return (UIWindowScene *)v3;
}

- (void)updateVolume
{
  v3 = [(MPVolumeSlider *)self volumeController];

  if (v3)
  {
    [(MPVolumeSlider *)self _updateVolumeAnimated:0 silenceVolumeHUD:0];
  }
}

- (void)setExpansionFactor:(double)a3
{
  id v5 = [(MPVolumeSlider *)self configuration];
  [v5 setExpansionFactor:a3];
  [(MPVolumeSlider *)self _setSliderConfiguration:v5];
}

- (double)expansionFactor
{
  v2 = [(MPVolumeSlider *)self configuration];
  [v2 expansionFactor];
  double v4 = v3;

  return v4;
}

- (void)setVolumeDataSource:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412802;
    uint64_t v8 = objc_opt_class();
    __int16 v9 = 2048;
    double v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "[MPVolumeSlider] <%@: %p> setVolumeDataSource: %@", (uint8_t *)&v7, 0x20u);
  }

  [(MPVolumeController *)self->_volumeController setDataSource:v4];
  double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"MPVolumeSliderVolumeControlLabelDidChangeNotification" object:self];
}

- (void)setOutputDeviceRoute:(id)a3
{
  p_outputDeviceRoute = &self->_outputDeviceRoute;
  int v7 = (MPAVOutputDeviceRoute *)a3;
  if (*p_outputDeviceRoute != v7)
  {
    objc_storeStrong((id *)&self->_outputDeviceRoute, a3);
    if (self->_groupRoute)
    {
      double v6 = [[MPVolumeControllerRouteDataSource alloc] initWithGroupRoute:self->_groupRoute outputDeviceRoute:*p_outputDeviceRoute];
      [(MPVolumeSlider *)self setVolumeDataSource:v6];
    }
  }
}

- (void)setGroupRoute:(id)a3
{
  id v5 = (MPAVEndpointRoute *)a3;
  if (self->_groupRoute != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)&self->_groupRoute, a3);
    if (self->_outputDeviceRoute || ![(MPAVEndpointRoute *)v8 isDeviceRoute]) {
      double v6 = [[MPVolumeControllerRouteDataSource alloc] initWithGroupRoute:v8 outputDeviceRoute:self->_outputDeviceRoute];
    }
    else {
      double v6 = objc_alloc_init(MPVolumeControllerSystemDataSource);
    }
    int v7 = v6;
    [(MPVolumeSlider *)self setVolumeDataSource:v6];

    id v5 = v8;
  }
}

- (void)setRoute:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"MPVolumeSlider.m" lineNumber:248 description:@"MPVolumeSlider.route must be an MPAVEndpointRoute"];
  }
  [(MPVolumeSlider *)self setGroupRoute:v6];
}

- (void)setVolumeController:(id)a3
{
  id v5 = (MPVolumeController *)a3;
  p_volumeController = &self->_volumeController;
  if (self->_volumeController != v5)
  {
    int v7 = v5;
    objc_storeStrong((id *)&self->_volumeController, a3);
    [(MPVolumeController *)*p_volumeController setDelegate:self];
    [(MPVolumeController *)*p_volumeController updateVolumeValue];
    id v5 = v7;
  }
}

- (MPAVRoute)route
{
  return (MPAVRoute *)self->_groupRoute;
}

- (NSString)volumeControlLabel
{
  return [(MPVolumeController *)self->_volumeController volumeControlLabel];
}

- (BOOL)isTracking
{
  if (self->_isFluidTracking) {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)MPVolumeSlider;
  return [(MPVolumeSlider *)&v3 isTracking];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MPVolumeSlider *)self isEnabled] != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)MPVolumeSlider;
    [(MPVolumeSlider *)&v7 setEnabled:v3];
    [(MPVolumeSlider *)self _setMinimumTrackVisible:v3 withDuration:0.0];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __29__MPVolumeSlider_setEnabled___block_invoke;
    v5[3] = &unk_1E57F9E08;
    v5[4] = self;
    BOOL v6 = v3;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v5];
  }
}

void __29__MPVolumeSlider_setEnabled___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  else {
    double v1 = 0.0;
  }
  id v2 = [*(id *)(a1 + 32) thumbView];
  [v2 setAlpha:v1];
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPVolumeSlider;
  [(MPVolumeSlider *)&v4 setHidden:a3];
  BOOL v3 = +[MPVolumeHUDController sharedInstance];
  [v3 setNeedsUpdate];
}

- (void)setAlpha:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPVolumeSlider;
  [(MPVolumeSlider *)&v4 setAlpha:a3];
  BOOL v3 = +[MPVolumeHUDController sharedInstance];
  [v3 setNeedsUpdate];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(MPVolumeSlider *)self hitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (CGRect)hitRect
{
  v13.receiver = self;
  v13.super_class = (Class)MPVolumeSlider;
  [(MPVolumeSlider *)&v13 hitRect];
  double top = self->_hitRectInsets.top;
  double left = self->_hitRectInsets.left;
  double v6 = v5 + left;
  double v8 = v7 + top;
  double v10 = v9 - (left + self->_hitRectInsets.right);
  double v12 = v11 - (top + self->_hitRectInsets.bottom);
  result.size.height = v12;
  result.size.width = v10;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v6;
  return result;
}

- (void)didMoveToWindow
{
  BOOL v3 = [(MPVolumeSlider *)self window];

  objc_super v4 = +[MPVolumeHUDController sharedInstance];
  id v5 = v4;
  if (v3) {
    [v4 addVolumeDisplay:self];
  }
  else {
    [v4 removeVolumeDisplay:self];
  }
}

- (void)didMoveToSuperview
{
  BOOL v3 = [(MPVolumeSlider *)self superview];

  if (v3) {
    [(MPVolumeController *)self->_volumeController updateVolumeValue];
  }
  id v4 = +[MPVolumeHUDController sharedInstance];
  [v4 setNeedsUpdate];
}

- (void)updateConstraints
{
  v21[4] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)MPVolumeSlider;
  [(MPVolumeSlider *)&v20 updateConstraints];
  if (self->_style)
  {
    BOOL v3 = self;
  }
  else
  {
    BOOL v3 = [(MPVolumeSlider *)self _maxTrackView];
  }
  id v4 = v3;
  if (!self->_configuredLayoutGuide && v3 != 0)
  {
    self->_configuredLayoutGuide = 1;
    v15 = (void *)MEMORY[0x1E4F28DC8];
    v19 = [(UILayoutGuide *)self->_trackLayoutGuide topAnchor];
    v18 = [(MPVolumeSlider *)v4 topAnchor];
    v17 = [v19 constraintEqualToAnchor:v18];
    v21[0] = v17;
    v16 = [(UILayoutGuide *)self->_trackLayoutGuide bottomAnchor];
    double v6 = [(MPVolumeSlider *)v4 bottomAnchor];
    double v7 = [v16 constraintEqualToAnchor:v6];
    v21[1] = v7;
    double v8 = [(UILayoutGuide *)self->_trackLayoutGuide leadingAnchor];
    double v9 = [(MPVolumeSlider *)v4 leadingAnchor];
    double v10 = [v8 constraintEqualToAnchor:v9];
    v21[2] = v10;
    double v11 = [(UILayoutGuide *)self->_trackLayoutGuide trailingAnchor];
    double v12 = [(MPVolumeSlider *)v4 trailingAnchor];
    objc_super v13 = [v11 constraintEqualToAnchor:v12];
    v21[3] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
    [v15 activateConstraints:v14];
  }
}

- (void)cancelTrackingWithEvent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPVolumeSlider;
  [(MPVolumeSlider *)&v4 cancelTrackingWithEvent:a3];
  if (!self->_configuration) {
    [(MPVolumeSlider *)self _commitVolumeChange];
  }
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MPVolumeSlider;
  [(MPVolumeSlider *)&v5 endTrackingWithTouch:a3 withEvent:a4];
  if (!self->_configuration) {
    [(MPVolumeSlider *)self _commitVolumeChange];
  }
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MPVolumeSlider;
  BOOL v5 = [(MPVolumeSlider *)&v7 continueTrackingWithTouch:a3 withEvent:a4];
  if (!self->_configuration) {
    [(MPVolumeSlider *)self _commitVolumeChange];
  }
  return v5;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(MPVolumeSlider *)self isEnabled];
  if ([(MPVolumeSlider *)self isEnabled])
  {
    [(MPVolumeController *)self->_volumeController setMuted:0];
    v10.receiver = self;
    v10.super_class = (Class)MPVolumeSlider;
    [(MPVolumeSlider *)&v10 beginTrackingWithTouch:v6 withEvent:v7];
  }

  return v8;
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(MPVolumeSlider *)self isTracking])
  {
    LODWORD(v8) = 1.0;
    *(float *)&double v7 = a3;
    [(MPVolumeController *)self->_volumeController setVolume:v7 withNotificationDelay:v8];
  }
  v9.receiver = self;
  v9.super_class = (Class)MPVolumeSlider;
  *(float *)&double v7 = a3;
  [(MPVolumeSlider *)&v9 setValue:v4 animated:v7];
}

- (float)minimumValue
{
  return 0.0;
}

- (float)maximumValue
{
  return 1.0;
}

- (id)createThumbView
{
  v7.receiver = self;
  v7.super_class = (Class)MPVolumeSlider;
  BOOL v3 = [(MPVolumeSlider *)&v7 createThumbView];
  thumbImageView = self->_thumbImageView;
  self->_thumbImageView = v3;

  BOOL v5 = self->_thumbImageView;

  return v5;
}

- (void)dealloc
{
  [(MPVolumeController *)self->_volumeController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MPVolumeSlider;
  [(MPVolumeSlider *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(MPVolumeSlider *)self value];
  double v6 = v5;
  objc_super v7 = [(MPVolumeSlider *)self volumeController];
  double v8 = [v7 dataSource];
  objc_super v9 = [v3 stringWithFormat:@"<%@: %p value: %f dataSource: %@", v4, self, *(void *)&v6, v8];

  return (NSString *)v9;
}

- (MPVolumeSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4 endpointRoute:(id)a5 outputDeviceRoute:(id)a6
{
  double v9 = *MEMORY[0x1E4F1DB28];
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v13 = a6;
  id v14 = a5;
  v15 = -[MPVolumeSlider initWithFrame:style:](self, "initWithFrame:style:", a4, v9, v10, v11, v12);
  v16 = [MPVolumeController alloc];
  v17 = [[MPVolumeControllerRouteDataSource alloc] initWithGroupRoute:v14 outputDeviceRoute:v13];

  v18 = [(MPVolumeController *)v16 initWithDataSource:v17];
  [(MPVolumeSlider *)v15 setVolumeController:v18];

  v19 = [(MPVolumeSlider *)v15 volumeController];
  [v19 setDelegate:v15];

  return v15;
}

- (MPVolumeSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  if (a3.size.height < 34.0) {
    a3.size.height = 34.0;
  }
  v21.receiver = self;
  v21.super_class = (Class)MPVolumeSlider;
  float v5 = -[MPVolumeSlider initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    int v7 = _os_feature_enabled_impl();
    if (a4 == 1)
    {
      if (v7) {
        uint64_t v8 = 111;
      }
      else {
        uint64_t v8 = 110;
      }
      [(MPVolumeSlider *)v6 _setSliderStyle:v8];
      double v9 = (_UISliderFluidConfiguration *)objc_alloc_init(MEMORY[0x1E4FB22B8]);
      configuration = v6->_configuration;
      v6->_configuration = v9;

      [(_UISliderFluidConfiguration *)v6->_configuration setStretchLimit:12.0];
      [(_UISliderFluidConfiguration *)v6->_configuration setDelegate:v6];
      [(MPVolumeSlider *)v6 _setSliderConfiguration:v6->_configuration];
    }
    else if (v7)
    {
      [(MPVolumeSlider *)v6 _setSliderStyle:101];
    }
    double v11 = objc_alloc_init(MPVolumeController);
    volumeController = v6->_volumeController;
    v6->_volumeController = v11;

    [(MPVolumeController *)v6->_volumeController setDelegate:v6];
    id v13 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
    trackLayoutGuide = v6->_trackLayoutGuide;
    v6->_trackLayoutGuide = v13;

    [(MPVolumeSlider *)v6 addLayoutGuide:v6->_trackLayoutGuide];
    v15 = [MEMORY[0x1E4FB16C8] currentDevice];
    [v15 userInterfaceIdiom];
    UIEdgeInsetsMakeWithEdges();
    v6->_hitRectInsets.double top = v16;
    v6->_hitRectInsets.double left = v17;
    v6->_hitRectInsets.double bottom = v18;
    v6->_hitRectInsets.double right = v19;

    v6->_isOffScreen = 1;
  }
  return v6;
}

- (MPVolumeSlider)initWithFrame:(CGRect)a3
{
  return -[MPVolumeSlider initWithFrame:style:](self, "initWithFrame:style:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end