@interface NTKDigitalModularFaceView
+ (void)_performIfNonRichModuleView:(id)a3 actions:(id)a4;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_needsForegroundContainerView;
- (double)_keylineCornerRadiusForComplicationSlot:(id)a3;
- (double)_minimumBreathingScaleForComplicationSlot:(id)a3;
- (id)_complicationSlotsForRow:(unint64_t)a3;
- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4;
- (id)_moduleViewForComplicationSlot:(id)a3;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (int64_t)_keylineStyleForComplicationSlot:(id)a3;
- (int64_t)complicationFamilyForSlot:(id)a3;
- (unint64_t)_timeLabelOptions;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyFaceColorPalette:(id)a3 toModuleView:(id)a4;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_enumerateModuleViewsWithBlock:(id)a3;
- (void)_loadLayoutRules;
- (void)_loadLayoutRulesForState:(int64_t)a3 withTopGap:(double)a4 largeModuleHeight:(double)a5;
- (void)_loadSnapshotContentViews;
- (void)_unloadSnapshotContentViews;
- (void)_updateLocale;
- (void)dealloc;
- (void)layoutSubviews;
- (void)performTapAction;
@end

@implementation NTKDigitalModularFaceView

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)NTKDigitalModularFaceView;
  [(NTKDigitalModularFaceView *)&v14 layoutSubviews];
  [(NTKDigitalModularFaceView *)self bounds];
  double x = v15.origin.x;
  double y = v15.origin.y;
  double width = v15.size.width;
  double height = v15.size.height;
  if (!CGRectIsEmpty(v15))
  {
    [(NTKDigitalModularFaceView *)self _relativeKeylineFrameForCustomEditMode:10 slot:0];
    CLKRectGetCenter();
    double v8 = v7 / width;
    double v10 = v9 / height;
    v11 = [(NTKDigitalModularFaceView *)self foregroundContainerView];
    v12 = [v11 layer];
    objc_msgSend(v12, "setAnchorPoint:", v8, v10);

    v13 = [(NTKDigitalModularFaceView *)self foregroundContainerView];
    objc_msgSend(v13, "ntk_setBoundsAndPositionFromFrame:", x, y, width, height);
  }
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NSCurrentLocaleDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)NTKDigitalModularFaceView;
  [(NTKDigitalModularFaceView *)&v4 dealloc];
}

- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v9 = [(NTKDigitalModularFaceView *)self device];
  _NTKDigitalModularLayoutConstants();

  double v10 = +[CLKFont systemFontOfSize:0.0 weight:UIFontWeightLight];
  v11 = [(NTKDigitalModularFaceView *)self device];
  v12 = +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", 0, v10, v11, x, y, width, height, 0.0, 0.0);

  return v12;
}

- (unint64_t)_timeLabelOptions
{
  return 1;
}

- (void)_loadSnapshotContentViews
{
  v6.receiver = self;
  v6.super_class = (Class)NTKDigitalModularFaceView;
  [(NTKDigitalModularFaceView *)&v6 _loadSnapshotContentViews];
  v3 = [(NTKDigitalModularFaceView *)self timeView];
  objc_super v4 = +[UIColor whiteColor];
  [v3 setOverrideColor:v4];

  [(NTKDigitalModularFaceView *)self _updateLocale];
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_updateLocale" name:NSCurrentLocaleDidChangeNotification object:0];
}

- (void)_unloadSnapshotContentViews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKDigitalModularFaceView;
  [(NTKDigitalModularFaceView *)&v4 _unloadSnapshotContentViews];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NSCurrentLocaleDidChangeNotification object:0];
}

- (void)performTapAction
{
  if ([(NTKDigitalModularFaceView *)self timeScrubbing])
  {
    [(NTKDigitalModularFaceView *)self endScrubbingAnimated:1];
  }
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  uint64_t v7 = NTKComplicationSlotCenter;
  id v8 = a5;
  id v9 = a3;
  unsigned int v10 = [v8 isEqual:v7];
  id v11 = [v9 complicationType];

  if (v10) {
    +[NTKComplicationModuleView largeModuleViewForComplicationType:v11];
  }
  else {
  v12 = +[NTKComplicationModuleView smallModuleViewForComplicationType:v11];
  }
  [(NTKDigitalModularFaceView *)self _configureComplicationView:v12 forSlot:v8];

  return v12;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_class();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_45D4;
  v11[3] = &unk_82B0;
  id v12 = v7;
  id v13 = v6;
  objc_super v14 = self;
  id v9 = v6;
  id v10 = v7;
  [v8 _performIfNonRichModuleView:v9 actions:v11];
}

- (BOOL)_needsForegroundContainerView
{
  return 1;
}

- (void)_loadLayoutRules
{
  v3 = [(NTKDigitalModularFaceView *)self device];
  _NTKDigitalModularLayoutConstants();
  objc_super v4 = [(NTKDigitalModularFaceView *)self device];
  _NTKDigitalModularLayoutConstants();
  [(NTKDigitalModularFaceView *)self _loadLayoutRulesForState:0 withTopGap:v10 largeModuleHeight:v9];

  v5 = [(NTKDigitalModularFaceView *)self device];
  _NTKDigitalModularLayoutConstants();
  id v6 = [(NTKDigitalModularFaceView *)self device];
  _NTKDigitalModularLayoutConstants();
  [(NTKDigitalModularFaceView *)self _loadLayoutRulesForState:1 withTopGap:v8 largeModuleHeight:v7];
}

- (void)_loadLayoutRulesForState:(int64_t)a3 withTopGap:(double)a4 largeModuleHeight:(double)a5
{
  [(NTKDigitalModularFaceView *)self bounds];
  double v32 = v8;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  id v12 = [(NTKDigitalModularFaceView *)self device];
  _NTKDigitalModularLayoutConstants();

  id v13 = [(NTKDigitalModularFaceView *)self device];
  objc_super v14 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v13, 3, 3, 0.0, a4, 0.0, 0.0, UIEdgeInsetsZero.top, left, bottom, right);

  CGRect v15 = [(NTKDigitalModularFaceView *)self complicationLayoutforSlot:NTKComplicationSlotTopLeft];
  [v15 setDefaultLayoutRule:v14 forState:a3];

  v34.origin.double x = 0.0;
  v34.origin.double y = a4;
  v34.size.double width = 0.0;
  v34.size.double height = 0.0;
  CGFloat v16 = CGRectGetMaxY(v34) + 0.0;
  v17 = [(NTKDigitalModularFaceView *)self device];
  v18 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v17, 3, 3, 0.0, v16, v32 + 0.0 * -2.0, a5, UIEdgeInsetsZero.top, left, bottom, right);

  v19 = [(NTKDigitalModularFaceView *)self complicationLayoutforSlot:NTKComplicationSlotCenter];
  [v19 setDefaultLayoutRule:v18 forState:a3];

  v35.origin.double x = 0.0;
  v35.origin.double y = v16;
  v35.size.double width = v32 + 0.0 * -2.0;
  v35.size.double height = a5;
  CGFloat v20 = CGRectGetMaxY(v35) + 0.0;
  v21 = [(NTKDigitalModularFaceView *)self device];
  v22 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v21, 3, 3, 0.0, v20, 0.0, 0.0, UIEdgeInsetsZero.top, left, bottom, right);

  v23 = [(NTKDigitalModularFaceView *)self complicationLayoutforSlot:NTKComplicationSlotBottomLeft];
  [v23 setDefaultLayoutRule:v22 forState:a3];

  v36.origin.double x = 0.0;
  v36.origin.double y = v20;
  v36.size.double width = 0.0;
  v36.size.double height = 0.0;
  CGFloat v24 = CGRectGetMaxX(v36) + 0.0;
  v25 = [(NTKDigitalModularFaceView *)self device];
  v26 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v25, 3, 3, v24, v20, 0.0, 0.0, UIEdgeInsetsZero.top, left, bottom, right);

  v27 = [(NTKDigitalModularFaceView *)self complicationLayoutforSlot:NTKComplicationSlotBottomCenter];
  [v27 setDefaultLayoutRule:v26 forState:a3];

  v37.origin.double x = v24;
  v37.origin.double y = v20;
  v37.size.double width = 0.0;
  v37.size.double height = 0.0;
  CGFloat v28 = CGRectGetMaxX(v37) + 0.0;
  v29 = [(NTKDigitalModularFaceView *)self device];
  v30 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v29, 3, 3, v28, v20, 0.0, 0.0, UIEdgeInsetsZero.top, left, bottom, right);

  v31 = [(NTKDigitalModularFaceView *)self complicationLayoutforSlot:NTKComplicationSlotBottomRight];
  [v31 setDefaultLayoutRule:v30 forState:a3];
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  id v4 = a3;
  v5 = [(NTKDigitalModularFaceView *)self device];
  if ([v5 deviceCategory] == (char *)&dword_0 + 1)
  {
  }
  else
  {
    unsigned __int8 v6 = [v4 isEqualToString:NTKComplicationSlotCenter];

    if ((v6 & 1) == 0)
    {
      id v7 = &dword_0 + 1;
      goto LABEL_6;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)NTKDigitalModularFaceView;
  id v7 = [(NTKDigitalModularFaceView *)&v9 _keylineStyleForComplicationSlot:v4];
LABEL_6:

  return (int64_t)v7;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_4CE8;
  v9[3] = &unk_82D8;
  v9[4] = self;
  -[NTKDigitalModularFaceView _enumerateModuleViewsWithBlock:](self, "_enumerateModuleViewsWithBlock:", v9, a4, a5);
  unsigned __int8 v6 = [(NTKDigitalModularFaceView *)self timeView];
  id v7 = [(NTKDigitalModularFaceView *)self faceColorPalette];
  double v8 = [(NTKDigitalModularFaceView *)self device];
  [v6 applyFaceColorPalette:v7 device:v8];
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  objc_super v9 = [(NTKDigitalModularFaceView *)self interpolatedColorPalette];
  double v10 = [v9 fromPalette];

  id v11 = [(NTKDigitalModularFaceView *)self interpolatedColorPalette];
  id v12 = [v11 toPalette];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_4EAC;
  v19[3] = &unk_8300;
  double v22 = a3;
  id v20 = v10;
  id v21 = v12;
  id v13 = v12;
  id v14 = v10;
  [(NTKDigitalModularFaceView *)self _enumerateModuleViewsWithBlock:v19];
  CGRect v15 = [(NTKDigitalModularFaceView *)self timeView];
  CLKCompressFraction();
  *(float *)&a3 = v16;
  v17 = [(NTKDigitalModularFaceView *)self device];
  LODWORD(v18) = LODWORD(a3);
  [v15 applyFaceFromColorPalette:v14 toColorPalette:v13 fraction:v17 device:v18];
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  NTKLargeElementScaleForBreathingFraction();
  CGFloat v7 = v6;
  double v8 = [(NTKDigitalModularFaceView *)self foregroundContainerView];
  CGAffineTransformMakeScale(&v9, v7, v7);
  [v8 setTransform:&v9];
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  NTKScaleForRubberBandingFraction();
  CGFloat v7 = v6;
  NTKAlphaForRubberBandingFraction();
  double v9 = v8;
  double v10 = [(NTKDigitalModularFaceView *)self foregroundContainerView];
  CGAffineTransformMakeScale(&v12, v7, v7);
  [v10 setTransform:&v12];

  id v11 = [(NTKDigitalModularFaceView *)self foregroundContainerView];
  [v11 setAlpha:v9];
}

- (int64_t)complicationFamilyForSlot:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:NTKComplicationSlotTopLeft] & 1) != 0
    || ([v3 isEqualToString:NTKComplicationSlotBottomLeft] & 1) != 0
    || ([v3 isEqualToString:NTKComplicationSlotBottomCenter] & 1) != 0)
  {
    int64_t v4 = 0;
  }
  else
  {
    int64_t v4 = [v3 isEqualToString:NTKComplicationSlotBottomRight] ^ 1;
  }

  return v4;
}

- (double)_keylineCornerRadiusForComplicationSlot:(id)a3
{
  int64_t v4 = [(NTKDigitalModularFaceView *)self complicationFamilyForSlot:a3];
  v5 = [(NTKDigitalModularFaceView *)self device];
  +[NTKModuleView cornerRadiusForComplicationFamily:v4 forDevice:v5];
  double v7 = v6;

  return v7;
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return 0;
}

- (double)_minimumBreathingScaleForComplicationSlot:(id)a3
{
  unsigned int v3 = [a3 isEqual:NTKComplicationSlotCenter];
  int64_t v4 = (double *)&NTKLargeElementMinimumBreathingScale;
  if (!v3) {
    int64_t v4 = (double *)&NTKSmallElementMinimumBreathingScale;
  }
  return *v4;
}

- (id)_complicationSlotsForRow:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      uint64_t v7 = NTKComplicationSlotBottomLeft;
      uint64_t v8 = NTKComplicationSlotBottomCenter;
      uint64_t v9 = NTKComplicationSlotBottomRight;
      unsigned int v3 = &v7;
      uint64_t v4 = 3;
LABEL_8:
      v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, v4, v7, v8, v9, v10, v11);
      goto LABEL_10;
    case 1uLL:
      uint64_t v10 = NTKComplicationSlotCenter;
      unsigned int v3 = &v10;
      goto LABEL_7;
    case 0uLL:
      uint64_t v11 = NTKComplicationSlotTopLeft;
      unsigned int v3 = &v11;
LABEL_7:
      uint64_t v4 = 1;
      goto LABEL_8;
  }
  v5 = 0;
LABEL_10:

  return v5;
}

- (id)_moduleViewForComplicationSlot:(id)a3
{
  unsigned int v3 = [(NTKDigitalModularFaceView *)self normalComplicationDisplayWrapperForSlot:a3];
  uint64_t v4 = [v3 display];

  return v4;
}

- (void)_enumerateModuleViewsWithBlock:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_5450;
  v5[3] = &unk_8350;
  v5[4] = self;
  id v6 = a3;
  id v3 = v6;
  uint64_t v4 = objc_retainBlock(v5);
  ((void (*)(void *, void))v4[2])(v4, 0);
  ((void (*)(void *, uint64_t))v4[2])(v4, 1);
  ((void (*)(void *, uint64_t))v4[2])(v4, 2);
}

- (void)_applyFaceColorPalette:(id)a3 toModuleView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_56F0;
  v10[3] = &unk_8378;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  [v7 _performIfNonRichModuleView:v9 actions:v10];
}

- (void)_updateLocale
{
  id v3 = +[NSLocale currentLocale];
  int v4 = CLKLocaleIs24HourMode();
  if (self->_is24HourMode != v4)
  {
    self->_is24HourMode = v4;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_57BC;
    block[3] = &unk_83A0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  [(NTKDigitalModularFaceView *)self _handleLocaleDidChange];
}

+ (void)_performIfNonRichModuleView:(id)a3 actions:(id)a4
{
  uint64_t v7 = (void (**)(void))a4;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    v7[2]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subdayOffsetDateFormatter, 0);
  objc_storeStrong((id *)&self->_dayOffsetDateFormatter, 0);

  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end