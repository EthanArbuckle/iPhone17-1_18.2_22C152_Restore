@interface _HKCFGCharacterSequenceTerminal
- (BOOL)_scanValue:(id *)a3 withScanner:(id)a4;
- (NSCharacterSet)characterSet;
- (id)_label;
- (unint64_t)_minimumLength;
- (void)setCharacterSet:(id)a3;
@end

@implementation _HKCFGCharacterSequenceTerminal

- (BOOL)_scanValue:(id *)a3 withScanner:(id)a4
{
  characterSet = self->_characterSet;
  id v10 = 0;
  int v6 = [a4 scanCharactersFromSet:characterSet intoString:&v10];
  id v7 = v10;
  v8 = v7;
  if (v6) {
    *a3 = v7;
  }

  return v6;
}

- (id)_label
{
  return @"<c+>";
}

- (unint64_t)_minimumLength
{
  return 1;
}

- (NSCharacterSet)characterSet
{
  return self->_characterSet;
}

- (void)setCharacterSet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end