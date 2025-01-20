@interface HKHistogramAnnotationViewDataSource
- (BOOL)showSeparators;
- (HKHistogramAnnotationViewDataSource)initWithFormatter:(id)a3;
- (HKInteractiveChartDataFormatter)formatter;
- (NSMutableArray)keyValuePairs;
- (id)dateViewWithOrientation:(int64_t)a3;
- (id)leftMarginViewWithOrientation:(int64_t)a3;
- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4;
- (int64_t)numberOfValuesForAnnotationView:(id)a3;
- (void)setKeyValuePairs:(id)a3;
- (void)updateWithPointSelectionContexts:(id)a3;
@end

@implementation HKHistogramAnnotationViewDataSource

- (HKHistogramAnnotationViewDataSource)initWithFormatter:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKHistogramAnnotationViewDataSource;
  v6 = [(HKHistogramAnnotationViewDataSource *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_formatter, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    keyValuePairs = v7->_keyValuePairs;
    v7->_keyValuePairs = v8;
  }
  return v7;
}

- (void)updateWithPointSelectionContexts:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HKHistogramAnnotationViewDataSource *)self keyValuePairs];
  [v5 removeAllObjects];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v32;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v31 + 1) + 8 * v11) userInfo];
        [v6 addObjectsFromArray:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v9);
  }
  v26 = v7;

  v13 = [(HKHistogramAnnotationViewDataSource *)self formatter];
  v14 = [v13 formattedSelectedRangeLabelDataWithChartData:v6 context:0];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v28;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v27 + 1) + 8 * v19);
        v21 = objc_alloc_init(HKInteractiveChartAnnotationViewKeyValueLabel);
        v22 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)v21 keyLabel];
        [v22 setSelectedRangeData:v20];

        v23 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)v21 valueLabel];
        v24 = [v20 attributedString];
        [v23 setAttributedText:v24];

        v25 = [(HKHistogramAnnotationViewDataSource *)self keyValuePairs];
        [v25 addObject:v21];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v17);
  }
}

- (id)dateViewWithOrientation:(int64_t)a3
{
  return 0;
}

- (id)leftMarginViewWithOrientation:(int64_t)a3
{
  return 0;
}

- (int64_t)numberOfValuesForAnnotationView:(id)a3
{
  v3 = [(HKHistogramAnnotationViewDataSource *)self keyValuePairs];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4
{
  id v6 = [(HKHistogramAnnotationViewDataSource *)self keyValuePairs];
  id v7 = [v6 objectAtIndexedSubscript:a3];

  if (a4)
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 1;
  }
  [v7 setOrientation:v8];
LABEL_6:
  return v7;
}

- (BOOL)showSeparators
{
  return 0;
}

- (HKInteractiveChartDataFormatter)formatter
{
  return self->_formatter;
}

- (NSMutableArray)keyValuePairs
{
  return self->_keyValuePairs;
}

- (void)setKeyValuePairs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValuePairs, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end