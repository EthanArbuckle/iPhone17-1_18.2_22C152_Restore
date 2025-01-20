@interface XREngineeringTypeBitpackedStructureEntry
- (NSString)type;
- (_NSRange)bitRange;
- (void)setBitRange:(_NSRange)a3;
- (void)setType:(id)a3;
@end

@implementation XREngineeringTypeBitpackedStructureEntry

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (_NSRange)bitRange
{
  NSUInteger length = self->_bitRange.length;
  NSUInteger location = self->_bitRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setBitRange:(_NSRange)a3
{
  self->_bitRange = a3;
}

- (void).cxx_destruct
{
}

@end