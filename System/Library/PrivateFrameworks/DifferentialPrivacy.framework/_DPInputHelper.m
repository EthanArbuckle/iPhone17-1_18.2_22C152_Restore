@interface _DPInputHelper
- (NSNumberFormatter)fmt;
- (_DPInputHelper)init;
- (id)nonEmptyNonWhitespaceStringsFromFileAtPath:(id)a3;
- (id)nonEmptyStringsFromFileAtPath:(id)a3;
- (id)nonEmptyStringsFromFileAtPath:(id)a3 encoding:(unint64_t)a4;
- (id)nonEmptyStringsFromFileAtPath:(id)a3 separatedBy:(id)a4 encoding:(unint64_t)a5;
- (id)numberFromString:(id)a3;
- (id)numbersFromFileAtPath:(id)a3;
@end

@implementation _DPInputHelper

- (_DPInputHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)_DPInputHelper;
  v2 = [(_DPInputHelper *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    fmt = v2->_fmt;
    v2->_fmt = (NSNumberFormatter *)v3;

    [(NSNumberFormatter *)v2->_fmt setNumberStyle:1];
  }
  return v2;
}

- (id)nonEmptyStringsFromFileAtPath:(id)a3 separatedBy:(id)a4 encoding:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x1E019F810]();
  v10 = [NSString stringWithContentsOfFile:v7 encoding:a5 error:0];
  v11 = [v10 componentsSeparatedByCharactersInSet:v8];
  v12 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69___DPInputHelper_nonEmptyStringsFromFileAtPath_separatedBy_encoding___block_invoke;
  v15[3] = &unk_1E6C44638;
  id v13 = v12;
  id v16 = v13;
  [v11 enumerateObjectsUsingBlock:v15];

  return v13;
}

- (id)nonEmptyStringsFromFileAtPath:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28B88];
  id v5 = a3;
  objc_super v6 = [v4 newlineCharacterSet];
  id v7 = [(_DPInputHelper *)self nonEmptyStringsFromFileAtPath:v5 separatedBy:v6 encoding:4];

  return v7;
}

- (id)nonEmptyStringsFromFileAtPath:(id)a3 encoding:(unint64_t)a4
{
  objc_super v6 = (void *)MEMORY[0x1E4F28B88];
  id v7 = a3;
  id v8 = [v6 newlineCharacterSet];
  v9 = [(_DPInputHelper *)self nonEmptyStringsFromFileAtPath:v7 separatedBy:v8 encoding:a4];

  return v9;
}

- (id)nonEmptyNonWhitespaceStringsFromFileAtPath:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28B88];
  id v5 = a3;
  objc_super v6 = [v4 whitespaceAndNewlineCharacterSet];
  id v7 = [(_DPInputHelper *)self nonEmptyStringsFromFileAtPath:v5 separatedBy:v6 encoding:4];

  return v7;
}

- (id)numbersFromFileAtPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E019F810]();
  objc_super v6 = [(_DPInputHelper *)self nonEmptyNonWhitespaceStringsFromFileAtPath:v4];
  id v7 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40___DPInputHelper_numbersFromFileAtPath___block_invoke;
  v10[3] = &unk_1E6C44610;
  v10[4] = self;
  id v8 = v7;
  id v11 = v8;
  [v6 enumerateObjectsUsingBlock:v10];

  return v8;
}

- (id)numberFromString:(id)a3
{
  return [(NSNumberFormatter *)self->_fmt numberFromString:a3];
}

- (NSNumberFormatter)fmt
{
  return self->_fmt;
}

- (void).cxx_destruct
{
}

@end