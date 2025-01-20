@interface CNAddressFormats
+ (id)addressFormatForCountryCode:(id)a3;
+ (id)addressFormats;
+ (id)countryCodeByGlobalDefaultsLookup;
+ (id)countryCodeByLocaleLookup;
+ (id)defaultKeyboardSettingsDictionary;
+ (id)fallbackCountryCode;
+ (id)makeSupportedCountries;
+ (id)supportedCountries;
+ (id)usaStateAbbreviations;
+ (id)usaStateNames;
@end

@implementation CNAddressFormats

+ (id)addressFormatForCountryCode:(id)a3
{
  id v4 = a3;
  v5 = [a1 addressFormats];
  v6 = [v5 objectForKey:v4];

  return v6;
}

+ (id)addressFormats
{
  return (id)[MEMORY[0x1E4F5A4A0] addressFormats];
}

+ (id)supportedCountries
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__CNAddressFormats_supportedCountries__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportedCountries_cn_once_token_0 != -1) {
    dispatch_once(&supportedCountries_cn_once_token_0, block);
  }
  v2 = (void *)supportedCountries_cn_once_object_0;

  return v2;
}

void __38__CNAddressFormats_supportedCountries__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) makeSupportedCountries];
  uint64_t v1 = [v3 copy];
  v2 = (void *)supportedCountries_cn_once_object_0;
  supportedCountries_cn_once_object_0 = v1;
}

+ (id)makeSupportedCountries
{
  v2 = [a1 addressFormats];
  id v3 = [v2 allKeys];
  id v4 = (void *)[v3 mutableCopy];

  [v4 removeObject:@"defaultKbdSettings"];
  [v4 removeObject:@"yu"];
  v5 = objc_msgSend(v4, "_cn_map:", &__block_literal_global_140);
  v6 = [v5 sortedArrayUsingComparator:CNCountryInformationISOCountryCodeAscendingComparator];

  return v6;
}

+ (id)defaultKeyboardSettingsDictionary
{
  v2 = [a1 addressFormats];
  id v3 = [v2 objectForKeyedSubscript:@"defaultKbdSettings"];

  return v3;
}

+ (id)countryCodeByLocaleLookup
{
  v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v3 = [v2 localeIdentifier];

  if (v3)
  {
    id v4 = [v3 componentsSeparatedByString:@"_"];
    if ((unint64_t)[v4 count] < 2)
    {
      v6 = 0;
    }
    else
    {
      v5 = [v4 objectAtIndex:1];
      v6 = [v5 lowercaseString];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)countryCodeByGlobalDefaultsLookup
{
  v2 = (void *)CFPreferencesCopyValue(@"Country", (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  id v3 = [v2 lowercaseString];

  return v3;
}

+ (id)fallbackCountryCode
{
  return @"us";
}

+ (id)usaStateNames
{
  if (usaStateNames_onceToken != -1) {
    dispatch_once(&usaStateNames_onceToken, &__block_literal_global_19_0);
  }
  v2 = (void *)usaStateNames_sStateNames;

  return v2;
}

uint64_t __33__CNAddressFormats_usaStateNames__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"Alabama", @"Alaska", @"Arizona", @"Arkansas", @"California", @"Colorado", @"Connecticut", @"Delaware", @"District of Columbia", @"Florida", @"Georgia", @"Hawaii", @"Idaho", @"Illinois", @"Indiana", @"Iowa", @"Kansas",
         @"Kentucky",
         @"Louisiana",
         @"Maine",
         @"Maryland",
         @"Massachusetts",
         @"Michigan",
         @"Minnesota",
         @"Mississippi",
         @"Missouri",
         @"Montana",
         @"Nebraska",
         @"Nevada",
         @"New Hampshire",
         @"New Jersey",
         @"New Mexico",
         @"New York",
         @"North Carolina",
         @"North Dakota",
         @"Ohio",
         @"Oklahoma",
         @"Oregon",
         @"Pennsylvania",
         @"Rhode Island",
         @"South Carolina",
         @"South Dakota",
         @"Tennessee",
         @"Texas",
         @"Utah",
         @"Vermont",
         @"Virginia",
         @"Washington",
         @"West Virginia",
         @"Wisconsin",
         @"Wyoming",
         0);
  uint64_t v1 = usaStateNames_sStateNames;
  usaStateNames_sStateNames = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)usaStateAbbreviations
{
  if (usaStateAbbreviations_onceToken != -1) {
    dispatch_once(&usaStateAbbreviations_onceToken, &__block_literal_global_175_1);
  }
  v2 = (void *)usaStateAbbreviations_sStateAbbreviations;

  return v2;
}

uint64_t __41__CNAddressFormats_usaStateAbbreviations__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"AL", @"AK", @"AZ", @"AR", @"CA", @"CO", @"CT", @"DE", @"DC", @"FL", @"GA", @"HI", @"ID", @"IL", @"IN", @"IA", @"KS",
         @"KY",
         @"LA",
         @"ME",
         @"MD",
         @"MA",
         @"MI",
         @"MN",
         @"MS",
         @"MO",
         @"MT",
         @"NE",
         @"NV",
         @"NH",
         @"NJ",
         @"NM",
         @"NY",
         @"NC",
         @"ND",
         @"OH",
         @"OK",
         @"OR",
         @"PA",
         @"RI",
         @"SC",
         @"SD",
         @"TN",
         @"TX",
         @"UT",
         @"VT",
         @"VI",
         @"WA",
         @"WV",
         @"WI",
         @"WY",
         0);
  uint64_t v1 = usaStateAbbreviations_sStateAbbreviations;
  usaStateAbbreviations_sStateAbbreviations = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end