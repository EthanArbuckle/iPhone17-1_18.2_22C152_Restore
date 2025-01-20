@interface AKUsernameFormatter
+ (BOOL)_isPhoneNumber:(id)a3;
+ (id)formattedUsernameFromUsername:(id)a3;
@end

@implementation AKUsernameFormatter

+ (id)formattedUsernameFromUsername:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = v4;
    if (AAAFoundationSwiftLibraryCore()) {
      getAAFPhoneNumberFormatterClass();
    }
    v6 = objc_opt_new();
    v7 = [v6 normalizedFormatFor:v5];
    if ([a1 _isPhoneNumber:v7])
    {
      v8 = [@"+" stringByAppendingString:v7];
      uint64_t v9 = [v6 displayFormatFor:v8];

      id v5 = (id)v9;
    }
    if (v5)
    {
      v10 = [v5 stringByReplacingOccurrencesOfString:@" " withString:@" "];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)_isPhoneNumber:(id)a3
{
  id v3 = a3;
  [v3 rangeOfString:@"^[0-9]*$" options:1024];
  uint64_t v5 = v4;
  uint64_t v6 = [v3 length];

  return v5 == v6;
}

@end