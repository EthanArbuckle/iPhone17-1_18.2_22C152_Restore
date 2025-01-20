@interface HMIVideoAnalyzerReportMatch
- (HMIVideoAnalyzerReportMatch)initWithTruth:(id)a3 prediction:(id)a4 score:(float)a5;
- (NSNumber)prediction;
- (NSNumber)truth;
- (float)score;
@end

@implementation HMIVideoAnalyzerReportMatch

- (HMIVideoAnalyzerReportMatch)initWithTruth:(id)a3 prediction:(id)a4 score:(float)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMIVideoAnalyzerReportMatch;
  v11 = [(HMIVideoAnalyzerReportMatch *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_truth, a3);
    objc_storeStrong((id *)&v12->_prediction, a4);
    v12->_score = a5;
  }

  return v12;
}

- (NSNumber)truth
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)prediction
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (float)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prediction, 0);
  objc_storeStrong((id *)&self->_truth, 0);
}

@end