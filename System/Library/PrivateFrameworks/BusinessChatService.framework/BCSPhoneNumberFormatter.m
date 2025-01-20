@interface BCSPhoneNumberFormatter
+ (id)_countryCode;
+ (id)formattedPhoneNumberForPhoneNumber:(id)a3;
@end

@implementation BCSPhoneNumberFormatter

+ (id)formattedPhoneNumberForPhoneNumber:(id)a3
{
  id v4 = a3;
  v5 = [a1 _countryCode];
  uint64_t v6 = PNCreateFormattedStringWithCountry();
  v7 = (void *)v6;
  if (v6) {
    v8 = (void *)v6;
  }
  else {
    v8 = v4;
  }
  id v9 = v8;

  v10 = [MEMORY[0x263F08708] controlCharacterSet];
  v11 = [v9 stringByTrimmingCharactersInSet:v10];

  return v11;
}

+ (id)_countryCode
{
  v2 = TUNetworkCountryCode();
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    TUHomeCountryCode();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

@end