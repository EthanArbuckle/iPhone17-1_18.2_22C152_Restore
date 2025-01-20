@interface AXMDataSummary
- (AXMChartDescriptor)chartDescriptor;
- (AXMDataRegressionModel)regressionModel;
- (AXMDataSeriesDescriptor)series;
- (AXMDataSummary)initWithSeries:(id)a3 chartDescriptor:(id)a4;
- (AXMDataSummaryCategoryNameProvider)categoryNameDelegate;
- (NSArray)axisTitles;
- (NSArray)dataFeatureDescriptions;
- (NSArray)outliers;
- (NSArray)residuals;
- (NSArray)statsDescriptions;
- (NSArray)xValues;
- (NSArray)yValues;
- (NSNumberFormatter)numberFormatter;
- (NSString)bestFitCurveEquation;
- (NSString)confidenceDescription;
- (NSString)maxValueDescription;
- (NSString)meanValueDescription;
- (NSString)medianValueDescription;
- (NSString)minValueDescription;
- (NSString)modelDescription;
- (NSString)outliersDescription;
- (NSString)slopeDescription;
- (double)covariance;
- (double)getMean:(id)a3;
- (double)getMedian:(id)a3;
- (double)getVariance:(id)a3;
- (double)intercept;
- (double)maxX;
- (double)maxY;
- (double)meanX;
- (double)meanY;
- (double)minX;
- (double)minY;
- (double)positionForXAxisValue:(double)a3;
- (double)positionForYAxisValue:(double)a3;
- (double)r;
- (double)rSquared;
- (double)slope;
- (double)varianceX;
- (double)varianceY;
- (id)description;
- (id)stringForComponents:(id)a3;
- (unint64_t)numValues;
- (void)compute;
- (void)computeCovariance;
- (void)computeLinearRegression;
- (void)computeMeans;
- (void)computeOutliers;
- (void)computeR;
- (void)computeRanges;
- (void)computeRegressionModel:(id)a3;
- (void)computeResiduals;
- (void)computeVariances;
- (void)getValues:(double *)a3 fromNSNumberArray:(id)a4;
- (void)setAxisTitles:(id)a3;
- (void)setCategoryNameDelegate:(id)a3;
- (void)setChartDescriptor:(id)a3;
- (void)setDataFeatureDescriptions:(id)a3;
- (void)setNumValues:(unint64_t)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setRegressionModel:(id)a3;
- (void)setSeries:(id)a3;
- (void)setStatsDescriptions:(id)a3;
- (void)setXValues:(id)a3;
- (void)setYValues:(id)a3;
@end

@implementation AXMDataSummary

- (AXMDataSummary)initWithSeries:(id)a3 chartDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)AXMDataSummary;
  v8 = [(AXMDataSummary *)&v30 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_chartDescriptor, v7);
    objc_storeWeak((id *)&v9->_series, v6);
    v10 = [v6 xValues];
    uint64_t v11 = [v6 numericalValuesFromDataPointValues:v10];
    xValues = v9->_xValues;
    v9->_xValues = (NSArray *)v11;

    v13 = [v6 yValues];
    uint64_t v14 = [v6 numericalValuesFromDataPointValues:v13];
    yValues = v9->_yValues;
    v9->_yValues = (NSArray *)v14;

    v9->_numValues = [(NSArray *)v9->_xValues count];
    v28 = (void *)MEMORY[0x1E4F1C978];
    v29 = [v7 xAxis];
    v16 = [v29 title];
    v17 = [v7 yAxis];
    v18 = [v17 title];
    v19 = [v7 zNumericAxisDescriptor];
    v20 = [v19 title];
    v21 = [v7 zCategoricalAxisDescriptor];
    v22 = [v21 title];
    uint64_t v23 = objc_msgSend(v28, "axmArrayByIgnoringNilElementsWithCount:", 4, v16, v18, v20, v22);
    axisTitles = v9->_axisTitles;
    v9->_axisTitles = (NSArray *)v23;

    v25 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    numberFormatter = v9->_numberFormatter;
    v9->_numberFormatter = v25;

    [(NSNumberFormatter *)v9->_numberFormatter setMaximumSignificantDigits:4];
    [(AXMDataSummary *)v9 compute];
  }

  return v9;
}

- (void)computeRegressionModel:(id)a3
{
  id v4 = a3;
  v5 = [(AXMDataSummary *)self xValues];
  uint64_t v6 = [v5 count];
  id v7 = [(AXMDataSummary *)self yValues];
  if (v6 == [v7 count])
  {
    v8 = [(AXMDataSummary *)self xValues];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x3032000000;
      v15[3] = __Block_byref_object_copy__10;
      v15[4] = __Block_byref_object_dispose__10;
      v10 = self;
      v16 = v10;
      uint64_t v11 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__AXMDataSummary_computeRegressionModel___block_invoke;
      block[3] = &unk_1E6118490;
      uint64_t v14 = v15;
      block[4] = v10;
      id v13 = v4;
      dispatch_async(v11, block);

      _Block_object_dispose(v15, 8);
    }
  }
  else
  {
  }
}

void __41__AXMDataSummary_computeRegressionModel___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) numValues];
  MEMORY[0x1F4188790]();
  v3 = (char *)&block[-2] - v2;
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) numValues];
  MEMORY[0x1F4188790]();
  v5 = (char *)&block[-2] - v4;
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v7 = [*(id *)(a1 + 32) xValues];
  [v6 getValues:v3 fromNSNumberArray:v7];

  v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v9 = [*(id *)(a1 + 32) yValues];
  [v8 getValues:v5 fromNSNumberArray:v9];

  v10 = +[AXMDataRegressionModel getModelForX:y:n:](AXMDataRegressionModel, "getModelForX:y:n:", v3, v5, [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) numValues]);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__AXMDataSummary_computeRegressionModel___block_invoke_2;
  block[3] = &unk_1E6118490;
  id v15 = v10;
  long long v13 = *(_OWORD *)(a1 + 40);
  id v11 = (id)v13;
  long long v16 = v13;
  id v12 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __41__AXMDataSummary_computeRegressionModel___block_invoke_2(void *a1)
{
  [*(id *)(*(void *)(a1[6] + 8) + 40) setRegressionModel:a1[4]];
  uint64_t v2 = a1[5];
  if (v2)
  {
    id v3 = [*(id *)(*(void *)(a1[6] + 8) + 40) regressionModel];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)setRegressionModel:(id)a3
{
}

- (NSArray)dataFeatureDescriptions
{
  dataFeatureDescriptions = self->_dataFeatureDescriptions;
  if (!dataFeatureDescriptions)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    v5 = [(AXMDataSummary *)self slopeDescription];
    uint64_t v6 = [(AXMDataSummary *)self modelDescription];
    id v7 = [(AXMDataSummary *)self confidenceDescription];
    v8 = [(AXMDataSummary *)self outliersDescription];
    objc_msgSend(v4, "axmArrayByIgnoringNilElementsWithCount:", 4, v5, v6, v7, v8);
    uint64_t v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_dataFeatureDescriptions;
    self->_dataFeatureDescriptions = v9;

    dataFeatureDescriptions = self->_dataFeatureDescriptions;
  }

  return dataFeatureDescriptions;
}

- (NSArray)statsDescriptions
{
  statsDescriptions = self->_statsDescriptions;
  if (!statsDescriptions)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    v5 = [(AXMDataSummary *)self minValueDescription];
    uint64_t v6 = [(AXMDataSummary *)self maxValueDescription];
    id v7 = [(AXMDataSummary *)self meanValueDescription];
    v8 = [(AXMDataSummary *)self medianValueDescription];
    objc_msgSend(v4, "axmArrayByIgnoringNilElementsWithCount:", 4, v5, v6, v7, v8);
    uint64_t v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_statsDescriptions;
    self->_statsDescriptions = v9;

    statsDescriptions = self->_statsDescriptions;
  }

  return statsDescriptions;
}

- (NSString)modelDescription
{
  uint64_t v2 = [(AXMDataSummary *)self regressionModel];
  id v3 = [v2 modelDescription];

  return (NSString *)v3;
}

- (NSString)slopeDescription
{
  id v3 = [(AXMDataSummary *)self regressionModel];
  [v3 confidence];
  double v5 = v4;

  if (v5 <= 0.2)
  {
    v10 = 0;
  }
  else
  {
    double slope = self->_slope;
    id v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    v8 = v7;
    if (slope > 0.0) {
      uint64_t v9 = @"chart.series.trend.increasing";
    }
    else {
      uint64_t v9 = @"chart.series.trend.decreasing";
    }
    v10 = [v7 localizedStringForKey:v9 value:&stru_1F0E72D10 table:@"Accessibility"];
  }

  return (NSString *)v10;
}

- (NSString)confidenceDescription
{
  uint64_t v2 = [(AXMDataSummary *)self regressionModel];
  [v2 confidence];
  double v4 = v3;

  if (v4 <= 0.9)
  {
    if (v4 <= 0.7)
    {
      if (v4 <= 0.4)
      {
        double v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
        uint64_t v6 = v5;
        if (v4 <= 0.2) {
          id v7 = @"chart.series.trend.none";
        }
        else {
          id v7 = @"chart.series.trend.weak";
        }
      }
      else
      {
        double v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
        uint64_t v6 = v5;
        id v7 = @"chart.series.trend.moderate";
      }
    }
    else
    {
      double v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      uint64_t v6 = v5;
      id v7 = @"chart.series.trend.strong";
    }
  }
  else
  {
    double v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    uint64_t v6 = v5;
    id v7 = @"chart.series.trend.verystrong";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_1F0E72D10 table:@"Accessibility"];

  return (NSString *)v8;
}

- (NSString)minValueDescription
{
  yValues = self->_yValues;
  double v4 = [NSNumber numberWithDouble:self->_minY];
  uint64_t v5 = [(NSArray *)yValues indexOfObject:v4];

  uint64_t v6 = [(AXMDataSummary *)self series];
  id v7 = [v6 dataPoints];
  v8 = [v7 objectAtIndexedSubscript:v5];
  uint64_t v9 = [v8 valueDescription];

  v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  id v11 = [v10 localizedStringForKey:@"chart.series.minvalue.format" value:&stru_1F0E72D10 table:@"Accessibility"];

  id v12 = objc_msgSend(NSString, "stringWithFormat:", v11, v9);

  return (NSString *)v12;
}

- (NSString)maxValueDescription
{
  yValues = self->_yValues;
  double v4 = [NSNumber numberWithDouble:self->_maxY];
  uint64_t v5 = [(NSArray *)yValues indexOfObject:v4];

  uint64_t v6 = [(AXMDataSummary *)self series];
  id v7 = [v6 dataPoints];
  v8 = [v7 objectAtIndexedSubscript:v5];
  uint64_t v9 = [v8 valueDescription];

  v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  id v11 = [v10 localizedStringForKey:@"chart.series.maxvalue.format" value:&stru_1F0E72D10 table:@"Accessibility"];

  id v12 = objc_msgSend(NSString, "stringWithFormat:", v11, v9);

  return (NSString *)v12;
}

- (NSString)meanValueDescription
{
  double v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  double v4 = [v3 localizedStringForKey:@"chart.series.meanvalue.format" value:&stru_1F0E72D10 table:@"Accessibility"];

  uint64_t v5 = [(AXMDataSummary *)self series];
  uint64_t v6 = [v5 meanValueDescription];

  if (![v6 length])
  {
    id v7 = [(AXMDataSummary *)self numberFormatter];
    v8 = [NSNumber numberWithDouble:self->_meanY];
    uint64_t v9 = [v7 stringFromNumber:v8];

    uint64_t v6 = (void *)v9;
  }
  v10 = NSString;
  id v11 = [(NSArray *)self->_axisTitles objectAtIndexedSubscript:1];
  id v12 = objc_msgSend(v10, "stringWithFormat:", v4, v11, v6);

  return (NSString *)v12;
}

- (NSString)medianValueDescription
{
  return 0;
}

- (NSString)outliersDescription
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v22 = self;
  obj = self->_outliers;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        v8 = v3;
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = [*(id *)(*((void *)&v23 + 1) + 8 * i) unsignedIntegerValue];
        v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
        id v11 = [v10 localizedStringForKey:@"chart.series.outlier.format" value:&stru_1F0E72D10 table:@"Accessibility"];

        id v12 = NSString;
        long long v13 = [(AXMDataSummary *)v22 series];
        uint64_t v14 = [v13 dataPoints];
        id v15 = [v14 objectAtIndexedSubscript:v9];
        long long v16 = [v15 valueDescription];
        uint64_t v17 = objc_msgSend(v12, "localizedStringWithFormat:", v11, v16);

        double v3 = v8;
        [v8 addObject:v17];
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }

  if ([v3 count])
  {
    v18 = [v3 componentsJoinedByString:@"\n"];
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    v18 = [v19 localizedStringForKey:@"chart.series.outliers.none" value:&stru_1F0E72D10 table:@"Accessibility"];
  }

  return (NSString *)v18;
}

- (NSString)bestFitCurveEquation
{
  double v3 = [(AXMDataSummary *)self regressionModel];
  uint64_t v4 = [(AXMDataSummary *)self regressionModel];
  uint64_t v5 = objc_msgSend(v3, "modelFunctionStringForParameters:significantFigures:", objc_msgSend(v4, "bestFitParameters"), 4);

  return (NSString *)v5;
}

- (void)compute
{
  [(AXMDataSummary *)self computeRanges];
  [(AXMDataSummary *)self computeMeans];
  [(AXMDataSummary *)self computeCovariance];
  [(AXMDataSummary *)self computeVariances];
  [(AXMDataSummary *)self computeR];
  [(AXMDataSummary *)self computeLinearRegression];
  [(AXMDataSummary *)self computeResiduals];

  [(AXMDataSummary *)self computeOutliers];
}

- (void)computeRanges
{
  if (self->_numValues)
  {
    unint64_t v3 = 0;
    double v4 = 1.79769313e308;
    double v5 = -1.79769313e308;
    double v6 = -1.79769313e308;
    double v7 = 1.79769313e308;
    do
    {
      v8 = [(AXMDataSummary *)self xValues];
      uint64_t v9 = [v8 objectAtIndexedSubscript:v3];
      [v9 doubleValue];
      double v11 = v10;

      id v12 = [(AXMDataSummary *)self yValues];
      long long v13 = [v12 objectAtIndexedSubscript:v3];
      [v13 doubleValue];
      double v15 = v14;

      if (v11 < v7) {
        double v7 = v11;
      }
      if (v11 > v6) {
        double v6 = v11;
      }
      if (v15 < v4) {
        double v4 = v15;
      }
      if (v15 > v5) {
        double v5 = v15;
      }
      ++v3;
    }
    while (v3 < self->_numValues);
  }
  else
  {
    double v6 = -1.79769313e308;
    double v7 = 1.79769313e308;
    double v4 = 1.79769313e308;
    double v5 = -1.79769313e308;
  }
  self->_minX = v7;
  self->_maxX = v6;
  self->_minY = v4;
  self->_maxY = v5;
}

- (void)computeMeans
{
  if (self->_numValues)
  {
    unint64_t v3 = 0;
    double v4 = 0.0;
    double v5 = 0.0;
    do
    {
      double v6 = [(AXMDataSummary *)self xValues];
      double v7 = [v6 objectAtIndexedSubscript:v3];
      [v7 doubleValue];
      double v9 = v8;

      double v10 = [(AXMDataSummary *)self yValues];
      double v11 = [v10 objectAtIndexedSubscript:v3];
      [v11 doubleValue];
      double v13 = v12;

      double v4 = v4 + v9;
      double v5 = v5 + v13;
      ++v3;
      unint64_t numValues = self->_numValues;
    }
    while (v3 < numValues);
    double v15 = (double)numValues;
  }
  else
  {
    double v5 = 0.0;
    double v4 = 0.0;
    double v15 = 0.0;
  }
  self->_meanX = v4 / v15;
  self->_meanY = v5 / v15;
}

- (void)computeCovariance
{
  if (self->_numValues)
  {
    unint64_t v3 = 0;
    double v4 = 0.0;
    do
    {
      double v5 = [(AXMDataSummary *)self xValues];
      double v6 = [v5 objectAtIndexedSubscript:v3];
      [v6 doubleValue];
      double v8 = v7;

      double v9 = [(AXMDataSummary *)self yValues];
      double v10 = [v9 objectAtIndexedSubscript:v3];
      [v10 doubleValue];
      double v12 = v11;

      double v4 = v4 + (v8 - self->_meanX) * (v12 - self->_meanY);
      ++v3;
      unint64_t numValues = self->_numValues;
    }
    while (v3 < numValues);
    double v14 = v4 / (double)(numValues - 1);
  }
  else
  {
    double v14 = 0.0;
  }
  self->_covariance = v14;
}

- (void)computeVariances
{
  if (self->_numValues)
  {
    unint64_t v3 = 0;
    double v4 = 0.0;
    double v5 = 0.0;
    do
    {
      double v6 = [(AXMDataSummary *)self xValues];
      double v7 = [v6 objectAtIndexedSubscript:v3];
      [v7 doubleValue];
      double v9 = v8;

      double v10 = [(AXMDataSummary *)self yValues];
      double v11 = [v10 objectAtIndexedSubscript:v3];
      [v11 doubleValue];
      double v13 = v12;

      double v4 = v4 + (v9 - self->_meanX) * (v9 - self->_meanX);
      double v5 = v5 + (v13 - self->_meanY) * (v13 - self->_meanY);
      ++v3;
      unint64_t numValues = self->_numValues;
    }
    while (v3 < numValues);
    double v15 = (double)(numValues - 1);
  }
  else
  {
    double v5 = 0.0;
    double v15 = 1.84467441e19;
    double v4 = 0.0;
  }
  self->_varianceX = v4 / v15;
  self->_varianceY = v5 / v15;
}

- (void)computeR
{
  double v2 = self->_covariance / sqrt(self->_varianceX * self->_varianceY);
  self->_r = v2;
  self->_rSquared = v2 * v2;
}

- (void)computeLinearRegression
{
  double v2 = self->_r * sqrt(self->_varianceY) / sqrt(self->_varianceX);
  double v3 = self->_meanY - v2 * self->_meanX;
  self->_double slope = v2;
  self->_intercept = v3;
}

- (void)computeResiduals
{
  id v15 = [MEMORY[0x1E4F1CA48] array];
  if ([(NSArray *)self->_xValues count])
  {
    unint64_t v3 = 0;
    do
    {
      double v4 = [(AXMDataSummary *)self xValues];
      double v5 = [v4 objectAtIndexedSubscript:v3];
      [v5 doubleValue];
      double v7 = v6;

      double v8 = [(AXMDataSummary *)self yValues];
      double v9 = [v8 objectAtIndexedSubscript:v3];
      [v9 doubleValue];
      double v11 = v10;

      double v12 = [NSNumber numberWithDouble:v11 - (self->_intercept + self->_slope * v7)];
      [v15 addObject:v12];

      ++v3;
    }
    while (v3 < [(NSArray *)self->_xValues count]);
  }
  double v13 = (NSArray *)[v15 copy];
  residuals = self->_residuals;
  self->_residuals = v13;
}

- (void)computeOutliers
{
  id v15 = [MEMORY[0x1E4F1CA48] array];
  if (self->_numValues >= 8)
  {
    [(AXMDataSummary *)self getMean:self->_residuals];
    double v4 = v3;
    [(AXMDataSummary *)self getVariance:self->_residuals];
    double v6 = v5;
    if ([(NSArray *)self->_residuals count])
    {
      unint64_t v7 = 0;
      double v8 = sqrt(v6);
      do
      {
        double v9 = [(NSArray *)self->_residuals objectAtIndexedSubscript:v7];
        [v9 doubleValue];
        double v11 = (v10 - v4) / v8;

        if (fabs(v11) > 3.0)
        {
          double v12 = [NSNumber numberWithUnsignedInteger:v7];
          [v15 addObject:v12];
        }
        ++v7;
      }
      while (v7 < [(NSArray *)self->_residuals count]);
    }
  }
  double v13 = (NSArray *)[v15 copy];
  outliers = self->_outliers;
  self->_outliers = v13;
}

- (id)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  long long v11 = *(_OWORD *)&self->_minX;
  double minY = self->_minY;
  double maxY = self->_maxY;
  unint64_t v7 = [(AXMDataRegressionModel *)self->_regressionModel modelFunction];
  double v8 = (void *)MEMORY[0x1BA9A1340]();
  double v9 = [v3 stringWithFormat:@"<%@ %p x:[%.1f, %.1f] y:[%.1f, %.1f] model=%@ xbar=%.1f ybar=%.1f r=%.4f rSq=%.4f y=%.4fx+%.4f\n\toutliers=%@>", v4, self, v11, *(void *)&minY, *(void *)&maxY, v8, *(void *)&self->_meanX, *(void *)&self->_meanY, *(void *)&self->_r, *(void *)&self->_rSquared, *(void *)&self->_slope, *(void *)&self->_intercept, self->_outliers];

  return v9;
}

- (id)stringForComponents:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = [MEMORY[0x1E4F28E78] stringWithString:&stru_1F0E72D10];
  if (objc_opt_isKindOfClass()) {
    id v5 = v3;
  }
  else {
    id v5 = 0;
  }
  if ([v5 length]) {
    [v4 appendString:v5];
  }
  double v10 = (id *)&v12;
  while (1)
  {
    double v6 = v10++;
    id v7 = *v6;
    id v8 = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;
    if ([v8 length]) {
      break;
    }
LABEL_15:
  }
  if (([v8 isEqualToString:@"__AXMDataSummaryStringForVariablesSentinel"] & 1) == 0)
  {
    if ([v4 length]) {
      [v4 appendString:@", "];
    }
    [v4 appendString:v8];
    goto LABEL_15;
  }

  return v4;
}

- (double)getMean:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      double v8 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "doubleValue", (void)v13);
          double v8 = v8 + v10;
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
    else
    {
      double v8 = 0.0;
    }

    double v11 = v8 / (double)(unint64_t)[v4 count];
  }
  else
  {
    double v11 = 0.0;
  }

  return v11;
}

- (double)getMedian:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F29008];
  id v4 = a3;
  uint64_t v5 = [v3 sortDescriptorWithKey:@"self" ascending:1];
  v16[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  uint64_t v7 = [v4 sortedArrayUsingDescriptors:v6];

  unint64_t v8 = (unint64_t)[v7 count] >> 1;
  char v9 = [v7 count];
  double v10 = [v7 objectAtIndexedSubscript:v8];
  [v10 doubleValue];
  double v12 = v11;
  if ((v9 & 1) == 0)
  {
    long long v13 = [v7 objectAtIndexedSubscript:v8 + 1];
    [v13 doubleValue];
    double v12 = (v12 + v14) * 0.5;
  }
  return v12;
}

- (double)getVariance:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(AXMDataSummary *)self getMean:v4];
  double v6 = v5;
  double v7 = 0.0;
  if ((unint64_t)[v4 count] >= 2)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "doubleValue", (void)v15);
          double v7 = v7 + (v13 - v6) * (v13 - v6);
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    double v7 = v7 / (double)(unint64_t)([v8 count] - 1);
  }

  return v7;
}

- (void)getValues:(double *)a3 fromNSNumberArray:(id)a4
{
  id v8 = a4;
  if ([v8 count])
  {
    unint64_t v5 = 0;
    do
    {
      double v6 = [v8 objectAtIndexedSubscript:v5];
      [v6 doubleValue];
      a3[v5] = v7;

      ++v5;
    }
    while (v5 < [v8 count]);
  }
}

- (double)positionForXAxisValue:(double)a3
{
  [(AXMDataSummary *)self maxX];
  double v6 = v5;
  [(AXMDataSummary *)self minX];
  double v8 = v6 - v7;
  if (v8 <= 0.0) {
    return 1.79769313e308;
  }
  [(AXMDataSummary *)self minX];
  return (a3 - v9) / v8;
}

- (double)positionForYAxisValue:(double)a3
{
  [(AXMDataSummary *)self maxY];
  double v6 = v5;
  [(AXMDataSummary *)self minY];
  double v8 = v6 - v7;
  if (v8 <= 0.0) {
    return 1.79769313e308;
  }
  [(AXMDataSummary *)self minY];
  return (a3 - v9) / v8;
}

- (AXMDataSeriesDescriptor)series
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_series);

  return (AXMDataSeriesDescriptor *)WeakRetained;
}

- (void)setSeries:(id)a3
{
}

- (AXMChartDescriptor)chartDescriptor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chartDescriptor);

  return (AXMChartDescriptor *)WeakRetained;
}

- (void)setChartDescriptor:(id)a3
{
}

- (void)setDataFeatureDescriptions:(id)a3
{
}

- (void)setStatsDescriptions:(id)a3
{
}

- (AXMDataRegressionModel)regressionModel
{
  return self->_regressionModel;
}

- (unint64_t)numValues
{
  return self->_numValues;
}

- (void)setNumValues:(unint64_t)a3
{
  self->_unint64_t numValues = a3;
}

- (double)r
{
  return self->_r;
}

- (double)rSquared
{
  return self->_rSquared;
}

- (double)minX
{
  return self->_minX;
}

- (double)maxX
{
  return self->_maxX;
}

- (double)meanX
{
  return self->_meanX;
}

- (double)varianceX
{
  return self->_varianceX;
}

- (double)minY
{
  return self->_minY;
}

- (double)maxY
{
  return self->_maxY;
}

- (double)meanY
{
  return self->_meanY;
}

- (double)varianceY
{
  return self->_varianceY;
}

- (double)covariance
{
  return self->_covariance;
}

- (double)slope
{
  return self->_slope;
}

- (double)intercept
{
  return self->_intercept;
}

- (NSArray)residuals
{
  return self->_residuals;
}

- (NSArray)outliers
{
  return self->_outliers;
}

- (AXMDataSummaryCategoryNameProvider)categoryNameDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_categoryNameDelegate);

  return (AXMDataSummaryCategoryNameProvider *)WeakRetained;
}

- (void)setCategoryNameDelegate:(id)a3
{
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
}

- (NSArray)xValues
{
  return self->_xValues;
}

- (void)setXValues:(id)a3
{
}

- (NSArray)yValues
{
  return self->_yValues;
}

- (void)setYValues:(id)a3
{
}

- (NSArray)axisTitles
{
  return self->_axisTitles;
}

- (void)setAxisTitles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisTitles, 0);
  objc_storeStrong((id *)&self->_yValues, 0);
  objc_storeStrong((id *)&self->_xValues, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_destroyWeak((id *)&self->_categoryNameDelegate);
  objc_storeStrong((id *)&self->_outliers, 0);
  objc_storeStrong((id *)&self->_residuals, 0);
  objc_storeStrong((id *)&self->_regressionModel, 0);
  objc_storeStrong((id *)&self->_statsDescriptions, 0);
  objc_storeStrong((id *)&self->_dataFeatureDescriptions, 0);
  objc_destroyWeak((id *)&self->_chartDescriptor);

  objc_destroyWeak((id *)&self->_series);
}

@end