@interface _HKCFGCharacterTerminal
- (BOOL)_scanValue:(id *)a3 withScanner:(id)a4;
- (NSCharacterSet)characterSet;
- (id)_label;
- (unint64_t)_minimumLength;
- (void)setCharacterSet:(id)a3;
@end

@implementation _HKCFGCharacterTerminal

- (BOOL)_scanValue:(id *)a3 withScanner:(id)a4
{
  id v6 = a4;
  v7 = [v6 charactersToBeSkipped];

  if (v7)
  {
    v8 = [v6 charactersToBeSkipped];
    [v6 setCharactersToBeSkipped:0];
    [v6 scanCharactersFromSet:v8 intoString:0];
    [v6 setCharactersToBeSkipped:v8];
  }
  if (([v6 isAtEnd] & 1) != 0
    || (uint64_t v9 = [v6 scanLocation],
        [v6 string],
        v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 characterAtIndex:v9],
        v10,
        ![(NSCharacterSet *)self->_characterSet characterIsMember:v11]))
  {
    BOOL v12 = 0;
  }
  else
  {
    [v6 setScanLocation:v9 + 1];
    objc_msgSend(NSString, "stringWithFormat:", @"%c", v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v12 = 1;
  }

  return v12;
}

- (id)_label
{
  return @"<c>";
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