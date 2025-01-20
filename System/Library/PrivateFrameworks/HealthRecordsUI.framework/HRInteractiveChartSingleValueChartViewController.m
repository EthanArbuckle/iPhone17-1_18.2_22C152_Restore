@interface HRInteractiveChartSingleValueChartViewController
- (_TtC15HealthRecordsUI35SingleValueAnnotationViewDataSource)annotationViewDataSource;
- (id)_colorForDisplayType:(id)a3;
- (id)makeAnnotationDataSource;
- (id)makeStandardCurrentValueViewDataSource;
- (void)setAnnotationViewDataSource:(id)a3;
- (void)updateSelectionAnnotationDataSourceForContext:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6;
@end

@implementation HRInteractiveChartSingleValueChartViewController

- (id)makeStandardCurrentValueViewDataSource
{
  v3 = [_TtC15HealthRecordsUI37SingleValueCurrentValueViewDataSource alloc];
  v4 = [(HKInteractiveChartViewController *)self dateCache];
  v5 = [(HKInteractiveChartViewController *)self healthStore];
  v6 = [(HKInteractiveChartViewController *)self selectedRangeFormatter];
  v7 = [(SingleValueCurrentValueViewDataSource *)v3 initWithDateCache:v4 healthStore:v5 selectedRangeFormatter:v6];

  [(HKCurrentValueViewDataSource *)v7 setDelegate:v7];
  return v7;
}

- (id)makeAnnotationDataSource
{
  annotationViewDataSource = self->_annotationViewDataSource;
  if (!annotationViewDataSource)
  {
    v4 = objc_alloc_init(_TtC15HealthRecordsUI35SingleValueAnnotationViewDataSource);
    v5 = self->_annotationViewDataSource;
    self->_annotationViewDataSource = v4;

    annotationViewDataSource = self->_annotationViewDataSource;
  }
  return annotationViewDataSource;
}

- (void)updateSelectionAnnotationDataSourceForContext:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6
{
  id v15 = a3;
  v8 = [v15 userInfo];
  uint64_t v9 = [v8 count];

  if (v9 != 1)
  {
    v11 = [(HRInteractiveChartSingleValueChartViewController *)self annotationViewDataSource];
    v12 = [v15 userInfo];
    v13 = [v15 selectedRangeXValues];
    v14 = [v15 selectedPointValueRange];
    [v11 updateUsing:v12 valueRange:v13 dateRange:v14 timeScope:a5];

    goto LABEL_6;
  }
  v10 = [v15 userInfo];
  v11 = [v10 firstObject];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [(HRInteractiveChartSingleValueChartViewController *)self annotationViewDataSource];
      [v12 updateUsing:v11];
LABEL_6:
    }
  }
}

- (id)_colorForDisplayType:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 color];
  }
  else {
  v4 = HKHealthKeyColor();
  }

  return v4;
}

- (_TtC15HealthRecordsUI35SingleValueAnnotationViewDataSource)annotationViewDataSource
{
  return self->_annotationViewDataSource;
}

- (void)setAnnotationViewDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end