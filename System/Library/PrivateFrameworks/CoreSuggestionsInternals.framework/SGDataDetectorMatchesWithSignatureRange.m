@interface SGDataDetectorMatchesWithSignatureRange
- (NSArray)matches;
- (_NSRange)signatureRange;
- (void)setMatches:(id)a3;
- (void)setSignatureRange:(_NSRange)a3;
@end

@implementation SGDataDetectorMatchesWithSignatureRange

- (void).cxx_destruct
{
}

- (void)setSignatureRange:(_NSRange)a3
{
  self->_signatureRange = a3;
}

- (_NSRange)signatureRange
{
  NSUInteger length = self->_signatureRange.length;
  NSUInteger location = self->_signatureRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setMatches:(id)a3
{
}

- (NSArray)matches
{
  return self->_matches;
}

@end