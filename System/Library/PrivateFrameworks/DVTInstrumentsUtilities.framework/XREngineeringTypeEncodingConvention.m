@interface XREngineeringTypeEncodingConvention
- (XREngineeringTypeEncodingConvention)init;
- (int)sentinel;
- (int64_t)bitWidth;
- (void)setBitWidth:(int64_t)a3;
- (void)setSentinel:(int)a3;
@end

@implementation XREngineeringTypeEncodingConvention

- (XREngineeringTypeEncodingConvention)init
{
  v3.receiver = self;
  v3.super_class = (Class)XREngineeringTypeEncodingConvention;
  result = [(XREngineeringTypeEncodingConvention *)&v3 init];
  if (result) {
    result->_bitWidth = -1;
  }
  return result;
}

- (int)sentinel
{
  return self->_sentinel;
}

- (void)setSentinel:(int)a3
{
  self->_sentinel = a3;
}

- (int64_t)bitWidth
{
  return self->_bitWidth;
}

- (void)setBitWidth:(int64_t)a3
{
  self->_bitWidth = a3;
}

@end