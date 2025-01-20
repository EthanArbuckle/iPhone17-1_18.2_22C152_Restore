@interface HKHistogramChartDataSource
+ (id)_daysInWeekXValueRange;
+ (id)_hoursInDayXValueRange;
- (HKGraphSeriesDataBlock)dataBlock;
- (HKGraphSeriesDataBlockPath)blockPathForX:(SEL)a3 zoom:(id)a4 resolution:(int64_t)a5;
- (HKHealthStore)healthStore;
- (HKHistogramChartDataSource)initWithQuantityTypeIdentifier:(id)a3 healthStore:(id)a4 unitPreferenceController:(id)a5 predicate:(id)a6 yAxisRange:(id)a7 binCalculation:(unint64_t)a8 dateBasedBinModeConfig:(unint64_t)a9;
- (HKHistogramChartDataSource)initWithQuantityTypeIdentifier:(id)a3 healthStore:(id)a4 unitPreferenceController:(id)a5 predicate:(id)a6 yAxisRange:(id)a7 binWidth:(double)a8;
- (HKHistogramChartDataSourceDataFetchObserver)fetchObserver;
- (HKQuantitySample)maximumSample;
- (HKQuantitySample)minimumSample;
- (HKQuantityType)quantityType;
- (HKUnit)unit;
- (HKUnitPreferenceController)unitPreferenceController;
- (HKValueRange)xAxisRange;
- (HKValueRange)yAxisRange;
- (NSArray)quantityValueRanges;
- (NSArray)sortDescriptors;
- (NSDate)samplesEndDate;
- (NSDate)samplesStartDate;
- (NSPredicate)predicate;
- (NSString)quantityIdentifier;
- (id)_buildQuantityValueRangesFromSortedSamples:(id)a3;
- (id)_dateBasedXValueRangeForConfig:(unint64_t)a3;
- (id)_dayNameFormatter;
- (id)_dayNameFromDayIndex:(unint64_t)a3;
- (id)_dayXAxisStringForLocation:(id)a3;
- (id)_daysOfTheWeek;
- (id)_displayType;
- (id)_hourNameFromHourIndex:(unint64_t)a3;
- (id)_hourOfTheDayFormatter;
- (id)_hourXAxisStringForLocation:(id)a3;
- (id)_initWithQuantityTypeIdentifier:(id)a3 healthStore:(id)a4 unitPreferenceController:(id)a5 predicate:(id)a6 xAxisRange:(id)a7 yAxisRange:(id)a8 binMode:(unint64_t)a9 binCalculation:(unint64_t)a10 binWidth:(double)a11 numberOfBins:(unint64_t)a12 dateBasedBinModeConfig:(unint64_t)a13;
- (id)_query;
- (id)_samplesSortedByQuantity:(id)a3;
- (id)buildBinsWithSamples:(id)a3;
- (id)buildGraphSeriesDataBlockFromSamples:(id)a3;
- (id)buildGraphSeriesDataBlockWithCalculatedBinValues:(id)a3;
- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4;
- (id)calculateBinValueForBins:(id)a3 usingCalculation:(unint64_t)a4;
- (id)dataBlockBuilder;
- (id)xAxisStringForLocation;
- (id)xAxisStringForLocation:(id)a3;
- (unint64_t)_binIndexForSample:(id)a3;
- (unint64_t)_dateBasedBinIndexForSample:(id)a3;
- (unint64_t)_dayIndexForDayName:(id)a3;
- (unint64_t)_normalBinIndexForSample:(id)a3;
- (unint64_t)binCalculation;
- (unint64_t)binWidth;
- (unint64_t)binningMode;
- (unint64_t)dateBasedBinModeConfig;
- (unint64_t)numberOfBins;
- (unsigned)didExecuteQuery;
- (void)didCompleteFetch;
- (void)fetchData;
- (void)setBinCalculation:(unint64_t)a3;
- (void)setBinWidth:(unint64_t)a3;
- (void)setBinningMode:(unint64_t)a3;
- (void)setDataBlock:(id)a3;
- (void)setDataBlockBuilder:(id)a3;
- (void)setDateBasedBinModeConfig:(unint64_t)a3;
- (void)setDidExecuteQuery:(unsigned __int8)a3;
- (void)setFetchObserver:(id)a3;
- (void)setMaximumSample:(id)a3;
- (void)setMinimumSample:(id)a3;
- (void)setNumberOfBins:(unint64_t)a3;
- (void)setQuantityValueRanges:(id)a3;
- (void)setSamplesEndDate:(id)a3;
- (void)setSamplesStartDate:(id)a3;
- (void)setXAxisStringForLocation:(id)a3;
@end

@implementation HKHistogramChartDataSource

- (id)_initWithQuantityTypeIdentifier:(id)a3 healthStore:(id)a4 unitPreferenceController:(id)a5 predicate:(id)a6 xAxisRange:(id)a7 yAxisRange:(id)a8 binMode:(unint64_t)a9 binCalculation:(unint64_t)a10 binWidth:(double)a11 numberOfBins:(unint64_t)a12 dateBasedBinModeConfig:(unint64_t)a13
{
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  id v30 = a6;
  id v29 = a7;
  id v28 = a8;
  v31.receiver = self;
  v31.super_class = (Class)HKHistogramChartDataSource;
  v24 = [(HKGraphSeriesDataSource *)&v31 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_quantityIdentifier, a3);
    objc_storeStrong((id *)&v25->_healthStore, a4);
    objc_storeStrong((id *)&v25->_unitPreferenceController, a5);
    objc_storeStrong((id *)&v25->_predicate, a6);
    objc_storeStrong((id *)&v25->_xAxisRange, a7);
    objc_storeStrong((id *)&v25->_yAxisRange, a8);
    v25->_binningMode = a9;
    v25->_binCalculation = a10;
    v25->_binWidth = (unint64_t)a11;
    v25->_numberOfBins = a12;
    v25->_dateBasedBinModeConfig = a13;
    v25->_didExecuteQuery = 0;
    dataBlock = v25->_dataBlock;
    v25->_dataBlock = 0;
  }
  return v25;
}

- (HKHistogramChartDataSource)initWithQuantityTypeIdentifier:(id)a3 healthStore:(id)a4 unitPreferenceController:(id)a5 predicate:(id)a6 yAxisRange:(id)a7 binWidth:(double)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = +[HKValueRange valueRangeWithMinValue:&unk_1F3C200E0 maxValue:&unk_1F3C200F8];
  v20 = [(HKHistogramChartDataSource *)self _initWithQuantityTypeIdentifier:v18 healthStore:v17 unitPreferenceController:v16 predicate:v15 xAxisRange:v19 yAxisRange:v14 binMode:a8 binCalculation:0 binWidth:1 numberOfBins:0 dateBasedBinModeConfig:-1];

  return v20;
}

- (HKHistogramChartDataSource)initWithQuantityTypeIdentifier:(id)a3 healthStore:(id)a4 unitPreferenceController:(id)a5 predicate:(id)a6 yAxisRange:(id)a7 binCalculation:(unint64_t)a8 dateBasedBinModeConfig:(unint64_t)a9
{
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = +[HKValueRange valueRangeWithMinValue:&unk_1F3C200E0 maxValue:&unk_1F3C200F8];
  uint64_t v21 = 24;
  if (!a9) {
    uint64_t v21 = 7;
  }
  id v22 = [(HKHistogramChartDataSource *)self _initWithQuantityTypeIdentifier:v19 healthStore:v18 unitPreferenceController:v17 predicate:v16 xAxisRange:v20 yAxisRange:v15 binMode:1.0 binCalculation:1 binWidth:a8 numberOfBins:v21 dateBasedBinModeConfig:a9];

  return v22;
}

- (HKQuantityType)quantityType
{
  v2 = (void *)MEMORY[0x1E4F2B2C0];
  v3 = [(HKHistogramChartDataSource *)self quantityIdentifier];
  v4 = [v2 quantityTypeForIdentifier:v3];

  return (HKQuantityType *)v4;
}

- (HKUnit)unit
{
  v3 = [(HKHistogramChartDataSource *)self unitPreferenceController];
  v4 = [(HKHistogramChartDataSource *)self _displayType];
  v5 = [v3 unitForDisplayType:v4];

  return (HKUnit *)v5;
}

- (NSArray)sortDescriptors
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (id)xAxisStringForLocation:(id)a3
{
  id v4 = a3;
  v5 = [(HKHistogramChartDataSource *)self xAxisStringForLocation];

  if (v5)
  {
    v6 = [(HKHistogramChartDataSource *)self xAxisStringForLocation];
    ((void (**)(void, id))v6)[2](v6, v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_3;
  }
  unint64_t v8 = [(HKHistogramChartDataSource *)self binningMode];
  if (v8 == 1)
  {
    unint64_t v15 = [(HKHistogramChartDataSource *)self dateBasedBinModeConfig];
    if (v15 == 1)
    {
      uint64_t v16 = [(HKHistogramChartDataSource *)self _hourXAxisStringForLocation:v4];
    }
    else
    {
      if (v15) {
        goto LABEL_3;
      }
      uint64_t v16 = [(HKHistogramChartDataSource *)self _dayXAxisStringForLocation:v4];
    }
    v5 = (__CFString *)v16;
  }
  else if (!v8)
  {
    uint64_t v9 = [v4 integerValue];
    if (v9 < 0
      || (unint64_t v10 = v9,
          [(HKHistogramChartDataSource *)self quantityValueRanges],
          v11 = objc_claimAutoreleasedReturnValue(),
          unint64_t v12 = [v11 count],
          v11,
          v10 >= v12))
    {
      v5 = &stru_1F3B9CF20;
    }
    else
    {
      v13 = [(HKHistogramChartDataSource *)self quantityValueRanges];
      id v14 = [v13 objectAtIndex:v10];

      objc_msgSend(NSString, "stringWithFormat:", @"%lu-%lu", objc_msgSend(v14, "firstIndex"), objc_msgSend(v14, "lastIndex"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_3:

  return v5;
}

- (void)fetchData
{
  if (![(HKHistogramChartDataSource *)self didExecuteQuery])
  {
    v3 = [(HKHistogramChartDataSource *)self healthStore];
    id v4 = [(HKHistogramChartDataSource *)self _query];
    [v3 executeQuery:v4];

    [(HKHistogramChartDataSource *)self setDidExecuteQuery:1];
  }
}

- (void)didCompleteFetch
{
  v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__HKHistogramChartDataSource_didCompleteFetch__block_invoke;
  block[3] = &unk_1E6D50ED8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __46__HKHistogramChartDataSource_didCompleteFetch__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) fetchObserver];
  [v2 didCompleteFetchForDataSource:*(void *)(a1 + 32)];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 dataSourceDidUpdateCache:*(void *)(a1 + 32)];
}

- (id)buildGraphSeriesDataBlockFromSamples:(id)a3
{
  id v5 = a3;
  v6 = [(HKHistogramChartDataSource *)self dataBlockBuilder];

  if (v6)
  {
    v7 = [(HKHistogramChartDataSource *)self dataBlockBuilder];
    unint64_t v8 = [(HKHistogramChartDataSource *)self unit];
    uint64_t v9 = ((void (**)(void, id, void *))v7)[2](v7, v5, v8);
LABEL_3:
    id v3 = (void *)v9;
LABEL_4:

    goto LABEL_5;
  }
  unint64_t v11 = [(HKHistogramChartDataSource *)self binningMode];
  if (v11 == 1)
  {
    v7 = [(HKHistogramChartDataSource *)self buildBinsWithSamples:v5];
    id v18 = [(HKHistogramChartDataSource *)self _dateBasedXValueRangeForConfig:[(HKHistogramChartDataSource *)self dateBasedBinModeConfig]];
    xAxisRange = self->_xAxisRange;
    self->_xAxisRange = v18;

    unint64_t v8 = [(HKHistogramChartDataSource *)self calculateBinValueForBins:v7 usingCalculation:[(HKHistogramChartDataSource *)self binCalculation]];
    uint64_t v9 = [(HKHistogramChartDataSource *)self buildGraphSeriesDataBlockWithCalculatedBinValues:v8];
    goto LABEL_3;
  }
  if (!v11)
  {
    v7 = [(HKHistogramChartDataSource *)self _samplesSortedByQuantity:v5];
    unint64_t v12 = [(HKHistogramChartDataSource *)self _buildQuantityValueRangesFromSortedSamples:v7];
    [(HKHistogramChartDataSource *)self setQuantityValueRanges:v12];

    v13 = [(HKHistogramChartDataSource *)self quantityValueRanges];
    -[HKHistogramChartDataSource setNumberOfBins:](self, "setNumberOfBins:", [v13 count]);

    unint64_t v8 = [(HKHistogramChartDataSource *)self buildBinsWithSamples:v7];
    id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    unint64_t v15 = +[HKValueRange valueRangeWithMinValue:&unk_1F3C20110 maxValue:v14];
    uint64_t v16 = self->_xAxisRange;
    self->_xAxisRange = v15;

    id v17 = [(HKHistogramChartDataSource *)self calculateBinValueForBins:v8 usingCalculation:0];
    id v3 = [(HKHistogramChartDataSource *)self buildGraphSeriesDataBlockWithCalculatedBinValues:v17];

    goto LABEL_4;
  }
LABEL_5:

  return v3;
}

- (id)buildBinsWithSamples:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKHistogramChartDataSource *)self numberOfBins];
  v6 = __51__HKHistogramChartDataSource_buildBinsWithSamples___block_invoke(v5, v5);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__HKHistogramChartDataSource_buildBinsWithSamples___block_invoke_2;
  v11[3] = &unk_1E6D51168;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  [v4 enumerateObjectsUsingBlock:v11];

  unint64_t v8 = v12;
  id v9 = v7;

  return v9;
}

id __51__HKHistogramChartDataSource_buildBinsWithSamples___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  for (i = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a2];
  {
    id v4 = objc_alloc_init(HKHistogramChartDataSourceBin);
    [i addObject:v4];
  }
  return i;
}

void __51__HKHistogramChartDataSource_buildBinsWithSamples___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", objc_msgSend(v3, "_binIndexForSample:", v4));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 quantity];

  v6 = [*(id *)(a1 + 32) unit];
  [v5 doubleValueForUnit:v6];
  double v8 = v7;

  id v9 = [NSNumber numberWithDouble:v8];
  [v10 addValue:v9];
}

- (id)calculateBinValueForBins:(id)a3 usingCalculation:(unint64_t)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  double v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__HKHistogramChartDataSource_calculateBinValueForBins_usingCalculation___block_invoke;
  v12[3] = &unk_1E6D51190;
  v12[4] = self;
  id v8 = v7;
  id v13 = v8;
  [v6 enumerateObjectsUsingBlock:v12];

  id v9 = v13;
  id v10 = v8;

  return v10;
}

void __72__HKHistogramChartDataSource_calculateBinValueForBins_usingCalculation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  switch([*(id *)(a1 + 32) binCalculation])
  {
    case 0:
      uint64_t v5 = *(void **)(a1 + 40);
      uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      goto LABEL_7;
    case 1:
      uint64_t v5 = *(void **)(a1 + 40);
      uint64_t v6 = [v8 sumValue];
      goto LABEL_7;
    case 2:
      uint64_t v5 = *(void **)(a1 + 40);
      uint64_t v6 = [v8 averageValue];
      goto LABEL_7;
    case 3:
      uint64_t v5 = *(void **)(a1 + 40);
      uint64_t v6 = [v8 minimumValue];
      goto LABEL_7;
    case 4:
      uint64_t v5 = *(void **)(a1 + 40);
      uint64_t v6 = [v8 maximumValue];
LABEL_7:
      double v7 = (void *)v6;
      [v5 setObject:v6 atIndexedSubscript:a3];

      break;
    default:
      break;
  }
}

- (id)buildGraphSeriesDataBlockWithCalculatedBinValues:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__HKHistogramChartDataSource_buildGraphSeriesDataBlockWithCalculatedBinValues___block_invoke;
  v9[3] = &unk_1E6D511B8;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  double v7 = objc_alloc_init(HKGraphSeriesDataBlock);
  [(HKGraphSeriesDataBlock *)v7 setChartPoints:v6];

  return v7;
}

void __79__HKHistogramChartDataSource_buildGraphSeriesDataBlockWithCalculatedBinValues___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [HKHistogramChartPoint alloc];
  double v7 = [NSNumber numberWithUnsignedInteger:a3];
  id v8 = [(HKHistogramChartPoint *)v6 initWithXValue:v7 yValue:v5];

  [*(id *)(a1 + 32) addObject:v8];
}

- (id)_buildQuantityValueRangesFromSortedSamples:(id)a3
{
  id v4 = a3;
  id v5 = [v4 firstObject];
  id v6 = [v4 lastObject];
  double v7 = NSNumber;
  id v8 = [v5 quantity];
  id v9 = [(HKHistogramChartDataSource *)self unit];
  [v8 doubleValueForUnit:v9];
  id v10 = objc_msgSend(v7, "numberWithDouble:");
  unint64_t v11 = [v10 unsignedIntegerValue];

  id v12 = NSNumber;
  id v13 = [v6 quantity];
  id v14 = [(HKHistogramChartDataSource *)self unit];
  [v13 doubleValueForUnit:v14];
  unint64_t v15 = objc_msgSend(v12, "numberWithDouble:");
  unint64_t v16 = [v15 unsignedIntegerValue];

  id v17 = [MEMORY[0x1E4F1CA48] array];
  while (v11 <= v16)
  {
    unint64_t v18 = [(HKHistogramChartDataSource *)self binWidth];
    id v19 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v11, v18);
    [v17 addObject:v19];
    v11 += [(HKHistogramChartDataSource *)self binWidth];
  }
  return v17;
}

- (id)_query
{
  id v3 = objc_alloc(MEMORY[0x1E4F2B440]);
  id v4 = [(HKHistogramChartDataSource *)self quantityType];
  id v5 = [(HKHistogramChartDataSource *)self predicate];
  id v6 = [(HKHistogramChartDataSource *)self sortDescriptors];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__HKHistogramChartDataSource__query__block_invoke;
  v9[3] = &unk_1E6D511E0;
  void v9[4] = self;
  double v7 = (void *)[v3 initWithSampleType:v4 predicate:v5 limit:0 sortDescriptors:v6 resultsHandler:v9];

  return v7;
}

uint64_t __36__HKHistogramChartDataSource__query__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 firstObject];
  id v6 = [v5 startDate];
  [*(id *)(a1 + 32) setSamplesStartDate:v6];

  double v7 = [v4 lastObject];
  id v8 = [v7 endDate];
  [*(id *)(a1 + 32) setSamplesEndDate:v8];

  id v9 = [*(id *)(a1 + 32) buildGraphSeriesDataBlockFromSamples:v4];

  [*(id *)(a1 + 32) setDataBlock:v9];
  id v10 = *(void **)(a1 + 32);
  return [v10 didCompleteFetch];
}

- (id)_samplesSortedByQuantity:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_368];
}

uint64_t __55__HKHistogramChartDataSource__samplesSortedByQuantity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 quantity];
  double v7 = [v5 quantity];
  char v8 = objc_msgSend(v6, "hk_isLessThanQuantity:", v7);

  if (v8)
  {
    uint64_t v9 = -1;
  }
  else
  {
    id v10 = [v4 quantity];
    unint64_t v11 = [v5 quantity];
    unsigned int v12 = objc_msgSend(v10, "hk_isGreaterThanQuantity:", v11);

    uint64_t v9 = v12;
  }

  return v9;
}

- (id)_displayType
{
  id v3 = +[HKDisplayTypeController sharedInstanceForHealthStore:self->_healthStore];
  id v4 = [(HKHistogramChartDataSource *)self quantityType];
  id v5 = [v3 displayTypeForObjectType:v4];

  return v5;
}

- (unint64_t)_binIndexForSample:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [(HKHistogramChartDataSource *)self binningMode];
  if (v6 == 1)
  {
    unint64_t v7 = [(HKHistogramChartDataSource *)self _dateBasedBinIndexForSample:v5];
    goto LABEL_5;
  }
  if (!v6)
  {
    unint64_t v7 = [(HKHistogramChartDataSource *)self _normalBinIndexForSample:v5];
LABEL_5:
    unint64_t v3 = v7;
  }

  return v3;
}

- (unint64_t)_normalBinIndexForSample:(id)a3
{
  id v4 = a3;
  id v5 = [v4 quantity];
  unint64_t v6 = [(HKHistogramChartDataSource *)self unit];
  [v5 doubleValueForUnit:v6];
  double v8 = v7;

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v9 = [(HKHistogramChartDataSource *)self quantityValueRanges];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__HKHistogramChartDataSource__normalBinIndexForSample___block_invoke;
  v12[3] = &unk_1E6D51228;
  v12[4] = &v13;
  void v12[5] = vcvtad_u64_f64(v8);
  [v9 enumerateObjectsUsingBlock:v12];

  unint64_t v10 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __55__HKHistogramChartDataSource__normalBinIndexForSample___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 containsIndex:*(void *)(a1 + 40)];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (HKGraphSeriesDataBlockPath)blockPathForX:(SEL)a3 zoom:(id)a4 resolution:(int64_t)a5
{
  *(_OWORD *)&retstr->index = xmmword_1E0F05380;
  retstr->resolution = 0;
  return self;
}

- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4
{
  id v6 = a4;
  if (a3->index
    || ([(HKHistogramChartDataSource *)self dataBlock],
        double v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    double v7 = objc_alloc_init(HKGraphSeriesDataBlock);
    [(HKGraphSeriesDataBlock *)v7 setChartPoints:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    double v7 = [(HKHistogramChartDataSource *)self dataBlock];
  }

  return v7;
}

- (unint64_t)_dateBasedBinIndexForSample:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [(HKHistogramChartDataSource *)self dateBasedBinModeConfig];
  if (v6 == 1)
  {
    unint64_t v11 = [(HKHistogramChartDataSource *)self _hourOfTheDayFormatter];
    unsigned int v12 = [v5 startDate];
    uint64_t v9 = [v11 stringFromDate:v12];

    uint64_t v10 = [v9 integerValue];
    goto LABEL_5;
  }
  if (!v6)
  {
    double v7 = [(HKHistogramChartDataSource *)self _dayNameFormatter];
    double v8 = [v5 startDate];
    uint64_t v9 = [v7 stringFromDate:v8];

    uint64_t v10 = [(HKHistogramChartDataSource *)self _dayIndexForDayName:v9];
LABEL_5:
    unint64_t v3 = v10;
  }
  return v3;
}

- (id)_dateBasedXValueRangeForConfig:(unint64_t)a3
{
  if (a3 == 1)
  {
    unint64_t v3 = [(id)objc_opt_class() _hoursInDayXValueRange];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    unint64_t v3 = [(id)objc_opt_class() _daysInWeekXValueRange];
  }
  a2 = v3;
LABEL_6:
  return (id)(id)a2;
}

+ (id)_hoursInDayXValueRange
{
  return +[HKValueRange valueRangeWithMinValue:&unk_1F3C20110 maxValue:&unk_1F3C20128];
}

+ (id)_daysInWeekXValueRange
{
  return +[HKValueRange valueRangeWithMinValue:&unk_1F3C20110 maxValue:&unk_1F3C20140];
}

- (id)_dayXAxisStringForLocation:(id)a3
{
  unint64_t v3 = -[HKHistogramChartDataSource _dayNameFromDayIndex:](self, "_dayNameFromDayIndex:", [a3 integerValue]);
  id v4 = [v3 substringToIndex:2];
  id v5 = v4;
  if (!v4) {
    id v4 = &stru_1F3B9CF20;
  }
  unint64_t v6 = v4;

  return v6;
}

- (id)_dayNameFormatter
{
  uint64_t v2 = (void *)_dayNameFormatter_formatter;
  if (!_dayNameFormatter_formatter)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v4 = (void *)_dayNameFormatter_formatter;
    _dayNameFormatter_formatter = (uint64_t)v3;

    [(id)_dayNameFormatter_formatter setDateFormat:@"EEEE"];
    uint64_t v2 = (void *)_dayNameFormatter_formatter;
  }
  return v2;
}

- (id)_daysOfTheWeek
{
  uint64_t v2 = (void *)_daysOfTheWeek_daysOfTheWeek;
  if (!_daysOfTheWeek_daysOfTheWeek)
  {
    _daysOfTheWeek_daysOfTheWeek = (uint64_t)&unk_1F3C1F0F0;

    uint64_t v2 = &unk_1F3C1F0F0;
  }
  return v2;
}

- (unint64_t)_dayIndexForDayName:(id)a3
{
  id v4 = a3;
  id v5 = [(HKHistogramChartDataSource *)self _daysOfTheWeek];
  unint64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (id)_dayNameFromDayIndex:(unint64_t)a3
{
  id v5 = [(HKHistogramChartDataSource *)self _daysOfTheWeek];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    double v8 = 0;
  }
  else
  {
    double v7 = [(HKHistogramChartDataSource *)self _daysOfTheWeek];
    double v8 = [v7 objectAtIndex:a3];
  }
  return v8;
}

- (id)_hourXAxisStringForLocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 integerValue];
  if (v5 < 0)
  {
    double v8 = 0;
  }
  else
  {
    unint64_t v6 = v5;
    unint64_t v7 = [(HKHistogramChartDataSource *)self numberOfBins];
    double v8 = 0;
    if ((v6 & 3) == 0 && v6 < v7)
    {
      double v8 = [v4 stringValue];
    }
  }

  return v8;
}

- (id)_hourOfTheDayFormatter
{
  uint64_t v2 = (void *)_hourOfTheDayFormatter_formatter;
  if (!_hourOfTheDayFormatter_formatter)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v4 = (void *)_hourOfTheDayFormatter_formatter;
    _hourOfTheDayFormatter_formatter = (uint64_t)v3;

    [(id)_hourOfTheDayFormatter_formatter setDateFormat:@"HH"];
    uint64_t v2 = (void *)_hourOfTheDayFormatter_formatter;
  }
  return v2;
}

- (id)_hourNameFromHourIndex:(unint64_t)a3
{
  id v3 = 0;
  if (a3 <= 0x17 && (a3 & 3) == 0)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    id v3 = [v4 stringValue];
  }
  return v3;
}

- (HKHistogramChartDataSourceDataFetchObserver)fetchObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fetchObserver);
  return (HKHistogramChartDataSourceDataFetchObserver *)WeakRetained;
}

- (void)setFetchObserver:(id)a3
{
}

- (unint64_t)binningMode
{
  return self->_binningMode;
}

- (void)setBinningMode:(unint64_t)a3
{
  self->_binningMode = a3;
}

- (unint64_t)binCalculation
{
  return self->_binCalculation;
}

- (void)setBinCalculation:(unint64_t)a3
{
  self->_binCalculation = a3;
}

- (unint64_t)dateBasedBinModeConfig
{
  return self->_dateBasedBinModeConfig;
}

- (void)setDateBasedBinModeConfig:(unint64_t)a3
{
  self->_dateBasedBinModeConfig = a3;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (NSString)quantityIdentifier
{
  return self->_quantityIdentifier;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (HKGraphSeriesDataBlock)dataBlock
{
  return self->_dataBlock;
}

- (void)setDataBlock:(id)a3
{
}

- (NSDate)samplesStartDate
{
  return self->_samplesStartDate;
}

- (void)setSamplesStartDate:(id)a3
{
}

- (NSDate)samplesEndDate
{
  return self->_samplesEndDate;
}

- (void)setSamplesEndDate:(id)a3
{
}

- (HKValueRange)xAxisRange
{
  return self->_xAxisRange;
}

- (HKValueRange)yAxisRange
{
  return self->_yAxisRange;
}

- (unint64_t)numberOfBins
{
  return self->_numberOfBins;
}

- (void)setNumberOfBins:(unint64_t)a3
{
  self->_numberOfBins = a3;
}

- (unint64_t)binWidth
{
  return self->_binWidth;
}

- (void)setBinWidth:(unint64_t)a3
{
  self->_binWidth = a3;
}

- (id)dataBlockBuilder
{
  return self->_dataBlockBuilder;
}

- (void)setDataBlockBuilder:(id)a3
{
}

- (id)xAxisStringForLocation
{
  return self->_xAxisStringForLocation;
}

- (void)setXAxisStringForLocation:(id)a3
{
}

- (unsigned)didExecuteQuery
{
  return self->_didExecuteQuery;
}

- (void)setDidExecuteQuery:(unsigned __int8)a3
{
  self->_didExecuteQuery = a3;
}

- (HKQuantitySample)minimumSample
{
  return self->_minimumSample;
}

- (void)setMinimumSample:(id)a3
{
}

- (HKQuantitySample)maximumSample
{
  return self->_maximumSample;
}

- (void)setMaximumSample:(id)a3
{
}

- (NSArray)quantityValueRanges
{
  return self->_quantityValueRanges;
}

- (void)setQuantityValueRanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantityValueRanges, 0);
  objc_storeStrong((id *)&self->_maximumSample, 0);
  objc_storeStrong((id *)&self->_minimumSample, 0);
  objc_storeStrong(&self->_xAxisStringForLocation, 0);
  objc_storeStrong(&self->_dataBlockBuilder, 0);
  objc_storeStrong((id *)&self->_yAxisRange, 0);
  objc_storeStrong((id *)&self->_xAxisRange, 0);
  objc_storeStrong((id *)&self->_samplesEndDate, 0);
  objc_storeStrong((id *)&self->_samplesStartDate, 0);
  objc_storeStrong((id *)&self->_dataBlock, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_quantityIdentifier, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_destroyWeak((id *)&self->_fetchObserver);
}

@end