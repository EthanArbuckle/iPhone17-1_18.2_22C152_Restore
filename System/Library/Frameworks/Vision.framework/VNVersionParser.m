@interface VNVersionParser
+ (BOOL)_isSeparatedString:(id)a3 equalToString:(id)a4 atIndex:(unint64_t)a5 usingSeparator:(id)a6;
+ (BOOL)isMajorVersion:(id)a3 equalToMajorVersion:(id)a4;
+ (BOOL)isMinorVersion:(id)a3 equalToMinorVersion:(id)a4;
@end

@implementation VNVersionParser

+ (BOOL)isMinorVersion:(id)a3 equalToMinorVersion:(id)a4
{
  return [a1 _isSeparatedString:a3 equalToString:a4 atIndex:1 usingSeparator:@"."];
}

+ (BOOL)isMajorVersion:(id)a3 equalToMajorVersion:(id)a4
{
  return [a1 _isSeparatedString:a3 equalToString:a4 atIndex:0 usingSeparator:@"."];
}

+ (BOOL)_isSeparatedString:(id)a3 equalToString:(id)a4 atIndex:(unint64_t)a5 usingSeparator:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  char v12 = 0;
  if (v9 && v10)
  {
    if ([v9 isEqualToString:v10])
    {
      v13 = [v9 componentsSeparatedByString:v11];
      v14 = [v10 componentsSeparatedByString:v11];
      unint64_t v15 = [v13 count];
      char v12 = 0;
      if (v15 == [v14 count] && v15 >= a5 + 1)
      {
        v16 = [v13 objectAtIndexedSubscript:a5];
        v17 = [v13 objectAtIndexedSubscript:a5];
        char v12 = [v16 isEqualToString:v17];
      }
    }
    else
    {
      char v12 = 1;
    }
  }

  return v12;
}

@end