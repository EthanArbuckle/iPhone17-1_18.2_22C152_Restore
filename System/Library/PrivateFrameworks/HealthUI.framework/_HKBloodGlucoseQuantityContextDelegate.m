@interface _HKBloodGlucoseQuantityContextDelegate
- (HKDisplayType)primaryDisplayType;
- (HKInteractiveChartOverlayNamedDataSource)cacheDataSource;
- (HKLineSeries)alternateLineSeries;
- (_HKBloodGlucoseQuantityContextDelegate)initWithCustomDataSource:(id)a3 primaryDisplayType:(id)a4;
- (id)_statItemForTimeScope:(int64_t)a3;
- (id)formatterForTimescope:(int64_t)a3;
- (void)setCacheDataSource:(id)a3;
- (void)setPrimaryDisplayType:(id)a3;
@end

@implementation _HKBloodGlucoseQuantityContextDelegate

- (_HKBloodGlucoseQuantityContextDelegate)initWithCustomDataSource:(id)a3 primaryDisplayType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HKBloodGlucoseQuantityContextDelegate;
  v9 = [(_HKBloodGlucoseQuantityContextDelegate *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cacheDataSource, a3);
    objc_storeStrong((id *)&v10->_primaryDisplayType, a4);
  }

  return v10;
}

- (HKLineSeries)alternateLineSeries
{
  return 0;
}

- (id)formatterForTimescope:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v5 = -[HKDisplayType hk_interactiveChartsFormatterForTimeScope:](self->_primaryDisplayType, "hk_interactiveChartsFormatterForTimeScope:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = [(_HKBloodGlucoseQuantityContextDelegate *)self _statItemForTimeScope:a3];
    v10[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v6 setOverrideStatFormatterItemOptions:v8];
  }
  return v5;
}

- (id)_statItemForTimeScope:(int64_t)a3
{
  if ((unint64_t)a3 > 8) {
    return &unk_1F3C20458;
  }
  else {
    return (id)qword_1E6D51BD8[a3];
  }
}

- (HKInteractiveChartOverlayNamedDataSource)cacheDataSource
{
  return self->_cacheDataSource;
}

- (void)setCacheDataSource:(id)a3
{
}

- (HKDisplayType)primaryDisplayType
{
  return self->_primaryDisplayType;
}

- (void)setPrimaryDisplayType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryDisplayType, 0);
  objc_storeStrong((id *)&self->_cacheDataSource, 0);
}

@end