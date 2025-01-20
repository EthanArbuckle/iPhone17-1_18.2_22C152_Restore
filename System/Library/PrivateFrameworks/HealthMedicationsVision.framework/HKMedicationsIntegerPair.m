@interface HKMedicationsIntegerPair
- (int64_t)first;
- (int64_t)second;
- (void)setFirst:(int64_t)a3;
- (void)setSecond:(int64_t)a3;
@end

@implementation HKMedicationsIntegerPair

- (int64_t)first
{
  return self->_first;
}

- (void)setFirst:(int64_t)a3
{
  self->_first = a3;
}

- (int64_t)second
{
  return self->_second;
}

- (void)setSecond:(int64_t)a3
{
  self->_second = a3;
}

@end