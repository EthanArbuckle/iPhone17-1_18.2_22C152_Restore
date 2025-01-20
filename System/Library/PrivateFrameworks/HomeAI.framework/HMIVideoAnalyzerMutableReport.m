@interface HMIVideoAnalyzerMutableReport
+ (BOOL)supportsSecureCoding;
+ (NSDictionary)systemDeviceInformation;
+ (id)chartSpecWithRange:(CGRect)a3 colors:(id)a4 labels:(id)a5;
+ (id)greedyMatchBetweenPredictionEvents:(id)a3 truthEvents:(id)a4 falsePositiveIndices:(id)a5 falseNegativeIndices:(id)a6 eventClass:(Class)a7 regionOfInterest:(CGRect)a8 confidenceThreshold:(float)a9 scoreThreshold:(float)a10 scoreFunction:(id)a11;
+ (void)sihouetteScoreForMatches:(id)a3 previousMatches:(id)a4 truePositiveScores:(id)a5 falsePositiveScores:(id)a6 falseNegativeScores:(id)a7;
+ (void)writeImageCropFromFrame:(id)a3 events:(id)a4 outputPath:(id)a5 source:(id)a6;
+ (void)writeJSONChartData:(id)a3 outputPath:(id)a4;
- (HMIVideoAnalyzerMutableReport)initWithCoder:(id)a3;
- (HMIVideoAnalyzerMutableReport)initWithData:(id)a3 error:(id *)a4;
- (HMIVideoAnalyzerMutableReport)initWithName:(id)a3;
- (NSData)data;
- (NSDictionary)deviceInformation;
- (NSMutableDictionary)sessions;
- (NSSet)eventClasses;
- (NSString)name;
- (id)averagePrecisionForMinPrecision:(float)a3 comparator:(id)a4;
- (id)averagePrecisionWithClassificationTruth:(id)a3 minPrecision:(float)a4;
- (id)averagePrecisionWithDetectionTruth:(id)a3 minPrecision:(float)a4 iouThreshold:(float)a5 videoMetric:(BOOL)a6;
- (id)chartDataWithBaseline:(BOOL)a3 comparator:(id)a4;
- (id)chartDataWithClassificationTruth:(id)a3 isBaseline:(BOOL)a4;
- (id)chartDataWithDetectionTruth:(id)a3 isBaseline:(BOOL)a4 iouThreshold:(float)a5 videoMetric:(BOOL)a6;
- (id)compareWithClassificationTruth:(id)a3 eventClass:(Class)a4 confidenceThreshold:(float)a5;
- (id)compareWithDetectionTruth:(id)a3 eventClass:(Class)a4 confidenceThreshold:(float)a5 iouThreshold:(float)a6 videoMetric:(BOOL)a7;
- (id)compareWithTrackingTruth:(id)a3 eventClass:(Class)a4 confidenceThreshold:(float)a5 ioaThreshold:(float)a6;
- (id)selectFramesWithRecord:(id)a3 truth:(id)a4 frameResults:(id)a5;
- (id)truthReportFromLegacyClassificationFormat:(id)a3;
- (id)truthReportFromLegacyDetectionFormat:(id)a3;
- (int64_t)version;
- (void)appendFragmentResult:(id)a3 forKey:(id)a4 source:(id)a5 redactFrames:(BOOL)a6;
- (void)appendFragmentResultsFromReport:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)writeFragmentFileComparison:(id)a3 eventClass:(Class)a4 outputPath:(id)a5;
- (void)writeHTMLReportComparison:(id)a3 truth:(id)a4 eventClass:(Class)a5 comparisonType:(id)a6 assetPath:(id)a7 outputPath:(id)a8 limit:(unint64_t)a9 shuffle:(BOOL)a10;
- (void)writeImageCropForEventClass:(Class)a3 outputPath:(id)a4 assetPath:(id)a5;
@end

@implementation HMIVideoAnalyzerMutableReport

- (HMIVideoAnalyzerMutableReport)initWithName:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMIVideoAnalyzerMutableReport;
  v5 = [(HMIVideoAnalyzerMutableReport *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_version = 2;
    uint64_t v8 = [(id)objc_opt_class() systemDeviceInformation];
    deviceInformation = v5->_deviceInformation;
    v5->_deviceInformation = (NSDictionary *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    sessions = v5->_sessions;
    v5->_sessions = (NSMutableDictionary *)v10;
  }
  return v5;
}

- (HMIVideoAnalyzerMutableReport)initWithData:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F08928];
  id v7 = a3;
  uint64_t v8 = [v6 unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:a4];

  return v8;
}

- (void)appendFragmentResult:(id)a3 forKey:(id)a4 source:(id)a5 redactFrames:(BOOL)a6
{
  BOOL v6 = a6;
  id v18 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = [(HMIVideoAnalyzerMutableReport *)self sessions];
  objc_super v13 = [v12 objectForKeyedSubscript:v18];

  if (!v13)
  {
    v14 = [[HMIVideoAnalyzerMutableReportSession alloc] initWithSource:v10];
    v15 = [(HMIVideoAnalyzerMutableReport *)self sessions];
    [v15 setObject:v14 forKeyedSubscript:v18];
  }
  v16 = [(HMIVideoAnalyzerMutableReport *)self sessions];
  v17 = [v16 objectForKeyedSubscript:v18];
  [v17 appendFragmentResult:v11 redactFrames:v6];
}

- (void)appendFragmentResultsFromReport:(id)a3
{
  id v4 = a3;
  id v6 = [(HMIVideoAnalyzerMutableReport *)self sessions];
  v5 = [v4 sessions];

  [v6 addEntriesFromDictionary:v5];
}

- (NSSet)eventClasses
{
  v3 = [MEMORY[0x263EFF9C0] set];
  id v4 = [(HMIVideoAnalyzerMutableReport *)self sessions];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__HMIVideoAnalyzerMutableReport_eventClasses__block_invoke;
  v8[3] = &unk_26477C528;
  id v9 = v3;
  id v5 = v3;
  objc_msgSend(v4, "na_each:", v8);

  id v6 = (void *)[v5 copy];
  return (NSSet *)v6;
}

void __45__HMIVideoAnalyzerMutableReport_eventClasses__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 fragments];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__HMIVideoAnalyzerMutableReport_eventClasses__block_invoke_2;
  v5[3] = &unk_26477C500;
  id v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "na_each:", v5);
}

void __45__HMIVideoAnalyzerMutableReport_eventClasses__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 events];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__HMIVideoAnalyzerMutableReport_eventClasses__block_invoke_3;
  v4[3] = &unk_26477B740;
  id v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);
}

void __45__HMIVideoAnalyzerMutableReport_eventClasses__block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 allEvents];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__HMIVideoAnalyzerMutableReport_eventClasses__block_invoke_4;
  v4[3] = &unk_26477B740;
  id v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);
}

uint64_t __45__HMIVideoAnalyzerMutableReport_eventClasses__block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = objc_opt_class();
  return [v1 addObject:v2];
}

- (id)averagePrecisionForMinPrecision:(float)a3 comparator:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  id v7 = +[HMIVideoAnalyzerEvent eventClassesArray];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __76__HMIVideoAnalyzerMutableReport_averagePrecisionForMinPrecision_comparator___block_invoke;
  v13[3] = &unk_26477C550;
  id v15 = v5;
  float v16 = a3;
  id v8 = v6;
  id v14 = v8;
  id v9 = v5;
  objc_msgSend(v7, "na_each:", v13);

  id v10 = v14;
  id v11 = v8;

  return v11;
}

void __76__HMIVideoAnalyzerMutableReport_averagePrecisionForMinPrecision_comparator___block_invoke(uint64_t a1, uint64_t a2)
{
  float v4 = 0.0;
  float v5 = 1.0;
  float v6 = 0.0;
  float v7 = 0.0;
  do
  {
    id v8 = (*(void (**)(float))(*(void *)(a1 + 40) + 16))(v7);
    [v8 precision];
    if (v9 >= v6)
    {
      [v8 recall];
      if (v10 <= v5)
      {
        [v8 precision];
        if (v11 > *(float *)(a1 + 48))
        {
          [v8 recall];
          float v13 = (float)(v5 + v12) * 0.5;
          [v8 precision];
          double v15 = *(float *)(a1 + 48);
          float v16 = v14 - fmax(v6, v15);
          float v4 = (float)(v13 * v16) / (1.0 - v15) + v4;
        }
        [v8 precision];
        float v6 = v17;
        [v8 recall];
        float v5 = v18;
      }
    }

    double v19 = v7 + 0.01;
    float v7 = v19;
  }
  while (v7 <= 1.0);
  *(float *)&double v19 = v4;
  id v20 = [NSNumber numberWithFloat:v19];
  [*(id *)(a1 + 32) setObject:v20 forKeyedSubscript:a2];
}

- (id)averagePrecisionWithClassificationTruth:(id)a3 minPrecision:(float)a4
{
  id v6 = a3;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  float v14 = __86__HMIVideoAnalyzerMutableReport_averagePrecisionWithClassificationTruth_minPrecision___block_invoke;
  double v15 = &unk_26477C578;
  float v16 = self;
  id v17 = v6;
  id v7 = v6;
  id v8 = (void *)MEMORY[0x22A641EE0](&v12);
  *(float *)&double v9 = a4;
  float v10 = -[HMIVideoAnalyzerMutableReport averagePrecisionForMinPrecision:comparator:](self, "averagePrecisionForMinPrecision:comparator:", v8, v9, v12, v13, v14, v15, v16);

  return v10;
}

uint64_t __86__HMIVideoAnalyzerMutableReport_averagePrecisionWithClassificationTruth_minPrecision___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "compareWithClassificationTruth:eventClass:confidenceThreshold:", *(void *)(a1 + 40), a2);
}

- (id)averagePrecisionWithDetectionTruth:(id)a3 minPrecision:(float)a4 iouThreshold:(float)a5 videoMetric:(BOOL)a6
{
  id v10 = a3;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __106__HMIVideoAnalyzerMutableReport_averagePrecisionWithDetectionTruth_minPrecision_iouThreshold_videoMetric___block_invoke;
  v16[3] = &unk_26477C5A0;
  v16[4] = self;
  id v17 = v10;
  float v18 = a5;
  BOOL v19 = a6;
  id v11 = v10;
  uint64_t v12 = (void *)MEMORY[0x22A641EE0](v16);
  *(float *)&double v13 = a4;
  float v14 = [(HMIVideoAnalyzerMutableReport *)self averagePrecisionForMinPrecision:v12 comparator:v13];

  return v14;
}

uint64_t __106__HMIVideoAnalyzerMutableReport_averagePrecisionWithDetectionTruth_minPrecision_iouThreshold_videoMetric___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4)
{
  LODWORD(a4) = *(_DWORD *)(a1 + 48);
  return [*(id *)(a1 + 32) compareWithDetectionTruth:*(void *)(a1 + 40) eventClass:a2 confidenceThreshold:*(unsigned __int8 *)(a1 + 52) iouThreshold:a3 videoMetric:a4];
}

- (id)chartDataWithBaseline:(BOOL)a3 comparator:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x263EFF980] array];
  float v7 = 1.0;
  do
  {
    id v8 = +[HMIVideoAnalyzerEvent eventClassesArray];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __66__HMIVideoAnalyzerMutableReport_chartDataWithBaseline_comparator___block_invoke;
    v12[3] = &unk_26477C5C8;
    id v9 = v5;
    id v14 = v9;
    float v15 = v7;
    id v10 = v6;
    id v13 = v10;
    BOOL v16 = a3;
    objc_msgSend(v8, "na_each:", v12);

    float v7 = v7 + -0.01;
  }
  while (v7 >= 0.0);

  return v10;
}

void __66__HMIVideoAnalyzerMutableReport_chartDataWithBaseline_comparator___block_invoke(uint64_t a1, uint64_t a2)
{
  v21[6] = *MEMORY[0x263EF8340];
  float v4 = (*(void (**)(float))(*(void *)(a1 + 40) + 16))(*(float *)(a1 + 48));
  [v4 precision];
  if (v5 != 0.0 || ([v4 recall], v6 != 0.0))
  {
    int v7 = (int)(float)(*(float *)(a1 + 48) * 100.0) % 10;
    id v8 = *(void **)(a1 + 32);
    v20[0] = @"precision";
    id v9 = NSNumber;
    [v4 precision];
    id v10 = objc_msgSend(v9, "numberWithFloat:");
    v21[0] = v10;
    v20[1] = @"recall";
    id v11 = NSNumber;
    [v4 recall];
    uint64_t v12 = objc_msgSend(v11, "numberWithFloat:");
    v21[1] = v12;
    v20[2] = @"threshold";
    LODWORD(v13) = *(_DWORD *)(a1 + 48);
    id v14 = [NSNumber numberWithFloat:v13];
    v21[2] = v14;
    v20[3] = @"annotation";
    if (v7)
    {
      float v15 = &stru_26D98B6C8;
    }
    else
    {
      float v15 = [NSString stringWithFormat:@"%.2f", *(float *)(a1 + 48)];
    }
    v21[3] = v15;
    v20[4] = @"class";
    uint64_t v16 = +[HMIVideoAnalyzerEvent shortNameForEventClass:a2];
    id v17 = (void *)v16;
    v20[5] = @"opacity";
    if (*(unsigned char *)(a1 + 52)) {
      float v18 = &unk_26D9A9A50;
    }
    else {
      float v18 = &unk_26D9A9270;
    }
    v21[4] = v16;
    v21[5] = v18;
    BOOL v19 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:6];
    [v8 addObject:v19];

    if (!v7) {
  }
    }
}

- (id)chartDataWithClassificationTruth:(id)a3 isBaseline:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  double v13 = __77__HMIVideoAnalyzerMutableReport_chartDataWithClassificationTruth_isBaseline___block_invoke;
  id v14 = &unk_26477C578;
  float v15 = self;
  id v16 = v6;
  id v7 = v6;
  id v8 = (void *)MEMORY[0x22A641EE0](&v11);
  id v9 = -[HMIVideoAnalyzerMutableReport chartDataWithBaseline:comparator:](self, "chartDataWithBaseline:comparator:", v4, v8, v11, v12, v13, v14, v15);

  return v9;
}

uint64_t __77__HMIVideoAnalyzerMutableReport_chartDataWithClassificationTruth_isBaseline___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "compareWithClassificationTruth:eventClass:confidenceThreshold:", *(void *)(a1 + 40), a2);
}

- (id)chartDataWithDetectionTruth:(id)a3 isBaseline:(BOOL)a4 iouThreshold:(float)a5 videoMetric:(BOOL)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __97__HMIVideoAnalyzerMutableReport_chartDataWithDetectionTruth_isBaseline_iouThreshold_videoMetric___block_invoke;
  v15[3] = &unk_26477C5A0;
  v15[4] = self;
  id v16 = v10;
  float v17 = a5;
  BOOL v18 = a6;
  id v11 = v10;
  uint64_t v12 = (void *)MEMORY[0x22A641EE0](v15);
  double v13 = [(HMIVideoAnalyzerMutableReport *)self chartDataWithBaseline:v8 comparator:v12];

  return v13;
}

uint64_t __97__HMIVideoAnalyzerMutableReport_chartDataWithDetectionTruth_isBaseline_iouThreshold_videoMetric___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4)
{
  LODWORD(a4) = *(_DWORD *)(a1 + 48);
  return [*(id *)(a1 + 32) compareWithDetectionTruth:*(void *)(a1 + 40) eventClass:a2 confidenceThreshold:*(unsigned __int8 *)(a1 + 52) iouThreshold:a3 videoMetric:a4];
}

- (NSData)data
{
  uint64_t v4 = 0;
  uint64_t v2 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v4];
  return (NSData *)v2;
}

+ (NSDictionary)systemDeviceInformation
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
  v3 = (void *)MGCopyAnswer();
  [v2 setObject:v3 forKeyedSubscript:@"HardwareModel"];

  uint64_t v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HomeAI"];
  float v5 = [v4 infoDictionary];
  id v6 = (void *)*MEMORY[0x263EFFB70];
  id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263EFFB70]];
  [v2 setObject:v7 forKeyedSubscript:@"HomeAIBundleVersion"];

  BOOL v8 = [NSNumber numberWithBool:HMIIsDebug()];
  [v2 setObject:v8 forKeyedSubscript:@"Debug"];

  return (NSDictionary *)v2;
}

- (id)truthReportFromLegacyClassificationFormat:(id)a3
{
  id v4 = a3;
  float v5 = [[HMIVideoAnalyzerMutableReport alloc] initWithName:@"Truth"];
  id v6 = [(HMIVideoAnalyzerMutableReport *)self sessions];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  double v13 = __75__HMIVideoAnalyzerMutableReport_truthReportFromLegacyClassificationFormat___block_invoke;
  id v14 = &unk_26477C638;
  id v15 = v4;
  id v16 = self;
  id v7 = v4;
  BOOL v8 = objc_msgSend(v6, "na_dictionaryByMappingValues:", &v11);

  id v9 = [(HMIVideoAnalyzerMutableReport *)v5 sessions];
  [v9 addEntriesFromDictionary:v8];

  return v5;
}

HMIVideoAnalyzerMutableReportSession *__75__HMIVideoAnalyzerMutableReport_truthReportFromLegacyClassificationFormat___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __75__HMIVideoAnalyzerMutableReport_truthReportFromLegacyClassificationFormat___block_invoke_2;
  v32[3] = &unk_26477C5F0;
  id v8 = v6;
  id v33 = v8;
  id v9 = objc_msgSend(v7, "na_firstObjectPassingTest:", v32);
  if (v9)
  {
    id v10 = [v8 fragments];
    uint64_t v11 = [v10 firstObject];

    v31 = [v9 objectForKeyedSubscript:@"classification_classes"];
    v30 = objc_msgSend(v31, "na_map:", &__block_literal_global_231);
    uint64_t v12 = [HMIVideoAnalyzerFragmentResult alloc];
    double v13 = [v11 fragment];
    id v14 = [MEMORY[0x263EFFA08] setWithArray:v30];
    id v15 = [v11 configuration];
    [v11 outcome];
    v17 = id v16 = v5;
    BOOL v18 = v9;
    BOOL v19 = [(HMIVideoAnalyzerFragmentResult *)v12 initWithFragment:v13 events:v14 frameResults:MEMORY[0x263EFFA68] thumbnails:MEMORY[0x263EFFA68] configuration:v15 outcome:v17];

    id v20 = [HMIVideoAnalyzerMutableReportSession alloc];
    v21 = [v8 source];
    v22 = v20;
    id v5 = v16;
    v23 = [(HMIVideoAnalyzerMutableReportSession *)v22 initWithSource:v21];

    [(HMIVideoAnalyzerMutableReportSession *)v23 appendFragmentResult:v19 redactFrames:1];
    id v9 = v18;
  }
  else
  {
    v24 = (void *)MEMORY[0x22A641C70]();
    id v25 = *(id *)(a1 + 40);
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      v28 = [v8 source];
      *(_DWORD *)buf = 138543618;
      v35 = v27;
      __int16 v36 = 2112;
      v37 = v28;
      _os_log_impl(&dword_225DC6000, v26, OS_LOG_TYPE_ERROR, "%{public}@Cannot find ground truth for %@", buf, 0x16u);
    }
    v23 = 0;
  }

  return v23;
}

uint64_t __75__HMIVideoAnalyzerMutableReport_truthReportFromLegacyClassificationFormat___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:@"image_id"];
  id v4 = [*(id *)(a1 + 32) source];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

id __75__HMIVideoAnalyzerMutableReport_truthReportFromLegacyClassificationFormat___block_invoke_228(uint64_t a1, uint64_t a2)
{
  id v2 = objc_alloc(+[HMIVideoAnalyzerEvent eventClassForShortName:a2]);
  v3 = [[HMIConfidence alloc] initWithValue:&unk_26D9A9738 levelThresholds:1.0];
  id v4 = objc_msgSend(v2, "initWithConfidence:boundingBox:", v3, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  return v4;
}

- (id)truthReportFromLegacyDetectionFormat:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[HMIVideoAnalyzerMutableReport alloc] initWithName:@"Truth"];
  id v6 = [(HMIVideoAnalyzerMutableReport *)self sessions];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  double v13 = __70__HMIVideoAnalyzerMutableReport_truthReportFromLegacyDetectionFormat___block_invoke;
  id v14 = &unk_26477C638;
  id v15 = v4;
  id v16 = self;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "na_dictionaryByMappingValues:", &v11);

  id v9 = [(HMIVideoAnalyzerMutableReport *)v5 sessions];
  [v9 addEntriesFromDictionary:v8];

  return v5;
}

HMIVideoAnalyzerMutableReportSession *__70__HMIVideoAnalyzerMutableReport_truthReportFromLegacyDetectionFormat___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = [v6 source];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    id v44 = v5;
    v42 = v9;
    id v10 = [[HMIVideoAnnotationParser alloc] initWithArray:v9];
    v43 = v6;
    uint64_t v11 = [v6 fragments];
    uint64_t v12 = [v11 firstObject];

    v41 = v12;
    double v13 = [v12 frameResults];
    id v14 = [MEMORY[0x263EFF980] array];
    [v13 count];
    unint64_t v15 = 0;
    double v16 = *MEMORY[0x263F001B0];
    double v17 = *(double *)(MEMORY[0x263F001B0] + 8);
    do
    {
      if (v15 >= [v13 count])
      {
        id v20 = [HMIVideoFrame alloc];
        BOOL v18 = [MEMORY[0x263EFF8F8] data];
        if (v10) {
          [(HMIVideoAnnotationParser *)v10 lastKnownTimeStamp];
        }
        else {
          memset(v46, 0, sizeof(v46));
        }
        uint64_t v19 = -[HMIVideoFrame initWithJPEGData:size:presentationTimeStamp:](v20, "initWithJPEGData:size:presentationTimeStamp:", v18, v46, v16, v17);
      }
      else
      {
        BOOL v18 = [v13 objectAtIndexedSubscript:v15];
        uint64_t v19 = [v18 frame];
      }
      v21 = (void *)v19;

      if (v21) {
        [v21 presentationTimeStamp];
      }
      else {
        memset(v45, 0, sizeof(v45));
      }
      v22 = [(HMIVideoAnnotationParser *)v10 eventsForTimeStamp:v45];
      v23 = -[HMIVideoAnalyzerFrameResult initWithFrame:events:regionOfInterest:]([HMIVideoAnalyzerFrameResult alloc], "initWithFrame:events:regionOfInterest:", v21, v22, 0.0, 0.0, 1.0, 1.0);
      [v14 addObject:v23];

      ++v15;
      unint64_t v24 = [v13 count];
      if (v24 <= 1) {
        unint64_t v25 = 1;
      }
      else {
        unint64_t v25 = v24;
      }
    }
    while (v15 < v25);
    v26 = [(HMIVideoAnnotationParser *)v10 eventsForFragment];
    v27 = [HMIVideoAnalyzerFragmentResult alloc];
    v28 = [v41 fragment];
    v29 = [v41 configuration];
    v30 = [v41 outcome];
    v31 = [(HMIVideoAnalyzerFragmentResult *)v27 initWithFragment:v28 events:v26 frameResults:v14 thumbnails:MEMORY[0x263EFFA68] configuration:v29 outcome:v30];

    v32 = [HMIVideoAnalyzerMutableReportSession alloc];
    id v6 = v43;
    id v33 = [v43 source];
    v34 = [(HMIVideoAnalyzerMutableReportSession *)v32 initWithSource:v33];

    [(HMIVideoAnalyzerMutableReportSession *)v34 appendFragmentResult:v31 redactFrames:1];
    id v5 = v44;
    id v9 = v42;
  }
  else
  {
    v35 = (void *)MEMORY[0x22A641C70]();
    id v36 = *(id *)(a1 + 40);
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      uint64_t v38 = HMFGetLogIdentifier();
      v39 = [v6 source];
      *(_DWORD *)buf = 138543618;
      v48 = v38;
      __int16 v49 = 2112;
      v50 = v39;
      _os_log_impl(&dword_225DC6000, v37, OS_LOG_TYPE_ERROR, "%{public}@Cannot find ground truth for %@", buf, 0x16u);
    }
    v34 = 0;
  }

  return v34;
}

- (id)compareWithClassificationTruth:(id)a3 eventClass:(Class)a4 confidenceThreshold:(float)a5
{
  id v8 = a3;
  id v9 = [MEMORY[0x263EFF980] array];
  id v10 = [MEMORY[0x263EFF980] array];
  uint64_t v11 = [MEMORY[0x263EFF980] array];
  uint64_t v12 = [(HMIVideoAnalyzerMutableReport *)self sessions];
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  unint64_t v25 = __95__HMIVideoAnalyzerMutableReport_compareWithClassificationTruth_eventClass_confidenceThreshold___block_invoke;
  v26 = &unk_26477C660;
  id v30 = v10;
  Class v31 = a4;
  float v32 = a5;
  id v27 = v8;
  id v28 = v9;
  id v29 = v11;
  id v13 = v10;
  id v14 = v11;
  id v15 = v9;
  id v16 = v8;
  objc_msgSend(v12, "na_each:", &v23);

  double v17 = [HMIVideoAnalyzerMutableReportComparison alloc];
  BOOL v18 = objc_msgSend(v15, "copy", v23, v24, v25, v26);
  uint64_t v19 = (void *)[v14 copy];
  id v20 = (void *)[v13 copy];
  v21 = [(HMIVideoAnalyzerMutableReportComparison *)v17 initWithTruePositiveKeys:v18 falseNegativeKeys:v19 falsePositiveKeys:v20 groupByKey:0];

  return v21;
}

void __95__HMIVideoAnalyzerMutableReport_compareWithClassificationTruth_eventClass_confidenceThreshold___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v41 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 sessions];
  id v8 = [v7 objectForKeyedSubscript:v41];

  id v9 = [v6 fragments];

  id v10 = [v9 firstObject];
  uint64_t v11 = [v10 maxConfidenceEventForEventClass:*(void *)(a1 + 64)];

  uint64_t v12 = [v11 confidence];
  id v13 = [v8 fragments];
  id v14 = [v13 firstObject];
  id v15 = [v14 maxConfidenceEventForEventClass:*(void *)(a1 + 64)];
  id v16 = [v15 confidence];

  [v12 value];
  double v18 = v17;
  double v19 = *(float *)(a1 + 72);
  [v16 value];
  double v21 = v20;
  if (v18 >= v19 && v20 > 0.0)
  {
    v22 = *(void **)(a1 + 40);
    uint64_t v23 = [HMIVideoAnalyzerReportRecord alloc];
    uint64_t v24 = NSNumber;
    [v12 value];
    unint64_t v25 = objc_msgSend(v24, "numberWithDouble:");
    v26 = [(HMIVideoAnalyzerReportRecord *)v23 initWithKey:v41 classificationScore:v25];
    [v22 addObject:v26];
  }
  if (v18 < v19 && v21 > 0.0)
  {
    id v27 = *(void **)(a1 + 48);
    id v28 = [HMIVideoAnalyzerReportRecord alloc];
    id v29 = NSNumber;
    [v11 boundingBox];
    v34 = objc_msgSend(v29, "numberWithDouble:", HMICGRectArea(v30, v31, v32, v33));
    v35 = [(HMIVideoAnalyzerReportRecord *)v28 initWithKey:v41 classificationScore:v34];
    [v27 addObject:v35];
  }
  if (v18 >= v19 && v21 <= 0.0)
  {
    id v36 = *(void **)(a1 + 56);
    v37 = [HMIVideoAnalyzerReportRecord alloc];
    uint64_t v38 = NSNumber;
    [v12 value];
    v39 = objc_msgSend(v38, "numberWithDouble:");
    v40 = [(HMIVideoAnalyzerReportRecord *)v37 initWithKey:v41 classificationScore:v39];
    [v36 addObject:v40];
  }
}

- (id)compareWithDetectionTruth:(id)a3 eventClass:(Class)a4 confidenceThreshold:(float)a5 iouThreshold:(float)a6 videoMetric:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  uint64_t v12 = [MEMORY[0x263EFF980] array];
  id v13 = [MEMORY[0x263EFF980] array];
  id v14 = [MEMORY[0x263EFF980] array];
  if (v7)
  {
    id v15 = [MEMORY[0x263EFF980] array];
    id v16 = [MEMORY[0x263EFF980] array];
    id v17 = [MEMORY[0x263EFF980] array];
  }
  else
  {
    id v15 = v12;
    id v16 = v13;
    id v17 = v14;
  }
  double v18 = v17;
  double v19 = [(HMIVideoAnalyzerMutableReport *)self sessions];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_2;
  v34[3] = &unk_26477C740;
  float v44 = a5;
  float v45 = a6;
  id v35 = v11;
  id v36 = v15;
  id v37 = v16;
  id v38 = v18;
  BOOL v46 = v7;
  id v39 = v12;
  id v40 = v14;
  id v42 = &__block_literal_global_247;
  Class v43 = a4;
  id v41 = v13;
  id v20 = v13;
  id v21 = v14;
  id v22 = v12;
  id v33 = v18;
  id v31 = v16;
  id v23 = v15;
  id v24 = v11;
  objc_msgSend(v19, "na_each:", v34);

  unint64_t v25 = [HMIVideoAnalyzerMutableReportComparison alloc];
  v26 = (void *)[v22 copy];
  id v27 = (void *)[v21 copy];
  id v28 = (void *)[v20 copy];
  id v29 = [(HMIVideoAnalyzerMutableReportComparison *)v25 initWithTruePositiveKeys:v26 falseNegativeKeys:v27 falsePositiveKeys:v28 groupByKey:v7];

  return v29;
}

BOOL __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, void *a6, void *a7)
{
  id v8 = a7;
  [a6 boundingBox];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  [v8 boundingBox];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  return HMICGRectIntersectionOverUnionWithRespectToROI(v10, v12, v14, v16, v18, v20, v22, v24, a1, a2, a3, a4);
}

void __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = [v6 sessions];
  double v9 = [v8 objectForKeyedSubscript:v5];

  CGFloat v10 = [v7 fragments];

  double v11 = [v10 firstObject];
  CGFloat v12 = [v11 frameResults];

  double v13 = [v9 fragments];
  CGFloat v14 = [v13 firstObject];
  double v15 = [v14 frameResults];

  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_3;
  v32[3] = &unk_26477C718;
  id v16 = v15;
  id v33 = v16;
  uint64_t v39 = *(void *)(a1 + 104);
  long long v30 = *(_OWORD *)(a1 + 88);
  id v17 = (id)v30;
  long long v38 = v30;
  id v34 = *(id *)(a1 + 40);
  id v18 = v5;
  id v35 = v18;
  id v36 = *(id *)(a1 + 48);
  id v37 = *(id *)(a1 + 56);
  [v12 enumerateObjectsUsingBlock:v32];
  if (*(unsigned char *)(a1 + 112))
  {
    double v19 = [v9 fragments];
    double v20 = [v19 firstObject];
    double v21 = [v20 events];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_9;
    v31[3] = &__block_descriptor_40_e31_B16__0__HMIVideoAnalyzerEvent_8lu32l8;
    v31[4] = *(void *)(a1 + 96);
    int v22 = objc_msgSend(v21, "na_any:", v31);

    if (v22)
    {
      if ([*(id *)(a1 + 40) count])
      {
        double v23 = *(void **)(a1 + 64);
        double v24 = [*(id *)(a1 + 40) firstObject];
        [v23 addObject:v24];
      }
      if (!objc_msgSend(*(id *)(a1 + 40), "count", v30) && objc_msgSend(*(id *)(a1 + 56), "count"))
      {
        unint64_t v25 = *(void **)(a1 + 72);
        v26 = [*(id *)(a1 + 56) firstObject];
        [v25 addObject:v26];
      }
      if ([*(id *)(a1 + 40) count] || objc_msgSend(*(id *)(a1 + 56), "count")) {
        goto LABEL_14;
      }
      id v27 = *(void **)(a1 + 72);
      id v28 = [[HMIVideoAnalyzerReportRecord alloc] initWithKey:v18 detectionScores:&unk_26D9A9750 frameResultIndex:0];
    }
    else
    {
      if (![*(id *)(a1 + 48) count])
      {
LABEL_14:
        objc_msgSend(*(id *)(a1 + 40), "removeAllObjects", v30);
        [*(id *)(a1 + 48) removeAllObjects];
        [*(id *)(a1 + 56) removeAllObjects];
        goto LABEL_15;
      }
      id v27 = *(void **)(a1 + 80);
      id v28 = [*(id *)(a1 + 48) firstObject];
    }
    id v29 = v28;
    objc_msgSend(v27, "addObject:", v28, v30);

    goto LABEL_14;
  }
LABEL_15:
}

void __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 events];
  id v7 = [v6 allObjects];
  id v8 = objc_msgSend(v7, "na_flatMap:", &__block_literal_global_250);

  double v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  CGFloat v10 = [v9 events];
  double v11 = [v10 allObjects];
  CGFloat v12 = objc_msgSend(v11, "na_flatMap:", &__block_literal_global_252);

  uint64_t v13 = [MEMORY[0x263EFF980] array];
  CGFloat v14 = [MEMORY[0x263EFF980] array];
  uint64_t v15 = *(void *)(a1 + 80);
  [v5 regionOfInterest];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  LODWORD(v24) = *(_DWORD *)(a1 + 88);
  LODWORD(v25) = *(_DWORD *)(a1 + 92);
  v26 = +[HMIVideoAnalyzerMutableReport greedyMatchBetweenPredictionEvents:truthEvents:falsePositiveIndices:falseNegativeIndices:eventClass:regionOfInterest:confidenceThreshold:scoreThreshold:scoreFunction:](HMIVideoAnalyzerMutableReport, "greedyMatchBetweenPredictionEvents:truthEvents:falsePositiveIndices:falseNegativeIndices:eventClass:regionOfInterest:confidenceThreshold:scoreThreshold:scoreFunction:", v8, v12, v13, v14, v15, *(void *)(a1 + 72), v17, v19, v21, v23, v24, v25);
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_6;
  v47[3] = &unk_26477C6C8;
  id v27 = v8;
  id v48 = v27;
  id v41 = v26;
  id v28 = objc_msgSend(v26, "na_map:", v47);
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_7;
  void v45[3] = &unk_26477C6F0;
  id v40 = v27;
  id v46 = v40;
  id v42 = (void *)v13;
  id v29 = (void *)v13;
  uint64_t v30 = a3;
  id v31 = objc_msgSend(v29, "na_map:", v45);
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_8;
  v43[3] = &unk_26477C6F0;
  id v32 = v12;
  id v44 = v32;
  id v33 = objc_msgSend(v14, "na_map:", v43);
  if ([v28 count])
  {
    id v34 = *(void **)(a1 + 40);
    id v35 = [[HMIVideoAnalyzerReportRecord alloc] initWithKey:*(void *)(a1 + 48) detectionScores:v28 frameResultIndex:v30];
    [v34 addObject:v35];
  }
  if ([v31 count])
  {
    id v36 = *(void **)(a1 + 56);
    id v37 = [[HMIVideoAnalyzerReportRecord alloc] initWithKey:*(void *)(a1 + 48) detectionScores:v31 frameResultIndex:v30];
    [v36 addObject:v37];
  }
  if ([v33 count])
  {
    long long v38 = *(void **)(a1 + 64);
    uint64_t v39 = [[HMIVideoAnalyzerReportRecord alloc] initWithKey:*(void *)(a1 + 48) detectionScores:v33 frameResultIndex:v30];
    [v38 addObject:v39];
  }
}

uint64_t __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 allEvents];
}

uint64_t __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 allEvents];
}

id __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  v3 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(a2, "unsignedIntegerValue"));
  id v4 = [v3 confidence];
  [v4 value];
  id v5 = objc_msgSend(v2, "numberWithDouble:");

  return v5;
}

id __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  v3 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(a2, "unsignedIntegerValue"));
  id v4 = [v3 confidence];
  [v4 value];
  id v5 = objc_msgSend(v2, "numberWithDouble:");

  return v5;
}

id __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  v3 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(a2, "unsignedIntegerValue"));
  [v3 boundingBox];
  id v8 = objc_msgSend(v2, "numberWithDouble:", HMICGRectArea(v4, v5, v6, v7));

  return v8;
}

BOOL __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    double v5 = [v3 confidence];
    [v5 value];
    BOOL v4 = v6 > 0.0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)compareWithTrackingTruth:(id)a3 eventClass:(Class)a4 confidenceThreshold:(float)a5 ioaThreshold:(float)a6
{
  id v10 = a3;
  double v11 = [MEMORY[0x263EFF980] array];
  CGFloat v12 = [MEMORY[0x263EFF980] array];
  uint64_t v13 = [MEMORY[0x263EFF980] array];
  CGFloat v14 = [(HMIVideoAnalyzerMutableReport *)self sessions];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __102__HMIVideoAnalyzerMutableReport_compareWithTrackingTruth_eventClass_confidenceThreshold_ioaThreshold___block_invoke_2;
  v25[3] = &unk_26477C790;
  float v32 = a5;
  float v33 = a6;
  id v30 = &__block_literal_global_266;
  Class v31 = a4;
  id v26 = v10;
  id v27 = v11;
  id v28 = v12;
  id v29 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  objc_msgSend(v14, "na_each:", v25);

  double v19 = [HMIVideoAnalyzerMutableReportComparison alloc];
  double v20 = (void *)[v17 copy];
  double v21 = (void *)[v15 copy];
  double v22 = (void *)[v16 copy];
  double v23 = [(HMIVideoAnalyzerMutableReportComparison *)v19 initWithTruePositiveKeys:v20 falseNegativeKeys:v21 falsePositiveKeys:v22 groupByKey:0];

  return v23;
}

float __102__HMIVideoAnalyzerMutableReport_compareWithTrackingTruth_eventClass_confidenceThreshold_ioaThreshold___block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, void *a6, void *a7)
{
  id v12 = a6;
  id v13 = a7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    CGFloat v14 = v12;
  }
  else {
    CGFloat v14 = 0;
  }
  id v15 = v14;
  id v16 = v15;
  if (!v15) {
    goto LABEL_10;
  }
  id v17 = [v15 torso];

  if (!v17)
  {
    double v19 = [v16 face];

    if (v19)
    {
      id v18 = [v16 face];
      goto LABEL_9;
    }
LABEL_10:
    [v12 boundingBox];
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    [v13 boundingBox];
    HMICGRectIntersectionOverMinAreaWithRespectToROI(v36, v38, v40, v42, v43, v44, v45, v46, a1, a2, a3, a4);
    float v34 = v47;
    goto LABEL_11;
  }
  id v18 = [v16 torso];
LABEL_9:
  double v20 = v18;
  [v18 boundingBox];
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  [v13 boundingBox];
  HMICGRectIntersectionOverMinAreaWithRespectToROI(v22, v24, v26, v28, v29, v30, v31, v32, a1, a2, a3, a4);
  float v34 = v33;

LABEL_11:
  return v34;
}

void __102__HMIVideoAnalyzerMutableReport_compareWithTrackingTruth_eventClass_confidenceThreshold_ioaThreshold___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v63[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  double v7 = [*(id *)(a1 + 32) sessions];
  v52 = v5;
  id v8 = [v7 objectForKeyedSubscript:v5];

  __int16 v49 = v6;
  double v9 = [v6 fragments];
  id v10 = [v9 firstObject];
  double v11 = [v10 frameResults];

  id v48 = v8;
  id v12 = [v8 fragments];
  id v13 = [v12 firstObject];
  uint64_t v51 = [v13 frameResults];

  v58 = [MEMORY[0x263EFF980] array];
  if ([v11 count])
  {
    unint64_t v14 = 0;
    v57 = (void *)MEMORY[0x263EFFA78];
    v50 = v11;
    do
    {
      id v15 = [v11 objectAtIndexedSubscript:v14];
      id v16 = [v15 events];
      v55 = [v16 allObjects];

      id v17 = [v51 objectAtIndexedSubscript:v14];
      id v18 = [v17 events];
      double v19 = [v18 allObjects];

      double v20 = [MEMORY[0x263EFF980] array];
      double v21 = [MEMORY[0x263EFF980] array];
      uint64_t v22 = *(void *)(a1 + 72);
      double v23 = [v11 objectAtIndexedSubscript:v14];
      [v23 regionOfInterest];
      CGFloat v24 = +[HMIVideoAnalyzerMutableReport greedyMatchBetweenPredictionEvents:truthEvents:falsePositiveIndices:falseNegativeIndices:eventClass:regionOfInterest:confidenceThreshold:scoreThreshold:scoreFunction:](HMIVideoAnalyzerMutableReport, "greedyMatchBetweenPredictionEvents:truthEvents:falsePositiveIndices:falseNegativeIndices:eventClass:regionOfInterest:confidenceThreshold:scoreThreshold:scoreFunction:", v55, v19, v20, v21, v22, *(void *)(a1 + 64));

      double v25 = [MEMORY[0x263EFF9A0] dictionary];
      v59[0] = MEMORY[0x263EF8330];
      v59[1] = 3221225472;
      v59[2] = __102__HMIVideoAnalyzerMutableReport_compareWithTrackingTruth_eventClass_confidenceThreshold_ioaThreshold___block_invoke_3;
      v59[3] = &unk_26477C768;
      id v54 = v55;
      id v60 = v54;
      id v53 = v19;
      id v61 = v53;
      id v26 = v25;
      id v62 = v26;
      v56 = v24;
      [v24 enumerateKeysAndObjectsUsingBlock:v59];
      double v27 = [MEMORY[0x263EFF980] array];
      CGFloat v28 = [MEMORY[0x263EFF980] array];
      double v29 = [MEMORY[0x263EFF980] array];
      double v30 = (void *)[v26 copy];
      +[HMIVideoAnalyzerMutableReport sihouetteScoreForMatches:v30 previousMatches:v57 truePositiveScores:v27 falsePositiveScores:v28 falseNegativeScores:v29];

      double v31 = [NSNumber numberWithUnsignedInteger:v14];
      [v58 addObject:v31];

      if ([v27 count])
      {
        double v32 = *(void **)(a1 + 40);
        float v33 = [HMIVideoAnalyzerReportRecord alloc];
        float v34 = (void *)[v58 copy];
        double v35 = [(HMIVideoAnalyzerReportRecord *)v33 initWithKey:v52 trackingScores:v27 frameResultIndices:v34];
        [v32 addObject:v35];
      }
      if ([v28 count])
      {
        CGFloat v36 = *(void **)(a1 + 48);
        double v37 = [HMIVideoAnalyzerReportRecord alloc];
        CGFloat v38 = (void *)[v58 copy];
        double v39 = [(HMIVideoAnalyzerReportRecord *)v37 initWithKey:v52 trackingScores:v28 frameResultIndices:v38];
        [v36 addObject:v39];
      }
      CGFloat v40 = v58;
      if ([v29 count])
      {
        double v41 = *(void **)(a1 + 56);
        CGFloat v42 = [HMIVideoAnalyzerReportRecord alloc];
        double v43 = (void *)[v58 copy];
        double v44 = [(HMIVideoAnalyzerReportRecord *)v42 initWithKey:v52 trackingScores:v29 frameResultIndices:v43];
        [v41 addObject:v44];

        CGFloat v40 = v58;
      }
      if ([v26 count])
      {
        double v45 = [NSNumber numberWithUnsignedInteger:v14];
        v63[0] = v45;
        double v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:1];
        [v40 setArray:v46];

        uint64_t v47 = [v26 copy];
        v57 = (void *)v47;
      }
      double v11 = v50;

      ++v14;
    }
    while (v14 < [v50 count]);
  }
  else
  {
    v57 = (void *)MEMORY[0x263EFFA78];
  }
}

void __102__HMIVideoAnalyzerMutableReport_compareWithTrackingTruth_eventClass_confidenceThreshold_ioaThreshold___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  double v7 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(a2, "unsignedIntegerValue"));
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v19 = v8;

  double v9 = *(void **)(a1 + 40);
  uint64_t v10 = [v6 unsignedIntegerValue];

  double v11 = [v9 objectAtIndexedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  if (v19) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    id v15 = [v19 sessionEntityUUID];
    uint64_t v16 = [v13 sessionEntityUUID];
    id v17 = (void *)v16;
    if (v15) {
      BOOL v18 = v16 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    if (!v18) {
      [*(id *)(a1 + 48) setObject:v19 forKeyedSubscript:v16];
    }
  }
}

- (id)selectFramesWithRecord:(id)a3 truth:(id)a4 frameResults:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = [MEMORY[0x263EFF980] array];
  double v9 = [v6 frameResultIndices];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    double v11 = [v6 frameResultIndices];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __75__HMIVideoAnalyzerMutableReport_selectFramesWithRecord_truth_frameResults___block_invoke;
    v20[3] = &unk_26477C7B8;
    id v21 = v8;
    objc_msgSend(v11, "na_each:", v20);

    id v12 = v21;
LABEL_5:

    goto LABEL_6;
  }
  if ([v7 count])
  {
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    id v17 = __75__HMIVideoAnalyzerMutableReport_selectFramesWithRecord_truth_frameResults___block_invoke_2;
    BOOL v18 = &unk_26477C7E0;
    id v19 = v8;
    [v7 enumerateObjectsUsingBlock:&v15];
    id v12 = v19;
    goto LABEL_5;
  }
  [v8 addObject:&unk_26D9A9288];
LABEL_6:
  id v13 = objc_msgSend(v8, "copy", v15, v16, v17, v18);

  return v13;
}

uint64_t __75__HMIVideoAnalyzerMutableReport_selectFramesWithRecord_truth_frameResults___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __75__HMIVideoAnalyzerMutableReport_selectFramesWithRecord_truth_frameResults___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

- (void)writeHTMLReportComparison:(id)a3 truth:(id)a4 eventClass:(Class)a5 comparisonType:(id)a6 assetPath:(id)a7 outputPath:(id)a8 limit:(unint64_t)a9 shuffle:(BOOL)a10
{
  v56[3] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v48 = a4;
  id v15 = a6;
  id v46 = a7;
  id v49 = a8;
  v55[0] = @"TP";
  uint64_t v16 = [v14 truePositiveKeys];
  v56[0] = v16;
  v55[1] = @"FP";
  id v17 = [v14 falsePositiveKeys];
  v56[1] = v17;
  v55[2] = @"FN";
  BOOL v18 = [v14 falseNegativeKeys];
  v56[2] = v18;
  id v19 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:3];
  double v20 = [v19 objectForKeyedSubscript:v15];

  unint64_t v21 = [v20 count];
  if (v21 >= a9) {
    unint64_t v22 = a9;
  }
  else {
    unint64_t v22 = v21;
  }
  if (a10)
  {
    double v23 = (void *)[v20 mutableCopy];
    if (v22)
    {
      for (uint64_t i = 0; i != v22; ++i)
        objc_msgSend(v23, "exchangeObjectAtIndex:withObjectAtIndex:", i, arc4random_uniform(objc_msgSend(v20, "count")));
    }
    double v25 = objc_msgSend(v23, "subarrayWithRange:", 0, v22);
    double v44 = (void *)[v25 copy];
  }
  else
  {
    double v23 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"score" ascending:0];
    id v54 = v23;
    double v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
    id v26 = [v20 sortedArrayUsingDescriptors:v25];
    double v44 = objc_msgSend(v26, "subarrayWithRange:", 0, v22);
  }
  double v27 = NSString;
  CGFloat v28 = +[HMIVideoAnalyzerEvent shortNameForEventClass:a5];
  double v43 = v15;
  double v29 = [v27 stringWithFormat:@"%@%@", v28, v15];

  double v30 = [NSString stringWithFormat:@"Object detection (%@)", v29];
  double v31 = [NSString stringWithFormat:@"Visualize%@.html", v29];
  double v32 = [v49 stringByAppendingPathComponent:v31];
  float v33 = [[HMIHTMLReport alloc] initWithTitle:v30 outputPath:v32];
  float v34 = NSString;
  uint64_t v35 = [v20 count];
  [v14 precision];
  double v37 = v36;
  [v14 recall];
  double v39 = [v34 stringWithFormat:@"%lu %@s (Precision: %.3f, Recall: %.3f)", v35, v29, *(void *)&v37, v38];
  [(HMIHTMLReport *)v33 appendText:v39];

  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __126__HMIVideoAnalyzerMutableReport_writeHTMLReportComparison_truth_eventClass_comparisonType_assetPath_outputPath_limit_shuffle___block_invoke;
  v50[3] = &unk_26477C880;
  v50[4] = self;
  id v51 = v48;
  id v52 = v46;
  id v53 = v33;
  CGFloat v40 = v33;
  id v41 = v46;
  id v42 = v48;
  objc_msgSend(v44, "na_each:", v50);
}

void __126__HMIVideoAnalyzerMutableReport_writeHTMLReportComparison_truth_eventClass_comparisonType_assetPath_outputPath_limit_shuffle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) sessions];
  id v5 = [v3 key];
  id v6 = [v4 objectForKeyedSubscript:v5];

  id v7 = [v6 fragments];
  id v8 = [v7 firstObject];
  double v9 = [v8 frameResults];

  uint64_t v10 = *(void **)(a1 + 40);
  if (v10)
  {
    double v11 = [v10 sessions];
    id v12 = [v3 key];
    id v13 = [v11 objectForKeyedSubscript:v12];
    id v14 = [v13 fragments];
    id v15 = [v14 firstObject];
    uint64_t v16 = [v15 frameResults];
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x263EFFA68];
  }
  id v17 = [*(id *)(a1 + 32) selectFramesWithRecord:v3 truth:*(void *)(a1 + 40) frameResults:v9];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __126__HMIVideoAnalyzerMutableReport_writeHTMLReportComparison_truth_eventClass_comparisonType_assetPath_outputPath_limit_shuffle___block_invoke_2;
  v39[3] = &unk_26477C808;
  id v18 = v9;
  id v40 = v18;
  id v19 = v16;
  id v41 = v19;
  double v20 = objc_msgSend(v17, "na_map:", v39);
  unint64_t v21 = *(void **)(a1 + 48);
  unint64_t v22 = [v6 source];
  double v23 = [v21 stringByAppendingPathComponent:v22];

  CGFloat v24 = [HMIVideoFragment alloc];
  double v25 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v23];
  id v26 = [(HMIVideoFragment *)v24 initWithData:v25];

  double v27 = [[HMIVideoFrameGenerator alloc] initWithVideoFragment:v26];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __126__HMIVideoAnalyzerMutableReport_writeHTMLReportComparison_truth_eventClass_comparisonType_assetPath_outputPath_limit_shuffle___block_invoke_3;
  v33[3] = &unk_26477C858;
  id v34 = v17;
  id v35 = v18;
  id v36 = v6;
  id v37 = v19;
  id v38 = *(id *)(a1 + 56);
  id v28 = v19;
  id v29 = v6;
  id v30 = v18;
  id v31 = v17;
  double v32 = (void *)MEMORY[0x22A641EE0](v33);
  [(HMIVideoFrameGenerator *)v27 generateVideoFramesForTimes:v20 completionHandler:v32];
}

id __126__HMIVideoAnalyzerMutableReport_writeHTMLReportComparison_truth_eventClass_comparisonType_assetPath_outputPath_limit_shuffle___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 unsignedIntegerValue];
  if (v4 >= [*(id *)(a1 + 32) count])
  {
    unint64_t v9 = [v3 unsignedIntegerValue];
    unint64_t v10 = [*(id *)(a1 + 40) count];
    id v5 = (void *)MEMORY[0x263F08D40];
    if (v9 >= v10)
    {
      long long v15 = *MEMORY[0x263F010E0];
      uint64_t v16 = *(void *)(MEMORY[0x263F010E0] + 16);
      id v12 = [MEMORY[0x263F08D40] valueWithCMTime:&v15];
      goto LABEL_13;
    }
    id v6 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(v3, "unsignedIntegerValue"));
    double v11 = [v6 frame];
    id v8 = v11;
    if (v11) {
      [v11 presentationTimeStamp];
    }
    else {
      memset(v17, 0, sizeof(v17));
    }
    id v13 = v17;
  }
  else
  {
    id v5 = (void *)MEMORY[0x263F08D40];
    id v6 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v3, "unsignedIntegerValue"));
    id v7 = [v6 frame];
    id v8 = v7;
    if (v7) {
      [v7 presentationTimeStamp];
    }
    else {
      memset(v18, 0, sizeof(v18));
    }
    id v13 = v18;
  }
  id v12 = [v5 valueWithCMTime:v13];

LABEL_13:
  return v12;
}

void __126__HMIVideoAnalyzerMutableReport_writeHTMLReportComparison_truth_eventClass_comparisonType_assetPath_outputPath_limit_shuffle___block_invoke_3(id *a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __126__HMIVideoAnalyzerMutableReport_writeHTMLReportComparison_truth_eventClass_comparisonType_assetPath_outputPath_limit_shuffle___block_invoke_4;
  v4[3] = &unk_26477C830;
  id v5 = a1[4];
  id v6 = a1[5];
  id v7 = a1[6];
  id v8 = a1[7];
  id v9 = a1[8];
  [a2 enumerateObjectsUsingBlock:v4];
}

void __126__HMIVideoAnalyzerMutableReport_writeHTMLReportComparison_truth_eventClass_comparisonType_assetPath_outputPath_limit_shuffle___block_invoke_4(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [a1[4] objectAtIndexedSubscript:a3];
  unint64_t v7 = [v6 unsignedIntegerValue];

  unint64_t v8 = [a1[5] count];
  id v9 = [HMIVideoAnalyzerFrameResult alloc];
  if (v7 >= v8)
  {
    unint64_t v10 = [MEMORY[0x263EFFA08] set];
    id v13 = -[HMIVideoAnalyzerFrameResult initWithFrame:events:regionOfInterest:](v9, "initWithFrame:events:regionOfInterest:", v5, v10, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  else
  {
    unint64_t v10 = [a1[5] objectAtIndexedSubscript:v7];
    double v11 = [v10 events];
    id v12 = [a1[5] objectAtIndexedSubscript:v7];
    [v12 regionOfInterest];
    id v13 = -[HMIVideoAnalyzerFrameResult initWithFrame:events:regionOfInterest:](v9, "initWithFrame:events:regionOfInterest:", v5, v11);
  }
  id v14 = NSString;
  uint64_t v15 = [a1[5] count];
  uint64_t v16 = [a1[6] source];
  if (v5) {
    [v5 presentationTimeStamp];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  id v17 = [v14 stringWithFormat:@"[%lu/%lu] %@ (%.2fs)", v7, v15, v16, CMTimeGetSeconds(&time)];

  if (v7 >= [a1[7] count])
  {
    [a1[8] appendFrameResult:v13 frameTruth:0 description:v17];
  }
  else
  {
    id v18 = [a1[7] objectAtIndexedSubscript:v7];
    id v19 = [v18 frame];
    double v20 = v19;
    if (v19) {
      [v19 presentationTimeStamp];
    }

    unint64_t v21 = [(HMIVideoAnalyzerFrameResult *)v13 frame];
    unint64_t v22 = v21;
    if (v21) {
      [v21 presentationTimeStamp];
    }

    [a1[8] appendFrameResult:v13 frameTruth:v18 description:v17];
  }
}

- (void)writeImageCropForEventClass:(Class)a3 outputPath:(id)a4 assetPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = [(HMIVideoAnalyzerMutableReport *)self sessions];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke;
  v13[3] = &unk_26477C980;
  id v15 = v9;
  Class v16 = a3;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  objc_msgSend(v10, "na_each:", v13);
}

void __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  id v6 = [MEMORY[0x263EFF980] array];
  unint64_t v7 = [v4 fragments];
  id v8 = [v7 firstObject];
  id v9 = [v8 frameResults];

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_2;
  v29[3] = &unk_26477C8C8;
  uint64_t v32 = *(void *)(a1 + 48);
  id v10 = v5;
  id v30 = v10;
  id v11 = v6;
  id v31 = v11;
  [v9 enumerateObjectsUsingBlock:v29];
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  CGFloat v24 = __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_7;
  double v25 = &unk_26477C918;
  id v12 = v4;
  id v26 = v12;
  id v13 = v11;
  id v27 = v13;
  id v28 = *(id *)(a1 + 32);
  id v14 = (void (**)(void, void))MEMORY[0x22A641EE0](&v22);
  id v15 = *(void **)(a1 + 40);
  if (v15)
  {
    Class v16 = objc_msgSend(v12, "source", v22, v23, v24, v25, v26, v27);
    id v17 = [v15 stringByAppendingPathComponent:v16];

    id v18 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v17];
    id v19 = [[HMIVideoFragment alloc] initWithData:v18];
    double v20 = [[HMIVideoFrameGenerator alloc] initWithVideoFragment:v19];
    unint64_t v21 = objc_msgSend(v10, "na_map:", &__block_literal_global_316);
    [(HMIVideoFrameGenerator *)v20 generateVideoFramesForTimes:v21 completionHandler:v14];
  }
  else
  {
    id v17 = objc_msgSend(v10, "na_map:", &__block_literal_global_319, v22, v23, v24, v25, v26, v27);
    ((void (**)(void, void *))v14)[2](v14, v17);
  }
}

void __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 events];
  id v5 = [v4 allObjects];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_3;
  v13[3] = &__block_descriptor_40_e40___NSArray_16__0__HMIVideoAnalyzerEvent_8lu32l8;
  void v13[4] = *(void *)(a1 + 48);
  id v6 = objc_msgSend(v5, "na_flatMap:", v13);

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7 == objc_opt_class())
  {
    uint64_t v8 = objc_msgSend(v6, "na_filter:", &__block_literal_global_309);

    id v6 = (void *)v8;
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9 == objc_opt_class())
  {
    uint64_t v10 = objc_msgSend(v6, "na_filter:", &__block_literal_global_312);

    id v6 = (void *)v10;
  }
  if ([v6 count])
  {
    id v11 = *(void **)(a1 + 32);
    id v12 = [v3 frame];
    [v11 addObject:v12];

    [*(id *)(a1 + 40) addObject:v6];
  }
}

id __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 allEvents];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_4;
  v6[3] = &__block_descriptor_40_e31_B16__0__HMIVideoAnalyzerEvent_8lu32l8;
  v6[4] = *(void *)(a1 + 32);
  id v4 = objc_msgSend(v3, "na_filter:", v6);

  return v4;
}

uint64_t __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_4()
{
  return objc_opt_isKindOfClass() & 1;
}

BOOL __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 faceRecognition];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = [a2 torsoRecognition];
  BOOL v3 = v2 != 0;

  return v3;
}

void __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_7(id *a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_8;
  v4[3] = &unk_26477C8F0;
  id v5 = a1[4];
  id v6 = a1[5];
  id v7 = a1[6];
  [a2 enumerateObjectsUsingBlock:v4];
}

void __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 source];
  id v9 = [v7 stringByDeletingPathExtension];

  uint64_t v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  +[HMIVideoAnalyzerMutableReport writeImageCropFromFrame:v6 events:v8 outputPath:*(void *)(a1 + 48) source:v9];
}

id __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F08D40];
  if (a2) {
    [a2 presentationTimeStamp];
  }
  else {
    memset(v5, 0, sizeof(v5));
  }
  BOOL v3 = [v2 valueWithCMTime:v5];
  return v3;
}

id __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v4 = 0;
  id v2 = [a2 pixelBufferFrameWithError:&v4];
  return v2;
}

- (void)writeFragmentFileComparison:(id)a3 eventClass:(Class)a4 outputPath:(id)a5
{
  v19[3] = *MEMORY[0x263EF8340];
  id v8 = a5;
  v18[0] = @"TP";
  id v9 = a3;
  uint64_t v10 = [v9 truePositiveKeys];
  v19[0] = v10;
  v18[1] = @"FP";
  id v11 = [v9 falsePositiveKeys];
  v19[1] = v11;
  v18[2] = @"FN";
  id v12 = [v9 falseNegativeKeys];

  v19[2] = v12;
  id v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83__HMIVideoAnalyzerMutableReport_writeFragmentFileComparison_eventClass_outputPath___block_invoke;
  v15[3] = &unk_26477C9F0;
  id v16 = v8;
  Class v17 = a4;
  v15[4] = self;
  id v14 = v8;
  objc_msgSend(v13, "na_each:", v15);
}

void __83__HMIVideoAnalyzerMutableReport_writeFragmentFileComparison_eventClass_outputPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x263EFFA08];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __83__HMIVideoAnalyzerMutableReport_writeFragmentFileComparison_eventClass_outputPath___block_invoke_2;
  void v17[3] = &unk_26477C9A8;
  v17[4] = *(void *)(a1 + 32);
  id v6 = a2;
  id v7 = objc_msgSend(a3, "na_map:", v17);
  id v8 = [v5 setWithArray:v7];

  id v9 = [v8 allObjects];
  uint64_t v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_323];
  id v11 = [v10 componentsJoinedByString:@"\n"];

  id v12 = NSString;
  id v13 = +[HMIVideoAnalyzerEvent shortNameForEventClass:*(void *)(a1 + 48)];
  id v14 = [v12 stringWithFormat:@"Fragment%@%@.txt", v13, v6];

  id v15 = [*(id *)(a1 + 40) stringByAppendingPathComponent:v14];
  uint64_t v16 = 0;
  [v11 writeToFile:v15 atomically:1 encoding:4 error:&v16];
}

id __83__HMIVideoAnalyzerMutableReport_writeFragmentFileComparison_eventClass_outputPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 sessions];
  id v5 = [v3 key];

  id v6 = [v4 objectForKeyedSubscript:v5];
  id v7 = [v6 source];

  return v7;
}

uint64_t __83__HMIVideoAnalyzerMutableReport_writeFragmentFileComparison_eventClass_outputPath___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (void)writeJSONChartData:(id)a3 outputPath:(id)a4
{
  id v5 = (void *)MEMORY[0x263EFF9A0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 dictionary];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __63__HMIVideoAnalyzerMutableReport_writeJSONChartData_outputPath___block_invoke;
  void v17[3] = &unk_26477BC50;
  id v18 = v8;
  id v9 = v8;
  objc_msgSend(v7, "na_each:", v17);

  uint64_t v10 = [v6 stringByAppendingPathComponent:@"PRArray.json"];

  id v16 = 0;
  id v11 = [MEMORY[0x263F08900] dataWithJSONObject:v9 options:1 error:&v16];
  id v12 = v16;
  id v13 = (void *)[[NSString alloc] initWithData:v11 encoding:4];
  id v15 = v12;
  [v13 writeToFile:v10 atomically:1 encoding:4 error:&v15];
  id v14 = v15;
}

void __63__HMIVideoAnalyzerMutableReport_writeJSONChartData_outputPath___block_invoke(uint64_t a1, void *a2)
{
  v13[3] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = [v3 objectForKeyedSubscript:@"class"];
    id v5 = [v3 objectForKeyedSubscript:@"precision"];
    id v6 = [v3 objectForKeyedSubscript:@"recall"];
    id v7 = [v3 objectForKeyedSubscript:@"threshold"];
    id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];

    if (!v8)
    {
      id v9 = [MEMORY[0x263EFF980] array];
      [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v4];
    }
    uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
    v12[0] = @"precision";
    v12[1] = @"recall";
    v13[0] = v5;
    v13[1] = v6;
    v12[2] = @"threshold";
    v13[2] = v7;
    id v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
    [v10 addObject:v11];
  }
}

+ (id)chartSpecWithRange:(CGRect)a3 colors:(id)a4 labels:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v91[7] = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = [MEMORY[0x263EFF9A0] dictionary];
  if ([v10 count])
  {
    id v13 = [v10 allKeys];
    id v14 = [v13 sortedArrayUsingSelector:sel_localizedStandardCompare_];

    [v12 setObject:v14 forKeyedSubscript:@"domain"];
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __66__HMIVideoAnalyzerMutableReport_chartSpecWithRange_colors_labels___block_invoke;
    void v55[3] = &unk_26477CA18;
    id v56 = v10;
    id v15 = objc_msgSend(v14, "na_map:", v55);
    [v12 setObject:v15 forKeyedSubscript:@"range"];
  }
  id v54 = v10;
  id v16 = [MEMORY[0x263EFF9A0] dictionary];
  if ([v11 count])
  {
    Class v17 = objc_msgSend(v11, "na_map:", &__block_literal_global_347);
    id v18 = [v17 componentsJoinedByString:@", "];

    id v19 = [NSString stringWithFormat:@"{%@}[datum.label]", v18];
    [v16 setObject:v19 forKeyedSubscript:@"labelExpr"];
  }
  v90[0] = @"$schema";
  v90[1] = @"description";
  v91[0] = @"https://vega.github.io/schema/vega-lite/v4.json";
  v91[1] = @"PR Curves";
  v90[2] = @"width";
  v90[3] = @"height";
  v91[2] = @"container";
  v91[3] = @"container";
  v90[4] = @"data";
  v90[5] = @"config";
  v91[4] = &unk_26D9A9B98;
  v91[5] = &unk_26D9A9C10;
  v90[6] = @"layer";
  v88[0] = &unk_26D9A9C38;
  v87[0] = @"mark";
  v87[1] = @"encoding";
  v85[0] = @"x";
  id v53 = v11;
  v83[0] = @"field";
  v83[1] = @"type";
  v84[0] = @"recall";
  v84[1] = @"quantitative";
  v83[2] = @"scale";
  v81 = @"domain";
  v93.origin.CGFloat x = x;
  v93.origin.CGFloat y = y;
  v93.size.CGFloat width = width;
  v93.size.CGFloat height = height;
  id v52 = [NSNumber numberWithDouble:CGRectGetMinX(v93)];
  v80[0] = v52;
  v94.origin.CGFloat x = x;
  v94.origin.CGFloat y = y;
  v94.size.CGFloat width = width;
  v94.size.CGFloat height = height;
  id v51 = [NSNumber numberWithDouble:CGRectGetMaxX(v94)];
  v80[1] = v51;
  v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:2];
  v82 = v50;
  id v46 = v16;
  id v49 = [NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
  v84[2] = v49;
  id v48 = [NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:3];
  v86[0] = v48;
  v85[1] = @"y";
  v78[0] = @"field";
  v78[1] = @"type";
  v79[0] = @"precision";
  v79[1] = @"quantitative";
  v78[2] = @"scale";
  v76 = @"domain";
  v95.origin.CGFloat x = x;
  v95.origin.CGFloat y = y;
  v95.size.CGFloat width = width;
  v95.size.CGFloat height = height;
  uint64_t v47 = [NSNumber numberWithDouble:CGRectGetMinY(v95)];
  v75[0] = v47;
  v96.origin.CGFloat x = x;
  v96.origin.CGFloat y = y;
  v96.size.CGFloat width = width;
  v96.size.CGFloat height = height;
  double v45 = [NSNumber numberWithDouble:CGRectGetMaxY(v96)];
  v75[1] = v45;
  double v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v75 count:2];
  v77 = v44;
  double v43 = [NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
  v79[2] = v43;
  id v42 = [NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:3];
  v86[1] = v42;
  v85[2] = @"color";
  v73[0] = @"field";
  v73[1] = @"type";
  v74[0] = @"class";
  v74[1] = @"nominal";
  v73[2] = @"scale";
  v73[3] = @"legend";
  v74[2] = v12;
  v74[3] = v16;
  id v41 = [NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:4];
  v86[2] = v41;
  v85[3] = @"opacity";
  v71[0] = @"field";
  v71[1] = @"type";
  v72[0] = @"opacity";
  v72[1] = @"nominal";
  v71[2] = @"legend";
  id v40 = [MEMORY[0x263EFF9D0] null];
  v72[2] = v40;
  double v39 = [NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:3];
  v86[3] = v39;
  id v38 = [NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:4];
  v88[1] = v38;
  id v37 = [NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:2];
  v89[0] = v37;
  v69[0] = @"mark";
  v69[1] = @"encoding";
  v70[0] = &unk_26D9A9C60;
  v68[0] = &unk_26D9A9C88;
  v67[0] = @"text";
  v67[1] = @"x";
  v65[0] = @"field";
  v65[1] = @"type";
  v66[0] = @"recall";
  v66[1] = @"quantitative";
  v65[2] = @"scale";
  v63 = @"domain";
  v97.origin.CGFloat x = x;
  v97.origin.CGFloat y = y;
  v97.size.CGFloat width = width;
  v97.size.CGFloat height = height;
  id v36 = [NSNumber numberWithDouble:CGRectGetMinX(v97)];
  v62[0] = v36;
  v98.origin.CGFloat x = x;
  v98.origin.CGFloat y = y;
  v98.size.CGFloat width = width;
  v98.size.CGFloat height = height;
  id v35 = [NSNumber numberWithDouble:CGRectGetMaxX(v98)];
  v62[1] = v35;
  id v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:2];
  v64 = v34;
  float v33 = [NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
  v66[2] = v33;
  uint64_t v32 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:3];
  v68[1] = v32;
  v67[2] = @"y";
  v60[0] = @"field";
  v60[1] = @"type";
  v61[0] = @"precision";
  v61[1] = @"quantitative";
  v60[2] = @"scale";
  v58 = @"domain";
  v99.origin.CGFloat x = x;
  v99.origin.CGFloat y = y;
  v99.size.CGFloat width = width;
  v99.size.CGFloat height = height;
  double v20 = [NSNumber numberWithDouble:CGRectGetMinY(v99)];
  v57[0] = v20;
  v100.origin.CGFloat x = x;
  v100.origin.CGFloat y = y;
  v100.size.CGFloat width = width;
  v100.size.CGFloat height = height;
  unint64_t v21 = [NSNumber numberWithDouble:CGRectGetMaxY(v100)];
  v57[1] = v21;
  uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:2];
  v59 = v22;
  uint64_t v23 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
  v61[2] = v23;
  CGFloat v24 = [NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:3];
  v68[2] = v24;
  double v25 = [NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:3];
  v70[1] = v25;
  id v26 = [NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:2];
  v89[1] = v26;
  id v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:2];
  v91[6] = v27;
  id v28 = [NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:7];

  id v29 = [MEMORY[0x263F08900] dataWithJSONObject:v28 options:0 error:0];
  id v30 = (void *)[[NSString alloc] initWithData:v29 encoding:4];

  return v30;
}

uint64_t __66__HMIVideoAnalyzerMutableReport_chartSpecWithRange_colors_labels___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

uint64_t __66__HMIVideoAnalyzerMutableReport_chartSpecWithRange_colors_labels___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [NSString stringWithFormat:@"'%@': '%@'", a2, a3];
}

+ (void)writeImageCropFromFrame:(id)a3 events:(id)a4 outputPath:(id)a5 source:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = NSURL;
  id v12 = a4;
  id v13 = [v11 fileURLWithPath:a5];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __82__HMIVideoAnalyzerMutableReport_writeImageCropFromFrame_events_outputPath_source___block_invoke;
  void v17[3] = &unk_26477CA60;
  id v18 = v9;
  id v19 = v10;
  id v20 = v13;
  id v14 = v13;
  id v15 = v10;
  id v16 = v9;
  [v12 enumerateObjectsUsingBlock:v17];
}

void __82__HMIVideoAnalyzerMutableReport_writeImageCropFromFrame_events_outputPath_source___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  id v8 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v7)
  {
    uint64_t v11 = [*(id *)(a1 + 32) pixelBuffer];
    id v12 = [v7 roll];
    id v45 = 0;
    id v13 = +[HMIFaceprinter createFacePixelBufferForFaceEvent:v7 pixelBuffer:v11 roll:v12 error:&v45];
    id v14 = v45;
  }
  else
  {
    if (v10)
    {
      uint64_t v15 = [*(id *)(a1 + 32) pixelBuffer];
      double v44 = 0;
      id v13 = +[HMITorsoprinter createTorsoPixelBufferForTorsoEvent:v10 pixelBuffer:v15 error:&v44];
      id v16 = v44;
    }
    else
    {
      double Size = HMICVPixelBufferGetSize((__CVBuffer *)[*(id *)(a1 + 32) pixelBuffer]);
      CGFloat v19 = v18;
      [v8 boundingBox];
      HMICGRectPixelFromNormalized(v20, v21, v22, v23, Size, v19);
      CGRect v47 = CGRectIntegral(v46);
      double x = v47.origin.x;
      double y = v47.origin.y;
      double width = v47.size.width;
      double height = v47.size.height;
      uint64_t v28 = [*(id *)(a1 + 32) pixelBuffer];
      double v43 = 0;
      id v13 = +[HMIVisionUtilities transferPixelBuffer:crop:size:pixelFormat:options:error:](HMIVisionUtilities, "transferPixelBuffer:crop:size:pixelFormat:options:error:", v28, 1111970369, 8, &v43, x, y, width, height, width, height);
      id v16 = v43;
    }
    id v14 = v16;
  }
  id v40 = v7;
  CVPixelBufferLockBaseAddress(v13, 1uLL);
  id v29 = (void *)[objc_alloc(MEMORY[0x263F00650]) initWithCVPixelBuffer:v13];
  CVPixelBufferUnlockBaseAddress(v13, 1uLL);
  CVPixelBufferRelease(v13);
  id v30 = *(void **)(a1 + 32);
  id v31 = v10;
  if (v30) {
    [v30 presentationTimeStamp];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  Float64 v32 = CMTimeGetSeconds(&time) * 1000.0;
  float v33 = +[HMIVideoAnalyzerEvent shortNameForEventClass:objc_opt_class()];
  id v34 = [NSString stringWithFormat:@"%@_%.0f_%@_%lu.png", *(void *)(a1 + 40), *(void *)&v32, v33, a3];
  id v35 = [NSURL fileURLWithPath:v34 relativeToURL:*(void *)(a1 + 48)];
  uint64_t v36 = MEMORY[0x263EFFA78];
  id v37 = [MEMORY[0x263F00628] contextWithOptions:MEMORY[0x263EFFA78]];
  uint64_t v38 = *MEMORY[0x263F00868];
  id v41 = v14;
  objc_msgSend(v37, "writePNGRepresentationOfImage:toURL:format:colorSpace:options:error:", v29, v35, v38, objc_msgSend(v29, "colorSpace"), v36, &v41);
  id v39 = v41;
}

+ (id)greedyMatchBetweenPredictionEvents:(id)a3 truthEvents:(id)a4 falsePositiveIndices:(id)a5 falseNegativeIndices:(id)a6 eventClass:(Class)a7 regionOfInterest:(CGRect)a8 confidenceThreshold:(float)a9 scoreThreshold:(float)a10 scoreFunction:(id)a11
{
  CGFloat height = a8.size.height;
  CGFloat width = a8.size.width;
  CGFloat y = a8.origin.y;
  CGFloat x = a8.origin.x;
  v70[1] = *MEMORY[0x263EF8340];
  id v22 = a3;
  id v23 = a4;
  id v24 = a5;
  id v25 = a6;
  id v26 = a11;
  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 3221225472;
  v66[2] = __199__HMIVideoAnalyzerMutableReport_greedyMatchBetweenPredictionEvents_truthEvents_falsePositiveIndices_falseNegativeIndices_eventClass_regionOfInterest_confidenceThreshold_scoreThreshold_scoreFunction___block_invoke;
  void v66[3] = &unk_26477CA88;
  Class v68 = a7;
  float v69 = a9;
  id v27 = v24;
  id v67 = v27;
  [v22 enumerateObjectsUsingBlock:v66];
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __199__HMIVideoAnalyzerMutableReport_greedyMatchBetweenPredictionEvents_truthEvents_falsePositiveIndices_falseNegativeIndices_eventClass_regionOfInterest_confidenceThreshold_scoreThreshold_scoreFunction___block_invoke_2;
  v59[3] = &unk_26477CAB0;
  Class v61 = a7;
  CGFloat v62 = x;
  CGFloat v63 = y;
  CGFloat v64 = width;
  CGFloat v65 = height;
  id v28 = v25;
  id v60 = v28;
  [v23 enumerateObjectsUsingBlock:v59];
  id v29 = [MEMORY[0x263EFF980] array];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __199__HMIVideoAnalyzerMutableReport_greedyMatchBetweenPredictionEvents_truthEvents_falsePositiveIndices_falseNegativeIndices_eventClass_regionOfInterest_confidenceThreshold_scoreThreshold_scoreFunction___block_invoke_3;
  v48[3] = &unk_26477CB00;
  id v30 = v28;
  id v52 = v29;
  id v53 = v26;
  id v49 = v30;
  id v50 = v22;
  CGFloat v54 = x;
  CGFloat v55 = y;
  CGFloat v56 = width;
  CGFloat v57 = height;
  float v58 = a10;
  id v51 = v23;
  id v31 = v29;
  id v32 = v23;
  id v33 = v22;
  id v34 = v26;
  objc_msgSend(v27, "na_each:", v48);
  id v35 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"score" ascending:0];
  v70[0] = v35;
  uint64_t v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:1];
  id v37 = [v31 sortedArrayUsingDescriptors:v36];

  uint64_t v38 = [MEMORY[0x263EFF9A0] dictionary];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __199__HMIVideoAnalyzerMutableReport_greedyMatchBetweenPredictionEvents_truthEvents_falsePositiveIndices_falseNegativeIndices_eventClass_regionOfInterest_confidenceThreshold_scoreThreshold_scoreFunction___block_invoke_5;
  v44[3] = &unk_26477CB28;
  id v45 = v30;
  id v46 = v27;
  id v47 = v38;
  id v39 = v38;
  id v40 = v27;
  id v41 = v30;
  objc_msgSend(v37, "na_each:", v44);
  id v42 = (void *)[v39 copy];

  return v42;
}

void __199__HMIVideoAnalyzerMutableReport_greedyMatchBetweenPredictionEvents_truthEvents_falsePositiveIndices_falseNegativeIndices_eventClass_regionOfInterest_confidenceThreshold_scoreThreshold_scoreFunction___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v11 confidence];
    [v5 value];
    double v7 = v6;
    double v8 = *(float *)(a1 + 48);

    if (v7 >= v8)
    {
      id v9 = *(void **)(a1 + 32);
      id v10 = [NSNumber numberWithUnsignedInteger:a3];
      [v9 addObject:v10];
    }
  }
}

void __199__HMIVideoAnalyzerMutableReport_greedyMatchBetweenPredictionEvents_truthEvents_falsePositiveIndices_falseNegativeIndices_eventClass_regionOfInterest_confidenceThreshold_scoreThreshold_scoreFunction___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  if (objc_opt_isKindOfClass())
  {
    [v11 boundingBox];
    v13.origin.CGFloat x = v5;
    v13.origin.CGFloat y = v6;
    v13.size.CGFloat width = v7;
    v13.size.CGFloat height = v8;
    if (CGRectIntersectsRect(*(CGRect *)(a1 + 48), v13))
    {
      id v9 = *(void **)(a1 + 32);
      id v10 = [NSNumber numberWithUnsignedInteger:a3];
      [v9 addObject:v10];
    }
  }
}

void __199__HMIVideoAnalyzerMutableReport_greedyMatchBetweenPredictionEvents_truthEvents_falsePositiveIndices_falseNegativeIndices_eventClass_regionOfInterest_confidenceThreshold_scoreThreshold_scoreFunction___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __199__HMIVideoAnalyzerMutableReport_greedyMatchBetweenPredictionEvents_truthEvents_falsePositiveIndices_falseNegativeIndices_eventClass_regionOfInterest_confidenceThreshold_scoreThreshold_scoreFunction___block_invoke_4;
  v6[3] = &unk_26477CAD8;
  id v11 = *(id *)(a1 + 64);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  long long v12 = *(_OWORD *)(a1 + 72);
  long long v13 = *(_OWORD *)(a1 + 88);
  int v14 = *(_DWORD *)(a1 + 104);
  id v10 = *(id *)(a1 + 56);
  id v5 = v3;
  objc_msgSend(v4, "na_each:", v6);
}

void __199__HMIVideoAnalyzerMutableReport_greedyMatchBetweenPredictionEvents_truthEvents_falsePositiveIndices_falseNegativeIndices_eventClass_regionOfInterest_confidenceThreshold_scoreThreshold_scoreFunction___block_invoke_4(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"));
  id v5 = objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", objc_msgSend(v11, "unsignedIntegerValue"));
  float v6 = (*(float (**)(uint64_t, void *, void *, double, double, double, double))(v3 + 16))(v3, v4, v5, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));

  if (v6 > *(float *)(a1 + 104))
  {
    id v7 = *(void **)(a1 + 56);
    id v8 = [HMIVideoAnalyzerReportMatch alloc];
    *(float *)&double v9 = v6;
    id v10 = [(HMIVideoAnalyzerReportMatch *)v8 initWithTruth:v11 prediction:*(void *)(a1 + 40) score:v9];
    [v7 addObject:v10];
  }
}

void __199__HMIVideoAnalyzerMutableReport_greedyMatchBetweenPredictionEvents_truthEvents_falsePositiveIndices_falseNegativeIndices_eventClass_regionOfInterest_confidenceThreshold_scoreThreshold_scoreFunction___block_invoke_5(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  id v15 = v3;
  id v5 = [v3 truth];
  if ([v4 containsObject:v5])
  {
    float v6 = (void *)a1[5];
    id v7 = [v15 prediction];
    LODWORD(v6) = [v6 containsObject:v7];

    id v8 = v15;
    if (!v6) {
      goto LABEL_5;
    }
    double v9 = (void *)a1[4];
    id v10 = [v15 truth];
    [v9 removeObject:v10];

    id v11 = (void *)a1[5];
    long long v12 = [v15 prediction];
    [v11 removeObject:v12];

    id v5 = [v15 truth];
    long long v13 = (void *)a1[6];
    int v14 = [v15 prediction];
    [v13 setObject:v5 forKeyedSubscript:v14];
  }
  id v8 = v15;
LABEL_5:
}

+ (void)sihouetteScoreForMatches:(id)a3 previousMatches:(id)a4 truePositiveScores:(id)a5 falsePositiveScores:(id)a6 falseNegativeScores:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __133__HMIVideoAnalyzerMutableReport_sihouetteScoreForMatches_previousMatches_truePositiveScores_falsePositiveScores_falseNegativeScores___block_invoke;
  v19[3] = &unk_26477CB78;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v23 = v14;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  [a4 enumerateKeysAndObjectsUsingBlock:v19];
}

void __133__HMIVideoAnalyzerMutableReport_sihouetteScoreForMatches_previousMatches_truePositiveScores_falsePositiveScores_falseNegativeScores___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __133__HMIVideoAnalyzerMutableReport_sihouetteScoreForMatches_previousMatches_truePositiveScores_falsePositiveScores_falseNegativeScores___block_invoke_2;
  v10[3] = &unk_26477CB50;
  id v11 = v6;
  id v12 = v5;
  id v7 = *(void **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v8 = v5;
  id v9 = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];
}

void __133__HMIVideoAnalyzerMutableReport_sihouetteScoreForMatches_previousMatches_truePositiveScores_falsePositiveScores_falseNegativeScores___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 boundingBox];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [v6 boundingBox];
  float v20 = (HMICGRectGeneralizedIntersectionOverUnion(v9, v11, v13, v15, v16, v17, v18, v19) + 1.0) * 0.5;
  id v21 = [*(id *)(a1 + 32) sessionEntityUUID];
  id v22 = [v6 sessionEntityUUID];

  id v23 = *(id *)(a1 + 40);
  if (v21 == v22 && v23 == v7)
  {
    id v25 = *(void **)(a1 + 48);
    *(float *)&double v24 = v20;
    id v26 = [NSNumber numberWithFloat:v24];
    [v25 addObject:v26];
  }
  if (v21 == v22 && v23 != v7)
  {
    id v27 = *(void **)(a1 + 56);
    *(float *)&double v24 = v20;
    id v28 = [NSNumber numberWithFloat:v24];
    [v27 addObject:v28];
  }
  if (v21 != v22 && v23 == v7)
  {
    id v29 = *(void **)(a1 + 64);
    *(float *)&double v24 = v20;
    id v30 = [NSNumber numberWithFloat:v24];
    [v29 addObject:v30];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMIVideoAnalyzerMutableReport *)self name];
  id v6 = NSStringFromSelector(sel_name);
  [v4 encodeObject:v5 forKey:v6];

  int64_t v7 = [(HMIVideoAnalyzerMutableReport *)self version];
  double v8 = NSStringFromSelector(sel_version);
  [v4 encodeInteger:v7 forKey:v8];

  CGFloat v9 = [(HMIVideoAnalyzerMutableReport *)self deviceInformation];
  double v10 = NSStringFromSelector(sel_deviceInformation);
  [v4 encodeObject:v9 forKey:v10];

  id v13 = [(HMIVideoAnalyzerMutableReport *)self sessions];
  CGFloat v11 = (void *)[v13 copy];
  double v12 = NSStringFromSelector(sel_sessions);
  [v4 encodeObject:v11 forKey:v12];
}

- (HMIVideoAnalyzerMutableReport)initWithCoder:(id)a3
{
  v27[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = NSStringFromSelector(sel_name);
  id v6 = [v3 decodeObjectOfClass:v4 forKey:v5];

  int64_t v7 = NSStringFromSelector(sel_version);
  uint64_t v23 = [v3 decodeIntegerForKey:v7];

  double v8 = (void *)MEMORY[0x263EFFA08];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  CGFloat v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];
  double v10 = [v8 setWithArray:v9];
  CGFloat v11 = NSStringFromSelector(sel_deviceInformation);
  double v12 = [v3 decodeObjectOfClasses:v10 forKey:v11];

  id v13 = (void *)MEMORY[0x263EFFA08];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v26[2] = objc_opt_class();
  double v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:3];
  CGFloat v15 = [v13 setWithArray:v14];
  CGFloat v16 = NSStringFromSelector(sel_sessions);
  CGFloat v17 = [v3 decodeObjectOfClasses:v15 forKey:v16];

  v25.receiver = self;
  v25.super_class = (Class)HMIVideoAnalyzerMutableReport;
  CGFloat v18 = [(HMIVideoAnalyzerMutableReport *)&v25 init];
  CGFloat v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_name, v6);
    v19->_version = v23;
    objc_storeStrong((id *)&v19->_deviceInformation, v12);
    uint64_t v20 = [v17 mutableCopy];
    sessions = v19->_sessions;
    v19->_sessions = (NSMutableDictionary *)v20;
  }
  return v19;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)version
{
  return self->_version;
}

- (NSDictionary)deviceInformation
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)sessions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_deviceInformation, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end