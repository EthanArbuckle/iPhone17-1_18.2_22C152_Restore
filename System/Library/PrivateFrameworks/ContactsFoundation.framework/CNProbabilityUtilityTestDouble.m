@interface CNProbabilityUtilityTestDouble
- (BOOL)expectedResult;
- (CNProbabilityUtilityTestDouble)init;
- (CNProbabilityUtilityTestDouble)initWithExpectedResult:(BOOL)a3;
- (void)setExpectedResult:(BOOL)a3;
@end

@implementation CNProbabilityUtilityTestDouble

- (CNProbabilityUtilityTestDouble)init
{
  return [(CNProbabilityUtilityTestDouble *)self initWithExpectedResult:0];
}

- (CNProbabilityUtilityTestDouble)initWithExpectedResult:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNProbabilityUtilityTestDouble;
  v4 = [(CNProbabilityUtilityTestDouble *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_expectedResult = a3;
    v6 = v4;
  }

  return v5;
}

- (BOOL)expectedResult
{
  return self->_expectedResult;
}

- (void)setExpectedResult:(BOOL)a3
{
  self->_expectedResult = a3;
}

@end