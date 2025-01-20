@interface CNPhoneNumberHelper
+ (BOOL)isStringPhoneNumber:(id)a3;
+ (NSString)currentCountryCode;
+ (NSString)homeCountryCode;
+ (id)countryCodeForNumber:(id)a3;
+ (id)defaultCountryCode;
+ (id)internationalizedFormattedNumber:(id)a3 countryCode:(id)a4;
+ (id)internationalizedUnformattedNumber:(id)a3 countryCode:(id)a4;
+ (id)lastFourDigitsForNumber:(id)a3;
+ (id)makePhoneNumberRegex;
+ (void)makePhoneNumberRegex;
@end

@implementation CNPhoneNumberHelper

+ (BOOL)isStringPhoneNumber:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CNPhoneNumberHelper_isStringPhoneNumber___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isStringPhoneNumber__cn_once_token_1 != -1) {
    dispatch_once(&isStringPhoneNumber__cn_once_token_1, block);
  }
  if (isStringPhoneNumber__cn_once_object_1)
  {
    id v5 = (id)isStringPhoneNumber__cn_once_object_1;
    uint64_t v6 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", v4, 4, 0, objc_msgSend(v4, "length"));

    BOOL v7 = v6 == 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)lastFourDigitsForNumber:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [a1 countryCodeForNumber:v4];
    FourDigitsOfLocalNumber = (void *)_PNCopyLastFourDigitsOfLocalNumber();
  }
  else
  {
    FourDigitsOfLocalNumber = 0;
  }

  return FourDigitsOfLocalNumber;
}

+ (id)countryCodeForNumber:(id)a3
{
  id v4 = (void *)PNCopyBestGuessCountryCodeForNumber();
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v4))
  {
    id v5 = [a1 defaultCountryCode];
  }
  else
  {
    id v5 = v4;
  }
  uint64_t v6 = v5;

  return v6;
}

+ (id)defaultCountryCode
{
  v2 = [a1 homeCountryCode];
  if (!v2)
  {
    v3 = +[CNEnvironmentBase currentEnvironment];
    id v4 = [v3 currentLocale];
    id v5 = [v4 objectForKey:*MEMORY[0x1E4F1C400]];
    uint64_t v6 = [v5 lowercaseString];

    if (v6) {
      v2 = (__CFString *)v6;
    }
    else {
      v2 = @"us";
    }
  }

  return v2;
}

uint64_t __43__CNPhoneNumberHelper_isStringPhoneNumber___block_invoke(uint64_t a1)
{
  isStringPhoneNumber__cn_once_object_1 = [*(id *)(a1 + 32) makePhoneNumberRegex];

  return MEMORY[0x1F41817F8]();
}

+ (id)makePhoneNumberRegex
{
  id v12 = 0;
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28FD8]), "initWithPattern:options:error:", @"^[\u202D\u202A]?[\\s.\"'/\\-,;\\[\\]<>()+[:Nd:]a-zA-Z*#-]{3,100}+[\u202C]?$",
                 1,
                 &v12);
  id v3 = v12;
  if (!v2)
  {
    id v4 = +[CNLogging sdkBreakageLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[CNPhoneNumberHelper makePhoneNumberRegex];
    }
  }

  return v2;
}

+ (NSString)homeCountryCode
{
  v2 = +[CNEnvironmentBase currentEnvironment];
  id v3 = [v2 homeCountryCode];

  return (NSString *)v3;
}

+ (NSString)currentCountryCode
{
  v2 = +[CNEnvironmentBase currentEnvironment];
  id v3 = [v2 currentCountryCode];

  return (NSString *)v3;
}

+ (id)internationalizedFormattedNumber:(id)a3 countryCode:(id)a4
{
  id v4 = a4;
  uint64_t v5 = (const char *)PNCopyBestGuessNormalizedNumberForCountry();
  if (!v5)
  {
    String = 0;
    goto LABEL_8;
  }
  CFStringRef v6 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v5, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E4F1CF90]);
  uint64_t v7 = (const void *)CFPhoneNumberCreate();
  String = (void *)CFPhoneNumberCreateString();
  if (String)
  {
    if (!v7) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  String = (void *)CFPhoneNumberCreateString();
  if (v7) {
LABEL_4:
  }
    CFRelease(v7);
LABEL_5:
  if (v6) {
    CFRelease(v6);
  }
LABEL_8:

  return String;
}

+ (id)internationalizedUnformattedNumber:(id)a3 countryCode:(id)a4
{
  id v4 = a4;
  uint64_t v5 = (const char *)PNCopyBestGuessNormalizedNumberForCountry();
  if (!v5)
  {
    String = 0;
    goto LABEL_8;
  }
  CFStringRef v6 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v5, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E4F1CF90]);
  uint64_t v7 = (const void *)CFPhoneNumberCreate();
  String = (void *)CFPhoneNumberCreateString();
  if (String)
  {
    if (!v7) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  String = (void *)CFPhoneNumberCreateString();
  if (v7) {
LABEL_4:
  }
    CFRelease(v7);
LABEL_5:
  if (v6) {
    CFRelease(v6);
  }
LABEL_8:

  return String;
}

+ (void)makePhoneNumberRegex
{
}

@end