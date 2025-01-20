@interface _HKAudioStandardQuantityContextDelegate
- (HKDisplayType)primaryDisplayType;
- (HKInteractiveChartOverlayNamedDataSource)cacheDataSource;
- (HKLineSeries)alternateLineSeries;
- (_HKAudioStandardQuantityContextDelegate)initWithCustomDataSource:(id)a3 primaryDisplayType:(id)a4;
- (id)_statItemForTimeScope:(int64_t)a3;
- (id)formatterForTimescope:(int64_t)a3;
- (void)setCacheDataSource:(id)a3;
- (void)setPrimaryDisplayType:(id)a3;
@end

@implementation _HKAudioStandardQuantityContextDelegate

- (_HKAudioStandardQuantityContextDelegate)initWithCustomDataSource:(id)a3 primaryDisplayType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HKAudioStandardQuantityContextDelegate;
  v9 = [(_HKAudioStandardQuantityContextDelegate *)&v12 init];
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
  v11[1] = *MEMORY[0x1E4F143B8];
  v5 = [(_HKAudioStandardQuantityContextDelegate *)self primaryDisplayType];
  v6 = objc_msgSend(v5, "hk_interactiveChartsFormatterForTimeScope:", a3);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    id v8 = [(_HKAudioStandardQuantityContextDelegate *)self _statItemForTimeScope:a3];
    v11[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v7 setOverrideStatFormatterItemOptions:v9];
  }
  return v6;
}

- (id)_statItemForTimeScope:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) > 5) {
    return &unk_1F3C206B0;
  }
  else {
    return (id)qword_1E6D52E98[a3 - 3];
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