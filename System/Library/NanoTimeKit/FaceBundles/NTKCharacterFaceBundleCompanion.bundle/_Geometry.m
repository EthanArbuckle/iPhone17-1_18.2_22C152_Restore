@interface _Geometry
- (unint64_t)mtlBufOffset;
- (void)setMtlBufOffset:(unint64_t)a3;
@end

@implementation _Geometry

- (unint64_t)mtlBufOffset
{
  return self->_mtlBufOffset;
}

- (void)setMtlBufOffset:(unint64_t)a3
{
  self->_mtlBufOffset = a3;
}

@end