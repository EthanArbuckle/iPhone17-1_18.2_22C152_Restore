@interface _HKCFGDoubleTerminal
- (BOOL)_scanValue:(id *)a3 withScanner:(id)a4;
- (id)_label;
- (id)characterSet;
- (id)condition;
- (unint64_t)_minimumLength;
- (void)setCondition:(id)a3;
@end

@implementation _HKCFGDoubleTerminal

- (BOOL)_scanValue:(id *)a3 withScanner:(id)a4
{
  double v9 = 0.0;
  int v6 = [a4 scanDouble:&v9];
  if (v6)
  {
    condition = (uint64_t (**)(double))self->_condition;
    if (!condition || (int v6 = condition[2](v9)) != 0)
    {
      *a3 = [NSNumber numberWithDouble:v9];
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (id)_label
{
  return @"<d>";
}

- (unint64_t)_minimumLength
{
  return 1;
}

- (id)characterSet
{
  v2 = [MEMORY[0x1E4F28E58] decimalDigitCharacterSet];
  [v2 addCharactersInString:@"+-."];

  return v2;
}

- (id)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
}

- (void).cxx_destruct
{
}

@end