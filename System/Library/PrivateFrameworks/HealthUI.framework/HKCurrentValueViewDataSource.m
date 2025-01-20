@interface HKCurrentValueViewDataSource
+ (id)defaultStringForValueRange:(id)a3 timeScope:(int64_t)a4;
- (BOOL)_pendingDataForGraphView:(id)a3;
- (BOOL)pendingData;
- (BOOL)showSeparators;
- (HKCurrentValueViewDataSource)initWithDateCache:(id)a3 healthStore:(id)a4 selectedRangeFormatter:(id)a5;
- (HKCurrentValueViewDataSourceDelegate)delegate;
- (HKDateCache)dateCache;
- (HKDisplayType)displayType;
- (HKHealthStore)healthStore;
- (HKSelectedRangeFormatter)selectedRangeFormatter;
- (NSArray)selectedRangeData;
- (NSMutableArray)annotationLabels;
- (NSString)dateIntervalString;
- (UIColor)titleColor;
- (UIColor)valueColor;
- (UIFont)majorFont;
- (UIFont)minorFont;
- (UILabel)dateLabelView;
- (id)_dateIntervalStringForGraphView:(id)a3 timeScope:(int64_t)a4;
- (id)_delegateTitleForSelectedRangeData:(id)a3 displayType:(id)a4;
- (id)_delegateValueForSelectedRangeData:(id)a3;
- (id)_delegateValueStringForGraphView:(id)a3 timeScope:(int64_t)a4;
- (id)dateViewWithOrientation:(int64_t)a3;
- (id)leftMarginViewWithOrientation:(int64_t)a3;
- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4;
- (int64_t)numberOfValuesForAnnotationView:(id)a3;
- (void)_updateAnnotationLabels:(id)a3 fromRangeData:(id)a4 displayType:(id)a5;
- (void)setAnnotationLabels:(id)a3;
- (void)setDateCache:(id)a3;
- (void)setDateIntervalString:(id)a3;
- (void)setDateLabelView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayType:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setMajorFont:(id)a3;
- (void)setMinorFont:(id)a3;
- (void)setPendingData:(BOOL)a3;
- (void)setSelectedRangeData:(id)a3;
- (void)setSelectedRangeFormatter:(id)a3;
- (void)setTitleColor:(id)a3;
- (void)setValueColor:(id)a3;
- (void)updateDataSourceWithGraphView:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5;
@end

@implementation HKCurrentValueViewDataSource

- (HKCurrentValueViewDataSource)initWithDateCache:(id)a3 healthStore:(id)a4 selectedRangeFormatter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HKCurrentValueViewDataSource;
  v12 = [(HKCurrentValueViewDataSource *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_selectedRangeFormatter, a5);
    objc_storeStrong((id *)&v13->_dateCache, a3);
    objc_storeStrong((id *)&v13->_healthStore, a4);
    v13->_pendingData = 0;
    v14 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueValueFont");
    [(HKCurrentValueViewDataSource *)v13 setMajorFont:v14];

    v15 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueUnitFont");
    [(HKCurrentValueViewDataSource *)v13 setMinorFont:v15];

    id v16 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [(HKCurrentValueViewDataSource *)v13 setDateLabelView:v16];

    v17 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueDateFont");
    v18 = [(HKCurrentValueViewDataSource *)v13 dateLabelView];
    [v18 setFont:v17];

    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(HKCurrentValueViewDataSource *)v13 setAnnotationLabels:v19];
  }
  return v13;
}

- (void)updateDataSourceWithGraphView:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  [(HKCurrentValueViewDataSource *)self setDisplayType:v8];
  id v10 = [(HKCurrentValueViewDataSource *)self _dateIntervalStringForGraphView:v9 timeScope:a5];
  [(HKCurrentValueViewDataSource *)self setDateIntervalString:v10];

  id v11 = [(HKCurrentValueViewDataSource *)self selectedRangeFormatter];
  v12 = [(HKCurrentValueViewDataSource *)self majorFont];
  v13 = [(HKCurrentValueViewDataSource *)self minorFont];
  v14 = [v11 selectedRangeDataWithGraphView:v9 majorFont:v12 minorFont:v13 displayType:v8 timeScope:a5 context:1];
  [(HKCurrentValueViewDataSource *)self setSelectedRangeData:v14];

  BOOL v15 = [(HKCurrentValueViewDataSource *)self _pendingDataForGraphView:v9];
  [(HKCurrentValueViewDataSource *)self setPendingData:v15];
  id v16 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopLabelColor");
  [(HKCurrentValueViewDataSource *)self setTitleColor:v16];

  v17 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopValueColor");
  [(HKCurrentValueViewDataSource *)self setValueColor:v17];

  id v19 = [(HKCurrentValueViewDataSource *)self annotationLabels];
  v18 = [(HKCurrentValueViewDataSource *)self selectedRangeData];
  [(HKCurrentValueViewDataSource *)self _updateAnnotationLabels:v19 fromRangeData:v18 displayType:v8];
}

- (id)_dateIntervalStringForGraphView:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  v7 = [(HKCurrentValueViewDataSource *)self _delegateValueStringForGraphView:v6 timeScope:a4];
  id v8 = v7;
  if (!v7)
  {
    id v9 = [v6 effectiveVisibleRangeActive];
    id v8 = +[HKCurrentValueViewDataSource defaultStringForValueRange:v9 timeScope:a4];

    if (v8) {
      v7 = v8;
    }
    else {
      v7 = &stru_1F3B9CF20;
    }
  }
  id v10 = v7;

  return v10;
}

- (id)_delegateValueStringForGraphView:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  v7 = [(HKCurrentValueViewDataSource *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(HKCurrentValueViewDataSource *)self delegate];
    id v10 = [v6 effectiveVisibleRangeActive];
    id v11 = [v9 stringForValueRange:v10 timeScope:a4];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)_pendingDataForGraphView:(id)a3
{
  id v5 = a3;
  id v6 = [v5 primarySeries];
  v7 = [v5 actualVisibleRange];
  char v8 = 0;
  if (v7 && v6)
  {
    uint64_t v9 = objc_msgSend(v6, "resolutionForTimeScope:traitResolution:", objc_msgSend(v5, "xAxisDateZoom"), objc_msgSend(v5, "resolutionFromTraitCollectionAttributes"));
    long long v27 = 0uLL;
    uint64_t v28 = 0;
    id v10 = [v6 dataSource];
    id v11 = [v7 minValue];
    uint64_t v12 = [v5 xAxisDateZoom];
    if (v10)
    {
      [v10 blockPathForX:v11 zoom:v12 resolution:v9];
    }
    else
    {
      long long v27 = 0uLL;
      uint64_t v28 = 0;
    }

    long long v25 = 0uLL;
    uint64_t v26 = 0;
    v13 = [v6 dataSource];
    v14 = [v7 maxValue];
    uint64_t v15 = [v5 xAxisDateZoom];
    if (v13)
    {
      [v13 blockPathForX:v14 zoom:v15 resolution:v9];
    }
    else
    {
      long long v25 = 0uLL;
      uint64_t v26 = 0;
    }

    uint64_t v16 = v27;
    uint64_t v17 = v25;
    if ((uint64_t)v27 > (uint64_t)v25)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2 object:self file:@"HKCurrentValueViewDataSource.m" lineNumber:101 description:@"Visible block start should not be greater than visible block end"];

      uint64_t v16 = v27;
      uint64_t v17 = v25;
    }
    *(void *)&long long v27 = v16 - 1;
    *(void *)&long long v25 = v17 + 1;
    v18 = [v6 dataSource];
    long long v23 = v27;
    uint64_t v24 = v28;
    long long v21 = v25;
    uint64_t v22 = v26;
    char v8 = [v18 hasPendingQueriesBetweenStartPath:&v23 endPath:&v21];
  }
  return v8;
}

- (void)_updateAnnotationLabels:(id)a3 fromRangeData:(id)a4 displayType:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v29 = a5;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v9;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    unint64_t v12 = 0;
    uint64_t v28 = *(void *)v31;
    double v13 = *MEMORY[0x1E4F1DB28];
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (v12 >= [v8 count])
        {
          id v19 = -[HKInteractiveChartAnnotationViewKeyValueLabel initWithFrame:]([HKInteractiveChartAnnotationViewKeyValueLabel alloc], "initWithFrame:", v13, v14, v15, v16);
          [v8 addObject:v19];
        }
        else
        {
          id v19 = [v8 objectAtIndexedSubscript:v12];
        }
        v20 = [(HKCurrentValueViewDataSource *)self _delegateTitleForSelectedRangeData:v18 displayType:v29];
        long long v21 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)v19 keyLabel];
        uint64_t v22 = v21;
        if (v20) {
          [v21 setAttributedText:v20];
        }
        else {
          [v21 setSelectedRangeData:v18];
        }

        long long v23 = [(HKCurrentValueViewDataSource *)self _delegateValueForSelectedRangeData:v18];
        uint64_t v24 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)v19 valueLabel];
        long long v25 = v24;
        if (v23)
        {
          [v24 setAttributedText:v23];
        }
        else
        {
          uint64_t v26 = [v18 attributedString];
          [v25 setAttributedText:v26];
        }
        ++v12;
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v11);
    if (v12 < [v8 count]) {
      objc_msgSend(v8, "removeObjectsInRange:", v12, objc_msgSend(v8, "count") - v12);
    }
  }
  else
  {
    [v8 removeAllObjects];
  }
}

- (id)_delegateTitleForSelectedRangeData:(id)a3 displayType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HKCurrentValueViewDataSource *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [(HKCurrentValueViewDataSource *)self delegate];
    uint64_t v11 = [v10 titleForSelectedRangeData:v6 displayType:v7];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)_delegateValueForSelectedRangeData:(id)a3
{
  id v4 = a3;
  id v5 = [(HKCurrentValueViewDataSource *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(HKCurrentValueViewDataSource *)self delegate];
    id v8 = [v7 valueForSelectedRangeData:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)defaultStringForValueRange:(id)a3 timeScope:(int64_t)a4
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_dateIntervalWithValueRange:", a3);
  if (v5)
  {
    if (a4 == 6) {
      objc_msgSend(MEMORY[0x1E4F28C20], "hk_hourDateIntervalFormatter");
    }
    else {
    id v7 = objc_msgSend(MEMORY[0x1E4F28C20], "hk_dayIntervalFormatter");
    }
    char v6 = [v7 stringFromDateInterval:v5];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)dateViewWithOrientation:(int64_t)a3
{
  id v4 = [(HKCurrentValueViewDataSource *)self titleColor];
  id v5 = [(HKCurrentValueViewDataSource *)self dateLabelView];
  [v5 setTextColor:v4];

  char v6 = [(HKCurrentValueViewDataSource *)self dateIntervalString];
  id v7 = [(HKCurrentValueViewDataSource *)self dateLabelView];
  [v7 setText:v6];

  return [(HKCurrentValueViewDataSource *)self dateLabelView];
}

- (id)leftMarginViewWithOrientation:(int64_t)a3
{
  return 0;
}

- (int64_t)numberOfValuesForAnnotationView:(id)a3
{
  v3 = [(HKCurrentValueViewDataSource *)self annotationLabels];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4
{
  if (a3 < 0
    || ([(HKCurrentValueViewDataSource *)self annotationLabels],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 count],
        v7,
        v8 <= a3))
  {
    char v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"HKCurrentValueViewDataSource.m" lineNumber:193 description:@"Inconsistent current value view columns"];
  }
  uint64_t v10 = [(HKCurrentValueViewDataSource *)self annotationLabels];
  uint64_t v11 = [v10 objectAtIndexedSubscript:a3];

  return v11;
}

- (BOOL)showSeparators
{
  return 0;
}

- (NSArray)selectedRangeData
{
  return self->_selectedRangeData;
}

- (void)setSelectedRangeData:(id)a3
{
}

- (HKCurrentValueViewDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKCurrentValueViewDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
}

- (BOOL)pendingData
{
  return self->_pendingData;
}

- (void)setPendingData:(BOOL)a3
{
  self->_pendingData = a3;
}

- (HKSelectedRangeFormatter)selectedRangeFormatter
{
  return self->_selectedRangeFormatter;
}

- (void)setSelectedRangeFormatter:(id)a3
{
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (void)setDateCache:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
}

- (NSString)dateIntervalString
{
  return self->_dateIntervalString;
}

- (void)setDateIntervalString:(id)a3
{
}

- (UIColor)valueColor
{
  return self->_valueColor;
}

- (void)setValueColor:(id)a3
{
}

- (UIFont)majorFont
{
  return self->_majorFont;
}

- (void)setMajorFont:(id)a3
{
}

- (UIFont)minorFont
{
  return self->_minorFont;
}

- (void)setMinorFont:(id)a3
{
}

- (UILabel)dateLabelView
{
  return self->_dateLabelView;
}

- (void)setDateLabelView:(id)a3
{
}

- (NSMutableArray)annotationLabels
{
  return self->_annotationLabels;
}

- (void)setAnnotationLabels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationLabels, 0);
  objc_storeStrong((id *)&self->_dateLabelView, 0);
  objc_storeStrong((id *)&self->_minorFont, 0);
  objc_storeStrong((id *)&self->_majorFont, 0);
  objc_storeStrong((id *)&self->_valueColor, 0);
  objc_storeStrong((id *)&self->_dateIntervalString, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_selectedRangeFormatter, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedRangeData, 0);
}

@end