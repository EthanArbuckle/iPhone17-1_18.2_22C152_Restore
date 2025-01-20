@interface MIORangeAsValue
+ (id)valueWithMIORange:(_MIORange)a3;
- (_MIORange)MIORangeValue;
- (const)objCType;
- (void)getValue:(void *)a3;
@end

@implementation MIORangeAsValue

+ (id)valueWithMIORange:(_MIORange)a3
{
  int64_t upperBound = a3.upperBound;
  int64_t lowerBound = a3.lowerBound;
  v5 = (void *)[objc_allocWithZone((Class)a1) init];
  v5[1] = lowerBound;
  v5[2] = upperBound;
  return v5;
}

- (_MIORange)MIORangeValue
{
  p_range = &self->_range;
  int64_t lowerBound = self->_range.lowerBound;
  int64_t upperBound = p_range->upperBound;
  result.int64_t upperBound = upperBound;
  result.int64_t lowerBound = lowerBound;
  return result;
}

- (void)getValue:(void *)a3
{
  *(_MIORange *)a3 = self->_range;
}

- (const)objCType
{
  return "{_MIORange=qq}";
}

@end