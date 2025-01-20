@interface NSPort
- (BOOL)isValid;
- (NSUInteger)reservedSpaceLength;
@end

@implementation NSPort

- (BOOL)isValid
{
  return self->_valid;
}

- (NSUInteger)reservedSpaceLength
{
  return self->_reservedSpaceLength;
}

@end