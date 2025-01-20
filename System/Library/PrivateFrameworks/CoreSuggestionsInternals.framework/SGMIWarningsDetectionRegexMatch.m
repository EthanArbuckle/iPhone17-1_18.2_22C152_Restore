@interface SGMIWarningsDetectionRegexMatch
- (NSArray)wildcardsMatches;
- (NSString)signature;
- (SGMIWarningsDetectionRegexMatch)initWithRange:(_NSRange)a3 coreRange:(_NSRange)a4 signature:(id)a5 wildcardsMatches:(id)a6;
- (_NSRange)coreRange;
- (_NSRange)range;
- (unint64_t)length;
- (unint64_t)location;
@end

@implementation SGMIWarningsDetectionRegexMatch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wildcardsMatches, 0);
  objc_storeStrong((id *)&self->_signature, 0);
}

- (NSArray)wildcardsMatches
{
  return self->_wildcardsMatches;
}

- (NSString)signature
{
  return self->_signature;
}

- (_NSRange)coreRange
{
  NSUInteger length = self->_coreRange.length;
  NSUInteger location = self->_coreRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (unint64_t)length
{
  return self->_range.length;
}

- (unint64_t)location
{
  return self->_range.location;
}

- (SGMIWarningsDetectionRegexMatch)initWithRange:(_NSRange)a3 coreRange:(_NSRange)a4 signature:(id)a5 wildcardsMatches:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v10 = a3.length;
  NSUInteger v11 = a3.location;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SGMIWarningsDetectionRegexMatch;
  v15 = [(SGMIWarningsDetectionRegexMatch *)&v18 init];
  v16 = v15;
  if (v15)
  {
    v15->_range.NSUInteger location = v11;
    v15->_range.NSUInteger length = v10;
    v15->_coreRange.NSUInteger location = location;
    v15->_coreRange.NSUInteger length = length;
    objc_storeStrong((id *)&v15->_signature, a5);
    objc_storeStrong((id *)&v16->_wildcardsMatches, a6);
  }

  return v16;
}

@end