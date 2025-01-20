@interface NSString(AXUtilsExtensions)
- (BOOL)axContainsString:()AXUtilsExtensions options:;
- (BOOL)axIsGenericLanguageCode;
- (id)axCapitalizeFirstLetter;
- (id)axLanguageCode;
- (id)axRegionCode;
- (uint64_t)axContainsString:()AXUtilsExtensions;
- (uint64_t)axIsLanguageCode;
- (uint64_t)axIsRegionalLanguageCode;
@end

@implementation NSString(AXUtilsExtensions)

- (BOOL)axContainsString:()AXUtilsExtensions options:
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = a4 & 1;
    id v8 = a1;
    id v9 = v6;
    if ((a4 & 2) != 0)
    {
      v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      v11 = [v8 componentsSeparatedByCharactersInSet:v10];
      uint64_t v12 = [v11 componentsJoinedByString:&stru_1EDF601D0];

      v13 = [v9 componentsSeparatedByCharactersInSet:v10];
      uint64_t v14 = [v13 componentsJoinedByString:&stru_1EDF601D0];

      id v8 = (id)v12;
      id v9 = (id)v14;
    }
    BOOL v15 = [v8 rangeOfString:v9 options:v7] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (uint64_t)axContainsString:()AXUtilsExtensions
{
  return [a1 axContainsString:a3 options:0];
}

- (uint64_t)axIsLanguageCode
{
  if ([a1 axIsGenericLanguageCode]) {
    return 1;
  }
  return [a1 axIsRegionalLanguageCode];
}

- (BOOL)axIsGenericLanguageCode
{
  v2 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  v3 = [v2 invertedSet];

  if ([a1 rangeOfCharacterFromSet:v3] == 0x7FFFFFFFFFFFFFFFLL) {
    BOOL v4 = [a1 length] == 2 || objc_msgSend(a1, "length") == 3;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (uint64_t)axIsRegionalLanguageCode
{
  v1 = [a1 componentsSeparatedByString:@"-"];
  if ([v1 count] == 2)
  {
    v2 = [v1 objectAtIndexedSubscript:0];
    v3 = [v1 objectAtIndexedSubscript:1];
    if ([v2 axIsGenericLanguageCode]) {
      uint64_t v4 = [v3 axIsGenericLanguageCode];
    }
    else {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)axLanguageCode
{
  if ([a1 axIsGenericLanguageCode])
  {
    id v2 = a1;
  }
  else if ([a1 axIsRegionalLanguageCode])
  {
    v3 = [a1 componentsSeparatedByString:@"-"];
    id v2 = [v3 firstObject];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)axRegionCode
{
  if ([a1 axIsRegionalLanguageCode])
  {
    id v2 = [a1 componentsSeparatedByString:@"-"];
    v3 = [v2 lastObject];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)axCapitalizeFirstLetter
{
  if ([a1 length])
  {
    id v2 = [a1 substringToIndex:1];
    v3 = [a1 substringFromIndex:1];
    uint64_t v4 = [v2 uppercaseString];
    id v5 = [v4 stringByAppendingString:v3];
  }
  else
  {
    id v5 = a1;
  }
  return v5;
}

@end