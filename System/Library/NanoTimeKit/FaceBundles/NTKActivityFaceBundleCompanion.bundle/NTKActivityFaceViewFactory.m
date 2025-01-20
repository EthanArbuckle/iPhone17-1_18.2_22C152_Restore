@interface NTKActivityFaceViewFactory
+ (BOOL)userActiveEnergyIsCalories;
+ (id)prelaunchApplicationIdentifiers;
+ (id)sharedRingsViewRenderer;
+ (id)userActiveEnergyUnit;
+ (void)prewarmForDevice:(id)a3;
- (BOOL)analog;
- (BOOL)hasBeenLiveOrOnDeck;
- (BOOL)isLoadingData;
- (BOOL)richComplications;
- (BOOL)shouldPerformFromZeroWristRaise;
- (BOOL)showsCanonicalContent;
- (BOOL)showsLockedContent;
- (CGRect)faceView:(id)a3 keylineFrameForComplicationSlot:(id)a4 selected:(BOOL)a5;
- (CLKDevice)device;
- (FIUIActivityDataModel)currentDataModel;
- (NTKActivityFaceViewFactoryDelegate)delegate;
- (NTKFaceView)faceView;
- (NTKUtilityComplicationFactory)complicationFactory;
- (double)_edgeGapForState:(int64_t)a3;
- (double)_keylinePaddingForState:(int64_t)a3;
- (double)_lisaGapForState:(int64_t)a3;
- (double)faceView:(id)a3 keylineCornerRadiusForComplicationSlot:(id)a4;
- (id)_canonicalDataModel;
- (id)_colorComplicationSlots;
- (id)_complicationSlots;
- (id)_dateComplicationFontForStyle:(unint64_t)a3;
- (id)_slotForUtilitySlot:(int64_t)a3;
- (id)_utilityComplicationSlots;
- (id)curvedMaskForSlot:(id)a3;
- (id)debugStringForDataModel:(id)a3;
- (id)faceView:(id)a3 newLegacyViewForComplication:(id)a4 family:(int64_t)a5 slot:(id)a6;
- (id)initForAnalog:(BOOL)a3 richComplications:(BOOL)a4 forDevice:(id)a5;
- (id)keylineViewForComplicationSlot:(id)a3;
- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)utilityDateComplicationFontForDateStyle:(unint64_t)a3;
- (int64_t)_utilitySlotForSlot:(id)a3;
- (int64_t)complicationPickerStyleForSlot:(id)a3;
- (int64_t)dataMode;
- (int64_t)keylineStyleForComplicationSlot:(id)a3;
- (int64_t)legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (unint64_t)_textLayoutStyleForSlot:(int64_t)a3;
- (unint64_t)textLayoutStyleForSlot:(int64_t)a3;
- (void)_configureComplicationFactory:(id)a3;
- (void)_handleActiveEnergyUnitChange;
- (void)_loadCurrentDataModel;
- (void)_loadCurrentDataModelForce:(BOOL)a3;
- (void)_resetWristRaiseAnimationTimeout;
- (void)_updateRingsForCurrentDataModelAnimated:(BOOL)a3;
- (void)activityDataProviderCurrentDataModelUpdated:(id)a3;
- (void)configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)curvedCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8;
- (void)dealloc;
- (void)faceView:(id)a3 configureComplicationView:(id)a4 forSlot:(id)a5;
- (void)launchActivityApp;
- (void)loadLayoutRules;
- (void)loadLayoutRulesForFaceView:(id)a3;
- (void)performWristRaiseAnimation;
- (void)prepareWristRaiseAnimation;
- (void)setComplicationFactory:(id)a3;
- (void)setDataMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setFaceView:(id)a3;
- (void)setHasBeenLiveOrOnDeck:(BOOL)a3;
- (void)setIsLoadingData:(BOOL)a3;
- (void)setShowsCanonicalContent:(BOOL)a3;
- (void)setShowsLockedContent:(BOOL)a3;
@end

@implementation NTKActivityFaceViewFactory

+ (id)sharedRingsViewRenderer
{
  id v2 = a1;
  objc_sync_enter(v2);
  WeakRetained = (NTKRingsViewRenderer *)objc_loadWeakRetained(&qword_295D8);
  if (!WeakRetained)
  {
    v4 = +[CLKUIMetalResourceManager sharedCommandQueue];
    WeakRetained = [[NTKRingsViewRenderer alloc] initWithMaximumRingCount:3 commandQueue:v4];
    objc_storeWeak(&qword_295D8, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

- (id)initForAnalog:(BOOL)a3 richComplications:(BOOL)a4 forDevice:(id)a5
{
  id v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)NTKActivityFaceViewFactory;
  v10 = [(NTKActivityFaceViewFactory *)&v25 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_device, a5);
    v11->_analog = a3;
    v11->_richComplications = a4;
    v12 = (NTKUtilityComplicationFactory *)[objc_alloc((Class)NTKUtilityComplicationFactory) initForDevice:v9];
    complicationFactory = v11->_complicationFactory;
    v11->_complicationFactory = v12;

    [(NTKActivityFaceViewFactory *)v11 _configureComplicationFactory:v11->_complicationFactory];
    [(NTKUtilityComplicationFactory *)v11->_complicationFactory setDelegate:v11];
    [(NTKUtilityComplicationFactory *)v11->_complicationFactory setMaxNormalLongWidth:sub_AE48(v9)];
    v14 = +[FIUIActivityDataProvider sharedModel];
    [v14 addSubscriber:v11];

    NTKDebugActivityWristRaiseTimeout();
    if (v15 <= 0.0) {
      uint64_t v16 = _WristRaiseDefaultTimeout;
    }
    else {
      NTKDebugActivityWristRaiseTimeout();
    }
    *(void *)&v11->_wristRaiseTimoutDuration = v16;
    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v11 selector:"_handleActiveEnergyUnitChange" name:kFIUIFitnessUnitPreferencesDidChangeNotification object:0];

    dispatch_source_t v18 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 6uLL, (dispatch_queue_t)&_dispatch_main_q);
    memoryNotificationEventSource = v11->_memoryNotificationEventSource;
    v11->_memoryNotificationEventSource = (OS_dispatch_source *)v18;

    objc_initWeak(&location, v11);
    v20 = v11->_memoryNotificationEventSource;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_AF54;
    v22[3] = &unk_20AE0;
    objc_copyWeak(&v23, &location);
    dispatch_source_set_event_handler(v20, v22);
    dispatch_resume((dispatch_object_t)v11->_memoryNotificationEventSource);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)setDataMode:(int64_t)a3
{
  int64_t v5 = [(NTKActivityFaceViewFactory *)self dataMode];
  if (self->_dataMode != a3)
  {
    int64_t v6 = v5;
    self->_dataMode = a3;
    if (a3 == 4 || a3 == 1)
    {
      if (self->_hasBeenLiveOrOnDeck)
      {
        [(NTKActivityFaceViewFactory *)self _updateRingsForCurrentDataModelAnimated:0];
      }
      else
      {
        self->_hasBeenLiveOrOnDeck = 1;
        [(NTKActivityFaceViewFactory *)self _loadCurrentDataModel];
      }
      if (self->_wantsUpdateNowDataModelNextLive)
      {
        self->_wantsUpdateNowDataModelNextLive = 0;
        [(NTKActivityFaceViewFactory *)self _updateRingsForCurrentDataModelAnimated:0];
      }
      id v7 = (id)__LastGoodDataModel;
      if (v7)
      {
        v8 = v7;
        unsigned __int8 v9 = _IsDataModelWithinToday((void *)__LastGoodDataModel);

        if ((v9 & 1) == 0)
        {
          v10 = (void *)__LastGoodDataModel;
          __LastGoodDataModel = 0;
        }
      }
    }
    if (v6 == 1)
    {
      nowDataModel = self->_nowDataModel;
      if (nowDataModel)
      {
        objc_storeStrong((id *)&__LastGoodDataModel, nowDataModel);
      }
    }
  }
}

- (void)activityDataProviderCurrentDataModelUpdated:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 activeEnergyGoal];
  if (!v5 || ([v4 appleExerciseTimeGoal], v6 == 0.0))
  {
  }
  else
  {
    id v7 = [v4 appleStandHoursGoal];

    if (v7)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_B224;
      v8[3] = &unk_20B08;
      v8[4] = self;
      id v9 = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
    }
  }
}

- (void)_loadCurrentDataModel
{
}

- (void)_loadCurrentDataModelForce:(BOOL)a3
{
  if (!self->_isLoadingData || a3)
  {
    self->_isLoadingData = 1;
    int64_t v5 = +[FIUIActivityDataProvider sharedModel];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_B318;
    v6[3] = &unk_20B30;
    v6[4] = self;
    [v5 getCurrentActivityDataModelWithHandler:v6];
  }
}

- (void)_updateRingsForCurrentDataModelAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v5 = [(NTKActivityFaceViewFactory *)self currentDataModel];
  [WeakRetained applyDataModel:v5 animated:v3];
}

- (FIUIActivityDataModel)currentDataModel
{
  if (self->_showsCanonicalContent)
  {
    id v2 = [(NTKActivityFaceViewFactory *)self _canonicalDataModel];
  }
  else if (self->_showsLockedContent)
  {
    BOOL v3 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v5 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Returning locked data model", v5, 2u);
    }

    id v2 = +[FIUIActivityDataModel lockedModel];
  }
  else
  {
    id v2 = self->_nowDataModel;
  }

  return v2;
}

- (void)setShowsCanonicalContent:(BOOL)a3
{
  if (self->_showsCanonicalContent != a3)
  {
    self->_showsCanonicalContent = a3;
    [(NTKActivityFaceViewFactory *)self _updateRingsForCurrentDataModelAnimated:0];
  }
}

- (void)setShowsLockedContent:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"No";
    if (v3) {
      CFStringRef v6 = @"Yes";
    }
    int v8 = 138412290;
    CFStringRef v9 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Is showsLockedContent:%@", (uint8_t *)&v8, 0xCu);
  }

  if (self->_showsLockedContent != v3)
  {
    self->_showsLockedContent = v3;
    id v7 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "update rings for current data model with animated NO", (uint8_t *)&v8, 2u);
    }

    [(NTKActivityFaceViewFactory *)self _updateRingsForCurrentDataModelAnimated:0];
  }
}

- (id)_canonicalDataModel
{
  id v2 = (id)__LastGoodDataModel;
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[FIUIActivityDataModel idealizedModel];
  }
  int64_t v5 = v4;

  return v5;
}

- (void)_handleActiveEnergyUnitChange
{
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id v4 = +[FIUIActivityDataProvider sharedModel];
  [v4 removeSubscriber:self];

  v5.receiver = self;
  v5.super_class = (Class)NTKActivityFaceViewFactory;
  [(NTKActivityFaceViewFactory *)&v5 dealloc];
}

- (void)prepareWristRaiseAnimation
{
  if (fabs(self->_lastWristRaiseTime) < 0.00000011920929) {
    [(NTKActivityFaceViewFactory *)self _resetWristRaiseAnimationTimeout];
  }
  if (![(NTKActivityFaceViewFactory *)self showsLockedContent])
  {
    if ([(NTKActivityFaceViewFactory *)self shouldPerformFromZeroWristRaise]
      || !__LastGoodDataModel)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      CFStringRef v6 = [(NTKActivityFaceViewFactory *)self currentDataModel];
      [WeakRetained applyDataModelWithUnfilledRings:v6];
    }
    else
    {
      BOOL v3 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = (id)__LastGoodDataModel;
        *(_DWORD *)buf = 138412546;
        CFStringRef v9 = self;
        __int16 v10 = 2112;
        id v11 = v4;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Activity Face Factory %@ showing last good data model on wrist raise %@", buf, 0x16u);
      }
      id v5 = objc_loadWeakRetained((id *)&self->_delegate);
      [v5 applyDataModel:__LastGoodDataModel animated:0];
    }
  }
}

- (void)performWristRaiseAnimation
{
  if ([(NTKActivityFaceViewFactory *)self showsLockedContent])
  {
    BOOL v3 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      id v5 = "-[NTKActivityFaceViewFactory performWristRaiseAnimation]";
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s showsLockedContent", (uint8_t *)&v4, 0xCu);
    }
  }
  else
  {
    if ((char *)[(NTKActivityFaceViewFactory *)self dataMode] == (char *)&dword_0 + 1) {
      [(NTKActivityFaceViewFactory *)self _updateRingsForCurrentDataModelAnimated:1];
    }
    [(NTKActivityFaceViewFactory *)self _resetWristRaiseAnimationTimeout];
  }
}

- (BOOL)shouldPerformFromZeroWristRaise
{
  double v3 = CFAbsoluteTimeGetCurrent() - self->_lastWristRaiseTime;
  if (v3 < 0.0) {
    [(NTKActivityFaceViewFactory *)self _resetWristRaiseAnimationTimeout];
  }
  return v3 >= self->_wristRaiseTimoutDuration;
}

- (void)_resetWristRaiseAnimationTimeout
{
  self->_lastWristRaiseTime = CFAbsoluteTimeGetCurrent();
}

- (id)utilityDateComplicationFontForDateStyle:(unint64_t)a3
{
  return [(NTKActivityFaceViewFactory *)self _dateComplicationFontForStyle:a3];
}

- (unint64_t)textLayoutStyleForSlot:(int64_t)a3
{
  return [(NTKActivityFaceViewFactory *)self _textLayoutStyleForSlot:a3];
}

- (id)_dateComplicationFontForStyle:(unint64_t)a3
{
  id v4 = [(CLKDevice *)self->_device sizeClass];
  double v5 = 11.0;
  if (!v4) {
    double v5 = 10.0;
  }
  double v6 = 17.0;
  if (!v4) {
    double v6 = 15.0;
  }
  if (a3 == 4) {
    double v5 = v6;
  }
  id v7 = +[CLKFont systemFontOfSize:v5];

  return v7;
}

- (unint64_t)_textLayoutStyleForSlot:(int64_t)a3
{
  double v5 = [(NTKActivityFaceViewFactory *)self delegate];
  double v6 = [(NTKActivityFaceViewFactory *)self _slotForUtilitySlot:a3];
  id v7 = [v5 textLayoutStyleForSlot:v6];

  return (unint64_t)v7;
}

- (void)curvedCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8
{
}

- (id)curvedMaskForSlot:(id)a3
{
  complicationFactory = self->_complicationFactory;
  int64_t v4 = [(NTKActivityFaceViewFactory *)self _utilitySlotForSlot:a3];

  return [(NTKUtilityComplicationFactory *)complicationFactory curvedMaskForSlot:v4];
}

- (void)loadLayoutRulesForFaceView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v13 = [(NTKActivityFaceViewFactory *)self _utilityComplicationSlots];
  id v14 = [v13 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v36;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        v19 = [v4 complicationLayoutforSlot:v18];
        -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:withBounds:](self->_complicationFactory, "configureComplicationLayout:forSlot:withBounds:", v19, [(NTKActivityFaceViewFactory *)self _utilitySlotForSlot:v18], v6, v8, v10, v12);
      }
      id v15 = [v13 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v15);
  }

  v20 = self->_device;
  v21 = v20;
  if (!self->_richComplications)
  {
    v29 = v20;
    id v30 = v4;
    NTKEnumerateComplicationStates();

    v28 = v29;
    goto LABEL_12;
  }
  if (!self->_analog)
  {
    sub_AE48(v20);
    NTKGraphicCircularScaledComplicationDiameter();
    double v23 = v22;
    NTKWhistlerSubdialComplicationDiameter();
    NTKWhistlerSubdialComplicationContentDiameter();
    double v25 = v24;
    NTKCircularSmallComplicationDiameter();
    double v27 = v26;
    memset(&v34, 0, sizeof(v34));
    CGAffineTransformMakeScale(&v34, v23 / v25, v23 / v25);
    memset(&v33, 0, sizeof(v33));
    CGAffineTransformMakeScale(&v33, v23 / v27, v23 / v27);
    v31 = (CLKDevice *)v4;
    v32 = v21;
    NTKEnumerateComplicationStates();

    v28 = v31;
LABEL_12:
  }
}

- (double)_keylinePaddingForState:(int64_t)a3
{
  double result = 0.0;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    NTKKeylineWidth();
    double v5 = v4;
    NTKColorFaceViewDeselectedKeylineInnerPadding();
    return v5 + v6;
  }
  return result;
}

- (double)_edgeGapForState:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 == 1) {
      _NTKColorFaceViewEdgeGapEditing(self->_device, a2);
    }
    else {
      _NTKColorFaceViewEdgeGapNormal(self->_device, a2);
    }
  }
  else
  {
    _NTKColorFaceViewEdgeGapDeselected(self->_device, a2);
  }
  return result;
}

- (double)_lisaGapForState:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2) {
    return 0.0;
  }
  _NTKColorFaceViewLisaKeylineGap(self->_device, a2);
  return result;
}

- (CGRect)faceView:(id)a3 keylineFrameForComplicationSlot:(id)a4 selected:(BOOL)a5
{
  if (a5) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 2;
  }
  id v7 = a4;
  id v8 = a3;
  double v9 = [v8 complicationLayoutforSlot:v7];
  double v10 = [v9 layoutRuleForComplicationState:v6 layoutOverride:4];
  [v10 referenceFrame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [v10 keylinePadding];
  double v22 = v12 - v21;
  double v24 = v14 - v23;
  double v25 = v16 - (-v20 - v21);
  double v26 = v18 - (-v19 - v23);
  double v27 = [v8 _complicationContainerViewForSlot:v7];
  objc_msgSend(v8, "convertRect:fromCoordinateSpace:", v27, v22, v24, v25, v26);
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;

  long long v36 = +[CLKDevice currentDevice];
  [v36 screenBounds];
  double v38 = v37;

  [v8 faceViewFrameForEditMode:1 option:0 slot:v7];
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  double v44 = v43;

  CGAffineTransformMakeScale(&v53, v44 / v38, v44 / v38);
  v54.origin.CGFloat x = v29;
  v54.origin.CGFloat y = v31;
  v54.size.CGFloat width = v33;
  v54.size.CGFloat height = v35;
  CGRect v55 = CGRectApplyAffineTransform(v54, &v53);
  CGRect v56 = CGRectOffset(v55, v40, v42);
  CGFloat x = v56.origin.x;
  CGFloat y = v56.origin.y;
  CGFloat width = v56.size.width;
  CGFloat height = v56.size.height;

  double v49 = x;
  double v50 = y;
  double v51 = width;
  double v52 = height;
  result.size.CGFloat height = v52;
  result.size.CGFloat width = v51;
  result.origin.CGFloat y = v50;
  result.origin.CGFloat x = v49;
  return result;
}

- (id)faceView:(id)a3 newLegacyViewForComplication:(id)a4 family:(int64_t)a5 slot:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([v12 isEqual:NTKComplicationSlotBottomCenter])
  {
    id v13 = [(NTKUtilityComplicationFactory *)self->_complicationFactory newViewForComplication:v11 family:a5 forSlot:[(NTKActivityFaceViewFactory *)self _utilitySlotForSlot:v12]];
    [v10 _configureComplicationView:v13 forSlot:v12];
  }
  else
  {
    +[NTKCircularComplicationView viewForComplicationType:](NTKCircularComplicationView, "viewForComplicationType:", [v11 complicationType]);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    double v14 = +[UIColor whiteColor];
    [v13 setForegroundColor:v14];

    double v15 = NTKActivityBackgroundPlatterColor();
    [v13 setPlatterColor:v15];
  }

  return v13;
}

- (void)faceView:(id)a3 configureComplicationView:(id)a4 forSlot:(id)a5
{
  id v21 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = NTKComplicationSlotBottomCenter;
  if (([v9 isEqual:NTKComplicationSlotBottomCenter] & 1) != 0
    || [v9 isEqual:NTKComplicationSlotDate])
  {
    id v11 = v8;
    if ([v9 isEqual:v10]
      && ([(NTKActivityFaceViewFactory *)self delegate],
          id v12 = objc_claimAutoreleasedReturnValue(),
          id v13 = [v12 textLayoutStyleForSlot:v9],
          v12,
          !v13))
    {
      if (self->_analog)
      {
        BOOL v14 = 1;
      }
      else
      {
        double v20 = [(NTKActivityFaceViewFactory *)self device];
        BOOL v14 = [v20 deviceCategory] == (char *)&dword_0 + 1;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
    [v11 setShouldUseBackgroundPlatter:v14];
    objc_msgSend(v11, "setAlwaysEnforcePlatterInset:", objc_msgSend(v9, "isEqualToString:", v10));
    -[NTKUtilityComplicationFactory foregroundAlphaForEditing:](self->_complicationFactory, "foregroundAlphaForEditing:", [v21 editing]);
    objc_msgSend(v11, "setForegroundAlpha:");
    -[NTKUtilityComplicationFactory foregroundImageAlphaForEditing:](self->_complicationFactory, "foregroundImageAlphaForEditing:", [v21 editing]);
    objc_msgSend(v11, "setForegroundImageAlpha:");
    objc_msgSend(v11, "setPlacement:", +[NTKUtilityComplicationFactory placementForSlot:](NTKUtilityComplicationFactory, "placementForSlot:", -[NTKActivityFaceViewFactory _utilitySlotForSlot:](self, "_utilitySlotForSlot:", v9)));
    [v11 setUseRoundedFontDesign:1];
    if (self->_richComplications) {
      [v11 setFontWeight:UIFontWeightMedium];
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v8;
    double v16 = +[UIColor whiteColor];
    [v15 setForegroundColor:v16];

    double v17 = NTKActivityBackgroundPlatterColor();
    [v15 setPlatterColor:v17];

    [v15 setUseRoundedFontDesign:1];
LABEL_10:
  }
  if ([v9 isEqualToString:v10])
  {
    double v18 = [(NTKActivityFaceViewFactory *)self device];
    double v19 = (char *)[v18 sizeClass];

    if (v19 == (unsigned char *)&dword_0 + 3) {
      [v8 setFontSize:14.5];
    }
  }
}

- (int64_t)legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  complicationFactorCGFloat y = self->_complicationFactory;
  int64_t v6 = [(NTKActivityFaceViewFactory *)self _utilitySlotForSlot:a4];

  return (int64_t)[(NTKUtilityComplicationFactory *)complicationFactory layoutOverrideForComplicationType:a3 inSlot:v6];
}

- (id)keylineViewForComplicationSlot:(id)a3
{
  complicationFactorCGFloat y = self->_complicationFactory;
  int64_t v4 = [(NTKActivityFaceViewFactory *)self _utilitySlotForSlot:a3];

  return [(NTKUtilityComplicationFactory *)complicationFactory keylineViewForSlot:v4];
}

- (double)faceView:(id)a3 keylineCornerRadiusForComplicationSlot:(id)a4
{
  id v5 = a4;
  if ([v5 isEqual:NTKComplicationSlotDate]) {
    NTKKeylineCornerRadiusSmall();
  }
  else {
    [(NTKUtilityComplicationFactory *)self->_complicationFactory keylineCornerRadiusForSlot:[(NTKActivityFaceViewFactory *)self _utilitySlotForSlot:v5]];
  }
  double v7 = v6;

  return v7;
}

- (int64_t)complicationPickerStyleForSlot:(id)a3
{
  return [(CLKDevice *)self->_device deviceCategory] != (char *)&dword_0 + 1;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4
{
  p_faceView = &self->_faceView;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_faceView);
  [(NTKActivityFaceViewFactory *)self faceView:WeakRetained configureComplicationView:v8 forSlot:v7];
}

- (void)loadLayoutRules
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);
  [(NTKActivityFaceViewFactory *)self loadLayoutRulesForFaceView:WeakRetained];
}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  p_faceView = &self->_faceView;
  id v9 = a5;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_faceView);
  id v12 = [(NTKActivityFaceViewFactory *)self faceView:WeakRetained newLegacyViewForComplication:v10 family:a4 slot:v9];

  return v12;
}

- (void)launchActivityApp
{
  id v3 = +[NSURL URLWithString:@"ActivityMonitorApp://"];
  id v2 = NTKDefaultAppLaunchLocation();
  NTKLaunchApp();
}

+ (void)prewarmForDevice:(id)a3
{
  id v3 = +[FIUIActivityDataProvider sharedModel];
}

- (void)_configureComplicationFactory:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setDateKeylineMaxWidth:", dbl_19D70[-[CLKDevice sizeClass](self->_device, "sizeClass") == 0]);
  id v5 = [(CLKDevice *)self->_device sizeClass];
  double v6 = 30.0;
  if (!v5) {
    double v6 = 26.0;
  }
  [v4 setDateHorizontalCenterOffset:v6];
  [v4 setForegroundAlpha:1.0];
  [v4 setForegroundImageAlpha:1.0];
  [v4 setBottomCenterLayout:3];
  if (!self->_analog)
  {
    id v7 = +[CLKDeviceMetrics metricsWithDevice:self->_device identitySizeClass:2];
    v11[0] = &off_216D8;
    v11[1] = &off_216F0;
    v12[0] = &off_21DA0;
    v12[1] = &off_21DA0;
    v11[2] = &off_21708;
    v12[2] = &off_21DB0;
    id v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
    [v7 scaledValue:v8 withOverrides:7.0];
    double v10 = v9;

    objc_msgSend(v4, "setScreenEdgeInsets:", 0.0, 0.0, v10, 0.0);
  }
}

- (int64_t)_utilitySlotForSlot:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:NTKComplicationSlotBottomCenter])
  {
    int64_t v4 = 10;
  }
  else if ([v3 isEqualToString:NTKComplicationSlotDate])
  {
    int64_t v4 = 12;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)_slotForUtilitySlot:(int64_t)a3
{
  if (a3 == 10)
  {
    int64_t v4 = (id *)&NTKComplicationSlotBottomCenter;
LABEL_5:
    id v5 = *v4;
    return v5;
  }
  if (a3 == 12)
  {
    int64_t v4 = (id *)&NTKComplicationSlotDate;
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

- (int64_t)keylineStyleForComplicationSlot:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CLKDevice *)self->_device deviceCategory] != (char *)&dword_0 + 1
    && (([v4 isEqualToString:NTKComplicationSlotTopLeft] & 1) != 0
     || ([v4 isEqualToString:NTKComplicationSlotTopRight] & 1) != 0);

  return v5;
}

- (id)_utilityComplicationSlots
{
  if (qword_295E8 != -1) {
    dispatch_once(&qword_295E8, &stru_20BA0);
  }
  id v2 = (void *)qword_295E0;

  return v2;
}

- (id)_colorComplicationSlots
{
  if (qword_295F8 != -1) {
    dispatch_once(&qword_295F8, &stru_20BC0);
  }
  id v2 = (void *)qword_295F0;

  return v2;
}

- (id)_complicationSlots
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D224;
  block[3] = &unk_20BE8;
  block[4] = self;
  if (qword_29608 != -1) {
    dispatch_once(&qword_29608, block);
  }
  return (id)qword_29600;
}

+ (id)prelaunchApplicationIdentifiers
{
  return +[NSSet setWithObject:@"com.apple.ActivityMonitorApp"];
}

+ (id)userActiveEnergyUnit
{
  id v2 = +[FIUIActivityDataModel formattingManager];
  uint64_t v3 = [v2 unitManager];
  id v4 = [v3 userActiveEnergyBurnedUnit];

  return v4;
}

+ (BOOL)userActiveEnergyIsCalories
{
  id v2 = [a1 userActiveEnergyUnit];
  uint64_t v3 = +[HKUnit kilocalorieUnit];
  BOOL v4 = v2 == v3;

  return v4;
}

- (id)debugStringForDataModel:(id)a3
{
  BOOL v4 = (FIUIActivityDataModel *)a3;
  int64_t v5 = v4;
  if (v4)
  {
    if (self->_nowDataModel == v4)
    {
      CFStringRef v9 = @"live";
    }
    else
    {
      id v6 = (id)__LastGoodDataModel;
      if (v6 && (uint64_t v7 = __LastGoodDataModel, v6, (FIUIActivityDataModel *)v7 == v5))
      {
        CFStringRef v9 = @"last good";
      }
      else
      {
        id v8 = +[FIUIActivityDataModel idealizedModel];

        if (v8 == v5) {
          CFStringRef v9 = @"idealized";
        }
        else {
          CFStringRef v9 = @"none found?";
        }
      }
    }
  }
  else
  {
    CFStringRef v9 = @"nil";
  }

  return (id)v9;
}

- (BOOL)analog
{
  return self->_analog;
}

- (BOOL)richComplications
{
  return self->_richComplications;
}

- (CLKDevice)device
{
  return self->_device;
}

- (NTKUtilityComplicationFactory)complicationFactory
{
  return self->_complicationFactory;
}

- (void)setComplicationFactory:(id)a3
{
}

- (BOOL)hasBeenLiveOrOnDeck
{
  return self->_hasBeenLiveOrOnDeck;
}

- (void)setHasBeenLiveOrOnDeck:(BOOL)a3
{
  self->_hasBeenLiveOrOnDeck = a3;
}

- (BOOL)isLoadingData
{
  return self->_isLoadingData;
}

- (void)setIsLoadingData:(BOOL)a3
{
  self->_isLoadingData = a3;
}

- (BOOL)showsCanonicalContent
{
  return self->_showsCanonicalContent;
}

- (BOOL)showsLockedContent
{
  return self->_showsLockedContent;
}

- (NTKActivityFaceViewFactoryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKActivityFaceViewFactoryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NTKFaceView)faceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);

  return (NTKFaceView *)WeakRetained;
}

- (void)setFaceView:(id)a3
{
}

- (int64_t)dataMode
{
  return self->_dataMode;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_faceView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_complicationFactory, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_memoryNotificationEventSource, 0);

  objc_storeStrong((id *)&self->_nowDataModel, 0);
}

@end