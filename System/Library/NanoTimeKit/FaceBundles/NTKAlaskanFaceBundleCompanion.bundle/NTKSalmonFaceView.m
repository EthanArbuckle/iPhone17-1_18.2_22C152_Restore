@interface NTKSalmonFaceView
+ (int64_t)uiSensitivity;
- (BOOL)_handlePhysicalButton:(unint64_t)a3 event:(unint64_t)a4;
- (BOOL)_wheelChangedWithEvent:(id)a3;
- (BOOL)viewsLoaded;
- (NTKAlaskanGMTStyleController)alaskanContentController;
- (NTKAlaskanGMTStyleView)alaskanContentView;
- (NTKAlaskanPersistenceStorage)storage;
- (NTKCrownInputHandler)crownInputHandler;
- (NTKSalmonFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_complicationAlphaForEditMode:(int64_t)a3;
- (double)_contentAlphaForEditMode:(int64_t)a3;
- (double)_timeViewAlphaForEditMode:(int64_t)a3;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
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
- (void)setCrownInputHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setStorage:(id)a3;
- (void)setViewsLoaded:(BOOL)a3;
- (void)updateTimeViewColor;
@end

@implementation NTKSalmonFaceView

- (NTKSalmonFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)NTKSalmonFaceView;
  v9 = [(NTKSalmonFaceView *)&v21 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  v10 = v9;
  if (v9)
  {
    uint64_t v20 = 0;
    long long v18 = 0u;
    long long v19 = 0u;
    v11 = [(NTKSalmonFaceView *)v9 device];
    sub_6CDC(v11, (uint64_t)&v18);

    id v12 = objc_alloc_init((Class)NTKCompositeComplicationFactory);
    id v13 = objc_alloc((Class)NTKWhistlerAnalogFaceViewComplicationFactory);
    id v14 = [v13 initWithFaceView:v10 dialDiameter:v8 device:*(double *)&v18];
    [v14 setUsesNarrowTopSlots:1];
    [(NTKSalmonFaceView *)v10 setComplicationFactory:v14];
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
    [(NTKSalmonFaceView *)v10 setComplicationFactory:v12];
  }
  return v10;
}

- (id)createFaceColorPalette
{
  v2 = objc_alloc_init(NTKAlaskanGMTColorPalette);

  return v2;
}

- (id)palette
{
  return [(NTKSalmonFaceView *)self faceColorPalette];
}

- (void)setDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKSalmonFaceView;
  id v4 = a3;
  [(NTKSalmonFaceView *)&v5 setDelegate:v4];
  -[NTKAlaskanPersistenceStorage setDelegate:](self->_storage, "setDelegate:", v4, v5.receiver, v5.super_class);
}

+ (int64_t)uiSensitivity
{
  return 0;
}

- (void)_applyDataMode
{
  id v3 = [(NTKSalmonFaceView *)self alaskanContentController];
  objc_msgSend(v3, "setDatamode:", -[NTKSalmonFaceView dataMode](self, "dataMode"));
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NTKSalmonFaceView;
  [(NTKSalmonFaceView *)&v8 setOverrideDate:v6 duration:a4];
  if (!v6)
  {
    id v6 = [(NTKSalmonFaceView *)self currentDisplayDate];
  }
  v7 = [(NTKSalmonFaceView *)self alaskanContentController];
  [v7 setOverrideDate:v6 duration:a4];
}

- (void)_prepareForSnapshotting
{
  v3.receiver = self;
  v3.super_class = (Class)NTKSalmonFaceView;
  [(NTKSalmonFaceView *)&v3 _prepareForSnapshotting];
  [(NTKSalmonFaceView *)self setStorage:0];
}

- (BOOL)_wheelChangedWithEvent:(id)a3
{
  id v4 = a3;
  if (NTKStarbearEnabled())
  {
    objc_super v5 = [(NTKSalmonFaceView *)self alaskanContentView];
    unsigned __int8 v6 = [v5 isEditing];
  }
  else
  {
    objc_super v5 = [(NTKSalmonFaceView *)self crownInputHandler];
    unsigned __int8 v6 = [v5 _wheelChangedWithEvent:v4];
  }
  BOOL v7 = v6;

  return v7;
}

- (BOOL)_handlePhysicalButton:(unint64_t)a3 event:(unint64_t)a4
{
  unsigned __int8 v6 = [(NTKSalmonFaceView *)self crownInputHandler];
  LOBYTE(a4) = [v6 _handlePhysicalButton:a3 event:a4];

  return a4;
}

- (void)_loadSnapshotContentViews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKSalmonFaceView;
  [(NTKSalmonFaceView *)&v5 _loadSnapshotContentViews];
  objc_super v3 = (NTKCrownInputHandler *)objc_alloc_init((Class)NTKCrownInputHandler);
  crownInputHandler = self->_crownInputHandler;
  self->_crownInputHandler = v3;

  [(NTKSalmonFaceView *)self _setupViews];
}

- (void)_unloadSnapshotContentViews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKSalmonFaceView;
  [(NTKSalmonFaceView *)&v4 _unloadSnapshotContentViews];
  [(NTKSalmonFaceView *)self _removeViews];
  crownInputHandler = self->_crownInputHandler;
  self->_crownInputHandler = 0;
}

- (void)_setupViews
{
  objc_super v3 = objc_alloc_init(NTKAlaskanPersistenceStorage);
  storage = self->_storage;
  self->_storage = v3;

  objc_super v5 = [(NTKSalmonFaceView *)self delegate];
  [(NTKAlaskanPersistenceStorage *)self->_storage setDelegate:v5];

  self->_viewsLoaded = 1;

  [(NTKSalmonFaceView *)self createView];
}

- (void)_removeViews
{
  [(NTKAlaskanGMTStyleView *)self->_alaskanContentView removeFromSuperview];
  self->_viewsLoaded = 0;
  alaskanContentView = self->_alaskanContentView;
  self->_alaskanContentView = 0;

  alaskanContentController = self->_alaskanContentController;
  self->_alaskanContentController = 0;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKSalmonFaceView;
  [(NTKSalmonFaceView *)&v4 layoutSubviews];
  alaskanContentView = self->_alaskanContentView;
  [(NTKSalmonFaceView *)self contentViewFrame];
  -[NTKAlaskanGMTStyleView ntk_setBoundsAndPositionFromFrame:](alaskanContentView, "ntk_setBoundsAndPositionFromFrame:");
}

- (id)createController
{
  objc_super v3 = [NTKAlaskanGMTStyleController alloc];
  objc_super v4 = [(NTKSalmonFaceView *)self alaskanContentView];
  objc_super v5 = [(NTKSalmonFaceView *)self crownInputHandler];
  unsigned __int8 v6 = [(NTKSalmonFaceView *)self storage];
  BOOL v7 = [(NTKAlaskanGMTStyleController *)v3 initWithContentView:v4 crownInputHandler:v5 storage:v6];

  [(NTKAlaskanGMTStyleController *)v7 setFaceView:self];
  [(NTKAlaskanGMTStyleController *)v7 setDatamode:[(NTKSalmonFaceView *)self dataMode]];

  return v7;
}

- (void)_prepareForEditing
{
  v4.receiver = self;
  v4.super_class = (Class)NTKSalmonFaceView;
  [(NTKSalmonFaceView *)&v4 _prepareForEditing];
  objc_super v3 = [(NTKSalmonFaceView *)self alaskanContentController];
  [v3 setStorage:0];
}

- (void)_cleanupAfterEditing
{
  v5.receiver = self;
  v5.super_class = (Class)NTKSalmonFaceView;
  [(NTKSalmonFaceView *)&v5 _cleanupAfterEditing];
  objc_super v3 = [(NTKSalmonFaceView *)self storage];
  objc_super v4 = [(NTKSalmonFaceView *)self alaskanContentController];
  [v4 setStorage:v3];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (([(NTKSalmonFaceView *)self editing] & 1) == 0)
  {
    BOOL v7 = [(NTKSalmonFaceView *)self alaskanContentView];
    [v7 setIsEditing:0];
  }
  if (a4 == 10)
  {
    objc_super v8 = [(NTKSalmonFaceView *)self alaskanContentView];
    v9 = [(NTKSalmonFaceView *)self palette];
    [v8 setPalette:v9];

    [(NTKSalmonFaceView *)self updateTimeViewColor];
    v10 = [(NTKSalmonFaceView *)self palette];
    v11 = [v10 dateComplicationColor];
    id v12 = [(NTKSalmonFaceView *)self dateComplicationView];
    [v12 setForegroundColor:v11];

    id v16 = [(NTKSalmonFaceView *)self palette];
    id v13 = [v16 cornerComplicationInnerTextColor];
    id v14 = [(NTKSalmonFaceView *)self palette];
    v15 = [v14 cornerComplicationOuterTextColor];
    [(NTKSalmonFaceView *)self updateRichCornerComplicationsInnerColor:v13 outerColor:v15];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  if (a6 == 10)
  {
    v9 = [(NTKSalmonFaceView *)self interpolatedColorPalette];
    v10 = [v9 dateComplicationColor];
    v11 = [(NTKSalmonFaceView *)self dateComplicationView];
    [v11 setForegroundColor:v10];

    id v12 = [(NTKSalmonFaceView *)self alaskanContentView];
    id v13 = [(NTKSalmonFaceView *)self interpolatedColorPalette];
    [v12 setPalette:v13];

    [(NTKSalmonFaceView *)self updateTimeViewColor];
    id v17 = [(NTKSalmonFaceView *)self interpolatedColorPalette];
    id v14 = [v17 cornerComplicationInnerTextColor];
    v15 = [(NTKSalmonFaceView *)self interpolatedColorPalette];
    id v16 = [v15 cornerComplicationOuterTextColor];
    [(NTKSalmonFaceView *)self updateRichCornerComplicationsInnerColor:v14 outerColor:v16];
  }
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v18.receiver = self;
  v18.super_class = (Class)NTKSalmonFaceView;
  -[NTKSalmonFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v18, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  [(NTKSalmonFaceView *)self _contentAlphaForEditMode:a4];
  [(NTKSalmonFaceView *)self _contentAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v9 = v8;
  v10 = [(NTKSalmonFaceView *)self alaskanContentView];
  [v10 setAlpha:v9];

  [(NTKSalmonFaceView *)self _timeViewAlphaForEditMode:a4];
  [(NTKSalmonFaceView *)self _timeViewAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v12 = v11;
  id v13 = [(NTKSalmonFaceView *)self timeView];
  [v13 setAlpha:v12];

  id v14 = [(NTKSalmonFaceView *)self alaskanContentView];
  [v14 setEditingAlpha:v12];

  [(NTKSalmonFaceView *)self _complicationAlphaForEditMode:a4];
  [(NTKSalmonFaceView *)self _complicationAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v16 = v15;
  id v17 = [(NTKSalmonFaceView *)self complicationContainerView];
  [v17 setAlpha:v16];
}

- (void)_configureForEditMode:(int64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)NTKSalmonFaceView;
  -[NTKSalmonFaceView _configureForEditMode:](&v15, "_configureForEditMode:");
  [(NTKSalmonFaceView *)self _contentAlphaForEditMode:a3];
  double v6 = v5;
  uint64_t v7 = [(NTKSalmonFaceView *)self alaskanContentView];
  [v7 setAlpha:v6];

  [(NTKSalmonFaceView *)self _timeViewAlphaForEditMode:a3];
  double v9 = v8;
  v10 = [(NTKSalmonFaceView *)self timeView];
  [v10 setAlpha:v9];

  double v11 = [(NTKSalmonFaceView *)self alaskanContentView];
  [v11 setEditingAlpha:v9];

  [(NTKSalmonFaceView *)self _complicationAlphaForEditMode:a3];
  double v13 = v12;
  id v14 = [(NTKSalmonFaceView *)self complicationContainerView];
  [v14 setAlpha:v13];
}

- (void)createView
{
  if ([(NTKSalmonFaceView *)self viewsLoaded])
  {
    objc_super v3 = [(NTKSalmonFaceView *)self alaskanContentView];
    [v3 removeFromSuperview];

    objc_super v4 = [NTKAlaskanGMTStyleView alloc];
    [(NTKSalmonFaceView *)self contentViewFrame];
    double v5 = -[NTKAlaskanGMTStyleView initWithFrame:](v4, "initWithFrame:");
    [(NTKSalmonFaceView *)self setAlaskanContentView:v5];

    double v6 = [(NTKSalmonFaceView *)self createController];
    [(NTKSalmonFaceView *)self setAlaskanContentController:v6];

    uint64_t v7 = [(NTKSalmonFaceView *)self contentView];
    double v8 = [(NTKSalmonFaceView *)self alaskanContentView];
    [v7 addSubview:v8];

    double v9 = [(NTKSalmonFaceView *)self alaskanContentView];
    v10 = [(NTKSalmonFaceView *)self palette];
    [v9 setPalette:v10];
  }
  double v11 = [(NTKSalmonFaceView *)self palette];
  double v12 = [v11 dateComplicationColor];
  double v13 = [(NTKSalmonFaceView *)self dateComplicationView];
  [v13 setForegroundColor:v12];

  [(NTKSalmonFaceView *)self updateTimeViewColor];
  id v14 = [(NTKSalmonFaceView *)self alaskanContentController];
  [v14 applyVisibilityWithFraction:1.0];
}

- (void)updateTimeViewColor
{
  id v20 = [(NTKSalmonFaceView *)self palette];
  objc_super v3 = [(NTKSalmonFaceView *)self timeView];
  objc_super v4 = [v20 hourHandColor];
  double v5 = [v3 hourHandView];
  [v5 setColor:v4];

  double v6 = [v20 hourHandColor];
  uint64_t v7 = [v3 minuteHandView];
  [v7 setColor:v6];

  double v8 = [v20 hourHandInlayColor];
  double v9 = [v3 hourHandView];
  [v9 setInlayColor:v8];

  v10 = [v20 hourHandInlayColor];
  double v11 = [v3 minuteHandView];
  [v11 setInlayColor:v10];

  double v12 = [v20 secondHandColor];
  double v13 = [v3 secondHandView];
  [v13 setColor:v12];

  id v14 = +[UIColor blackColor];
  objc_super v15 = [v3 hourHandView];
  [v15 setHandDotColor:v14];

  double v16 = +[UIColor blackColor];
  id v17 = [v3 minuteHandView];
  [v17 setHandDotColor:v16];

  objc_super v18 = +[UIColor blackColor];
  long long v19 = [v3 secondHandView];
  [v19 setHandDotColor:v18];
}

- (id)dateComplicationView
{
  v2 = [(NTKSalmonFaceView *)self normalComplicationDisplayWrapperForSlot:NTKComplicationSlotDate];
  objc_super v3 = [v2 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v5 = [v2 display];
  }
  else
  {
    double v5 = 0;
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

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)NTKSalmonFaceView;
  id v8 = a5;
  id v9 = [(NTKSalmonFaceView *)&v14 _newLegacyViewForComplication:a3 family:a4 slot:v8];
  LODWORD(a3) = objc_msgSend(v8, "isEqualToString:", NTKComplicationSlotDate, v14.receiver, v14.super_class);

  if (a3)
  {
    id v10 = v9;
    double v11 = [(NTKSalmonFaceView *)self palette];
    double v12 = [v11 dateComplicationColor];
    [v10 setForegroundColor:v12];
  }
  return v9;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)NTKSalmonFaceView;
  [(NTKSalmonFaceView *)&v19 _configureComplicationView:v6 forSlot:v7];
  if (([(NTKSalmonFaceView *)self editing] & 1) == 0)
  {
    id v8 = [(NTKSalmonFaceView *)self alaskanContentView];
    [v8 setIsEditing:0];
  }
  id v9 = (void *)qword_479B0;
  if (!qword_479B0)
  {
    v20[0] = NTKComplicationSlotTopLeft;
    v20[1] = NTKComplicationSlotTopRight;
    v20[2] = NTKComplicationSlotBottomLeft;
    v20[3] = NTKComplicationSlotBottomRight;
    id v10 = +[NSArray arrayWithObjects:v20 count:4];
    uint64_t v11 = +[NSSet setWithArray:v10];
    double v12 = (void *)qword_479B0;
    qword_479B0 = v11;

    id v9 = (void *)qword_479B0;
  }
  if ([v9 containsObject:v7])
  {
    id v13 = v6;
    objc_super v14 = [(NTKSalmonFaceView *)self palette];
    objc_super v15 = [v14 cornerComplicationInnerTextColor];
    [(NTKSalmonFaceView *)self setComplicationColor:v15];

    double v16 = [(NTKSalmonFaceView *)self complicationColor];
    [(NTKSalmonFaceView *)self setInterpolatedComplicationColor:v16];

    id v17 = [(NTKSalmonFaceView *)self palette];
    objc_super v18 = [v17 cornerComplicationOuterTextColor];
    [(NTKSalmonFaceView *)self setAlternateComplicationColor:v18];

    [v13 updateMonochromeColor];
  }
}

- (id)utilityDateComplicationFontForDateStyle:(unint64_t)a3
{
  double v7 = 0.0;
  objc_super v3 = [(NTKSalmonFaceView *)self device];
  sub_6CDC(v3, (uint64_t)&v6);

  double v4 = v7;

  return +[CLKFont compactSoftFontOfSize:v4 weight:UIFontWeightSemibold];
}

- (unint64_t)textLayoutStyleForSlot:(int64_t)a3
{
  return 0;
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)NTKSalmonFaceView;
  -[NTKSalmonFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v13, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4)
  {
    NTKScaleForBreathingFraction();
    memset(&v12, 0, sizeof(v12));
    CGAffineTransformMakeScale(&v12, v7, v7);
    id v8 = [(NTKSalmonFaceView *)self contentView];
    CGAffineTransform v11 = v12;
    [v8 setTransform:&v11];

    id v9 = [(NTKSalmonFaceView *)self timeView];
    CGAffineTransform v11 = v12;
    [v9 setTransform:&v11];

    id v10 = [(NTKSalmonFaceView *)self complicationContainerView];
    CGAffineTransform v11 = v12;
    [v10 setTransform:&v11];
  }
}

- (NTKAlaskanGMTStyleView)alaskanContentView
{
  return self->_alaskanContentView;
}

- (void)setAlaskanContentView:(id)a3
{
}

- (NTKAlaskanGMTStyleController)alaskanContentController
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_crownInputHandler, 0);
  objc_storeStrong((id *)&self->_alaskanContentController, 0);

  objc_storeStrong((id *)&self->_alaskanContentView, 0);
}

@end