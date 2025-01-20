@interface NTKCollieFaceView
+ (CGSize)_snapshotImageSize;
+ (double)avatarFramingTopMargin;
+ (double)preferredMemojiFieldOfView;
+ (id)_backgroundMaskFromImageNamed:(id)a3 size:(CGSize)a4;
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
+ (int64_t)uiSensitivity;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_timeLabelUsesLegibility;
- (BOOL)_wheelChangedWithEvent:(id)a3;
- (CGPoint)_fractionalLocationOfGesture:(id)a3 inView:(id)a4;
- (CGRect)_dateComplicationFrame;
- (NTKCollieFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_keylineCornerRadiusForComplicationSlot:(id)a3;
- (double)_minimumBreathingScaleForComplicationSlot:(id)a3;
- (double)keylineStyleForComplicationSlot:(id)a3;
- (id)_bgColorForEditMode:(int64_t)a3;
- (id)_dateComplicationFont;
- (id)_detachedComplicationDisplays;
- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4;
- (id)_existingSnapshotImageForOption:(id)a3 state:(unint64_t)a4;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_resolveStyleEditOption:(id)a3 resolveToyBox:(BOOL)a4;
- (id)_snapshotImageForOption:(id)a3;
- (id)_snapshotImageForOption:(id)a3 machineState:(unint64_t)a4 resolveToyBox:(BOOL)a5 force:(BOOL)a6;
- (id)_snapshotImageForOption:(id)a3 resolveToyBox:(BOOL)a4;
- (id)_snapshotImageFromCurrentAvatarForEditMode:(int64_t)a3;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5 refreshHandler:(id)a6;
- (int64_t)_complicationPickerStyleForSlot:(id)a3;
- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (unint64_t)_timeLabelOptions;
- (void)_addSecondActivities;
- (void)_addTapGestureRecognizers;
- (void)_applyDataMode;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_asyncSetImageView0:(id)a3 imageView1:(id)a4 image:(id)a5 forOption:(id)a6 state:(unint64_t)a7 completion:(id)a8;
- (void)_asyncSetImageView:(id)a3 image:(id)a4 forOption:(id)a5 state:(unint64_t)a6;
- (void)_asyncSetImageViewsForOption:(id)a3 state:(unint64_t)a4 resolveToyBox:(BOOL)a5;
- (void)_avatarStoreDidChange:(id)a3;
- (void)_becameActiveFace;
- (void)_becameInactiveFace;
- (void)_cleanupAfterEditing;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_didFirstUnlock;
- (void)_handleOrdinaryScreenWake;
- (void)_handleWristRaiseScreenWake;
- (void)_loadAvatarAsyncForOption:(id)a3 completion:(id)a4;
- (void)_loadLayoutRules;
- (void)_loadSharedViews;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_pushBackMachineStateResetTimer:(double)a3 completionHandler:(id)a4;
- (void)_reloadToyBoxAvatar;
- (void)_removeTapGestureRecognizers;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_reorderSwitcherSnapshotView;
- (void)_reportStats;
- (void)_restartRenderForAvatar:(id)a3 fromState:(unint64_t)a4 completion:(id)a5;
- (void)_setBackgroundAlpha:(double)a3 contentAlpha:(double)a4 complicationsAlpha:(double)a5 complicationsColor:(id)a6 timeAlpha:(double)a7 timeColor:(id)a8;
- (void)_setBackgroundAlpha:(double)a3 contentAlpha:(double)a4 timeComplicationsColor:(id)a5;
- (void)_setBackgroundColor:(id)a3 radiance:(double)a4;
- (void)_setComplicationsColor:(id)a3;
- (void)_setContentAlpha:(double)a3 complicationsAlpha:(double)a4 complicationsColor:(id)a5 timeAlpha:(double)a6 timeColor:(id)a7;
- (void)_setContentOpaqueTimeAlpha:(double)a3 complicationsAlpha:(double)a4;
- (void)_setNumerals:(unint64_t)a3;
- (void)_startMachineFromState:(unint64_t)a3;
- (void)_stopMachineImmediate:(BOOL)a3;
- (void)_stopSecondActivities;
- (void)_topOfTheMinuteReached;
- (void)_transitionBackgroundToBlackImmediate:(BOOL)a3;
- (void)_transitionBackgroundToColor;
- (void)_transitionFromAvatarToImageForOption:(id)a3 toState:(unint64_t)a4 immediate:(BOOL)a5 retainAvatar:(BOOL)a6;
- (void)_transitionFromAvatarToImageForOption:(id)a3 toState:(unint64_t)a4 immediate:(BOOL)a5 retainAvatar:(BOOL)a6 completion:(id)a7;
- (void)_transitionFromAvatarToImageForOption:(id)a3 toState:(unint64_t)a4 immediate:(BOOL)a5 retainAvatar:(BOOL)a6 forceImage:(BOOL)a7;
- (void)_transitionFromAvatarToImageForOption:(id)a3 toState:(unint64_t)a4 immediate:(BOOL)a5 retainAvatar:(BOOL)a6 forceImage:(BOOL)a7 completion:(id)a8;
- (void)_transitionFromAvatarToImagePart2ForOption:(id)a3 toState:(unint64_t)a4 retainAvatar:(BOOL)a5 forceImage:(BOOL)a6;
- (void)_transitionFromAvatarToImagePart3ForOption:(id)a3 immediate:(BOOL)a4 retainAvatar:(BOOL)a5;
- (void)_transitionFromImageToAvatarForOption:(id)a3 fromState:(unint64_t)a4;
- (void)_transitionFromImageToAvatarForOption:(id)a3 fromState:(unint64_t)a4 completion:(id)a5;
- (void)_transitionFromImageToCurrentAvatarImmediate:(BOOL)a3;
- (void)_transitionToMachineState:(unint64_t)a3;
- (void)_transitionToMachineState:(unint64_t)a3 immediate:(BOOL)a4;
- (void)_unloadAvatar;
- (void)_unloadSharedViews;
- (void)_unloadSnapshotContentViews;
- (void)_viewSingleTapped:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)populateFaceViewEditOptionsFromFace:(id)a3;
- (void)screenDidTurnOffAnimated:(BOOL)a3;
- (void)sensitiveUIStateChanged;
- (void)willMoveToWindow:(id)a3;
@end

@implementation NTKCollieFaceView

- (id)_dateComplicationFont
{
  long long v7 = 0u;
  long long v8 = 0u;
  v2 = [(NTKCollieFaceView *)self device];
  sub_A890(v2, (uint64_t)&v6);

  double v3 = *((double *)&v7 + 1);
  uint64_t v4 = CLKRoundedFontDesignName;

  return +[CLKFont systemFontOfSize:v4 weight:v3 design:UIFontWeightMedium];
}

- (CGRect)_dateComplicationFrame
{
  double v3 = [(NTKCollieFaceView *)self device];
  sub_A890(v3, (uint64_t)&v21);

  uint64_t v4 = [(NTKCollieFaceView *)self _dateComplicationFont];
  [v4 ascender];
  [v4 descender];
  v5 = [(NTKCollieFaceView *)self device];
  CLKRoundForDevice();
  double v7 = v6;

  long long v8 = [(NTKCollieFaceView *)self device];
  CLKRoundForDevice();
  double v10 = v9;

  v11 = [(NTKCollieFaceView *)self device];
  CLKRoundForDevice();
  double v13 = v12;

  [(NTKCollieFaceView *)self bounds];
  v14 = [(NTKCollieFaceView *)self device];
  CLKRoundForDevice();
  double v16 = v15;

  double v17 = v16;
  double v18 = v13;
  double v19 = v10;
  double v20 = v7;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

+ (CGSize)_snapshotImageSize
{
  v2 = +[CLKDevice currentDevice];
  [v2 screenBounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

+ (double)preferredMemojiFieldOfView
{
  v2 = +[CLKDevice currentDevice];
  long long v6 = 0u;
  memset(v5, 0, sizeof(v5));
  sub_A890(v2, (uint64_t)v5);
  double v3 = *((double *)&v6 + 1);

  return v3;
}

+ (double)avatarFramingTopMargin
{
  v2 = +[CLKDevice currentDevice];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v5 = 0u;
  sub_A890(v2, (uint64_t)&v5);
  double v3 = *(double *)&v6;

  return v3;
}

+ (id)_backgroundMaskFromImageNamed:(id)a3 size:(CGSize)a4
{
  return +[NTKCollieFaceBundle imageWithName:](NTKCollieFaceBundle, "imageWithName:", a3, a4.width, a4.height);
}

- (void)_setBackgroundColor:(id)a3 radiance:(double)a4
{
}

- (void)_setComplicationsColor:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  _OWORD v5[2] = sub_AC64;
  v5[3] = &unk_28B28;
  id v6 = a3;
  id v4 = v6;
  [(NTKCollieFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v5];
}

- (void)_setContentAlpha:(double)a3 complicationsAlpha:(double)a4 complicationsColor:(id)a5 timeAlpha:(double)a6 timeColor:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  v14 = [(NTKCollieFaceView *)self contentView];
  [v14 setAlpha:a3];

  double v15 = [(NTKCollieFaceView *)self complicationContainerView];
  [v15 setAlpha:a4];

  [(NTKCollieFaceView *)self _setComplicationsColor:v13];
  double v16 = [(NTKCollieFaceView *)self timeView];
  [v16 setAlpha:a6];

  id v17 = [(NTKCollieFaceView *)self timeView];
  [v17 setTextColor:v12];
}

- (void)_setBackgroundAlpha:(double)a3 contentAlpha:(double)a4 complicationsAlpha:(double)a5 complicationsColor:(id)a6 timeAlpha:(double)a7 timeColor:(id)a8
{
  backgroundColorView = self->_backgroundColorView;
  id v15 = a8;
  id v16 = a6;
  [(UIView *)backgroundColorView setAlpha:a3];
  [(NTKCollieFaceView *)self _setContentAlpha:v16 complicationsAlpha:v15 complicationsColor:a4 timeAlpha:a5 timeColor:a7];
}

- (void)_setBackgroundAlpha:(double)a3 contentAlpha:(double)a4 timeComplicationsColor:(id)a5
{
}

- (void)_setContentOpaqueTimeAlpha:(double)a3 complicationsAlpha:(double)a4
{
  id v7 = +[UIColor whiteColor];
  [(NTKCollieFaceView *)self _setContentAlpha:v7 complicationsAlpha:v7 complicationsColor:1.0 timeAlpha:a4 timeColor:a3];
}

- (id)_snapshotImageFromCurrentAvatarForEditMode:(int64_t)a3
{
  avtView = self->_avtView;
  [(NTKCollieFaceView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [(NTKCollieFaceView *)self device];
  [v13 screenScale];
  id v15 = -[CLKUIMetalQuadView snapshotInRect:scale:time:](avtView, "snapshotInRect:scale:time:", v6, v8, v10, v12, v14, CACurrentMediaTime());

  return v15;
}

- (NTKCollieFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  double v10 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1871C();
  }

  v35.receiver = self;
  v35.super_class = (Class)NTKCollieFaceView;
  double v11 = [(NTKCollieFaceView *)&v35 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:v9];
  if (v11)
  {
    double v12 = [NTKCollieFaceViewComplicationFactory alloc];
    id v13 = [(NTKCollieFaceView *)v11 device];
    id v14 = [(NTKCollieFaceViewComplicationFactory *)v12 initForDevice:v13];

    v36[0] = NTKComplicationSlotBottom;
    v36[1] = NTKComplicationSlotDate;
    id v15 = +[NSArray arrayWithObjects:v36 count:2];
    [v14 setSupportedComplicationSlots:v15];

    [v14 setUsesLegibility:1 faceView:v11];
    id v16 = +[UIColor whiteColor];
    [v14 setForegroundColor:v16 faceView:v11];

    [v14 setAlpha:v11 faceView:1.0];
    objc_storeStrong((id *)&v11->_collieFaceViewComplicationFactory, v14);
    v11->_numberSystem = -1;
    id v17 = +[CLKSensitiveUIMonitor sharedMonitor];
    [v17 addSensitiveUIObserver:v11];

    uint64_t v18 = +[UIColor colorWithRed:0.105882354 green:0.105882354 blue:0.105882354 alpha:1.0];
    complicationsEditModeColor = v11->_complicationsEditModeColor;
    v11->_complicationsEditModeColor = (UIColor *)v18;

    double v20 = (AVTAvatarPhysicsState *)objc_alloc_init((Class)AVTAvatarPhysicsState);
    nullPhysicsState = v11->_nullPhysicsState;
    v11->_nullPhysicsState = v20;

    int out_token = 0;
    objc_initWeak(&location, v11);
    v22 = dispatch_get_global_queue(25, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_B3E8;
    handler[3] = &unk_28B50;
    objc_copyWeak(&v32, &location);
    notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, v22, handler);

    v23 = +[NSNotificationCenter defaultCenter];
    v24 = +[NSOperationQueue mainQueue];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_B440;
    v29[3] = &unk_28B78;
    objc_copyWeak(&v30, &location);
    uint64_t v25 = [v23 addObserverForName:@"NTKCollieAvatarStoreDidChangeNotification" object:0 queue:v24 usingBlock:v29];
    id avatarChangedObserver = v11->_avatarChangedObserver;
    v11->_id avatarChangedObserver = (id)v25;

    v27 = v11;
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  return v11;
}

- (void)dealloc
{
  if (self->_avatarChangedObserver)
  {
    double v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_avatarChangedObserver];
  }
  id v4 = +[CLKSensitiveUIMonitor sharedMonitor];
  [v4 removeSensitiveUIObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)NTKCollieFaceView;
  [(NTKCollieFaceView *)&v5 dealloc];
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCollieFaceView;
  [(NTKCollieFaceView *)&v4 _renderSynchronouslyWithImageQueueDiscard:a3 inGroup:a4];
}

- (void)_loadSharedViews
{
  id v3 = objc_alloc((Class)UIView);
  [(NTKCollieFaceView *)self bounds];
  objc_super v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  backgroundColorView = self->_backgroundColorView;
  self->_backgroundColorView = v4;

  [(NTKCollieFaceView *)self addSubview:self->_backgroundColorView];
  double v6 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  vignetteImageView = self->_vignetteImageView;
  self->_vignetteImageView = v6;

  [(UIImageView *)self->_vignetteImageView setContentMode:2];
  [(NTKCollieFaceView *)self bounds];
  -[UIImageView setFrame:](self->_vignetteImageView, "setFrame:");
  [(UIImageView *)self->_vignetteImageView setAlpha:1.0];
  id v8 = objc_opt_class();
  [(NTKCollieFaceView *)self bounds];
  double v11 = objc_msgSend(v8, "_backgroundMaskFromImageNamed:size:", @"FaceVignette", v9, v10);
  [(UIImageView *)self->_vignetteImageView setImage:v11];

  [(UIView *)self->_backgroundColorView addSubview:self->_vignetteImageView];
  double v12 = [(NTKCollieFaceView *)self faceColorPalette];
  id v13 = [v12 primaryColor];
  [(NTKCollieFaceView *)self _setBackgroundColor:v13 radiance:1.0];

  id v14 = (NTKCollieFaceImageView *)objc_opt_new();
  fromSnapshotView = self->_fromSnapshotView;
  self->_fromSnapshotView = v14;

  [(NTKCollieFaceImageView *)self->_fromSnapshotView setContentMode:4];
  id v16 = [(NTKCollieFaceImageView *)self->_fromSnapshotView layer];
  [v16 setContentsGravity:kCAGravityBottom];

  id v17 = [(NTKCollieFaceView *)self contentView];
  [v17 addSubview:self->_fromSnapshotView];

  uint64_t v18 = (NTKCollieFaceImageView *)objc_opt_new();
  toSnapshotView = self->_toSnapshotView;
  self->_toSnapshotView = v18;

  [(NTKCollieFaceImageView *)self->_toSnapshotView setContentMode:4];
  double v20 = [(NTKCollieFaceImageView *)self->_toSnapshotView layer];
  [v20 setContentsGravity:kCAGravityBottom];

  long long v21 = [(NTKCollieFaceView *)self contentView];
  [v21 addSubview:self->_toSnapshotView];

  v22 = [(NTKCollieFaceView *)self device];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v38 = 0u;
  sub_A890(v22, (uint64_t)&v38);
  double v23 = *(double *)&v39 * 0.5;

  [(NTKCollieFaceImageView *)self->_toSnapshotView setVOffset:v23];
  [(NTKCollieFaceImageView *)self->_fromSnapshotView setVOffset:v23];
  [(NTKCollieFaceView *)self _createTimeViewIfNecessary];
  id v24 = [(NTKCollieFaceView *)self timeView];
  id v25 = objc_alloc((Class)NTKRoundedCornerOverlayView);
  [(NTKCollieFaceView *)self bounds];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  v34 = [(NTKCollieFaceView *)self device];
  objc_super v35 = (UIView *)objc_msgSend(v25, "initWithFrame:forDeviceCornerRadius:", v34, v27, v29, v31, v33);
  cornerOverlayView = self->_cornerOverlayView;
  self->_cornerOverlayView = v35;

  v37 = self->_cornerOverlayView;

  [(NTKCollieFaceView *)self addSubview:v37];
}

- (void)_unloadSharedViews
{
  [(UIView *)self->_backgroundColorView removeFromSuperview];
  backgroundColorView = self->_backgroundColorView;
  self->_backgroundColorView = 0;

  [(UIImageView *)self->_vignetteImageView removeFromSuperview];
  vignetteImageView = self->_vignetteImageView;
  self->_vignetteImageView = 0;

  [(NTKCollieFaceImageView *)self->_fromSnapshotView removeFromSuperview];
  fromSnapshotView = self->_fromSnapshotView;
  self->_fromSnapshotView = 0;

  [(NTKCollieFaceImageView *)self->_toSnapshotView removeFromSuperview];
  toSnapshotView = self->_toSnapshotView;
  self->_toSnapshotView = 0;

  [(UIView *)self->_cornerOverlayView removeFromSuperview];
  cornerOverlayView = self->_cornerOverlayView;
  self->_cornerOverlayView = 0;
}

- (void)_loadSnapshotContentViews
{
  id v3 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_18790();
  }

  currentStyleEditOption = self->_currentStyleEditOption;
  if (currentStyleEditOption)
  {
    objc_super v5 = currentStyleEditOption;
  }
  else
  {
    double v6 = [(NTKCollieFaceView *)self device];
    objc_super v5 = +[NTKCollieStyleEditOption defaultOptionForDevice:v6];
  }
  v16.receiver = self;
  v16.super_class = (Class)NTKCollieFaceView;
  [(NTKCollieFaceView *)&v16 _loadSnapshotContentViews];
  [(NTKCollieFaceView *)self _loadSharedViews];
  double v7 = [(NTKCollieFaceView *)self timeView];
  [v7 setForcedNumberSystem:self->_numberSystem];

  id v8 = [[NTKCollieMetalQuadView alloc] initWithFrame:@"Coli", 15, 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height identifier options colorSpace];
  avtView = self->_avtView;
  self->_avtView = (CLKUIMetalQuadView *)v8;

  [(CLKUIMetalQuadView *)self->_avtView setPreferredFramesPerSecond:30];
  double v10 = +[UIColor clearColor];
  [(CLKUIMetalQuadView *)self->_avtView setBackgroundColor:v10];

  double v11 = objc_alloc_init(NTKCollieQuad);
  avtQuad = self->_avtQuad;
  self->_avtQuad = v11;

  [(CLKUIMetalQuadView *)self->_avtView addQuad:self->_avtQuad];
  id v13 = [(NTKCollieFaceView *)self contentView];
  [v13 addSubview:self->_avtView];

  [(NTKCollieFaceView *)self _addTapGestureRecognizers];
  [(NTKCollieFaceView *)self _addCrownSequencer];
  id v14 = (NSMutableDictionary *)objc_opt_new();
  animationCache = self->_animationCache;
  self->_animationCache = v14;

  [(NTKCollieFaceView *)self _transitionFromAvatarToImageForOption:v5 toState:0 immediate:1 retainAvatar:0];
}

- (void)_unloadSnapshotContentViews
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCollieFaceView;
  [(NTKCollieFaceView *)&v6 _unloadSnapshotContentViews];
  [(NTKCollieFaceView *)self _unloadSharedViews];
  [(CLKUIMetalQuadView *)self->_avtView removeFromSuperview];
  [(NTKCollieFaceView *)self _unloadAvatar];
  avtView = self->_avtView;
  self->_avtView = 0;

  avtQuad = self->_avtQuad;
  self->_avtQuad = 0;

  [(NTKCollieFaceView *)self _removeTapGestureRecognizers];
  [(NTKCollieFaceView *)self _removeCrownSequencer];
  animationCache = self->_animationCache;
  self->_animationCache = 0;
}

- (void)_didFirstUnlock
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_BC88;
  v2[3] = &unk_28BA0;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_addTapGestureRecognizers
{
  id v3 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_viewSingleTapped:"];
  [(UITapGestureRecognizer *)v3 setNumberOfTouchesRequired:1];
  [(UITapGestureRecognizer *)v3 setNumberOfTapsRequired:1];
  [(UITapGestureRecognizer *)v3 setEnabled:1];
  [(UITapGestureRecognizer *)v3 setCancelsTouchesInView:0];
  [(NTKCollieFaceView *)self addGestureRecognizer:v3];
  singleTapGestureRecognizer = self->_singleTapGestureRecognizer;
  self->_singleTapGestureRecognizer = v3;
}

- (void)_removeTapGestureRecognizers
{
  [(NTKCollieFaceView *)self removeGestureRecognizer:self->_singleTapGestureRecognizer];
  singleTapGestureRecognizer = self->_singleTapGestureRecognizer;
  self->_singleTapGestureRecognizer = 0;
}

- (void)_addSecondActivities
{
  [(NTKCollieFaceView *)self _stopSecondActivities];
  if ([(NTKCollieFaceView *)self dataMode] == (char *)&dword_0 + 1)
  {
    objc_initWeak(&location, self);
    id v3 = +[CLKClockTimer sharedInstance];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_BFA0;
    v6[3] = &unk_28BC8;
    objc_copyWeak(&v7, &location);
    objc_super v4 = [v3 startUpdatesWithUpdateFrequency:1 withHandler:v6 identificationLog:&stru_28C08];
    secondsActivityTimerToken = self->_secondsActivityTimerToken;
    self->_secondsActivityTimerToken = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_stopSecondActivities
{
  objc_initWeak(&location, self);
  if (self->_secondsActivityTimerToken)
  {
    id v3 = +[CLKClockTimer sharedInstance];
    [v3 stopUpdatesForToken:self->_secondsActivityTimerToken];

    id v4 = objc_loadWeakRetained(&location);
    if (v4)
    {
      objc_super v5 = v4;
      objc_super v6 = (void *)*((void *)v4 + 13);
      *((void *)v4 + 13) = 0;
    }
  }
  objc_destroyWeak(&location);
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)NTKCollieFaceView;
  [(NTKCollieFaceView *)&v23 layoutSubviews];
  id v3 = [(NTKCollieFaceView *)self device];
  [v3 screenBounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  p_avtView = &self->_avtView;
  -[CLKUIMetalQuadView setFrame:](self->_avtView, "setFrame:", v5, v7, v9, v11);
  -[NTKCollieFaceImageView setFrame:](self->_fromSnapshotView, "setFrame:", v5, v7, v9, v11);
  -[NTKCollieFaceImageView setFrame:](self->_toSnapshotView, "setFrame:", v5, v7, v9, v11);
  if (([(NTKCollieFaceView *)self _shouldHideUI] & 1) == 0)
  {
    id v13 = [(NTKCollieFaceView *)self rootContainerView];
    [(NTKCollieFaceView *)self bringSubviewToFront:v13];

    id v14 = [(NTKCollieFaceView *)self timeView];
    [(NTKCollieFaceView *)self bringSubviewToFront:v14];
  }
  int64_t currentDataMode = self->_currentDataMode;
  objc_super v16 = [(NTKCollieFaceView *)self contentView];
  id v17 = v16;
  if (currentDataMode == 1) {
    p_fromSnapshotView = &self->_fromSnapshotView;
  }
  else {
    p_fromSnapshotView = &self->_avtView;
  }
  if (currentDataMode != 1) {
    p_avtView = &self->_fromSnapshotView;
  }
  [v16 bringSubviewToFront:*p_fromSnapshotView];

  double v19 = [(NTKCollieFaceView *)self contentView];
  [v19 bringSubviewToFront:self->_toSnapshotView];

  double v20 = [(NTKCollieFaceView *)self contentView];
  [v20 bringSubviewToFront:*p_avtView];

  long long v21 = [(NTKCollieFaceView *)self rootContainerView];
  v22 = [(NTKCollieFaceView *)self complicationContainerView];
  [v21 bringSubviewToFront:v22];

  [(NTKCollieFaceView *)self bringSubviewToFront:self->_cornerOverlayView];
}

- (unint64_t)_timeLabelOptions
{
  return 1;
}

- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = [(NTKCollieFaceView *)self device];
  double v9 = sub_C408(v8);
  memset(v19, 0, sizeof(v19));
  sub_A890(v8, (uint64_t)v19);
  double v10 = +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", 0, v9, v8, x, y, width, height, 0.0, *((double *)v19 + 1));
  double v11 = [v10 layoutRule];
  [v11 referenceFrame];
  double v13 = v12;
  double v15 = v14;

  objc_super v16 = [v10 layoutRule];
  objc_msgSend(v16, "setReferenceFrame:", 0.0, v13, width, v15);

  id v17 = [v10 layoutRule];
  [v17 setHorizontalLayout:1];

  return v10;
}

- (BOOL)_timeLabelUsesLegibility
{
  return 1;
}

- (void)_applyDataMode
{
  v29.receiver = self;
  v29.super_class = (Class)NTKCollieFaceView;
  [(NTKCollieFaceView *)&v29 _applyDataMode];
  id v3 = (int *)[(NTKCollieFaceView *)self dataMode];
  double v4 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_18A1C();
  }

  p_int64_t currentDataMode = &self->_currentDataMode;
  if ((int *)self->_currentDataMode != v3)
  {
    [(UITapGestureRecognizer *)self->_singleTapGestureRecognizer setEnabled:v3 == (int *)((char *)&dword_0 + 1)];
    self->_isHandlingHardwareEvents = v3 == (int *)((char *)&dword_0 + 1);
    [(NTKCollieFaceView *)self _repositionCrownSequencer];
    currentStyleEditOption = self->_currentStyleEditOption;
    if (currentStyleEditOption)
    {
      double v7 = currentStyleEditOption;
    }
    else
    {
      double v8 = [(NTKCollieFaceView *)self device];
      double v7 = +[NTKCollieStyleEditOption defaultOptionForDevice:v8];
    }
    if (*p_currentDataMode == 2)
    {
      if (v3 == (int *)((char *)&dword_0 + 1))
      {
        double v11 = (unsigned char *)(&dword_0 + 2);
LABEL_17:
        objc_initWeak(&location, self);
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_C908;
        v25[3] = &unk_28C50;
        objc_copyWeak(v27, &location);
        v27[1] = v11;
        double v12 = v7;
        double v26 = v12;
        double v13 = objc_retainBlock(v25);
        if (v11 != (unsigned char *)&dword_0 + 2)
        {
          double v14 = [(NTKCollieQuad *)self->_avtQuad avatar];

          if (!v14)
          {
            id v17 = [(NTKCollieFaceView *)self resourceDirectory];
            [(id)objc_opt_class() _snapshotImageSize];
            double v19 = v18;
            double v21 = v20;
            v22 = [(NTKCollieFaceView *)self device];
            v23[0] = _NSConcreteStackBlock;
            v23[1] = 3221225472;
            v23[2] = sub_C96C;
            v23[3] = &unk_28CA0;
            id v24 = v13;
            +[NTKCollieStyleEditOption prewarmOption:resourceDirectory:size:forDevice:completion:](NTKCollieStyleEditOption, "prewarmOption:resourceDirectory:size:forDevice:completion:", v12, v17, v22, v23, v19, v21);

            goto LABEL_23;
          }
          double v15 = +[NTKCollieFaceBundle logObject];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_188F4();
          }
        }
        ((void (*)(void *))v13[2])(v13);
LABEL_23:

        objc_destroyWeak(v27);
        objc_destroyWeak(&location);
LABEL_28:
        *p_int64_t currentDataMode = (int64_t)v3;

        return;
      }
      objc_super v16 = +[NTKCollieFaceBundle logObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_18980(&self->_currentDataMode, (int)v3, v16);
      }

      [(NTKCollieFaceView *)self _unloadAvatar];
    }
    else
    {
      if (*p_currentDataMode == 1)
      {
        uint64_t v9 = sub_C8A8((uint64_t)v3);
        BOOL v10 = v3 == &dword_4 || v3 == (int *)((char *)&dword_0 + 2);
        -[NTKCollieFaceView _transitionFromAvatarToImageForOption:toState:immediate:retainAvatar:completion:](self, "_transitionFromAvatarToImageForOption:toState:immediate:retainAvatar:completion:", v7, v9, v10);
        self->_tritiumAfterOnRestartNeeded = 0;
      }
      if (v3 == (int *)((char *)&dword_0 + 1))
      {
        double v11 = (char *)*p_currentDataMode;
        goto LABEL_17;
      }
    }
    [(NTKCollieFaceView *)self _stopSecondActivities];
    goto LABEL_28;
  }
}

- (id)_bgColorForEditMode:(int64_t)a3
{
  if (a3 == 1)
  {
    double v5 = self->_complicationsEditModeColor;
  }
  else
  {
    if (a3 == 15)
    {
      id v3 = [(NTKCollieFaceView *)self faceColorPalette];
      double v4 = [v3 primaryColor];
      NTKColorByApplyingBlackOverlay();
      double v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v3 = [(NTKCollieFaceView *)self faceColorPalette];
      double v5 = [v3 primaryColor];
    }
  }

  return v5;
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  uint64_t v9 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "-[NTKCollieFaceView _configureForTransitionFraction:fromEditMode:toEditMode:]";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = a4;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = a5;
    _os_log_debug_impl(&dword_0, v9, OS_LOG_TYPE_DEBUG, "%s: fraction = %f fromMode = %u toMode = %u", buf, 0x22u);
  }

  v29.receiver = self;
  v29.super_class = (Class)NTKCollieFaceView;
  [(NTKCollieFaceView *)&v29 _configureForTransitionFraction:a4 fromEditMode:a5 toEditMode:a3];
  BOOL v10 = [(NTKCollieFaceView *)self _bgColorForEditMode:a4];
  if (a4 == 10) {
    double v11 = 0.333000004;
  }
  else {
    double v11 = 1.0;
  }
  double v12 = -[NTKCollieFaceView _bgColorForEditMode:](self, "_bgColorForEditMode:", a5, v11);
  double v13 = NTKInterpolateBetweenColors();
  CLKInterpolateBetweenFloatsClipped();
  double v15 = v14;
  CLKInterpolateBetweenFloatsClipped();
  double v17 = v16;
  CLKInterpolateBetweenFloatsClipped();
  double v19 = v18;
  [(NTKCollieFaceView *)self _setBackgroundColor:v13 radiance:v15];
  [(NTKCollieFaceView *)self _setContentOpaqueTimeAlpha:v17 complicationsAlpha:v19];
  double v20 = [(NTKCollieFaceView *)self device];
  double v21 = v20;
  if (a4 != 15)
  {
    memset(buf, 0, 48);
    sub_A890(v20, (uint64_t)buf);
  }

  v22 = [(NTKCollieFaceView *)self device];
  objc_super v23 = v22;
  if (a5 != 15)
  {
    memset(buf, 0, 48);
    sub_A890(v22, (uint64_t)buf);
  }

  CLKInterpolateBetweenFloatsUnclipped();
  double v25 = v24;
  if (a4 == 1) {
    double v26 = 0.100000001;
  }
  else {
    double v26 = 1.0;
  }
  if (a5 == 1) {
    double v27 = 0.100000001;
  }
  else {
    double v27 = 1.0;
  }
  if ((a4 != 0) == (a5 == 0)) {
    [(NTKCollieFaceView *)self _asyncSetImageViewsForOption:self->_currentStyleEditOption state:0 resolveToyBox:a5 == 0];
  }
  if (a3 <= 0.5)
  {
    [(NTKCollieFaceImageView *)self->_fromSnapshotView setAlpha:v27 * a3];
    double v28 = (1.0 - a3) * v26;
  }
  else
  {
    [(NTKCollieFaceImageView *)self->_fromSnapshotView setAlpha:(1.0 - a3) * v26];
    double v28 = v27 * a3;
  }
  [(NTKCollieFaceImageView *)self->_toSnapshotView setAlpha:v28];
  [(NTKCollieFaceImageView *)self->_fromSnapshotView setVOffset:v25];
  [(NTKCollieFaceImageView *)self->_toSnapshotView setVOffset:v25];
}

- (void)_prepareForEditing
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCollieFaceView;
  [(NTKCollieFaceView *)&v5 _prepareForEditing];
  id v3 = [(NTKCollieFaceView *)self resourceDirectory];
  double v4 = [(NTKCollieFaceView *)self device];
  +[NTKCollieStyleEditOption beginCacheWithResourceDirectory:v3 forDevice:v4];
}

- (void)_cleanupAfterEditing
{
  v2.receiver = self;
  v2.super_class = (Class)NTKCollieFaceView;
  [(NTKCollieFaceView *)&v2 _cleanupAfterEditing];
  +[NTKCollieStyleEditOption endCache];
}

- (void)_configureForEditMode:(int64_t)a3
{
  objc_super v5 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_18AAC();
  }

  double v6 = [(NTKCollieFaceView *)self _bgColorForEditMode:a3];
  double v7 = 1.0;
  if (a3 == 15) {
    double v7 = 0.5;
  }
  double v8 = 0.0;
  switch(a3)
  {
    case 1:
      double v7 = 0.0;
LABEL_9:
      double v8 = 0.333000004;
      goto LABEL_11;
    case 15:
      goto LABEL_11;
    case 10:
      goto LABEL_9;
  }
  double v8 = 1.0;
LABEL_11:
  double v9 = 0.333000004;
  if (a3 != 10) {
    double v9 = 1.0;
  }
  double v10 = 0.0;
  if (a3 == 15) {
    double v11 = 0.0;
  }
  else {
    double v11 = v9;
  }
  -[NTKCollieFaceView _setBackgroundColor:radiance:](self, "_setBackgroundColor:radiance:", v6, v7, v9);
  [(NTKCollieFaceView *)self _setContentOpaqueTimeAlpha:v8 complicationsAlpha:v11];
  double v12 = [(NTKCollieFaceView *)self device];
  double v13 = v12;
  if (a3 != 15)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
    sub_A890(v12, (uint64_t)&v15);
    double v10 = *(double *)&v16 * 0.5;
  }

  if (a3 == 1) {
    double v14 = 0.100000001;
  }
  else {
    double v14 = 1.0;
  }
  [(NTKCollieFaceImageView *)self->_fromSnapshotView setAlpha:v14];
  [(NTKCollieFaceImageView *)self->_toSnapshotView setAlpha:v14];
  [(NTKCollieFaceImageView *)self->_fromSnapshotView setVOffset:v10];
  [(NTKCollieFaceImageView *)self->_toSnapshotView setVOffset:v10];
}

- (id)_resolveStyleEditOption:(id)a3 resolveToyBox:(BOOL)a4
{
  id v4 = a3;

  return v4;
}

- (id)_snapshotImageForOption:(id)a3 machineState:(unint64_t)a4 resolveToyBox:(BOOL)a5 force:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  double v11 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_super v23 = [v10 styleName];
    double v24 = LogBool();
    int v25 = 136316162;
    double v26 = "-[NTKCollieFaceView _snapshotImageForOption:machineState:resolveToyBox:force:]";
    __int16 v27 = 2048;
    id v28 = v10;
    __int16 v29 = 2112;
    double v30 = v23;
    __int16 v31 = 2048;
    unint64_t v32 = a4;
    __int16 v33 = 2112;
    v34 = v24;
    _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "%s: start option(%p).style = %@ machineState = %lu resolveToyBodouble x = %@", (uint8_t *)&v25, 0x34u);
  }
  double v12 = [(NTKCollieFaceView *)self _resolveStyleEditOption:v10 resolveToyBox:v7];

  [(NTKCollieFace *)self->_face ensureBridgeMemojiResources];
  [(id)objc_opt_class() _snapshotImageSize];
  double v14 = v13;
  double v16 = v15;
  if (a4 == 1)
  {
    long long v17 = [(NTKCollieFaceView *)self resourceDirectory];
    double v18 = [(NTKCollieFaceView *)self device];
    double v19 = [(NTKCollieQuad *)self->_avtQuad avatar];
    uint64_t v20 = +[NTKCollieStyleEditOption sleepImageForOption:resourceDirectory:size:forDevice:oldAvatar:](NTKCollieStyleEditOption, "sleepImageForOption:resourceDirectory:size:forDevice:oldAvatar:", v12, v17, v18, v19, v14, v16);
  }
  else
  {
    [(NTKCollieFaceView *)self resourceDirectory];
    if (a4 == 2) {
      long long v17 = {;
    }
      double v18 = [(NTKCollieFaceView *)self device];
      double v19 = [(NTKCollieQuad *)self->_avtQuad avatar];
      +[NTKCollieStyleEditOption neutralImageForOption:resourceDirectory:size:forDevice:oldAvatar:](NTKCollieStyleEditOption, "neutralImageForOption:resourceDirectory:size:forDevice:oldAvatar:", v12, v17, v18, v19, v14, v16);
    }
    else {
      long long v17 = {;
    }
      double v18 = [(NTKCollieFaceView *)self device];
      double v19 = [(NTKCollieQuad *)self->_avtQuad avatar];
      +[NTKCollieStyleEditOption snapshotImageForOption:resourceDirectory:size:forDevice:oldAvatar:force:](NTKCollieStyleEditOption, "snapshotImageForOption:resourceDirectory:size:forDevice:oldAvatar:force:", v12, v17, v18, v19, v6, v14, v16);
    uint64_t v20 = };
  }
  double v21 = (void *)v20;

  return v21;
}

- (id)_snapshotImageForOption:(id)a3 resolveToyBox:(BOOL)a4
{
  return [(NTKCollieFaceView *)self _snapshotImageForOption:a3 machineState:0 resolveToyBox:a4 force:0];
}

- (id)_snapshotImageForOption:(id)a3
{
  return [(NTKCollieFaceView *)self _snapshotImageForOption:a3 machineState:0 resolveToyBox:0 force:0];
}

- (id)_existingSnapshotImageForOption:(id)a3 state:(unint64_t)a4
{
  if (a4 == 2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = a4 == 1;
  }
  face = self->_face;
  id v7 = a3;
  [(NTKCollieFace *)face ensureBridgeMemojiResources];
  [(id)objc_opt_class() _snapshotImageSize];
  double v9 = v8;
  double v11 = v10;
  double v12 = [(NTKCollieFaceView *)self resourceDirectory];
  double v13 = +[NTKCollieStyleEditOption existingSnapshotImageForOption:resourceDirectory:poseType:size:force:](NTKCollieStyleEditOption, "existingSnapshotImageForOption:resourceDirectory:poseType:size:force:", v7, v12, v5, 0, v9, v11);

  if (v13) {
    id v14 = v13;
  }

  return v13;
}

- (void)_asyncSetImageView0:(id)a3 imageView1:(id)a4 image:(id)a5 forOption:(id)a6 state:(unint64_t)a7 completion:(id)a8
{
  unint64_t v14 = (unint64_t)a3;
  unint64_t v15 = (unint64_t)a4;
  id v16 = a5;
  id v17 = a6;
  double v18 = (void (**)(void))a8;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (!(v14 | v15))
  {
LABEL_7:
    if (v18) {
      v18[2](v18);
    }
    goto LABEL_22;
  }
  if (v16)
  {
    if (v14) {
      [(id)v14 setImage:v16];
    }
    if (v15) {
      [(id)v15 setImage:v16];
    }
    goto LABEL_7;
  }
  double v19 = [v17 styleName];
  if (a7 == 2) {
    uint64_t v20 = 2;
  }
  else {
    uint64_t v20 = a7 == 1;
  }
  uint64_t v31 = v20;
  +[NSString stringWithFormat:@"%@-%u", v19, v20];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  void v36[2] = sub_D84C;
  v36[3] = &unk_28CC8;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v37 = v21;
  unint64_t v38 = a7;
  v22 = objc_retainBlock(v36);
  objc_super v23 = (uint64_t (**)(void, void))v22;
  if (!v14)
  {
    int v24 = 1;
    if (v15) {
      goto LABEL_14;
    }
LABEL_16:
    int v25 = 1;
    goto LABEL_17;
  }
  int v24 = ((uint64_t (*)(void *, unint64_t))v22[2])(v22, v14);
  if (!v15) {
    goto LABEL_16;
  }
LABEL_14:
  int v25 = v23[2](v23, v15);
LABEL_17:
  if ((v24 & v25) == 1)
  {
    if (v18) {
      v18[2](v18);
    }
  }
  else
  {
    [(NTKCollieFace *)self->_face ensureBridgeMemojiResources];
    [(id)objc_opt_class() _snapshotImageSize];
    double v27 = v26;
    double v29 = v28;
    double v30 = [(NTKCollieFaceView *)self resourceDirectory];
    objc_initWeak(&location, self);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_D8E4;
    v32[3] = &unk_28D18;
    objc_copyWeak(&v34, &location);
    __int16 v33 = v18;
    +[NTKCollieStyleEditOption asyncMakeSnapshotImageForOption:resourceDirectory:poseType:size:completion:](NTKCollieStyleEditOption, "asyncMakeSnapshotImageForOption:resourceDirectory:poseType:size:completion:", v17, v30, v31, v32, v27, v29);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
LABEL_22:
}

- (void)_asyncSetImageViewsForOption:(id)a3 state:(unint64_t)a4 resolveToyBox:(BOOL)a5
{
  id v8 = [(NTKCollieFaceView *)self _resolveStyleEditOption:a3 resolveToyBox:a5];
  id v7 = [(NTKCollieFaceView *)self _existingSnapshotImageForOption:v8 state:a4];
  [(NTKCollieFaceView *)self _asyncSetImageView0:self->_toSnapshotView imageView1:self->_fromSnapshotView image:v7 forOption:v8 state:a4 completion:0];
}

- (void)_asyncSetImageView:(id)a3 image:(id)a4 forOption:(id)a5 state:(unint64_t)a6
{
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCollieFaceView;
  -[NTKCollieFaceView willMoveToWindow:](&v5, "willMoveToWindow:");
  self->_movedToWindow = a3 != 0;
}

- (void)_reloadToyBoxAvatar
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if ([(NTKCollieStyleEditOption *)self->_currentStyleEditOption isToybox])
  {
    nextToyBoxStyleEditOption = self->_nextToyBoxStyleEditOption;
    if (nextToyBoxStyleEditOption)
    {
      id v4 = nextToyBoxStyleEditOption;
    }
    else
    {
      currentStyleEditOption = self->_currentStyleEditOption;
      BOOL v6 = [(NTKCollieFaceView *)self resourceDirectory];
      double v10 = [(NTKCollieStyleEditOption *)currentStyleEditOption nextRandomizedToyBoxOptionWithResourceDirectory:v6];

      id v4 = v10;
    }
    double v11 = v4;
    [(NTKCollieStyleEditOption *)self->_currentStyleEditOption chooseToyBoxOption:v4];
    id v7 = self->_nextToyBoxStyleEditOption;
    self->_nextToyBoxStyleEditOption = 0;

    currentToyBoxStyleEditOption = self->_currentToyBoxStyleEditOption;
    self->_currentToyBoxStyleEditOption = 0;

    self->_shouldShakeToyBodouble x = 0;
    [(NTKCollieFaceView *)self _unloadAvatar];
    [(NTKCollieFaceView *)self _loadAvatarAsyncForOption:self->_currentStyleEditOption completion:0];
    double v9 = [(NTKCollieFaceView *)self _snapshotImageForOption:self->_currentStyleEditOption machineState:2 resolveToyBox:1 force:0];
    [(NTKCollieFaceImageView *)self->_toSnapshotView setImage:v9];
  }
}

- (void)_transitionFromAvatarToImageForOption:(id)a3 toState:(unint64_t)a4 immediate:(BOOL)a5 retainAvatar:(BOOL)a6 forceImage:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a8;
  id v16 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_18B2C(v16, v17, v18, v19, v20, v21, v22, v23);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(CLKUIMetalQuadView *)self->_avtView setPaused:1];
  if (v15)
  {
    objc_initWeak(&location, self);
    avtQuad = self->_avtQuad;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_E03C;
    v25[3] = &unk_28D40;
    objc_copyWeak(v28, &location);
    id v26 = v14;
    v28[1] = (id)a4;
    BOOL v29 = v10;
    BOOL v30 = v11;
    id v27 = v15;
    [(NTKCollieQuad *)avtQuad setPaused:1 completion:v25];

    objc_destroyWeak(v28);
    objc_destroyWeak(&location);
  }
  else
  {
    [(NTKCollieQuad *)self->_avtQuad setPaused:1];
    [(NTKCollieFaceView *)self _transitionFromAvatarToImagePart2ForOption:v14 toState:a4 retainAvatar:v10 forceImage:v9];
    [(NTKCollieFaceView *)self _transitionFromAvatarToImagePart3ForOption:v14 immediate:v11 retainAvatar:v10];
  }
}

- (void)_transitionFromAvatarToImagePart2ForOption:(id)a3 toState:(unint64_t)a4 retainAvatar:(BOOL)a5 forceImage:(BOOL)a6
{
  if (a4)
  {
    id v7 = [(NTKCollieFaceView *)self _snapshotImageForOption:a3 machineState:a4 resolveToyBox:a5 force:a6];
    [(NTKCollieFaceImageView *)self->_toSnapshotView setImage:v7];
    [(NTKCollieFaceImageView *)self->_fromSnapshotView setImage:v7];
  }
  else
  {
    -[NTKCollieFaceView _asyncSetImageViewsForOption:state:resolveToyBox:](self, "_asyncSetImageViewsForOption:state:resolveToyBox:", a3);
  }
}

- (void)_transitionFromAvatarToImagePart3ForOption:(id)a3 immediate:(BOOL)a4 retainAvatar:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  BOOL v9 = [(NTKCollieFaceView *)self device];
  long long v23 = 0u;
  long long v24 = 0u;
  long long location = 0u;
  sub_A890(v9, (uint64_t)&location);
  double v10 = *(double *)&v23 * 0.5;

  [(NTKCollieFaceImageView *)self->_fromSnapshotView setVOffset:v10];
  [(NTKCollieFaceImageView *)self->_toSnapshotView setVOffset:v10];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_E518;
  _OWORD v19[3] = &unk_28DA0;
  BOOL v20 = a5;
  BOOL v21 = v6;
  BOOL v11 = objc_retainBlock(v19);
  double v12 = (void (**)(void, void))v11;
  if (v6)
  {
    sub_E4A0(v11, self);
    ((void (**)(void, NTKCollieFaceView *))v12)[2](v12, self);
  }
  else
  {
    objc_initWeak((id *)&location, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_E644;
    v16[3] = &unk_28DC8;
    objc_copyWeak(&v18, (id *)&location);
    uint64_t v17 = &stru_28D80;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_E6A4;
    v13[3] = &unk_28DF0;
    objc_copyWeak(&v15, (id *)&location);
    id v14 = v12;
    +[UIView animateWithDuration:0 delay:v16 options:v13 animations:0.5 completion:0.0];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)&location);
  }
}

- (void)_transitionFromAvatarToImageForOption:(id)a3 toState:(unint64_t)a4 immediate:(BOOL)a5 retainAvatar:(BOOL)a6 completion:(id)a7
{
}

- (void)_transitionFromAvatarToImageForOption:(id)a3 toState:(unint64_t)a4 immediate:(BOOL)a5 retainAvatar:(BOOL)a6 forceImage:(BOOL)a7
{
}

- (void)_transitionFromAvatarToImageForOption:(id)a3 toState:(unint64_t)a4 immediate:(BOOL)a5 retainAvatar:(BOOL)a6
{
}

- (void)_transitionFromImageToCurrentAvatarImmediate:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_18BA4();
  }

  if (v3)
  {
    sub_E8E4(v6, self);
    sub_E95C(v7, self);
  }
  else
  {
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_E9C4;
    v11[3] = &unk_28DC8;
    objc_copyWeak(&v13, &location);
    double v12 = &stru_28E10;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_EA24;
    v8[3] = &unk_28DF0;
    objc_copyWeak(&v10, &location);
    BOOL v9 = &stru_28E30;
    +[UIView animateWithDuration:0 delay:v11 options:v8 animations:0.25 completion:0.0];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)_restartRenderForAvatar:(id)a3 fromState:(unint64_t)a4 completion:(id)a5
{
  id v7 = a5;
  +[NSDate timeIntervalSinceReferenceDate];
  self->_didRenderAvatarStartTime = v8;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_EB74;
  v10[3] = &unk_28E58;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a4;
  id v11 = v7;
  id v9 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

- (void)_unloadAvatar
{
  [(NTKCollieQuad *)self->_avtQuad setAvatar:0];
  currentWatchfaceCoordinator = self->_currentWatchfaceCoordinator;
  self->_currentWatchfaceCoordinator = 0;
}

- (void)_loadAvatarAsyncForOption:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v13 = LogBool();
    id v14 = objc_retainBlock(self->_didLoadAvatarCallback);
    id v15 = objc_retainBlock(v7);
    id v16 = [v6 styleName];
    *(_DWORD *)id location = 136316418;
    *(void *)&location[4] = "-[NTKCollieFaceView _loadAvatarAsyncForOption:completion:]";
    __int16 v20 = 2048;
    BOOL v21 = self;
    __int16 v22 = 2112;
    long long v23 = v13;
    __int16 v24 = 2048;
    id v25 = v14;
    __int16 v26 = 2048;
    id v27 = v15;
    __int16 v28 = 2112;
    BOOL v29 = v16;
    _os_log_debug_impl(&dword_0, v8, OS_LOG_TYPE_DEBUG, "%s(%p): _loadInProgress = %@ loadedCallback.was = %p loadedCallback.willBe = %p characterStyle = %@", location, 0x3Eu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v9 = objc_retainBlock(v7);
  id didLoadAvatarCallback = self->_didLoadAvatarCallback;
  self->_id didLoadAvatarCallback = v9;

  if (!self->_loadInProgress)
  {
    self->_loadInProgress = 1;
    kdebug_trace();
    [(NTKCollieFace *)self->_face ensureBridgeMemojiResources];
    objc_initWeak((id *)location, self);
    id v11 = [(NTKCollieFaceView *)self resourceDirectory];
    double v12 = [(NTKCollieQuad *)self->_avtQuad avatar];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_F3F8;
    v17[3] = &unk_28EA8;
    objc_copyWeak(&v18, (id *)location);
    +[NTKCollieStyleEditOption loadAvatarForOption:v6 resourceDirectory:v11 oldAvatar:v12 completion:v17];

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)location);
  }
}

- (void)_transitionFromImageToAvatarForOption:(id)a3 fromState:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_18D60();
  }

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  +[NSDate timeIntervalSinceReferenceDate];
  self->_loadAvatarStartTime = v11;
  uint64_t v12 = [(NTKCollieQuad *)self->_avtQuad avatar];
  if (v12
    && (id v13 = (void *)v12,
        unsigned int v14 = [(NTKCollieStyleEditOption *)self->_currentStyleEditOption isEqual:v8],
        v13,
        v14))
  {
    id v15 = +[NTKCollieFaceBundle logObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_18CBC((uint64_t)self, v8);
    }

    +[NSDate timeIntervalSinceReferenceDate];
    self->_loadAvatarEndTime = v16;
    uint64_t v17 = [(NTKCollieQuad *)self->_avtQuad avatar];
    [(NTKCollieFaceView *)self _restartRenderForAvatar:v17 fromState:a4 completion:v9];
  }
  else
  {
    id v18 = +[NTKCollieFaceBundle logObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_18C18((uint64_t)self, v8);
    }

    objc_initWeak(&location, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_F948;
    _OWORD v19[3] = &unk_28ED0;
    objc_copyWeak(v21, &location);
    v21[1] = (id)a4;
    id v20 = v9;
    [(NTKCollieFaceView *)self _loadAvatarAsyncForOption:v8 completion:v19];

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }
}

- (void)_reportStats
{
  double didRenderAvatarEndTime = self->_didRenderAvatarEndTime;
  double didRenderAvatarStartTime = self->_didRenderAvatarStartTime;
  double loadAvatarEndTime = self->_loadAvatarEndTime;
  double loadAvatarStartTime = self->_loadAvatarStartTime;
  self->_double cumlativeLoadAndRenderAvatarDuration = didRenderAvatarEndTime
                                              - loadAvatarStartTime
                                              + self->_cumlativeLoadAndRenderAvatarDuration;
  ++self->_cumlativeLoadAndRenderAvatarCount;
  id v7 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    double cumlativeLoadAndRenderAvatarDuration = self->_cumlativeLoadAndRenderAvatarDuration;
    unint64_t cumlativeLoadAndRenderAvatarCount = self->_cumlativeLoadAndRenderAvatarCount;
    int v10 = 134219008;
    double v11 = loadAvatarEndTime - loadAvatarStartTime;
    __int16 v12 = 2048;
    double v13 = didRenderAvatarEndTime - didRenderAvatarStartTime;
    __int16 v14 = 2048;
    double v15 = didRenderAvatarEndTime - loadAvatarStartTime;
    __int16 v16 = 2048;
    double v17 = cumlativeLoadAndRenderAvatarDuration / (double)cumlativeLoadAndRenderAvatarCount;
    __int16 v18 = 2048;
    unint64_t v19 = cumlativeLoadAndRenderAvatarCount;
    _os_log_debug_impl(&dword_0, v7, OS_LOG_TYPE_DEBUG, "stats load: %.3f render: %.3f total: %.3f average: %.3f/%lu", (uint8_t *)&v10, 0x34u);
  }
}

- (void)_transitionFromImageToAvatarForOption:(id)a3 fromState:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 isToybox]) {
    BOOL v7 = (unint64_t)(self->_currentDataMode - 3) < 0xFFFFFFFFFFFFFFFELL;
  }
  else {
    BOOL v7 = 0;
  }
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_FC4C;
  v8[3] = &unk_28EF8;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a4;
  BOOL v10 = v7;
  [(NTKCollieFaceView *)self _transitionFromImageToAvatarForOption:v6 fromState:a4 completion:v8];
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  double v13 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_super v35 = [v11 localizedName];
    v36 = [v12 localizedName];
    LODWORD(v39.a) = 136315906;
    *(void *)((char *)&v39.a + 4) = "-[NTKCollieFaceView _applyTransitionFraction:fromOption:toOption:forCustomEditMode:slot:]";
    WORD2(v39.b) = 2048;
    *(double *)((char *)&v39.b + 6) = a3;
    HIWORD(v39.c) = 2112;
    *(void *)&v39.d = v35;
    LOWORD(v39.tx) = 2112;
    *(void *)((char *)&v39.tx + 2) = v36;
    _os_log_debug_impl(&dword_0, v13, OS_LOG_TYPE_DEBUG, "%s: fraction = %f fromOption = %@ toOption = %@", (uint8_t *)&v39, 0x2Au);
  }
  switch(a6)
  {
    case 19:
      id v16 = [v11 numeralOption];
      id v17 = [v12 numeralOption];
      if (v16 == v17)
      {
        [(NTKCollieFaceView *)self _setNumerals:v16];
      }
      else
      {
        if (a3 >= 0.5)
        {
          id v30 = v17;
          CLKMapFractionIntoRange();
          double v24 = v31;
          id v16 = v30;
        }
        else
        {
          CLKMapFractionIntoRange();
          double v24 = v23;
        }
        CLKMapFractionIntoRange();
        memset(&v39, 0, sizeof(v39));
        CGAffineTransformMakeScale(&v39, v32, v32);
        [(NTKCollieFaceView *)self _setNumerals:v16];
        __int16 v33 = [(NTKCollieFaceView *)self timeView];
        [v33 setAlpha:v24];

        CGAffineTransform v38 = v39;
        id v34 = [(NTKCollieFaceView *)self timeView];
        CGAffineTransform v37 = v38;
        [v34 setTransform:&v37];
      }
      break;
    case 15:
      id v14 = v11;
      id v15 = v12;
      uint64_t v18 = [(NTKCollieFaceView *)self _existingSnapshotImageForOption:v14 state:0];
      uint64_t v19 = [(NTKCollieFaceView *)self _existingSnapshotImageForOption:v15 state:0];
      unint64_t v20 = v19;
      if (a3 >= 0.0500000007)
      {
        BOOL v21 = (void *)v19;
        __int16 v22 = v15;
        if (a3 <= 0.949999988)
        {
LABEL_15:
          if (a3 <= 0.5)
          {
            [(NTKCollieFaceView *)self _asyncSetImageView:self->_toSnapshotView image:v18 forOption:v14 state:0];
            [(NTKCollieFaceImageView *)self->_toSnapshotView setAlpha:1.0 - a3];
            uint64_t v25 = 48;
          }
          else
          {
            [(NTKCollieFaceView *)self _asyncSetImageView:self->_fromSnapshotView image:v18 forOption:v14 state:0];
            [(NTKCollieFaceImageView *)self->_fromSnapshotView setAlpha:1.0 - a3];
            uint64_t v25 = 56;
          }
          [(NTKCollieFaceView *)self _asyncSetImageView:*(void *)&self->NTKDigitalFaceView_opaque[v25] image:v20 forOption:v15 state:0];
          [*(id *)&self->NTKDigitalFaceView_opaque[v25] setAlpha:a3];
          [(NTKCollieFaceView *)self device];

          [(NTKCollieFaceImageView *)self->_fromSnapshotView setVOffset:0.0];
          [(NTKCollieFaceImageView *)self->_toSnapshotView setVOffset:0.0];
          __int16 v26 = v14;
          if (a3 <= 0.0 || (__int16 v26 = v15, a3 >= 1.0))
          {
            id v27 = v26;
            currentStyleEditOption = self->_currentStyleEditOption;
            self->_currentStyleEditOption = v27;
          }
          currentToyBoxStyleEditOption = self->_currentToyBoxStyleEditOption;
          self->_currentToyBoxStyleEditOption = 0;

          if (!(v18 | v20))
          {
            [(NTKCollieFaceImageView *)self->_fromSnapshotView setAlpha:1.0];
            [(NTKCollieFaceImageView *)self->_toSnapshotView setAlpha:1.0];
          }

          goto LABEL_24;
        }
      }
      else
      {
        BOOL v21 = (void *)v18;
        uint64_t v18 = v19;
        __int16 v22 = v14;
        id v14 = v15;
      }
      unint64_t v20 = v21;

      id v15 = v22;
      uint64_t v18 = v20;
      id v14 = v15;
      goto LABEL_15;
    case 10:
      id v14 = [(NTKCollieFaceView *)self interpolatedColorPalette];
      id v15 = [v14 primaryColor];
      [(NTKCollieFaceView *)self _setBackgroundColor:v15 radiance:1.0];
LABEL_24:

      break;
  }
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  id v8 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v16 = [(NTKCollieFaceView *)self dataMode];
    id v17 = [v7 localizedName];
    int v18 = 136316162;
    uint64_t v19 = "-[NTKCollieFaceView _applyOption:forCustomEditMode:slot:]";
    __int16 v20 = 2048;
    BOOL v21 = self;
    __int16 v22 = 2048;
    id v23 = v16;
    __int16 v24 = 2112;
    uint64_t v25 = v17;
    __int16 v26 = 1024;
    int v27 = a4;
    _os_log_debug_impl(&dword_0, v8, OS_LOG_TYPE_DEBUG, "%s(%p): dataMode = %ld option = %@ mode = %u", (uint8_t *)&v18, 0x30u);
  }
  switch(a4)
  {
    case 19:
      -[NTKCollieFaceView _setNumerals:](self, "_setNumerals:", [v7 numeralOption]);
      break;
    case 15:
      id v11 = (NTKCollieStyleEditOption *)v7;
      uint64_t v12 = sub_C8A8(self->_currentDataMode);
      if (self->_currentDataMode == 1)
      {
        [(NTKCollieFaceView *)self _transitionFromAvatarToImageForOption:v11 toState:v12 immediate:1 retainAvatar:0];
        [(NTKCollieFaceView *)self _transitionFromImageToAvatarForOption:v11 fromState:v12];
      }
      else
      {
        currentStyleEditOption = self->_currentStyleEditOption;
        if (!currentStyleEditOption || ![(NTKCollieStyleEditOption *)currentStyleEditOption isEqual:v11]) {
          [(NTKCollieFaceView *)self _transitionFromAvatarToImageForOption:v11 toState:v12 immediate:0 retainAvatar:0];
        }
      }
      id v14 = self->_currentStyleEditOption;
      self->_currentStyleEditOption = v11;
      id v9 = v11;

      currentToyBoxStyleEditOption = self->_currentToyBoxStyleEditOption;
      self->_currentToyBoxStyleEditOption = 0;

      goto LABEL_14;
    case 10:
      id v9 = [(NTKCollieFaceView *)self faceColorPalette];
      BOOL v10 = [(NTKCollieStyleEditOption *)v9 primaryColor];
      [(NTKCollieFaceView *)self _setBackgroundColor:v10 radiance:1.0];

LABEL_14:
      break;
  }
}

- (void)_setNumerals:(unint64_t)a3
{
  self->_numeralOption = a3;
  unint64_t v4 = CLKLocaleNumberSystemFromNumeralOption();
  if (self->_numberSystem != v4)
  {
    unint64_t v5 = v4;
    self->_numberSystem = v4;
    id v6 = [(NTKCollieFaceView *)self device];
    int v7 = NTKShowIndicScriptNumerals();

    if (v7)
    {
      id v8 = [(NTKCollieFaceView *)self timeView];
      [v8 setForcedNumberSystem:v5];

      [(NTKCollieFaceView *)self invalidateDigitalTimeLabelStyle];
      [(NTKCollieFaceView *)self setNeedsLayout];
    }
  }
}

- (void)sensitiveUIStateChanged
{
  unint64_t numberSystem = self->_numberSystem;
  unint64_t v4 = [(NTKCollieFaceView *)self device];
  int v5 = NTKShowIndicScriptNumerals();

  if (v5) {
    uint64_t v6 = numberSystem;
  }
  else {
    uint64_t v6 = -1;
  }
  [(NTKCollieFaceView *)self _createTimeViewIfNecessary];
  int v7 = [(NTKCollieFaceView *)self timeView];
  [v7 setForcedNumberSystem:v6];

  [(NTKCollieFaceView *)self invalidateDigitalTimeLabelStyle];

  [(NTKCollieFaceView *)self setNeedsLayout];
}

- (void)_pushBackMachineStateResetTimer:(double)a3 completionHandler:(id)a4
{
  id v6 = a4;
  machineStateResetTimer = self->_machineStateResetTimer;
  if (machineStateResetTimer)
  {
    [(NSTimer *)machineStateResetTimer invalidate];
    id v8 = self->_machineStateResetTimer;
    self->_machineStateResetTimer = 0;
  }
  if (v6)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_105D4;
    v11[3] = &unk_28F20;
    id v12 = v6;
    id v9 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v11 block:a3];
    BOOL v10 = self->_machineStateResetTimer;
    self->_machineStateResetTimer = v9;
  }
}

- (void)_transitionBackgroundToBlackImmediate:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(NTKCollieFaceView *)self device];
  id v6 = +[UIColor colorWithWhite:0.649999976 alpha:1.0];
  if (v3)
  {
    [(NTKCollieFaceView *)self _setBackgroundAlpha:v6 contentAlpha:0.0 timeComplicationsColor:0.649999976];
  }
  else
  {
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10758;
    v7[3] = &unk_28F48;
    objc_copyWeak(&v9, &location);
    long long v10 = xmmword_267E0;
    id v8 = v6;
    +[UIView animateWithDuration:196608 delay:v7 options:0 animations:0.5 completion:0.0];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_transitionBackgroundToColor
{
  BOOL v3 = [(NTKCollieFaceView *)self faceColorPalette];
  unint64_t v4 = [v3 primaryColor];

  int v5 = +[UIColor whiteColor];
  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10984;
  v20[3] = &unk_28F48;
  objc_copyWeak(&v22, &location);
  __asm { FMOV            V0.2D, #1.0 }
  long long v14 = _Q0;
  long long v23 = _Q0;
  id v11 = v5;
  id v21 = v11;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_109DC;
  v15[3] = &unk_28F70;
  objc_copyWeak(&v18, &location);
  long long v19 = v14;
  id v12 = v11;
  id v16 = v12;
  id v13 = v4;
  id v17 = v13;
  +[UIView animateWithDuration:0x20000 delay:v20 options:v15 animations:0.5 completion:0.0];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)_transitionToMachineState:(unint64_t)a3 immediate:(BOOL)a4
{
  uint64_t v4 = a3;
  unint64_t currentMachineState = self->_currentMachineState;
  int v7 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [&off_29D70 objectAtIndexedSubscript:currentMachineState];
    id v9 = [&off_29D70 objectAtIndexedSubscript:v4];
    int v10 = 136315650;
    id v11 = "-[NTKCollieFaceView _transitionToMachineState:immediate:]";
    __int16 v12 = 2112;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%s: oldState = %@, newState = %@", (uint8_t *)&v10, 0x20u);
  }
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 != 1)
    {
      if (v4 == 5)
      {
        if (currentMachineState == 1) {
          return;
        }
        uint64_t v4 = 5;
      }
      else
      {
        uint64_t v4 = 2;
      }
    }
    self->_unint64_t currentMachineState = v4;
  }
}

- (void)_transitionToMachineState:(unint64_t)a3
{
}

- (void)_startMachineFromState:(unint64_t)a3
{
  int v5 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_18DD4();
  }

  currentWatchfaceCoordinator = self->_currentWatchfaceCoordinator;
  self->_currentWatchfaceCoordinator = 0;

  if (a3 == 1) {
    [(NTKCollieFaceView *)self _transitionToMachineState:1 immediate:1];
  }
  [(NTKCollieFaceView *)self _transitionToMachineState:3];
  [(NTKCollieFaceView *)self _addSecondActivities];
}

- (void)_stopMachineImmediate:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_18E48();
  }

  [(NTKCollieFaceView *)self _pushBackMachineStateResetTimer:0 completionHandler:0.0];
  if (self->_currentMachineState == 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  [(NTKCollieFaceView *)self _transitionToMachineState:v6 immediate:v3];
}

- (void)screenDidTurnOffAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_18F00();
  }

  [(NTKCollieFaceView *)self _stopMachineImmediate:1];
  v6.receiver = self;
  v6.super_class = (Class)NTKCollieFaceView;
  [(NTKCollieFaceView *)&v6 screenDidTurnOffAnimated:v3];
  if ([(NTKCollieStyleEditOption *)self->_currentStyleEditOption isToybox]) {
    self->_shouldShakeToyBodouble x = 1;
  }
}

- (void)_handleWristRaiseScreenWake
{
  objc_super v2 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_18F74();
  }
}

- (void)_handleOrdinaryScreenWake
{
  objc_super v2 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_18FE8();
  }
}

- (void)_becameActiveFace
{
  objc_super v2 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1905C();
  }
}

- (void)_becameInactiveFace
{
  BOOL v3 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_190D0();
  }

  [(NTKCollieFaceView *)self _stopMachineImmediate:1];
}

- (void)_viewSingleTapped:(id)a3
{
  uint64_t v4 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    objc_super v6 = "-[NTKCollieFaceView _viewSingleTapped:]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%s: called", (uint8_t *)&v5, 0xCu);
  }

  [(NTKCollieFaceView *)self _transitionToMachineState:4];
}

- (void)_topOfTheMinuteReached
{
  if ([(NTKCollieFaceView *)self dataMode] == (char *)&dword_0 + 1)
  {
    lastSelfiePoseStart = self->_lastSelfiePoseStart;
    if (!lastSelfiePoseStart
      || ([(NSDate *)lastSelfiePoseStart timeIntervalSinceNow], v4 <= -1.55))
    {
      [(NTKCollieFaceView *)self _transitionToMachineState:5];
    }
  }
}

- (CGPoint)_fractionalLocationOfGesture:(id)a3 inView:(id)a4
{
  [a3 locationInView:a4];
  double v6 = v5;
  double v8 = v7;
  [(CLKUIMetalQuadView *)self->_avtView bounds];
  double v10 = fmin(fmax((v6 - v9 * 0.5) / (v9 * 0.5), -1.0), 1.0);
  double v12 = -fmin(fmax((v8 - v11 * 0.5) / (v11 * 0.5), -1.0), 1.0);
  result.double y = v12;
  result.double x = v10;
  return result;
}

- (BOOL)_wheelChangedWithEvent:(id)a3
{
  return 0;
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  return [(NTKCollieFaceViewComplicationFactory *)self->_collieFaceViewComplicationFactory newLegacyViewForComplication:a3 family:a4 slot:a5 faceView:self];
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  return (int64_t)[(NTKCollieFaceViewComplicationFactory *)self->_collieFaceViewComplicationFactory legacyLayoutOverrideforComplicationType:a3 slot:a4 faceView:self];
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
}

- (id)_detachedComplicationDisplays
{
  return [(NTKCollieFaceViewComplicationFactory *)self->_collieFaceViewComplicationFactory detachedComplicationDisplaysForFaceView:self];
}

- (void)_loadLayoutRules
{
}

- (double)_keylineCornerRadiusForComplicationSlot:(id)a3
{
  [(NTKCollieFaceViewComplicationFactory *)self->_collieFaceViewComplicationFactory keylineCornerRadiusForComplicationSlot:a3 faceView:self];
  return result;
}

- (double)keylineStyleForComplicationSlot:(id)a3
{
  return (double)(uint64_t)[(NTKCollieFaceViewComplicationFactory *)self->_collieFaceViewComplicationFactory keylineStyleForComplicationSlot:a3];
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return [(NTKCollieFaceViewComplicationFactory *)self->_collieFaceViewComplicationFactory fadesComplicationSlot:a3 inEditMode:a4 faceView:self];
}

- (double)_minimumBreathingScaleForComplicationSlot:(id)a3
{
  [(NTKCollieFaceViewComplicationFactory *)self->_collieFaceViewComplicationFactory minimumBreathingScaleForComplicationSlot:a3 faceView:self];
  return result;
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return 1;
}

+ (int64_t)uiSensitivity
{
  return 0;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 19)
  {
    double v6 = &off_29D88;
  }
  else
  {
    uint64_t v9 = v4;
    uint64_t v10 = v5;
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___NTKCollieFaceView;
    objc_msgSendSuper2(&v8, "_swatchForEditModeDependsOnOptions:forDevice:", a3, a4);
    double v6 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5 refreshHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (a4 == 19)
  {
    id v16 = [(NTKCollieFaceView *)self device];
    id v17 = sub_C408(v16);

    id v18 = [(NTKCollieFaceView *)self device];
    id v15 = [v10 swatchImageWithFont:v17 device:v18 baseline:0.0];
  }
  else if (a4 == 15)
  {
    id v13 = [(NTKCollieFaceView *)self _existingSnapshotImageForOption:v10 state:0];
    __int16 v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      [(id)objc_opt_class() _snapshotImageSize];
      double v20 = v19;
      double v22 = v21;
      long long v23 = [(NTKCollieFaceView *)self resourceDirectory];
      [v10 styleName];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      id v27[2] = sub_11448;
      v27[3] = &unk_28F98;
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      id v29 = v12;
      id v24 = v28;
      +[NTKCollieStyleEditOption asyncMakeSnapshotImageForOption:resourceDirectory:poseType:size:completion:](NTKCollieStyleEditOption, "asyncMakeSnapshotImageForOption:resourceDirectory:poseType:size:completion:", v10, v23, 0, v27, v20, v22);
      id v15 = +[NTKCollieFaceImageView loadingImage];
    }
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)NTKCollieFaceView;
    id v15 = [(NTKCollieFaceView *)&v26 _swatchImageForEditOption:v10 mode:a4 withSelectedOptions:v11];
  }

  return v15;
}

- (void)_reorderSwitcherSnapshotView
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCollieFaceView;
  [(NTKCollieFaceView *)&v5 _reorderSwitcherSnapshotView];
  BOOL v3 = [(NTKCollieFaceView *)self switcherSnapshotView];

  if (v3)
  {
    uint64_t v4 = [(NTKCollieFaceView *)self switcherSnapshotView];
    [(NTKCollieFaceView *)self bringSubviewToFront:v4];
  }
}

- (void)populateFaceViewEditOptionsFromFace:(id)a3
{
  uint64_t v4 = (NTKCollieFace *)a3;
  v6.receiver = self;
  v6.super_class = (Class)NTKCollieFaceView;
  [(NTKCollieFaceView *)&v6 populateFaceViewEditOptionsFromFace:v4];
  face = self->_face;
  self->_face = v4;
}

- (void)_avatarStoreDidChange:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v14 = "-[NTKCollieFaceView _avatarStoreDidChange:]";
    __int16 v15 = 2048;
    id v16 = self;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s(%p): started, notification = %@", buf, 0x20u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  objc_super v6 = self->_currentStyleEditOption;
  double v7 = [v4 userInfo];
  unsigned int v8 = [(NTKCollieStyleEditOption *)v6 isImpactedByAvatarStoreChangedInfo:v7];

  if (v8)
  {
    if (self->_currentDataMode == 2) {
      [(NTKCollieFaceView *)self _unloadAvatar];
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_11770;
    block[3] = &unk_28FC0;
    id v10 = v6;
    id v11 = v4;
    id v12 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nullPhysicsState, 0);
  objc_storeStrong(&self->_avatarChangedObserver, 0);
  objc_storeStrong(&self->_didLoadAvatarCallback, 0);
  objc_storeStrong((id *)&self->_currentWatchfaceCoordinator, 0);
  objc_storeStrong((id *)&self->_lastSelfiePoseStart, 0);
  objc_storeStrong((id *)&self->_machineStateResetTimer, 0);
  objc_storeStrong((id *)&self->_currentBackgroundColor, 0);
  objc_storeStrong((id *)&self->_collieFaceViewComplicationFactory, 0);
  objc_storeStrong((id *)&self->_pose, 0);
  objc_storeStrong((id *)&self->_nextToyBoxStyleEditOption, 0);
  objc_storeStrong((id *)&self->_currentToyBoxStyleEditOption, 0);
  objc_storeStrong((id *)&self->_currentStyleEditOption, 0);
  objc_storeStrong((id *)&self->_pendingAvatar, 0);
  objc_storeStrong((id *)&self->_animationCache, 0);
  objc_storeStrong((id *)&self->_secondsActivityTimerToken, 0);
  objc_storeStrong((id *)&self->_singleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_complicationsEditModeColor, 0);
  objc_storeStrong((id *)&self->_cornerOverlayView, 0);
  objc_storeStrong((id *)&self->_loadingSnapshotImage, 0);
  objc_storeStrong((id *)&self->_toSnapshotView, 0);
  objc_storeStrong((id *)&self->_fromSnapshotView, 0);
  objc_storeStrong((id *)&self->_vignetteImageView, 0);
  objc_storeStrong((id *)&self->_backgroundColorView, 0);
  objc_storeStrong((id *)&self->_avtQuad, 0);
  objc_storeStrong((id *)&self->_avtView, 0);

  objc_storeStrong((id *)&self->_face, 0);
}

@end