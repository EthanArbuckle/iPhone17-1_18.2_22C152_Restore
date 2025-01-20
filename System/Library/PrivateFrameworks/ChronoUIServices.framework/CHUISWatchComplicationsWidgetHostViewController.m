@interface CHUISWatchComplicationsWidgetHostViewController
- (BOOL)generateSnapshotMetadata;
- (BOOL)includeAccessoryViews;
- (BOOL)shouldReceiveWatchGestureInteractions;
- (CGPoint)bezelContentCenter;
- (CHSWatchComplicationsCurvedLabelMetrics)curvedLabelMetrics;
- (CHUISWatchComplicationsCurvedLabelMetrics)complicationsCurvedLabelMetrics;
- (CHUISWatchComplicationsWidgetHostViewController)initWithWidget:(id)a3 metrics:(id)a4 widgetConfigurationIdentifier:(id)a5;
- (CHUISWatchComplicationsWidgetHostViewControllerDelegate)watchComplicationsDelegate;
- (CHUISWatchComplicationsWidgetSnapshotMetadata)snapshotMetadata;
- (double)curvedTextAngularWidth;
- (id)additionalSnapshotPresentationContext;
- (id)handleActions:(id)a3;
- (id)sceneSpecification;
- (int64_t)cornerPosition;
- (int64_t)position;
- (void)_translateCurvedLabelMetrics;
- (void)sceneDidUpdateClientSettingsWithDiff:(id)a3 oldClientSettings:(id)a4 newClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneDidUpdateToSceneIdentifier:(id)a3;
- (void)setBezelContentCenter:(CGPoint)a3;
- (void)setComplicationsCurvedLabelMetrics:(id)a3;
- (void)setCornerPosition:(int64_t)a3;
- (void)setCurvedLabelMetrics:(id)a3;
- (void)setGenerateSnapshotMetadata:(BOOL)a3;
- (void)setIncludeAccessoryViews:(BOOL)a3;
- (void)setShouldReceiveWatchGestureInteractions:(BOOL)a3;
- (void)setWatchComplicationsDelegate:(id)a3;
- (void)willModifySceneClientSettings:(id)a3;
- (void)willModifySceneSettings:(id)a3;
@end

@implementation CHUISWatchComplicationsWidgetHostViewController

- (CHUISWatchComplicationsWidgetHostViewController)initWithWidget:(id)a3 metrics:(id)a4 widgetConfigurationIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CHUISWatchComplicationsWidgetHostViewController;
  v11 = [(CHUISWidgetHostViewController *)&v21 initWithWidget:v8 metrics:v9 widgetConfigurationIdentifier:v10];
  if (v11)
  {
    v12 = objc_alloc_init(CHUISWatchComplicationsWidgetSceneClientSettingsDiffInspector);
    clientSettingsDiffInspector = v11->_clientSettingsDiffInspector;
    v11->_clientSettingsDiffInspector = v12;

    v11->_cornerPosition = 0;
    curvedLabelMetrics = v11->_curvedLabelMetrics;
    v11->_curvedLabelMetrics = 0;

    complicationsCurvedLabelMetrics = v11->_complicationsCurvedLabelMetrics;
    v11->_complicationsCurvedLabelMetrics = 0;

    v11->_bezelContentCenter = (CGPoint)*MEMORY[0x1E4F1DAD8];
    v11->_includeAccessoryViews = 1;
    v11->_generateSnapshotMetadata = 0;
    objc_initWeak(&location, v11);
    v16 = v11->_clientSettingsDiffInspector;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __104__CHUISWatchComplicationsWidgetHostViewController_initWithWidget_metrics_widgetConfigurationIdentifier___block_invoke;
    v18[3] = &unk_1E62AF5D8;
    objc_copyWeak(&v19, &location);
    [(CHUISWatchComplicationsWidgetSceneClientSettingsDiffInspector *)v16 observeCurvedTextAngularWidthWithBlock:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __104__CHUISWatchComplicationsWidgetHostViewController_initWithWidget_metrics_widgetConfigurationIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained watchComplicationsDelegate];
    [v2 curvedLabelAngularWidthChanged];

    id WeakRetained = v3;
  }
}

- (void)_translateCurvedLabelMetrics
{
  id v3 = [CHUISWatchComplicationsCurvedLabelMetrics alloc];
  BOOL v4 = [(CHSWatchComplicationsCurvedLabelMetrics *)self->_curvedLabelMetrics interior];
  [(CHSWatchComplicationsCurvedLabelMetrics *)self->_curvedLabelMetrics tracking];
  double v6 = v5;
  [(CHSWatchComplicationsCurvedLabelMetrics *)self->_curvedLabelMetrics circleCenter];
  double v8 = v7;
  double v10 = v9;
  [(CHSWatchComplicationsCurvedLabelMetrics *)self->_curvedLabelMetrics circleRadius];
  double v12 = v11;
  [(CHSWatchComplicationsCurvedLabelMetrics *)self->_curvedLabelMetrics maximumAngularWidth];
  double v14 = v13;
  [(CHSWatchComplicationsCurvedLabelMetrics *)self->_curvedLabelMetrics centerAngle];
  double v16 = v15;
  [(CHSWatchComplicationsCurvedLabelMetrics *)self->_curvedLabelMetrics fontSize];
  double v18 = v17;
  id v26 = [(CHSWatchComplicationsCurvedLabelMetrics *)self->_curvedLabelMetrics textColor];
  unint64_t v19 = [(CHSWatchComplicationsCurvedLabelMetrics *)self->_curvedLabelMetrics accessoryPlacement];
  [(CHSWatchComplicationsCurvedLabelMetrics *)self->_curvedLabelMetrics accessoryPadding];
  double v21 = v20;
  [(CHSWatchComplicationsCurvedLabelMetrics *)self->_curvedLabelMetrics accessoryMaxSize];
  v24 = -[CHUISWatchComplicationsCurvedLabelMetrics initWithInterior:tracking:circleCenter:circleRadius:maximumAngularWidth:centerAngle:fontSize:textColor:accessoryPlacement:accessoryPadding:accessoryMaxSize:](v3, "initWithInterior:tracking:circleCenter:circleRadius:maximumAngularWidth:centerAngle:fontSize:textColor:accessoryPlacement:accessoryPadding:accessoryMaxSize:", v4, v26, v19, v6, v8, v10, v12, v14, v16, v18, v21, v22, v23);
  complicationsCurvedLabelMetrics = self->_complicationsCurvedLabelMetrics;
  self->_complicationsCurvedLabelMetrics = v24;
}

- (void)setCornerPosition:(int64_t)a3
{
  if (self->_cornerPosition != a3)
  {
    self->_cornerPosition = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __69__CHUISWatchComplicationsWidgetHostViewController_setCornerPosition___block_invoke;
    v3[3] = &__block_descriptor_40_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
    v3[4] = a3;
    [(CHUISWidgetHostViewController *)self modifySceneSettings:v3];
  }
}

uint64_t __69__CHUISWatchComplicationsWidgetHostViewController_setCornerPosition___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      double v6 = v5;
    }
    else {
      double v6 = 0;
    }
  }
  else
  {
    double v6 = 0;
  }
  id v7 = v6;

  [v7 setCornerPosition:*(void *)(a1 + 32)];
  return 0;
}

- (void)setCurvedLabelMetrics:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_curvedLabelMetrics, a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73__CHUISWatchComplicationsWidgetHostViewController_setCurvedLabelMetrics___block_invoke;
    v6[3] = &unk_1E62AF620;
    v6[4] = self;
    [(CHUISWidgetHostViewController *)self modifySceneSettings:v6];
  }
}

uint64_t __73__CHUISWatchComplicationsWidgetHostViewController_setCurvedLabelMetrics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      double v6 = v5;
    }
    else {
      double v6 = 0;
    }
  }
  else
  {
    double v6 = 0;
  }
  id v7 = v6;

  [v7 setCurvedLabelMetrics:*(void *)(*(void *)(a1 + 32) + 1456)];
  return 0;
}

- (void)setComplicationsCurvedLabelMetrics:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_complicationsCurvedLabelMetrics, a3);
  id v5 = (void *)[v6 copy];
  [(CHUISWatchComplicationsWidgetHostViewController *)self setCurvedLabelMetrics:v5];
}

- (void)setBezelContentCenter:(CGPoint)a3
{
  if (self->_bezelContentCenter.x != a3.x || self->_bezelContentCenter.y != a3.y)
  {
    self->_bezelContentCenter = a3;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __73__CHUISWatchComplicationsWidgetHostViewController_setBezelContentCenter___block_invoke;
    v4[3] = &__block_descriptor_48_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
    CGPoint v5 = a3;
    [(CHUISWidgetHostViewController *)self modifySceneSettings:v4];
  }
}

uint64_t __73__CHUISWatchComplicationsWidgetHostViewController_setBezelContentCenter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  objc_msgSend(v7, "setBezelContentCenter:", *(double *)(a1 + 32), *(double *)(a1 + 40));
  return 0;
}

- (void)setIncludeAccessoryViews:(BOOL)a3
{
  if (self->_includeAccessoryViews != a3)
  {
    self->_includeAccessoryViews = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __76__CHUISWatchComplicationsWidgetHostViewController_setIncludeAccessoryViews___block_invoke;
    v3[3] = &__block_descriptor_33_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
    BOOL v4 = a3;
    [(CHUISWidgetHostViewController *)self modifySceneSettings:v3];
  }
}

uint64_t __76__CHUISWatchComplicationsWidgetHostViewController_setIncludeAccessoryViews___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  [v7 setIncludeAccessoryViews:*(unsigned __int8 *)(a1 + 32)];
  return 0;
}

- (void)setGenerateSnapshotMetadata:(BOOL)a3
{
  if (self->_generateSnapshotMetadata != a3)
  {
    self->_generateSnapshotMetadata = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __79__CHUISWatchComplicationsWidgetHostViewController_setGenerateSnapshotMetadata___block_invoke;
    v3[3] = &__block_descriptor_33_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
    BOOL v4 = a3;
    [(CHUISWidgetHostViewController *)self modifySceneSettings:v3];
  }
}

uint64_t __79__CHUISWatchComplicationsWidgetHostViewController_setGenerateSnapshotMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  [v7 setGenerateSnapshotMetadata:*(unsigned __int8 *)(a1 + 32)];
  return 0;
}

- (int64_t)position
{
  return self->_cornerPosition;
}

- (double)curvedTextAngularWidth
{
  v2 = [(CHUISWidgetHostViewController *)self clientSettings];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  [v6 curvedTextAngularWidth];
  double v8 = v7;

  return v8;
}

- (CHUISWatchComplicationsWidgetSnapshotMetadata)snapshotMetadata
{
  return self->_snapshotMetadata;
}

- (void)setShouldReceiveWatchGestureInteractions:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssertMain();
  if (self->_shouldReceiveWatchGestureInteractions != v3)
  {
    self->_shouldReceiveWatchGestureInteractions = v3;
    [(CHUISWatchComplicationsWidgetHostViewController *)self updateWatchGestureInteraction];
  }
}

- (id)sceneSpecification
{
  v2 = objc_opt_new();

  return v2;
}

- (void)willModifySceneSettings:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHUISWatchComplicationsWidgetHostViewController;
  [(CHUISWidgetHostViewController *)&v9 willModifySceneSettings:v4];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      double v7 = v6;
    }
    else {
      double v7 = 0;
    }
  }
  else
  {
    double v7 = 0;
  }
  id v8 = v7;

  [v8 setRemoteViewControllerClassName:@"ChronoCore.WatchComplicationsWidgetSceneContentViewController"];
  [v8 setCornerPosition:self->_cornerPosition];
  [v8 setCurvedLabelMetrics:self->_curvedLabelMetrics];
  objc_msgSend(v8, "setBezelContentCenter:", self->_bezelContentCenter.x, self->_bezelContentCenter.y);
  [v8 setIncludeAccessoryViews:self->_includeAccessoryViews];
  [v8 setGenerateSnapshotMetadata:self->_generateSnapshotMetadata];
}

- (void)willModifySceneClientSettings:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CHUISWatchComplicationsWidgetHostViewController;
  [(CHUISWidgetHostViewController *)&v3 willModifySceneClientSettings:a3];
}

- (void)sceneDidUpdateClientSettingsWithDiff:(id)a3 oldClientSettings:(id)a4 newClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CHUISWatchComplicationsWidgetHostViewController;
  [(CHUISWidgetHostViewController *)&v15 sceneDidUpdateClientSettingsWithDiff:v10 oldClientSettings:v11 newClientSettings:v12 transitionContext:v13];
  double v14 = [[CHUISWidgetSceneClientSettingsDiffContext alloc] initWithPreviousClientSettings:v11 currentClientSettings:v12 transitionContext:v13];
  [(CHUISWidgetSceneClientSettingsDiffInspector *)self->_clientSettingsDiffInspector inspectDiff:v10 withContext:v14];
}

- (id)additionalSnapshotPresentationContext
{
  v13.receiver = self;
  v13.super_class = (Class)CHUISWatchComplicationsWidgetHostViewController;
  objc_super v3 = [(CHUISWidgetHostViewController *)&v13 additionalSnapshotPresentationContext];
  if (v3)
  {
    id v4 = [NSString stringWithFormat:@"%@,", v3];
  }
  else
  {
    id v4 = &stru_1F15FABE8;
  }
  if (self->_cornerPosition)
  {
    uint64_t v5 = [(__CFString *)v4 stringByAppendingFormat:@"pos=%d", self->_cornerPosition];

    id v4 = (__CFString *)v5;
  }
  curvedLabelMetrics = self->_curvedLabelMetrics;
  if (curvedLabelMetrics)
  {
    double v7 = [(CHSWatchComplicationsCurvedLabelMetrics *)curvedLabelMetrics _filenameSafeStableHash];
    uint64_t v8 = [(__CFString *)v4 stringByAppendingFormat:@",curveMetrics=%@", v7];

    id v4 = (__CFString *)v8;
  }
  double y = self->_bezelContentCenter.y;
  if (self->_bezelContentCenter.x != *MEMORY[0x1E4F1DAD8] || y != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    uint64_t v11 = [(__CFString *)v4 stringByAppendingFormat:@",bezelCirclePos=%f-%f", *(void *)&self->_bezelContentCenter.x, *(void *)&y];

    id v4 = (__CFString *)v11;
  }

  return v4;
}

- (id)handleActions:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CHUISWatchComplicationsWidgetHostViewController;
  double v20 = [(CHUISWidgetHostViewController *)&v31 handleActions:v4];

  id v22 = (id)objc_opt_new();
  uint64_t v5 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = v20;
  uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v10 = v5;
        }
        else {
          id v10 = v22;
        }
        [v10 addObject:v9];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v6);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v11);
        }
        objc_super v15 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        double v16 = [v15 metadata];
        snapshotMetadata = self->_snapshotMetadata;
        self->_snapshotMetadata = v16;

        double v18 = [MEMORY[0x1E4F4F678] response];
        [v15 sendResponse:v18];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v12);
  }

  return v22;
}

- (void)sceneDidUpdateToSceneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sceneIdentifier, a3);

  [(CHUISWatchComplicationsWidgetHostViewController *)self updateWatchGestureInteraction];
}

- (int64_t)cornerPosition
{
  return self->_cornerPosition;
}

- (CHUISWatchComplicationsWidgetHostViewControllerDelegate)watchComplicationsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_watchComplicationsDelegate);

  return (CHUISWatchComplicationsWidgetHostViewControllerDelegate *)WeakRetained;
}

- (void)setWatchComplicationsDelegate:(id)a3
{
}

- (CHSWatchComplicationsCurvedLabelMetrics)curvedLabelMetrics
{
  return self->_curvedLabelMetrics;
}

- (CHUISWatchComplicationsCurvedLabelMetrics)complicationsCurvedLabelMetrics
{
  return self->_complicationsCurvedLabelMetrics;
}

- (CGPoint)bezelContentCenter
{
  double x = self->_bezelContentCenter.x;
  double y = self->_bezelContentCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)includeAccessoryViews
{
  return self->_includeAccessoryViews;
}

- (BOOL)generateSnapshotMetadata
{
  return self->_generateSnapshotMetadata;
}

- (BOOL)shouldReceiveWatchGestureInteractions
{
  return self->_shouldReceiveWatchGestureInteractions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationsCurvedLabelMetrics, 0);
  objc_storeStrong((id *)&self->_curvedLabelMetrics, 0);
  objc_destroyWeak((id *)&self->_watchComplicationsDelegate);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_snapshotMetadata, 0);

  objc_storeStrong((id *)&self->_clientSettingsDiffInspector, 0);
}

@end