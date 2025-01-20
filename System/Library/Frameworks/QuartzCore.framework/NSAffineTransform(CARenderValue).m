@interface NSAffineTransform(CARenderValue)
- CA_copyRenderValue;
- (uint64_t)CA_copyNumericValue:()CARenderValue;
- (uint64_t)CA_numericValueCount;
@end

@implementation NSAffineTransform(CARenderValue)

- (uint64_t)CA_copyNumericValue:()CARenderValue
{
  long long v4 = 0uLL;
  if (a1)
  {
    [a1 transformStruct];
    long long v4 = 0uLL;
    long long v5 = 0uLL;
    long long v6 = 0uLL;
  }
  else
  {
    long long v5 = 0uLL;
    long long v6 = 0uLL;
  }
  *a3 = v4;
  a3[1] = v5;
  a3[2] = v6;
  return 6;
}

- (uint64_t)CA_numericValueCount
{
  return 6;
}

- CA_copyRenderValue
{
  long long v3;
  long long v4;
  long long v5;
  long long v7;
  long long v8;
  long long v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 transformStruct];
    v3 = v7;
    long long v4 = v8;
    long long v5 = v9;
  }
  else
  {
    v3 = 0uLL;
    long long v4 = 0uLL;
    long long v5 = 0uLL;
  }
  v7 = v3;
  v8 = v4;
  v9 = v5;
  return CA::Render::Vector::new_vector((CA::Render::Vector *)6, &v7, a3);
}

@end