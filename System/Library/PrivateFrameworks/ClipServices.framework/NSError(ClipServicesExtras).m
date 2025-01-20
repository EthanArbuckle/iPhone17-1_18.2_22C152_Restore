@interface NSError(ClipServicesExtras)
+ (id)cps_errorWithCode:()ClipServicesExtras;
+ (id)cps_errorWithCode:()ClipServicesExtras underlyingError:;
- (BOOL)cps_isUserCanceledError;
- (id)cps_privacyPreservingDescription;
@end

@implementation NSError(ClipServicesExtras)

- (id)cps_privacyPreservingDescription
{
  v2 = NSString;
  v3 = [a1 domain];
  v4 = [v2 stringWithFormat:@"(NSError: domain: %@, code: %ld)", v3, objc_msgSend(a1, "code")];

  return v4;
}

- (BOOL)cps_isUserCanceledError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:@"CPSErrorDomain"]) {
    BOOL v3 = [a1 code] == 8;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

+ (id)cps_errorWithCode:()ClipServicesExtras
{
  v9[1] = *MEMORY[0x263EF8340];
  if (a3 == 19)
  {
    uint64_t v8 = *MEMORY[0x263F08320];
    v4 = _CPSLocalizedString(@"The Internet connection appears to be offline.", &_CPSLocalizableStringsBundleOnceToken, &_CPSLocalizableStringsBundle);
    v9[0] = v4;
    v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    v5 = 0;
  }
  v6 = [MEMORY[0x263F087E8] errorWithDomain:@"CPSErrorDomain" code:a3 userInfo:v5];

  return v6;
}

+ (id)cps_errorWithCode:()ClipServicesExtras underlyingError:
{
  v12[1] = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = *MEMORY[0x263F08608];
  v12[0] = a4;
  v6 = NSDictionary;
  id v7 = a4;
  uint64_t v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = [v5 errorWithDomain:@"CPSErrorDomain" code:a3 userInfo:v8];

  return v9;
}

@end