@interface ENUIRouter
+ (unint64_t)routeForAnalyticsConsent:(id)a3;
+ (unint64_t)routeForExposure:(id)a3;
+ (unint64_t)routeForNKDPath:(id)a3;
+ (unint64_t)routeForOnboarding:(id)a3;
+ (unint64_t)routeForOnboardingDeepLink:(id)a3;
+ (unint64_t)routeForPath:(id)a3;
+ (unint64_t)routeForPreAuthorize:(id)a3;
+ (unint64_t)routeForRegion:(id)a3;
@end

@implementation ENUIRouter

+ (unint64_t)routeForPath:(id)a3
{
  return (unint64_t)[a1 routeForNKDPath:a3];
}

+ (unint64_t)routeForNKDPath:(id)a3
{
  v4 = [a3 pathComponents];
  v5 = [v4 firstObject];
  if ([v5 isEqualToString:@"ONBOARDING"])
  {
    id v6 = [a1 routeForOnboarding:v4];
LABEL_11:
    unint64_t v7 = (unint64_t)v6;
    goto LABEL_12;
  }
  if ([v5 isEqualToString:@"ONBOARDING-DEEPLINK"])
  {
    id v6 = [a1 routeForOnboardingDeepLink:v4];
    goto LABEL_11;
  }
  if ([v5 isEqualToString:@"ANALYTICS-CONSENT"])
  {
    id v6 = [a1 routeForAnalyticsConsent:v4];
    goto LABEL_11;
  }
  if ([v5 isEqualToString:@"EXPOSURE"])
  {
    id v6 = [a1 routeForExposure:v4];
    goto LABEL_11;
  }
  if ([v5 isEqualToString:@"REGION"])
  {
    id v6 = [a1 routeForRegion:v4];
    goto LABEL_11;
  }
  if ([v5 hasPrefix:@"TEST-VERIFICATION"])
  {
    unint64_t v7 = 5;
  }
  else if ([v5 isEqualToString:@"AUTHORIZE"])
  {
    unint64_t v7 = 6;
  }
  else if ([v5 isEqualToString:@"KEY-RELEASED"])
  {
    unint64_t v7 = 7;
  }
  else if ([v5 isEqualToString:@"REPORT"])
  {
    unint64_t v7 = 8;
  }
  else
  {
    unint64_t v7 = 9;
  }
LABEL_12:

  return v7;
}

+ (unint64_t)routeForPreAuthorize:(id)a3
{
  if ([a3 count] == (char *)&dword_0 + 1) {
    return 6;
  }
  else {
    return 9;
  }
}

+ (unint64_t)routeForOnboarding:(id)a3
{
  if ([a3 count] == (char *)&dword_0 + 2) {
    return 0;
  }
  else {
    return 9;
  }
}

+ (unint64_t)routeForOnboardingDeepLink:(id)a3
{
  id v3 = a3;
  if ([v3 count] == (char *)&dword_0 + 1)
  {
    unint64_t v4 = 1;
  }
  else if ([v3 count] == (char *)&dword_0 + 2)
  {
    unint64_t v4 = 1;
  }
  else
  {
    unint64_t v4 = 9;
  }

  return v4;
}

+ (unint64_t)routeForAnalyticsConsent:(id)a3
{
  unint64_t result = (unint64_t)[a3 count];
  if (result != 2) {
    return 9;
  }
  return result;
}

+ (unint64_t)routeForExposure:(id)a3
{
  unint64_t result = (unint64_t)[a3 count];
  if (result != 3) {
    return 9;
  }
  return result;
}

+ (unint64_t)routeForRegion:(id)a3
{
  if ([a3 count] == (char *)&dword_0 + 3) {
    return 4;
  }
  else {
    return 9;
  }
}

@end