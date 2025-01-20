@interface LighthouseCoreMLEvaluationResult
- (LighthouseCoreMLEvaluationResult)init;
- (NSNumber)accuracy;
- (void)setAccuracy:(id)a3;
@end

@implementation LighthouseCoreMLEvaluationResult

- (LighthouseCoreMLEvaluationResult)init
{
  v7.receiver = self;
  v7.super_class = (Class)LighthouseCoreMLEvaluationResult;
  v2 = [(LighthouseCoreMLEvaluationResult *)&v7 init];
  if (v2)
  {
    LODWORD(v3) = -1.0;
    uint64_t v4 = [NSNumber numberWithFloat:v3];
    accuracy = v2->_accuracy;
    v2->_accuracy = (NSNumber *)v4;
  }
  return v2;
}

- (NSNumber)accuracy
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccuracy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end