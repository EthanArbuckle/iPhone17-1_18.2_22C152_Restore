@interface CNAutocompleteEntitlementVerifier
+ (BOOL)currentProcessHasBooleanEntitlement:(id)a3;
+ (BOOL)currentProcessHasCalendarEntitlement;
+ (BOOL)currentProcessHasContactsEntitlement;
+ (BOOL)currentProcessHasDuetEntitlement;
+ (BOOL)currentProcessHasNetworkClientEntitlement;
+ (BOOL)currentProcessHasRecentsEntitlement;
+ (BOOL)currentProcessHasStewieEntitlement;
+ (BOOL)currentProcessHasSuggestionsEntitlement;
@end

@implementation CNAutocompleteEntitlementVerifier

+ (BOOL)currentProcessHasSuggestionsEntitlement
{
  if ([a1 currentProcessHasBooleanEntitlement:@"com.apple.private.suggestions.contacts"]) {
    return 1;
  }
  return [a1 currentProcessHasBooleanEntitlement:@"com.apple.private.suggestions"];
}

+ (BOOL)currentProcessHasRecentsEntitlement
{
  return [a1 currentProcessHasBooleanEntitlement:@"com.apple.private.corerecents"];
}

+ (BOOL)currentProcessHasStewieEntitlement
{
  return 1;
}

+ (BOOL)currentProcessHasDuetEntitlement
{
  int v3 = [a1 currentProcessHasBooleanEntitlement:@"com.apple.coreduetd.allow"];
  if (v3)
  {
    LOBYTE(v3) = [a1 currentProcessHasBooleanEntitlement:@"com.apple.coreduetd.people"];
  }
  return v3;
}

+ (BOOL)currentProcessHasContactsEntitlement
{
  v2 = [MEMORY[0x1E4F5A350] sharedInstance];
  char v3 = [v2 isAccessGranted];

  return v3;
}

+ (BOOL)currentProcessHasCalendarEntitlement
{
  return [(objc_class *)getEKEventStoreClass() authorizationStatusForEntityType:0] == 3;
}

+ (BOOL)currentProcessHasNetworkClientEntitlement
{
  return [a1 currentProcessHasBooleanEntitlement:@"com.apple.security.network.client"];
}

+ (BOOL)currentProcessHasBooleanEntitlement:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F5A3D8];
  id v4 = a3;
  v5 = [v3 currentEnvironment];
  v6 = [v5 entitlementVerifier];
  id v10 = 0;
  char v7 = [v6 currentProcessHasBooleanEntitlement:v4 error:&v10];

  id v8 = v10;
  if (v8) {
    NSLog(&cfstr_ErrorCheckingE.isa, v8);
  }

  return v7;
}

@end