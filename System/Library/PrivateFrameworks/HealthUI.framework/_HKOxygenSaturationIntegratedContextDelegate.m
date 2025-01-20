@interface _HKOxygenSaturationIntegratedContextDelegate
- (HKDisplayType)primaryDisplayType;
- (HKInteractiveChartOverlayNamedDataSource)cacheDataSource;
- (HKLineSeries)alternateLineSeries;
- (_HKOxygenSaturationIntegratedContextDelegate)initWithCustomDataSource:(id)a3 primaryDisplayType:(id)a4 context:(unint64_t)a5;
- (id)_statItemForTimeScope:(int64_t)a3;
- (id)formatterForTimescope:(int64_t)a3;
- (unint64_t)context;
- (void)setCacheDataSource:(id)a3;
- (void)setContext:(unint64_t)a3;
- (void)setPrimaryDisplayType:(id)a3;
@end

@implementation _HKOxygenSaturationIntegratedContextDelegate

- (_HKOxygenSaturationIntegratedContextDelegate)initWithCustomDataSource:(id)a3 primaryDisplayType:(id)a4 context:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_HKOxygenSaturationIntegratedContextDelegate;
  v11 = [(_HKOxygenSaturationIntegratedContextDelegate *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_cacheDataSource, a3);
    objc_storeStrong((id *)&v12->_primaryDisplayType, a4);
    v12->_context = a5;
  }

  return v12;
}

- (HKLineSeries)alternateLineSeries
{
  return 0;
}

- (id)formatterForTimescope:(int64_t)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  unint64_t v6 = [(_HKOxygenSaturationIntegratedContextDelegate *)self context];
  if (v6 == 1)
  {
    v3 = [[HKInteractiveChartOxygenSaturationFormatter alloc] initWithStatisticsType:21];
  }
  else if (!v6)
  {
    v7 = [(_HKOxygenSaturationIntegratedContextDelegate *)self primaryDisplayType];
    objc_msgSend(v7, "hk_interactiveChartsFormatterForTimeScope:", a3);
    v3 = (HKInteractiveChartOxygenSaturationFormatter *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v3 = v3;
      v8 = [(_HKOxygenSaturationIntegratedContextDelegate *)self _statItemForTimeScope:a3];
      v11[0] = v8;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      [(HKInteractiveChartGenericStatFormatter *)v3 setOverrideStatFormatterItemOptions:v9];
    }
  }
  return v3;
}

- (id)_statItemForTimeScope:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) > 5) {
    return &unk_1F3C20620;
  }
  else {
    return (id)qword_1E6D52898[a3 - 3];
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

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryDisplayType, 0);
  objc_storeStrong((id *)&self->_cacheDataSource, 0);
}

@end