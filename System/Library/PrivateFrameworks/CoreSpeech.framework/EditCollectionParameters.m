@interface EditCollectionParameters
- (BOOL)caseInsensitive;
- (BOOL)punctuationInsensitive;
- (BOOL)skipClassification;
- (EditCollectionParameters)initWithDistanceThreshold:(unint64_t)a3 uttLengthThreshold:(unint64_t)a4 punctuationInsensitive:(BOOL)a5 caseInsensitive:(BOOL)a6 skipClassification:(BOOL)a7 nbestAlignmentSourceBound:(unint64_t)a8 nbestAlignmentTargetBound:(unint64_t)a9;
- (id)description;
- (unint64_t)distanceThreshold;
- (unint64_t)nbestAlignmentSourceBound;
- (unint64_t)nbestAlignmentTargetBound;
- (unint64_t)uttLengthThreshold;
@end

@implementation EditCollectionParameters

- (unint64_t)nbestAlignmentTargetBound
{
  return self->_nbestAlignmentTargetBound;
}

- (unint64_t)nbestAlignmentSourceBound
{
  return self->_nbestAlignmentSourceBound;
}

- (BOOL)skipClassification
{
  return self->_skipClassification;
}

- (BOOL)caseInsensitive
{
  return self->_caseInsensitive;
}

- (BOOL)punctuationInsensitive
{
  return self->_punctuationInsensitive;
}

- (unint64_t)uttLengthThreshold
{
  return self->_uttLengthThreshold;
}

- (unint64_t)distanceThreshold
{
  return self->_distanceThreshold;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)EditCollectionParameters;
  uint64_t v3 = [(EditCollectionParameters *)&v10 description];
  v4 = (void *)v3;
  CFStringRef v5 = @"YES";
  if (self->_punctuationInsensitive) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  if (self->_caseInsensitive) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  if (!self->_skipClassification) {
    CFStringRef v5 = @"NO";
  }
  v8 = +[NSString stringWithFormat:@"%@, distanceThreshold=%lu, uttLengthThreshold=%lu, punctuationInsensitive=%@, caseInsensitive=%@, skipClassification=%@", v3, self->_distanceThreshold, self->_uttLengthThreshold, v6, v7, v5];

  return v8;
}

- (EditCollectionParameters)initWithDistanceThreshold:(unint64_t)a3 uttLengthThreshold:(unint64_t)a4 punctuationInsensitive:(BOOL)a5 caseInsensitive:(BOOL)a6 skipClassification:(BOOL)a7 nbestAlignmentSourceBound:(unint64_t)a8 nbestAlignmentTargetBound:(unint64_t)a9
{
  v16.receiver = self;
  v16.super_class = (Class)EditCollectionParameters;
  result = [(EditCollectionParameters *)&v16 init];
  if (result)
  {
    result->_distanceThreshold = a3;
    result->_uttLengthThreshold = a4;
    result->_punctuationInsensitive = a5;
    result->_caseInsensitive = a6;
    result->_skipClassification = a7;
    result->_nbestAlignmentSourceBound = a8;
    result->_nbestAlignmentTargetBound = a9;
  }
  return result;
}

@end