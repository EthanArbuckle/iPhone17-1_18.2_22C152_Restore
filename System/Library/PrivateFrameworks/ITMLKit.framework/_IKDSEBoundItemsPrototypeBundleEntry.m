@interface _IKDSEBoundItemsPrototypeBundleEntry
- (_NSRange)range;
- (unint64_t)prototypeIndex;
- (void)setPrototypeIndex:(unint64_t)a3;
- (void)setRange:(_NSRange)a3;
@end

@implementation _IKDSEBoundItemsPrototypeBundleEntry

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (unint64_t)prototypeIndex
{
  return self->_prototypeIndex;
}

- (void)setPrototypeIndex:(unint64_t)a3
{
  self->_prototypeIndex = a3;
}

@end