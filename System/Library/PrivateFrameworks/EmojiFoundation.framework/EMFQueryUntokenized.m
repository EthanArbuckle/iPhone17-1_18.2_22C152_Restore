@interface EMFQueryUntokenized
- (BOOL)hasMultipleConstituentTokens;
- (id)tokens;
@end

@implementation EMFQueryUntokenized

- (id)tokens
{
  v3 = [(EMFQuery *)self queryString];
  v4 = [(EMFQuery *)self locale];
  v5 = _createNormalizedString(v3, v4);

  v6 = [MEMORY[0x1E4F1C978] arrayWithObject:v5];
  v10.receiver = self;
  v10.super_class = (Class)EMFQueryUntokenized;
  [(EMFQuery *)&v10 setTokens:v6];
  v9.receiver = self;
  v9.super_class = (Class)EMFQueryUntokenized;
  v7 = [(EMFQuery *)&v9 tokens];

  return v7;
}

- (BOOL)hasMultipleConstituentTokens
{
  v5.receiver = self;
  v5.super_class = (Class)EMFQueryUntokenized;
  v2 = [(EMFQuery *)&v5 tokens];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

@end