@interface CUIKPhoneNumberDescriptionGenerator
+ (id)normalizedPhoneNumber:(id)a3;
+ (id)sharedGenerator;
- (id)formattedStringForPhoneNumber:(id)a3;
- (id)formattedStringForTelURL:(id)a3;
@end

@implementation CUIKPhoneNumberDescriptionGenerator

+ (id)sharedGenerator
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CUIKPhoneNumberDescriptionGenerator_sharedGenerator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedGenerator_onceToken != -1) {
    dispatch_once(&sharedGenerator_onceToken, block);
  }
  v2 = (void *)sharedGenerator___sharedInstance;

  return v2;
}

void __54__CUIKPhoneNumberDescriptionGenerator_sharedGenerator__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedGenerator___sharedInstance;
  sharedGenerator___sharedInstance = (uint64_t)v1;
}

- (id)formattedStringForPhoneNumber:(id)a3
{
  id v3 = a3;
  v4 = [(id)EKWeakLinkClass() defaultCountryCode];
  id v5 = v3;
  v6 = (uint64_t (*)(void, id, void *))EKWeakLinkSymbol();
  uint64_t v7 = v6(0, v5, v4);
  v8 = v5;
  if (v7)
  {
    v9 = (const void *)v7;
    v10 = (void (*)(void, const void *, uint64_t))EKWeakLinkSymbol();
    v8 = v10(0, v9, 5);

    CFRelease(v9);
  }

  return v8;
}

- (id)formattedStringForTelURL:(id)a3
{
  v4 = [a3 resourceSpecifier];
  id v5 = [v4 componentsSeparatedByString:@"?"];
  v6 = [v5 firstObject];

  uint64_t v7 = [v6 lastPathComponent];
  v8 = [v7 stringByRemovingPercentEncoding];

  v9 = [(CUIKPhoneNumberDescriptionGenerator *)self formattedStringForPhoneNumber:v8];

  return v9;
}

+ (id)normalizedPhoneNumber:(id)a3
{
  id v3 = a3;
  v4 = (void *)PNCopyBestGuessCountryCodeForNumber();
  if (!v4)
  {
    id v5 = [MEMORY[0x1E4F1CA20] currentLocale];
    v6 = [v5 objectForKey:*MEMORY[0x1E4F1C400]];
    v4 = [v6 lowercaseString];
  }
  uint64_t v7 = (const char *)PNCopyBestGuessNormalizedNumberForCountry();
  v8 = (void *)[[NSString alloc] initWithBytesNoCopy:v7 length:strlen(v7) encoding:4 freeWhenDone:1];
  v9 = (const void *)CFPhoneNumberCreate();
  String = (void *)CFPhoneNumberCreateString();
  if (String)
  {
    if (!v9) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  String = (void *)CFPhoneNumberCreateString();
  if (v9) {
LABEL_5:
  }
    CFRelease(v9);
LABEL_6:

  return String;
}

@end