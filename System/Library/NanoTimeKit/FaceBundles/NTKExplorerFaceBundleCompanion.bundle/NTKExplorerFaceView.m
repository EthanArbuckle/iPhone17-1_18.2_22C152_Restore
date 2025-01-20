@interface NTKExplorerFaceView
+ (Class)_timeViewClass;
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3;
- (CGPoint)_contentCenterOffset;
- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (NTKColorCircularUtilitarianFaceViewComplicationFactory)faceViewComplicationFactory;
- (NTKExplorerFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_complicationAlphaForEditMode:(int64_t)a3;
- (double)_contentAlphaForEditMode:(int64_t)a3;
- (double)_handAlphaForEditMode:(int64_t)a3;
- (double)_verticalPaddingForStatusBar;
- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_newComplicationFactoryForDevice:(id)a3;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)createFaceColorPalette;
- (id)palette;
- (int64_t)_keylineStyleForComplicationSlot:(id)a3;
- (unint64_t)_keylineLabelAlignmentForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (unint64_t)_layoutStyleForSlot:(id)a3;
- (unint64_t)density;
- (unint64_t)textLayoutStyleForSlot:(id)a3;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyDensity:(unint64_t)a3;
- (void)_applyFullSignalStrengthForSnapshot;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyShowsCanonicalContent;
- (void)_applyTransitionFraction:(double)a3 fromDensity:(unint64_t)a4 toOption:(unint64_t)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterEditing;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_configureTimeView:(id)a3;
- (void)_curvedComplicationCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_prepareForSnapshotting;
- (void)_unloadSnapshotContentViews;
- (void)_updateColorsWithPalette:(id)a3;
- (void)setDensity:(unint64_t)a3;
- (void)setSignalStrengthBars:(int64_t)a3;
@end

@implementation NTKExplorerFaceView

- (id)_newComplicationFactoryForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NTKColorCircularUtilitarianFaceViewComplicationFactory) initForDevice:v3];

  return v4;
}

- (NTKExplorerFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKExplorerFaceView;
  v9 = [(NTKExplorerFaceView *)&v14 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  v10 = v9;
  if (v9)
  {
    v11 = [(NTKExplorerFaceView *)v9 _newComplicationFactoryForDevice:v8];
    faceViewComplicationFactory = v10->_faceViewComplicationFactory;
    v10->_faceViewComplicationFactory = v11;

    [(NTKColorCircularUtilitarianFaceViewComplicationFactory *)v10->_faceViewComplicationFactory setFaceView:v10];
    [(NTKColorCircularUtilitarianFaceViewComplicationFactory *)v10->_faceViewComplicationFactory setDelegate:v10];
    [(NTKExplorerFaceView *)v10 setComplicationFactory:v10->_faceViewComplicationFactory];
    [(NTKExplorerFaceView *)v10 setDensity:3];
  }

  return v10;
}

- (id)createFaceColorPalette
{
  v2 = objc_alloc_init(NTKExplorerColorPalette);

  return v2;
}

- (id)palette
{
  return [(NTKExplorerFaceView *)self faceColorPalette];
}

- (void)_loadSnapshotContentViews
{
  v22.receiver = self;
  v22.super_class = (Class)NTKExplorerFaceView;
  [(NTKExplorerFaceView *)&v22 _loadSnapshotContentViews];
  id v3 = [(NTKExplorerFaceView *)self contentView];
  id v4 = [(NTKExplorerFaceView *)self device];
  +[NTKAnalogUtilities dialSizeForDevice:v4];

  v5 = [NTKExplorerDialView alloc];
  [(NTKExplorerFaceView *)self bounds];
  v6 = [(NTKExplorerFaceView *)self device];
  CLKSizeCenteredInRectForDevice();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(NTKExplorerFaceView *)self device];
  v16 = -[NTKExplorerDialView initWithFrame:forDevice:](v5, "initWithFrame:forDevice:", v15, v8, v10, v12, v14);
  dialView = self->_dialView;
  self->_dialView = v16;

  [v3 addSubview:self->_dialView];
  id v18 = objc_alloc((Class)NTKExplorerStatusView);
  [(NTKExplorerFaceView *)self bounds];
  v19 = (NTKExplorerStatusView *)objc_msgSend(v18, "initWithFrame:");
  statusView = self->_statusView;
  self->_statusView = v19;

  [(NTKExplorerStatusView *)self->_statusView sizeToFit];
  [v3 addSubview:self->_statusView];
  [(NTKExplorerFaceView *)self _applyDensity:self->_density];
  v21 = [(NTKExplorerFaceView *)self palette];
  [(NTKExplorerFaceView *)self _applyColorPalette:v21];
}

- (void)_prepareForSnapshotting
{
  v5.receiver = self;
  v5.super_class = (Class)NTKExplorerFaceView;
  [(NTKExplorerFaceView *)&v5 _prepareForSnapshotting];
  id v3 = [(NTKExplorerFaceView *)self device];
  unsigned int v4 = [v3 isExplorer];

  if (v4) {
    [(NTKExplorerFaceView *)self _applyFullSignalStrengthForSnapshot];
  }
}

- (void)_unloadSnapshotContentViews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKExplorerFaceView;
  [(NTKExplorerFaceView *)&v5 _unloadSnapshotContentViews];
  [(NTKExplorerDialView *)self->_dialView removeFromSuperview];
  dialView = self->_dialView;
  self->_dialView = 0;

  [(NTKExplorerStatusView *)self->_statusView removeFromSuperview];
  statusView = self->_statusView;
  self->_statusView = 0;
}

- (void)_applyShowsCanonicalContent
{
  v5.receiver = self;
  v5.super_class = (Class)NTKExplorerFaceView;
  [(NTKExplorerFaceView *)&v5 _applyShowsCanonicalContent];
  if ([(NTKExplorerFaceView *)self showsCanonicalContent])
  {
    id v3 = [(NTKExplorerFaceView *)self device];
    unsigned int v4 = [v3 isExplorer];

    if (v4) {
      [(NTKExplorerFaceView *)self _applyFullSignalStrengthForSnapshot];
    }
  }
}

- (void)_applyFullSignalStrengthForSnapshot
{
  [(NTKExplorerStatusView *)self->_statusView setHidden:0];
  [(NTKExplorerStatusView *)self->_statusView setState:1];
  statusView = self->_statusView;

  [(NTKExplorerStatusView *)statusView setShowsFullSignalStrength:1];
}

+ (Class)_timeViewClass
{
  return (Class)objc_opt_class();
}

- (void)_configureTimeView:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NTKExplorerFaceView;
  id v4 = a3;
  [(NTKExplorerFaceView *)&v10 _configureTimeView:v4];
  [(NTKExplorerFaceView *)self bounds];
  double v6 = v5 * 0.5;
  unint64_t density = self->_density;
  double v8 = [(NTKExplorerFaceView *)self device];
  objc_msgSend(v4, "setSecondHandCenter:", v6, _subdialYPositionForDensity(density, v8));

  double v9 = [(NTKExplorerFaceView *)self palette];
  [(NTKExplorerFaceView *)self _applyColorPalette:v9];
}

- (unint64_t)textLayoutStyleForSlot:(id)a3
{
  return (unint64_t)[(NTKExplorerFaceView *)self layoutStyleForSlot:a3];
}

- (unint64_t)_layoutStyleForSlot:(id)a3
{
  id v4 = a3;
  double v5 = [(NTKExplorerFaceView *)self device];
  if ([v5 deviceCategory] == (char *)&dword_0 + 1)
  {

LABEL_5:
    unint64_t v7 = 0;
    goto LABEL_6;
  }
  unsigned __int8 v6 = [v4 isEqualToString:NTKComplicationSlotBottomCenter];

  if ((v6 & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v7 = 1;
LABEL_6:

  return v7;
}

- (void)_curvedComplicationCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8
{
  id v14 = a8;
  if ((char *)[(NTKExplorerFaceView *)self _layoutStyleForSlot:"_layoutStyleForSlot:"] == (char *)&dword_0 + 1) {
    [(NTKColorCircularUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory curvedCircleRadius:a3 centerAngle:a4 maxAngularWidth:a5 circleCenter:a6 interior:a7 forSlot:v14];
  }
}

- (CGPoint)_contentCenterOffset
{
  id v3 = [(NTKExplorerFaceView *)self delegate];
  unsigned __int8 v4 = [v3 faceViewComplicationIsEmptyForSlot:NTKComplicationSlotBottomCenter];

  double v5 = [(NTKExplorerFaceView *)self device];
  unsigned __int8 v6 = v5;
  if (v4)
  {
    sub_4620(v5, v15);
    double v7 = v16;
    double v8 = (double *)&v17;
  }
  else
  {
    sub_4620(v5, &v12);
    double v7 = v13;
    double v8 = (double *)&v14;
  }
  double v9 = *v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (double)_verticalPaddingForStatusBar
{
  v2 = [(NTKExplorerFaceView *)self device];
  sub_4620(v2, v5);
  double v3 = v6;

  return v3;
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  id v4 = a3;
  double v5 = [(NTKExplorerFaceView *)self device];
  if ([v5 deviceCategory] == (char *)&dword_0 + 1)
  {

LABEL_7:
    int64_t v7 = 0;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:NTKComplicationSlotTopLeft])
  {
  }
  else
  {
    unsigned __int8 v6 = [v4 isEqualToString:NTKComplicationSlotTopRight];

    if ((v6 & 1) == 0) {
      goto LABEL_7;
    }
  }
  int64_t v7 = 1;
LABEL_8:

  return v7;
}

- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  [(NTKExplorerFaceView *)self _faceEditingScaleForEditMode:a3 slot:a4];
  double v5 = [(NTKExplorerFaceView *)self device];
  sub_4620(v5, v8);
  unsigned __int8 v6 = NTKKeylineViewWithCircle();

  return v6;
}

- (unint64_t)_keylineLabelAlignmentForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0xA) {
    return 148;
  }
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  v7.receiver = self;
  v7.super_class = (Class)NTKExplorerFaceView;
  return -[NTKExplorerFaceView _keylineLabelAlignmentForCustomEditMode:slot:](&v7, "_keylineLabelAlignmentForCustomEditMode:slot:");
}

- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3
{
  return a3 == 10;
}

- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  [(NTKExplorerFaceView *)self bounds];
  CLKRectGetCenter();
  [(NTKExplorerFaceView *)self _contentCenterOffset];
  uint64_t v5 = [(NTKExplorerFaceView *)self device];
  sub_4620(v5, &v19);
  unsigned __int8 v6 = [(NTKExplorerFaceView *)self device];
  CLKRectCenteredAboutPointForDevice();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)_prepareForEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKExplorerFaceView;
  [(NTKExplorerFaceView *)&v3 _prepareForEditing];
  [(NTKExplorerDialView *)self->_dialView prepareForEditing];
}

- (void)_cleanupAfterEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKExplorerFaceView;
  [(NTKExplorerFaceView *)&v3 _cleanupAfterEditing];
  [(NTKExplorerDialView *)self->_dialView cleanupAfterEditing];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  if (a4 == 10)
  {
    double v9 = [(NTKExplorerFaceView *)self palette];
    [(NTKExplorerFaceView *)self _applyColorPalette:v9];
  }
  else if (a4 == 11)
  {
    -[NTKExplorerFaceView setDensity:](self, "setDensity:", [v10 density]);
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v15 = a4;
  id v12 = a5;
  id v13 = a7;
  if (a6 == 10)
  {
    double v14 = [(NTKExplorerFaceView *)self interpolatedColorPalette];
    [(NTKExplorerFaceView *)self _updateColorsWithPalette:v14];
  }
  else if (a6 == 11)
  {
    -[NTKExplorerFaceView _applyTransitionFraction:fromDensity:toOption:](self, "_applyTransitionFraction:fromDensity:toOption:", [v15 density], objc_msgSend(v12, "density"), a3);
  }
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  id v8 = [(NTKExplorerFaceView *)self timeView];
  [(NTKExplorerFaceView *)self _handAlphaForEditMode:a4];
  [(NTKExplorerFaceView *)self _handAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v8, "setAlpha:");

  statusView = self->_statusView;
  id v10 = [(NTKExplorerFaceView *)self timeView];
  [v10 alpha];
  -[NTKExplorerStatusView setAlpha:](statusView, "setAlpha:");

  double v11 = [(NTKExplorerFaceView *)self contentView];
  [(NTKExplorerFaceView *)self _contentAlphaForEditMode:a4];
  [(NTKExplorerFaceView *)self _contentAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v11, "setAlpha:");

  id v12 = [(NTKExplorerFaceView *)self complicationContainerView];
  [(NTKExplorerFaceView *)self _complicationAlphaForEditMode:a4];
  [(NTKExplorerFaceView *)self _complicationAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v12, "setAlpha:");
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v17.receiver = self;
  v17.super_class = (Class)NTKExplorerFaceView;
  -[NTKExplorerFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v17, "_applyRubberBandingFraction:forCustomEditMode:slot:", a4, a5);
  if ((unint64_t)a4 >= 2)
  {
    NTKScaleForRubberBandingFraction();
    CGFloat v8 = v7;
    NTKAlphaForRubberBandingFraction();
    double v10 = v9;
    memset(&v16, 0, sizeof(v16));
    CGAffineTransformMakeScale(&v16, v8, v8);
    double v11 = [(NTKExplorerFaceView *)self contentView];
    CGAffineTransform v15 = v16;
    [v11 setTransform:&v15];

    id v12 = [(NTKExplorerFaceView *)self timeView];
    CGAffineTransform v15 = v16;
    [v12 setTransform:&v15];

    id v13 = [(NTKExplorerFaceView *)self contentView];
    [(NTKExplorerFaceView *)self _contentAlphaForEditMode:a4];
    [v13 setAlpha:v10 * v14];
  }
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)NTKExplorerFaceView;
  -[NTKExplorerFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v12, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if ((unint64_t)a4 >= 2)
  {
    NTKLargeElementScaleForBreathingFraction();
    memset(&v11, 0, sizeof(v11));
    CGAffineTransformMakeScale(&v11, v7, v7);
    CGFloat v8 = [(NTKExplorerFaceView *)self contentView];
    CGAffineTransform v10 = v11;
    [v8 setTransform:&v10];

    double v9 = [(NTKExplorerFaceView *)self timeView];
    CGAffineTransform v10 = v11;
    [v9 setTransform:&v10];
  }
}

- (void)setDensity:(unint64_t)a3
{
  if (self->_density != a3)
  {
    self->_unint64_t density = a3;
    -[NTKExplorerFaceView _applyDensity:](self, "_applyDensity:");
  }
}

- (void)_applyDensity:(unint64_t)a3
{
  [(NTKExplorerDialView *)self->_dialView frame];
  double MidX = CGRectGetMidX(v21);
  unint64_t density = self->_density;
  unsigned __int8 v6 = [(NTKExplorerFaceView *)self device];
  double v7 = _subdialYPositionForDensity(density, v6);

  CGFloat v8 = [(NTKExplorerFaceView *)self timeView];
  objc_msgSend(v8, "setSecondHandCenter:", MidX, v7);

  statusView = self->_statusView;
  [(NTKExplorerFaceView *)self bounds];
  double v11 = v10 * 0.5;
  unint64_t v12 = self->_density;
  id v13 = [(NTKExplorerFaceView *)self device];
  -[NTKExplorerStatusView setCenter:](statusView, "setCenter:", v11, _statusViewYPositionForDensity(v12, v13));

  double v14 = [(NTKExplorerDialView *)self->_dialView subdialLayer];
  [(NTKExplorerDialView *)self->_dialView bounds];
  double v16 = v15 * 0.5;
  [(NTKExplorerDialView *)self->_dialView frame];
  objc_msgSend(v14, "setPosition:", v16, v7 - v17);

  dialView = self->_dialView;
  unint64_t v19 = self->_density;

  [(NTKExplorerDialView *)dialView setDensity:v19];
}

- (void)_applyTransitionFraction:(double)a3 fromDensity:(unint64_t)a4 toOption:(unint64_t)a5
{
  -[NTKExplorerDialView applyTransitionFraction:fromDensity:toDensity:](self->_dialView, "applyTransitionFraction:fromDensity:toDensity:");
  [(NTKExplorerDialView *)self->_dialView frame];
  double MidX = CGRectGetMidX(v25);
  double v9 = [(NTKExplorerFaceView *)self device];
  _subdialYPositionForDensity(a4, v9);
  double v10 = [(NTKExplorerFaceView *)self device];
  _subdialYPositionForDensity(a5, v10);
  CLKInterpolateBetweenFloatsClipped();
  double v12 = v11;

  id v13 = [(NTKExplorerFaceView *)self timeView];
  objc_msgSend(v13, "setSecondHandCenter:", MidX, v12);

  statusView = self->_statusView;
  [(NTKExplorerFaceView *)self bounds];
  double v16 = v15 * 0.5;
  double v17 = [(NTKExplorerFaceView *)self device];
  _statusViewYPositionForDensity(a4, v17);
  double v18 = [(NTKExplorerFaceView *)self device];
  _statusViewYPositionForDensity(a5, v18);
  CLKInterpolateBetweenFloatsClipped();
  -[NTKExplorerStatusView setCenter:](statusView, "setCenter:", v16, v19);

  id v23 = [(NTKExplorerDialView *)self->_dialView subdialLayer];
  [(NTKExplorerDialView *)self->_dialView bounds];
  double v21 = v20 * 0.5;
  [(NTKExplorerDialView *)self->_dialView frame];
  objc_msgSend(v23, "setPosition:", v21, v12 - v22);
}

- (void)_updateColorsWithPalette:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NTKExplorerFaceView *)self timeView];
  [v5 applyColorPalette:v4];

  faceViewComplicationFactory = self->_faceViewComplicationFactory;
  double v7 = [v4 complication];
  [(NTKColorCircularUtilitarianFaceViewComplicationFactory *)faceViewComplicationFactory setForegroundColor:v7 faceView:self];

  CGFloat v8 = self->_faceViewComplicationFactory;
  id v9 = [v4 complicationPlatter];

  [(NTKColorCircularUtilitarianFaceViewComplicationFactory *)v8 setPlatterColor:v9 faceView:self];
}

- (double)_handAlphaForEditMode:(int64_t)a3
{
  if (a3) {
    BOOL v3 = a3 == 10;
  }
  else {
    BOOL v3 = 1;
  }
  double result = NTKEditModeDimmedAlpha;
  if (v3) {
    return 1.0;
  }
  return result;
}

- (double)_contentAlphaForEditMode:(int64_t)a3
{
  BOOL v3 = a3 == 10 || a3 == 1;
  double result = NTKEditModeDimmedAlpha;
  if (!v3) {
    return 1.0;
  }
  return result;
}

- (double)_complicationAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if ((unint64_t)a3 < 2) {
    return 1.0;
  }
  return result;
}

- (void)setSignalStrengthBars:(int64_t)a3
{
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 11) {
    return &off_11008;
  }
  else {
    return 0;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = v8;
  if (a4 == 11)
  {
    id v10 = v8;
    double v11 = [a5 objectForKeyedSubscript:&off_10C60];
    if (!qword_163B0)
    {
      uint64_t v12 = objc_opt_new();
      id v13 = (void *)qword_163B0;
      qword_163B0 = v12;
    }
    double v14 = +[NSString stringWithFormat:@"%@-%@", v10, v11];
    double v15 = [(id)qword_163B0 objectForKey:v14];
    if (!v15)
    {
      v56 = v14;
      switch((unint64_t)[v10 density])
      {
        case 0uLL:
          int v16 = 0;
          CFStringRef v17 = @"1";
          break;
        case 1uLL:
          int v16 = 0;
          CFStringRef v17 = @"2";
          break;
        case 2uLL:
          CFStringRef v17 = @"3";
          goto LABEL_12;
        case 3uLL:
          CFStringRef v17 = @"4";
LABEL_12:
          int v16 = 1;
          break;
        default:
          int v16 = 0;
          CFStringRef v17 = 0;
          break;
      }
      double v18 = [@"Swatch-Explorer-Face" stringByAppendingString:v17];
      if (v16)
      {
        double v19 = CLKLocaleNumberSystemPrefix();
        uint64_t v20 = [v18 stringByAppendingFormat:@"-%@", v19];

        double v18 = (void *)v20;
      }
      v55 = [v18 stringByAppendingString:@"-sashimi"];

      double v21 = +[NTKExplorerFaceBundle imageWithName:v55];
      double v22 = [(NTKExplorerFaceView *)self palette];
      id v23 = [v22 copy];

      v24 = [v11 pigmentEditOption];
      [v23 setPigmentEditOption:v24];

      CGRect v25 = NTKImageNamed();
      v26 = [v23 handsInlay];
      v54 = [v25 _flatImageWithColor:v26];

      v27 = NTKImageNamed();
      v28 = [v23 hands];
      [v27 _flatImageWithColor:v28];
      v29 = v57 = v11;

      v30 = +[UIScreen mainScreen];
      [v30 scale];
      double v32 = v31;

      v33 = (char *)[v10 density];
      double v34 = 62.0;
      if (v33 == (unsigned char *)&dword_0 + 3) {
        double v34 = 59.0;
      }
      BOOL v35 = v32 <= 2.0;
      if (v32 <= 2.0) {
        double v36 = 45.0;
      }
      else {
        double v36 = 44.0;
      }
      if (v35) {
        double v37 = v34;
      }
      else {
        double v37 = dbl_F790[v33 == (unsigned char *)&dword_0 + 3];
      }
      v38 = +[NTKExplorerFaceBundle imageWithName:@"Swatch-Explorer-SubdialDot-sashimi"];
      v53 = v23;
      v39 = [v23 secondHandInlay];
      v40 = [v38 _flatImageWithColor:v39];

      v41 = +[NTKExplorerFaceBundle imageWithName:@"Swatch-Explorer-SubdialHand-sashimi"];
      v42 = [v23 secondHand];
      v43 = [v41 _flatImageWithColor:v42];

      id v44 = objc_alloc((Class)UIGraphicsImageRenderer);
      [v21 size];
      id v45 = objc_msgSend(v44, "initWithSize:");
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_5994;
      v59[3] = &unk_103E0;
      id v60 = v21;
      id v61 = v54;
      id v62 = v29;
      id v63 = v43;
      double v65 = v36;
      double v66 = v37;
      id v64 = v40;
      id v46 = v40;
      id v47 = v43;
      id v48 = v29;
      id v49 = v10;
      id v50 = v54;
      id v51 = v21;
      double v15 = [v45 imageWithActions:v59];
      double v14 = v56;
      [(id)qword_163B0 setObject:v15 forKey:v56];

      double v11 = v57;
      id v10 = v49;
    }
  }
  else
  {
    v58.receiver = self;
    v58.super_class = (Class)NTKExplorerFaceView;
    double v15 = [(NTKExplorerFaceView *)&v58 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:a5];
  }

  return v15;
}

- (unint64_t)density
{
  return self->_density;
}

- (NTKColorCircularUtilitarianFaceViewComplicationFactory)faceViewComplicationFactory
{
  return self->_faceViewComplicationFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceViewComplicationFactory, 0);
  objc_storeStrong((id *)&self->_statusView, 0);

  objc_storeStrong((id *)&self->_dialView, 0);
}

@end