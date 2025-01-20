@interface HMIVideoAnalyzerReportRecord
- (HMIVideoAnalyzerReportRecord)initWithKey:(id)a3 classificationScore:(id)a4;
- (HMIVideoAnalyzerReportRecord)initWithKey:(id)a3 detectionScores:(id)a4 frameResultIndex:(unint64_t)a5;
- (HMIVideoAnalyzerReportRecord)initWithKey:(id)a3 trackingScores:(id)a4 frameResultIndices:(id)a5;
- (NSArray)frameResultIndices;
- (NSString)key;
- (float)score;
- (unint64_t)count;
@end

@implementation HMIVideoAnalyzerReportRecord

- (HMIVideoAnalyzerReportRecord)initWithKey:(id)a3 classificationScore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMIVideoAnalyzerReportRecord;
  v9 = [(HMIVideoAnalyzerReportRecord *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    v10->_count = 1;
    [v8 floatValue];
    v10->_score = v11;
    frameResultIndices = v10->_frameResultIndices;
    v10->_frameResultIndices = (NSArray *)MEMORY[0x263EFFA68];
  }
  return v10;
}

- (HMIVideoAnalyzerReportRecord)initWithKey:(id)a3 detectionScores:(id)a4 frameResultIndex:(unint64_t)a5
{
  v20[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HMIVideoAnalyzerReportRecord;
  float v11 = [(HMIVideoAnalyzerReportRecord *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_key, a3);
    v12->_count = [v10 count];
    v13 = [v10 valueForKeyPath:@"@max.floatValue"];
    [v13 floatValue];
    v12->_score = v14;

    v15 = [NSNumber numberWithUnsignedInteger:a5];
    v20[0] = v15;
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    frameResultIndices = v12->_frameResultIndices;
    v12->_frameResultIndices = (NSArray *)v16;
  }
  return v12;
}

- (HMIVideoAnalyzerReportRecord)initWithKey:(id)a3 trackingScores:(id)a4 frameResultIndices:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMIVideoAnalyzerReportRecord;
  v12 = [(HMIVideoAnalyzerReportRecord *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_key, a3);
    v13->_count = [v10 count];
    float v14 = [v10 valueForKeyPath:@"@max.floatValue"];
    [v14 floatValue];
    v13->_score = v15;

    objc_storeStrong((id *)&v13->_frameResultIndices, a5);
  }

  return v13;
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)count
{
  return self->_count;
}

- (float)score
{
  return self->_score;
}

- (NSArray)frameResultIndices
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameResultIndices, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end