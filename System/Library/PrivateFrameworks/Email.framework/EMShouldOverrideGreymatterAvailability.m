@interface EMShouldOverrideGreymatterAvailability
@end

@implementation EMShouldOverrideGreymatterAvailability

BOOL ___EMShouldOverrideGreymatterAvailability_block_invoke()
{
  BOOL result = (EFIsRunningUnitTests() & 1) != 0
        || +[EMInternalPreferences preferenceEnabled:58];
  _EMShouldOverrideGreymatterAvailability_overrideIsGreymatterAvailability = result;
  return result;
}

@end