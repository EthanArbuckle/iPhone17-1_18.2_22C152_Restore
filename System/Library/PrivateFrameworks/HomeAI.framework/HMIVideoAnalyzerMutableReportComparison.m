@interface HMIVideoAnalyzerMutableReportComparison
- (HMIVideoAnalyzerMutableReportComparison)initWithTruePositiveKeys:(id)a3 falseNegativeKeys:(id)a4 falsePositiveKeys:(id)a5 groupByKey:(BOOL)a6;
- (NSArray)falseNegativeKeys;
- (NSArray)falsePositiveKeys;
- (NSArray)truePositiveKeys;
- (float)precision;
- (float)recall;
- (id)attributeDescriptions;
- (id)description;
- (int64_t)falseNegative;
- (int64_t)falsePositive;
- (int64_t)truePositive;
@end

@implementation HMIVideoAnalyzerMutableReportComparison

- (HMIVideoAnalyzerMutableReportComparison)initWithTruePositiveKeys:(id)a3 falseNegativeKeys:(id)a4 falsePositiveKeys:(id)a5 groupByKey:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v34.receiver = self;
  v34.super_class = (Class)HMIVideoAnalyzerMutableReportComparison;
  v14 = [(HMIVideoAnalyzerMutableReportComparison *)&v34 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_truePositiveKeys, a3);
    objc_storeStrong((id *)&v15->_falseNegativeKeys, a4);
    objc_storeStrong((id *)&v15->_falsePositiveKeys, a5);
    if (v6)
    {
      v16 = (void *)MEMORY[0x263EFFA08];
      v17 = objc_msgSend(v11, "na_map:", &__block_literal_global_14);
      v18 = [v16 setWithArray:v17];
      v15->_uint64_t truePositive = [v18 count];

      v19 = (void *)MEMORY[0x263EFFA08];
      v20 = objc_msgSend(v12, "na_map:", &__block_literal_global_53);
      v21 = [v19 setWithArray:v20];
      v15->_falseNegative = [v21 count];

      v22 = (void *)MEMORY[0x263EFFA08];
      v23 = objc_msgSend(v13, "na_map:", &__block_literal_global_55);
      v24 = [v22 setWithArray:v23];
      v15->_falsePositive = [v24 count];
    }
    else
    {
      v25 = [v11 valueForKeyPath:@"@sum.count"];
      v15->_uint64_t truePositive = (int)[v25 intValue];

      v26 = [v12 valueForKeyPath:@"@sum.count"];
      v15->_falseNegative = (int)[v26 intValue];

      v23 = [v13 valueForKeyPath:@"@sum.count"];
      v15->_falsePositive = (int)[v23 intValue];
    }

    uint64_t truePositive = v15->_truePositive;
    float v28 = (float)truePositive;
    uint64_t v29 = v15->_falsePositive + truePositive;
    float v30 = (float)truePositive / (float)v29;
    if (!v29) {
      float v30 = 0.0;
    }
    v15->_precision = v30;
    uint64_t v31 = v15->_falseNegative + truePositive;
    float v32 = v28 / (float)v31;
    if (!v31) {
      float v32 = 0.0;
    }
    v15->_recall = v32;
  }

  return v15;
}

uint64_t __115__HMIVideoAnalyzerMutableReportComparison_initWithTruePositiveKeys_falseNegativeKeys_falsePositiveKeys_groupByKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 key];
}

uint64_t __115__HMIVideoAnalyzerMutableReportComparison_initWithTruePositiveKeys_falseNegativeKeys_falsePositiveKeys_groupByKey___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 key];
}

uint64_t __115__HMIVideoAnalyzerMutableReportComparison_initWithTruePositiveKeys_falseNegativeKeys_falsePositiveKeys_groupByKey___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 key];
}

- (id)description
{
  return (id)MEMORY[0x270F30880](self, a2);
}

- (id)attributeDescriptions
{
  v22[5] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = NSNumber;
  [(HMIVideoAnalyzerMutableReportComparison *)self precision];
  v21 = objc_msgSend(v4, "numberWithFloat:");
  v5 = (void *)[v3 initWithName:@"Precision" value:v21];
  v22[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = NSNumber;
  [(HMIVideoAnalyzerMutableReportComparison *)self recall];
  v8 = objc_msgSend(v7, "numberWithFloat:");
  v9 = (void *)[v6 initWithName:@"Recall" value:v8];
  v22[1] = v9;
  id v10 = objc_alloc(MEMORY[0x263F424F8]);
  id v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMIVideoAnalyzerMutableReportComparison truePositive](self, "truePositive"));
  id v12 = (void *)[v10 initWithName:@"True Positive" value:v11];
  v22[2] = v12;
  id v13 = objc_alloc(MEMORY[0x263F424F8]);
  v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMIVideoAnalyzerMutableReportComparison falseNegative](self, "falseNegative"));
  v15 = (void *)[v13 initWithName:@"False Negative" value:v14];
  v22[3] = v15;
  id v16 = objc_alloc(MEMORY[0x263F424F8]);
  v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMIVideoAnalyzerMutableReportComparison falsePositive](self, "falsePositive"));
  v18 = (void *)[v16 initWithName:@"False Positive" value:v17];
  v22[4] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:5];

  return v19;
}

- (float)precision
{
  return self->_precision;
}

- (float)recall
{
  return self->_recall;
}

- (NSArray)truePositiveKeys
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)falseNegativeKeys
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)falsePositiveKeys
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)truePositive
{
  return self->_truePositive;
}

- (int64_t)falseNegative
{
  return self->_falseNegative;
}

- (int64_t)falsePositive
{
  return self->_falsePositive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_falsePositiveKeys, 0);
  objc_storeStrong((id *)&self->_falseNegativeKeys, 0);
  objc_storeStrong((id *)&self->_truePositiveKeys, 0);
}

@end