@interface FMSystemVersionNumber
- (FMSystemVersionNumber)init;
- (FMSystemVersionNumber)initWithString:(id)a3;
- (NSString)baseLetter;
- (NSString)suffix;
- (id)debugDescription;
- (id)description;
- (int64_t)baseNumber;
- (int64_t)buildNumber;
- (int64_t)compare:(id)a3;
- (void)setBaseLetter:(id)a3;
- (void)setBaseNumber:(int64_t)a3;
- (void)setBuildNumber:(int64_t)a3;
- (void)setSuffix:(id)a3;
@end

@implementation FMSystemVersionNumber

- (FMSystemVersionNumber)init
{
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Use initWithString:"];
  return [(FMSystemVersionNumber *)self initWithString:&stru_1F27057B0];
}

- (FMSystemVersionNumber)initWithString:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FMSystemVersionNumber;
  v5 = [(FMSystemVersionNumber *)&v17 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28FE8] scannerWithString:v4];
    if ([v6 scanInteger:&v5->_baseNumber])
    {
      v7 = [MEMORY[0x1E4F28B88] uppercaseLetterCharacterSet];
      id v16 = 0;
      [v6 scanCharactersFromSet:v7 intoString:&v16];
      v8 = (NSString *)v16;

      baseLetter = v5->_baseLetter;
      v5->_baseLetter = v8;

      if ([v6 scanInteger:&v5->_buildNumber])
      {
        v10 = [MEMORY[0x1E4F28B88] lowercaseLetterCharacterSet];
        id v15 = 0;
        [v6 scanCharactersFromSet:v10 intoString:&v15];
        v11 = (NSString *)v15;

        suffix = v5->_suffix;
        v5->_suffix = v11;
        v13 = v11;
      }
    }
  }
  return v5;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"<%@ %p [%@]>", objc_opt_class(), self, self];
}

- (id)description
{
  v3 = [(FMSystemVersionNumber *)self suffix];

  id v4 = NSString;
  int64_t baseNumber = self->_baseNumber;
  if (v3)
  {
    v6 = [(FMSystemVersionNumber *)self baseLetter];
    int64_t buildNumber = self->_buildNumber;
    v8 = [(FMSystemVersionNumber *)self suffix];
    v9 = [v4 stringWithFormat:@"%lu%@%lu%@", baseNumber, v6, buildNumber, v8];
  }
  else
  {
    v9 = [NSString stringWithFormat:@"%lu%@%lu", baseNumber, self->_baseLetter, self->_buildNumber];
  }
  return v9;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FMSystemVersionNumber *)self baseNumber];
  if (v5 < [v4 baseNumber])
  {
LABEL_2:
    int64_t v6 = -1;
    goto LABEL_6;
  }
  uint64_t v7 = [(FMSystemVersionNumber *)self baseNumber];
  if (v7 > [v4 baseNumber]) {
    goto LABEL_4;
  }
  v8 = [(FMSystemVersionNumber *)self baseLetter];
  v9 = [v4 baseLetter];
  int64_t v6 = [v8 compare:v9];

  if (v6) {
    goto LABEL_6;
  }
  uint64_t v11 = [(FMSystemVersionNumber *)self buildNumber];
  if (v11 < [v4 buildNumber]) {
    goto LABEL_2;
  }
  uint64_t v12 = [(FMSystemVersionNumber *)self buildNumber];
  if (v12 > [v4 buildNumber])
  {
LABEL_4:
    int64_t v6 = 1;
    goto LABEL_6;
  }
  v13 = [(FMSystemVersionNumber *)self suffix];
  uint64_t v14 = [v4 suffix];
  if (!v13) {
    v13 = &stru_1F27057B0;
  }
  if (v14) {
    id v15 = (__CFString *)v14;
  }
  else {
    id v15 = &stru_1F27057B0;
  }
  int64_t v6 = [(__CFString *)v13 compare:v15];

LABEL_6:
  return v6;
}

- (int64_t)baseNumber
{
  return self->_baseNumber;
}

- (void)setBaseNumber:(int64_t)a3
{
  self->_int64_t baseNumber = a3;
}

- (NSString)baseLetter
{
  return self->_baseLetter;
}

- (void)setBaseLetter:(id)a3
{
}

- (int64_t)buildNumber
{
  return self->_buildNumber;
}

- (void)setBuildNumber:(int64_t)a3
{
  self->_int64_t buildNumber = a3;
}

- (NSString)suffix
{
  return self->_suffix;
}

- (void)setSuffix:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_baseLetter, 0);
}

@end