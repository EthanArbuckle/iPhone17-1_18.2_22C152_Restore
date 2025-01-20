@interface _HKSleepDurationAverageFormatter
- (NSArray)rangeDataForTimeAsleepAverage;
- (NSArray)rangeDataForTimeInBedAverage;
- (_HKSleepDurationAverageFormatter)init;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
- (void)_setRangeData:(id)a3 isTimeInBed:(BOOL)a4;
- (void)setCurrentVisibleAverageNumber:(id)a3 isTimeInBed:(BOOL)a4 isHighlighted:(BOOL)a5 useAverageCopy:(BOOL)a6;
- (void)setRangeDataForTimeAsleepAverage:(id)a3;
- (void)setRangeDataForTimeInBedAverage:(id)a3;
@end

@implementation _HKSleepDurationAverageFormatter

- (_HKSleepDurationAverageFormatter)init
{
  v8.receiver = self;
  v8.super_class = (Class)_HKSleepDurationAverageFormatter;
  v2 = [(_HKSleepDurationAverageFormatter *)&v8 init];
  v3 = v2;
  if (v2)
  {
    rangeDataForTimeInBedAverage = v2->_rangeDataForTimeInBedAverage;
    v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_rangeDataForTimeInBedAverage = (NSArray *)MEMORY[0x1E4F1CBF0];

    rangeDataForTimeAsleepAverage = v3->_rangeDataForTimeAsleepAverage;
    v3->_rangeDataForTimeAsleepAverage = v5;
  }
  return v3;
}

- (void)setCurrentVisibleAverageNumber:(id)a3 isTimeInBed:(BOOL)a4 isHighlighted:(BOOL)a5 useAverageCopy:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  v21[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (v10)
  {
    if (v6) {
      uint64_t v11 = 3;
    }
    else {
      uint64_t v11 = 0;
    }
    v12 = [[HKSelectedRangeData alloc] initWithStatisticsType:v11];
    v13 = v12;
    if (v8) {
      uint64_t v14 = 9;
    }
    else {
      uint64_t v14 = 10;
    }
    [(HKSelectedRangeData *)v12 setDataType:v14];
    v15 = [(HKInteractiveChartDataFormatter *)self majorFont];
    v16 = [(HKInteractiveChartDataFormatter *)self minorFont];
    v17 = HKTimePeriodStringWithFonts(v15, v16, v10, 0x1CuLL);

    [(HKSelectedRangeData *)v13 setAttributedString:v17];
    [(HKSelectedRangeData *)v13 setValueAsNumber:v10];
    uint64_t v18 = 0;
    if (!v8) {
      uint64_t v18 = _HKCategoryValueSleepAnalysisDefaultAsleepValue();
    }
    if (a5) {
      objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepColorForSleepAnalysis:", v18);
    }
    else {
    v19 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepInactiveColorForSleepAnalysis:", v18);
    }
    [(HKSelectedRangeData *)v13 setPrefixColor:v19];

    v21[0] = v13;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [(_HKSleepDurationAverageFormatter *)self _setRangeData:v20 isTimeInBed:v8];
  }
  else
  {
    [(_HKSleepDurationAverageFormatter *)self _setRangeData:MEMORY[0x1E4F1CBF0] isTimeInBed:v8];
  }
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  v5 = [a3 lastObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ([v5 annotationOptions] & 2) != 0)
  {
    uint64_t v6 = [(_HKSleepDurationAverageFormatter *)self rangeDataForTimeAsleepAverage];
  }
  else
  {
    uint64_t v6 = [(_HKSleepDurationAverageFormatter *)self rangeDataForTimeInBedAverage];
  }
  v7 = (void *)v6;

  return v7;
}

- (void)_setRangeData:(id)a3 isTimeInBed:(BOOL)a4
{
  if (a4) {
    [(_HKSleepDurationAverageFormatter *)self setRangeDataForTimeInBedAverage:a3];
  }
  else {
    [(_HKSleepDurationAverageFormatter *)self setRangeDataForTimeAsleepAverage:a3];
  }
}

- (NSArray)rangeDataForTimeInBedAverage
{
  return self->_rangeDataForTimeInBedAverage;
}

- (void)setRangeDataForTimeInBedAverage:(id)a3
{
}

- (NSArray)rangeDataForTimeAsleepAverage
{
  return self->_rangeDataForTimeAsleepAverage;
}

- (void)setRangeDataForTimeAsleepAverage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangeDataForTimeAsleepAverage, 0);
  objc_storeStrong((id *)&self->_rangeDataForTimeInBedAverage, 0);
}

@end