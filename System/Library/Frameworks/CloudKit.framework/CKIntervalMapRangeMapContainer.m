@interface CKIntervalMapRangeMapContainer
- (id).cxx_construct;
@end

@implementation CKIntervalMapRangeMapContainer

- (void).cxx_destruct
{
  p_rangeMap = &self->rangeMap;
  sub_18B06A0BC((void ***)&p_rangeMap);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end