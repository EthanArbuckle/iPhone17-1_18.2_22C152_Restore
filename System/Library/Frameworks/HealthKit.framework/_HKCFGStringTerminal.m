@interface _HKCFGStringTerminal
- (BOOL)_scanValue:(id *)a3 withScanner:(id)a4;
- (BOOL)caseSensitive;
- (NSString)string;
- (id)_label;
- (id)characterSet;
- (unint64_t)_minimumLength;
- (void)setCaseSensitive:(BOOL)a3;
- (void)setString:(id)a3;
@end

@implementation _HKCFGStringTerminal

- (BOOL)_scanValue:(id *)a3 withScanner:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [v6 caseSensitive];
  [v6 setCaseSensitive:*((unsigned __int8 *)&self->super.super._isPrivate + 1)];
  uint64_t v8 = *(void *)&self->_caseSensitive;
  id v13 = 0;
  int v9 = [v6 scanString:v8 intoString:&v13];
  id v10 = v13;
  v11 = v10;
  if (v9) {
    *a3 = v10;
  }
  [v6 setCaseSensitive:v7];

  return v9;
}

- (id)_label
{
  return *(id *)&self->_caseSensitive;
}

- (unint64_t)_minimumLength
{
  return [*(id *)&self->_caseSensitive length];
}

- (id)characterSet
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E58]);
  v4 = v3;
  if (*(&self->super.super._isPrivate + 1))
  {
    [v3 addCharactersInString:*(void *)&self->_caseSensitive];
  }
  else
  {
    v5 = [*(id *)&self->_caseSensitive lowercaseString];
    [v4 addCharactersInString:v5];

    id v6 = [*(id *)&self->_caseSensitive uppercaseString];
    [v4 addCharactersInString:v6];
  }

  return v4;
}

- (NSString)string
{
  return *(NSString **)&self->_caseSensitive;
}

- (void)setString:(id)a3
{
}

- (BOOL)caseSensitive
{
  return *(&self->super.super._isPrivate + 1);
}

- (void)setCaseSensitive:(BOOL)a3
{
  *(&self->super.super._isPrivate + 1) = a3;
}

- (void).cxx_destruct
{
}

@end