@interface _EARLanguageDetectorResult
- (BOOL)isConfident;
- (NSDictionary)confidences;
- (void)setConfidences:(id)a3;
- (void)setIsConfident:(BOOL)a3;
@end

@implementation _EARLanguageDetectorResult

- (NSDictionary)confidences
{
  return self->_confidences;
}

- (void)setConfidences:(id)a3
{
}

- (BOOL)isConfident
{
  return self->_isConfident;
}

- (void)setIsConfident:(BOOL)a3
{
  self->_isConfident = a3;
}

- (void).cxx_destruct
{
}

@end