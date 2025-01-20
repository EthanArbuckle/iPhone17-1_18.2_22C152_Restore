@interface NSNumber(CARenderValue)
- CA_copyRenderValue;
- (uint64_t)CA_copyNumericValue:()CARenderValue;
- (uint64_t)CA_numericValueCount;
@end

@implementation NSNumber(CARenderValue)

- (uint64_t)CA_numericValueCount
{
  return 1;
}

- (uint64_t)CA_copyNumericValue:()CARenderValue
{
  [a1 doubleValue];
  *a3 = v4;
  return 1;
}

- CA_copyRenderValue
{
  uint64_t v1;
  const double *v2;
  void v4[2];

  v4[1] = *MEMORY[0x1E4F143B8];
  [a1 doubleValue];
  v4[0] = v1;
  return CA::Render::Vector::new_vector((CA::Render::Vector *)1, v4, v2);
}

@end