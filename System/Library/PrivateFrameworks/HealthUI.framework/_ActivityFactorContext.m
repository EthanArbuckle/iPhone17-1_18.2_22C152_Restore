@interface _ActivityFactorContext
- (BOOL)_isGraphViewReadyForContextUpdate:(id)a3;
- (_ActivityCurrentValueView)activityCurrentValueView;
- (_ActivityFactorContext)initWithPrimaryDisplayType:(id)a3 factorDisplayType:(id)a4 overlayChartController:(id)a5 currentCalendarOverride:(id)a6 applicationItems:(id)a7 overlayMode:(int64_t)a8 activityCurrentValueView:(id)a9;
- (id)_moveStringForSummary:(id)a3;
- (void)setActivityCurrentValueView:(id)a3;
- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7;
@end

@implementation _ActivityFactorContext

- (_ActivityFactorContext)initWithPrimaryDisplayType:(id)a3 factorDisplayType:(id)a4 overlayChartController:(id)a5 currentCalendarOverride:(id)a6 applicationItems:(id)a7 overlayMode:(int64_t)a8 activityCurrentValueView:(id)a9
{
  id v16 = a9;
  v21.receiver = self;
  v21.super_class = (Class)_ActivityFactorContext;
  char v20 = 1;
  v17 = [(HKOverlayRoomFactorContext *)&v21 initWithPrimaryDisplayType:a3 factorDisplayType:a4 overlayChartController:a5 currentCalendarOverride:a6 applicationItems:a7 overlayMode:a8 allowsDeselection:v20];
  v18 = v17;
  if (v17) {
    objc_storeWeak((id *)&v17->_activityCurrentValueView, v16);
  }

  return v18;
}

- (BOOL)_isGraphViewReadyForContextUpdate:(id)a3
{
  id v3 = a3;
  v4 = +[HKInteractiveChartActivityController firstActivitySeriesForGraphView:v3];
  [v3 frame];
  double v6 = v5;
  double v8 = v7;

  BOOL v9 = v8 > 0.0;
  if (v6 <= 0.0) {
    BOOL v9 = 0;
  }
  if (v4) {
    BOOL v10 = v9;
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v15 = [v13 primaryGraphViewController];
  v17 = [v15 graphView];

  if ([(_ActivityFactorContext *)self _isGraphViewReadyForContextUpdate:v17])
  {
    objc_initWeak(&location, self);
    v32[0] = v12;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __109___ActivityFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2;
    v18[3] = &unk_1E6D55BB8;
    objc_copyWeak(v24, &location);
    id v19 = v12;
    v24[1] = (id)a5;
    id v20 = v13;
    objc_super v21 = self;
    id v22 = v17;
    id v23 = v14;
    [(HKOverlayRoomStackedContext *)self chartPointsForChartPointType:1 dateIntervals:v16 overlayChartController:v20 dateIntervalMustMatchView:1 timeScope:a5 resolution:a6 completion:v18];

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __109___ActivityFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
    block[3] = &unk_1E6D55B90;
    block[4] = self;
    id v27 = v12;
    id v28 = v13;
    int64_t v30 = a5;
    int64_t v31 = a6;
    id v29 = v14;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (id)_moveStringForSummary:(id)a3
{
  id v4 = a3;
  if ([v4 activityMoveMode] == 2)
  {
    double v5 = [v4 appleMoveTime];
    double v6 = [v4 appleMoveTimeGoal];

    double v7 = HKLocalizedDisplayStringForAppleMoveTime(v5, v6, 1, 0);
  }
  else
  {
    double v8 = [(_ActivityFactorContext *)self activityCurrentValueView];
    BOOL v9 = [v8 activitySummaryDataProvider];
    BOOL v10 = [v9 displayTypeController];
    double v5 = [v10 displayTypeWithIdentifier:&unk_1F3C22510];

    v11 = [(_ActivityFactorContext *)self activityCurrentValueView];
    id v12 = [v11 activitySummaryDataProvider];
    id v13 = [v12 unitController];
    double v6 = [v13 unitForDisplayType:v5];

    id v14 = NSNumber;
    v15 = [v4 activeEnergyBurned];
    [v15 doubleValueForUnit:v6];
    id v16 = objc_msgSend(v14, "numberWithDouble:");

    v17 = [v4 activeEnergyBurned];

    v18 = HKLocalizedStringWithEnergy();

    id v19 = [(_ActivityFactorContext *)self activityCurrentValueView];
    id v20 = [v19 activitySummaryDataProvider];
    objc_super v21 = [v20 unitController];
    id v22 = [v21 localizedDisplayNameForUnit:v6 value:v16];

    double v7 = HKFormatValueAndUnit(v18, v22);
  }
  return v7;
}

- (_ActivityCurrentValueView)activityCurrentValueView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityCurrentValueView);
  return (_ActivityCurrentValueView *)WeakRetained;
}

- (void)setActivityCurrentValueView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end