@interface ABPhoneFormatting
+ (id)abCopyPhoneNumberFromString:(id)a3;
+ (id)abDefaultCountryCode;
+ (id)abNormalizedPhoneNumberFromString:(id)a3;
@end

@implementation ABPhoneFormatting

+ (id)abDefaultCountryCode
{
  id result = (id)CPPhoneNumberCopyHomeCountryCode();
  if (!result) {
    return @"us";
  }
  return result;
}

+ (id)abCopyPhoneNumberFromString:(id)a3
{
  if (!a3) {
    return 0;
  }
  [a1 abDefaultCountryCode];
  id result = (id)PNCreateFormattedStringWithCountry();
  if (!result)
  {
    return (id)[a3 copy];
  }
  return result;
}

+ (id)abNormalizedPhoneNumberFromString:(id)a3
{
  [a1 abDefaultCountryCode];
  uint64_t v4 = CFPhoneNumberCreate();
  if (v4)
  {
    v5 = (const void *)v4;
    id v6 = (id)CFPhoneNumberCreateString();
    CFRelease(v5);
    if (v6) {
      return v6;
    }
  }
  id v8 = a3;
  return v8;
}

@end