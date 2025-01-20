@interface CFNCanLogSensitiveContent
@end

@implementation CFNCanLogSensitiveContent

void ____CFNCanLogSensitiveContent_block_invoke()
{
  if (__CFNIsInDevelopmentEnvironment::onceToken != -1) {
    dispatch_once(&__CFNIsInDevelopmentEnvironment::onceToken, &__block_literal_global_30);
  }
  if (__CFNIsInDevelopmentEnvironment::ok) {
    BOOL v0 = 1;
  }
  else {
    BOOL v0 = CFPreferencesAppValueIsForced(@"AppleCFNetworkDiagnosticLogging", @"Apple Global Domain") != 0;
  }
  __CFNCanLogSensitiveContent::ok = v0;
}

@end