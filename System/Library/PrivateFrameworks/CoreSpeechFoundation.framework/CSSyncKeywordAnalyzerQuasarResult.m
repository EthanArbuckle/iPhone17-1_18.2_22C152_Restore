@interface CSSyncKeywordAnalyzerQuasarResult
- (BOOL)isValidResult;
- (CSSyncKeywordAnalyzerQuasarResult)initWithConfidence:(double)a3;
- (CSSyncKeywordAnalyzerQuasarResult)initWithDefaultConfidence;
- (double)triggerConfidence;
- (id)description;
- (void)setIsValidResult:(BOOL)a3;
- (void)setTriggerConfidence:(double)a3;
@end

@implementation CSSyncKeywordAnalyzerQuasarResult

- (void)setIsValidResult:(BOOL)a3
{
  self->_isValidResult = a3;
}

- (BOOL)isValidResult
{
  return self->_isValidResult;
}

- (double)triggerConfidence
{
  return self->_triggerConfidence;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"triggerConfidence = %lf", *(void *)&self->_triggerConfidence);
}

- (void)setTriggerConfidence:(double)a3
{
  self->_triggerConfidence = a3;
  self->_isValidResult = 1;
}

- (CSSyncKeywordAnalyzerQuasarResult)initWithConfidence:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSSyncKeywordAnalyzerQuasarResult;
  result = [(CSSyncKeywordAnalyzerQuasarResult *)&v5 init];
  if (result)
  {
    result->_triggerConfidence = a3;
    result->_isValidResult = 1;
  }
  return result;
}

- (CSSyncKeywordAnalyzerQuasarResult)initWithDefaultConfidence
{
  v3.receiver = self;
  v3.super_class = (Class)CSSyncKeywordAnalyzerQuasarResult;
  result = [(CSSyncKeywordAnalyzerQuasarResult *)&v3 init];
  if (result)
  {
    result->_triggerConfidence = -1000.0;
    result->_isValidResult = 0;
  }
  return result;
}

@end