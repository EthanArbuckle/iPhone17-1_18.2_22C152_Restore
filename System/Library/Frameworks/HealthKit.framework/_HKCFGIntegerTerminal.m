@interface _HKCFGIntegerTerminal
- (BOOL)_scanValue:(id *)a3 withScanner:(id)a4;
- (id)_label;
- (id)characterSet;
- (id)condition;
- (unint64_t)_minimumLength;
- (void)setCondition:(id)a3;
@end

@implementation _HKCFGIntegerTerminal

- (BOOL)_scanValue:(id *)a3 withScanner:(id)a4
{
  uint64_t v9 = 0;
  int v6 = [a4 scanInteger:&v9];
  if (v6)
  {
    condition = (uint64_t (**)(id, void))self->_condition;
    if (!condition || (int v6 = condition[2](condition, v9)) != 0)
    {
      *a3 = [NSNumber numberWithInteger:v9];
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (id)_label
{
  return @"<i>";
}

- (unint64_t)_minimumLength
{
  return 1;
}

- (id)characterSet
{
  v2 = [MEMORY[0x1E4F28E58] decimalDigitCharacterSet];
  [v2 addCharactersInString:@"+-"];

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