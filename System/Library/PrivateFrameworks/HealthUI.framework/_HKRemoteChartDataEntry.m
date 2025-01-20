@interface _HKRemoteChartDataEntry
- (HKGraphSeriesDataBlock)seriesData;
- (HKHealthQueryChartCacheDataSource)dataSourceForMapping;
- (_HKRemoteChartDataEntry)initWithSeriesData:(id)a3 dataSourceForMapping:(id)a4 seriesDataSourceContext:(id)a5;
- (id)seriesDataSourceContext;
- (id)seriesDataWithMappingApplied;
@end

@implementation _HKRemoteChartDataEntry

- (_HKRemoteChartDataEntry)initWithSeriesData:(id)a3 dataSourceForMapping:(id)a4 seriesDataSourceContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_HKRemoteChartDataEntry;
  v12 = [(_HKRemoteChartDataEntry *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_seriesData, a3);
    objc_storeStrong((id *)&v13->_dataSourceForMapping, a4);
    objc_storeStrong(&v13->_seriesDataSourceContext, a5);
  }

  return v13;
}

- (id)seriesDataWithMappingApplied
{
  v3 = [(_HKRemoteChartDataEntry *)self dataSourceForMapping];

  if (v3)
  {
    v4 = [(_HKRemoteChartDataEntry *)self dataSourceForMapping];
    v5 = [(_HKRemoteChartDataEntry *)self seriesDataSourceContext];
    v6 = [v4 mappingFunctionForContext:v5];

    [(_HKRemoteChartDataEntry *)self seriesData];
    if (v6) {
      v7 = {;
    }
      v8 = ((void (**)(void, void *))v6)[2](v6, v7);
    }
    else {
      v8 = {;
    }
    }
  }
  else
  {
    v8 = [(_HKRemoteChartDataEntry *)self seriesData];
  }
  return v8;
}

- (HKGraphSeriesDataBlock)seriesData
{
  return self->_seriesData;
}

- (HKHealthQueryChartCacheDataSource)dataSourceForMapping
{
  return self->_dataSourceForMapping;
}

- (id)seriesDataSourceContext
{
  return self->_seriesDataSourceContext;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_seriesDataSourceContext, 0);
  objc_storeStrong((id *)&self->_dataSourceForMapping, 0);
  objc_storeStrong((id *)&self->_seriesData, 0);
}

@end