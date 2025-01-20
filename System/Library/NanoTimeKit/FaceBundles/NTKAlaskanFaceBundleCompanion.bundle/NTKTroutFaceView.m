@interface NTKTroutFaceView
+ (int64_t)uiSensitivity;
- (BOOL)_handlePhysicalButton:(unint64_t)a3 event:(unint64_t)a4;
- (BOOL)_wantsStatusBarHidden;
- (BOOL)_wheelChangedWithEvent:(id)a3;
- (BOOL)viewsLoaded;
- (NTKAlaskanDiverStyleController)alaskanContentController;
- (NTKAlaskanDiverStyleView)alaskanContentView;
- (NTKAlaskanPersistenceStorage)storage;
- (NTKCrownInputHandler)crownInputHandler;
- (NTKTroutFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_complicationAlphaForEditMode:(int64_t)a3;
- (double)_contentAlphaForEditMode:(int64_t)a3;
- (double)_timeViewAlphaForEditMode:(int64_t)a3;
- (double)_timeViewScale;
- (double)currentTimeViewScale;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)colorForDateComplicationPalette:(id)a3;
- (id)createController;
- (id)createFaceColorPalette;
- (id)dateComplicationView;
- (id)palette;
- (id)utilityDateComplicationFontForDateStyle:(unint64_t)a3;
- (unint64_t)textLayoutStyleForSlot:(int64_t)a3;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyDataMode;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_loadSnapshotContentViews;
- (void)_prepareForSnapshotting;
- (void)_removeViews;
- (void)_setupViews;
- (void)_unloadSnapshotContentViews;
- (void)createView;
- (void)layoutSubviews;
- (void)setAlaskanContentController:(id)a3;
- (void)setAlaskanContentView:(id)a3;
- (void)setCrownInputHandler:(id)a3;
- (void)setCurrentTimeViewScale:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setStorage:(id)a3;
- (void)setTimeOffset:(double)a3;
- (void)setViewsLoaded:(BOOL)a3;
- (void)updateComplicationsColorWithPalette:(id)a3;
- (void)updateTimeViewColor;
@end

@implementation NTKTroutFaceView

- (NTKTroutFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)NTKTroutFaceView;
  v9 = [(NTKTroutFaceView *)&v21 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  v10 = v9;
  if (v9)
  {
    uint64_t v20 = 0;
    long long v18 = 0u;
    long long v19 = 0u;
    v11 = [(NTKTroutFaceView *)v9 device];
    sub_B5FC(v11, (uint64_t)&v18);

    id v12 = objc_alloc_init((Class)NTKCompositeComplicationFactory);
    id v13 = objc_alloc((Class)NTKWhistlerAnalogFaceViewComplicationFactory);
    id v14 = [v13 initWithFaceView:v10 dialDiameter:v8 device:*(double *)&v18];
    [v14 setUsesNarrowTopSlots:1];
    [(NTKTroutFaceView *)v10 setComplicationFactory:v14];
    v22[0] = NTKComplicationSlotTopLeft;
    v22[1] = NTKComplicationSlotTopRight;
    v22[2] = NTKComplicationSlotBottomLeft;
    v22[3] = NTKComplicationSlotBottomRight;
    v15 = +[NSArray arrayWithObjects:v22 count:4];
    [v12 registerFactory:v14 forSlots:v15];

    id v16 = [objc_alloc((Class)NTKUtilityComplicationFactory) initForDevice:v8];
    [v16 setFaceView:v10];
    [v16 setDelegate:v10];
    [v16 setIncludesDateComplicationLayoutRules:1];
    [v16 setSelectedKeylineHeight:*((double *)&v18 + 1)];
    [v16 setDateKeylineMaxWidth:*(double *)&v19];
    [v16 setDateHorizontalCenterOffset:*((double *)&v19 + 1)];
    [v12 registerFactory:v16 forSlot:NTKComplicationSlotDate];
    [(NTKTroutFaceView *)v10 setComplicationFactory:v12];
  }
  return v10;
}

- (id)createFaceColorPalette
{
  v2 = objc_alloc_init(NTKAlaskanDiversColorPalette);

  return v2;
}

- (id)palette
{
  return [(NTKTroutFaceView *)self faceColorPalette];
}

- (void)setDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKTroutFaceView;
  id v4 = a3;
  [(NTKTroutFaceView *)&v5 setDelegate:v4];
  -[NTKAlaskanPersistenceStorage setDelegate:](self->_storage, "setDelegate:", v4, v5.receiver, v5.super_class);
}

+ (int64_t)uiSensitivity
{
  return 0;
}

- (void)_applyDataMode
{
  v3 = [(NTKTroutFaceView *)self alaskanContentController];
  objc_msgSend(v3, "setDatamode:", -[NTKTroutFaceView dataMode](self, "dataMode"));

  id v4 = [(NTKTroutFaceView *)self delegate];
  objc_super v5 = [(NTKTroutFaceView *)self alaskanContentController];
  objc_msgSend(v4, "faceViewWantsStatusBarHidden:animated:", objc_msgSend(v5, "wantsStatusBarHidden"), 0);

  [(NTKTroutFaceView *)self updateTimeViewColor];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NTKTroutFaceView;
  id v6 = a3;
  [(NTKTroutFaceView *)&v8 setOverrideDate:v6 duration:a4];
  v7 = [(NTKTroutFaceView *)self alaskanContentController];
  [v7 setOverrideDate:v6 duration:a4];
}

- (void)setTimeOffset:(double)a3
{
  id v4 = [(NTKTroutFaceView *)self alaskanContentController];
  [v4 setTimeOffset:a3];
}

- (void)_prepareForSnapshotting
{
  v3.receiver = self;
  v3.super_class = (Class)NTKTroutFaceView;
  [(NTKTroutFaceView *)&v3 _prepareForSnapshotting];
  [(NTKTroutFaceView *)self setStorage:0];
}

- (BOOL)_wheelChangedWithEvent:(id)a3
{
  id v4 = a3;
  if (NTKStarbearEnabled()
    && ([(NTKTroutFaceView *)self alaskanContentView],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = (char *)[v5 currentMode],
        v5,
        v6 != (unsigned char *)&dword_0 + 1))
  {
    unsigned __int8 v8 = 0;
  }
  else
  {
    v7 = [(NTKTroutFaceView *)self crownInputHandler];
    unsigned __int8 v8 = [v7 _wheelChangedWithEvent:v4];
  }
  return v8;
}

- (BOOL)_handlePhysicalButton:(unint64_t)a3 event:(unint64_t)a4
{
  id v6 = [(NTKTroutFaceView *)self crownInputHandler];
  LOBYTE(a4) = [v6 _handlePhysicalButton:a3 event:a4];

  return a4;
}

- (void)_loadSnapshotContentViews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKTroutFaceView;
  [(NTKTroutFaceView *)&v5 _loadSnapshotContentViews];
  objc_super v3 = (NTKCrownInputHandler *)objc_alloc_init((Class)NTKCrownInputHandler);
  crownInputHandler = self->_crownInputHandler;
  self->_crownInputHandler = v3;

  [(NTKTroutFaceView *)self _setupViews];
}

- (void)_unloadSnapshotContentViews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKTroutFaceView;
  [(NTKTroutFaceView *)&v4 _unloadSnapshotContentViews];
  [(NTKTroutFaceView *)self _removeViews];
  crownInputHandler = self->_crownInputHandler;
  self->_crownInputHandler = 0;
}

- (void)_setupViews
{
  objc_super v3 = objc_alloc_init(NTKAlaskanPersistenceStorage);
  storage = self->_storage;
  self->_storage = v3;

  objc_super v5 = [(NTKTroutFaceView *)self delegate];
  [(NTKAlaskanPersistenceStorage *)self->_storage setDelegate:v5];

  self->_viewsLoaded = 1;

  [(NTKTroutFaceView *)self createView];
}

- (void)_removeViews
{
  [(NTKAlaskanDiverStyleView *)self->_alaskanContentView removeFromSuperview];
  self->_viewsLoaded = 0;
  alaskanContentView = self->_alaskanContentView;
  self->_alaskanContentView = 0;

  alaskanContentController = self->_alaskanContentController;
  self->_alaskanContentController = 0;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKTroutFaceView;
  [(NTKTroutFaceView *)&v4 layoutSubviews];
  alaskanContentView = self->_alaskanContentView;
  [(NTKTroutFaceView *)self contentViewFrame];
  -[NTKAlaskanDiverStyleView ntk_setBoundsAndPositionFromFrame:](alaskanContentView, "ntk_setBoundsAndPositionFromFrame:");
}

- (double)_timeViewScale
{
  return self->_currentTimeViewScale;
}

- (id)createController
{
  objc_super v3 = [NTKAlaskanDiverStyleController alloc];
  objc_super v4 = [(NTKTroutFaceView *)self alaskanContentView];
  objc_super v5 = [(NTKTroutFaceView *)self crownInputHandler];
  id v6 = [(NTKTroutFaceView *)self storage];
  v7 = [(NTKAlaskanDiverStyleController *)v3 initWithContentView:v4 crownInputHandler:v5 storage:v6];

  [(NTKAlaskanDiverStyleController *)v7 setFaceView:self];
  [(NTKAlaskanDiverStyleController *)v7 setDatamode:[(NTKTroutFaceView *)self dataMode]];

  return v7;
}

- (BOOL)_wantsStatusBarHidden
{
  v2 = [(NTKTroutFaceView *)self alaskanContentController];
  unsigned __int8 v3 = [v2 wantsStatusBarHidden];

  return v3;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (([(NTKTroutFaceView *)self editing] & 1) == 0)
  {
    v7 = [(NTKTroutFaceView *)self alaskanContentView];
    unsigned __int8 v8 = [v7 delegate];
    [v8 alaskanDiverStyleViewDidCancelPreCountUpWithCompletionBlock:0 animated:1];
  }
  if (a4 == 10)
  {
    id v12 = [(NTKTroutFaceView *)self palette];
    v9 = [(NTKTroutFaceView *)self alaskanContentView];
    [v9 setPalette:v12];

    [(NTKTroutFaceView *)self updateComplicationsColorWithPalette:v12];
    v10 = [(NTKTroutFaceView *)self colorForDateComplicationPalette:v12];
    v11 = [(NTKTroutFaceView *)self dateComplicationView];
    [v11 setForegroundColor:v10];
  }
}

- (id)colorForDateComplicationPalette:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NTKTroutFaceView *)self storage];
  uint64_t v6 = [v5 diverCountUpStartDate];
  if (v6)
  {
    v7 = (void *)v6;
    unsigned __int8 v8 = [(NTKTroutFaceView *)self alaskanContentView];
    unsigned __int8 v9 = [v8 isEditing];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = [v4 activeStateDateComplication];
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v10 = [v4 dateComplication];
LABEL_6:
  v11 = (void *)v10;

  return v11;
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  if (a6 == 10)
  {
    id v12 = [(NTKTroutFaceView *)self interpolatedColorPalette];
    unsigned __int8 v9 = [(NTKTroutFaceView *)self alaskanContentView];
    [v9 setPalette:v12];

    [(NTKTroutFaceView *)self updateTimeViewColor];
    [(NTKTroutFaceView *)self updateComplicationsColorWithPalette:v12];
    uint64_t v10 = [(NTKTroutFaceView *)self colorForDateComplicationPalette:v12];
    v11 = [(NTKTroutFaceView *)self dateComplicationView];
    [v11 setForegroundColor:v10];
  }
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)NTKTroutFaceView;
  id v8 = a5;
  id v9 = [(NTKTroutFaceView *)&v15 _newLegacyViewForComplication:a3 family:a4 slot:v8];
  LODWORD(a3) = objc_msgSend(v8, "isEqualToString:", NTKComplicationSlotDate, v15.receiver, v15.super_class);

  if (a3)
  {
    id v10 = v9;
    v11 = [(NTKTroutFaceView *)self alaskanContentView];
    id v12 = [v11 palette];
    id v13 = [(NTKTroutFaceView *)self colorForDateComplicationPalette:v12];
    [v10 setForegroundColor:v13];
  }
  return v9;
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v17.receiver = self;
  v17.super_class = (Class)NTKTroutFaceView;
  -[NTKTroutFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v17, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  [(NTKTroutFaceView *)self _contentAlphaForEditMode:a4];
  [(NTKTroutFaceView *)self _contentAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v9 = v8;
  id v10 = [(NTKTroutFaceView *)self alaskanContentView];
  [v10 setAlpha:v9];

  [(NTKTroutFaceView *)self _complicationAlphaForEditMode:a4];
  [(NTKTroutFaceView *)self _complicationAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v12 = v11;
  id v13 = [(NTKTroutFaceView *)self complicationContainerView];
  [v13 setAlpha:v12];

  [(NTKTroutFaceView *)self _timeViewAlphaForEditMode:a4];
  [(NTKTroutFaceView *)self _timeViewAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v15 = v14;
  id v16 = [(NTKTroutFaceView *)self timeView];
  [v16 setAlpha:v15];
}

- (void)_configureForEditMode:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NTKTroutFaceView;
  -[NTKTroutFaceView _configureForEditMode:](&v14, "_configureForEditMode:");
  [(NTKTroutFaceView *)self _contentAlphaForEditMode:a3];
  double v6 = v5;
  uint64_t v7 = [(NTKTroutFaceView *)self alaskanContentView];
  [v7 setAlpha:v6];

  [(NTKTroutFaceView *)self _complicationAlphaForEditMode:a3];
  double v9 = v8;
  id v10 = [(NTKTroutFaceView *)self complicationContainerView];
  [v10 setAlpha:v9];

  [(NTKTroutFaceView *)self _timeViewAlphaForEditMode:a3];
  double v12 = v11;
  id v13 = [(NTKTroutFaceView *)self timeView];
  [v13 setAlpha:v12];
}

- (void)createView
{
  if ([(NTKTroutFaceView *)self viewsLoaded])
  {
    unsigned __int8 v3 = [(NTKTroutFaceView *)self alaskanContentView];
    [v3 removeFromSuperview];

    id v4 = [NTKAlaskanDiverStyleView alloc];
    [(NTKTroutFaceView *)self contentViewFrame];
    double v5 = -[NTKAlaskanDiverStyleView initWithFrame:](v4, "initWithFrame:");
    [(NTKTroutFaceView *)self setAlaskanContentView:v5];

    double v6 = [(NTKTroutFaceView *)self createController];
    [(NTKTroutFaceView *)self setAlaskanContentController:v6];

    uint64_t v7 = [(NTKTroutFaceView *)self contentView];
    double v8 = [(NTKTroutFaceView *)self alaskanContentView];
    [v7 addSubview:v8];

    if (([(NTKTroutFaceView *)self editing] & 1) == 0)
    {
      double v9 = [(NTKTroutFaceView *)self delegate];
      id v10 = [(NTKTroutFaceView *)self alaskanContentController];
      objc_msgSend(v9, "faceViewWantsStatusBarHidden:animated:", objc_msgSend(v10, "wantsStatusBarHidden"), 0);
    }
    double v11 = [(NTKTroutFaceView *)self alaskanContentView];
    double v12 = [(NTKTroutFaceView *)self palette];
    [v11 setPalette:v12];
  }
  id v13 = [(NTKTroutFaceView *)self alaskanContentView];
  objc_super v14 = [v13 palette];
  [(NTKTroutFaceView *)self updateComplicationsColorWithPalette:v14];

  [(NTKTroutFaceView *)self updateTimeViewColor];
  id v15 = [(NTKTroutFaceView *)self alaskanContentController];
  [v15 applyVisibilityWithFraction:1.0];
}

- (void)updateTimeViewColor
{
  unsigned __int8 v3 = [(NTKTroutFaceView *)self palette];
  id v4 = [(NTKTroutFaceView *)self timeView];
  unint64_t v5 = [(NTKAlaskanDiverStyleView *)self->_alaskanContentView currentMode];
  switch(v5)
  {
    case 2uLL:
      id v10 = [v3 countUpClockHands];
      double v11 = [v4 hourHandView];
      [v11 setInlayColor:v10];

      double v12 = [v3 countUpClockHands];
      id v13 = [v4 minuteHandView];
      [v13 setInlayColor:v12];

      CGAffineTransformMakeScale(&v31, 0.9, 0.9);
      CGAffineTransform v30 = v31;
      [v4 setTransform:&v30];
      [(NTKTroutFaceView *)self setCurrentTimeViewScale:0.9];
      objc_super v14 = [v4 secondHandView];
      [v14 setAlpha:0.0];
LABEL_7:

      break;
    case 1uLL:
      id v15 = [v3 preCountUpClockHands];
      id v16 = [v4 hourHandView];
      [v16 setInlayColor:v15];

      objc_super v14 = [v3 preCountUpClockHands];
      objc_super v17 = [v4 minuteHandView];
      [v17 setInlayColor:v14];

      goto LABEL_7;
    case 0uLL:
      double v6 = [v3 clockHandsInlay];
      uint64_t v7 = [v4 hourHandView];
      [v7 setInlayColor:v6];

      double v8 = [v3 clockHandsInlay];
      double v9 = [v4 minuteHandView];
      [v9 setInlayColor:v8];

      [(NTKTroutFaceView *)self setCurrentTimeViewScale:1.0];
      break;
  }
  long long v18 = [v3 clockHands];
  long long v19 = [v4 hourHandView];
  [v19 setColor:v18];

  uint64_t v20 = [v3 clockHands];
  objc_super v21 = [v4 minuteHandView];
  [v21 setColor:v20];

  v22 = [v3 secondHand];
  v23 = [v4 secondHandView];
  [v23 setColor:v22];

  v24 = +[UIColor blackColor];
  v25 = [v4 hourHandView];
  [v25 setHandDotColor:v24];

  v26 = +[UIColor blackColor];
  v27 = [v4 minuteHandView];
  [v27 setHandDotColor:v26];

  v28 = +[UIColor blackColor];
  v29 = [v4 secondHandView];
  [v29 setHandDotColor:v28];
}

- (void)updateComplicationsColorWithPalette:(id)a3
{
  id v4 = [a3 cornerComplication];
  [(NTKTroutFaceView *)self updateRichCornerComplicationsInnerColor:v4 outerColor:0];
}

- (id)dateComplicationView
{
  v2 = [(NTKTroutFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotDate];
  unsigned __int8 v3 = [v2 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unint64_t v5 = [v2 display];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (double)_complicationAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if ((unint64_t)a3 < 2) {
    return 1.0;
  }
  return result;
}

- (double)_contentAlphaForEditMode:(int64_t)a3
{
  double result = 0.3;
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
  v19.receiver = self;
  v19.super_class = (Class)NTKTroutFaceView;
  [(NTKTroutFaceView *)&v19 _configureComplicationView:v6 forSlot:v7];
  if (([(NTKTroutFaceView *)self editing] & 1) == 0)
  {
    double v8 = [(NTKTroutFaceView *)self alaskanContentView];
    double v9 = [v8 delegate];
    [v9 alaskanDiverStyleViewDidCancelPreCountUpWithCompletionBlock:0 animated:1];
  }
  id v10 = (void *)qword_47A08;
  if (!qword_47A08)
  {
    v20[0] = NTKComplicationSlotTopLeft;
    v20[1] = NTKComplicationSlotTopRight;
    v20[2] = NTKComplicationSlotBottomLeft;
    v20[3] = NTKComplicationSlotBottomRight;
    double v11 = +[NSArray arrayWithObjects:v20 count:4];
    uint64_t v12 = +[NSSet setWithArray:v11];
    id v13 = (void *)qword_47A08;
    qword_47A08 = v12;

    id v10 = (void *)qword_47A08;
  }
  if ([v10 containsObject:v7])
  {
    id v14 = v6;
    id v15 = [(NTKTroutFaceView *)self palette];
    id v16 = [v15 cornerComplication];
    [(NTKTroutFaceView *)self setComplicationColor:v16];

    objc_super v17 = [v15 cornerComplication];
    [(NTKTroutFaceView *)self setInterpolatedComplicationColor:v17];

    long long v18 = [v15 cornerComplicationSecondary];
    [(NTKTroutFaceView *)self setAlternateComplicationColor:v18];

    [v14 updateMonochromeColor];
  }
}

- (id)utilityDateComplicationFontForDateStyle:(unint64_t)a3
{
  double v7 = 0.0;
  unsigned __int8 v3 = [(NTKTroutFaceView *)self device];
  sub_B5FC(v3, (uint64_t)&v6);

  double v4 = v7;

  return +[CLKFont compactSoftFontOfSize:v4 weight:UIFontWeightSemibold];
}

- (unint64_t)textLayoutStyleForSlot:(int64_t)a3
{
  return 0;
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)NTKTroutFaceView;
  -[NTKTroutFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v15, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4)
  {
    NTKScaleForBreathingFraction();
    double v8 = v7;
    memset(&v14, 0, sizeof(v14));
    CGAffineTransformMakeScale(&v14, v7, v7);
    memset(&v13, 0, sizeof(v13));
    CGAffineTransformMakeScale(&v13, v8 * self->_currentTimeViewScale, v8 * self->_currentTimeViewScale);
    double v9 = [(NTKTroutFaceView *)self contentView];
    CGAffineTransform v12 = v14;
    [v9 setTransform:&v12];

    id v10 = [(NTKTroutFaceView *)self timeView];
    CGAffineTransform v12 = v13;
    [v10 setTransform:&v12];

    double v11 = [(NTKTroutFaceView *)self complicationContainerView];
    CGAffineTransform v12 = v14;
    [v11 setTransform:&v12];
  }
}

- (NTKAlaskanDiverStyleView)alaskanContentView
{
  return self->_alaskanContentView;
}

- (void)setAlaskanContentView:(id)a3
{
}

- (NTKAlaskanDiverStyleController)alaskanContentController
{
  return self->_alaskanContentController;
}

- (void)setAlaskanContentController:(id)a3
{
}

- (NTKCrownInputHandler)crownInputHandler
{
  return self->_crownInputHandler;
}

- (void)setCrownInputHandler:(id)a3
{
}

- (NTKAlaskanPersistenceStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
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

- (double)currentTimeViewScale
{
  return self->_currentTimeViewScale;
}

- (void)setCurrentTimeViewScale:(double)a3
{
  self->_currentTimeViewScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_crownInputHandler, 0);
  objc_storeStrong((id *)&self->_alaskanContentController, 0);

  objc_storeStrong((id *)&self->_alaskanContentView, 0);
}

@end