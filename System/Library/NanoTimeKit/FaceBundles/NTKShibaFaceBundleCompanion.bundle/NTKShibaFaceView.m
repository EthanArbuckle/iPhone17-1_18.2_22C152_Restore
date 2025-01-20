@interface NTKShibaFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
+ (int64_t)uiSensitivity;
- (BOOL)_legacyShouldSwapGraphicCircularComplicationColors;
- (BOOL)contentLoaded;
- (BOOL)showGossamerUI;
- (NTKOlympusController)olympusController;
- (NTKOlympusTimeView)olympusView;
- (NTKShibaColorPalette)multicolorPaletteReplacement;
- (NTKShibaFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (NTKVictoryAnalogBackgroundView)analogBackgroundView;
- (UITapGestureRecognizer)tapGesture;
- (UIView)transitionOlympusView;
- (id)_renderDialSwatchImageForStyle:(id)a3 colorOption:(id)a4;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)createFaceColorPalette;
- (id)dialView;
- (id)palette;
- (unint64_t)_dualTimeStyleForOlympusStyle:(unint64_t)a3;
- (unint64_t)currentStyle;
- (void)_applyDataMode;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5 animateElements:(BOOL)a6;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_applyTransitionFraction:(double)a3 fromView:(id)a4 toView:(id)a5;
- (void)_cleanupAfterEditing;
- (void)_cleanupTransitions;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_createAnalogBackgroundIfNeeded;
- (void)_createAndRemoveViewsForCurrentStateIfNeeded;
- (void)_createOlympusViewIfNeeded;
- (void)_handleTapGesture;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_removeViews;
- (void)_setupController;
- (void)_setupViews;
- (void)_setupViewsForCurrentState;
- (void)_tearDownAnalogView;
- (void)_tearDownOlympusView;
- (void)_unloadSnapshotContentViews;
- (void)_updateBackgroundViewAlpha;
- (void)_updateComplicationsWithColor:(id)a3 isMulticolor:(BOOL)a4;
- (void)configureViewsForEditing;
- (void)layoutOlympusView;
- (void)layoutSubviews;
- (void)setAnalogBackgroundView:(id)a3;
- (void)setContentLoaded:(BOOL)a3;
- (void)setCurrentStyle:(unint64_t)a3;
- (void)setMulticolorPaletteReplacement:(id)a3;
- (void)setOlympusController:(id)a3;
- (void)setOlympusView:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setTapGesture:(id)a3;
- (void)setTimeOffset:(double)a3;
- (void)setTransitionOlympusView:(id)a3;
- (void)updateMonochromeColorForRichComplicationView:(id)a3;
- (void)updateWithPalette:(id)a3 isMulticolor:(BOOL)a4;
@end

@implementation NTKShibaFaceView

- (BOOL)showGossamerUI
{
  return 0;
}

- (BOOL)_legacyShouldSwapGraphicCircularComplicationColors
{
  return 1;
}

- (NTKShibaFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)NTKShibaFaceView;
  v5 = [(NTKShibaFaceView *)&v8 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
  if (v5)
  {
    v6 = CLKUIDefaultAlternateComplicationColor();
    [(NTKShibaFaceView *)v5 setAlternateComplicationColor:v6];
  }
  return v5;
}

+ (int64_t)uiSensitivity
{
  v2 = +[CLKRenderingContext sharedRenderingContext];
  v3 = [v2 device];
  int64_t v4 = NTKSensitivityForVictoryFaces();

  return v4;
}

- (id)createFaceColorPalette
{
  v2 = objc_alloc_init(NTKShibaColorPalette);
  [(NTKShibaColorPalette *)v2 setUseSmallFont:1];

  return v2;
}

- (id)palette
{
  v3 = [(NTKShibaFaceView *)self faceColorPalette];
  if ([v3 isMulticolor])
  {
    uint64_t v4 = [(NTKShibaFaceView *)self multicolorPaletteReplacement];

    v3 = (void *)v4;
  }
  [v3 setStyle:self->_currentStyle];

  return v3;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKShibaFaceView;
  [(NTKShibaFaceView *)&v5 layoutSubviews];
  [(NTKShibaFaceView *)self layoutOlympusView];
  analogBackgroundView = self->_analogBackgroundView;
  uint64_t v4 = [(NTKShibaFaceView *)self timeView];
  [v4 bounds];
  -[NTKVictoryAnalogBackgroundView ntk_setBoundsAndPositionFromFrame:](analogBackgroundView, "ntk_setBoundsAndPositionFromFrame:");
}

- (void)layoutOlympusView
{
  olympusView = self->_olympusView;
  uint64_t v4 = [(NTKShibaFaceView *)self timeView];
  [v4 bounds];
  -[NTKOlympusTimeView ntk_setBoundsAndPositionFromFrame:](olympusView, "ntk_setBoundsAndPositionFromFrame:");

  +[CATransaction setDisableActions:1];
  objc_super v5 = [(NTKOlympusTimeView *)self->_olympusView layer];
  [(NTKOlympusTimeView *)self->_olympusView bounds];
  [v5 setCornerRadius:v6 * 0.5];

  +[CATransaction setDisableActions:0];
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKShibaFaceView;
  [(NTKShibaFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKShibaFaceView *)self _setupViews];
}

- (void)_unloadSnapshotContentViews
{
  [(NTKShibaFaceView *)self _removeViews];
  v3.receiver = self;
  v3.super_class = (Class)NTKShibaFaceView;
  [(NTKShibaFaceView *)&v3 _unloadSnapshotContentViews];
}

- (void)_setupViews
{
  self->_contentLoaded = 1;
  objc_super v3 = [(NTKShibaFaceView *)self optionForCustomEditMode:15 slot:0];
  self->_currentStyle = (unint64_t)[v3 style];

  uint64_t v4 = [(NTKShibaFaceView *)self palette];
  objc_super v5 = [(NTKShibaFaceView *)self faceColorPalette];
  -[NTKShibaFaceView updateWithPalette:isMulticolor:](self, "updateWithPalette:isMulticolor:", v4, [v5 isMulticolor]);

  [(NTKShibaFaceView *)self _createAndRemoveViewsForCurrentStateIfNeeded];
  [(NTKShibaFaceView *)self _setupController];
  double v6 = (UITapGestureRecognizer *)objc_alloc_init((Class)UITapGestureRecognizer);
  tapGesture = self->_tapGesture;
  self->_tapGesture = v6;

  [(UITapGestureRecognizer *)self->_tapGesture addTarget:self action:"_handleTapGesture"];
  id v8 = [(NTKShibaFaceView *)self timeView];
  [v8 addGestureRecognizer:self->_tapGesture];
}

- (void)_handleTapGesture
{
  objc_super v3 = [(NTKShibaFaceView *)self delegate];
  +[NTKVictoryAppLauncher attemptLaunchWithDelegate:v3];

  uint64_t v4 = [(NTKShibaFaceView *)self timeView];
  objc_super v5 = [(NTKShibaFaceView *)self timeView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [(NTKShibaFaceView *)self contentView];
  objc_msgSend(v4, "convertRect:toView:", v14, v7, v9, v11, v13);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  id v23 = [(NTKShibaFaceView *)self delegate];
  objc_msgSend(v23, "faceViewRequestedLaunchFromRect:", v16, v18, v20, v22);
}

- (void)_setupController
{
  if (!self->_olympusController)
  {
    self->_olympusController = (NTKOlympusController *)[objc_alloc((Class)NTKOlympusController) initWithFaceView:self olympusView:self->_olympusView];
    _objc_release_x1();
  }
}

- (void)_removeViews
{
  self->_contentLoaded = 0;
  [(NTKShibaFaceView *)self _tearDownOlympusView];
  [(NTKShibaFaceView *)self _tearDownAnalogView];
  olympusController = self->_olympusController;
  self->_olympusController = 0;

  uint64_t v4 = [(NTKShibaFaceView *)self timeView];
  [v4 removeGestureRecognizer:self->_tapGesture];

  tapGesture = self->_tapGesture;
  self->_tapGesture = 0;
}

- (id)dialView
{
  id v3 = [(NTKShibaFaceView *)self device];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_114D8);
  id WeakRetained = objc_loadWeakRetained(&qword_114E0);
  if (WeakRetained)
  {
    objc_super v5 = WeakRetained;
    id v6 = objc_loadWeakRetained(&qword_114E0);
    if (v6 == v3)
    {
      id v7 = [v3 version];
      uint64_t v8 = qword_114E8;

      if (v7 == (id)v8) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v9 = objc_storeWeak(&qword_114E0, v3);
  qword_114E8 = (uint64_t)[v3 version];

  +[NTKAnalogUtilities whistlerMediumDialDiameterForDevice:v3];
  qword_114D0 = v10;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_114D8);
  double v11 = *(double *)&qword_114D0;

  double v12 = [NTKShibaTimeView alloc];
  double v13 = [(NTKShibaFaceView *)self device];
  v14 = -[NTKShibaTimeView initWithFrame:style:andDevice:](v12, "initWithFrame:style:andDevice:", 0, v13, 0.0, 0.0, v11, v11);

  double v15 = [(NTKShibaFaceView *)self palette];
  [(NTKShibaTimeView *)v14 setPalette:v15];

  return v14;
}

- (void)_createAndRemoveViewsForCurrentStateIfNeeded
{
  if (!self->_contentLoaded) {
    return;
  }
  unint64_t currentStyle = self->_currentStyle;
  switch(currentStyle)
  {
    case 0uLL:
      goto LABEL_5;
    case 3uLL:
      [(NTKShibaFaceView *)self _createAnalogBackgroundIfNeeded];
      [(NTKShibaFaceView *)self _tearDownOlympusView];
      break;
    case 2uLL:
LABEL_5:
      [(NTKShibaFaceView *)self _createOlympusViewIfNeeded];
      [(NTKShibaFaceView *)self _tearDownAnalogView];
      break;
  }

  [(NTKShibaFaceView *)self _setupViewsForCurrentState];
}

- (void)_setupViewsForCurrentState
{
  [(NTKOlympusTimeView *)self->_olympusView setupViewsForCurrentState:[(NTKShibaFaceView *)self editing]];
  if (self->_analogBackgroundView)
  {
    id v3 = objc_alloc((Class)NTKOlympusAnalogBackgroundPalette);
    uint64_t v4 = [(NTKShibaFaceView *)self palette];
    id v5 = [v3 initWithOlympusColorPalette:v4];

    [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView applyTransitionFraction:self->_currentStyle fromOlympusStyle:self->_currentStyle toOlympusStyle:1.0];
    [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView setPalette:v5];
    [(NTKShibaFaceView *)self _updateBackgroundViewAlpha];
  }
}

- (void)_createOlympusViewIfNeeded
{
  if (!self->_olympusView)
  {
    id v3 = objc_alloc((Class)NTKOlympusTimeView);
    uint64_t v4 = [(NTKShibaFaceView *)self device];
    unint64_t currentStyle = self->_currentStyle;
    id v6 = [(NTKShibaFaceView *)self palette];
    id v7 = [(NTKShibaFaceView *)self currentDisplayDate];
    uint64_t v8 = +[NTKShibaFaceBundle imageWithName:@"Victory-logo-small"];
    id v9 = (NTKOlympusTimeView *)[v3 initWithDevice:v4 dial:0 style:currentStyle colorPalette:v6 date:v7 useSmallFont:1 circularLogoImage:v8];
    olympusView = self->_olympusView;
    self->_olympusView = v9;

    [(NTKOlympusTimeView *)self->_olympusView setClipsToBounds:1];
    [(NTKOlympusController *)self->_olympusController setOlympusView:self->_olympusView];
    double v11 = [(NTKShibaFaceView *)self shibaTimeView];
    id v13 = [v11 dialBackgroundView];

    double v12 = self->_olympusView;
    if (self->_analogBackgroundView)
    {
      objc_msgSend(v13, "insertSubview:belowSubview:", v12);
    }
    else
    {
      [v13 addSubview:v12];
      [v13 sendSubviewToBack:self->_olympusView];
    }
    [(NTKShibaFaceView *)self layoutOlympusView];
  }
}

- (void)_createAnalogBackgroundIfNeeded
{
  if (!self->_analogBackgroundView)
  {
    id v3 = objc_alloc((Class)NTKVictoryAnalogBackgroundView);
    uint64_t v4 = [(NTKShibaFaceView *)self timeView];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    id v13 = [(NTKShibaFaceView *)self device];
    v14 = (NTKVictoryAnalogBackgroundView *)objc_msgSend(v3, "initWithFrame:forDevice:", v13, v6, v8, v10, v12);
    analogBackgroundView = self->_analogBackgroundView;
    self->_analogBackgroundView = v14;

    double v16 = +[NTKShibaFaceBundle imageWithName:@"Victory-logo-small"];
    [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView setLogoImage:v16];

    [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView setStyle:5];
    double v17 = [(NTKShibaFaceView *)self timeView];
    [v17 bounds];
    CGFloat v18 = CGRectGetWidth(v24) * 0.5;
    double v19 = [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView layer];
    [v19 setCornerRadius:v18];

    double v20 = [(NTKShibaFaceView *)self shibaTimeView];
    id v22 = [v20 dialBackgroundView];

    double v21 = self->_analogBackgroundView;
    if (self->_olympusView)
    {
      objc_msgSend(v22, "insertSubview:aboveSubview:", v21);
    }
    else
    {
      [v22 addSubview:v21];
      [v22 sendSubviewToBack:self->_analogBackgroundView];
    }
  }
}

- (void)_tearDownOlympusView
{
  [(NTKOlympusTimeView *)self->_olympusView removeFromSuperview];
  olympusView = self->_olympusView;
  self->_olympusView = 0;
}

- (void)_tearDownAnalogView
{
  [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView removeFromSuperview];
  analogBackgroundView = self->_analogBackgroundView;
  self->_analogBackgroundView = 0;
}

- (void)_applyDataMode
{
  id v3 = (char *)[(NTKShibaFaceView *)self dataMode];
  [(NTKOlympusController *)self->_olympusController applyDataMode:v3];
  id v4 = [(NTKShibaFaceView *)self timeView];
  [v4 setUserInteractionEnabled:v3 == (unsigned char *)&dword_0 + 1];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NTKShibaFaceView;
  id v6 = a3;
  [(NTKShibaFaceView *)&v7 setOverrideDate:v6 duration:a4];
  -[NTKOlympusController setOverrideDate:duration:](self->_olympusController, "setOverrideDate:duration:", v6, a4, v7.receiver, v7.super_class);
}

- (void)setTimeOffset:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKShibaFaceView;
  -[NTKShibaFaceView setTimeOffset:](&v5, "setTimeOffset:");
  [(NTKOlympusTimeView *)self->_olympusView setTimeOffset:a3];
}

- (void)updateMonochromeColorForRichComplicationView:(id)a3
{
  id v8 = a3;
  id v4 = [(NTKShibaFaceView *)self palette];
  objc_super v5 = [v4 cornerComplicationsAccentColor];
  [(NTKShibaFaceView *)self setComplicationColor:v5];

  id v6 = [(NTKShibaFaceView *)self complicationColor];
  [(NTKShibaFaceView *)self setInterpolatedComplicationColor:v6];

  objc_super v7 = [(NTKShibaFaceView *)self faceColorPalette];
  LODWORD(v6) = [v7 isMulticolor];

  if (v6) {
    [v8 transitionToMonochromeWithFraction:0.0];
  }
  else {
    [v8 updateMonochromeColor];
  }
}

- (void)setCurrentStyle:(unint64_t)a3
{
  self->_unint64_t currentStyle = a3;
  [(NTKShibaFaceView *)self _cleanupTransitions];
}

- (void)updateWithPalette:(id)a3 isMulticolor:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v6 = [v8 cornerComplicationsAccentColor];
  [(NTKShibaFaceView *)self _updateComplicationsWithColor:v6 isMulticolor:v4];

  objc_super v7 = [(NTKShibaFaceView *)self shibaTimeView];
  [v7 setPalette:v8];

  [(NTKOlympusTimeView *)self->_olympusView setCurrentColorPalette:v8];
}

- (void)_updateBackgroundViewAlpha
{
  if (self->_currentStyle == 3) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView setAlpha:v3];
  olympusView = self->_olympusView;

  [(NTKOlympusTimeView *)olympusView setAlpha:1.0 - v3];
}

- (void)_cleanupTransitions
{
  [(NTKShibaFaceView *)self _updateBackgroundViewAlpha];
  [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView applyTransitionFraction:self->_currentStyle fromOlympusStyle:self->_currentStyle toOlympusStyle:1.0];
  analogBackgroundView = self->_analogBackgroundView;
  long long v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v15[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v12 = v15[0];
  v15[1] = v13;
  long long v16 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  long long v11 = v16;
  [(NTKVictoryAnalogBackgroundView *)analogBackgroundView setTransform:v15];
  [(NTKOlympusTimeView *)self->_olympusView setCurrentStyle:self->_currentStyle];
  [(NTKOlympusTimeView *)self->_olympusView applyTransitionFraction:self->_currentStyle fromStyle:self->_currentStyle toStyle:1.0];
  BOOL v4 = [(NTKShibaFaceView *)self palette];
  [(NTKOlympusTimeView *)self->_olympusView setCurrentColorPalette:v4];

  olympusView = self->_olympusView;
  v14[0] = v12;
  v14[1] = v13;
  v14[2] = v11;
  [(NTKOlympusTimeView *)olympusView setTransform:v14];
  [(UIView *)self->_transitionOlympusView removeFromSuperview];
  transitionOlympusView = self->_transitionOlympusView;
  self->_transitionOlympusView = 0;

  unint64_t v7 = [(NTKShibaFaceView *)self _dualTimeStyleForOlympusStyle:self->_currentStyle];
  id v8 = [(NTKShibaFaceView *)self shibaTimeView];
  [v8 setStyle:v7];

  double v9 = [(NTKShibaFaceView *)self palette];
  double v10 = [(NTKShibaFaceView *)self shibaTimeView];
  [v10 setPalette:v9];
}

- (void)_prepareForEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKShibaFaceView;
  [(NTKShibaFaceView *)&v3 _prepareForEditing];
  [(NTKShibaFaceView *)self configureViewsForEditing];
  [(NTKOlympusTimeView *)self->_olympusView prepareForEditing];
  [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView willBeginEditing];
}

- (void)configureViewsForEditing
{
  if (self->_contentLoaded)
  {
    [(NTKShibaFaceView *)self _createOlympusViewIfNeeded];
    [(NTKOlympusTimeView *)self->_olympusView configureViewsForEditing];
    [(NTKShibaFaceView *)self _createAnalogBackgroundIfNeeded];
    [(NTKShibaFaceView *)self _setupViewsForCurrentState];
  }
}

- (void)_configureForEditMode:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKShibaFaceView;
  [(NTKShibaFaceView *)&v4 _configureForEditMode:a3];
  [(NTKShibaFaceView *)self _cleanupTransitions];
}

- (void)_cleanupAfterEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKShibaFaceView;
  [(NTKShibaFaceView *)&v3 _cleanupAfterEditing];
  [(NTKOlympusTimeView *)self->_olympusView cleanupAfterEditing];
  [(NTKShibaFaceView *)self _createAndRemoveViewsForCurrentStateIfNeeded];
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  double v15 = v14;
  if (a6 == 10)
  {
    id v45 = v14;
    CGRect v24 = [(NTKShibaFaceView *)self interpolatedColorPalette];
    id v20 = [v24 fromPalette];

    v25 = [(NTKShibaFaceView *)self interpolatedColorPalette];
    id v22 = [v25 toPalette];

    unsigned int v26 = [v20 isMulticolor];
    unsigned int v27 = [v22 isMulticolor];
    char v28 = v26 & v27;
    char v29 = v26 ^ v27;
    double v30 = 0.0;
    if ((v26 & v27) == 0) {
      double v30 = a3;
    }
    if (v27 & (v26 ^ v27) ^ 1 | v26) {
      double v31 = v30;
    }
    else {
      double v31 = 1.0 - a3;
    }
    if (objc_msgSend(v20, "isMulticolor", 1.0 - a3))
    {
      uint64_t v32 = [(NTKShibaFaceView *)self multicolorPaletteReplacement];

      id v20 = (id)v32;
    }
    if ([v22 isMulticolor])
    {
      uint64_t v33 = [(NTKShibaFaceView *)self multicolorPaletteReplacement];

      id v22 = (id)v33;
    }
    id v23 = [v20 cornerComplicationsAccentColor];
    v34 = [v22 cornerComplicationsAccentColor];
    v35 = NTKInterpolateBetweenColors();
    [(NTKShibaFaceView *)self setComplicationColor:v35];
    [(NTKShibaFaceView *)self setInterpolatedComplicationColor:v35];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_6F20;
    v46[3] = &unk_C300;
    char v47 = v29;
    char v48 = v28;
    *(double *)&v46[4] = v31;
    [(NTKShibaFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v46];
    if ([v12 isEqual:v13])
    {
      [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView setStyle:5];
      id v36 = [objc_alloc((Class)NTKOlympusAnalogBackgroundPalette) initWithOlympusColorPalette:v22];
      [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView setPalette:v36];
    }
    else
    {
      [(NTKShibaFaceView *)self _applyTransitionFraction:v20 fromColorPalette:v22 toColorPalette:1 animateElements:a3];
    }
    double v15 = v45;

    goto LABEL_19;
  }
  if (a6 == 15)
  {
    long long v16 = (char *)[v12 style];
    double v17 = (char *)[v13 style];
    if (v16 != v17)
    {
      CGFloat v18 = v17;
      double v19 = [(NTKShibaFaceView *)self palette];
      id v20 = [v19 copy];

      [v20 setStyle:v16];
      double v21 = [(NTKShibaFaceView *)self palette];
      id v22 = [v21 copy];

      [v22 setStyle:v18];
      if (v16 == (unsigned char *)&dword_0 + 3)
      {
        [(NTKOlympusTimeView *)self->_olympusView applyTransitionFraction:3 fromStyle:v18 toStyle:a3];
        [(NTKShibaFaceView *)self _applyTransitionFraction:self->_analogBackgroundView fromView:self->_olympusView toView:a3];
        [(NTKShibaFaceView *)self _applyTransitionFraction:v20 fromColorPalette:v22 toColorPalette:0 animateElements:a3];
        id v23 = [(NTKShibaFaceView *)self shibaTimeView];
        [v23 setStyle:0];
      }
      else
      {
        if (v18) {
          goto LABEL_20;
        }
        transitionOlympusView = self->_transitionOlympusView;
        if (!transitionOlympusView)
        {
          [(NTKOlympusTimeView *)self->_olympusView setAlpha:1.0];
          [(NTKOlympusTimeView *)self->_olympusView setCurrentStyle:0];
          [(NTKOlympusTimeView *)self->_olympusView applyTransitionFraction:v16 fromStyle:0 toStyle:1.0];
          [(NTKOlympusTimeView *)self->_olympusView applyTransitionFraction:v20 fromColorPalette:v22 toColorPalette:0 animateElements:1.0];
          v38 = [(NTKOlympusTimeView *)self->_olympusView snapshotViewAfterScreenUpdates:1];
          v39 = self->_transitionOlympusView;
          self->_transitionOlympusView = v38;

          v40 = [(NTKShibaFaceView *)self shibaTimeView];
          v41 = [v40 dialBackgroundView];
          [v41 insertSubview:self->_transitionOlympusView aboveSubview:self->_olympusView];

          [(NTKOlympusTimeView *)self->_olympusView center];
          -[UIView setCenter:](self->_transitionOlympusView, "setCenter:");
          [(UIView *)self->_transitionOlympusView setAlpha:0.0];
          [(NTKOlympusTimeView *)self->_olympusView setCurrentStyle:v16];
          [(NTKOlympusTimeView *)self->_olympusView applyTransitionFraction:v16 fromStyle:0 toStyle:0.0];
          [(NTKOlympusTimeView *)self->_olympusView applyTransitionFraction:v20 fromColorPalette:v22 toColorPalette:0 animateElements:0.0];
          transitionOlympusView = self->_transitionOlympusView;
        }
        [(NTKShibaFaceView *)self _applyTransitionFraction:self->_olympusView fromView:transitionOlympusView toView:a3];
        v42 = [(NTKShibaFaceView *)self shibaTimeView];
        id v23 = [v42 analogHandsView];

        v43 = [(NTKShibaFaceView *)self shibaTimeView];
        v44 = [v43 digitalContainerView];

        [(NTKShibaFaceView *)self _applyTransitionFraction:v23 fromView:v44 toView:a3];
      }
LABEL_19:

LABEL_20:
    }
  }
}

- (void)_applyTransitionFraction:(double)a3 fromView:(id)a4 toView:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  if (v6)
  {
    CLKCompressFraction();
    CLKInterpolateBetweenFloatsClipped();
    CGFloat v9 = v8;
    CLKInterpolateBetweenFloatsClipped();
    double v11 = v10;
    CGAffineTransformMakeScale(&v19, v9, v9);
    CGAffineTransform v18 = v19;
    [v6 setTransform:&v18];
    [v6 setAlpha:v11];
  }
  if (v7)
  {
    CLKCompressFraction();
    CLKInterpolateBetweenFloatsClipped();
    CGFloat v13 = v12;
    CLKInterpolateBetweenFloatsClipped();
    double v15 = v14;
    CGAffineTransformMakeScale(&v17, v13, v13);
    CGAffineTransform v16 = v17;
    [v7 setTransform:&v16];
    [v7 setAlpha:v15];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5 animateElements:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  double v12 = [(NTKShibaFaceView *)self shibaTimeView];
  [v12 applyTransitionFraction:v11 fromColorPalette:v10 toColorPalette:v6 animateElements:a3];

  id v14 = [objc_alloc((Class)NTKOlympusAnalogBackgroundPalette) initWithOlympusColorPalette:v11];
  id v13 = [objc_alloc((Class)NTKOlympusAnalogBackgroundPalette) initWithOlympusColorPalette:v10];
  [(NTKVictoryAnalogBackgroundView *)self->_analogBackgroundView applyTransitionFraction:v14 fromPalette:v13 toPalette:5 style:v6 animateElements:a3];
  [(NTKOlympusTimeView *)self->_olympusView applyTransitionFraction:v11 fromColorPalette:v10 toColorPalette:v6 animateElements:a3];
}

- (void)_updateComplicationsWithColor:(id)a3 isMulticolor:(BOOL)a4
{
  id v6 = a3;
  [(NTKShibaFaceView *)self setComplicationColor:v6];
  [(NTKShibaFaceView *)self setInterpolatedComplicationColor:v6];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_72E8;
  v7[3] = &unk_C320;
  BOOL v8 = a4;
  [(NTKShibaFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v7];
}

- (NTKShibaColorPalette)multicolorPaletteReplacement
{
  multicolorPaletteReplacement = self->_multicolorPaletteReplacement;
  if (!multicolorPaletteReplacement)
  {
    objc_super v4 = [(NTKShibaFaceView *)self faceColorPalette];
    objc_super v5 = (NTKShibaColorPalette *)[v4 copy];
    id v6 = self->_multicolorPaletteReplacement;
    self->_multicolorPaletteReplacement = v5;

    id v7 = objc_alloc((Class)NTKPigmentEditOption);
    BOOL v8 = +[NTKOlympusColorEditOption colorNameForColorValue:6];
    CGFloat v9 = +[NTKShibaFace pigmentFaceDomain];
    id v10 = [v7 initWithOptionName:v8 collectionName:v9];
    [(NTKShibaColorPalette *)self->_multicolorPaletteReplacement setPigmentEditOption:v10];

    multicolorPaletteReplacement = self->_multicolorPaletteReplacement;
  }

  return multicolorPaletteReplacement;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  if (a4 == 10)
  {
    CGFloat v9 = [(NTKShibaFaceView *)self palette];
    id v10 = [(NTKShibaFaceView *)self faceColorPalette];
    -[NTKShibaFaceView updateWithPalette:isMulticolor:](self, "updateWithPalette:isMulticolor:", v9, [v10 isMulticolor]);
  }
  else if (a4 == 15)
  {
    -[NTKShibaFaceView setCurrentStyle:](self, "setCurrentStyle:", [v11 style]);
  }
  if ([(NTKShibaFaceView *)self editing])
  {
    [(NTKShibaFaceView *)self _setupViewsForCurrentState];
  }
  else
  {
    [(NTKShibaFaceView *)self _createAndRemoveViewsForCurrentStateIfNeeded];
    [(NTKOlympusTimeView *)self->_olympusView cleanupAfterEditing];
  }
}

- (unint64_t)_dualTimeStyleForOlympusStyle:(unint64_t)a3
{
  return a3 == 0;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15) {
    return &off_CAA8;
  }
  else {
    return 0;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!qword_114C8)
  {
    uint64_t v10 = objc_opt_new();
    id v11 = (void *)qword_114C8;
    qword_114C8 = v10;
  }
  if (a4 == 15)
  {
    id v12 = v8;
    id v13 = [v9 objectForKeyedSubscript:&off_C8E0];
    id v14 = [v13 pigmentEditOption];

    double v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 style]);
    CGAffineTransform v16 = [v14 identifier];
    CGAffineTransform v17 = +[NSString stringWithFormat:@"%@-%@", v15, v16];

    CGAffineTransform v18 = [(id)qword_114C8 objectForKey:v17];
    if (!v18)
    {
      CGAffineTransform v18 = [(NTKShibaFaceView *)self _renderDialSwatchImageForStyle:v12 colorOption:v14];
      [(id)qword_114C8 setObject:v18 forKey:v17];
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)NTKShibaFaceView;
    CGAffineTransform v18 = [(NTKShibaFaceView *)&v20 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
  }

  return v18;
}

- (id)_renderDialSwatchImageForStyle:(id)a3 colorOption:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NTKShibaFaceView *)self timeView];

  if (!v8) {
    [(NTKShibaFaceView *)self _loadSnapshotContentViews];
  }
  id v9 = [(NTKShibaFaceView *)self optionForCustomEditMode:15 slot:0];
  [(NTKShibaFaceView *)self setOption:v7 forCustomEditMode:15 slot:0];

  [(NTKShibaFaceView *)self setOption:v6 forCustomEditMode:10 slot:0];
  uint64_t v10 = [(NTKShibaFaceView *)self timeView];
  [v10 bounds];
  id v15 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithBounds:", v11, v12, v13, v14);
  [(NTKShibaFaceView *)self layoutIfNeeded];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_78F8;
  v19[3] = &unk_C348;
  id v20 = v10;
  id v16 = v10;
  CGAffineTransform v17 = [v15 imageWithActions:v19];
  [(NTKShibaFaceView *)self setOption:v9 forCustomEditMode:15 slot:0];

  return v17;
}

- (NTKOlympusController)olympusController
{
  return self->_olympusController;
}

- (void)setOlympusController:(id)a3
{
}

- (NTKOlympusTimeView)olympusView
{
  return self->_olympusView;
}

- (void)setOlympusView:(id)a3
{
}

- (UIView)transitionOlympusView
{
  return self->_transitionOlympusView;
}

- (void)setTransitionOlympusView:(id)a3
{
}

- (NTKVictoryAnalogBackgroundView)analogBackgroundView
{
  return self->_analogBackgroundView;
}

- (void)setAnalogBackgroundView:(id)a3
{
}

- (BOOL)contentLoaded
{
  return self->_contentLoaded;
}

- (void)setContentLoaded:(BOOL)a3
{
  self->_contentLoaded = a3;
}

- (unint64_t)currentStyle
{
  return self->_currentStyle;
}

- (void)setMulticolorPaletteReplacement:(id)a3
{
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setTapGesture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_multicolorPaletteReplacement, 0);
  objc_storeStrong((id *)&self->_analogBackgroundView, 0);
  objc_storeStrong((id *)&self->_transitionOlympusView, 0);
  objc_storeStrong((id *)&self->_olympusView, 0);

  objc_storeStrong((id *)&self->_olympusController, 0);
}

@end