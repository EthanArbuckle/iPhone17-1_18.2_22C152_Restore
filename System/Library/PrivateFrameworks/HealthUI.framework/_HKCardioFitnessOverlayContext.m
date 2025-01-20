@interface _HKCardioFitnessOverlayContext
- (HKDisplayTypeContextItem)lastUpdatedItem;
- (HKInteractiveChartOverlayViewController)overlayChartController;
- (HKSampleType)monitoringSampleType;
- (_HKCardioFitnessOverlayContext)initWithMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)_cardioFitnessContextItemWithLevel:(int64_t)a3 chartPointCount:(id)a4 forTimeScope:(int64_t)a5;
- (id)_cardioFitnessContextItemWithLevel:(int64_t)a3 count:(id)a4 unitString:(id)a5;
- (id)_cardioFitnessContextItemWithLevel:(int64_t)a3 sampleCount:(id)a4;
- (id)baseDisplayTypeForOverlay:(int64_t)a3;
- (id)contextItemForLastUpdate;
- (id)overlayDisplayTypeForTimeScope:(int64_t)a3;
- (int64_t)mode;
- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4;
- (void)setLastUpdatedItem:(id)a3;
- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7;
@end

@implementation _HKCardioFitnessOverlayContext

- (_HKCardioFitnessOverlayContext)initWithMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_HKCardioFitnessOverlayContext;
  v9 = [(_HKCardioFitnessOverlayContext *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_mode = a3;
    objc_storeStrong((id *)&v9->_overlayChartController, a5);
    uint64_t v11 = [MEMORY[0x1E4F2B3B8] _quantityTypeWithCode:124];
    monitoringSampleType = v10->_monitoringSampleType;
    v10->_monitoringSampleType = (HKSampleType *)v11;
  }
  return v10;
}

- (id)contextItemForLastUpdate
{
  v3 = [(_HKCardioFitnessOverlayContext *)self lastUpdatedItem];

  if (!v3)
  {
    v4 = [(_HKCardioFitnessOverlayContext *)self _cardioFitnessContextItemWithLevel:-1 sampleCount:0];
    [(_HKCardioFitnessOverlayContext *)self setLastUpdatedItem:v4];
  }
  return [(_HKCardioFitnessOverlayContext *)self lastUpdatedItem];
}

- (id)overlayDisplayTypeForTimeScope:(int64_t)a3
{
  return 0;
}

- (id)baseDisplayTypeForOverlay:(int64_t)a3
{
  return 0;
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6, a7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 handleFailureInMethod:a2 object:self file:@"HKOverlayRoomCardioFitnessViewController.m" lineNumber:540 description:@"subclass must implement this"];
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (id)_cardioFitnessContextItemWithLevel:(int64_t)a3 chartPointCount:(id)a4 forTimeScope:(int64_t)a5
{
  id v8 = a4;
  id v9 = +[HKGraphZoomLevelConfiguration seriesPointIntervalUnitForTimeScope:pointCount:](HKGraphZoomLevelConfiguration, "seriesPointIntervalUnitForTimeScope:pointCount:", a5, [v8 integerValue]);
  v10 = [(_HKCardioFitnessOverlayContext *)self _cardioFitnessContextItemWithLevel:a3 count:v8 unitString:v9];

  return v10;
}

- (id)_cardioFitnessContextItemWithLevel:(int64_t)a3 sampleCount:(id)a4
{
  v6 = NSString;
  v7 = (void *)MEMORY[0x1E4F28B50];
  id v8 = a4;
  id v9 = [v7 bundleWithIdentifier:@"com.apple.HealthUI"];
  v10 = [v9 localizedStringForKey:@"ENTRIES_NUMBERLESS_VALUE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v11 = objc_msgSend(v6, "localizedStringWithFormat:", v10, objc_msgSend(v8, "integerValue"));
  v12 = [(_HKCardioFitnessOverlayContext *)self _cardioFitnessContextItemWithLevel:a3 count:v8 unitString:v11];

  return v12;
}

- (id)_cardioFitnessContextItemWithLevel:(int64_t)a3 count:(id)a4 unitString:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(HKDisplayTypeContextItem);
  uint64_t v11 = +[HKCardioFitnessUtilities localizedStringForCardioFitnessTitle:a3];
  [(HKDisplayTypeContextItem *)v10 setTitle:v11];

  v12 = NSString;
  v13 = [MEMORY[0x1E4F2ACA0] analyticsStringForLevel:a3];
  objc_super v14 = objc_msgSend(v12, "hk_chartOverlayCardioFitnessAccessibilityIdentifier:", v13);
  [(HKDisplayTypeContextItem *)v10 setAccessibilityIdentifier:v14];

  [(HKDisplayTypeContextItem *)v10 setInfoHidden:1];
  if ([v8 integerValue])
  {
    [(HKDisplayTypeContextItem *)v10 setUnit:v9];
    [v8 stringValue];
  }
  else
  {
    [(HKDisplayTypeContextItem *)v10 setUnit:&stru_1F3B9CF20];
    HKLocalizedNoDataString();
  v15 = };
  [(HKDisplayTypeContextItem *)v10 setValue:v15];

  v16 = [MEMORY[0x1E4F2ACA0] analyticsStringForLevel:a3];
  [(HKDisplayTypeContextItem *)v10 setAnalyticsIdentifier:v16];

  v17 = +[HKOverlayContextUtilities defaultMetricColorsForOverlayMode:[(_HKCardioFitnessOverlayContext *)self mode]];
  [(HKDisplayTypeContextItem *)v10 setMetricColors:v17];

  v18 = +[HKUIMetricColors vitalsColors];
  [(HKDisplayTypeContextItem *)v10 setSelectedMetricColors:v18];

  return v10;
}

- (int64_t)mode
{
  return self->_mode;
}

- (HKInteractiveChartOverlayViewController)overlayChartController
{
  return self->_overlayChartController;
}

- (HKSampleType)monitoringSampleType
{
  return self->_monitoringSampleType;
}

- (HKDisplayTypeContextItem)lastUpdatedItem
{
  return self->_lastUpdatedItem;
}

- (void)setLastUpdatedItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedItem, 0);
  objc_storeStrong((id *)&self->_monitoringSampleType, 0);
  objc_storeStrong((id *)&self->_overlayChartController, 0);
}

@end