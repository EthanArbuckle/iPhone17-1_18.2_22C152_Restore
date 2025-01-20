@interface GEOAddressObject(RTExtensions)
- (uint64_t)initWithCurrentLocaleFullThoroughfare:()RTExtensions subLocality:locality:subAdministrativeArea:administrativeArea:postalCode:country:countryCode:;
- (uint64_t)initWithFullThoroughfare:()RTExtensions subLocality:locality:subAdministrativeArea:administrativeArea:postalCode:country:countryCode:language:countryLocale:phoneticLocale:;
@end

@implementation GEOAddressObject(RTExtensions)

- (uint64_t)initWithFullThoroughfare:()RTExtensions subLocality:locality:subAdministrativeArea:administrativeArea:postalCode:country:countryCode:language:countryLocale:phoneticLocale:
{
  v18 = (void *)MEMORY[0x1E4F1CA60];
  id v33 = a13;
  id v32 = a12;
  id v31 = a11;
  id v19 = a10;
  id v20 = a9;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  id v25 = a4;
  id v26 = a3;
  v27 = [v18 dictionary];
  [v27 setObject:v26 forKeyedSubscript:@"Street"];

  [v27 setObject:v25 forKeyedSubscript:@"SubLocality"];
  [v27 setObject:v24 forKeyedSubscript:@"City"];

  [v27 setObject:v23 forKeyedSubscript:@"SubAdministrativeArea"];
  [v27 setObject:v22 forKeyedSubscript:@"State"];

  [v27 setObject:v21 forKeyedSubscript:@"ZIP"];
  [v27 setObject:v20 forKeyedSubscript:@"Country"];

  [v27 setObject:v19 forKeyedSubscript:@"CountryCode"];
  uint64_t v28 = [a1 initWithContactAddressDictionary:v27 language:v31 country:v32 phoneticLocale:v33];

  return v28;
}

- (uint64_t)initWithCurrentLocaleFullThoroughfare:()RTExtensions subLocality:locality:subAdministrativeArea:administrativeArea:postalCode:country:countryCode:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v33 = a4;
  id v32 = a5;
  id v31 = a6;
  id v30 = a7;
  id v29 = a8;
  v17 = a9;
  id v18 = a10;
  id v19 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v20 = [v19 firstObject];

  id v21 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  id v22 = [v21 objectForKey:*MEMORY[0x1E4F1C400]];

  if (!v22)
  {
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v25 = (objc_class *)objc_opt_class();
      id v26 = NSStringFromClass(v25);
      v27 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v36 = v26;
      __int16 v37 = 2112;
      v38 = v27;
      _os_log_error_impl(&dword_1A8FEF000, v23, OS_LOG_TYPE_ERROR, "%@, %@, [NSLocale currentLocale] failed for NSLocaleCountryCode", buf, 0x16u);
    }
    v17 = &stru_1EFF84648;
  }
  uint64_t v28 = [a1 initWithFullThoroughfare:v34 subLocality:v33 locality:v32 subAdministrativeArea:v31 administrativeArea:v30 postalCode:v29 country:v17 countryCode:v18 language:v20 countryLocale:v22 phoneticLocale:v20];

  return v28;
}

@end