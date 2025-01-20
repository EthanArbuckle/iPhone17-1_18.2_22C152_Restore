@interface LAKeyIdentifier
+ (id)_identifierWithSuffix:(uint64_t)a1;
+ (id)defaultAccessKeyIdentifierForRightWithIdentifier:(id)a3;
+ (id)defaultSecretIdentifierForRightWithIdentifier:(id)a3;
+ (id)domainForRightWithIdentifier:(id)a3;
+ (uint64_t)_identifierHasCorrectFormat:(uint64_t)a1;
@end

@implementation LAKeyIdentifier

+ (id)defaultAccessKeyIdentifierForRightWithIdentifier:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@:akey", a3];
  v5 = +[LAKeyIdentifier _identifierWithSuffix:]((uint64_t)a1, v4);

  return v5;
}

+ (id)_identifierWithSuffix:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v4 = [v2 stringByTrimmingCharactersInSet:v3];
  uint64_t v5 = [v4 length];

  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Identifier cannot be empty"];
  }
  v6 = [NSString stringWithFormat:@"com.apple.LocalAuthentication:Authorization:%@", v2];

  return v6;
}

+ (id)defaultSecretIdentifierForRightWithIdentifier:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@:genp", a3];
  uint64_t v5 = +[LAKeyIdentifier _identifierWithSuffix:]((uint64_t)a1, v4);

  return v5;
}

+ (id)domainForRightWithIdentifier:(id)a3
{
  return +[LAKeyIdentifier _identifierWithSuffix:]((uint64_t)a1, a3);
}

+ (uint64_t)_identifierHasCorrectFormat:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v4 = [v2 stringByTrimmingCharactersInSet:v3];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = [v2 componentsSeparatedByString:@":"];
    if ((unint64_t)[v6 count] >= 3
      && ([v6 objectAtIndexedSubscript:0],
          v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v7 isEqualToString:@"com.apple.LocalAuthentication"],
          v7,
          v8))
    {
      v9 = [v6 objectAtIndexedSubscript:1];
      uint64_t v10 = [v9 isEqualToString:@"Authorization"];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

@end