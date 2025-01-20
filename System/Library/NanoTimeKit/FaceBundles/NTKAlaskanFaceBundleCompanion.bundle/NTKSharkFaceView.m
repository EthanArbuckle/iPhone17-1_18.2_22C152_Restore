@interface NTKSharkFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_wantsStatusBarHidden;
- (BOOL)viewsLoaded;
- (CGRect)contentViewFrame;
- (NTKAlaskanChronographStyleController)alaskanContentController;
- (NTKAlaskanChronographView)alaskanContentView;
- (NTKAlaskanContentController)transitionController;
- (NTKAlaskanContentView)transitionContentView;
- (NTKSharkFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_complicationAlphaForEditMode:(int64_t)a3;
- (double)_contentAlphaForEditMode:(int64_t)a3;
- (double)_timeViewAlphaForEditMode:(int64_t)a3;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)chronoPalette;
- (id)createController;
- (id)createFaceColorPalette;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyDataMode;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterEditing;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_prepareForSnapshotting;
- (void)_removeViews;
- (void)_setupViews;
- (void)_unloadSnapshotContentViews;
- (void)createView;
- (void)layoutSubviews;
- (void)setAlaskanContentController:(id)a3;
- (void)setAlaskanContentView:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setTransitionContentView:(id)a3;
- (void)setTransitionController:(id)a3;
- (void)setViewsLoaded:(BOOL)a3;
- (void)updateComplicationsColorWithPalette:(id)a3;
- (void)updateTimeViewColor:(id)a3;
@end

@implementation NTKSharkFaceView

- (NTKSharkFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKSharkFaceView;
  v9 = [(NTKSharkFaceView *)&v14 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    id v10 = objc_alloc((Class)NTKWhistlerAnalogFaceViewComplicationFactory);
    v11 = [(NTKSharkFaceView *)v9 device];
    id v12 = [v10 initWithFaceView:v9 dialDiameter:v8 device:sub_442C(v11)];

    [v12 setUsesNarrowTopSlots:1];
    [(NTKSharkFaceView *)v9 setComplicationFactory:v12];
  }
  return v9;
}

- (void)_applyDataMode
{
  v3 = [(NTKSharkFaceView *)self alaskanContentController];
  objc_msgSend(v3, "setDatamode:", -[NTKSharkFaceView dataMode](self, "dataMode"));

  id v5 = [(NTKSharkFaceView *)self delegate];
  v4 = [(NTKSharkFaceView *)self alaskanContentController];
  objc_msgSend(v5, "faceViewWantsStatusBarHidden:animated:", objc_msgSend(v4, "wantsStatusBarHidden"), 0);
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NTKSharkFaceView;
  id v6 = a3;
  [(NTKSharkFaceView *)&v8 setOverrideDate:v6 duration:a4];
  v7 = [(NTKSharkFaceView *)self alaskanContentController];
  [v7 setOverrideDate:v6 duration:a4];
}

- (void)_prepareForSnapshotting
{
  v2.receiver = self;
  v2.super_class = (Class)NTKSharkFaceView;
  [(NTKSharkFaceView *)&v2 _prepareForSnapshotting];
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKSharkFaceView;
  [(NTKSharkFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKSharkFaceView *)self _setupViews];
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKSharkFaceView;
  [(NTKSharkFaceView *)&v3 _unloadSnapshotContentViews];
  [(NTKSharkFaceView *)self _removeViews];
}

- (void)_setupViews
{
  self->_viewsLoaded = 1;
  [(NTKSharkFaceView *)self createView];
}

- (void)_removeViews
{
  [(NTKAlaskanChronographView *)self->_alaskanContentView removeFromSuperview];
  self->_viewsLoaded = 0;
  alaskanContentView = self->_alaskanContentView;
  self->_alaskanContentView = 0;

  alaskanContentController = self->_alaskanContentController;
  self->_alaskanContentController = 0;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKSharkFaceView;
  [(NTKSharkFaceView *)&v4 layoutSubviews];
  alaskanContentView = self->_alaskanContentView;
  [(NTKSharkFaceView *)self contentViewFrame];
  -[NTKAlaskanChronographView ntk_setBoundsAndPositionFromFrame:](alaskanContentView, "ntk_setBoundsAndPositionFromFrame:");
}

- (CGRect)contentViewFrame
{
  objc_super v3 = [(NTKSharkFaceView *)self device];
  sub_442C(v3);

  [(NTKSharkFaceView *)self bounds];
  objc_super v4 = [(NTKSharkFaceView *)self device];
  CLKRectCenteredIntegralRectForDevice();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)createController
{
  objc_super v3 = [NTKAlaskanChronographStyleController alloc];
  objc_super v4 = [(NTKSharkFaceView *)self alaskanContentView];
  double v5 = [(NTKAlaskanChronographStyleController *)v3 initWithContentView:v4 crownInputHandler:0];

  [(NTKAlaskanChronographStyleController *)v5 setFaceView:self];
  [(NTKAlaskanChronographStyleController *)v5 setDatamode:[(NTKSharkFaceView *)self dataMode]];

  return v5;
}

- (BOOL)_wantsStatusBarHidden
{
  objc_super v2 = [(NTKSharkFaceView *)self alaskanContentController];
  unsigned __int8 v3 = [v2 wantsStatusBarHidden];

  return v3;
}

- (void)_prepareForEditing
{
  v4.receiver = self;
  v4.super_class = (Class)NTKSharkFaceView;
  [(NTKSharkFaceView *)&v4 _prepareForEditing];
  unsigned __int8 v3 = [(NTKSharkFaceView *)self alaskanContentController];
  [v3 prepareForEditing];
}

- (void)_cleanupAfterEditing
{
  v4.receiver = self;
  v4.super_class = (Class)NTKSharkFaceView;
  [(NTKSharkFaceView *)&v4 _cleanupAfterEditing];
  unsigned __int8 v3 = [(NTKSharkFaceView *)self alaskanContentController];
  [v3 cleanupAfterEditing];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  if (a4 == 10)
  {
    double v11 = [(NTKSharkFaceView *)self alaskanContentView];
    double v12 = [(NTKSharkFaceView *)self chronoPalette];
    [v11 setPalette:v12];

    double v10 = [(NTKSharkFaceView *)self chronoPalette];
    [(NTKSharkFaceView *)self updateComplicationsColorWithPalette:v10];
  }
  else
  {
    if (a4 != 11) {
      goto LABEL_6;
    }
    id v9 = [v13 timescale];
    double v10 = [(NTKSharkFaceView *)self alaskanContentView];
    [v10 setTimeScale:v9];
  }

LABEL_6:
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v20 = a4;
  id v12 = a5;
  id v13 = a7;
  if (a6 == 10)
  {
    v17 = [(NTKSharkFaceView *)self interpolatedColorPalette];
    [(NTKSharkFaceView *)self updateComplicationsColorWithPalette:v17];

    v18 = [(NTKSharkFaceView *)self alaskanContentView];
    v19 = [(NTKSharkFaceView *)self interpolatedColorPalette];
    [v18 applyPalette:v19];

    double v16 = [(NTKSharkFaceView *)self interpolatedColorPalette];
    [(NTKSharkFaceView *)self updateTimeViewColor:v16];
  }
  else
  {
    if (a6 != 11) {
      goto LABEL_6;
    }
    id v14 = [v20 timescale];
    id v15 = [v12 timescale];
    double v16 = [(NTKSharkFaceView *)self alaskanContentView];
    [v16 applyTransitionFromTimeScale:v14 toTimeScale:v15 fraction:a3];
  }

LABEL_6:
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v26.receiver = self;
  v26.super_class = (Class)NTKSharkFaceView;
  -[NTKSharkFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v26, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  id v9 = [(NTKSharkFaceView *)self optionForCustomEditMode:11 slot:0];
  id v10 = [v9 timescale];
  if (a4 != 11 && a5 == 11)
  {
    double v11 = [(NTKSharkFaceView *)self alaskanContentView];
    [v11 setIsChronoMode:1];

    id v12 = [(NTKSharkFaceView *)self alaskanContentView];
    id v13 = v12;
    id v14 = v10;
    double v15 = a3;
LABEL_7:
    [v12 applyTransitionFromTimeScale:0 toTimeScale:v14 fraction:v15];

    goto LABEL_8;
  }
  if (a4 == 11 && a5 != 11)
  {
    double v16 = [(NTKSharkFaceView *)self alaskanContentView];
    [v16 setIsChronoMode:1];

    id v12 = [(NTKSharkFaceView *)self alaskanContentView];
    id v13 = v12;
    double v15 = 1.0 - a3;
    id v14 = v10;
    goto LABEL_7;
  }
LABEL_8:
  [(NTKSharkFaceView *)self _contentAlphaForEditMode:a4];
  [(NTKSharkFaceView *)self _contentAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v18 = v17;
  v19 = [(NTKSharkFaceView *)self alaskanContentView];
  [v19 setAlpha:v18];

  [(NTKSharkFaceView *)self _timeViewAlphaForEditMode:a4];
  [(NTKSharkFaceView *)self _timeViewAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v21 = v20;
  v22 = [(NTKSharkFaceView *)self timeView];
  [v22 setAlpha:v21];

  [(NTKSharkFaceView *)self _complicationAlphaForEditMode:a4];
  [(NTKSharkFaceView *)self _complicationAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v24 = v23;
  v25 = [(NTKSharkFaceView *)self complicationContainerView];
  [v25 setAlpha:v24];
}

- (void)_configureForEditMode:(int64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)NTKSharkFaceView;
  -[NTKSharkFaceView _configureForEditMode:](&v18, "_configureForEditMode:");
  [(NTKSharkFaceView *)self _contentAlphaForEditMode:a3];
  double v6 = v5;
  double v7 = [(NTKSharkFaceView *)self alaskanContentView];
  [v7 setAlpha:v6];

  [(NTKSharkFaceView *)self _timeViewAlphaForEditMode:a3];
  double v9 = v8;
  id v10 = [(NTKSharkFaceView *)self timeView];
  [v10 setAlpha:v9];

  [(NTKSharkFaceView *)self _complicationAlphaForEditMode:a3];
  double v12 = v11;
  id v13 = [(NTKSharkFaceView *)self complicationContainerView];
  [v13 setAlpha:v12];

  id v14 = [(NTKSharkFaceView *)self alaskanContentView];
  [v14 setIsChronoMode:a3 == 11];

  if (a3 == 11)
  {
    double v15 = [(NTKSharkFaceView *)self optionForCustomEditMode:11 slot:0];
    id v16 = [v15 timescale];
    double v17 = [(NTKSharkFaceView *)self alaskanContentView];
    [v17 setTimeScale:v16];
  }
}

- (void)createView
{
  if ([(NTKSharkFaceView *)self viewsLoaded])
  {
    unsigned __int8 v3 = [(NTKSharkFaceView *)self alaskanContentView];
    [v3 removeFromSuperview];

    objc_super v4 = [NTKAlaskanChronographView alloc];
    [(NTKSharkFaceView *)self contentViewFrame];
    double v5 = -[NTKAlaskanChronographView initWithFrame:](v4, "initWithFrame:");
    [(NTKSharkFaceView *)self setAlaskanContentView:v5];

    double v6 = [(NTKSharkFaceView *)self optionForCustomEditMode:11 slot:0];
    id v7 = [v6 timescale];
    double v8 = [(NTKSharkFaceView *)self alaskanContentView];
    [v8 setTimeScale:v7];

    double v9 = [(NTKSharkFaceView *)self createController];
    [(NTKSharkFaceView *)self setAlaskanContentController:v9];

    id v10 = [(NTKSharkFaceView *)self contentView];
    double v11 = [(NTKSharkFaceView *)self alaskanContentView];
    [v10 addSubview:v11];

    if (([(NTKSharkFaceView *)self editing] & 1) == 0)
    {
      double v12 = [(NTKSharkFaceView *)self delegate];
      id v13 = [(NTKSharkFaceView *)self alaskanContentController];
      objc_msgSend(v12, "faceViewWantsStatusBarHidden:animated:", objc_msgSend(v13, "wantsStatusBarHidden"), 0);
    }
    id v14 = [(NTKSharkFaceView *)self alaskanContentView];
    double v15 = [(NTKSharkFaceView *)self chronoPalette];
    [v14 setPalette:v15];
  }
  id v16 = [(NTKSharkFaceView *)self chronoPalette];
  [(NTKSharkFaceView *)self updateComplicationsColorWithPalette:v16];

  double v17 = [(NTKSharkFaceView *)self chronoPalette];
  [(NTKSharkFaceView *)self updateTimeViewColor:v17];

  id v18 = [(NTKSharkFaceView *)self alaskanContentController];
  [v18 applyVisibilityWithFraction:1.0];
}

- (void)updateTimeViewColor:(id)a3
{
  id v4 = a3;
  id v21 = [(NTKSharkFaceView *)self timeView];
  double v5 = [v4 clockHands];
  double v6 = [v21 hourHandView];
  [v6 setColor:v5];

  id v7 = [v4 clockHands];
  double v8 = [v21 minuteHandView];
  [v8 setColor:v7];

  double v9 = [v4 clockHandsInlay];
  id v10 = [v21 hourHandView];
  [v10 setInlayColor:v9];

  double v11 = [v4 clockHandsInlay];
  double v12 = [v21 minuteHandView];
  [v12 setInlayColor:v11];

  id v13 = [v4 secondsHand];

  id v14 = [v21 secondHandView];
  [v14 setColor:v13];

  double v15 = +[UIColor blackColor];
  id v16 = [v21 hourHandView];
  [v16 setHandDotColor:v15];

  double v17 = +[UIColor blackColor];
  id v18 = [v21 minuteHandView];
  [v18 setHandDotColor:v17];

  v19 = +[UIColor blackColor];
  double v20 = [v21 secondHandView];
  [v20 setHandDotColor:v19];
}

- (void)updateComplicationsColorWithPalette:(id)a3
{
  id v4 = a3;
  id v6 = [v4 cornerComplication];
  double v5 = [v4 cornerComplicationSecondary];

  [(NTKSharkFaceView *)self updateRichCornerComplicationsInnerColor:v6 outerColor:v5];
}

- (double)_complicationAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 11) {
    return 1.0;
  }
  return result;
}

- (double)_contentAlphaForEditMode:(int64_t)a3
{
  double result = 0.2;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (double)_timeViewAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (!a3) {
    return 1.0;
  }
  return result;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NTKSharkFaceView;
  [(NTKSharkFaceView *)&v18 _configureComplicationView:v6 forSlot:v7];
  double v8 = (void *)qword_47910;
  if (!qword_47910)
  {
    v19[0] = NTKComplicationSlotTopLeft;
    v19[1] = NTKComplicationSlotTopRight;
    v19[2] = NTKComplicationSlotBottomLeft;
    v19[3] = NTKComplicationSlotBottomRight;
    double v9 = +[NSArray arrayWithObjects:v19 count:4];
    uint64_t v10 = +[NSSet setWithArray:v9];
    double v11 = (void *)qword_47910;
    qword_47910 = v10;

    double v8 = (void *)qword_47910;
  }
  if ([v8 containsObject:v7])
  {
    id v12 = v6;
    id v13 = [(NTKSharkFaceView *)self chronoPalette];
    id v14 = [v13 cornerComplication];
    [(NTKSharkFaceView *)self setComplicationColor:v14];

    double v15 = [(NTKSharkFaceView *)self complicationColor];
    [(NTKSharkFaceView *)self setInterpolatedComplicationColor:v15];

    id v16 = [(NTKSharkFaceView *)self chronoPalette];
    double v17 = [v16 cornerComplicationSecondary];
    [(NTKSharkFaceView *)self setAlternateComplicationColor:v17];

    [v12 updateMonochromeColor];
  }
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)NTKSharkFaceView;
  -[NTKSharkFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v13, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 != 1)
  {
    NTKScaleForBreathingFraction();
    memset(&v12, 0, sizeof(v12));
    CGAffineTransformMakeScale(&v12, v7, v7);
    double v8 = [(NTKSharkFaceView *)self contentView];
    CGAffineTransform v11 = v12;
    [v8 setTransform:&v11];

    double v9 = [(NTKSharkFaceView *)self timeView];
    CGAffineTransform v11 = v12;
    [v9 setTransform:&v11];

    uint64_t v10 = [(NTKSharkFaceView *)self complicationContainerView];
    CGAffineTransform v11 = v12;
    [v10 setTransform:&v11];
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)NTKSharkFaceView;
  -[NTKSharkFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v10, "_applyRubberBandingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 11)
  {
    NTKScaleForRubberBandingFraction();
    memset(&v9, 0, sizeof(v9));
    CGAffineTransformMakeScale(&v9, v7, v7);
    CGAffineTransform v8 = v9;
    [(NTKSharkFaceView *)self setTransform:&v8];
  }
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 11) {
    return &off_3AC38;
  }
  else {
    return 0;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  if (a4 == 11)
  {
    id v9 = a5;
    objc_super v10 = [v9 objectForKeyedSubscript:&off_3A2D0];
    id v11 = v8;

    CGAffineTransform v12 = [v9 objectForKeyedSubscript:&off_3A2B8];

    if (!qword_47918)
    {
      uint64_t v13 = objc_opt_new();
      id v14 = (void *)qword_47918;
      qword_47918 = v13;
    }
    double v15 = +[NSString stringWithFormat:@"%@-%@", v11, v12];
    id v16 = [(id)qword_47918 objectForKey:v15];
    if (!v16)
    {
      double v17 = [NTKSharkFaceView alloc];
      objc_super v18 = [(NTKSharkFaceView *)self device];
      v19 = [(NTKSharkFaceView *)v17 initWithFaceStyle:44 forDevice:v18 clientIdentifier:0];

      [(NTKSharkFaceView *)self frame];
      -[NTKSharkFaceView setFrame:](v19, "setFrame:");
      [(NTKSharkFaceView *)v19 _loadSnapshotContentViews];
      [(NTKSharkFaceView *)v19 setOption:v11 forCustomEditMode:11 slot:0];
      [(NTKSharkFaceView *)v19 setOption:v12 forCustomEditMode:10 slot:0];
      double v20 = [(NTKSharkFaceView *)v19 alaskanContentView];
      [v20 setIsChronoMode:1];

      id v21 = [(NTKSharkFaceView *)v19 alaskanContentView];
      [v21 setIsEditing:1];

      v22 = NTKIdealizedDate();
      [(NTKSharkFaceView *)v19 setOverrideDate:v22 duration:0.0];

      [(NTKSharkFaceView *)self frame];
      -[NTKSharkFaceView setFrame:](v19, "setFrame:");
      [(NTKSharkFaceView *)v19 bounds];
      v30.width = v23;
      v30.height = v24;
      UIGraphicsBeginImageContextWithOptions(v30, 0, 0.0);
      v25 = [(NTKSharkFaceView *)v19 layer];
      [v25 renderInContext:UIGraphicsGetCurrentContext()];

      id v16 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      [(id)qword_47918 setObject:v16 forKey:v15];
    }
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)NTKSharkFaceView;
    id v26 = a5;
    id v16 = [(NTKSharkFaceView *)&v28 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v26];
  }

  return v16;
}

- (id)createFaceColorPalette
{
  objc_super v2 = objc_alloc_init(NTKChronographProFacePalette);

  return v2;
}

- (id)chronoPalette
{
  return [(NTKSharkFaceView *)self faceColorPalette];
}

- (NTKAlaskanChronographView)alaskanContentView
{
  return self->_alaskanContentView;
}

- (void)setAlaskanContentView:(id)a3
{
}

- (NTKAlaskanContentView)transitionContentView
{
  return self->_transitionContentView;
}

- (void)setTransitionContentView:(id)a3
{
}

- (NTKAlaskanChronographStyleController)alaskanContentController
{
  return self->_alaskanContentController;
}

- (void)setAlaskanContentController:(id)a3
{
}

- (NTKAlaskanContentController)transitionController
{
  return self->_transitionController;
}

- (void)setTransitionController:(id)a3
{
}

- (BOOL)viewsLoaded
{
  return self->_viewsLoaded;
}

- (void)setViewsLoaded:(BOOL)a3
{
  self->_viewsLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionController, 0);
  objc_storeStrong((id *)&self->_alaskanContentController, 0);
  objc_storeStrong((id *)&self->_transitionContentView, 0);

  objc_storeStrong((id *)&self->_alaskanContentView, 0);
}

@end